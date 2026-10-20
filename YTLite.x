//
// YTLite.x
// Reconstructed from YTLite.dylib TU 9 (0x4c9e0 .. 0xf054c)
// Core hooks for YouTube Plus (YTLite) v5.2.2 (369 hooks & %new methods)
//

#import "Headers/YTLite.h"

// MARK: - Remote Control & Now Playing

%hook MPRemoteCommand

- (id)addTarget:(id)target action:(SEL)action {
    MPRemoteCommandCenter *center = [MPRemoteCommandCenter sharedCommandCenter];
    if (self == center.previousTrackCommand && YTLBool(@"rcSkipBackward")) {
        return [center.skipBackwardCommand addTarget:target action:action];
    }
    if (self == center.nextTrackCommand && YTLBool(@"rcSkipForward")) {
        return [center.skipForwardCommand addTarget:target action:action];
    }
    return %orig;
}

%end

%hook MPNowPlayingInfoCenter

- (void)setNowPlayingInfo:(NSDictionary *)info {
    %orig(info);
}

%end

// MARK: - Toast Offset & Fullscreen Tracking

%hook YTToastOffsetController

- (void)update {
    %orig;
    [[ToastManager sharedManager] setOffsetController:self];
    [[ToastManager sharedManager] updateAllToasts];
}

- (void)setWasPinnedTop:(BOOL)pinned {
    %orig;
    [[ToastManager sharedManager] setIsPinnedTop:pinned];
}

%end

%hook YTWatchViewController

- (void)setFullscreen:(BOOL)fullscreen {
    %orig;
    [[ToastManager sharedManager] setIsFullscreen:fullscreen];
}

- (NSInteger)allowedFullScreenOrientations {
    if (YTLBool(@"portraitFullscreen")) {
        return UIInterfaceOrientationMaskAll;
    }
    return %orig;
}

%end

%hook UIDevice

- (void)setOrientation:(NSInteger)orientation animated:(BOOL)animated {
    %orig;
}

- (NSInteger)userInterfaceIdiom {
    NSInteger idiomIdx = YTLInt(@"idiomIndex");
    if (idiomIdx == 1) return UIUserInterfaceIdiomPhone;
    if (idiomIdx == 2) return UIUserInterfaceIdiomPad;
    return %orig;
}

%end

// MARK: - Interstitial & Engagement Panel Filtering

%hook UIViewController

- (void)presentViewController:(UIViewController *)vc animated:(BOOL)animated completion:(void (^)(void))completion {
    if (YTLBool(@"noAds") && [vc isKindOfClass:%c(YTInterstitialElementsViewController)]) {
        return;
    }
    %orig;
}

- (void)viewDidLoad {
    %orig;
    if ([self isKindOfClass:%c(YTMainAppEngagementPanelViewController)] ||
        [self isKindOfClass:%c(YTEngagementPanelViewControllerImpl)]) {
        NSString *panelId = [[self valueForKey:@"panelIdentifier"] description];
        if ([panelId containsString:@"comment-item-section"]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"GOODHeightDidChangeNotification" object:self userInfo:@{@"height": @1}];
        }
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    %orig;
    if ([self isKindOfClass:%c(YTMainAppEngagementPanelViewController)] ||
        [self isKindOfClass:%c(YTEngagementPanelViewControllerImpl)]) {
        NSString *panelId = [[self valueForKey:@"panelIdentifier"] description];
        if ([panelId containsString:@"comment-item-section"]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"GOODHeightDidChangeNotification" object:self userInfo:@{@"height": @0}];
        }
    }
}

%end

// MARK: - Navigation Bar & Subheader Bar

%hook YTHeaderView

- (BOOL)stickyNavHeaderEnabled {
    return YTLBool(@"stickyNavbar") ? YES : %orig;
}

- (BOOL)clipsToStatusArea {
    return YTLBool(@"stickyNavbar") ? YES : %orig;
}

%end

%hook YTChipCloudCell

- (id)framesForChipViewsWithWidth:(CGFloat)width {
    if (YTLBool(@"noSubbar")) return @[];
    return %orig;
}

%end

%hook YTMySubsFilterHeaderView

- (void)setChipFilterView:(id)view {
    if (YTLBool(@"noSubbar")) return;
    %orig;
}

%end

%hook YTHeaderContentComboView

- (void)enableSubheaderBarWithView:(id)view {
    if (YTLBool(@"noSubbar")) return;
    %orig;
}

- (void)setFeedHeaderScrollMode:(NSInteger)mode {
    if (YTLBool(@"stickyNavbar")) {
        %orig(0);
        return;
    }
    %orig;
}

%end

// MARK: - Pivot Bar (Tab Bar) & Startup

%hook YTIPivotBarRenderer

- (NSInteger)backgroundStyle {
    if (YTLBool(@"frostedPivot")) return 1;
    return %orig;
}

%end

%hook YTPivotBarViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig;
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

- (BOOL)isFrostedPivotBarPermitted {
    return YTLBool(@"frostedPivot") ? YES : %orig;
}

%end

%hook YTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    BOOL res = %orig;
    if (YTLBool(@"autoClearCache")) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            [[[YTPSettingsBuilder alloc] init] clearCacheWithCompletion:nil];
        });
    }
    return res;
}

