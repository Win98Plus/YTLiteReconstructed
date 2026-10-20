// Auto-generated from YTLite.x by scripts/logos_to_objc.py
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#ifdef __cplusplus
extern "C" void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old);
#else
extern void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old);
#endif

//
// YTLite.x
// Reconstructed from YTLite.dylib TU 9 (0x4c9e0 .. 0xf054c)
// Core hooks for YouTube Plus (YTLite) v5.2.2 (369 hooks & %new methods)
//

#import "Headers/YTLite.h"

// MARK: - Remote Control & Now Playing


static id (*_logos_orig$YTLite_MPRemoteCommand_1)(id self, SEL _cmd, id target, SEL action);
static id _logos_method$YTLite_MPRemoteCommand_1(id self, SEL _cmd, id target, SEL action) {
    MPRemoteCommandCenter *center = [MPRemoteCommandCenter sharedCommandCenter];
    if (self == center.previousTrackCommand && YTLBool(@"rcSkipBackward")) {
        return [center.skipBackwardCommand addTarget:target action:action];
    }
    if (self == center.nextTrackCommand && YTLBool(@"rcSkipForward")) {
        return [center.skipForwardCommand addTarget:target action:action];
    }
    return _logos_orig$YTLite_MPRemoteCommand_1(self, _cmd, target, action);

}



static void (*_logos_orig$YTLite_MPNowPlayingInfoCenter_2)(id self, SEL _cmd, NSDictionary * info);
static void _logos_method$YTLite_MPNowPlayingInfoCenter_2(id self, SEL _cmd, NSDictionary * info) {
    _logos_orig$YTLite_MPNowPlayingInfoCenter_2(self, _cmd, info);

}


// MARK: - Toast Offset & Fullscreen Tracking


static void (*_logos_orig$YTLite_YTToastOffsetController_3)(id self, SEL _cmd);
static void _logos_method$YTLite_YTToastOffsetController_3(id self, SEL _cmd) {
    _logos_orig$YTLite_YTToastOffsetController_3(self, _cmd);
    [[ToastManager sharedManager] setOffsetController:self];
    [[ToastManager sharedManager] updateAllToasts];

}

static void (*_logos_orig$YTLite_YTToastOffsetController_4)(id self, SEL _cmd, BOOL pinned);
static void _logos_method$YTLite_YTToastOffsetController_4(id self, SEL _cmd, BOOL pinned) {
    _logos_orig$YTLite_YTToastOffsetController_4(self, _cmd, pinned);
    [[ToastManager sharedManager] setIsPinnedTop:pinned];

}



static void (*_logos_orig$YTLite_YTWatchViewController_5)(id self, SEL _cmd, BOOL fullscreen);
static void _logos_method$YTLite_YTWatchViewController_5(id self, SEL _cmd, BOOL fullscreen) {
    _logos_orig$YTLite_YTWatchViewController_5(self, _cmd, fullscreen);
    [[ToastManager sharedManager] setIsFullscreen:fullscreen];

}

static NSInteger (*_logos_orig$YTLite_YTWatchViewController_6)(id self, SEL _cmd);
static NSInteger _logos_method$YTLite_YTWatchViewController_6(id self, SEL _cmd) {
    if (YTLBool(@"portraitFullscreen")) {
        return UIInterfaceOrientationMaskAll;
    }
    return _logos_orig$YTLite_YTWatchViewController_6(self, _cmd);

}



static void (*_logos_orig$YTLite_UIDevice_7)(id self, SEL _cmd, NSInteger orientation, BOOL animated);
static void _logos_method$YTLite_UIDevice_7(id self, SEL _cmd, NSInteger orientation, BOOL animated) {
    _logos_orig$YTLite_UIDevice_7(self, _cmd, orientation, animated);

}

static NSInteger (*_logos_orig$YTLite_UIDevice_8)(id self, SEL _cmd);
static NSInteger _logos_method$YTLite_UIDevice_8(id self, SEL _cmd) {
    NSInteger idiomIdx = YTLInt(@"idiomIndex");
    if (idiomIdx == 1) return UIUserInterfaceIdiomPhone;
    if (idiomIdx == 2) return UIUserInterfaceIdiomPad;
    return _logos_orig$YTLite_UIDevice_8(self, _cmd);

}


// MARK: - Interstitial & Engagement Panel Filtering


static void (*_logos_orig$YTLite_UIViewController_9)(id self, SEL _cmd, UIViewController * vc, BOOL animated);
static void _logos_method$YTLite_UIViewController_9(id self, SEL _cmd, UIViewController * vc, BOOL animated) {
    if (YTLBool(@"noAds") && [vc isKindOfClass:objc_getClass("YTInterstitialElementsViewController")]) {
        return;
    }
    _logos_orig$YTLite_UIViewController_9(self, _cmd, vc, animated);

}

static void (*_logos_orig$YTLite_UIViewController_10)(id self, SEL _cmd);
static void _logos_method$YTLite_UIViewController_10(id self, SEL _cmd) {
    _logos_orig$YTLite_UIViewController_10(self, _cmd);
    if ([self isKindOfClass:objc_getClass("YTMainAppEngagementPanelViewController")] ||
        [self isKindOfClass:objc_getClass("YTEngagementPanelViewControllerImpl")]) {
        NSString *panelId = [[self valueForKey:@"panelIdentifier"] description];
        if ([panelId containsString:@"comment-item-section"]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"GOODHeightDidChangeNotification" object:self userInfo:@{@"height": @1}];
        }
    }

}

static void (*_logos_orig$YTLite_UIViewController_11)(id self, SEL _cmd, BOOL animated);
static void _logos_method$YTLite_UIViewController_11(id self, SEL _cmd, BOOL animated) {
    _logos_orig$YTLite_UIViewController_11(self, _cmd, animated);
    if ([self isKindOfClass:objc_getClass("YTMainAppEngagementPanelViewController")] ||
        [self isKindOfClass:objc_getClass("YTEngagementPanelViewControllerImpl")]) {
        NSString *panelId = [[self valueForKey:@"panelIdentifier"] description];
        if ([panelId containsString:@"comment-item-section"]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"GOODHeightDidChangeNotification" object:self userInfo:@{@"height": @0}];
        }
    }

}


// MARK: - Navigation Bar & Subheader Bar


static BOOL (*_logos_orig$YTLite_YTHeaderView_12)(id self, SEL _cmd);
static BOOL _logos_method$YTLite_YTHeaderView_12(id self, SEL _cmd) {
    return YTLBool(@"stickyNavbar") ? YES : _logos_orig$YTLite_YTHeaderView_12(self, _cmd);

}

static BOOL (*_logos_orig$YTLite_YTHeaderView_13)(id self, SEL _cmd);
static BOOL _logos_method$YTLite_YTHeaderView_13(id self, SEL _cmd) {
    return YTLBool(@"stickyNavbar") ? YES : _logos_orig$YTLite_YTHeaderView_13(self, _cmd);

}



static id (*_logos_orig$YTLite_YTChipCloudCell_14)(id self, SEL _cmd, CGFloat width);
static id _logos_method$YTLite_YTChipCloudCell_14(id self, SEL _cmd, CGFloat width) {
    if (YTLBool(@"noSubbar")) return @[];
    return _logos_orig$YTLite_YTChipCloudCell_14(self, _cmd, width);

}



static void (*_logos_orig$YTLite_YTMySubsFilterHeaderView_15)(id self, SEL _cmd, id view);
static void _logos_method$YTLite_YTMySubsFilterHeaderView_15(id self, SEL _cmd, id view) {
    if (YTLBool(@"noSubbar")) return;
    _logos_orig$YTLite_YTMySubsFilterHeaderView_15(self, _cmd, view);

}



static void (*_logos_orig$YTLite_YTHeaderContentComboView_16)(id self, SEL _cmd, id view);
static void _logos_method$YTLite_YTHeaderContentComboView_16(id self, SEL _cmd, id view) {
    if (YTLBool(@"noSubbar")) return;
    _logos_orig$YTLite_YTHeaderContentComboView_16(self, _cmd, view);

}

static void (*_logos_orig$YTLite_YTHeaderContentComboView_17)(id self, SEL _cmd, NSInteger mode);
static void _logos_method$YTLite_YTHeaderContentComboView_17(id self, SEL _cmd, NSInteger mode) {
    if (YTLBool(@"stickyNavbar")) {
        _logos_orig$YTLite_YTHeaderContentComboView_17(self, _cmd, 0);
        return;
    }
    _logos_orig$YTLite_YTHeaderContentComboView_17(self, _cmd, mode);

}


// MARK: - Pivot Bar (Tab Bar) & Startup


static NSInteger (*_logos_orig$YTLite_YTIPivotBarRenderer_18)(id self, SEL _cmd);
static NSInteger _logos_method$YTLite_YTIPivotBarRenderer_18(id self, SEL _cmd) {
    if (YTLBool(@"frostedPivot")) return 1;
    return _logos_orig$YTLite_YTIPivotBarRenderer_18(self, _cmd);

}



static void (*_logos_orig$YTLite_YTPivotBarViewController_19)(id self, SEL _cmd, BOOL animated);
static void _logos_method$YTLite_YTPivotBarViewController_19(id self, SEL _cmd, BOOL animated) {
    _logos_orig$YTLite_YTPivotBarViewController_19(self, _cmd, animated);
    if (YTLBool(@"shortsOnlyMode")) {
        [self selectItemWithPivotIdentifier:@"FEshorts"];
        [[self valueForKey:@"parentViewController"] performSelector:@selector(hidePivotBar)];
    } else {
        NSString *startupTab = [[YTLUserDefaults standardUserDefaults] objectForKey:@"startupTab"];
        if (startupTab.length > 0) {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                [self selectItemWithPivotIdentifier:startupTab];
            });
        }
    }

}

static BOOL (*_logos_orig$YTLite_YTPivotBarViewController_20)(id self, SEL _cmd);
static BOOL _logos_method$YTLite_YTPivotBarViewController_20(id self, SEL _cmd) {
    return YTLBool(@"frostedPivot") ? YES : _logos_orig$YTLite_YTPivotBarViewController_20(self, _cmd);

}



static BOOL (*_logos_orig$YTLite_YTAppDelegate_21)(id self, SEL _cmd, UIApplication * application, NSDictionary * launchOptions);
static BOOL _logos_method$YTLite_YTAppDelegate_21(id self, SEL _cmd, UIApplication * application, NSDictionary * launchOptions) {
    BOOL res = _logos_orig$YTLite_YTAppDelegate_21(self, _cmd, application, launchOptions);
    if (YTLBool(@"autoClearCache")) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            [[[YTPSettingsBuilder alloc] init] clearCacheWithCompletion:nil];
        });
    }
    return res;

}

static void (*_logos_orig$YTLite_YTAppDelegate_22)(id self, SEL _cmd);
static void _logos_method$YTLite_YTAppDelegate_22(id self, SEL _cmd) {
    _logos_orig$YTLite_YTAppDelegate_22(self, _cmd);
    if (YTLBool(@"autoCheckCb")) {
        NSString *cb = [UIPasteboard generalPasteboard].string;
        if (cb.length > 0 && ([cb containsString:@"youtu.be"] || [cb containsString:@"youtube.com"] || [cb containsString:@"youtube-nocookie.com"])) {
            ToastView *toast = [[ToastView alloc] init];
            [toast showProgressiveToastWithText:LOC(@"LinkDetected") duration:4.0 actionTitle:LOC(@"Open") actionCompletion:^{
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:cb] options:@{} completionHandler:nil];
            }];
        }
    }
    MPRemoteCommandCenter *center = [MPRemoteCommandCenter sharedCommandCenter];
    if (YTLBool(@"rcSkipBackward")) {
        center.skipBackwardCommand.preferredIntervals = @[@(YTLFloat(@"rcSkipBackwardSec") ?: 10.0)];
    }
    if (YTLBool(@"rcSkipForward")) {
        center.skipForwardCommand.preferredIntervals = @[@(YTLFloat(@"rcSkipForwardSec") ?: 10.0)];
    }

}



static UIView * (*_logos_orig$YTLite_YTPivotBarView_23)(id self, SEL _cmd);
static UIView * _logos_method$YTLite_YTPivotBarView_23(id self, SEL _cmd) {
    UIView *v = _logos_orig$YTLite_YTPivotBarView_23(self, _cmd);
    if (v) {
        UIContextMenuInteraction *interaction = [[UIContextMenuInteraction alloc] initWithDelegate:(id<UIContextMenuInteractionDelegate>)self];
        v.userInteractionEnabled = YES;
        [v addInteraction:interaction];
    }
    return v;

}

