// Auto-generated from SponsorBlock.x by scripts/logos_to_objc.py
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#ifdef __cplusplus
extern "C" void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old);
#else
extern void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old);
#endif

//
// SponsorBlock.x
// Reconstructed from YTLite.dylib TU 5 (0x1ea10 .. 0x268dc)
// Built-in SponsorBlock playback hooks & progress bar segment markers
//

#import "Headers/YTLite.h"


static char _logos_prop_key$SponsorBlock$YTPlayerViewController$sbPlaybackController;
static SBPlaybackController * _logos_get$SponsorBlock$YTPlayerViewController$sbPlaybackController(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$SponsorBlock$YTPlayerViewController$sbPlaybackController);
}
static void _logos_set$SponsorBlock$YTPlayerViewController$sbPlaybackController(id self, SEL _cmd, SBPlaybackController * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$SponsorBlock$YTPlayerViewController$sbPlaybackController, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static void (*_logos_orig$SponsorBlock_YTPlayerViewController_1)(id self, SEL _cmd, id controller, id video, id data);
static void _logos_method$SponsorBlock_YTPlayerViewController_1(id self, SEL _cmd, id controller, id video, id data) {
    _logos_orig$SponsorBlock_YTPlayerViewController_1(self, _cmd, controller, video, data);
    if (!YTLBool(@"sponsorBlock")) return;
    if ([[self valueForKey:@"isPlayingAd"] boolValue]) return;
    UIViewController *parentVC = [self valueForKey:@"parentViewController"];
    if (![parentVC isKindOfClass:objc_getClass("YTWatchViewController")] && !YTLBool(@"sbFeedPlayer")) {
        return;
    }
    SBPlaybackController *sbCtrl = [[SBPlaybackController alloc] initWithPlayer:self];
    [self setSbPlaybackController:sbCtrl];

}

static void (*_logos_orig$SponsorBlock_YTPlayerViewController_2)(id self, SEL _cmd, id video, id time);
static void _logos_method$SponsorBlock_YTPlayerViewController_2(id self, SEL _cmd, id video, id time) {
    _logos_orig$SponsorBlock_YTPlayerViewController_2(self, _cmd, video, time);
    if (YTLBool(@"sponsorBlock")) {
        [[self sbPlaybackController] skipSegmentIfNeeded];
        if (YTLBool(@"sbDurationLabel")) {
            [SBPlayerDecorator addDurationWithoutSegments:self videoController:video];
        }
    }

}

static void (*_logos_orig$SponsorBlock_YTPlayerViewController_3)(id self, SEL _cmd, id video, id time);
static void _logos_method$SponsorBlock_YTPlayerViewController_3(id self, SEL _cmd, id video, id time) {
    _logos_orig$SponsorBlock_YTPlayerViewController_3(self, _cmd, video, time);
    if (YTLBool(@"sponsorBlock")) {
        [[self sbPlaybackController] skipSegmentIfNeeded];
        if (YTLBool(@"sbDurationLabel")) {
            [SBPlayerDecorator addDurationWithoutSegments:self videoController:video];
        }
    }

}



static char _logos_prop_key$SponsorBlock$YTInlinePlayerBarContainerView$sbTimeString;
static NSString * _logos_get$SponsorBlock$YTInlinePlayerBarContainerView$sbTimeString(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$SponsorBlock$YTInlinePlayerBarContainerView$sbTimeString);
}
static void _logos_set$SponsorBlock$YTInlinePlayerBarContainerView$sbTimeString(id self, SEL _cmd, NSString * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$SponsorBlock$YTInlinePlayerBarContainerView$sbTimeString, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static void (*_logos_orig$SponsorBlock_YTInlinePlayerBarContainerView_4)(id self, SEL _cmd, BOOL visible);
static void _logos_method$SponsorBlock_YTInlinePlayerBarContainerView_4(id self, SEL _cmd, BOOL visible) {
    _logos_orig$SponsorBlock_YTInlinePlayerBarContainerView_4(self, _cmd, visible);
    if (YTLBool(@"sponsorBlock") && YTLBool(@"sbDurationLabel") && [self sbTimeString]) {
        UILabel *durationLabel = [self valueForKey:@"durationLabel"];
        NSString *suffix = [NSString stringWithFormat:@" (%@)", [self sbTimeString]];
        if (durationLabel.text && ![durationLabel.text containsString:suffix]) {
            durationLabel.text = [durationLabel.text stringByAppendingString:suffix];
            [durationLabel sizeToFit];
        }
    }

}



static void (*_logos_orig$SponsorBlock_YTPlayerBarRectangleDecorationView_5)(id self, SEL _cmd, CGRect rect, id gradient);
static void _logos_method$SponsorBlock_YTPlayerBarRectangleDecorationView_5(id self, SEL _cmd, CGRect rect, id gradient) {
    _logos_orig$SponsorBlock_YTPlayerBarRectangleDecorationView_5(self, _cmd, rect, gradient);
    [SBPlayerDecorator drawSegmentsDecorationView:self];

}

static void (*_logos_orig$SponsorBlock_YTPlayerBarRectangleDecorationView_6)(id self, SEL _cmd, CGRect rect, UIColor * color);
static void _logos_method$SponsorBlock_YTPlayerBarRectangleDecorationView_6(id self, SEL _cmd, CGRect rect, UIColor * color) {
    _logos_orig$SponsorBlock_YTPlayerBarRectangleDecorationView_6(self, _cmd, rect, color);
    [SBPlayerDecorator drawSegmentsDecorationView:self];

}

static BOOL (*_logos_orig$SponsorBlock_YTPlayerBarRectangleDecorationView_7)(id self, SEL _cmd);
static BOOL _logos_method$SponsorBlock_YTPlayerBarRectangleDecorationView_7(id self, SEL _cmd) {
    BOOL active = _logos_orig$SponsorBlock_YTPlayerBarRectangleDecorationView_7(self, _cmd);
    [SBPlayerDecorator drawSegmentsDecorationView:self];
    return active;

}



static void (*_logos_orig$SponsorBlock_YTPlayerBarProgressDecorationView_8)(id self, SEL _cmd, CGRect rect);
static void _logos_method$SponsorBlock_YTPlayerBarProgressDecorationView_8(id self, SEL _cmd, CGRect rect) {
    _logos_orig$SponsorBlock_YTPlayerBarProgressDecorationView_8(self, _cmd, rect);
    [SBPlayerDecorator drawSegmentsDecorationView:self];

}

static void (*_logos_orig$SponsorBlock_YTPlayerBarProgressDecorationView_9)(id self, SEL _cmd, CGRect rect, UIColor * color);
static void _logos_method$SponsorBlock_YTPlayerBarProgressDecorationView_9(id self, SEL _cmd, CGRect rect, UIColor * color) {
    _logos_orig$SponsorBlock_YTPlayerBarProgressDecorationView_9(self, _cmd, rect, color);
    [SBPlayerDecorator drawSegmentsDecorationView:self];

}

static BOOL (*_logos_orig$SponsorBlock_YTPlayerBarProgressDecorationView_10)(id self, SEL _cmd);
static BOOL _logos_method$SponsorBlock_YTPlayerBarProgressDecorationView_10(id self, SEL _cmd) {
    BOOL active = _logos_orig$SponsorBlock_YTPlayerBarProgressDecorationView_10(self, _cmd);
    [SBPlayerDecorator drawSegmentsDecorationView:self];
    return active;

}



static void (*_logos_orig$SponsorBlock_YTProgressView_11)(id self, SEL _cmd, CGFloat progress);
static void _logos_method$SponsorBlock_YTProgressView_11(id self, SEL _cmd, CGFloat progress) {
    _logos_orig$SponsorBlock_YTProgressView_11(self, _cmd, progress);
    if (YTLBool(@"sponsorBlock") && YTLBool(@"sbMiniPlayer")) {
        UIViewController *ancestor = [self _viewControllerForAncestor];
        if ([ancestor isKindOfClass:objc_getClass("YTWatchMiniBarViewController")] ||
            [ancestor isKindOfClass:objc_getClass("YTWatchFloatingMiniplayerViewController")]) {
            id playerVC = [ancestor valueForKey:@"_playerViewController"];
            [SBPlayerDecorator drawSegments:self layer:self.layer playerVC:playerVC];
        }
    }

}



static void (*_logos_orig$SponsorBlock_YTInlineMutedPlaybackScrubberView_12)(id self, SEL _cmd, CGFloat time);
static void _logos_method$SponsorBlock_YTInlineMutedPlaybackScrubberView_12(id self, SEL _cmd, CGFloat time) {
    _logos_orig$SponsorBlock_YTInlineMutedPlaybackScrubberView_12(self, _cmd, time);
    if (YTLBool(@"sponsorBlock") && YTLBool(@"sbFeedPlayer")) {
        UIViewController *ancestor = [self _viewControllerForAncestor];
        id parentVC = [ancestor valueForKey:@"parentViewController"];
        id playerVC = [parentVC valueForKey:@"parentResponder"];
        [SBPlayerDecorator drawSegments:self layer:self.layer playerVC:playerVC];
    }

}

static void (*_logos_orig$SponsorBlock_YTInlineMutedPlaybackScrubberView_13)(id self, SEL _cmd);
static void _logos_method$SponsorBlock_YTInlineMutedPlaybackScrubberView_13(id self, SEL _cmd) {
    _logos_orig$SponsorBlock_YTInlineMutedPlaybackScrubberView_13(self, _cmd);

}


__attribute__((constructor)) static void _logosLocalInit_SponsorBlock(void) {
    class_addMethod(objc_getClass("YTPlayerViewController"), @selector(sbPlaybackController), (IMP)&_logos_get$SponsorBlock$YTPlayerViewController$sbPlaybackController, "@@:");
    class_addMethod(objc_getClass("YTPlayerViewController"), @selector(setSbPlaybackController:), (IMP)&_logos_set$SponsorBlock$YTPlayerViewController$sbPlaybackController, "v@:@");
    MSHookMessageEx(objc_getClass("YTPlayerViewController"), @selector(playbackController:didActivateVideo:withPlaybackData:), (IMP)&_logos_method$SponsorBlock_YTPlayerViewController_1, (IMP *)&_logos_orig$SponsorBlock_YTPlayerViewController_1);
    MSHookMessageEx(objc_getClass("YTPlayerViewController"), @selector(singleVideo:currentVideoTimeDidChange:), (IMP)&_logos_method$SponsorBlock_YTPlayerViewController_2, (IMP *)&_logos_orig$SponsorBlock_YTPlayerViewController_2);
    MSHookMessageEx(objc_getClass("YTPlayerViewController"), @selector(potentiallyMutatedSingleVideo:currentVideoTimeDidChange:), (IMP)&_logos_method$SponsorBlock_YTPlayerViewController_3, (IMP *)&_logos_orig$SponsorBlock_YTPlayerViewController_3);
    class_addMethod(objc_getClass("YTInlinePlayerBarContainerView"), @selector(sbTimeString), (IMP)&_logos_get$SponsorBlock$YTInlinePlayerBarContainerView$sbTimeString, "@@:");
    class_addMethod(objc_getClass("YTInlinePlayerBarContainerView"), @selector(setSbTimeString:), (IMP)&_logos_set$SponsorBlock$YTInlinePlayerBarContainerView$sbTimeString, "v@:@");
    MSHookMessageEx(objc_getClass("YTInlinePlayerBarContainerView"), @selector(setPeekableViewVisible:), (IMP)&_logos_method$SponsorBlock_YTInlinePlayerBarContainerView_4, (IMP *)&_logos_orig$SponsorBlock_YTInlinePlayerBarContainerView_4);
    MSHookMessageEx(objc_getClass("YTPlayerBarRectangleDecorationView"), @selector(applyGradientColorForRect:withOverallGradient:), (IMP)&_logos_method$SponsorBlock_YTPlayerBarRectangleDecorationView_5, (IMP *)&_logos_orig$SponsorBlock_YTPlayerBarRectangleDecorationView_5);
    MSHookMessageEx(objc_getClass("YTPlayerBarRectangleDecorationView"), @selector(drawProgressRect:withColor:), (IMP)&_logos_method$SponsorBlock_YTPlayerBarRectangleDecorationView_6, (IMP *)&_logos_orig$SponsorBlock_YTPlayerBarRectangleDecorationView_6);
    MSHookMessageEx(objc_getClass("YTPlayerBarRectangleDecorationView"), @selector(isStateActive), (IMP)&_logos_method$SponsorBlock_YTPlayerBarRectangleDecorationView_7, (IMP *)&_logos_orig$SponsorBlock_YTPlayerBarRectangleDecorationView_7);
    MSHookMessageEx(objc_getClass("YTPlayerBarProgressDecorationView"), @selector(applyGradientForRect:), (IMP)&_logos_method$SponsorBlock_YTPlayerBarProgressDecorationView_8, (IMP *)&_logos_orig$SponsorBlock_YTPlayerBarProgressDecorationView_8);
    MSHookMessageEx(objc_getClass("YTPlayerBarProgressDecorationView"), @selector(drawProgressRect:withColor:), (IMP)&_logos_method$SponsorBlock_YTPlayerBarProgressDecorationView_9, (IMP *)&_logos_orig$SponsorBlock_YTPlayerBarProgressDecorationView_9);
    MSHookMessageEx(objc_getClass("YTPlayerBarProgressDecorationView"), @selector(isStateActive), (IMP)&_logos_method$SponsorBlock_YTPlayerBarProgressDecorationView_10, (IMP *)&_logos_orig$SponsorBlock_YTPlayerBarProgressDecorationView_10);
    MSHookMessageEx(objc_getClass("YTProgressView"), @selector(setProgress:), (IMP)&_logos_method$SponsorBlock_YTProgressView_11, (IMP *)&_logos_orig$SponsorBlock_YTProgressView_11);
    MSHookMessageEx(objc_getClass("YTInlineMutedPlaybackScrubberView"), @selector(setMediaTime:), (IMP)&_logos_method$SponsorBlock_YTInlineMutedPlaybackScrubberView_12, (IMP *)&_logos_orig$SponsorBlock_YTInlineMutedPlaybackScrubberView_12);
    MSHookMessageEx(objc_getClass("YTInlineMutedPlaybackScrubberView"), @selector(addGradient), (IMP)&_logos_method$SponsorBlock_YTInlineMutedPlaybackScrubberView_13, (IMP *)&_logos_orig$SponsorBlock_YTInlineMutedPlaybackScrubberView_13);
}