- (void)appDidBecomeActive {
    %orig;
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

%end

%hook YTPivotBarView

- (UIView *)itemView1 {
    UIView *v = %orig;
    if (v) {
        UIContextMenuInteraction *interaction = [[UIContextMenuInteraction alloc] initWithDelegate:(id<UIContextMenuInteractionDelegate>)self];
        v.userInteractionEnabled = YES;
        [v addInteraction:interaction];
    }
    return v;
}

%new
- (UIContextMenuConfiguration *)contextMenuInteraction:(UIContextMenuInteraction *)interaction configurationForMenuAtLocation:(CGPoint)location {
    return [UIContextMenuConfiguration configurationWithIdentifier:nil previewProvider:nil actionProvider:^UIMenu *(NSArray<UIMenuElement *> *suggestedActions) {
        UIAction *tabSettings = [UIAction actionWithTitle:LOC(@"Tabbar") image:[UIImage systemImageNamed:@"square.grid.2x2"] identifier:nil handler:^(__kindof UIAction *action) {
            TabbarVC *vc = [[TabbarVC alloc] initForSettings:NO];
            [[%c(YTUIUtils) topViewControllerForPresenting] presentViewController:[[UINavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
        }];
        return [UIMenu menuWithTitle:@"" children:@[tabSettings]];
    }];
}

%end

%hook YTColdConfig

- (BOOL)mainAppCoreClientIosEnableStartupAnimation {
    NSInteger mode = YTLInt(@"startupAnimation");
    if (mode == 1) return NO;
    if (mode >= 2) return YES;
    return %orig;
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

%end

%hook YTIPlayerColdConfig
- (BOOL)iosDisablePlaybackLockScreenController { return YTLBool(@"ytlLockButton") ? NO : %orig; }
%end

%hook YTStartupAnimationViewController

- (void)viewDidLoad {
    %orig;
    if (YTLBool(@"oledTheme")) {
        self.view.backgroundColor = [UIColor blackColor];
    }
}

- (void)playLottieAnimation {
    %orig;
}

- (void)dealloc {
    %orig;
}

%end

// MARK: - Background Playback & Ad Blocking

%hook YTMultiSizeViewController
%property (nonatomic, retain) YTLHelper *helper;
%end

%hook YTIPlayabilityStatus
- (BOOL)isPlayableInBackground { return YTLBool(@"backgroundPlayback") ? YES : %orig; }
%end

%hook MLVideo
- (BOOL)playableInBackground { return YTLBool(@"backgroundPlayback") ? YES : %orig; }
%end

%hook YTIBackgroundOfflineSettingCategoryEntryRenderer
- (BOOL)isBackgroundEnabled { return YTLBool(@"backgroundPlayback") ? YES : %orig; }
%end

%hook YTGlobalConfig
- (BOOL)shouldBlockUpgradeDialog { return YTLBool(@"noAds") ? YES : %orig; }
%end

%hook YTIPlayerResponse

- (BOOL)isMonetized { return YTLBool(@"noAds") ? NO : %orig; }
- (id)playerAdsArray { return YTLBool(@"noAds") ? [NSMutableArray array] : %orig; }
- (id)adSlotsArray { return YTLBool(@"noAds") ? [NSMutableArray array] : %orig; }
- (id)auxiliaryUi { return %orig; }
- (void)setHasAuxiliaryUi:(BOOL)has { %orig(has); }
- (void)setAuxiliaryUi:(id)ui { %orig(ui); }

%end

%hook YTIClientMdxGlobalConfig
- (BOOL)enableSkippableAd { return YTLBool(@"noAds") ? YES : %orig; }
%end

%hook YTAdShieldUtils
+ (id)spamSignalsDictionary { return YTLBool(@"noAds") ? @{} : %orig; }
+ (id)spamSignalsDictionaryWithoutIDFA { return YTLBool(@"noAds") ? @{} : %orig; }
%end

%hook YTDataUtils
+ (id)spamSignalsDictionary { return YTLBool(@"noAds") ? @{} : %orig; }
+ (id)spamSignalsDictionaryWithoutIDFA { return YTLBool(@"noAds") ? @{} : %orig; }
%end

%hook YTAdsInnerTubeContextDecorator
- (void)decorateContext:(id)context { if (!YTLBool(@"noAds")) %orig; }
%end

%hook YTAccountScopedAdsInnerTubeContextDecorator
- (void)decorateContext:(id)context { if (!YTLBool(@"noAds")) %orig; }
%end

%hook YTLocalPlaybackController
- (id)createAdsPlaybackCoordinator { return YTLBool(@"noAds") ? nil : %orig; }
%end

%hook MDXSession
- (void)adPlaying:(id)ad { if (!YTLBool(@"noAds")) %orig; }
%end

%hook YTWatchNextResponseViewController
- (void)loadWithModel:(id)model { %orig; }
%end

%hook YTIElementRenderer

- (NSData *)elementData {
    NSData *data = %orig;
    if (YTLBool(@"noAds") && [self respondsToSelector:@selector(hasCompatibilityOptions)] && [self valueForKey:@"compatibilityOptions"]) {
        id compat = [self valueForKey:@"compatibilityOptions"];
        if ([compat respondsToSelector:@selector(hasAdLoggingData)] && [[compat valueForKey:@"hasAdLoggingData"] boolValue]) {
            return [NSData data];
        }
    }
    return data;
}

%end

// MARK: - AsyncDisplayKit (_ASDisplayView & ASDisplayNode)

%hook _ASDisplayView

- (void)didMoveToWindow {
    %orig;
    if (YTLBool(@"noAds") && [self.accessibilityIdentifier isEqualToString:@"eml.expandable_metadata.vpp"]) {
        [self removeFromSuperview];
    }
}

- (void)setKeepalive_node:(id)node {
    %orig;
}

%new
- (void)savePFP:(UILongPressGestureRecognizer *)sender {
    if (sender.state != UIGestureRecognizerStateBegan) return;
    id node = [self valueForKey:@"keepalive_node"];
    if ([node isKindOfClass:%c(ASNetworkImageNode)]) {
        NSURL *url = [node valueForKey:@"URL"];
        if (url) [YTLHelper downloadImageFromURL:url download:YES];
    }
}

%new
- (void)postManager:(UILongPressGestureRecognizer *)sender {
    if (sender.state != UIGestureRecognizerStateBegan) return;
}

%new
- (void)commentManager:(UILongPressGestureRecognizer *)sender {
    if (sender.state != UIGestureRecognizerStateBegan) return;
}

%end

%hook YTInnerTubeCollectionViewController
- (void)addSectionsFromArray:(NSArray *)sections { %orig; }
%end

%hook YTICommand

- (id)yt_showEngagementPanelEndpoint {
    id ep = %orig;
    if (YTLBool(@"noAds") && [[ep description] containsString:@"mealbar_promo"]) {
        return nil;
    }
    return ep;
}

%end

// MARK: - Promo & Upsell Suppression

%hook YTICommandWrapperPromoRenderer
- (void)setHasPromoType:(BOOL)arg1 { %orig(NO); }
- (void)setPromoType:(NSInteger)arg1 { %orig(0); }
- (void)setHasPromoCommand:(BOOL)arg1 { %orig(NO); }
- (void)setPromoCommand:(id)arg1 { %orig(nil); }
- (void)setHasWatchPageTriggerCondition:(BOOL)arg1 { %orig(NO); }
- (void)setWatchPageTriggerCondition:(NSInteger)arg1 { %orig(0); }
- (id)clientFrequencyCapConfigsArray { return [NSMutableArray array]; }
- (NSUInteger)clientFrequencyCapConfigsArray_Count { return 0; }
%end

%hook YTIPromoMessageSupportedRenderers
- (NSInteger)rendererOneOfCase { return 0; }
- (void)setHasCommandWrapperPromoRenderer:(BOOL)arg1 { %orig(NO); }
- (void)setCommandWrapperPromoRenderer:(id)arg1 { %orig(nil); }
- (void)setHasUpsellDialogRenderer:(BOOL)arg1 { %orig(NO); }
- (void)setUpsellDialogRenderer:(id)arg1 { %orig(nil); }
%end

%hook YTIAuxiliaryUi
- (void)setHasMessageRenderers:(BOOL)arg1 { %orig(NO); }
- (void)setMessageRenderers:(id)arg1 { %orig(nil); }
%end

%hook YTITriggerConditions
- (BOOL)hasPlayerCueRangeSet { return NO; }
- (NSUInteger)validAdsStatesArray_Count { return 0; }
%end

%hook YTIVideoPlaybackRelativePosition
- (id)streamTimeMs { return @0; }
- (BOOL)hasStreamTimeMs { return NO; }
%end

%hook YTICoWatchability
- (NSInteger)type { return 0; }
- (void)setType:(NSInteger)type { %orig(0); }
%end

%hook YTCommerceEventGroupHandler
- (void)addEventHandlers {}
%end

%hook YTInterstitialPromoEventGroupHandler
- (void)addEventHandlers {}
%end

%hook YTPromosheetEventGroupHandler
- (void)addEventHandlers {}
%end

%hook YTPromoThrottleController
- (BOOL)canShowThrottledPromo { return NO; }
- (BOOL)canShowThrottledPromoWithFrequencyCap:(id)arg1 { return NO; }
- (BOOL)canShowThrottledPromoWithFrequencyCaps:(id)arg1 { return NO; }
%end

%hook YTIShowFullscreenInterstitialCommand
- (BOOL)shouldThrottleInterstitial { return YES; }
%end

%hook YTSettingsSectionItemManager
- (void)updatePremiumEarlyAccessSectionWithEntry:(id)entry {}
%end

%hook YTSurveyController
- (void)showSurveyWithRenderer:(id)renderer surveyParentResponder:(id)responder {}
%end

// MARK: - Cast, Hints, & Navigation Buttons

%hook MDXPlaybackRouteButtonController
- (BOOL)isPersistentCastIconEnabled { return YTLBool(@"noCast") ? NO : %orig; }
- (void)updateRouteButton:(id)button { if (!YTLBool(@"noCast")) %orig; }
- (void)updateAllRouteButtons { if (!YTLBool(@"noCast")) %orig; }
%end

%hook YTSettings
- (void)setDisableMDXDeviceDiscovery:(BOOL)disable { %orig(YTLBool(@"noCast") ? YES : disable); }
- (BOOL)areHintsDisabled { return YTLBool(@"noHints") ? YES : %orig; }
- (void)setHintsDisabled:(BOOL)disabled { %orig(YTLBool(@"noHints") ? YES : disabled); }
%end

%hook YTRightNavigationButtons

- (void)layoutSubviews {
    %orig;
    if (YTLBool(@"noNotifsButton")) [[self valueForKey:@"notificationButton"] setHidden:YES];
    if (YTLBool(@"noSearchButton")) [[self valueForKey:@"searchButton"] setHidden:YES];
    for (UIView *sub in self.subviews) {
        if (YTLBool(@"noCast") && [sub.accessibilityIdentifier isEqualToString:@"id.mdx.playbackroute.button"]) {
            sub.hidden = YES;
        }
    }
}

%end

%hook YTSearchViewController

- (void)viewDidLoad {
    %orig;
    if (YTLBool(@"noVoiceSearchButton")) {
        [self setValue:@NO forKey:@"_isVoiceSearchAllowed"];
    }
}

- (void)setSuggestions:(id)suggestions {
    if (YTLBool(@"noSearchHistory")) return;
    %orig;
}

%end

%hook YTPersonalizedSuggestionsCacheProvider
- (id)activeCache { return YTLBool(@"noSearchHistory") ? nil : %orig; }
%end

%hook YTWatchNextResultsViewController
- (void)setVisibleSections:(id)sections { if (!YTLBool(@"noRelatedWatchNexts")) %orig; }
%end

// MARK: - Custom Logo & Scrubber Thumb

%hook UIImageView

- (void)setImage:(UIImage *)image {
    NSInteger logoIdx = YTLInt(@"logoIndex");
    if (logoIdx > 0 && [[image description] containsString:@"Resources: youtube_"]) {
        if (logoIdx == 1) {
            self.alpha = 0.0;
        } else if (logoIdx == 2) {
            image = [%c(YTUIResources) youtubePremiumLogoWithPageStyle:1];
        }
    }
    %orig(image);
}

- (UIImage *)image {
    UIImage *img = %orig;
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

%end

// MARK: - Player Controls Overlay (YTMainAppControlsOverlayView)

%hook YTMainAppControlsOverlayView

%property (nonatomic, retain) UIStackView *speedControls;
%property (nonatomic, retain) UIStackView *ytlButtons;
%property (nonatomic, retain) YTQTMButton *speedMinus;
%property (nonatomic, retain) YTQTMButton *speedPlus;
%property (nonatomic, retain) YTQTMButton *speedValue;
%property (nonatomic, retain) YTQTMButton *ytlButton;
%property (nonatomic, retain) YTQTMButton *ytlMuteButton;
%property (nonatomic, retain) YTQTMButton *ytlLockButton;
%property (nonatomic, retain) YTQTMButton *ytlSleepButton;
%property (nonatomic, retain) YTQTMButton *ytlDiscordButton;
%property (nonatomic, retain) YTQTMButton *ytlSbButton;
%property (nonatomic, retain) NSLayoutConstraint *ytlButtonsTopAnchor;
%property (nonatomic, retain) NSLayoutConstraint *ytlButtonsTrailingAnchor;
%property (nonatomic, retain) NSLayoutConstraint *ytlButtonsFSTopAnchor;
%property (nonatomic, retain) NSLayoutConstraint *ytlButtonsFSTrailingAnchor;

- (id)initWithDelegate:(id)delegate {
    self = %orig;
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

- (void)layoutSubviews {
    %orig;
    if (YTLBool(@"hideOverlayTitle")) {
        [[self valueForKey:@"titleView"] setAlpha:0.0];
    }
    [[self speedControls] setHidden:!YTLBool(@"speedControls")];
}

%new
- (void)speedValueMinus:(UIButton *)sender {
    [[self valueForKey:@"eventsDelegate"] performSelector:@selector(resetAutoHideTimer)];
    id playerVC = [[self _viewControllerForAncestor] valueForKey:@"parentViewController"];
    double cur = [YTPSpeedMaster playbackRateForPlayer:playerVC];
    [YTPSpeedMaster setPlaybackRate:MAX(0.25, cur - 0.25) forPlayer:playerVC];
}

%new
- (void)speedValuePlus:(UIButton *)sender {
    [[self valueForKey:@"eventsDelegate"] performSelector:@selector(resetAutoHideTimer)];
    id playerVC = [[self _viewControllerForAncestor] valueForKey:@"parentViewController"];
    double cur = [YTPSpeedMaster playbackRateForPlayer:playerVC];
    [YTPSpeedMaster setPlaybackRate:MIN(10.0, cur + 0.25) forPlayer:playerVC];
}

%new
- (void)resetSpeedValue:(UIButton *)sender {
    [[self valueForKey:@"eventsDelegate"] performSelector:@selector(resetAutoHideTimer)];
    id playerVC = [[self _viewControllerForAncestor] valueForKey:@"parentViewController"];
    [YTPSpeedMaster setPlaybackRate:1.0 forPlayer:playerVC];
    [[self speedValue] setTitle:@"1x" forState:UIControlStateNormal];
}

%new
- (void)speedDidChange:(NSNotification *)note {
    float val = [note.object floatValue];
    [[self speedValue] setTitle:[NSString stringWithFormat:@"%@x", @(val)] forState:UIControlStateNormal];
}

%new
- (void)showSpeedControl:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        [[YTPSpeedPopupController speedController] presentFromViewController:[self _viewControllerForAncestor]];
    }
}

%new
- (void)handleYTLIconTap:(UIButton *)sender {
    UIViewController *vc = [self _viewControllerForAncestor];
    id playerVC = [vc valueForKey:@"parentViewController"];
    [DownloadMenuHelper showDownloadSheet:playerVC withSender:sender];
}

%new
- (void)handleYTLMuteTap:(UIButton *)sender {
    UIViewController *vc = [self _viewControllerForAncestor];
    id playerVC = [vc valueForKey:@"parentViewController"];
    id activeVideo = [playerVC valueForKey:@"activeVideo"];
    BOOL muted = ![[activeVideo valueForKey:@"isMuted"] boolValue];
    [activeVideo setValue:@(muted) forKey:@"muted"];
}

%new
- (void)handleYTLLockTap:(UIButton *)sender {
    UIViewController *vc = [self _viewControllerForAncestor];
    id lockCtrl = [[vc valueForKey:@"eventsDelegate"] valueForKey:@"lockModeStateEntityController"];
    [lockCtrl performSelector:@selector(lockModeDidRequestShowFullscreen)];
}

%new
- (void)handleYTLSleepTap:(UIButton *)sender {
    [[YTPSleepTimer sharedTimer] showOptions:sender];
}

%new
- (void)handleYTLSbTap:(UIButton *)sender {
}

- (void)setAutoplaySwitchButtonRenderer:(id)renderer {
    if (YTLBool(@"hideAutoplay")) return;
    %orig;
}

- (void)setClosedCaptionsOrSubtitlesButtonAvailable:(BOOL)available {
    if (YTLBool(@"hideSubs")) { %orig(NO); return; }
    %orig;
}

- (void)setOverlayVisible:(BOOL)visible {
    %orig;
    CGFloat alpha = visible ? 1.0 : 0.0;
    [[self ytlButtons] setAlpha:alpha];
    [[self speedControls] setAlpha:alpha];
    if (visible && YTLBool(@"pauseOnOverlay")) {
        id playerVC = [[self _viewControllerForAncestor] valueForKey:@"parentViewController"];
        if ([playerVC isKindOfClass:%c(YTPlayerViewController)]) {
            [playerVC performSelector:@selector(pause)];
        }
    }
}

- (id)playbackRouteButton {
    if (YTLBool(@"noCast")) {
        [self setValue:nil forKey:@"_playbackRouteButton"];
        return nil;
    }
    return %orig;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    %orig;
}

%end

%hook YTFullscreenEngagementOverlayView
- (void)setExpanded:(BOOL)expanded { %orig; }
%end

// MARK: - OLED Dark Theme & Keyboard

%hook YTColor
+ (UIColor *)black0 { return YTLBool(@"oledTheme") ? [UIColor blackColor] : %orig; }
+ (UIColor *)black1 { return YTLBool(@"oledTheme") ? [UIColor blackColor] : %orig; }
+ (UIColor *)black2 { return YTLBool(@"oledTheme") ? [UIColor blackColor] : %orig; }
+ (UIColor *)black3 { return YTLBool(@"oledTheme") ? [UIColor blackColor] : %orig; }
+ (UIColor *)black4 { return YTLBool(@"oledTheme") ? [UIColor blackColor] : %orig; }

%new
+ (UIColor *)bgColorForPageStyle:(NSInteger)style {
    return [[UIColor labelColor] colorWithAlphaComponent:0.1];
}
%end

%hook UIView
- (void)setBackgroundColor:(UIColor *)color {
    if (YTLBool(@"oledTheme")) {
        color = [YTPMedia oledForColor:color];
    }
    %orig(color);
}
%end

%hook GOODimmingBackgroundView
- (void)layoutSubviews {
    %orig;
    if (YTLBool(@"oledTheme")) {
        self.backgroundColor = [UIColor blackColor];
    }
}
%end

%hook UIKeyboard
- (void)displayLayer:(CALayer *)layer {
    %orig;
    if (YTLBool(@"oledKeyboard")) self.backgroundColor = [UIColor blackColor];
}
%end

%hook UIPredictionViewController
- (id)_currentTextSuggestions {
    if (YTLBool(@"oledKeyboard")) self.view.backgroundColor = [UIColor blackColor];
    return %orig;
}
%end

%hook UIKeyboardDockView
- (void)layoutSubviews {
    %orig;
    if (YTLBool(@"oledKeyboard")) self.backgroundColor = [UIColor blackColor];
}
%end

%hook UIInputView
- (void)layoutSubviews {
    %orig;
    if (YTLBool(@"oledKeyboard")) self.backgroundColor = [UIColor blackColor];
}
%end

%hook UIKBVisualEffectView
- (void)layoutSubviews {
    %orig;
    if (YTLBool(@"oledKeyboard")) self.backgroundColor = [UIColor blackColor];
}
%end

// MARK: - Inline Muted Playback (Feed Player)

%hook YTInlineMutedPlaybackPlayerOverlayView
- (NSInteger)audioControlUIStyle { return (YTLBool(@"downloadManager") || YTLBool(@"sponsorBlock")) ? 1 : %orig; }
- (NSInteger)scrubbingUIStyle { return (YTLBool(@"downloadManager") || YTLBool(@"sponsorBlock")) ? 1 : %orig; }
- (void)updateAudioControlUIStyle:(NSInteger)style { %orig((YTLBool(@"downloadManager") || YTLBool(@"sponsorBlock")) ? 1 : style); }
- (void)resetWithAudioControlUIStyle:(NSInteger)style { %orig((YTLBool(@"downloadManager") || YTLBool(@"sponsorBlock")) ? 1 : style); }
- (void)setAudioControlUIStyle:(NSInteger)style { %orig((YTLBool(@"downloadManager") || YTLBool(@"sponsorBlock")) ? 1 : style); }
%end

%hook YTInlineMutedPlaybackPlayerOverlayViewController

- (NSInteger)scrubbingUIStyle {
    return (YTLBool(@"downloadManager") || YTLBool(@"sponsorBlock")) ? 1 : %orig;
}

- (void)setPaidContentWithPlayerData:(id)data {
    if (YTLBool(@"noPromotionCards")) return;
    %orig;
}

- (void)viewDidLoad {
    %orig;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleHorizontalPan:)];
    pan.minimumNumberOfTouches = 1;
    pan.maximumNumberOfTouches = 1;
    pan.delegate = (id<UIGestureRecognizerDelegate>)self;
    [self.view addGestureRecognizer:pan];
}

%new
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gesture {
    if (!YTLBool(@"seekAnywhereFeed")) return NO;
    CGPoint vel = [gesture velocityInView:self.view];
    return fabs(vel.x) > fabs(vel.y);
}

%new
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)g1 shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)g2 {
    return NO;
}

%new
- (void)handleHorizontalPan:(UIPanGestureRecognizer *)gesture {
}

%end

%hook YTInlineMutedPlaybackAudioIconViewController

%property (nonatomic, retain) YTQTMButton *ytlButton;
%property (nonatomic, retain) UIView *ytlIcon;

- (void)viewDidLoad {
    %orig;
}

%end

%hook YTInlineMutedPlaybackAudioIconView
- (void)updateColors { %orig; }
%end

// MARK: - Shorts Overlay & Player

%hook YTReelWatchPlaybackOverlayViewSub
- (void)layoutSubviews { %orig; }
%new
- (void)didTapYtlButton:(UIButton *)sender {
    id responder = [self valueForKey:@"parentResponder"];
    if ([responder isKindOfClass:%c(YTReelPlayerViewController)]) {
        [DownloadMenuHelper showDownloadSheetShorts:[responder valueForKey:@"player"] withSender:sender];
    }
}
%end

%hook YTReelWatchPlaybackOverlayView
- (void)layoutSubviews { %orig; }
- (void)setActionBarElementRenderer:(id)renderer { %orig; }
- (void)setReelLikeButton:(id)button { %orig; }
%new
- (void)didTapYtlButton:(UIButton *)sender {
    id responder = [self valueForKey:@"parentResponder"];
    if ([responder isKindOfClass:%c(YTReelPlayerViewController)]) {
        [DownloadMenuHelper showDownloadSheetShorts:[responder valueForKey:@"player"] withSender:sender];
    }
}
%end

%hook YTInlineMutedPlaybackShortsPlayerOverlayView
- (void)layoutSubviews { %orig; }
%new
- (void)didTapYtlButton:(UIButton *)sender {
    id responder = [self valueForKey:@"parentResponder"];
    if ([responder isKindOfClass:%c(YTPlayerViewController)]) {
        [DownloadMenuHelper showDownloadSheetShorts:responder withSender:sender];
    }
}
%end

%hook YTPlaylistVideoCell
- (void)setCanReorder:(BOOL)canReorder { %orig(YES); }
%end

%hook YTVideoFreeZoomOverlayController
- (void)freeZoomViewDidZoom:(id)view isTwoFingerZoom:(BOOL)twoFinger {
    if (YTLBool(@"noFreeZoom")) return;
    %orig;
}
%end

%hook YTWatchCinematicContainerController
- (BOOL)isCinematicLightingAvailable { return YTLBool(@"disableAmbientMode") ? NO : %orig; }
%end

// MARK: - Main Video Player Overlay

%hook YTMainAppVideoPlayerOverlayView

- (void)setBackgroundVisible:(BOOL)visible isGradientBackground:(BOOL)gradient {
    if (YTLBool(@"noDarkBg")) { %orig(NO, NO); return; }
    %orig;
}

- (id)autonavPreviewView { return YTLBool(@"autonavEndScreenCards") ? nil : %orig; }
- (BOOL)isWatermarkEnabled { return YTLBool(@"noWatermarks") ? NO : %orig; }
- (id)featuredChannelWatermarkImageView { return YTLBool(@"noWatermarks") ? nil : %orig; }

- (void)setSeekAnywherePanGestureRecognizer:(id)gesture {
    %orig;
    if (YTLInt(@"speedIndex") > 0) {
        UILongPressGestureRecognizer *lp = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(speedmasterYtLite:)];
        lp.minimumPressDuration = 0.25;
        [self addGestureRecognizer:lp];
    }
}

