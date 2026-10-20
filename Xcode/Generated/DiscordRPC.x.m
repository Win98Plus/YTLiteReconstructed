// Auto-generated from DiscordRPC.x by scripts/logos_to_objc.py
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#ifdef __cplusplus
extern "C" void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old);
#else
extern void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old);
#endif

//
// DiscordRPC.x
// Reconstructed from YTLite.dylib TU 1 (0x8000 .. 0xbff0)
// Discord Rich Presence hooks for YouTube Player & Overlay
//

#import "Headers/YTLite.h"


static void (*_logos_orig$DiscordRPC_YTPlayerViewController_1)(id self, SEL _cmd, id controller, id video, id data);
static void _logos_method$DiscordRPC_YTPlayerViewController_1(id self, SEL _cmd, id controller, id video, id data) {
    _logos_orig$DiscordRPC_YTPlayerViewController_1(self, _cmd, controller, video, data);
    UIViewController *parentVC = [self valueForKey:@"parentViewController"];
    if ([parentVC isKindOfClass:objc_getClass("YTInlineMutedPlaybackWatchViewController")] ||
        [parentVC isKindOfClass:objc_getClass("YTShortsPlayerViewController")]) {
        return;
    }
    YTPDiscordRPC *rpc = [YTPDiscordRPC sharedPresence];
    RPCMedia *media = [RPCMedia mediaWithPlayer:self];
    [rpc setMedia:media];
    [[rpc media] setIsPaused:NO];
    [rpc startIfPossible];

}

static void (*_logos_orig$DiscordRPC_YTPlayerViewController_2)(id self, SEL _cmd, CGFloat time);
static void _logos_method$DiscordRPC_YTPlayerViewController_2(id self, SEL _cmd, CGFloat time) {
    _logos_orig$DiscordRPC_YTPlayerViewController_2(self, _cmd, time);
    if (!YTLBool(@"discordRPC")) return;
    UIViewController *parentVC = [self valueForKey:@"parentViewController"];
    if ([parentVC isKindOfClass:objc_getClass("YTInlineMutedPlaybackWatchViewController")] ||
        [parentVC isKindOfClass:objc_getClass("YTShortsPlayerViewController")]) {
        return;
    }
    YTPDiscordRPC *rpc = [YTPDiscordRPC sharedPresence];
    [[rpc media] setCurrentTime:time];
    [rpc updateTime];

}

static void (*_logos_orig$DiscordRPC_YTPlayerViewController_3)(id self, SEL _cmd, CGFloat time, int source);
static void _logos_method$DiscordRPC_YTPlayerViewController_3(id self, SEL _cmd, CGFloat time, int source) {
    _logos_orig$DiscordRPC_YTPlayerViewController_3(self, _cmd, time, source);
    if (!YTLBool(@"discordRPC")) return;
    UIViewController *parentVC = [self valueForKey:@"parentViewController"];
    if ([parentVC isKindOfClass:objc_getClass("YTInlineMutedPlaybackWatchViewController")] ||
        [parentVC isKindOfClass:objc_getClass("YTShortsPlayerViewController")]) {
        return;
    }
    YTPDiscordRPC *rpc = [YTPDiscordRPC sharedPresence];
    [[rpc media] setCurrentTime:time];
    [rpc updateTime];

}

static void (*_logos_orig$DiscordRPC_YTPlayerViewController_4)(id self, SEL _cmd, CGFloat time, CGFloat before, CGFloat after, int source);
static void _logos_method$DiscordRPC_YTPlayerViewController_4(id self, SEL _cmd, CGFloat time, CGFloat before, CGFloat after, int source) {
    _logos_orig$DiscordRPC_YTPlayerViewController_4(self, _cmd, time, before, after, source);
    if (!YTLBool(@"discordRPC")) return;
    UIViewController *parentVC = [self valueForKey:@"parentViewController"];
    if ([parentVC isKindOfClass:objc_getClass("YTInlineMutedPlaybackWatchViewController")] ||
        [parentVC isKindOfClass:objc_getClass("YTShortsPlayerViewController")]) {
        return;
    }
    YTPDiscordRPC *rpc = [YTPDiscordRPC sharedPresence];
    [[rpc media] setCurrentTime:time];
    [rpc updateTime];

}

static void (*_logos_orig$DiscordRPC_YTPlayerViewController_5)(id self, SEL _cmd, id video, id time);
static void _logos_method$DiscordRPC_YTPlayerViewController_5(id self, SEL _cmd, id video, id time) {
    _logos_orig$DiscordRPC_YTPlayerViewController_5(self, _cmd, video, time);
    if (YTLBool(@"discordRPC")) {
        CGFloat currentTime = [[time valueForKey:@"time"] doubleValue];
        [[[YTPDiscordRPC sharedPresence] media] setCurrentTime:currentTime];
    }

}

static void (*_logos_orig$DiscordRPC_YTPlayerViewController_6)(id self, SEL _cmd, id video, id time);
static void _logos_method$DiscordRPC_YTPlayerViewController_6(id self, SEL _cmd, id video, id time) {
    _logos_orig$DiscordRPC_YTPlayerViewController_6(self, _cmd, video, time);
    if (YTLBool(@"discordRPC")) {
        CGFloat currentTime = [[time valueForKey:@"time"] doubleValue];
        [[[YTPDiscordRPC sharedPresence] media] setCurrentTime:currentTime];
    }

}



