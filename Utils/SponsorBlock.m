//
// SponsorBlock.m
// Reconstructed from YTLite.dylib Classes [12..16] (0x193f00 .. 0x1a2b00)
//

#import "../Headers/YTLite.h"

@implementation SBSegment

+ (instancetype)segmentWithDictionary:(NSDictionary *)dict {
    SBSegment *seg = [[self alloc] init];
    if (seg && [dict isKindOfClass:[NSDictionary class]]) {
        seg->_category = [dict[@"category"] copy];
        seg->_uuid = [dict[@"UUID"] copy];
        NSArray *segmentArr = dict[@"segment"];
        if ([segmentArr isKindOfClass:[NSArray class]] && segmentArr.count >= 2) {
            seg->_start = [segmentArr[0] doubleValue];
            seg->_end = [segmentArr[1] doubleValue];
        }
    }
    return seg;
}

- (NSString *)category { return _category; }
- (void)setCategory:(NSString *)arg1 { _category = [arg1 copy]; }
- (NSString *)actionType { return _actionType; }
- (void)setActionType:(NSString *)arg1 { _actionType = [arg1 copy]; }
- (NSString *)uuid { return _uuid; }
- (void)setUuid:(NSString *)arg1 { _uuid = [arg1 copy]; }
- (double)start { return _start; }
- (void)setStart:(double)arg1 { _start = arg1; }
- (double)end { return _end; }
- (void)setEnd:(double)arg1 { _end = arg1; }
- (double)videoDuration { return _videoDuration; }
- (void)setVideoDuration:(double)arg1 { _videoDuration = arg1; }
- (NSInteger)votes { return _votes; }
- (void)setVotes:(NSInteger)arg1 { _votes = arg1; }
- (BOOL)locked { return _locked; }
- (void)setLocked:(BOOL)arg1 { _locked = arg1; }
- (NSString *)descriptionText { return _descriptionText; }
- (void)setDescriptionText:(NSString *)arg1 { _descriptionText = [arg1 copy]; }

@end

@implementation SBManager

+ (instancetype)sharedManager {
    static SBManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSArray *cats = @[@"sponsor", @"intro", @"outro", @"interaction", @"selfpromo", @"music_offtopic", @"preview", @"filler", @"poi_highlight"];
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:cats options:0 error:nil];
        NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        _categoriesQuery = [jsonStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        _segments = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)getSegmentsForID:(NSString *)videoID {
    if (videoID.length == 0) return;
    @synchronized (self) {
        if (_segments[videoID]) return;
    }
    NSString *urlStr = [NSString stringWithFormat:@"https://sponsor.ajay.app/api/skipSegments?videoID=%@&categories=%@", videoID, _categoriesQuery];
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [[[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error || !data) {
            NSLog(@"YTP --- Error fetching segments: %@", error);
            return;
        }
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if (![json isKindOfClass:[NSArray class]]) {
            return;
        }
        NSMutableArray *parsed = [NSMutableArray array];
        for (NSDictionary *item in (NSArray *)json) {
            SBSegment *seg = [SBSegment segmentWithDictionary:item];
            if (seg) [parsed addObject:seg];
        }
        @synchronized (self) {
            _segments[videoID] = [parsed copy];
        }
    }] resume];
}

- (NSMutableDictionary *)segments { return _segments; }
- (void)setSegments:(NSMutableDictionary *)arg1 { _segments = arg1; }

@end

@implementation SBPlaybackController

- (instancetype)initWithPlayer:(YTPlayerViewController *)player {
    self = [super init];
    if (self) {
        _playerViewController = player;
        _skippedSegments = [NSMutableSet set];
        [self requestSbSegments];
    }
    return self;
}

- (void)requestSbSegments {
    NSString *videoID = [_playerViewController valueForKey:@"contentVideoID"];
    if (videoID.length > 0) {
        [[SBManager sharedManager] getSegmentsForID:videoID];
    }
}

- (BOOL)shouldCheckSponsorBlock {
    if (!YTLBool(@"sponsorBlock")) return NO;
    NSString *videoID = [_playerViewController valueForKey:@"contentVideoID"];
    return videoID.length > 0;
}

- (void)skipSegmentIfNeeded {
    if (![self shouldCheckSponsorBlock]) return;
    NSString *videoID = [_playerViewController valueForKey:@"contentVideoID"];
    NSArray<SBSegment *> *segs = [[SBManager sharedManager] segments][videoID];
    if (!segs.count) return;
    double curTime = [[_playerViewController valueForKey:@"currentVideoMediaTime"] doubleValue];
    for (SBSegment *seg in segs) {
        if ([_skippedSegments containsObject:seg.uuid]) continue;
        if (curTime >= seg.start && curTime < seg.end - 0.5) {
            if ([self segmentMeetsMinimumDuration:seg]) {
                [self handleSkipSegment:seg];
                break;
            }
        }
    }
}

- (BOOL)segmentMeetsMinimumDuration:(SBSegment *)seg {
    if ([seg.category isEqualToString:@"poi_highlight"]) return YES;
    float minDur = YTLFloat(@"sbSkipDuration");
    return (seg.end - seg.start) >= minDur;
}

- (void)handleSkipSegment:(SBSegment *)seg {
    NSInteger mode = YTLInt([NSString stringWithFormat:@"sb_%@", seg.category]);
    if (mode == 1) {
        [_skippedSegments addObject:seg.uuid];
        double curTime = [[_playerViewController valueForKey:@"currentVideoMediaTime"] doubleValue];
        [self seekToTime:seg.end forSegment:seg undoTime:curTime attempts:0];
    } else if (mode == 2) {
        [_skippedSegments addObject:seg.uuid];
        [self showSkipPromptToast:seg timeBeforeSkip:0 target:seg.end];
    }
}

- (void)handleHighlightSegment:(SBSegment *)seg {
    [_skippedSegments addObject:seg.uuid];
}

- (void)seekToTime:(double)time forSegment:(SBSegment *)seg undoTime:(double)undoTime attempts:(int)attempts {
    [_playerViewController seekToTime:time];
    [self playSkipAudioIfNeeded];
    [self showSkippedToast:seg undoTime:undoTime];
}

- (void)showSkippedToast:(SBSegment *)seg undoTime:(double)undoTime {}
- (void)showSkipPromptToast:(SBSegment *)seg timeBeforeSkip:(double)delay target:(double)target {}

- (void)playSkipAudioIfNeeded {
    if (YTLBool(@"sbAudio")) {
        [[AudioManager sharedInstance] playAudio];
    }
}

- (YTPlayerViewController *)playerViewController { return _playerViewController; }
- (void)setPlayerViewController:(YTPlayerViewController *)arg1 { _playerViewController = arg1; }

@end
