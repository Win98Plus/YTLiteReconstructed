//
// DiscordRPC.x
// Reconstructed from YTLite.dylib TU 1 (0x8000 .. 0xbff0)
// Discord Rich Presence hooks for YouTube Player & Overlay
//

#import "Headers/YTLite.h"

%hook YTPlayerViewController

- (void)playbackController:(id)controller didActivateVideo:(id)video withPlaybackData:(id)data {
    %orig;
    UIViewController *parentVC = [self valueForKey:@"parentViewController"];
    if ([parentVC isKindOfClass:%c(YTInlineMutedPlaybackWatchViewController)] ||
        [parentVC isKindOfClass:%c(YTShortsPlayerViewController)]) {
        return;
    }
    YTPDiscordRPC *rpc = [YTPDiscordRPC sharedPresence];
    RPCMedia *media = [RPCMedia mediaWithPlayer:self];
    [rpc setMedia:media];
    [[rpc media] setIsPaused:NO];
    [rpc startIfPossible];
}

- (void)seekToTime:(CGFloat)time {
    %orig;
    if (!YTLBool(@"discordRPC")) return;
    UIViewController *parentVC = [self valueForKey:@"parentViewController"];
    if ([parentVC isKindOfClass:%c(YTInlineMutedPlaybackWatchViewController)] ||
        [parentVC isKindOfClass:%c(YTShortsPlayerViewController)]) {
        return;
    }
    YTPDiscordRPC *rpc = [YTPDiscordRPC sharedPresence];
    [[rpc media] setCurrentTime:time];
    [rpc updateTime];
}

- (void)seekToTime:(CGFloat)time seekSource:(int)source {
    %orig;
    if (!YTLBool(@"discordRPC")) return;
    UIViewController *parentVC = [self valueForKey:@"parentViewController"];
    if ([parentVC isKindOfClass:%c(YTInlineMutedPlaybackWatchViewController)] ||
        [parentVC isKindOfClass:%c(YTShortsPlayerViewController)]) {
        return;
    }
    YTPDiscordRPC *rpc = [YTPDiscordRPC sharedPresence];
    [[rpc media] setCurrentTime:time];
    [rpc updateTime];
}

- (void)seekToTime:(CGFloat)time toleranceBefore:(CGFloat)before toleranceAfter:(CGFloat)after seekSource:(int)source {
    %orig;
    if (!YTLBool(@"discordRPC")) return;
    UIViewController *parentVC = [self valueForKey:@"parentViewController"];
    if ([parentVC isKindOfClass:%c(YTInlineMutedPlaybackWatchViewController)] ||
        [parentVC isKindOfClass:%c(YTShortsPlayerViewController)]) {
        return;
    }
    YTPDiscordRPC *rpc = [YTPDiscordRPC sharedPresence];
    [[rpc media] setCurrentTime:time];
    [rpc updateTime];
}

- (void)singleVideo:(id)video currentVideoTimeDidChange:(id)time {
    %orig;
    if (YTLBool(@"discordRPC")) {
        CGFloat currentTime = [[time valueForKey:@"time"] doubleValue];
        [[[YTPDiscordRPC sharedPresence] media] setCurrentTime:currentTime];
    }
}

- (void)potentiallyMutatedSingleVideo:(id)video currentVideoTimeDidChange:(id)time {
    %orig;
    if (YTLBool(@"discordRPC")) {
        CGFloat currentTime = [[time valueForKey:@"time"] doubleValue];
        [[[YTPDiscordRPC sharedPresence] media] setCurrentTime:currentTime];
    }
}

%end

%hook YTWatchPlaybackController

- (void)playbackControllerDidPlay {
    %orig;
    if (YTLBool(@"discordRPC")) {
        YTPDiscordRPC *rpc = [YTPDiscordRPC sharedPresence];
        [[rpc media] setIsPaused:NO];
        [rpc updateState];
    }
}

- (void)playbackControllerDidPause {
    %orig;
    if (YTLBool(@"discordRPC")) {
        YTPDiscordRPC *rpc = [YTPDiscordRPC sharedPresence];
        [[rpc media] setIsPaused:YES];
        [rpc updateState];
    }
}

- (void)playbackControllerDidFinishPlaybackAndWillTransitionInternallyToNextPlayback:(id)next {
    %orig;
    if (YTLBool(@"discordRPC")) {
        [[YTPDiscordRPC sharedPresence] clearPlayback];
    }
}

- (void)clearPlaybackController {
    %orig;
    if (YTLBool(@"discordRPC")) {
        [[YTPDiscordRPC sharedPresence] clearPlayback];
    }
}

%end

%hook YTMainAppControlsOverlayView

%new
- (void)handleYTLDiscordTap:(UIButton *)sender {
    BOOL enabled = !YTLBool(@"discordRPC");
    [[YTLUserDefaults standardUserDefaults] setBool:enabled forKey:@"discordRPC"];
    YTPDiscordRPC *rpc = [YTPDiscordRPC sharedPresence];
    if (enabled) {
        UIViewController *ancestorVC = [self _viewControllerForAncestor];
        id playerVC = [ancestorVC valueForKey:@"parentViewController"];
        RPCMedia *media = [RPCMedia mediaWithPlayer:playerVC];
        [rpc setMedia:media];
        [rpc startIfPossible];
    } else {
        [rpc clearPlayback];
    }
    [sender setImage:[YTPMedia adaptiveDiscord] forState:UIControlStateNormal];
}

%end