static void (*_logos_orig$DiscordRPC_YTWatchPlaybackController_7)(id self, SEL _cmd);
static void _logos_method$DiscordRPC_YTWatchPlaybackController_7(id self, SEL _cmd) {
    _logos_orig$DiscordRPC_YTWatchPlaybackController_7(self, _cmd);
    if (YTLBool(@"discordRPC")) {
        YTPDiscordRPC *rpc = [YTPDiscordRPC sharedPresence];
        [[rpc media] setIsPaused:NO];
        [rpc updateState];
    }

}

static void (*_logos_orig$DiscordRPC_YTWatchPlaybackController_8)(id self, SEL _cmd);
static void _logos_method$DiscordRPC_YTWatchPlaybackController_8(id self, SEL _cmd) {
    _logos_orig$DiscordRPC_YTWatchPlaybackController_8(self, _cmd);
    if (YTLBool(@"discordRPC")) {
        YTPDiscordRPC *rpc = [YTPDiscordRPC sharedPresence];
        [[rpc media] setIsPaused:YES];
        [rpc updateState];
    }

}

static void (*_logos_orig$DiscordRPC_YTWatchPlaybackController_9)(id self, SEL _cmd, id next);
static void _logos_method$DiscordRPC_YTWatchPlaybackController_9(id self, SEL _cmd, id next) {
    _logos_orig$DiscordRPC_YTWatchPlaybackController_9(self, _cmd, next);
    if (YTLBool(@"discordRPC")) {
        [[YTPDiscordRPC sharedPresence] clearPlayback];
    }

}

static void (*_logos_orig$DiscordRPC_YTWatchPlaybackController_10)(id self, SEL _cmd);
static void _logos_method$DiscordRPC_YTWatchPlaybackController_10(id self, SEL _cmd) {
    _logos_orig$DiscordRPC_YTWatchPlaybackController_10(self, _cmd);
    if (YTLBool(@"discordRPC")) {
        [[YTPDiscordRPC sharedPresence] clearPlayback];
    }

}



static void _logos_method$DiscordRPC_YTMainAppControlsOverlayView_11(id self, SEL _cmd, UIButton * sender) {
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


__attribute__((constructor)) static void _logosLocalInit_DiscordRPC(void) {
    MSHookMessageEx(objc_getClass("YTPlayerViewController"), @selector(playbackController:didActivateVideo:withPlaybackData:), (IMP)&_logos_method$DiscordRPC_YTPlayerViewController_1, (IMP *)&_logos_orig$DiscordRPC_YTPlayerViewController_1);
    MSHookMessageEx(objc_getClass("YTPlayerViewController"), @selector(seekToTime:), (IMP)&_logos_method$DiscordRPC_YTPlayerViewController_2, (IMP *)&_logos_orig$DiscordRPC_YTPlayerViewController_2);
    MSHookMessageEx(objc_getClass("YTPlayerViewController"), @selector(seekToTime:seekSource:), (IMP)&_logos_method$DiscordRPC_YTPlayerViewController_3, (IMP *)&_logos_orig$DiscordRPC_YTPlayerViewController_3);
    MSHookMessageEx(objc_getClass("YTPlayerViewController"), @selector(seekToTime:toleranceBefore:toleranceAfter:seekSource:), (IMP)&_logos_method$DiscordRPC_YTPlayerViewController_4, (IMP *)&_logos_orig$DiscordRPC_YTPlayerViewController_4);
    MSHookMessageEx(objc_getClass("YTPlayerViewController"), @selector(singleVideo:currentVideoTimeDidChange:), (IMP)&_logos_method$DiscordRPC_YTPlayerViewController_5, (IMP *)&_logos_orig$DiscordRPC_YTPlayerViewController_5);
    MSHookMessageEx(objc_getClass("YTPlayerViewController"), @selector(potentiallyMutatedSingleVideo:currentVideoTimeDidChange:), (IMP)&_logos_method$DiscordRPC_YTPlayerViewController_6, (IMP *)&_logos_orig$DiscordRPC_YTPlayerViewController_6);
    MSHookMessageEx(objc_getClass("YTWatchPlaybackController"), @selector(playbackControllerDidPlay), (IMP)&_logos_method$DiscordRPC_YTWatchPlaybackController_7, (IMP *)&_logos_orig$DiscordRPC_YTWatchPlaybackController_7);
    MSHookMessageEx(objc_getClass("YTWatchPlaybackController"), @selector(playbackControllerDidPause), (IMP)&_logos_method$DiscordRPC_YTWatchPlaybackController_8, (IMP *)&_logos_orig$DiscordRPC_YTWatchPlaybackController_8);
    MSHookMessageEx(objc_getClass("YTWatchPlaybackController"), @selector(playbackControllerDidFinishPlaybackAndWillTransitionInternallyToNextPlayback:), (IMP)&_logos_method$DiscordRPC_YTWatchPlaybackController_9, (IMP *)&_logos_orig$DiscordRPC_YTWatchPlaybackController_9);
    MSHookMessageEx(objc_getClass("YTWatchPlaybackController"), @selector(clearPlaybackController), (IMP)&_logos_method$DiscordRPC_YTWatchPlaybackController_10, (IMP *)&_logos_orig$DiscordRPC_YTWatchPlaybackController_10);
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(handleYTLDiscordTap:), (IMP)&_logos_method$DiscordRPC_YTMainAppControlsOverlayView_11, "@@:");
}