%new
- (void)speedmasterYtLite:(UILongPressGestureRecognizer *)gesture {
    [[YTPSpeedMaster sharedMaster] manageSpeedMaster:gesture playerOverlayVC:[self valueForKey:@"delegate"]];
}

%end

%hook YTCreatorEndscreenView
- (void)setHidden:(BOOL)hidden { %orig(YTLBool(@"endScreenCards") ? YES : hidden); }
%end

%hook YTMainAppVideoPlayerOverlayViewController

- (BOOL)shouldShowAutonavEndscreen { return YTLBool(@"autonavEndScreenCards") ? NO : %orig; }
- (void)setFeaturedChannelWatermarkImageView:(id)view { if (!YTLBool(@"noWatermarks")) %orig; }

- (void)playerOverlayProvider:(id)provider didInsertPlayerOverlay:(id)overlay {
    NSString *ident = [overlay valueForKey:@"overlayIdentifier"];
    if ((YTLBool(@"noPromotionCards") && ([ident isEqualToString:@"player_overlay_paid_content"] || [ident isEqualToString:@"player_overlay_product_in_video"])) ||
        (YTLBool(@"noAds") && [ident isEqualToString:@"player_overlay_product_in_video"])) {
        return;
    }
    %orig;
}

- (NSString *)selectedVarispeedLabelText {
    return [NSString stringWithFormat:@"%@x", @([YTPSpeedMaster currentPlaybackRate])];
}