static UIContextMenuConfiguration * _logos_method$YTLite_YTPivotBarView_24(id self, SEL _cmd, UIContextMenuInteraction * interaction, CGPoint location) {
    return [UIContextMenuConfiguration configurationWithIdentifier:nil previewProvider:nil actionProvider:^UIMenu *(NSArray<UIMenuElement *> *suggestedActions) {
        UIAction *tabSettings = [UIAction actionWithTitle:LOC(@"Tabbar") image:[UIImage systemImageNamed:@"square.grid.2x2"] identifier:nil handler:^(__kindof UIAction *action) {
            TabbarVC *vc = [[TabbarVC alloc] initForSettings:NO];
            [[objc_getClass("YTUIUtils") topViewControllerForPresenting] presentViewController:[[UINavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
        }];
        return [UIMenu menuWithTitle:@"" children:@[tabSettings]];
    }];

}



static BOOL (*_logos_orig$YTLite_YTColdConfig_25)(id self, SEL _cmd);
static BOOL _logos_method$YTLite_YTColdConfig_25(id self, SEL _cmd) {
    NSInteger mode = YTLInt(@"startupAnimation");
    if (mode == 1) return NO;
    if (mode >= 2) return YES;
    return _logos_orig$YTLite_YTColdConfig_25(self, _cmd);

}

- (BOOL)removeNextPaddleForSingletonVideos { return YTLBool(@"hidePrevNext") ? YES : %orig; }
- (BOOL)removePreviousPaddleForSingletonVideos { return YTLBool(@"hidePrevNext") ? YES : %orig; }
- (BOOL)replaceNextPaddleWithFastForwardButtonForSingletonVods { return YTLBool(@"replacePrevNext") ? YES : %orig; }
- (BOOL)replacePreviousPaddleWithRewindButtonForSingletonVods { return YTLBool(@"replacePrevNext") ? YES : %orig; }
- (BOOL)enableHideChipsInTheCommentsHeaderOnScrollIos { return YTLBool(@"stickSortComments") ? NO : %orig; }
- (BOOL)enableChipsInTheCommentsHeaderIos { return YTLBool(@"hideSortComments") ? NO : %orig; }
- (BOOL)shouldUseAppThemeSetting { return YES; }
- (BOOL)isLandscapeEngagementPanelSwipeRightToDismissEnabled { return YES; }
- (BOOL)enableSwipeToRemoveInPlaylistWatchEp { return YES; }
- (BOOL)enableLightThemeAmbientMode { return YTLBool(@"disableAmbientMode") ? NO : %orig; }
- (BOOL)iosAmbientModeExtendWidthInLandscape { return YTLBool(@"disableAmbientMode") ? NO : %orig; }
- (BOOL)iosEnableFullScreenAmbientMode { return YTLBool(@"disableAmbientMode") ? NO : %orig; }
- (BOOL)enableTurnOffCinematicForFrameWithBlackBars { return YTLBool(@"disableAmbientMode") ? NO : %orig; }
- (BOOL)queueClientGlobalConfigEnableFloatingPlaylistMinibar { return YTLBool(@"playlistOldMinibar") ? NO : %orig; }
- (BOOL)disablePlaybackLockScreenController { return YTLBool(@"ytlLockButton") ? NO : %orig; }
- (BOOL)iosEnableVideoPlayerScrubber { return YTLBool(@"shortsProgress") ? YES : %orig; }
- (BOOL)mobileShortsTabInlined { return YTLBool(@"shortsProgress") ? YES : %orig; }
- (BOOL)iosUseSystemVolumeControlInFullscreen { return YTLBool(@"stockVolumeHUD") ? YES : %orig; }
- (BOOL)enableYouthereCommandsOnIos { return NO; }
- (BOOL)cxClientEnableIosLocalNetworkPermissionWifiFixes { return NO; }
- (BOOL)cxClientEnableIosLocalNetworkPermissionUsingSockets { return NO; }
- (BOOL)cxClientEnableIosLocalNetworkPermissionReliabilityFixes { return NO; }
- (BOOL)iosPlayerClientSharedConfigPopulateSwAv1MediaCapabilities { return NO; }
- (BOOL)mediaEngineClientForceSoftwareDecoderOnDecoderRetry { return YES; }


- (BOOL)iosDisablePlaybackLockScreenController { return YTLBool(@"ytlLockButton") ? NO : %orig; }


static void (*_logos_orig$YTLite_YTStartupAnimationViewController_26)(id self, SEL _cmd);
static void _logos_method$YTLite_YTStartupAnimationViewController_26(id self, SEL _cmd) {
    _logos_orig$YTLite_YTStartupAnimationViewController_26(self, _cmd);
    if (YTLBool(@"oledTheme")) {
        self.view.backgroundColor = [UIColor blackColor];
    }

}

static void (*_logos_orig$YTLite_YTStartupAnimationViewController_27)(id self, SEL _cmd);
static void _logos_method$YTLite_YTStartupAnimationViewController_27(id self, SEL _cmd) {
    _logos_orig$YTLite_YTStartupAnimationViewController_27(self, _cmd);

}

static void (*_logos_orig$YTLite_YTStartupAnimationViewController_28)(id self, SEL _cmd);
static void _logos_method$YTLite_YTStartupAnimationViewController_28(id self, SEL _cmd) {
    _logos_orig$YTLite_YTStartupAnimationViewController_28(self, _cmd);

}


// MARK: - Background Playback & Ad Blocking

static char _logos_prop_key$YTLite$YTMultiSizeViewController$helper;
static YTLHelper * _logos_get$YTLite$YTMultiSizeViewController$helper(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTMultiSizeViewController$helper);
}
static void _logos_set$YTLite$YTMultiSizeViewController$helper(id self, SEL _cmd, YTLHelper * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTMultiSizeViewController$helper, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isPlayableInBackground { return YTLBool(@"backgroundPlayback") ? YES : %orig; }

- (BOOL)playableInBackground { return YTLBool(@"backgroundPlayback") ? YES : %orig; }

- (BOOL)isBackgroundEnabled { return YTLBool(@"backgroundPlayback") ? YES : %orig; }

- (BOOL)shouldBlockUpgradeDialog { return YTLBool(@"noAds") ? YES : %orig; }


- (BOOL)isMonetized { return YTLBool(@"noAds") ? NO : %orig; }
- (id)playerAdsArray { return YTLBool(@"noAds") ? [NSMutableArray array] : %orig; }
- (id)adSlotsArray { return YTLBool(@"noAds") ? [NSMutableArray array] : %orig; }
- (id)auxiliaryUi { return %orig; }
- (void)setHasAuxiliaryUi:(BOOL)has { %orig(has); }
- (void)setAuxiliaryUi:(id)ui { %orig(ui); }


- (BOOL)enableSkippableAd { return YTLBool(@"noAds") ? YES : %orig; }

+ (id)spamSignalsDictionary { return YTLBool(@"noAds") ? @{} : %orig; }
+ (id)spamSignalsDictionaryWithoutIDFA { return YTLBool(@"noAds") ? @{} : %orig; }

+ (id)spamSignalsDictionary { return YTLBool(@"noAds") ? @{} : %orig; }
+ (id)spamSignalsDictionaryWithoutIDFA { return YTLBool(@"noAds") ? @{} : %orig; }

- (void)decorateContext:(id)context { if (!YTLBool(@"noAds")) %orig; }

- (void)decorateContext:(id)context { if (!YTLBool(@"noAds")) %orig; }

- (id)createAdsPlaybackCoordinator { return YTLBool(@"noAds") ? nil : %orig; }

- (void)adPlaying:(id)ad { if (!YTLBool(@"noAds")) %orig; }

- (void)loadWithModel:(id)model { %orig; }


static NSData * (*_logos_orig$YTLite_YTIElementRenderer_29)(id self, SEL _cmd);
static NSData * _logos_method$YTLite_YTIElementRenderer_29(id self, SEL _cmd) {
    NSData *data = _logos_orig$YTLite_YTIElementRenderer_29(self, _cmd);
    if (YTLBool(@"noAds") && [self respondsToSelector:@selector(hasCompatibilityOptions)] && [self valueForKey:@"compatibilityOptions"]) {
        id compat = [self valueForKey:@"compatibilityOptions"];
        if ([compat respondsToSelector:@selector(hasAdLoggingData)] && [[compat valueForKey:@"hasAdLoggingData"] boolValue]) {
            return [NSData data];
        }
    }
    return data;

}


// MARK: - AsyncDisplayKit (_ASDisplayView & ASDisplayNode)


static void (*_logos_orig$YTLite__ASDisplayView_30)(id self, SEL _cmd);
static void _logos_method$YTLite__ASDisplayView_30(id self, SEL _cmd) {
    _logos_orig$YTLite__ASDisplayView_30(self, _cmd);
    if (YTLBool(@"noAds") && [self.accessibilityIdentifier isEqualToString:@"eml.expandable_metadata.vpp"]) {
        [self removeFromSuperview];
    }

}

static void (*_logos_orig$YTLite__ASDisplayView_31)(id self, SEL _cmd, id node);
static void _logos_method$YTLite__ASDisplayView_31(id self, SEL _cmd, id node) {
    _logos_orig$YTLite__ASDisplayView_31(self, _cmd, node);

}

static void _logos_method$YTLite__ASDisplayView_32(id self, SEL _cmd, UILongPressGestureRecognizer * sender) {
    if (sender.state != UIGestureRecognizerStateBegan) return;
    id node = [self valueForKey:@"keepalive_node"];
    if ([node isKindOfClass:objc_getClass("ASNetworkImageNode")]) {
        NSURL *url = [node valueForKey:@"URL"];
        if (url) [YTLHelper downloadImageFromURL:url download:YES];
    }

}

static void _logos_method$YTLite__ASDisplayView_33(id self, SEL _cmd, UILongPressGestureRecognizer * sender) {
    if (sender.state != UIGestureRecognizerStateBegan) return;

}

static void _logos_method$YTLite__ASDisplayView_34(id self, SEL _cmd, UILongPressGestureRecognizer * sender) {
    if (sender.state != UIGestureRecognizerStateBegan) return;

}


- (void)addSectionsFromArray:(NSArray *)sections { %orig; }


static id (*_logos_orig$YTLite_YTICommand_35)(id self, SEL _cmd);
static id _logos_method$YTLite_YTICommand_35(id self, SEL _cmd) {
    id ep = _logos_orig$YTLite_YTICommand_35(self, _cmd);
    if (YTLBool(@"noAds") && [[ep description] containsString:@"mealbar_promo"]) {
        return nil;
    }
    return ep;

}


// MARK: - Promo & Upsell Suppression

- (void)setHasPromoType:(BOOL)arg1 { %orig(NO); }
- (void)setPromoType:(NSInteger)arg1 { %orig(0); }
- (void)setHasPromoCommand:(BOOL)arg1 { %orig(NO); }
- (void)setPromoCommand:(id)arg1 { %orig(nil); }
- (void)setHasWatchPageTriggerCondition:(BOOL)arg1 { %orig(NO); }
- (void)setWatchPageTriggerCondition:(NSInteger)arg1 { %orig(0); }
- (id)clientFrequencyCapConfigsArray { return [NSMutableArray array]; }
- (NSUInteger)clientFrequencyCapConfigsArray_Count { return 0; }

- (NSInteger)rendererOneOfCase { return 0; }
- (void)setHasCommandWrapperPromoRenderer:(BOOL)arg1 { %orig(NO); }
- (void)setCommandWrapperPromoRenderer:(id)arg1 { %orig(nil); }
- (void)setHasUpsellDialogRenderer:(BOOL)arg1 { %orig(NO); }
- (void)setUpsellDialogRenderer:(id)arg1 { %orig(nil); }

- (void)setHasMessageRenderers:(BOOL)arg1 { %orig(NO); }
- (void)setMessageRenderers:(id)arg1 { %orig(nil); }

- (BOOL)hasPlayerCueRangeSet { return NO; }
- (NSUInteger)validAdsStatesArray_Count { return 0; }

- (id)streamTimeMs { return @0; }
- (BOOL)hasStreamTimeMs { return NO; }

- (NSInteger)type { return 0; }
- (void)setType:(NSInteger)type { %orig(0); }

- (void)addEventHandlers {}

- (void)addEventHandlers {}

- (void)addEventHandlers {}

- (BOOL)canShowThrottledPromo { return NO; }
- (BOOL)canShowThrottledPromoWithFrequencyCap:(id)arg1 { return NO; }
- (BOOL)canShowThrottledPromoWithFrequencyCaps:(id)arg1 { return NO; }

- (BOOL)shouldThrottleInterstitial { return YES; }

- (void)updatePremiumEarlyAccessSectionWithEntry:(id)entry {}

- (void)showSurveyWithRenderer:(id)renderer surveyParentResponder:(id)responder {}

// MARK: - Cast, Hints, & Navigation Buttons

- (BOOL)isPersistentCastIconEnabled { return YTLBool(@"noCast") ? NO : %orig; }
- (void)updateRouteButton:(id)button { if (!YTLBool(@"noCast")) %orig; }
- (void)updateAllRouteButtons { if (!YTLBool(@"noCast")) %orig; }

- (void)setDisableMDXDeviceDiscovery:(BOOL)disable { %orig(YTLBool(@"noCast") ? YES : disable); }
- (BOOL)areHintsDisabled { return YTLBool(@"noHints") ? YES : %orig; }
- (void)setHintsDisabled:(BOOL)disabled { %orig(YTLBool(@"noHints") ? YES : disabled); }


static void (*_logos_orig$YTLite_YTRightNavigationButtons_36)(id self, SEL _cmd);
static void _logos_method$YTLite_YTRightNavigationButtons_36(id self, SEL _cmd) {
    _logos_orig$YTLite_YTRightNavigationButtons_36(self, _cmd);
    if (YTLBool(@"noNotifsButton")) [[self valueForKey:@"notificationButton"] setHidden:YES];
    if (YTLBool(@"noSearchButton")) [[self valueForKey:@"searchButton"] setHidden:YES];
    for (UIView *sub in self.subviews) {
        if (YTLBool(@"noCast") && [sub.accessibilityIdentifier isEqualToString:@"id.mdx.playbackroute.button"]) {
            sub.hidden = YES;
        }
    }

}



static void (*_logos_orig$YTLite_YTSearchViewController_37)(id self, SEL _cmd);
static void _logos_method$YTLite_YTSearchViewController_37(id self, SEL _cmd) {
    _logos_orig$YTLite_YTSearchViewController_37(self, _cmd);
    if (YTLBool(@"noVoiceSearchButton")) {
        [self setValue:@NO forKey:@"_isVoiceSearchAllowed"];
    }

}

static void (*_logos_orig$YTLite_YTSearchViewController_38)(id self, SEL _cmd, id suggestions);
static void _logos_method$YTLite_YTSearchViewController_38(id self, SEL _cmd, id suggestions) {
    if (YTLBool(@"noSearchHistory")) return;
    _logos_orig$YTLite_YTSearchViewController_38(self, _cmd, suggestions);

}


- (id)activeCache { return YTLBool(@"noSearchHistory") ? nil : %orig; }

- (void)setVisibleSections:(id)sections { if (!YTLBool(@"noRelatedWatchNexts")) %orig; }

// MARK: - Custom Logo & Scrubber Thumb


static void (*_logos_orig$YTLite_UIImageView_39)(id self, SEL _cmd, UIImage * image);
static void _logos_method$YTLite_UIImageView_39(id self, SEL _cmd, UIImage * image) {
    NSInteger logoIdx = YTLInt(@"logoIndex");
    if (logoIdx > 0 && [[image description] containsString:@"Resources: youtube_"]) {
        if (logoIdx == 1) {
            self.alpha = 0.0;
        } else if (logoIdx == 2) {
            image = [objc_getClass("YTUIResources") youtubePremiumLogoWithPageStyle:1];
        }
    }
    _logos_orig$YTLite_UIImageView_39(self, _cmd, image);

}

static UIImage * (*_logos_orig$YTLite_UIImageView_40)(id self, SEL _cmd);
static UIImage * _logos_method$YTLite_UIImageView_40(id self, SEL _cmd) {
    UIImage *img = _logos_orig$YTLite_UIImageView_40(self, _cmd);
    if (YTLInt(@"progressBarIndex") > 0 && [[img description] containsString:@"player_scrubber_thumb_cairo"]) {
        NSData *colorData = [[YTLUserDefaults standardUserDefaults] objectForKey:@"scrubberColor"];
        if (colorData) {
            UIColor *color = [NSKeyedUnarchiver unarchivedObjectOfClass:[UIColor class] fromData:colorData error:nil];
            if (color && [UIColor respondsToSelector:@selector(_flatImageWithColor:)]) {
                return [UIColor _flatImageWithColor:color];
            }
        }
    }
    return img;

}


// MARK: - Player Controls Overlay (YTMainAppControlsOverlayView)


static char _logos_prop_key$YTLite$YTMainAppControlsOverlayView$speedControls;
static UIStackView * _logos_get$YTLite$YTMainAppControlsOverlayView$speedControls(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$speedControls);
}
static void _logos_set$YTLite$YTMainAppControlsOverlayView$speedControls(id self, SEL _cmd, UIStackView * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$speedControls, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static char _logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlButtons;
static UIStackView * _logos_get$YTLite$YTMainAppControlsOverlayView$ytlButtons(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlButtons);
}
static void _logos_set$YTLite$YTMainAppControlsOverlayView$ytlButtons(id self, SEL _cmd, UIStackView * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlButtons, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static char _logos_prop_key$YTLite$YTMainAppControlsOverlayView$speedMinus;
static YTQTMButton * _logos_get$YTLite$YTMainAppControlsOverlayView$speedMinus(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$speedMinus);
}
static void _logos_set$YTLite$YTMainAppControlsOverlayView$speedMinus(id self, SEL _cmd, YTQTMButton * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$speedMinus, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static char _logos_prop_key$YTLite$YTMainAppControlsOverlayView$speedPlus;
static YTQTMButton * _logos_get$YTLite$YTMainAppControlsOverlayView$speedPlus(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$speedPlus);
}
static void _logos_set$YTLite$YTMainAppControlsOverlayView$speedPlus(id self, SEL _cmd, YTQTMButton * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$speedPlus, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static char _logos_prop_key$YTLite$YTMainAppControlsOverlayView$speedValue;
static YTQTMButton * _logos_get$YTLite$YTMainAppControlsOverlayView$speedValue(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$speedValue);
}
static void _logos_set$YTLite$YTMainAppControlsOverlayView$speedValue(id self, SEL _cmd, YTQTMButton * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$speedValue, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static char _logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlButton;
static YTQTMButton * _logos_get$YTLite$YTMainAppControlsOverlayView$ytlButton(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlButton);
}
static void _logos_set$YTLite$YTMainAppControlsOverlayView$ytlButton(id self, SEL _cmd, YTQTMButton * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlButton, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static char _logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlMuteButton;
static YTQTMButton * _logos_get$YTLite$YTMainAppControlsOverlayView$ytlMuteButton(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlMuteButton);
}
static void _logos_set$YTLite$YTMainAppControlsOverlayView$ytlMuteButton(id self, SEL _cmd, YTQTMButton * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlMuteButton, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static char _logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlLockButton;
static YTQTMButton * _logos_get$YTLite$YTMainAppControlsOverlayView$ytlLockButton(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlLockButton);
}
static void _logos_set$YTLite$YTMainAppControlsOverlayView$ytlLockButton(id self, SEL _cmd, YTQTMButton * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlLockButton, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static char _logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlSleepButton;
static YTQTMButton * _logos_get$YTLite$YTMainAppControlsOverlayView$ytlSleepButton(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlSleepButton);
}
static void _logos_set$YTLite$YTMainAppControlsOverlayView$ytlSleepButton(id self, SEL _cmd, YTQTMButton * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlSleepButton, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static char _logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlDiscordButton;
static YTQTMButton * _logos_get$YTLite$YTMainAppControlsOverlayView$ytlDiscordButton(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlDiscordButton);
}
static void _logos_set$YTLite$YTMainAppControlsOverlayView$ytlDiscordButton(id self, SEL _cmd, YTQTMButton * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlDiscordButton, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static char _logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlSbButton;
static YTQTMButton * _logos_get$YTLite$YTMainAppControlsOverlayView$ytlSbButton(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlSbButton);
}
static void _logos_set$YTLite$YTMainAppControlsOverlayView$ytlSbButton(id self, SEL _cmd, YTQTMButton * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlSbButton, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static char _logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlButtonsTopAnchor;
static NSLayoutConstraint * _logos_get$YTLite$YTMainAppControlsOverlayView$ytlButtonsTopAnchor(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlButtonsTopAnchor);
}
static void _logos_set$YTLite$YTMainAppControlsOverlayView$ytlButtonsTopAnchor(id self, SEL _cmd, NSLayoutConstraint * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlButtonsTopAnchor, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static char _logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlButtonsTrailingAnchor;
static NSLayoutConstraint * _logos_get$YTLite$YTMainAppControlsOverlayView$ytlButtonsTrailingAnchor(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlButtonsTrailingAnchor);
}
static void _logos_set$YTLite$YTMainAppControlsOverlayView$ytlButtonsTrailingAnchor(id self, SEL _cmd, NSLayoutConstraint * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlButtonsTrailingAnchor, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static char _logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlButtonsFSTopAnchor;
static NSLayoutConstraint * _logos_get$YTLite$YTMainAppControlsOverlayView$ytlButtonsFSTopAnchor(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlButtonsFSTopAnchor);
}
static void _logos_set$YTLite$YTMainAppControlsOverlayView$ytlButtonsFSTopAnchor(id self, SEL _cmd, NSLayoutConstraint * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlButtonsFSTopAnchor, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static char _logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlButtonsFSTrailingAnchor;
static NSLayoutConstraint * _logos_get$YTLite$YTMainAppControlsOverlayView$ytlButtonsFSTrailingAnchor(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlButtonsFSTrailingAnchor);
}
static void _logos_set$YTLite$YTMainAppControlsOverlayView$ytlButtonsFSTrailingAnchor(id self, SEL _cmd, NSLayoutConstraint * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTMainAppControlsOverlayView$ytlButtonsFSTrailingAnchor, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static id (*_logos_orig$YTLite_YTMainAppControlsOverlayView_41)(id self, SEL _cmd, id delegate);
static id _logos_method$YTLite_YTMainAppControlsOverlayView_41(id self, SEL _cmd, id delegate) {
    self = _logos_orig$YTLite_YTMainAppControlsOverlayView_41(self, _cmd, delegate);
    if (self) {
        YTQTMButton *minusBtn = [YTLHelper createYTQTMButton:self accessibilityLabel:@"SpeedMinus" buttonLabel:nil icon:[UIImage systemImageNamed:@"minus"] selector:@selector(speedValueMinus:)];
        [self setSpeedMinus:minusBtn];

        NSString *rateStr = [NSString stringWithFormat:@"%.2fx", [YTPSpeedMaster currentPlaybackRate]];
        YTQTMButton *valBtn = [YTLHelper createYTQTMButton:self accessibilityLabel:@"SpeedButton" buttonLabel:rateStr icon:nil selector:@selector(resetSpeedValue:)];
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(showSpeedControl:)];
        longPress.minimumPressDuration = 0.4;
        [valBtn addGestureRecognizer:longPress];
        [self setSpeedValue:valBtn];

        YTQTMButton *plusBtn = [YTLHelper createYTQTMButton:self accessibilityLabel:@"SpeedPlus" buttonLabel:nil icon:[UIImage systemImageNamed:@"plus"] selector:@selector(speedValuePlus:)];
        [self setSpeedPlus:plusBtn];

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(speedDidChange:) name:@"YTPSpeedDidChange" object:nil];

        UIStackView *speedStack = [[UIStackView alloc] initWithArrangedSubviews:@[minusBtn, valBtn, plusBtn]];
        speedStack.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        speedStack.axis = UILayoutConstraintAxisHorizontal;
        speedStack.distribution = UIStackViewDistributionFillEqually;
        speedStack.alignment = UIStackViewAlignmentCenter;
        speedStack.clipsToBounds = YES;
        speedStack.layer.cornerRadius = 16.0;
        speedStack.translatesAutoresizingMaskIntoConstraints = NO;
        [self setSpeedControls:speedStack];
        [self addSubview:speedStack];
    }
    return self;

}

static void (*_logos_orig$YTLite_YTMainAppControlsOverlayView_42)(id self, SEL _cmd);
static void _logos_method$YTLite_YTMainAppControlsOverlayView_42(id self, SEL _cmd) {
    _logos_orig$YTLite_YTMainAppControlsOverlayView_42(self, _cmd);
    if (YTLBool(@"hideOverlayTitle")) {
        [[self valueForKey:@"titleView"] setAlpha:0.0];
    }
    [[self speedControls] setHidden:!YTLBool(@"speedControls")];

}

static void _logos_method$YTLite_YTMainAppControlsOverlayView_43(id self, SEL _cmd, UIButton * sender) {
    [[self valueForKey:@"eventsDelegate"] performSelector:@selector(resetAutoHideTimer)];
    id playerVC = [[self _viewControllerForAncestor] valueForKey:@"parentViewController"];
    double cur = [YTPSpeedMaster playbackRateForPlayer:playerVC];
    [YTPSpeedMaster setPlaybackRate:MAX(0.25, cur - 0.25) forPlayer:playerVC];

}

static void _logos_method$YTLite_YTMainAppControlsOverlayView_44(id self, SEL _cmd, UIButton * sender) {
    [[self valueForKey:@"eventsDelegate"] performSelector:@selector(resetAutoHideTimer)];
    id playerVC = [[self _viewControllerForAncestor] valueForKey:@"parentViewController"];
    double cur = [YTPSpeedMaster playbackRateForPlayer:playerVC];
    [YTPSpeedMaster setPlaybackRate:MIN(10.0, cur + 0.25) forPlayer:playerVC];

}

static void _logos_method$YTLite_YTMainAppControlsOverlayView_45(id self, SEL _cmd, UIButton * sender) {
    [[self valueForKey:@"eventsDelegate"] performSelector:@selector(resetAutoHideTimer)];
    id playerVC = [[self _viewControllerForAncestor] valueForKey:@"parentViewController"];
    [YTPSpeedMaster setPlaybackRate:1.0 forPlayer:playerVC];
    [[self speedValue] setTitle:@"1x" forState:UIControlStateNormal];

}

static void _logos_method$YTLite_YTMainAppControlsOverlayView_46(id self, SEL _cmd, NSNotification * note) {
    float val = [note.object floatValue];
    [[self speedValue] setTitle:[NSString stringWithFormat:@"%@x", @(val)] forState:UIControlStateNormal];

}

static void _logos_method$YTLite_YTMainAppControlsOverlayView_47(id self, SEL _cmd, UILongPressGestureRecognizer * gesture) {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        [[YTPSpeedPopupController speedController] presentFromViewController:[self _viewControllerForAncestor]];
    }

}

