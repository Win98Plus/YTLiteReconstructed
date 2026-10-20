//
// SponsorBlock.x
// Reconstructed from YTLite.dylib TU 5 (0x1ea10 .. 0x268dc)
// Built-in SponsorBlock playback hooks & progress bar segment markers
//

#import "Headers/YTLite.h"

%hook YTPlayerViewController

%property (nonatomic, retain) SBPlaybackController *sbPlaybackController;

- (void)playbackController:(id)controller didActivateVideo:(id)video withPlaybackData:(id)data {
    %orig;
    if (!YTLBool(@"sponsorBlock")) return;
    if ([[self valueForKey:@"isPlayingAd"] boolValue]) return;
    UIViewController *parentVC = [self valueForKey:@"parentViewController"];
    if (![parentVC isKindOfClass:%c(YTWatchViewController)] && !YTLBool(@"sbFeedPlayer")) {
        return;
    }
    SBPlaybackController *sbCtrl = [[SBPlaybackController alloc] initWithPlayer:self];
    [self setSbPlaybackController:sbCtrl];
}

- (void)singleVideo:(id)video currentVideoTimeDidChange:(id)time {
    %orig;
    if (YTLBool(@"sponsorBlock")) {
        [[self sbPlaybackController] skipSegmentIfNeeded];
        if (YTLBool(@"sbDurationLabel")) {
            [SBPlayerDecorator addDurationWithoutSegments:self videoController:video];
        }
    }
}

- (void)potentiallyMutatedSingleVideo:(id)video currentVideoTimeDidChange:(id)time {
    %orig;
    if (YTLBool(@"sponsorBlock")) {
        [[self sbPlaybackController] skipSegmentIfNeeded];
        if (YTLBool(@"sbDurationLabel")) {
            [SBPlayerDecorator addDurationWithoutSegments:self videoController:video];
        }
    }
}

%end

%hook YTInlinePlayerBarContainerView

%property (nonatomic, retain) NSString *sbTimeString;

- (void)setPeekableViewVisible:(BOOL)visible {
    %orig;
    if (YTLBool(@"sponsorBlock") && YTLBool(@"sbDurationLabel") && [self sbTimeString]) {
        UILabel *durationLabel = [self valueForKey:@"durationLabel"];
        NSString *suffix = [NSString stringWithFormat:@" (%@)", [self sbTimeString]];
        if (durationLabel.text && ![durationLabel.text containsString:suffix]) {
            durationLabel.text = [durationLabel.text stringByAppendingString:suffix];
            [durationLabel sizeToFit];
        }
    }
}

%end

%hook YTPlayerBarRectangleDecorationView

- (void)applyGradientColorForRect:(CGRect)rect withOverallGradient:(id)gradient {
    %orig;
    [SBPlayerDecorator drawSegmentsDecorationView:self];
}

- (void)drawProgressRect:(CGRect)rect withColor:(UIColor *)color {
    %orig;
    [SBPlayerDecorator drawSegmentsDecorationView:self];
}

- (BOOL)isStateActive {
    BOOL active = %orig;
    [SBPlayerDecorator drawSegmentsDecorationView:self];
    return active;
}

%end

%hook YTPlayerBarProgressDecorationView

- (void)applyGradientForRect:(CGRect)rect {
    %orig;
    [SBPlayerDecorator drawSegmentsDecorationView:self];
}

- (void)drawProgressRect:(CGRect)rect withColor:(UIColor *)color {
    %orig;
    [SBPlayerDecorator drawSegmentsDecorationView:self];
}

- (BOOL)isStateActive {
    BOOL active = %orig;
    [SBPlayerDecorator drawSegmentsDecorationView:self];
    return active;
}

%end

%hook YTProgressView

- (void)setProgress:(CGFloat)progress {
    %orig;
    if (YTLBool(@"sponsorBlock") && YTLBool(@"sbMiniPlayer")) {
        UIViewController *ancestor = [self _viewControllerForAncestor];
        if ([ancestor isKindOfClass:%c(YTWatchMiniBarViewController)] ||
            [ancestor isKindOfClass:%c(YTWatchFloatingMiniplayerViewController)]) {
            id playerVC = [ancestor valueForKey:@"_playerViewController"];
            [SBPlayerDecorator drawSegments:self layer:self.layer playerVC:playerVC];
        }
    }
}

%end

%hook YTInlineMutedPlaybackScrubberView

- (void)setMediaTime:(CGFloat)time {
    %orig;
    if (YTLBool(@"sponsorBlock") && YTLBool(@"sbFeedPlayer")) {
        UIViewController *ancestor = [self _viewControllerForAncestor];
        id parentVC = [ancestor valueForKey:@"parentViewController"];
        id playerVC = [parentVC valueForKey:@"parentResponder"];
        [SBPlayerDecorator drawSegments:self layer:self.layer playerVC:playerVC];
    }
}

- (void)addGradient {
    %orig;
}

%end