- (BOOL)allowDoubleTapToSeekGestureRecognizer { return YTLBool(@"noDoubleTapToSeek") ? NO : %orig; }
- (BOOL)allowTwoFingerDoubleTapGestureRecognizer { return YTLBool(@"noTwoFingerSnapToChapter") ? NO : %orig; }

- (void)didPressPause:(id)sender {
    %orig;
    if (YTLBool(@"copyWithTimestamp")) {
        NSInteger sec = (NSInteger)[[self valueForKey:@"mediaTime"] doubleValue];
        NSString *vid = [self valueForKey:@"videoID"];
        if (vid) {
            [UIPasteboard generalPasteboard].string = [NSString stringWithFormat:@"https://www.youtube.com/watch?v=%@&t=%lds", vid, (long)sec];
        }
    }
}

- (void)setLoopMode:(NSInteger)mode {
    %orig;
    [[YTLUserDefaults standardUserDefaults] setInteger:mode forKey:@"loopMode"];
}

- (void)viewDidLoad {
    %orig;
    UITapGestureRecognizer *twoFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTwoFingerTap:)];
    twoFingerTap.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:twoFingerTap];

    UIPanGestureRecognizer *fingerPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleFingerPan:)];
    fingerPan.minimumNumberOfTouches = 1;
    fingerPan.maximumNumberOfTouches = 1;
    fingerPan.delegate = (id<UIGestureRecognizerDelegate>)self;
    [self.view addGestureRecognizer:fingerPan];
}