static void _logos_method$YTLite_YTMainAppControlsOverlayView_48(id self, SEL _cmd, UIButton * sender) {
    UIViewController *vc = [self _viewControllerForAncestor];
    id playerVC = [vc valueForKey:@"parentViewController"];
    [DownloadMenuHelper showDownloadSheet:playerVC withSender:sender];

}

static void _logos_method$YTLite_YTMainAppControlsOverlayView_49(id self, SEL _cmd, UIButton * sender) {
    UIViewController *vc = [self _viewControllerForAncestor];
    id playerVC = [vc valueForKey:@"parentViewController"];
    id activeVideo = [playerVC valueForKey:@"activeVideo"];
    BOOL muted = ![[activeVideo valueForKey:@"isMuted"] boolValue];
    [activeVideo setValue:@(muted) forKey:@"muted"];

}

static void _logos_method$YTLite_YTMainAppControlsOverlayView_50(id self, SEL _cmd, UIButton * sender) {
    UIViewController *vc = [self _viewControllerForAncestor];
    id lockCtrl = [[vc valueForKey:@"eventsDelegate"] valueForKey:@"lockModeStateEntityController"];
    [lockCtrl performSelector:@selector(lockModeDidRequestShowFullscreen)];

}

static void _logos_method$YTLite_YTMainAppControlsOverlayView_51(id self, SEL _cmd, UIButton * sender) {
    [[YTPSleepTimer sharedTimer] showOptions:sender];

}

static void _logos_method$YTLite_YTMainAppControlsOverlayView_52(id self, SEL _cmd, UIButton * sender) {

}

static void (*_logos_orig$YTLite_YTMainAppControlsOverlayView_53)(id self, SEL _cmd, id renderer);
static void _logos_method$YTLite_YTMainAppControlsOverlayView_53(id self, SEL _cmd, id renderer) {
    if (YTLBool(@"hideAutoplay")) return;
    _logos_orig$YTLite_YTMainAppControlsOverlayView_53(self, _cmd, renderer);

}

static void (*_logos_orig$YTLite_YTMainAppControlsOverlayView_54)(id self, SEL _cmd, BOOL available);
static void _logos_method$YTLite_YTMainAppControlsOverlayView_54(id self, SEL _cmd, BOOL available) {
    if (YTLBool(@"hideSubs")) { _logos_orig$YTLite_YTMainAppControlsOverlayView_54(self, _cmd, NO); return; }
    _logos_orig$YTLite_YTMainAppControlsOverlayView_54(self, _cmd, available);

}

static void (*_logos_orig$YTLite_YTMainAppControlsOverlayView_55)(id self, SEL _cmd, BOOL visible);
static void _logos_method$YTLite_YTMainAppControlsOverlayView_55(id self, SEL _cmd, BOOL visible) {
    _logos_orig$YTLite_YTMainAppControlsOverlayView_55(self, _cmd, visible);
    CGFloat alpha = visible ? 1.0 : 0.0;
    [[self ytlButtons] setAlpha:alpha];
    [[self speedControls] setAlpha:alpha];
    if (visible && YTLBool(@"pauseOnOverlay")) {
        id playerVC = [[self _viewControllerForAncestor] valueForKey:@"parentViewController"];
        if ([playerVC isKindOfClass:objc_getClass("YTPlayerViewController")]) {
            [playerVC performSelector:@selector(pause)];
        }
    }

}

static id (*_logos_orig$YTLite_YTMainAppControlsOverlayView_56)(id self, SEL _cmd);
static id _logos_method$YTLite_YTMainAppControlsOverlayView_56(id self, SEL _cmd) {
    if (YTLBool(@"noCast")) {
        [self setValue:nil forKey:@"_playbackRouteButton"];
        return nil;
    }
    return _logos_orig$YTLite_YTMainAppControlsOverlayView_56(self, _cmd);

}

