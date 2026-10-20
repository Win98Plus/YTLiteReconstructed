//
// YTPDiscordRPC.m
// Reconstructed from YTLite.dylib Classes [40..41] (0x219f00 .. 0x21e400)
//

#import "../Headers/YTLite.h"

@implementation RPCMedia

+ (instancetype)mediaWithPlayer:(id)player {
    RPCMedia *m = [[self alloc] init];
    if (m && player) {
        id resp = [player valueForKey:@"playerResponse"];
        if ([resp respondsToSelector:@selector(contentPlayerResponse)]) {
            resp = [resp valueForKey:@"contentPlayerResponse"];
        }
        id details = [[resp valueForKey:@"playerData"] valueForKey:@"videoDetails"];
        m->_videoID = [[details valueForKey:@"videoId"] copy];
        m->_title = [[details valueForKey:@"title"] copy];
        m->_author = [[details valueForKey:@"author"] copy];
        m->_totalTime = [[player valueForKey:@"currentVideoTotalMediaTime"] doubleValue];
        m->_currentTime = [[player valueForKey:@"currentVideoMediaTime"] doubleValue];
        if (m->_videoID) {
            m->_thumbnailURL = [NSString stringWithFormat:@"https://i.ytimg.com/vi/%@/maxresdefault.jpg", m->_videoID];
        }
    }
    return m;
}

- (NSString *)title { return _title; }
- (void)setTitle:(NSString *)arg1 { _title = [arg1 copy]; }
- (NSString *)author { return _author; }
- (void)setAuthor:(NSString *)arg1 { _author = [arg1 copy]; }
- (NSString *)videoID { return _videoID; }
- (void)setVideoID:(NSString *)arg1 { _videoID = [arg1 copy]; }
- (NSString *)thumbnailURL { return _thumbnailURL; }
- (void)setThumbnailURL:(NSString *)arg1 { _thumbnailURL = [arg1 copy]; }
- (double)currentTime { return _currentTime; }
- (void)setCurrentTime:(double)arg1 { _currentTime = arg1; }
- (double)totalTime { return _totalTime; }
- (void)setTotalTime:(double)arg1 { _totalTime = arg1; }
- (BOOL)isPaused { return _isPaused; }
- (void)setIsPaused:(BOOL)arg1 { _isPaused = arg1; }

@end

@implementation YTPDiscordRPC

+ (instancetype)sharedPresence {
    static YTPDiscordRPC *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

+ (void)checkLocalNetworkPermission:(void (^)(BOOL))completion {
    if (completion) completion(YES);
}

- (void)setServerURL:(NSString *)address {
    if (!address.length) return;
    if (![address hasPrefix:@"http://"] && ![address hasPrefix:@"https://"]) {
        address = [@"http://" stringByAppendingString:address];
    }
    NSURLComponents *comps = [NSURLComponents componentsWithString:address];
    if (!comps.port) comps.port = @3000;
    if (!comps.path.length || [comps.path isEqualToString:@"/"]) {
        comps.path = @"/update";
    }
    _serverURL = comps.URL.absoluteString;
}

- (void)startIfPossible {
    if (!YTLBool(@"discordRPC")) return;
    NSString *addr = [[YTLUserDefaults standardUserDefaults] stringForKey:@"rpcAddress"];
    if (!addr.length) return;
    [self setServerURL:addr];
    [self startRPC];
}

- (void)startRPC {
    if (!_media.videoID.length) return;
    [self sendBody];
}

- (void)updateTime { [self sendBody]; }
- (void)updateState { [self sendBody]; }

- (void)clearPlayback {
    _media = nil;
    [self _send:@{@"state": @"stopped"}];
}

- (NSDictionary *)buildBody {
    if (!_media) return @{@"state": @"stopped"};
    return @{
        @"state": _media.isPaused ? @"paused" : @"playing",
        @"title": _media.title ?: @"",
        @"channel": _media.author ?: @"",
        @"video_id": _media.videoID ?: @"",
        @"thumbnail_url": _media.thumbnailURL ?: @"",
        @"current_time": @(_media.currentTime),
        @"total_time": @(_media.totalTime)
    };
}

- (void)sendBody {
    [self _send:[self buildBody]];
}

- (void)_send:(NSDictionary *)body {
    if (!_serverURL.length) return;
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_serverURL]];
    req.HTTPMethod = @"POST";
    req.timeoutInterval = 5.0;
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    req.HTTPBody = [NSJSONSerialization dataWithJSONObject:body options:0 error:nil];
    [[[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData *data, NSURLResponse *resp, NSError *err) {
        if (err) NSLog(@"DVN --- Error: %@", err.localizedDescription);
    }] resume];
}

- (void)showAlertWithMessage:(NSString *)msg showSettingsButton:(BOOL)showSettings {}
- (RPCMedia *)media { return _media; }
- (void)setMedia:(RPCMedia *)arg1 { _media = arg1; }
- (NSString *)serverURL { return _serverURL; }

@end