%new
- (void)handleTwoFingerTap:(UITapGestureRecognizer *)gesture {
    if (YTLBool(@"twoFingerTap")) {
        [self performSelector:@selector(didTogglePlayPause)];
    }
}

%new
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gesture {
    return YES;
}

%new
- (void)handleFingerPan:(UIPanGestureRecognizer *)gesture {
}

%end

// MARK: - Fullscreen Actions & Inline Player Bar

%hook YTFullscreenActionsView
- (BOOL)enabled { return YTLBool(@"noFullscreenActions") ? NO : %orig; }
- (void)setEnabled:(BOOL)enabled { %orig(YTLBool(@"noFullscreenActions") ? NO : enabled); }
- (void)layoutSubviews { %orig; }
%end

%hook YTFullscreenEngagementOverlayController
- (void)setRelatedVideosVisible:(BOOL)visible { %orig(YTLBool(@"noRelatedVids") ? NO : visible); }
%end

%hook YTInlinePlayerBarContainerView

%property (nonatomic, retain) NSString *endTimeString;

- (void)setPlayerBarAlpha:(CGFloat)alpha {
    %orig(YTLBool(@"persistentProgressBar") ? 1.0 : alpha);
}

- (void)setFrame:(CGRect)frame {
    %orig(frame);
}