static void (*_logos_orig$YTLite_YTMainAppControlsOverlayView_57)(id self, SEL _cmd);
static void _logos_method$YTLite_YTMainAppControlsOverlayView_57(id self, SEL _cmd) {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    _logos_orig$YTLite_YTMainAppControlsOverlayView_57(self, _cmd);

}


- (void)setExpanded:(BOOL)expanded { %orig; }

// MARK: - OLED Dark Theme & Keyboard

+ (UIColor *)black0 { return YTLBool(@"oledTheme") ? [UIColor blackColor] : %orig; }
+ (UIColor *)black1 { return YTLBool(@"oledTheme") ? [UIColor blackColor] : %orig; }
+ (UIColor *)black2 { return YTLBool(@"oledTheme") ? [UIColor blackColor] : %orig; }
+ (UIColor *)black3 { return YTLBool(@"oledTheme") ? [UIColor blackColor] : %orig; }
+ (UIColor *)black4 { return YTLBool(@"oledTheme") ? [UIColor blackColor] : %orig; }

static UIColor * _logos_method$YTLite_YTColor_58(id self, SEL _cmd, NSInteger style) {
    return [[UIColor labelColor] colorWithAlphaComponent:0.1];

}

static void (*_logos_orig$YTLite_UIView_59)(id self, SEL _cmd, UIColor * color);
static void _logos_method$YTLite_UIView_59(id self, SEL _cmd, UIColor * color) {
    if (YTLBool(@"oledTheme")) {
        color = [YTPMedia oledForColor:color];
    }
    _logos_orig$YTLite_UIView_59(self, _cmd, color);

}

static void (*_logos_orig$YTLite_GOODimmingBackgroundView_60)(id self, SEL _cmd);
static void _logos_method$YTLite_GOODimmingBackgroundView_60(id self, SEL _cmd) {
    _logos_orig$YTLite_GOODimmingBackgroundView_60(self, _cmd);
    if (YTLBool(@"oledTheme")) {
        self.backgroundColor = [UIColor blackColor];
    }

}

static void (*_logos_orig$YTLite_UIKeyboard_61)(id self, SEL _cmd, CALayer * layer);
static void _logos_method$YTLite_UIKeyboard_61(id self, SEL _cmd, CALayer * layer) {
    _logos_orig$YTLite_UIKeyboard_61(self, _cmd, layer);
    if (YTLBool(@"oledKeyboard")) self.backgroundColor = [UIColor blackColor];

}

static id (*_logos_orig$YTLite_UIPredictionViewController_62)(id self, SEL _cmd);
static id _logos_method$YTLite_UIPredictionViewController_62(id self, SEL _cmd) {
    if (YTLBool(@"oledKeyboard")) self.view.backgroundColor = [UIColor blackColor];
    return _logos_orig$YTLite_UIPredictionViewController_62(self, _cmd);

}

static void (*_logos_orig$YTLite_UIKeyboardDockView_63)(id self, SEL _cmd);
static void _logos_method$YTLite_UIKeyboardDockView_63(id self, SEL _cmd) {
    _logos_orig$YTLite_UIKeyboardDockView_63(self, _cmd);
    if (YTLBool(@"oledKeyboard")) self.backgroundColor = [UIColor blackColor];

}

static void (*_logos_orig$YTLite_UIInputView_64)(id self, SEL _cmd);
static void _logos_method$YTLite_UIInputView_64(id self, SEL _cmd) {
    _logos_orig$YTLite_UIInputView_64(self, _cmd);
    if (YTLBool(@"oledKeyboard")) self.backgroundColor = [UIColor blackColor];

}

static void (*_logos_orig$YTLite_UIKBVisualEffectView_65)(id self, SEL _cmd);
static void _logos_method$YTLite_UIKBVisualEffectView_65(id self, SEL _cmd) {
    _logos_orig$YTLite_UIKBVisualEffectView_65(self, _cmd);
    if (YTLBool(@"oledKeyboard")) self.backgroundColor = [UIColor blackColor];

}

// MARK: - Inline Muted Playback (Feed Player)

- (NSInteger)audioControlUIStyle { return (YTLBool(@"downloadManager") || YTLBool(@"sponsorBlock")) ? 1 : %orig; }
- (NSInteger)scrubbingUIStyle { return (YTLBool(@"downloadManager") || YTLBool(@"sponsorBlock")) ? 1 : %orig; }
- (void)updateAudioControlUIStyle:(NSInteger)style { %orig((YTLBool(@"downloadManager") || YTLBool(@"sponsorBlock")) ? 1 : style); }
- (void)resetWithAudioControlUIStyle:(NSInteger)style { %orig((YTLBool(@"downloadManager") || YTLBool(@"sponsorBlock")) ? 1 : style); }
- (void)setAudioControlUIStyle:(NSInteger)style { %orig((YTLBool(@"downloadManager") || YTLBool(@"sponsorBlock")) ? 1 : style); }


static NSInteger (*_logos_orig$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_66)(id self, SEL _cmd);
static NSInteger _logos_method$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_66(id self, SEL _cmd) {
    return (YTLBool(@"downloadManager") || YTLBool(@"sponsorBlock")) ? 1 : _logos_orig$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_66(self, _cmd);

}

static void (*_logos_orig$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_67)(id self, SEL _cmd, id data);
static void _logos_method$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_67(id self, SEL _cmd, id data) {
    if (YTLBool(@"noPromotionCards")) return;
    _logos_orig$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_67(self, _cmd, data);

}

static void (*_logos_orig$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_68)(id self, SEL _cmd);
static void _logos_method$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_68(id self, SEL _cmd) {
    _logos_orig$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_68(self, _cmd);
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleHorizontalPan:)];
    pan.minimumNumberOfTouches = 1;
    pan.maximumNumberOfTouches = 1;
    pan.delegate = (id<UIGestureRecognizerDelegate>)self;
    [self.view addGestureRecognizer:pan];

}

static BOOL _logos_method$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_69(id self, SEL _cmd, UIPanGestureRecognizer * gesture) {
    if (!YTLBool(@"seekAnywhereFeed")) return NO;
    CGPoint vel = [gesture velocityInView:self.view];
    return fabs(vel.x) > fabs(vel.y);

}

static BOOL _logos_method$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_70(id self, SEL _cmd, UIGestureRecognizer * g1, UIGestureRecognizer * g2) {
    return NO;

}

static void _logos_method$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_71(id self, SEL _cmd, UIPanGestureRecognizer * gesture) {

}



static char _logos_prop_key$YTLite$YTInlineMutedPlaybackAudioIconViewController$ytlButton;
static YTQTMButton * _logos_get$YTLite$YTInlineMutedPlaybackAudioIconViewController$ytlButton(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTInlineMutedPlaybackAudioIconViewController$ytlButton);
}
static void _logos_set$YTLite$YTInlineMutedPlaybackAudioIconViewController$ytlButton(id self, SEL _cmd, YTQTMButton * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTInlineMutedPlaybackAudioIconViewController$ytlButton, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static char _logos_prop_key$YTLite$YTInlineMutedPlaybackAudioIconViewController$ytlIcon;
static UIView * _logos_get$YTLite$YTInlineMutedPlaybackAudioIconViewController$ytlIcon(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTInlineMutedPlaybackAudioIconViewController$ytlIcon);
}
static void _logos_set$YTLite$YTInlineMutedPlaybackAudioIconViewController$ytlIcon(id self, SEL _cmd, UIView * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTInlineMutedPlaybackAudioIconViewController$ytlIcon, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static void (*_logos_orig$YTLite_YTInlineMutedPlaybackAudioIconViewController_72)(id self, SEL _cmd);
static void _logos_method$YTLite_YTInlineMutedPlaybackAudioIconViewController_72(id self, SEL _cmd) {
    _logos_orig$YTLite_YTInlineMutedPlaybackAudioIconViewController_72(self, _cmd);

}


- (void)updateColors { %orig; }

// MARK: - Shorts Overlay & Player

- (void)layoutSubviews { %orig; }
static void _logos_method$YTLite_YTReelWatchPlaybackOverlayViewSub_73(id self, SEL _cmd, UIButton * sender) {
    id responder = [self valueForKey:@"parentResponder"];
    if ([responder isKindOfClass:objc_getClass("YTReelPlayerViewController")]) {
        [DownloadMenuHelper showDownloadSheetShorts:[responder valueForKey:@"player"] withSender:sender];
    }

}

- (void)layoutSubviews { %orig; }
- (void)setActionBarElementRenderer:(id)renderer { %orig; }
- (void)setReelLikeButton:(id)button { %orig; }
static void _logos_method$YTLite_YTReelWatchPlaybackOverlayView_74(id self, SEL _cmd, UIButton * sender) {
    id responder = [self valueForKey:@"parentResponder"];
    if ([responder isKindOfClass:objc_getClass("YTReelPlayerViewController")]) {
        [DownloadMenuHelper showDownloadSheetShorts:[responder valueForKey:@"player"] withSender:sender];
    }

}

- (void)layoutSubviews { %orig; }
static void _logos_method$YTLite_YTInlineMutedPlaybackShortsPlayerOverlayView_75(id self, SEL _cmd, UIButton * sender) {
    id responder = [self valueForKey:@"parentResponder"];
    if ([responder isKindOfClass:objc_getClass("YTPlayerViewController")]) {
        [DownloadMenuHelper showDownloadSheetShorts:responder withSender:sender];
    }

}

- (void)setCanReorder:(BOOL)canReorder { %orig(YES); }

static void (*_logos_orig$YTLite_YTVideoFreeZoomOverlayController_76)(id self, SEL _cmd, id view, BOOL twoFinger);
static void _logos_method$YTLite_YTVideoFreeZoomOverlayController_76(id self, SEL _cmd, id view, BOOL twoFinger) {
    if (YTLBool(@"noFreeZoom")) return;
    _logos_orig$YTLite_YTVideoFreeZoomOverlayController_76(self, _cmd, view, twoFinger);

}

- (BOOL)isCinematicLightingAvailable { return YTLBool(@"disableAmbientMode") ? NO : %orig; }

// MARK: - Main Video Player Overlay


static void (*_logos_orig$YTLite_YTMainAppVideoPlayerOverlayView_77)(id self, SEL _cmd, BOOL visible, BOOL gradient);
static void _logos_method$YTLite_YTMainAppVideoPlayerOverlayView_77(id self, SEL _cmd, BOOL visible, BOOL gradient) {
    if (YTLBool(@"noDarkBg")) { _logos_orig$YTLite_YTMainAppVideoPlayerOverlayView_77(self, _cmd, NO, NO); return; }
    _logos_orig$YTLite_YTMainAppVideoPlayerOverlayView_77(self, _cmd, visible, gradient);

}

- (id)autonavPreviewView { return YTLBool(@"autonavEndScreenCards") ? nil : %orig; }
- (BOOL)isWatermarkEnabled { return YTLBool(@"noWatermarks") ? NO : %orig; }
- (id)featuredChannelWatermarkImageView { return YTLBool(@"noWatermarks") ? nil : %orig; }

static void (*_logos_orig$YTLite_YTMainAppVideoPlayerOverlayView_78)(id self, SEL _cmd, id gesture);
static void _logos_method$YTLite_YTMainAppVideoPlayerOverlayView_78(id self, SEL _cmd, id gesture) {
    _logos_orig$YTLite_YTMainAppVideoPlayerOverlayView_78(self, _cmd, gesture);
    if (YTLInt(@"speedIndex") > 0) {
        UILongPressGestureRecognizer *lp = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(speedmasterYtLite:)];
        lp.minimumPressDuration = 0.25;
        [self addGestureRecognizer:lp];
    }

}

static void _logos_method$YTLite_YTMainAppVideoPlayerOverlayView_79(id self, SEL _cmd, UILongPressGestureRecognizer * gesture) {
    [[YTPSpeedMaster sharedMaster] manageSpeedMaster:gesture playerOverlayVC:[self valueForKey:@"delegate"]];

}


- (void)setHidden:(BOOL)hidden { %orig(YTLBool(@"endScreenCards") ? YES : hidden); }


- (BOOL)shouldShowAutonavEndscreen { return YTLBool(@"autonavEndScreenCards") ? NO : %orig; }
- (void)setFeaturedChannelWatermarkImageView:(id)view { if (!YTLBool(@"noWatermarks")) %orig; }

static void (*_logos_orig$YTLite_YTMainAppVideoPlayerOverlayViewController_80)(id self, SEL _cmd, id provider, id overlay);
static void _logos_method$YTLite_YTMainAppVideoPlayerOverlayViewController_80(id self, SEL _cmd, id provider, id overlay) {
    NSString *ident = [overlay valueForKey:@"overlayIdentifier"];
    if ((YTLBool(@"noPromotionCards") && ([ident isEqualToString:@"player_overlay_paid_content"] || [ident isEqualToString:@"player_overlay_product_in_video"])) ||
        (YTLBool(@"noAds") && [ident isEqualToString:@"player_overlay_product_in_video"])) {
        return;
    }
    _logos_orig$YTLite_YTMainAppVideoPlayerOverlayViewController_80(self, _cmd, provider, overlay);

}

static NSString * (*_logos_orig$YTLite_YTMainAppVideoPlayerOverlayViewController_81)(id self, SEL _cmd);
static NSString * _logos_method$YTLite_YTMainAppVideoPlayerOverlayViewController_81(id self, SEL _cmd) {
    return [NSString stringWithFormat:@"%@x", @([YTPSpeedMaster currentPlaybackRate])];

}

- (BOOL)allowDoubleTapToSeekGestureRecognizer { return YTLBool(@"noDoubleTapToSeek") ? NO : %orig; }
- (BOOL)allowTwoFingerDoubleTapGestureRecognizer { return YTLBool(@"noTwoFingerSnapToChapter") ? NO : %orig; }

static void (*_logos_orig$YTLite_YTMainAppVideoPlayerOverlayViewController_82)(id self, SEL _cmd, id sender);
static void _logos_method$YTLite_YTMainAppVideoPlayerOverlayViewController_82(id self, SEL _cmd, id sender) {
    _logos_orig$YTLite_YTMainAppVideoPlayerOverlayViewController_82(self, _cmd, sender);
    if (YTLBool(@"copyWithTimestamp")) {
        NSInteger sec = (NSInteger)[[self valueForKey:@"mediaTime"] doubleValue];
        NSString *vid = [self valueForKey:@"videoID"];
        if (vid) {
            [UIPasteboard generalPasteboard].string = [NSString stringWithFormat:@"https://www.youtube.com/watch?v=%@&t=%lds", vid, (long)sec];
        }
    }

}