- (UIColor *)quietProgressBarColor {
    if (YTLInt(@"progressBarIndex") > 0) {
        NSData *data = [[YTLUserDefaults standardUserDefaults] objectForKey:@"progressMainColor"];
        if (data) {
            UIColor *c = [NSKeyedUnarchiver unarchivedObjectOfClass:[UIColor class] fromData:data error:nil];
            if (c) return c;
        }
    }
    return %orig;
}

- (void)didPressScrubber:(id)sender {
    %orig;
}

%end

%hook YTAnnotationsViewController
- (void)loadFeaturedChannelWatermark { if (!YTLBool(@"noWatermarks")) %orig; }
%end

%hook YTWatchMiniBarViewController
- (void)updateMiniBarPlayerStateFromRenderer { %orig; }
%end

%hook YTWatchFloatingMiniplayerViewController
- (void)updateMiniBarPlayerStateFromRenderer { %orig; }
%end

%hook YTPlaybackConfig
- (void)setStartPlayback:(BOOL)start { %orig(YTLBool(@"disableAutoplay") ? NO : start); }
%end

%hook YTPlayabilityResolutionUserActionUIController
- (void)showConfirmAlert {
    if (YTLBool(@"noContentWarning")) {
        [self performSelector:@selector(confirmAlertDidPressConfirm)];
        return;
    }
    %orig;
}
%end

%hook YTIMediaQualitySettingsHotConfig
%new
- (BOOL)enableQuickMenuVideoQualitySettings { return NO; }
%new
- (BOOL)omitAdvancedMenuOptionForAirPlay { return NO; }
%end

%hook YTVideoQualitySwitchOriginalController
%property (nonatomic, retain) id redesignedController;
- (void)setUserSelectableFormats:(id)formats { %orig; }
- (void)dealloc { [self setRedesignedController:nil]; %orig; }
%end

%hook YTSegmentableInlinePlayerBarView
- (void)dealloc { %orig; }
%end

// MARK: - Progress Bar Custom Coloring & Gradients

%hook YTPlayerBarScrubberDotDecorationView
- (UIView *)scrubberDot {
    UIView *dot = %orig;
    if (YTLInt(@"progressBarIndex") > 0) {
        NSData *data = [[YTLUserDefaults standardUserDefaults] objectForKey:@"scrubberColor"];
        if (data) {
            UIColor *c = [NSKeyedUnarchiver unarchivedObjectOfClass:[UIColor class] fromData:data error:nil];
            if (c) dot.backgroundColor = c;
        }
    }
    return dot;
}
%end

%hook YTPlayerBarScrubberDotDecorationViewV1
- (UIView *)scrubberDot {
    UIView *dot = %orig;
    if (YTLInt(@"progressBarIndex") > 0) {
        NSData *data = [[YTLUserDefaults standardUserDefaults] objectForKey:@"scrubberColor"];
        if (data) {
            UIColor *c = [NSKeyedUnarchiver unarchivedObjectOfClass:[UIColor class] fromData:data error:nil];
            if (c) dot.backgroundColor = c;
        }
    }
    return dot;
}
%end

%hook YTModularPlayerBarView
- (void)layoutSubviews { %orig; }
%end

%hook YTInlineMutedPlaybackScrubbingSlider
- (UIImage *)currentMinimumTrackImage { return %orig; }
%end

%hook YTBrandGradientImageProcessor
- (void)willDrawInContext:(id)ctx drawParameters:(id)params { %orig; }
%end

%hook YTProgressView
- (void)setProgressBarColor:(UIColor *)color { %orig; }
%end

%hook YTUserDefaults
- (void)setProgress:(CGFloat)progress { %orig; }
%end

// MARK: - Shorts Filtering & Data Sources

%hook YTReelContentModel
+ (id)makeContentModelForEntry:(id)entry { return %orig; }
%end

%hook YTReelDataSource
- (id)makeContentModelForEntry:(id)entry { return %orig; }
%end

%hook YTReelInfinitePlaybackDataSource
- (id)makeContentModelForEntry:(id)entry { return %orig; }
- (id)reels { return %orig; }
%end

%hook ASDisplayNode
%property (nonatomic, retain) NSString *copiedComment;
%property (nonatomic, retain) NSURL *copiedURL;
- (void)setYogaChildren:(id)children { %orig; }
- (void)dealloc { %orig; }
- (void)setFrame:(CGRect)frame { %orig; }
%end

%hook ELMComponent
- (id)node { return %orig; }
%end

%hook YTReelPlayerViewController
- (void)playbackControllerDidFinishPlaybackAndWillTransitionInternallyToNextPlayback:(id)next { %orig; }
- (void)maybeLoopPlayback { %orig; }
- (void)playbackControllerDidActivateVideo:(id)video withPlayerResponse:(id)response { %orig; }
%new
- (void)autoQuality {}
- (BOOL)shouldEnablePlayerBar { return YTLBool(@"shortsProgress") ? YES : %orig; }
- (BOOL)shouldAlwaysEnablePlayerBar { return YTLBool(@"shortsProgress") ? YES : %orig; }
- (BOOL)shouldEnablePlayerBarOnlyOnPause { return YTLBool(@"shortsProgress") ? NO : %orig; }
%end

// MARK: - Share URL Tracking Stripping

%hook _UIConcretePasteboard
- (void)setString:(NSString *)string {
    if (YTLBool(@"noShareChunk") && [string containsString:@"?si="]) {
        string = [string componentsSeparatedByString:@"?si="].firstObject;
    } else if (YTLBool(@"noShareChunk") && [string containsString:@"&si="]) {
        string = [string componentsSeparatedByString:@"&si="].firstObject;
    }
    %orig(string);
}
%end

%hook YTIIosSystemShareEndpoint
- (NSString *)shareURL {
    NSString *url = %orig;
    if (YTLBool(@"noShareChunk") && [url containsString:@"?si="]) {
        return [url componentsSeparatedByString:@"?si="].firstObject;
    }
    return url;
}
%end

// MARK: - Player Auto-Quality, Auto-Speed, Captions, Audio Track, Loop Mode

%hook YTPlayerViewController

%new
- (void)restoreLoopMode {
    if (YTLBool(@"rememberLoop")) {
        NSInteger mode = YTLInt(@"loopMode");
        id overlay = [self valueForKey:@"activeVideoPlayerOverlay"];
        if ([overlay respondsToSelector:@selector(setLoopMode:)]) {
            [overlay setLoopMode:mode];
        }
    }
}

%new
- (void)autoFullscreen {
    if (YTLBool(@"autoFullscreen")) {
        [[self valueForKey:@"_UIDelegate"] performSelector:@selector(showFullScreen)];
    }
}

%new
- (void)setAutoSpeed {
    NSInteger idx = YTLInt(@"autoSpeedIndex");
    if (idx > 0) {
        NSArray *rates = @[@1.0, @0.25, @0.5, @0.75, @1.0, @1.25, @1.5, @1.75, @2.0, @2.5, @3.0, @4.0, @5.0];
        if (idx < (NSInteger)rates.count) {
            [YTPSpeedMaster setPlaybackRate:[rates[idx] floatValue] forPlayer:self];
        }
    }
}

%new
- (void)selectCaptions {}

%new
- (void)autoQuality {}

%new
- (void)selectAudioTrack {}

- (void)dealloc {
    [[YTPSleepTimer sharedTimer] cancelIfPlayerClosed];
    %orig;
}

%end

%hook YTSingleVideoController
- (void)setAudioFormatConstraint:(id)constraint { %orig; }
%end

%hook YTWatchFlowController
- (BOOL)shouldExitFullScreenOnFinish { return YTLBool(@"exitFullscreen") ? YES : %orig; }
%end

%hook YTWatchController
- (void)handleRemoteControlEvent:(NSInteger)event withInterval:(double)interval { %orig; }
%end

%hook YTVerticalPanGestureRecognier
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gesture { return %orig; }
%end

%hook YTExitFullscreenController
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gesture { return %orig; }
%end

%hook YTPlaylistMiniBarView
- (void)setFrame:(CGRect)frame { %orig; }
%end

%hook YTMenuItemVisibilityHandler
- (BOOL)shouldShowServiceItemRenderer:(id)renderer { return %orig; }
%end

%hook YTDefaultSheetController
- (void)addAction:(id)action { %orig; }
%end

%hook YTReelPlayerViewControllerSub
- (BOOL)shouldEnablePlayerBar { return YTLBool(@"shortsProgress") ? YES : %orig; }
- (BOOL)shouldAlwaysEnablePlayerBar { return YTLBool(@"shortsProgress") ? YES : %orig; }
- (BOOL)shouldEnablePlayerBarOnlyOnPause { return YTLBool(@"shortsProgress") ? NO : %orig; }
%end

%hook YTShortsPlayerViewController
- (BOOL)shouldAlwaysEnablePlayerBar { return YTLBool(@"shortsProgress") ? YES : %orig; }
- (BOOL)shouldEnablePlayerBarOnlyOnPause { return YTLBool(@"shortsProgress") ? NO : %orig; }
%end

%hook YTYouThereController
- (BOOL)shouldShowYouTherePrompt { return NO; }
%end