static void (*_logos_orig$YTLite_YTMainAppVideoPlayerOverlayViewController_83)(id self, SEL _cmd, NSInteger mode);
static void _logos_method$YTLite_YTMainAppVideoPlayerOverlayViewController_83(id self, SEL _cmd, NSInteger mode) {
    _logos_orig$YTLite_YTMainAppVideoPlayerOverlayViewController_83(self, _cmd, mode);
    [[YTLUserDefaults standardUserDefaults] setInteger:mode forKey:@"loopMode"];

}

static void (*_logos_orig$YTLite_YTMainAppVideoPlayerOverlayViewController_84)(id self, SEL _cmd);
static void _logos_method$YTLite_YTMainAppVideoPlayerOverlayViewController_84(id self, SEL _cmd) {
    _logos_orig$YTLite_YTMainAppVideoPlayerOverlayViewController_84(self, _cmd);
    UITapGestureRecognizer *twoFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTwoFingerTap:)];
    twoFingerTap.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:twoFingerTap];

    UIPanGestureRecognizer *fingerPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleFingerPan:)];
    fingerPan.minimumNumberOfTouches = 1;
    fingerPan.maximumNumberOfTouches = 1;
    fingerPan.delegate = (id<UIGestureRecognizerDelegate>)self;
    [self.view addGestureRecognizer:fingerPan];

}

static void _logos_method$YTLite_YTMainAppVideoPlayerOverlayViewController_85(id self, SEL _cmd, UITapGestureRecognizer * gesture) {
    if (YTLBool(@"twoFingerTap")) {
        [self performSelector:@selector(didTogglePlayPause)];
    }

}

static BOOL _logos_method$YTLite_YTMainAppVideoPlayerOverlayViewController_86(id self, SEL _cmd, UIGestureRecognizer * gesture) {
    return YES;

}

static void _logos_method$YTLite_YTMainAppVideoPlayerOverlayViewController_87(id self, SEL _cmd, UIPanGestureRecognizer * gesture) {

}


// MARK: - Fullscreen Actions & Inline Player Bar

- (BOOL)enabled { return YTLBool(@"noFullscreenActions") ? NO : %orig; }
- (void)setEnabled:(BOOL)enabled { %orig(YTLBool(@"noFullscreenActions") ? NO : enabled); }
- (void)layoutSubviews { %orig; }

- (void)setRelatedVideosVisible:(BOOL)visible { %orig(YTLBool(@"noRelatedVids") ? NO : visible); }