%hook YTHotConfig
- (BOOL)enablePlayerBarForVerticalVideoWhenControlsHiddenInFullscreen { return YTLBool(@"shortsProgress") ? YES : %orig; }
- (BOOL)isPromptForLocalNetworkPermissionsEnabled { return NO; }
- (BOOL)clientInfraClientConfigIosEnableFillingEncodedHacksInnertubeContext { return NO; }
- (BOOL)enableShortsVideoQualityPicker { return YTLBool(@"shortsForceQuality") ? NO : %orig; }
%end

%hook YTShortsStartupCoordinator
- (BOOL)evaluateResumeToShorts { return YTLBool(@"hideShorts") ? NO : %orig; }
%end

%hook YTReelHeaderView
- (void)setTitleLabelVisible:(BOOL)visible animated:(BOOL)animated {
    %orig(YTLBool(@"hideShortsLogo") ? NO : visible, animated);
}
- (void)addView:(UIView *)view toStackView:(UIStackView *)stackView withSize:(CGSize)size {
    %orig;
}
%end

%hook YTReelWatchHeaderView
- (void)setChannelBarElementRenderer:(id)r { if (!YTLBool(@"hideShortsChannelName")) %orig; }
- (void)setHeaderRenderer:(id)r { if (!YTLBool(@"hideShortsDescription")) %orig; }
- (void)setShortsVideoTitleElementRenderer:(id)r { if (!YTLBool(@"hideShortsDescription")) %orig; }
- (void)setSoundMetadataElementRenderer:(id)r { if (!YTLBool(@"hideShortsAudioTrack")) %orig; }
- (void)setActionElement:(id)r { if (!YTLBool(@"hideShortsPromoCards")) %orig; }
- (void)setBadgeRenderer:(id)r { if (!YTLBool(@"hideShortsThanks")) %orig; }
- (void)setMultiFormatLinkElementRenderer:(id)r { if (!YTLBool(@"hideShortsSource")) %orig; }
%end

%hook YCHLiveChatView
- (void)layoutSubviews { %orig; }
%end

%hook YTPlayerView
- (void)didPinch:(UIPinchGestureRecognizer *)pinch { %orig; }
%end

%hook YTReelContentView
- (void)setPlaybackView:(id)view { %orig; }
%new
- (void)reelSpeedmaster:(UILongPressGestureRecognizer *)gesture {}
- (void)dealloc { %orig; }
%new
- (void)turnShortsOnlyModeOff:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        [[YTLUserDefaults standardUserDefaults] setBool:NO forKey:@"shortsOnlyMode"];
        [[[UIApplication sharedApplication].delegate window].rootViewController performSelector:@selector(showPivotBar)];
    }
}
%end

%hook YTIHamplayerServerABRConfig
- (BOOL)skipFilterPreferredVideoFormats { return YES; }
- (BOOL)fallbackOnError { return NO; }
- (void)setFallbackOnError:(BOOL)arg1 { %orig(NO); }
- (BOOL)useReloadContextForFallback { return NO; }
- (void)setUseReloadContextForFallback:(BOOL)arg1 { %orig(NO); }
- (NSInteger)maxFallbackAttempts { return 0; }
%end

%hook YTImageZoomNode
- (NSInteger)maxFallbackAttempts { return %orig; }
%end

%hook ASCollectionView
- (CGSize)sizeForElement:(id)element { return %orig; }
%end

%hook YTPivotBarItemView
- (UIButton *)navigationButton { return %orig; }
- (void)setRenderer:(id)renderer {
    %orig;
    if (YTLBool(@"removeLabels")) {
        [[self navigationButton] setTitle:@"" forState:UIControlStateNormal];
    }
}
- (void)layoutSubviews {
    %orig;
    if (YTLBool(@"removeIndicators")) {
        [[self valueForKey:@"indicatorDot"] setAlpha:0.0];
    }
}
%end

%hook YTGuideServiceCoordinator
- (void)handleResponse:(id)resp withCompletion:(id)comp { %orig; }
- (void)handleResponse:(id)resp error:(id)err completion:(id)comp { %orig; }
%end

%hook YTAppGuideServiceCoordinator
- (void)handleResponse:(id)resp error:(id)err completion:(id)comp { %orig; }
%end

%hook YTGuideServiceCoordinatorImpl
- (void)handleResponse:(id)resp error:(id)err completion:(id)comp { %orig; }
- (void)handleLegacyResponse:(id)resp error:(id)err completion:(id)comp { %orig; }
%end

%hook YTAppViewController
- (void)showPivotBar {
    if (YTLBool(@"shortsOnlyMode")) return;
    %orig;
}
%end

%hook YTReelWatchRootViewController
- (void)viewDidAppear:(BOOL)animated {
    %orig;
    if (YTLBool(@"shortsOnlyMode")) {
        [self.navigationController.parentViewController performSelector:@selector(hidePivotBar)];
    }
}
%end

%hook YTSpeedmasterController
- (void)speedmasterDidLongPressWithRecognizer:(UILongPressGestureRecognizer *)gesture {
    if (YTLInt(@"speedIndex") > 0) {
        id delegate = [self valueForKey:@"_delegate"];
        if ([delegate isKindOfClass:%c(YTMainAppVideoPlayerOverlayViewController)]) {
            [[YTPSpeedMaster sharedMaster] manageSpeedMaster:gesture playerOverlayVC:delegate];
            return;
        }
    }
    %orig;
}
%end

%hook YTHUDMessageView
- (id)initWithMessage:(id)msg dismissHandler:(id)handler {
    if (YTLBool(@"noHudMsgs")) return nil;
    return %orig;
}
%end

%hook NSParagraphStyle
+ (NSWritingDirection)defaultWritingDirectionForLanguage:(NSString *)lang {
    return YTLBool(@"disableRTL") ? NSWritingDirectionLeftToRight : %orig;
}
+ (NSWritingDirection)_defaultWritingDirection {
    return YTLBool(@"disableRTL") ? NSWritingDirectionLeftToRight : %orig;
}
%end

%hook UIKeyboardImpl
- (BOOL)floatingForced { return YTLBool(@"floatingKeyboard") ? YES : %orig; }
%end

%hook UIApplication

- (void)openURL:(NSURL *)url options:(NSDictionary *)options completionHandler:(void (^)(BOOL))completion {
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
    %orig(url, options, completion);
}

%end