static char _logos_prop_key$YTLite$YTInlinePlayerBarContainerView$endTimeString;
static NSString * _logos_get$YTLite$YTInlinePlayerBarContainerView$endTimeString(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTInlinePlayerBarContainerView$endTimeString);
}
static void _logos_set$YTLite$YTInlinePlayerBarContainerView$endTimeString(id self, SEL _cmd, NSString * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTInlinePlayerBarContainerView$endTimeString, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static void (*_logos_orig$YTLite_YTInlinePlayerBarContainerView_88)(id self, SEL _cmd, CGFloat alpha);
static void _logos_method$YTLite_YTInlinePlayerBarContainerView_88(id self, SEL _cmd, CGFloat alpha) {
    _logos_orig$YTLite_YTInlinePlayerBarContainerView_88(self, _cmd, YTLBool(@"persistentProgressBar") ? 1.0 : alpha);

}

static void (*_logos_orig$YTLite_YTInlinePlayerBarContainerView_89)(id self, SEL _cmd, CGRect frame);
static void _logos_method$YTLite_YTInlinePlayerBarContainerView_89(id self, SEL _cmd, CGRect frame) {
    _logos_orig$YTLite_YTInlinePlayerBarContainerView_89(self, _cmd, frame);

}

static UIColor * (*_logos_orig$YTLite_YTInlinePlayerBarContainerView_90)(id self, SEL _cmd);
static UIColor * _logos_method$YTLite_YTInlinePlayerBarContainerView_90(id self, SEL _cmd) {
    if (YTLInt(@"progressBarIndex") > 0) {
        NSData *data = [[YTLUserDefaults standardUserDefaults] objectForKey:@"progressMainColor"];
        if (data) {
            UIColor *c = [NSKeyedUnarchiver unarchivedObjectOfClass:[UIColor class] fromData:data error:nil];
            if (c) return c;
        }
    }
    return _logos_orig$YTLite_YTInlinePlayerBarContainerView_90(self, _cmd);

}

static void (*_logos_orig$YTLite_YTInlinePlayerBarContainerView_91)(id self, SEL _cmd, id sender);
static void _logos_method$YTLite_YTInlinePlayerBarContainerView_91(id self, SEL _cmd, id sender) {
    _logos_orig$YTLite_YTInlinePlayerBarContainerView_91(self, _cmd, sender);

}


- (void)loadFeaturedChannelWatermark { if (!YTLBool(@"noWatermarks")) %orig; }

- (void)updateMiniBarPlayerStateFromRenderer { %orig; }

- (void)updateMiniBarPlayerStateFromRenderer { %orig; }

- (void)setStartPlayback:(BOOL)start { %orig(YTLBool(@"disableAutoplay") ? NO : start); }

static void (*_logos_orig$YTLite_YTPlayabilityResolutionUserActionUIController_92)(id self, SEL _cmd);
static void _logos_method$YTLite_YTPlayabilityResolutionUserActionUIController_92(id self, SEL _cmd) {
    if (YTLBool(@"noContentWarning")) {
        [self performSelector:@selector(confirmAlertDidPressConfirm)];
        return;
    }
    _logos_orig$YTLite_YTPlayabilityResolutionUserActionUIController_92(self, _cmd);

}

- (BOOL)enableQuickMenuVideoQualitySettings { return NO; }
- (BOOL)omitAdvancedMenuOptionForAirPlay { return NO; }

static char _logos_prop_key$YTLite$YTVideoQualitySwitchOriginalController$redesignedController;
static id _logos_get$YTLite$YTVideoQualitySwitchOriginalController$redesignedController(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$YTVideoQualitySwitchOriginalController$redesignedController);
}
static void _logos_set$YTLite$YTVideoQualitySwitchOriginalController$redesignedController(id self, SEL _cmd, id val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$YTVideoQualitySwitchOriginalController$redesignedController, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setUserSelectableFormats:(id)formats { %orig; }
- (void)dealloc { [self setRedesignedController:nil]; %orig; }

- (void)dealloc { %orig; }

// MARK: - Progress Bar Custom Coloring & Gradients

static UIView * (*_logos_orig$YTLite_YTPlayerBarScrubberDotDecorationView_93)(id self, SEL _cmd);
static UIView * _logos_method$YTLite_YTPlayerBarScrubberDotDecorationView_93(id self, SEL _cmd) {
    UIView *dot = _logos_orig$YTLite_YTPlayerBarScrubberDotDecorationView_93(self, _cmd);
    if (YTLInt(@"progressBarIndex") > 0) {
        NSData *data = [[YTLUserDefaults standardUserDefaults] objectForKey:@"scrubberColor"];
        if (data) {
            UIColor *c = [NSKeyedUnarchiver unarchivedObjectOfClass:[UIColor class] fromData:data error:nil];
            if (c) dot.backgroundColor = c;
        }
    }
    return dot;

}

static UIView * (*_logos_orig$YTLite_YTPlayerBarScrubberDotDecorationViewV1_94)(id self, SEL _cmd);
static UIView * _logos_method$YTLite_YTPlayerBarScrubberDotDecorationViewV1_94(id self, SEL _cmd) {
    UIView *dot = _logos_orig$YTLite_YTPlayerBarScrubberDotDecorationViewV1_94(self, _cmd);
    if (YTLInt(@"progressBarIndex") > 0) {
        NSData *data = [[YTLUserDefaults standardUserDefaults] objectForKey:@"scrubberColor"];
        if (data) {
            UIColor *c = [NSKeyedUnarchiver unarchivedObjectOfClass:[UIColor class] fromData:data error:nil];
            if (c) dot.backgroundColor = c;
        }
    }
    return dot;

}

- (void)layoutSubviews { %orig; }

- (UIImage *)currentMinimumTrackImage { return %orig; }

- (void)willDrawInContext:(id)ctx drawParameters:(id)params { %orig; }

- (void)setProgressBarColor:(UIColor *)color { %orig; }

- (void)setProgress:(CGFloat)progress { %orig; }

// MARK: - Shorts Filtering & Data Sources

+ (id)makeContentModelForEntry:(id)entry { return %orig; }

- (id)makeContentModelForEntry:(id)entry { return %orig; }

- (id)makeContentModelForEntry:(id)entry { return %orig; }
- (id)reels { return %orig; }

static char _logos_prop_key$YTLite$ASDisplayNode$copiedComment;
static NSString * _logos_get$YTLite$ASDisplayNode$copiedComment(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$ASDisplayNode$copiedComment);
}
static void _logos_set$YTLite$ASDisplayNode$copiedComment(id self, SEL _cmd, NSString * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$ASDisplayNode$copiedComment, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
static char _logos_prop_key$YTLite$ASDisplayNode$copiedURL;
static NSURL * _logos_get$YTLite$ASDisplayNode$copiedURL(id self, SEL _cmd) {
    return objc_getAssociatedObject(self, &_logos_prop_key$YTLite$ASDisplayNode$copiedURL);
}
static void _logos_set$YTLite$ASDisplayNode$copiedURL(id self, SEL _cmd, NSURL * val) {
    objc_setAssociatedObject(self, &_logos_prop_key$YTLite$ASDisplayNode$copiedURL, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setYogaChildren:(id)children { %orig; }
- (void)dealloc { %orig; }
- (void)setFrame:(CGRect)frame { %orig; }

- (id)node { return %orig; }

- (void)playbackControllerDidFinishPlaybackAndWillTransitionInternallyToNextPlayback:(id)next { %orig; }
- (void)maybeLoopPlayback { %orig; }
- (void)playbackControllerDidActivateVideo:(id)video withPlayerResponse:(id)response { %orig; }
- (void)autoQuality {}
- (BOOL)shouldEnablePlayerBar { return YTLBool(@"shortsProgress") ? YES : %orig; }
- (BOOL)shouldAlwaysEnablePlayerBar { return YTLBool(@"shortsProgress") ? YES : %orig; }
- (BOOL)shouldEnablePlayerBarOnlyOnPause { return YTLBool(@"shortsProgress") ? NO : %orig; }

// MARK: - Share URL Tracking Stripping

static void (*_logos_orig$YTLite__UIConcretePasteboard_95)(id self, SEL _cmd, NSString * string);
static void _logos_method$YTLite__UIConcretePasteboard_95(id self, SEL _cmd, NSString * string) {
    if (YTLBool(@"noShareChunk") && [string containsString:@"?si="]) {
        string = [string componentsSeparatedByString:@"?si="].firstObject;
    } else if (YTLBool(@"noShareChunk") && [string containsString:@"&si="]) {
        string = [string componentsSeparatedByString:@"&si="].firstObject;
    }
    _logos_orig$YTLite__UIConcretePasteboard_95(self, _cmd, string);

}

static NSString * (*_logos_orig$YTLite_YTIIosSystemShareEndpoint_96)(id self, SEL _cmd);
static NSString * _logos_method$YTLite_YTIIosSystemShareEndpoint_96(id self, SEL _cmd) {
    NSString *url = _logos_orig$YTLite_YTIIosSystemShareEndpoint_96(self, _cmd);
    if (YTLBool(@"noShareChunk") && [url containsString:@"?si="]) {
        return [url componentsSeparatedByString:@"?si="].firstObject;
    }
    return url;

}

// MARK: - Player Auto-Quality, Auto-Speed, Captions, Audio Track, Loop Mode


static void _logos_method$YTLite_YTPlayerViewController_97(id self, SEL _cmd) {
    if (YTLBool(@"rememberLoop")) {
        NSInteger mode = YTLInt(@"loopMode");
        id overlay = [self valueForKey:@"activeVideoPlayerOverlay"];
        if ([overlay respondsToSelector:@selector(setLoopMode:)]) {
            [overlay setLoopMode:mode];
        }
    }

}

static void _logos_method$YTLite_YTPlayerViewController_98(id self, SEL _cmd) {
    if (YTLBool(@"autoFullscreen")) {
        [[self valueForKey:@"_UIDelegate"] performSelector:@selector(showFullScreen)];
    }

}

static void _logos_method$YTLite_YTPlayerViewController_99(id self, SEL _cmd) {
    NSInteger idx = YTLInt(@"autoSpeedIndex");
    if (idx > 0) {
        NSArray *rates = @[@1.0, @0.25, @0.5, @0.75, @1.0, @1.25, @1.5, @1.75, @2.0, @2.5, @3.0, @4.0, @5.0];
        if (idx < (NSInteger)rates.count) {
            [YTPSpeedMaster setPlaybackRate:[rates[idx] floatValue] forPlayer:self];
        }
    }

}

- (void)selectCaptions {}

- (void)autoQuality {}

- (void)selectAudioTrack {}

static void (*_logos_orig$YTLite_YTPlayerViewController_100)(id self, SEL _cmd);
static void _logos_method$YTLite_YTPlayerViewController_100(id self, SEL _cmd) {
    [[YTPSleepTimer sharedTimer] cancelIfPlayerClosed];
    _logos_orig$YTLite_YTPlayerViewController_100(self, _cmd);

}


- (void)setAudioFormatConstraint:(id)constraint { %orig; }

- (BOOL)shouldExitFullScreenOnFinish { return YTLBool(@"exitFullscreen") ? YES : %orig; }

- (void)handleRemoteControlEvent:(NSInteger)event withInterval:(double)interval { %orig; }

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gesture { return %orig; }

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gesture { return %orig; }

- (void)setFrame:(CGRect)frame { %orig; }

- (BOOL)shouldShowServiceItemRenderer:(id)renderer { return %orig; }

- (void)addAction:(id)action { %orig; }

- (BOOL)shouldEnablePlayerBar { return YTLBool(@"shortsProgress") ? YES : %orig; }
- (BOOL)shouldAlwaysEnablePlayerBar { return YTLBool(@"shortsProgress") ? YES : %orig; }
- (BOOL)shouldEnablePlayerBarOnlyOnPause { return YTLBool(@"shortsProgress") ? NO : %orig; }

- (BOOL)shouldAlwaysEnablePlayerBar { return YTLBool(@"shortsProgress") ? YES : %orig; }
- (BOOL)shouldEnablePlayerBarOnlyOnPause { return YTLBool(@"shortsProgress") ? NO : %orig; }

- (BOOL)shouldShowYouTherePrompt { return NO; }

- (BOOL)enablePlayerBarForVerticalVideoWhenControlsHiddenInFullscreen { return YTLBool(@"shortsProgress") ? YES : %orig; }
- (BOOL)isPromptForLocalNetworkPermissionsEnabled { return NO; }
- (BOOL)clientInfraClientConfigIosEnableFillingEncodedHacksInnertubeContext { return NO; }
- (BOOL)enableShortsVideoQualityPicker { return YTLBool(@"shortsForceQuality") ? NO : %orig; }

- (BOOL)evaluateResumeToShorts { return YTLBool(@"hideShorts") ? NO : %orig; }

static void (*_logos_orig$YTLite_YTReelHeaderView_101)(id self, SEL _cmd, BOOL visible, BOOL animated);
static void _logos_method$YTLite_YTReelHeaderView_101(id self, SEL _cmd, BOOL visible, BOOL animated) {
    _logos_orig$YTLite_YTReelHeaderView_101(self, _cmd, YTLBool(@"hideShortsLogo") ? NO : visible, animated);

}
static void (*_logos_orig$YTLite_YTReelHeaderView_102)(id self, SEL _cmd, UIView * view, UIStackView * stackView, CGSize size);
static void _logos_method$YTLite_YTReelHeaderView_102(id self, SEL _cmd, UIView * view, UIStackView * stackView, CGSize size) {
    _logos_orig$YTLite_YTReelHeaderView_102(self, _cmd, view, stackView, size);

}

- (void)setChannelBarElementRenderer:(id)r { if (!YTLBool(@"hideShortsChannelName")) %orig; }
- (void)setHeaderRenderer:(id)r { if (!YTLBool(@"hideShortsDescription")) %orig; }
- (void)setShortsVideoTitleElementRenderer:(id)r { if (!YTLBool(@"hideShortsDescription")) %orig; }
- (void)setSoundMetadataElementRenderer:(id)r { if (!YTLBool(@"hideShortsAudioTrack")) %orig; }
- (void)setActionElement:(id)r { if (!YTLBool(@"hideShortsPromoCards")) %orig; }
- (void)setBadgeRenderer:(id)r { if (!YTLBool(@"hideShortsThanks")) %orig; }
- (void)setMultiFormatLinkElementRenderer:(id)r { if (!YTLBool(@"hideShortsSource")) %orig; }

- (void)layoutSubviews { %orig; }

- (void)didPinch:(UIPinchGestureRecognizer *)pinch { %orig; }

- (void)setPlaybackView:(id)view { %orig; }
- (void)reelSpeedmaster:(UILongPressGestureRecognizer *)gesture {}
- (void)dealloc { %orig; }
static void _logos_method$YTLite_YTReelContentView_103(id self, SEL _cmd, UILongPressGestureRecognizer * gesture) {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        [[YTLUserDefaults standardUserDefaults] setBool:NO forKey:@"shortsOnlyMode"];
        [[[UIApplication sharedApplication].delegate window].rootViewController performSelector:@selector(showPivotBar)];
    }

}

- (BOOL)skipFilterPreferredVideoFormats { return YES; }
- (BOOL)fallbackOnError { return NO; }
- (void)setFallbackOnError:(BOOL)arg1 { %orig(NO); }
- (BOOL)useReloadContextForFallback { return NO; }
- (void)setUseReloadContextForFallback:(BOOL)arg1 { %orig(NO); }
- (NSInteger)maxFallbackAttempts { return 0; }

- (NSInteger)maxFallbackAttempts { return %orig; }

- (CGSize)sizeForElement:(id)element { return %orig; }

- (UIButton *)navigationButton { return %orig; }
static void (*_logos_orig$YTLite_YTPivotBarItemView_104)(id self, SEL _cmd, id renderer);
static void _logos_method$YTLite_YTPivotBarItemView_104(id self, SEL _cmd, id renderer) {
    _logos_orig$YTLite_YTPivotBarItemView_104(self, _cmd, renderer);
    if (YTLBool(@"removeLabels")) {
        [[self navigationButton] setTitle:@"" forState:UIControlStateNormal];
    }

}
static void (*_logos_orig$YTLite_YTPivotBarItemView_105)(id self, SEL _cmd);
static void _logos_method$YTLite_YTPivotBarItemView_105(id self, SEL _cmd) {
    _logos_orig$YTLite_YTPivotBarItemView_105(self, _cmd);
    if (YTLBool(@"removeIndicators")) {
        [[self valueForKey:@"indicatorDot"] setAlpha:0.0];
    }

}

- (void)handleResponse:(id)resp withCompletion:(id)comp { %orig; }
- (void)handleResponse:(id)resp error:(id)err completion:(id)comp { %orig; }

- (void)handleResponse:(id)resp error:(id)err completion:(id)comp { %orig; }

- (void)handleResponse:(id)resp error:(id)err completion:(id)comp { %orig; }
- (void)handleLegacyResponse:(id)resp error:(id)err completion:(id)comp { %orig; }

static void (*_logos_orig$YTLite_YTAppViewController_106)(id self, SEL _cmd);
static void _logos_method$YTLite_YTAppViewController_106(id self, SEL _cmd) {
    if (YTLBool(@"shortsOnlyMode")) return;
    _logos_orig$YTLite_YTAppViewController_106(self, _cmd);

}

static void (*_logos_orig$YTLite_YTReelWatchRootViewController_107)(id self, SEL _cmd, BOOL animated);
static void _logos_method$YTLite_YTReelWatchRootViewController_107(id self, SEL _cmd, BOOL animated) {
    _logos_orig$YTLite_YTReelWatchRootViewController_107(self, _cmd, animated);
    if (YTLBool(@"shortsOnlyMode")) {
        [self.navigationController.parentViewController performSelector:@selector(hidePivotBar)];
    }

}

static void (*_logos_orig$YTLite_YTSpeedmasterController_108)(id self, SEL _cmd, UILongPressGestureRecognizer * gesture);
static void _logos_method$YTLite_YTSpeedmasterController_108(id self, SEL _cmd, UILongPressGestureRecognizer * gesture) {
    if (YTLInt(@"speedIndex") > 0) {
        id delegate = [self valueForKey:@"_delegate"];
        if ([delegate isKindOfClass:objc_getClass("YTMainAppVideoPlayerOverlayViewController")]) {
            [[YTPSpeedMaster sharedMaster] manageSpeedMaster:gesture playerOverlayVC:delegate];
            return;
        }
    }
    _logos_orig$YTLite_YTSpeedmasterController_108(self, _cmd, gesture);

}

static id (*_logos_orig$YTLite_YTHUDMessageView_109)(id self, SEL _cmd, id msg, id handler);
static id _logos_method$YTLite_YTHUDMessageView_109(id self, SEL _cmd, id msg, id handler) {
    if (YTLBool(@"noHudMsgs")) return nil;
    return _logos_orig$YTLite_YTHUDMessageView_109(self, _cmd, msg, handler);

}

static NSWritingDirection (*_logos_orig$YTLite_NSParagraphStyle_110)(id self, SEL _cmd, NSString * lang);
static NSWritingDirection _logos_method$YTLite_NSParagraphStyle_110(id self, SEL _cmd, NSString * lang) {
    return YTLBool(@"disableRTL") ? NSWritingDirectionLeftToRight : _logos_orig$YTLite_NSParagraphStyle_110(self, _cmd, lang);

}
static NSWritingDirection (*_logos_orig$YTLite_NSParagraphStyle_111)(id self, SEL _cmd);
static NSWritingDirection _logos_method$YTLite_NSParagraphStyle_111(id self, SEL _cmd) {
    return YTLBool(@"disableRTL") ? NSWritingDirectionLeftToRight : _logos_orig$YTLite_NSParagraphStyle_111(self, _cmd);

}

- (BOOL)floatingForced { return YTLBool(@"floatingKeyboard") ? YES : %orig; }


static void (*_logos_orig$YTLite_UIApplication_112)(id self, SEL _cmd, NSURL * url, NSDictionary * options);
static void _logos_method$YTLite_UIApplication_112(id self, SEL _cmd, NSURL * url, NSDictionary * options) {
    if (YTLBool(@"noLinkTracking") && [url.host containsString:@"youtube.com"] && [url.path isEqualToString:@"/redirect"]) {
        NSURLComponents *comps = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:NO];
        for (NSURLQueryItem *item in comps.queryItems) {
            if ([item.name isEqualToString:@"q"] && item.value.length > 0) {
                NSURL *cleanURL = [NSURL URLWithString:item.value];
                if (cleanURL) {
                    url = cleanURL;
                    break;
                }
            }
        }
    }
    _logos_orig$YTLite_UIApplication_112(self, _cmd, url, options, completion);

}


__attribute__((constructor)) static void _logosLocalInit_YTLite(void) {
    MSHookMessageEx(objc_getClass("MPRemoteCommand"), @selector(addTarget:action:), (IMP)&_logos_method$YTLite_MPRemoteCommand_1, (IMP *)&_logos_orig$YTLite_MPRemoteCommand_1);
    MSHookMessageEx(objc_getClass("MPNowPlayingInfoCenter"), @selector(setNowPlayingInfo:), (IMP)&_logos_method$YTLite_MPNowPlayingInfoCenter_2, (IMP *)&_logos_orig$YTLite_MPNowPlayingInfoCenter_2);
    MSHookMessageEx(objc_getClass("YTToastOffsetController"), @selector(update), (IMP)&_logos_method$YTLite_YTToastOffsetController_3, (IMP *)&_logos_orig$YTLite_YTToastOffsetController_3);
    MSHookMessageEx(objc_getClass("YTToastOffsetController"), @selector(setWasPinnedTop:), (IMP)&_logos_method$YTLite_YTToastOffsetController_4, (IMP *)&_logos_orig$YTLite_YTToastOffsetController_4);
    MSHookMessageEx(objc_getClass("YTWatchViewController"), @selector(setFullscreen:), (IMP)&_logos_method$YTLite_YTWatchViewController_5, (IMP *)&_logos_orig$YTLite_YTWatchViewController_5);
    MSHookMessageEx(objc_getClass("YTWatchViewController"), @selector(allowedFullScreenOrientations), (IMP)&_logos_method$YTLite_YTWatchViewController_6, (IMP *)&_logos_orig$YTLite_YTWatchViewController_6);
    MSHookMessageEx(objc_getClass("UIDevice"), @selector(setOrientation:animated:), (IMP)&_logos_method$YTLite_UIDevice_7, (IMP *)&_logos_orig$YTLite_UIDevice_7);
    MSHookMessageEx(objc_getClass("UIDevice"), @selector(userInterfaceIdiom), (IMP)&_logos_method$YTLite_UIDevice_8, (IMP *)&_logos_orig$YTLite_UIDevice_8);
    MSHookMessageEx(objc_getClass("UIViewController"), @selector(presentViewController:animated:), (IMP)&_logos_method$YTLite_UIViewController_9, (IMP *)&_logos_orig$YTLite_UIViewController_9);
    MSHookMessageEx(objc_getClass("UIViewController"), @selector(viewDidLoad), (IMP)&_logos_method$YTLite_UIViewController_10, (IMP *)&_logos_orig$YTLite_UIViewController_10);
    MSHookMessageEx(objc_getClass("UIViewController"), @selector(viewDidDisappear:), (IMP)&_logos_method$YTLite_UIViewController_11, (IMP *)&_logos_orig$YTLite_UIViewController_11);
    MSHookMessageEx(objc_getClass("YTHeaderView"), @selector(stickyNavHeaderEnabled), (IMP)&_logos_method$YTLite_YTHeaderView_12, (IMP *)&_logos_orig$YTLite_YTHeaderView_12);
    MSHookMessageEx(objc_getClass("YTHeaderView"), @selector(clipsToStatusArea), (IMP)&_logos_method$YTLite_YTHeaderView_13, (IMP *)&_logos_orig$YTLite_YTHeaderView_13);
    MSHookMessageEx(objc_getClass("YTChipCloudCell"), @selector(framesForChipViewsWithWidth:), (IMP)&_logos_method$YTLite_YTChipCloudCell_14, (IMP *)&_logos_orig$YTLite_YTChipCloudCell_14);
    MSHookMessageEx(objc_getClass("YTMySubsFilterHeaderView"), @selector(setChipFilterView:), (IMP)&_logos_method$YTLite_YTMySubsFilterHeaderView_15, (IMP *)&_logos_orig$YTLite_YTMySubsFilterHeaderView_15);
    MSHookMessageEx(objc_getClass("YTHeaderContentComboView"), @selector(enableSubheaderBarWithView:), (IMP)&_logos_method$YTLite_YTHeaderContentComboView_16, (IMP *)&_logos_orig$YTLite_YTHeaderContentComboView_16);
    MSHookMessageEx(objc_getClass("YTHeaderContentComboView"), @selector(setFeedHeaderScrollMode:), (IMP)&_logos_method$YTLite_YTHeaderContentComboView_17, (IMP *)&_logos_orig$YTLite_YTHeaderContentComboView_17);
    MSHookMessageEx(objc_getClass("YTIPivotBarRenderer"), @selector(backgroundStyle), (IMP)&_logos_method$YTLite_YTIPivotBarRenderer_18, (IMP *)&_logos_orig$YTLite_YTIPivotBarRenderer_18);
    MSHookMessageEx(objc_getClass("YTPivotBarViewController"), @selector(viewDidAppear:), (IMP)&_logos_method$YTLite_YTPivotBarViewController_19, (IMP *)&_logos_orig$YTLite_YTPivotBarViewController_19);
    MSHookMessageEx(objc_getClass("YTPivotBarViewController"), @selector(isFrostedPivotBarPermitted), (IMP)&_logos_method$YTLite_YTPivotBarViewController_20, (IMP *)&_logos_orig$YTLite_YTPivotBarViewController_20);
    MSHookMessageEx(objc_getClass("YTAppDelegate"), @selector(application:didFinishLaunchingWithOptions:), (IMP)&_logos_method$YTLite_YTAppDelegate_21, (IMP *)&_logos_orig$YTLite_YTAppDelegate_21);
    MSHookMessageEx(objc_getClass("YTAppDelegate"), @selector(appDidBecomeActive), (IMP)&_logos_method$YTLite_YTAppDelegate_22, (IMP *)&_logos_orig$YTLite_YTAppDelegate_22);
    MSHookMessageEx(objc_getClass("YTPivotBarView"), @selector(itemView1), (IMP)&_logos_method$YTLite_YTPivotBarView_23, (IMP *)&_logos_orig$YTLite_YTPivotBarView_23);
    class_addMethod(objc_getClass("YTPivotBarView"), @selector(contextMenuInteraction:configurationForMenuAtLocation:), (IMP)&_logos_method$YTLite_YTPivotBarView_24, "@@:");
    MSHookMessageEx(objc_getClass("YTColdConfig"), @selector(mainAppCoreClientIosEnableStartupAnimation), (IMP)&_logos_method$YTLite_YTColdConfig_25, (IMP *)&_logos_orig$YTLite_YTColdConfig_25);
    MSHookMessageEx(objc_getClass("YTStartupAnimationViewController"), @selector(viewDidLoad), (IMP)&_logos_method$YTLite_YTStartupAnimationViewController_26, (IMP *)&_logos_orig$YTLite_YTStartupAnimationViewController_26);
    MSHookMessageEx(objc_getClass("YTStartupAnimationViewController"), @selector(playLottieAnimation), (IMP)&_logos_method$YTLite_YTStartupAnimationViewController_27, (IMP *)&_logos_orig$YTLite_YTStartupAnimationViewController_27);
    MSHookMessageEx(objc_getClass("YTStartupAnimationViewController"), @selector(dealloc), (IMP)&_logos_method$YTLite_YTStartupAnimationViewController_28, (IMP *)&_logos_orig$YTLite_YTStartupAnimationViewController_28);
    class_addMethod(objc_getClass("YTMultiSizeViewController"), @selector(helper), (IMP)&_logos_get$YTLite$YTMultiSizeViewController$helper, "@@:");
    class_addMethod(objc_getClass("YTMultiSizeViewController"), @selector(setHelper:), (IMP)&_logos_set$YTLite$YTMultiSizeViewController$helper, "v@:@");
    MSHookMessageEx(objc_getClass("YTIElementRenderer"), @selector(elementData), (IMP)&_logos_method$YTLite_YTIElementRenderer_29, (IMP *)&_logos_orig$YTLite_YTIElementRenderer_29);
    MSHookMessageEx(objc_getClass("_ASDisplayView"), @selector(didMoveToWindow), (IMP)&_logos_method$YTLite__ASDisplayView_30, (IMP *)&_logos_orig$YTLite__ASDisplayView_30);
    MSHookMessageEx(objc_getClass("_ASDisplayView"), @selector(setKeepalive_node:), (IMP)&_logos_method$YTLite__ASDisplayView_31, (IMP *)&_logos_orig$YTLite__ASDisplayView_31);
    class_addMethod(objc_getClass("_ASDisplayView"), @selector(savePFP:), (IMP)&_logos_method$YTLite__ASDisplayView_32, "@@:");
    class_addMethod(objc_getClass("_ASDisplayView"), @selector(postManager:), (IMP)&_logos_method$YTLite__ASDisplayView_33, "@@:");
    class_addMethod(objc_getClass("_ASDisplayView"), @selector(commentManager:), (IMP)&_logos_method$YTLite__ASDisplayView_34, "@@:");
    MSHookMessageEx(objc_getClass("YTICommand"), @selector(yt_showEngagementPanelEndpoint), (IMP)&_logos_method$YTLite_YTICommand_35, (IMP *)&_logos_orig$YTLite_YTICommand_35);
    MSHookMessageEx(objc_getClass("YTRightNavigationButtons"), @selector(layoutSubviews), (IMP)&_logos_method$YTLite_YTRightNavigationButtons_36, (IMP *)&_logos_orig$YTLite_YTRightNavigationButtons_36);
    MSHookMessageEx(objc_getClass("YTSearchViewController"), @selector(viewDidLoad), (IMP)&_logos_method$YTLite_YTSearchViewController_37, (IMP *)&_logos_orig$YTLite_YTSearchViewController_37);
    MSHookMessageEx(objc_getClass("YTSearchViewController"), @selector(setSuggestions:), (IMP)&_logos_method$YTLite_YTSearchViewController_38, (IMP *)&_logos_orig$YTLite_YTSearchViewController_38);
    MSHookMessageEx(objc_getClass("UIImageView"), @selector(setImage:), (IMP)&_logos_method$YTLite_UIImageView_39, (IMP *)&_logos_orig$YTLite_UIImageView_39);
    MSHookMessageEx(objc_getClass("UIImageView"), @selector(image), (IMP)&_logos_method$YTLite_UIImageView_40, (IMP *)&_logos_orig$YTLite_UIImageView_40);
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(speedControls), (IMP)&_logos_get$YTLite$YTMainAppControlsOverlayView$speedControls, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(setSpeedControls:), (IMP)&_logos_set$YTLite$YTMainAppControlsOverlayView$speedControls, "v@:@");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(ytlButtons), (IMP)&_logos_get$YTLite$YTMainAppControlsOverlayView$ytlButtons, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(setYtlButtons:), (IMP)&_logos_set$YTLite$YTMainAppControlsOverlayView$ytlButtons, "v@:@");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(speedMinus), (IMP)&_logos_get$YTLite$YTMainAppControlsOverlayView$speedMinus, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(setSpeedMinus:), (IMP)&_logos_set$YTLite$YTMainAppControlsOverlayView$speedMinus, "v@:@");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(speedPlus), (IMP)&_logos_get$YTLite$YTMainAppControlsOverlayView$speedPlus, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(setSpeedPlus:), (IMP)&_logos_set$YTLite$YTMainAppControlsOverlayView$speedPlus, "v@:@");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(speedValue), (IMP)&_logos_get$YTLite$YTMainAppControlsOverlayView$speedValue, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(setSpeedValue:), (IMP)&_logos_set$YTLite$YTMainAppControlsOverlayView$speedValue, "v@:@");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(ytlButton), (IMP)&_logos_get$YTLite$YTMainAppControlsOverlayView$ytlButton, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(setYtlButton:), (IMP)&_logos_set$YTLite$YTMainAppControlsOverlayView$ytlButton, "v@:@");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(ytlMuteButton), (IMP)&_logos_get$YTLite$YTMainAppControlsOverlayView$ytlMuteButton, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(setYtlMuteButton:), (IMP)&_logos_set$YTLite$YTMainAppControlsOverlayView$ytlMuteButton, "v@:@");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(ytlLockButton), (IMP)&_logos_get$YTLite$YTMainAppControlsOverlayView$ytlLockButton, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(setYtlLockButton:), (IMP)&_logos_set$YTLite$YTMainAppControlsOverlayView$ytlLockButton, "v@:@");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(ytlSleepButton), (IMP)&_logos_get$YTLite$YTMainAppControlsOverlayView$ytlSleepButton, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(setYtlSleepButton:), (IMP)&_logos_set$YTLite$YTMainAppControlsOverlayView$ytlSleepButton, "v@:@");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(ytlDiscordButton), (IMP)&_logos_get$YTLite$YTMainAppControlsOverlayView$ytlDiscordButton, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(setYtlDiscordButton:), (IMP)&_logos_set$YTLite$YTMainAppControlsOverlayView$ytlDiscordButton, "v@:@");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(ytlSbButton), (IMP)&_logos_get$YTLite$YTMainAppControlsOverlayView$ytlSbButton, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(setYtlSbButton:), (IMP)&_logos_set$YTLite$YTMainAppControlsOverlayView$ytlSbButton, "v@:@");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(ytlButtonsTopAnchor), (IMP)&_logos_get$YTLite$YTMainAppControlsOverlayView$ytlButtonsTopAnchor, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(setYtlButtonsTopAnchor:), (IMP)&_logos_set$YTLite$YTMainAppControlsOverlayView$ytlButtonsTopAnchor, "v@:@");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(ytlButtonsTrailingAnchor), (IMP)&_logos_get$YTLite$YTMainAppControlsOverlayView$ytlButtonsTrailingAnchor, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(setYtlButtonsTrailingAnchor:), (IMP)&_logos_set$YTLite$YTMainAppControlsOverlayView$ytlButtonsTrailingAnchor, "v@:@");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(ytlButtonsFSTopAnchor), (IMP)&_logos_get$YTLite$YTMainAppControlsOverlayView$ytlButtonsFSTopAnchor, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(setYtlButtonsFSTopAnchor:), (IMP)&_logos_set$YTLite$YTMainAppControlsOverlayView$ytlButtonsFSTopAnchor, "v@:@");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(ytlButtonsFSTrailingAnchor), (IMP)&_logos_get$YTLite$YTMainAppControlsOverlayView$ytlButtonsFSTrailingAnchor, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(setYtlButtonsFSTrailingAnchor:), (IMP)&_logos_set$YTLite$YTMainAppControlsOverlayView$ytlButtonsFSTrailingAnchor, "v@:@");
    MSHookMessageEx(objc_getClass("YTMainAppControlsOverlayView"), @selector(initWithDelegate:), (IMP)&_logos_method$YTLite_YTMainAppControlsOverlayView_41, (IMP *)&_logos_orig$YTLite_YTMainAppControlsOverlayView_41);
    MSHookMessageEx(objc_getClass("YTMainAppControlsOverlayView"), @selector(layoutSubviews), (IMP)&_logos_method$YTLite_YTMainAppControlsOverlayView_42, (IMP *)&_logos_orig$YTLite_YTMainAppControlsOverlayView_42);
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(speedValueMinus:), (IMP)&_logos_method$YTLite_YTMainAppControlsOverlayView_43, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(speedValuePlus:), (IMP)&_logos_method$YTLite_YTMainAppControlsOverlayView_44, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(resetSpeedValue:), (IMP)&_logos_method$YTLite_YTMainAppControlsOverlayView_45, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(speedDidChange:), (IMP)&_logos_method$YTLite_YTMainAppControlsOverlayView_46, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(showSpeedControl:), (IMP)&_logos_method$YTLite_YTMainAppControlsOverlayView_47, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(handleYTLIconTap:), (IMP)&_logos_method$YTLite_YTMainAppControlsOverlayView_48, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(handleYTLMuteTap:), (IMP)&_logos_method$YTLite_YTMainAppControlsOverlayView_49, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(handleYTLLockTap:), (IMP)&_logos_method$YTLite_YTMainAppControlsOverlayView_50, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(handleYTLSleepTap:), (IMP)&_logos_method$YTLite_YTMainAppControlsOverlayView_51, "@@:");
    class_addMethod(objc_getClass("YTMainAppControlsOverlayView"), @selector(handleYTLSbTap:), (IMP)&_logos_method$YTLite_YTMainAppControlsOverlayView_52, "@@:");
    MSHookMessageEx(objc_getClass("YTMainAppControlsOverlayView"), @selector(setAutoplaySwitchButtonRenderer:), (IMP)&_logos_method$YTLite_YTMainAppControlsOverlayView_53, (IMP *)&_logos_orig$YTLite_YTMainAppControlsOverlayView_53);
    MSHookMessageEx(objc_getClass("YTMainAppControlsOverlayView"), @selector(setClosedCaptionsOrSubtitlesButtonAvailable:), (IMP)&_logos_method$YTLite_YTMainAppControlsOverlayView_54, (IMP *)&_logos_orig$YTLite_YTMainAppControlsOverlayView_54);
    MSHookMessageEx(objc_getClass("YTMainAppControlsOverlayView"), @selector(setOverlayVisible:), (IMP)&_logos_method$YTLite_YTMainAppControlsOverlayView_55, (IMP *)&_logos_orig$YTLite_YTMainAppControlsOverlayView_55);
    MSHookMessageEx(objc_getClass("YTMainAppControlsOverlayView"), @selector(playbackRouteButton), (IMP)&_logos_method$YTLite_YTMainAppControlsOverlayView_56, (IMP *)&_logos_orig$YTLite_YTMainAppControlsOverlayView_56);
    MSHookMessageEx(objc_getClass("YTMainAppControlsOverlayView"), @selector(dealloc), (IMP)&_logos_method$YTLite_YTMainAppControlsOverlayView_57, (IMP *)&_logos_orig$YTLite_YTMainAppControlsOverlayView_57);
    class_addMethod(object_getClass(objc_getClass("YTColor")), @selector(bgColorForPageStyle:), (IMP)&_logos_method$YTLite_YTColor_58, "@@:");
    MSHookMessageEx(objc_getClass("UIView"), @selector(setBackgroundColor:), (IMP)&_logos_method$YTLite_UIView_59, (IMP *)&_logos_orig$YTLite_UIView_59);
    MSHookMessageEx(objc_getClass("GOODimmingBackgroundView"), @selector(layoutSubviews), (IMP)&_logos_method$YTLite_GOODimmingBackgroundView_60, (IMP *)&_logos_orig$YTLite_GOODimmingBackgroundView_60);
    MSHookMessageEx(objc_getClass("UIKeyboard"), @selector(displayLayer:), (IMP)&_logos_method$YTLite_UIKeyboard_61, (IMP *)&_logos_orig$YTLite_UIKeyboard_61);
    MSHookMessageEx(objc_getClass("UIPredictionViewController"), @selector(_currentTextSuggestions), (IMP)&_logos_method$YTLite_UIPredictionViewController_62, (IMP *)&_logos_orig$YTLite_UIPredictionViewController_62);
    MSHookMessageEx(objc_getClass("UIKeyboardDockView"), @selector(layoutSubviews), (IMP)&_logos_method$YTLite_UIKeyboardDockView_63, (IMP *)&_logos_orig$YTLite_UIKeyboardDockView_63);
    MSHookMessageEx(objc_getClass("UIInputView"), @selector(layoutSubviews), (IMP)&_logos_method$YTLite_UIInputView_64, (IMP *)&_logos_orig$YTLite_UIInputView_64);
    MSHookMessageEx(objc_getClass("UIKBVisualEffectView"), @selector(layoutSubviews), (IMP)&_logos_method$YTLite_UIKBVisualEffectView_65, (IMP *)&_logos_orig$YTLite_UIKBVisualEffectView_65);
    MSHookMessageEx(objc_getClass("YTInlineMutedPlaybackPlayerOverlayViewController"), @selector(scrubbingUIStyle), (IMP)&_logos_method$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_66, (IMP *)&_logos_orig$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_66);
    MSHookMessageEx(objc_getClass("YTInlineMutedPlaybackPlayerOverlayViewController"), @selector(setPaidContentWithPlayerData:), (IMP)&_logos_method$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_67, (IMP *)&_logos_orig$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_67);
    MSHookMessageEx(objc_getClass("YTInlineMutedPlaybackPlayerOverlayViewController"), @selector(viewDidLoad), (IMP)&_logos_method$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_68, (IMP *)&_logos_orig$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_68);
    class_addMethod(objc_getClass("YTInlineMutedPlaybackPlayerOverlayViewController"), @selector(gestureRecognizerShouldBegin:), (IMP)&_logos_method$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_69, "@@:");
    class_addMethod(objc_getClass("YTInlineMutedPlaybackPlayerOverlayViewController"), @selector(gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:), (IMP)&_logos_method$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_70, "@@:");
    class_addMethod(objc_getClass("YTInlineMutedPlaybackPlayerOverlayViewController"), @selector(handleHorizontalPan:), (IMP)&_logos_method$YTLite_YTInlineMutedPlaybackPlayerOverlayViewController_71, "@@:");
    class_addMethod(objc_getClass("YTInlineMutedPlaybackAudioIconViewController"), @selector(ytlButton), (IMP)&_logos_get$YTLite$YTInlineMutedPlaybackAudioIconViewController$ytlButton, "@@:");
    class_addMethod(objc_getClass("YTInlineMutedPlaybackAudioIconViewController"), @selector(setYtlButton:), (IMP)&_logos_set$YTLite$YTInlineMutedPlaybackAudioIconViewController$ytlButton, "v@:@");
    class_addMethod(objc_getClass("YTInlineMutedPlaybackAudioIconViewController"), @selector(ytlIcon), (IMP)&_logos_get$YTLite$YTInlineMutedPlaybackAudioIconViewController$ytlIcon, "@@:");
    class_addMethod(objc_getClass("YTInlineMutedPlaybackAudioIconViewController"), @selector(setYtlIcon:), (IMP)&_logos_set$YTLite$YTInlineMutedPlaybackAudioIconViewController$ytlIcon, "v@:@");
    MSHookMessageEx(objc_getClass("YTInlineMutedPlaybackAudioIconViewController"), @selector(viewDidLoad), (IMP)&_logos_method$YTLite_YTInlineMutedPlaybackAudioIconViewController_72, (IMP *)&_logos_orig$YTLite_YTInlineMutedPlaybackAudioIconViewController_72);
    class_addMethod(objc_getClass("YTReelWatchPlaybackOverlayViewSub"), @selector(didTapYtlButton:), (IMP)&_logos_method$YTLite_YTReelWatchPlaybackOverlayViewSub_73, "@@:");
    class_addMethod(objc_getClass("YTReelWatchPlaybackOverlayView"), @selector(didTapYtlButton:), (IMP)&_logos_method$YTLite_YTReelWatchPlaybackOverlayView_74, "@@:");
    class_addMethod(objc_getClass("YTInlineMutedPlaybackShortsPlayerOverlayView"), @selector(didTapYtlButton:), (IMP)&_logos_method$YTLite_YTInlineMutedPlaybackShortsPlayerOverlayView_75, "@@:");
    MSHookMessageEx(objc_getClass("YTVideoFreeZoomOverlayController"), @selector(freeZoomViewDidZoom:isTwoFingerZoom:), (IMP)&_logos_method$YTLite_YTVideoFreeZoomOverlayController_76, (IMP *)&_logos_orig$YTLite_YTVideoFreeZoomOverlayController_76);
    MSHookMessageEx(objc_getClass("YTMainAppVideoPlayerOverlayView"), @selector(setBackgroundVisible:isGradientBackground:), (IMP)&_logos_method$YTLite_YTMainAppVideoPlayerOverlayView_77, (IMP *)&_logos_orig$YTLite_YTMainAppVideoPlayerOverlayView_77);
    MSHookMessageEx(objc_getClass("YTMainAppVideoPlayerOverlayView"), @selector(setSeekAnywherePanGestureRecognizer:), (IMP)&_logos_method$YTLite_YTMainAppVideoPlayerOverlayView_78, (IMP *)&_logos_orig$YTLite_YTMainAppVideoPlayerOverlayView_78);
    class_addMethod(objc_getClass("YTMainAppVideoPlayerOverlayView"), @selector(speedmasterYtLite:), (IMP)&_logos_method$YTLite_YTMainAppVideoPlayerOverlayView_79, "@@:");
    MSHookMessageEx(objc_getClass("YTMainAppVideoPlayerOverlayViewController"), @selector(playerOverlayProvider:didInsertPlayerOverlay:), (IMP)&_logos_method$YTLite_YTMainAppVideoPlayerOverlayViewController_80, (IMP *)&_logos_orig$YTLite_YTMainAppVideoPlayerOverlayViewController_80);
    MSHookMessageEx(objc_getClass("YTMainAppVideoPlayerOverlayViewController"), @selector(selectedVarispeedLabelText), (IMP)&_logos_method$YTLite_YTMainAppVideoPlayerOverlayViewController_81, (IMP *)&_logos_orig$YTLite_YTMainAppVideoPlayerOverlayViewController_81);
    MSHookMessageEx(objc_getClass("YTMainAppVideoPlayerOverlayViewController"), @selector(didPressPause:), (IMP)&_logos_method$YTLite_YTMainAppVideoPlayerOverlayViewController_82, (IMP *)&_logos_orig$YTLite_YTMainAppVideoPlayerOverlayViewController_82);
    MSHookMessageEx(objc_getClass("YTMainAppVideoPlayerOverlayViewController"), @selector(setLoopMode:), (IMP)&_logos_method$YTLite_YTMainAppVideoPlayerOverlayViewController_83, (IMP *)&_logos_orig$YTLite_YTMainAppVideoPlayerOverlayViewController_83);
    MSHookMessageEx(objc_getClass("YTMainAppVideoPlayerOverlayViewController"), @selector(viewDidLoad), (IMP)&_logos_method$YTLite_YTMainAppVideoPlayerOverlayViewController_84, (IMP *)&_logos_orig$YTLite_YTMainAppVideoPlayerOverlayViewController_84);
    class_addMethod(objc_getClass("YTMainAppVideoPlayerOverlayViewController"), @selector(handleTwoFingerTap:), (IMP)&_logos_method$YTLite_YTMainAppVideoPlayerOverlayViewController_85, "@@:");
    class_addMethod(objc_getClass("YTMainAppVideoPlayerOverlayViewController"), @selector(gestureRecognizerShouldBegin:), (IMP)&_logos_method$YTLite_YTMainAppVideoPlayerOverlayViewController_86, "@@:");
    class_addMethod(objc_getClass("YTMainAppVideoPlayerOverlayViewController"), @selector(handleFingerPan:), (IMP)&_logos_method$YTLite_YTMainAppVideoPlayerOverlayViewController_87, "@@:");
    class_addMethod(objc_getClass("YTInlinePlayerBarContainerView"), @selector(endTimeString), (IMP)&_logos_get$YTLite$YTInlinePlayerBarContainerView$endTimeString, "@@:");
    class_addMethod(objc_getClass("YTInlinePlayerBarContainerView"), @selector(setEndTimeString:), (IMP)&_logos_set$YTLite$YTInlinePlayerBarContainerView$endTimeString, "v@:@");
    MSHookMessageEx(objc_getClass("YTInlinePlayerBarContainerView"), @selector(setPlayerBarAlpha:), (IMP)&_logos_method$YTLite_YTInlinePlayerBarContainerView_88, (IMP *)&_logos_orig$YTLite_YTInlinePlayerBarContainerView_88);
    MSHookMessageEx(objc_getClass("YTInlinePlayerBarContainerView"), @selector(setFrame:), (IMP)&_logos_method$YTLite_YTInlinePlayerBarContainerView_89, (IMP *)&_logos_orig$YTLite_YTInlinePlayerBarContainerView_89);
    MSHookMessageEx(objc_getClass("YTInlinePlayerBarContainerView"), @selector(quietProgressBarColor), (IMP)&_logos_method$YTLite_YTInlinePlayerBarContainerView_90, (IMP *)&_logos_orig$YTLite_YTInlinePlayerBarContainerView_90);
    MSHookMessageEx(objc_getClass("YTInlinePlayerBarContainerView"), @selector(didPressScrubber:), (IMP)&_logos_method$YTLite_YTInlinePlayerBarContainerView_91, (IMP *)&_logos_orig$YTLite_YTInlinePlayerBarContainerView_91);
    MSHookMessageEx(objc_getClass("YTPlayabilityResolutionUserActionUIController"), @selector(showConfirmAlert), (IMP)&_logos_method$YTLite_YTPlayabilityResolutionUserActionUIController_92, (IMP *)&_logos_orig$YTLite_YTPlayabilityResolutionUserActionUIController_92);
    class_addMethod(objc_getClass("YTVideoQualitySwitchOriginalController"), @selector(redesignedController), (IMP)&_logos_get$YTLite$YTVideoQualitySwitchOriginalController$redesignedController, "@@:");
    class_addMethod(objc_getClass("YTVideoQualitySwitchOriginalController"), @selector(setRedesignedController:), (IMP)&_logos_set$YTLite$YTVideoQualitySwitchOriginalController$redesignedController, "v@:@");
    MSHookMessageEx(objc_getClass("YTPlayerBarScrubberDotDecorationView"), @selector(scrubberDot), (IMP)&_logos_method$YTLite_YTPlayerBarScrubberDotDecorationView_93, (IMP *)&_logos_orig$YTLite_YTPlayerBarScrubberDotDecorationView_93);
    MSHookMessageEx(objc_getClass("YTPlayerBarScrubberDotDecorationViewV1"), @selector(scrubberDot), (IMP)&_logos_method$YTLite_YTPlayerBarScrubberDotDecorationViewV1_94, (IMP *)&_logos_orig$YTLite_YTPlayerBarScrubberDotDecorationViewV1_94);
    class_addMethod(objc_getClass("ASDisplayNode"), @selector(copiedComment), (IMP)&_logos_get$YTLite$ASDisplayNode$copiedComment, "@@:");
    class_addMethod(objc_getClass("ASDisplayNode"), @selector(setCopiedComment:), (IMP)&_logos_set$YTLite$ASDisplayNode$copiedComment, "v@:@");
    class_addMethod(objc_getClass("ASDisplayNode"), @selector(copiedURL), (IMP)&_logos_get$YTLite$ASDisplayNode$copiedURL, "@@:");
    class_addMethod(objc_getClass("ASDisplayNode"), @selector(setCopiedURL:), (IMP)&_logos_set$YTLite$ASDisplayNode$copiedURL, "v@:@");
    MSHookMessageEx(objc_getClass("_UIConcretePasteboard"), @selector(setString:), (IMP)&_logos_method$YTLite__UIConcretePasteboard_95, (IMP *)&_logos_orig$YTLite__UIConcretePasteboard_95);
    MSHookMessageEx(objc_getClass("YTIIosSystemShareEndpoint"), @selector(shareURL), (IMP)&_logos_method$YTLite_YTIIosSystemShareEndpoint_96, (IMP *)&_logos_orig$YTLite_YTIIosSystemShareEndpoint_96);
    class_addMethod(objc_getClass("YTPlayerViewController"), @selector(restoreLoopMode), (IMP)&_logos_method$YTLite_YTPlayerViewController_97, "@@:");
    class_addMethod(objc_getClass("YTPlayerViewController"), @selector(autoFullscreen), (IMP)&_logos_method$YTLite_YTPlayerViewController_98, "@@:");
    class_addMethod(objc_getClass("YTPlayerViewController"), @selector(setAutoSpeed), (IMP)&_logos_method$YTLite_YTPlayerViewController_99, "@@:");
    MSHookMessageEx(objc_getClass("YTPlayerViewController"), @selector(dealloc), (IMP)&_logos_method$YTLite_YTPlayerViewController_100, (IMP *)&_logos_orig$YTLite_YTPlayerViewController_100);
    MSHookMessageEx(objc_getClass("YTReelHeaderView"), @selector(setTitleLabelVisible:animated:), (IMP)&_logos_method$YTLite_YTReelHeaderView_101, (IMP *)&_logos_orig$YTLite_YTReelHeaderView_101);
    MSHookMessageEx(objc_getClass("YTReelHeaderView"), @selector(addView:toStackView:withSize:), (IMP)&_logos_method$YTLite_YTReelHeaderView_102, (IMP *)&_logos_orig$YTLite_YTReelHeaderView_102);
    class_addMethod(objc_getClass("YTReelContentView"), @selector(turnShortsOnlyModeOff:), (IMP)&_logos_method$YTLite_YTReelContentView_103, "@@:");
    MSHookMessageEx(objc_getClass("YTPivotBarItemView"), @selector(setRenderer:), (IMP)&_logos_method$YTLite_YTPivotBarItemView_104, (IMP *)&_logos_orig$YTLite_YTPivotBarItemView_104);
    MSHookMessageEx(objc_getClass("YTPivotBarItemView"), @selector(layoutSubviews), (IMP)&_logos_method$YTLite_YTPivotBarItemView_105, (IMP *)&_logos_orig$YTLite_YTPivotBarItemView_105);
    MSHookMessageEx(objc_getClass("YTAppViewController"), @selector(showPivotBar), (IMP)&_logos_method$YTLite_YTAppViewController_106, (IMP *)&_logos_orig$YTLite_YTAppViewController_106);
    MSHookMessageEx(objc_getClass("YTReelWatchRootViewController"), @selector(viewDidAppear:), (IMP)&_logos_method$YTLite_YTReelWatchRootViewController_107, (IMP *)&_logos_orig$YTLite_YTReelWatchRootViewController_107);
    MSHookMessageEx(objc_getClass("YTSpeedmasterController"), @selector(speedmasterDidLongPressWithRecognizer:), (IMP)&_logos_method$YTLite_YTSpeedmasterController_108, (IMP *)&_logos_orig$YTLite_YTSpeedmasterController_108);
    MSHookMessageEx(objc_getClass("YTHUDMessageView"), @selector(initWithMessage:dismissHandler:), (IMP)&_logos_method$YTLite_YTHUDMessageView_109, (IMP *)&_logos_orig$YTLite_YTHUDMessageView_109);
    MSHookMessageEx(object_getClass(objc_getClass("NSParagraphStyle")), @selector(defaultWritingDirectionForLanguage:), (IMP)&_logos_method$YTLite_NSParagraphStyle_110, (IMP *)&_logos_orig$YTLite_NSParagraphStyle_110);
    MSHookMessageEx(object_getClass(objc_getClass("NSParagraphStyle")), @selector(_defaultWritingDirection), (IMP)&_logos_method$YTLite_NSParagraphStyle_111, (IMP *)&_logos_orig$YTLite_NSParagraphStyle_111);
    MSHookMessageEx(objc_getClass("UIApplication"), @selector(openURL:options:), (IMP)&_logos_method$YTLite_UIApplication_112, (IMP *)&_logos_orig$YTLite_UIApplication_112);
}
