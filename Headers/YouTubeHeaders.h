//
// YouTubeHeaders.h
// Reconstructed from com.dvntm.ytlite_5.2.2_iphoneos-arm64e.deb (YTLite 5.2.2)
// Declarations for all hooked YouTube, Google, and Texture (AsyncDisplayKit) classes
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <SafariServices/SafariServices.h>

@interface UIView (YTLiteAdditions)
- (UIViewController *)_viewControllerForAncestor;
@end

@interface UIColor (YTLiteAdditions)
+ (UIColor *)_flatImageWithColor:(UIColor *)color;
@end

@interface YTAlertView : UIView
+ (instancetype)infoDialog;
+ (instancetype)dialog;
+ (instancetype)confirmationDialogWithAction:(void (^)(void))action actionTitle:(NSString *)actionTitle cancelTitle:(NSString *)cancelTitle;
- (void)setTitle:(NSString *)title;
- (void)setSubtitle:(NSString *)subtitle;
- (void)addTitle:(NSString *)title withAction:(void (^)(void))action;
- (void)show;
@end

@interface YTActionSheetAction : NSObject
+ (instancetype)actionWithTitle:(NSString *)title iconImage:(UIImage *)image style:(NSInteger)style handler:(void (^)(void))handler;
+ (instancetype)actionWithTitle:(NSString *)title subtitle:(NSString *)subtitle iconImage:(UIImage *)image handler:(void (^)(void))handler;
+ (instancetype)actionWithTitle:(NSString *)title iconImage:(UIImage *)image secondaryIconImage:(UIImage *)secImage accessibilityIdentifier:(NSString *)ident handler:(void (^)(void))handler;
+ (instancetype)actionWithTitle:(NSString *)title currentValue:(NSString *)val iconImage:(UIImage *)image accessibilityIdentifier:(NSString *)ident handler:(void (^)(void))handler;
- (UIButton *)button;
@end

@interface YTDefaultSheetController : NSObject
+ (instancetype)sheetControllerWithParentResponder:(id)responder;
+ (instancetype)sheetControllerWithMessage:(NSString *)msg delegate:(id)del parentResponder:(id)responder;
+ (instancetype)sheetControllerWithMessage:(NSString *)msg subMessage:(NSString *)subMsg delegate:(id)del parentResponder:(id)responder;
- (void)addAction:(YTActionSheetAction *)action;
- (void)setSourceView:(UIView *)view;
- (void)presentFromViewController:(UIViewController *)vc animated:(BOOL)animated completion:(void (^)(void))completion;
@end

@interface YTAssetLoader : NSObject
- (instancetype)initWithBundle:(NSBundle *)bundle;
- (UIImage *)imageNamed:(NSString *)name;
@end

@interface YTUIResources : NSObject
+ (UIImage *)actionsheetShareImage;
+ (UIImage *)youtubeLogoWithPageStyle:(NSInteger)style;
+ (UIImage *)youtubePremiumLogoWithPageStyle:(NSInteger)style;
@end

@interface YTUIUtils : NSObject
+ (UIViewController *)topViewControllerForPresenting;
@end

@interface YTActivePlaybackRateModel : NSObject
- (instancetype)initWithRate:(float)rate;
- (float)activeRate;
@end

@interface APMAEU : NSObject
+ (BOOL)isFAS;
@end

@interface ASCollectionView : UICollectionView
- (CGSize)sizeForElement:(id)element;
@end

@interface ASDisplayNode : NSObject
- (id)copiedComment;
- (id)copiedURL;
- (void)dealloc;
- (void)setCopiedComment:(id)arg1;
- (void)setCopiedURL:(id)arg1;
- (void)setFrame:(CGRect)arg1;
- (void)setYogaChildren:(id)arg1;
@end

@interface ELMComponent : NSObject
- (id)node;
@end

@interface ELMPBShowActionSheetCommand : NSObject
- (void)executeWithCommandContext:(id)arg1 handler:(id)arg2;
@end

@interface ELMTouchCommandPropertiesHandler : NSObject
- (void)handleTap;
@end

@interface GCKBUtils : NSObject
+ (id)appIdentifier;
@end

@interface GNPEncryptionConfiguration : NSObject
+ (id)keychainAccessGroup;
@end

@interface GOODimmingBackgroundView : UIView
- (void)layoutSubviews;
@end

@interface GULAppEnvironmentUtil : NSObject
+ (BOOL)isFromAppStore;
@end

@interface GVROverlayView : UIView
+ (id)appName;
@end

@interface LSApplicationProxy : NSObject
- (id)appIDPrefix;
- (id)applicationIdentifier;
- (id)teamID;
@end

@interface LSBundleProxy : NSObject
- (id)bundleIdentifier;
@end

@interface MDXLocalNetworkPermissions : NSObject
- (BOOL)isAuthorized;
- (NSInteger)lastKnownPermissionsStatus;
- (BOOL)localNetworkPermissionCheckRequired;
@end

@interface MDXPlaybackRouteButtonController : NSObject
- (BOOL)isPersistentCastIconEnabled;
- (void)updateAllRouteButtons;
- (void)updateRouteButton:(id)arg1;
@end

@interface MDXSession : NSObject
- (id)adPlaying:(id)arg1;
@end

@interface MLVideo : NSObject
- (BOOL)playableInBackground;
@end

@interface OGLBundle : NSObject
+ (id)shortAppName;
@end

@interface OGLPhenotypeFlagServiceImpl : NSObject
- (id)bundleId;
@end

@interface QTMIcon : NSObject
+ (id)imageWithName:(id)arg1 color:(id)arg2;
@end

@interface SFAuthenticationViewController : UIViewController
- (id)viewDidAppear:(id)arg1;
@end

@interface SSOConfiguration : NSObject
- (id)initWithClientID:(id)arg1 supportedAccountServices:(id)arg2;
@end

@interface SSOFolsomKeychainUtils : NSObject
+ (id)sharedAccessGroup;
@end

@interface SSOKeychainCore : NSObject
+ (id)accessGroup;
+ (id)sharedAccessGroup;
@end

@interface SSOKeychainHelper : NSObject
+ (id)accessGroup;
+ (id)sharedAccessGroup;
@end

@interface UIInputView : UIView
- (void)layoutSubviews;
@end

@interface UIKBVisualEffectView : UIVisualEffectView
- (void)layoutSubviews;
@end

@interface UIKeyboard : UIView
- (id)displayLayer:(id)arg1;
@end

@interface UIKeyboardDockView : UIView
- (void)layoutSubviews;
@end

@interface UIKeyboardImpl : UIView
- (BOOL)floatingForced;
@end

@interface UIPredictionViewController : UIViewController
- (id)_currentTextSuggestions;
@end

@interface YCHLiveChatView : UIView
- (void)layoutSubviews;
@end

@interface YTAccountScopedAdsInnerTubeContextDecorator : NSObject
- (void)decorateContext:(id)arg1;
@end

@interface YTAdShieldUtils : NSObject
+ (id)spamSignalsDictionary;
+ (id)spamSignalsDictionaryWithoutIDFA;
@end

@interface YTAdsInnerTubeContextDecorator : NSObject
- (void)decorateContext:(id)arg1;
@end

@interface YTAnnotationsViewController : UIViewController
- (void)loadFeaturedChannelWatermark;
@end

@interface YTAppDelegate : NSObject
- (void)appDidBecomeActive;
- (id)application:(id)arg1 didFinishLaunchingWithOptions:(id)arg2;
@end

@interface YTAppGuideServiceCoordinator : NSObject
- (void)handleResponse:(id)arg1 error:(id)arg2 completion:(id)arg3;
@end

@interface YTAppSettingsPresentationData : NSObject
+ (id)settingsCategoryOrder;
@end

@interface YTAppViewController : UIViewController
- (void)showPivotBar;
@end

@interface YTBrandGradientImageProcessor : NSObject
- (void)willDrawInContext:(id)arg1 drawParameters:(id)arg2;
@end

@interface YTChipCloudCell : UICollectionViewCell
- (id)framesForChipViewsWithWidth:(CGFloat)width;
@end

@interface YTColdConfig : NSObject
- (BOOL)cxClientEnableIosLocalNetworkPermissionReliabilityFixes;
- (BOOL)cxClientEnableIosLocalNetworkPermissionUsingSockets;
- (BOOL)cxClientEnableIosLocalNetworkPermissionWifiFixes;
- (BOOL)disablePlaybackLockScreenController;
- (BOOL)enableChipsInTheCommentsHeaderIos;
- (BOOL)enableHideChipsInTheCommentsHeaderOnScrollIos;
- (BOOL)enableLightThemeAmbientMode;
- (BOOL)enableSwipeToRemoveInPlaylistWatchEp;
- (BOOL)enableTurnOffCinematicForFrameWithBlackBars;
- (BOOL)enableYouthereCommandsOnIos;
- (BOOL)iosAmbientModeExtendWidthInLandscape;
- (BOOL)iosEnableFullScreenAmbientMode;
- (BOOL)iosEnableVideoPlayerScrubber;
- (BOOL)iosPlayerClientSharedConfigPopulateSwAv1MediaCapabilities;
- (BOOL)iosUseSystemVolumeControlInFullscreen;
- (BOOL)isLandscapeEngagementPanelSwipeRightToDismissEnabled;
- (BOOL)mainAppCoreClientIosEnableStartupAnimation;
- (BOOL)mediaEngineClientForceSoftwareDecoderOnDecoderRetry;
- (BOOL)mobileShortsTabInlined;
- (BOOL)queueClientGlobalConfigEnableFloatingPlaylistMinibar;
- (BOOL)removeNextPaddleForSingletonVideos;
- (BOOL)removePreviousPaddleForSingletonVideos;
- (BOOL)replaceNextPaddleWithFastForwardButtonForSingletonVods;
- (BOOL)replacePreviousPaddleWithRewindButtonForSingletonVods;
- (BOOL)shouldUseAppThemeSetting;
@end

@interface YTCollectionViewController : UIViewController
- (id)collectionView:(id)arg1 didSelectItemAtIndexPath:(id)arg2;
@end

@interface YTColor : NSObject
+ (id)bgColorForPageStyle:(id)arg1;
+ (id)black0;
+ (id)black1;
+ (id)black2;
+ (id)black3;
+ (id)black4;
@end

@interface YTCommerceEventGroupHandler : NSObject
- (void)addEventHandlers;
@end

@interface YTCreatorEndscreenView : UIView
- (void)setHidden:(BOOL)arg1;
@end

@interface YTDataUtils : NSObject
+ (id)spamSignalsDictionary;
+ (id)spamSignalsDictionaryWithoutIDFA;
@end

@interface YTDefaultSheetController : NSObject
- (void)addAction:(id)arg1;
@end

@interface YTELMResourceLoader : NSObject
- (id)imageWithName:(id)arg1 color:(id)arg2 bundleId:(id)arg3;
@end

@interface YTExitFullscreenController : NSObject
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer;
@end

@interface YTFirstTimeSignInViewController : UIViewController
- (id)viewDidAppear:(id)arg1;
- (id)viewDidDisappear:(id)arg1;
@end

@interface YTFullscreenActionsView : UIView
- (BOOL)enabled;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)arg1;
@end

@interface YTFullscreenEngagementOverlayController : NSObject
- (void)setRelatedVideosVisible:(BOOL)arg1;
@end

@interface YTFullscreenEngagementOverlayView : UIView
- (void)setExpanded:(BOOL)arg1;
@end

@interface YTGlobalConfig : NSObject
- (BOOL)shouldBlockUpgradeDialog;
@end

@interface YTGuideServiceCoordinator : NSObject
- (void)handleResponse:(id)arg1 error:(id)arg2 completion:(id)arg3;
- (void)handleResponse:(id)arg1 withCompletion:(id)arg2;
@end

@interface YTGuideServiceCoordinatorImpl : NSObject
- (void)handleLegacyResponse:(id)arg1 error:(id)arg2 completion:(id)arg3;
- (void)handleResponse:(id)arg1 error:(id)arg2 completion:(id)arg3;
@end

@interface YTHUDMessageView : UIView
- (id)initWithMessage:(id)arg1 dismissHandler:(id)arg2;
@end

@interface YTHeaderContentComboView : UIView
- (void)enableSubheaderBarWithView:(id)arg1;
- (void)setFeedHeaderScrollMode:(NSInteger)arg1;
@end

@interface YTHeaderView : UIView
- (BOOL)clipsToStatusArea;
- (BOOL)stickyNavHeaderEnabled;
@end

@interface YTHotConfig : NSObject
- (BOOL)clientInfraClientConfigIosEnableFillingEncodedHacksInnertubeContext;
- (BOOL)enablePlayerBarForVerticalVideoWhenControlsHiddenInFullscreen;
- (BOOL)enableShortsVideoQualityPicker;
- (BOOL)isPromptForLocalNetworkPermissionsEnabled;
@end

@interface YTIAuxiliaryUi : NSObject
- (void)setHasMessageRenderers:(BOOL)arg1;
- (void)setMessageRenderers:(id)arg1;
@end

@interface YTIBackgroundOfflineSettingCategoryEntryRenderer : NSObject
- (BOOL)isBackgroundEnabled;
@end

@interface YTIClientMdxGlobalConfig : NSObject
- (BOOL)enableSkippableAd;
@end

@interface YTICoWatchability : NSObject
- (void)setType:(NSInteger)arg1;
- (NSInteger)type;
@end

@interface YTICommand : NSObject
- (id)yt_showEngagementPanelEndpoint;
@end

@interface YTICommandWrapperPromoRenderer : NSObject
- (id)clientFrequencyCapConfigsArray;
- (NSUInteger)clientFrequencyCapConfigsArray_Count;
- (void)setHasPromoCommand:(BOOL)arg1;
- (void)setHasPromoType:(BOOL)arg1;
- (void)setHasWatchPageTriggerCondition:(BOOL)arg1;
- (void)setPromoCommand:(id)arg1;
- (void)setPromoType:(NSInteger)arg1;
- (void)setWatchPageTriggerCondition:(NSInteger)arg1;
@end

@interface YTIElementRenderer : NSObject
- (id)elementData;
@end

@interface YTIHamplayerServerABRConfig : NSObject
- (BOOL)fallbackOnError;
- (NSInteger)maxFallbackAttempts;
- (void)setFallbackOnError:(BOOL)arg1;
- (void)setUseReloadContextForFallback:(BOOL)arg1;
- (BOOL)skipFilterPreferredVideoFormats;
- (BOOL)useReloadContextForFallback;
@end

@interface YTIHeartbeatAttestationConfig : NSObject
- (BOOL)hasRequiresAttestation;
- (BOOL)requiresAttestation;
@end

@interface YTIHeartbeatResponse : NSObject
- (BOOL)authenticationMismatch;
- (BOOL)hasAuthenticationMismatch;
- (BOOL)hasStopHeartbeat;
- (BOOL)stopHeartbeat;
@end

@interface YTIIcon : NSObject
- (NSInteger)iconType;
@end

@interface YTIIosPlayerAttestationConfig : NSObject
- (BOOL)hasIosguardEnable;
- (BOOL)iosguardEnable;
@end

@interface YTIIosPlayerConfig : NSObject
- (BOOL)hasHeartbeatPolicyErrorIsNonFatal;
- (BOOL)hasRequestIosguardDataAfterPlaybackStarts;
- (BOOL)heartbeatPolicyErrorIsNonFatal;
- (BOOL)requestIosguardDataAfterPlaybackStarts;
@end

@interface YTIIosSystemShareEndpoint : NSObject
- (id)shareURL;
@end

@interface YTIMediaQualitySettingsHotConfig : NSObject
- (BOOL)enableQuickMenuVideoQualitySettings;
- (BOOL)omitAdvancedMenuOptionForAirPlay;
@end

@interface YTIPivotBarRenderer : NSObject
- (NSInteger)backgroundStyle;
@end

@interface YTIPlayabilityStatus : NSObject
- (BOOL)isPlayableInBackground;
@end

@interface YTIPlayerColdConfig : NSObject
- (BOOL)iosDisablePlaybackLockScreenController;
@end

@interface YTIPlayerResponse : NSObject
- (id)adSlotsArray;
- (id)auxiliaryUi;
- (BOOL)isMonetized;
- (id)playerAdsArray;
- (void)setAuxiliaryUi:(id)arg1;
- (void)setHasAuxiliaryUi:(BOOL)arg1;
@end

@interface YTIPromoMessageSupportedRenderers : NSObject
- (NSInteger)rendererOneOfCase;
- (void)setCommandWrapperPromoRenderer:(id)arg1;
- (void)setHasCommandWrapperPromoRenderer:(BOOL)arg1;
- (void)setHasUpsellDialogRenderer:(BOOL)arg1;
- (void)setUpsellDialogRenderer:(id)arg1;
@end

@interface YTIShowFullscreenInterstitialCommand : NSObject
- (BOOL)shouldThrottleInterstitial;
@end

@interface YTITriggerConditions : NSObject
- (BOOL)hasPlayerCueRangeSet;
- (NSUInteger)validAdsStatesArray_Count;
@end

@interface YTIVideoPlaybackRelativePosition : NSObject
- (BOOL)hasStreamTimeMs;
- (id)streamTimeMs;
@end

@interface YTImageZoomNode : NSObject
- (NSInteger)maxFallbackAttempts;
@end

@interface YTInlineMutedPlaybackAudioIconView : UIView
- (void)updateColors;
@end

@interface YTInlineMutedPlaybackAudioIconViewController : UIViewController
- (void)setYtlIcon:(id)arg1;
- (void)viewDidLoad;
- (id)ytlButton;
- (id)ytlIcon;
@end

@interface YTInlineMutedPlaybackPlayerOverlayView : UIView
- (NSInteger)audioControlUIStyle;
- (void)resetWithAudioControlUIStyle:(id)arg1;
- (NSInteger)scrubbingUIStyle;
- (void)setAudioControlUIStyle:(NSInteger)arg1;
- (void)updateAudioControlUIStyle:(id)arg1;
@end

@interface YTInlineMutedPlaybackPlayerOverlayViewController : UIViewController
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)g1 shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)g2;
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer;
- (void)handleHorizontalPan:(id)arg1;
- (NSInteger)scrubbingUIStyle;
- (void)setPaidContentWithPlayerData:(id)arg1;
- (void)viewDidLoad;
@end

@interface YTInlineMutedPlaybackScrubberView : UIView
- (void)addGradient;
- (void)layoutSubviews;
- (void)setMediaTime:(CGFloat)arg1;
@end

@interface YTInlineMutedPlaybackScrubbingSlider : UISlider
- (id)currentMinimumTrackImage;
@end

@interface YTInlineMutedPlaybackShortsPlayerOverlayView : UIView
- (void)didTapYtlButton:(id)arg1;
- (void)layoutSubviews;
@end

@interface YTInlinePlayerBarContainerView : UIView
- (void)didPressScrubber:(id)arg1;
- (id)endTimeString;
- (id)quietProgressBarColor;
- (id)sbTimeString;
- (void)setEndTimeString:(id)arg1;
- (void)setFrame:(CGRect)arg1;
- (void)setPeekableViewVisible:(BOOL)arg1;
- (void)setPlayerBarAlpha:(CGFloat)arg1;
- (void)setSbTimeString:(id)arg1;
@end

@interface YTInlineSignInController : NSObject
- (void)didTapShowAddAccount;
@end

@interface YTInlineSignInViewController : UIViewController
- (id)viewDidDisappear:(id)arg1;
@end

@interface YTInnerTubeCollectionViewController : UIViewController
- (void)addSectionsFromArray:(id)arg1;
@end

@interface YTInterstitialPromoEventGroupHandler : NSObject
- (void)addEventHandlers;
@end

@interface YTLocalPlaybackController : NSObject
- (id)createAdsPlaybackCoordinator;
@end

@interface YTMainAppControlsOverlayView : UIView
- (void)dealloc;
- (void)handleYTLDiscordTap:(id)arg1;
- (void)handleYTLIconTap:(id)arg1;
- (void)handleYTLLockTap:(id)arg1;
- (void)handleYTLMuteTap:(id)arg1;
- (void)handleYTLSbTap:(id)arg1;
- (void)handleYTLSleepTap:(id)arg1;
- (id)initWithDelegate:(id)arg1;
- (void)layoutSubviews;
- (id)playbackRouteButton;
- (void)resetSpeedValue:(id)arg1;
- (void)setAutoplaySwitchButtonRenderer:(id)arg1;
- (void)setClosedCaptionsOrSubtitlesButtonAvailable:(BOOL)arg1;
- (void)setOverlayVisible:(BOOL)arg1;
- (void)setSpeedControls:(id)arg1;
- (void)setSpeedMinus:(id)arg1;
- (void)setSpeedPlus:(id)arg1;
- (void)setSpeedValue:(id)arg1;
- (void)setYtlButton:(id)arg1;
- (void)setYtlButtons:(id)arg1;
- (void)setYtlButtonsFSTopAnchor:(id)arg1;
- (void)setYtlButtonsFSTrailingAnchor:(id)arg1;
- (void)setYtlButtonsTopAnchor:(id)arg1;
- (void)setYtlButtonsTrailingAnchor:(id)arg1;
- (void)setYtlDiscordButton:(id)arg1;
- (void)setYtlLockButton:(id)arg1;
- (void)setYtlMuteButton:(id)arg1;
- (void)setYtlSbButton:(id)arg1;
- (void)setYtlSleepButton:(id)arg1;
- (void)showSpeedControl:(id)arg1;
- (id)speedControls;
- (id)speedDidChange:(id)arg1;
- (id)speedMinus;
- (id)speedPlus;
- (id)speedValue;
- (id)speedValueMinus:(id)arg1;
- (id)speedValuePlus:(id)arg1;
- (id)ytlButton;
- (id)ytlButtons;
- (id)ytlButtonsFSTopAnchor;
- (id)ytlButtonsFSTrailingAnchor;
- (id)ytlButtonsTopAnchor;
- (id)ytlButtonsTrailingAnchor;
- (id)ytlDiscordButton;
- (id)ytlLockButton;
- (id)ytlMuteButton;
- (id)ytlSbButton;
- (id)ytlSleepButton;
@end

@interface YTMainAppVideoPlayerOverlayView : UIView
- (id)autonavPreviewView;
- (id)featuredChannelWatermarkImageView;
- (BOOL)isWatermarkEnabled;
- (void)setBackgroundVisible:(BOOL)visible isGradientBackground:(BOOL)gradient;
- (void)setSeekAnywherePanGestureRecognizer:(id)arg1;
- (id)speedmasterYtLite:(id)arg1;
@end

@interface YTMainAppVideoPlayerOverlayViewController : UIViewController
- (BOOL)allowDoubleTapToSeekGestureRecognizer;
- (BOOL)allowTwoFingerDoubleTapGestureRecognizer;
- (void)didPressPause:(id)arg1;
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer;
- (void)handleFingerPan:(id)arg1;
- (void)handleTwoFingerTap:(id)arg1;
- (id)playerOverlayProvider:(id)arg1 didInsertPlayerOverlay:(id)arg2;
- (id)selectedVarispeedLabelText;
- (void)setFeaturedChannelWatermarkImageView:(id)arg1;
- (void)setLoopMode:(NSInteger)arg1;
- (BOOL)shouldShowAutonavEndscreen;
- (void)viewDidLoad;
@end

@interface YTMenuItemVisibilityHandler : NSObject
- (BOOL)shouldShowServiceItemRenderer:(id)renderer;
@end

@interface YTModularPlayerBarView : UIView
- (void)layoutSubviews;
@end

@interface YTMultiSizeViewController : UIViewController
- (id)helper;
- (void)setHelper:(id)arg1;
@end

@interface YTMySubsFilterHeaderView : UIView
- (void)setChipFilterView:(id)arg1;
@end

@interface YTPersonalizedSuggestionsCacheProvider : NSObject
- (id)activeCache;
@end

@interface YTPivotBarItemView : UIView
- (void)layoutSubviews;
- (id)navigationButton;
- (void)setRenderer:(id)arg1;
@end

@interface YTPivotBarView : UIView
- (id)contextMenuInteraction:(id)arg1 configurationForMenuAtLocation:(id)arg2;
- (id)itemView1;
@end

@interface YTPivotBarViewController : UIViewController
- (BOOL)isFrostedPivotBarPermitted;
- (id)viewDidAppear:(id)arg1;
@end

@interface YTPlayabilityResolutionUserActionUIController : NSObject
- (void)showConfirmAlert;
@end

@interface YTPlaybackConfig : NSObject
- (void)setStartPlayback:(BOOL)arg1;
@end

@interface YTPlaybackHeartbeatController : NSObject
- (id)haltPlaybackWithError:(id)arg1 forHeartbeatController:(id)arg2;
@end

@interface YTPlayerBarProgressDecorationView : UIView
- (void)applyGradientColorForRect:(CGRect)rect withOverallGradient:(id)gradient;
- (void)applyGradientForRect:(CGRect)rect;
- (void)drawProgressRect:(CGRect)rect withColor:(UIColor *)color;
- (BOOL)isStateActive;
@end

@interface YTPlayerBarRectangleDecorationView : UIView
- (void)applyGradientColorForRect:(CGRect)rect withOverallGradient:(id)gradient;
- (void)applyGradientForRect:(CGRect)rect;
- (void)drawProgressRect:(CGRect)rect withColor:(UIColor *)color;
- (BOOL)isStateActive;
@end

@interface YTPlayerBarScrubberDotDecorationView : UIView
- (id)scrubberDot;
@end

@interface YTPlayerBarScrubberDotDecorationViewV1 : UIView
- (id)scrubberDot;
@end

@interface YTPlayerView : UIView
- (id)didPinch:(id)arg1;
@end

@interface YTPlayerViewController : UIViewController
- (void)autoFullscreen;
- (void)autoQuality;
- (void)dealloc;
- (id)playbackController:(id)arg1 didActivateVideo:(id)arg2 withPlaybackData:(id)arg3;
- (void)potentiallyMutatedSingleVideo:(id)video currentVideoTimeDidChange:(id)time;
- (void)restoreLoopMode;
- (id)sbPlaybackController;
- (void)seekToTime:(CGFloat)time;
- (void)seekToTime:(CGFloat)time seekSource:(int)source;
- (void)seekToTime:(CGFloat)time toleranceBefore:(CGFloat)before toleranceAfter:(CGFloat)after seekSource:(int)source;
- (void)selectAudioTrack;
- (void)selectCaptions;
- (void)setAutoSpeed;
- (void)setSbPlaybackController:(id)arg1;
- (void)singleVideo:(id)video currentVideoTimeDidChange:(id)time;
@end

@interface YTPlaylistMiniBarView : UIView
- (void)setFrame:(CGRect)arg1;
@end

@interface YTPlaylistVideoCell : UICollectionViewCell
- (void)setCanReorder:(BOOL)arg1;
@end

@interface YTProgressView : UIView
- (void)setProgress:(CGFloat)arg1;
- (void)setProgressBarColor:(id)arg1;
@end

@interface YTPromoThrottleController : NSObject
- (BOOL)canShowThrottledPromo;
- (BOOL)canShowThrottledPromoWithFrequencyCap:(id)arg1;
- (BOOL)canShowThrottledPromoWithFrequencyCaps:(id)arg1;
@end

@interface YTPromosheetEventGroupHandler : NSObject
- (void)addEventHandlers;
@end

@interface YTQTMButton : UIButton
- (void)layoutSubviews;
@end

@interface YTReelContentModel : NSObject
+ (id)makeContentModelForEntry:(id)arg1;
@end

@interface YTReelContentView : UIView
- (void)dealloc;
- (id)reelSpeedmaster:(id)arg1;
- (void)setPlaybackView:(id)arg1;
- (id)turnShortsOnlyModeOff:(id)arg1;
@end

@interface YTReelDataSource : NSObject
- (id)makeContentModelForEntry:(id)arg1;
@end

@interface YTReelHeaderView : UIView
- (void)addView:(UIView *)view toStackView:(UIStackView *)stackView withSize:(CGSize)size;
- (void)setTitleLabelVisible:(BOOL)visible animated:(BOOL)animated;
@end

@interface YTReelInfinitePlaybackDataSource : NSObject
- (id)makeContentModelForEntry:(id)arg1;
- (id)reels;
@end

@interface YTReelPlayerViewController : UIViewController
- (void)autoQuality;
- (void)maybeLoopPlayback;
- (id)playbackControllerDidActivateVideo:(id)arg1 withPlayerResponse:(id)arg2;
- (id)playbackControllerDidFinishPlaybackAndWillTransitionInternallyToNextPlayback:(id)arg1;
- (BOOL)shouldAlwaysEnablePlayerBar;
- (BOOL)shouldEnablePlayerBar;
- (BOOL)shouldEnablePlayerBarOnlyOnPause;
@end

@interface YTReelPlayerViewControllerSub : UIViewController
- (BOOL)shouldAlwaysEnablePlayerBar;
- (BOOL)shouldEnablePlayerBar;
- (BOOL)shouldEnablePlayerBarOnlyOnPause;
@end

@interface YTReelWatchHeaderView : UIView
- (void)setActionElement:(id)arg1;
- (void)setBadgeRenderer:(id)arg1;
- (void)setChannelBarElementRenderer:(id)arg1;
- (void)setHeaderRenderer:(id)arg1;
- (void)setMultiFormatLinkElementRenderer:(id)arg1;
- (void)setShortsVideoTitleElementRenderer:(id)arg1;
- (void)setSoundMetadataElementRenderer:(id)arg1;
@end

@interface YTReelWatchPlaybackOverlayView : UIView
- (void)didTapYtlButton:(id)arg1;
- (void)layoutSubviews;
- (void)setActionBarElementRenderer:(id)arg1;
- (void)setReelLikeButton:(id)arg1;
@end

@interface YTReelWatchPlaybackOverlayViewSub : UIView
- (void)didTapYtlButton:(id)arg1;
- (void)layoutSubviews;
@end

@interface YTReelWatchRootViewController : UIViewController
- (id)viewDidAppear:(id)arg1;
@end

@interface YTRightNavigationButtons : UIView
- (void)layoutSubviews;
@end

@interface YTSearchViewController : UIViewController
- (void)setSuggestions:(id)arg1;
- (void)viewDidLoad;
@end

@interface YTSegmentableInlinePlayerBarView : UIView
- (void)dealloc;
@end

@interface YTSettings : NSObject
- (BOOL)areHintsDisabled;
- (void)setDisableMDXDeviceDiscovery:(BOOL)arg1;
- (void)setHintsDisabled:(BOOL)arg1;
@end

@interface YTSettingsCell : UICollectionViewCell
- (void)setDetailText:(id)arg1;
@end

@interface YTSettingsSectionController : NSObject
- (void)setSelectedItem:(id)arg1;
@end

@interface YTSettingsSectionItemManager : NSObject
- (void)updatePremiumEarlyAccessSectionWithEntry:(id)arg1;
- (void)updateSectionForCategory:(id)arg1 withEntry:(id)arg2;
- (void)updateYTLiteSectionWithEntry:(id)arg1;
@end

@interface YTShortsPlayerViewController : UIViewController
- (BOOL)shouldAlwaysEnablePlayerBar;
- (BOOL)shouldEnablePlayerBarOnlyOnPause;
@end

@interface YTShortsStartupCoordinator : NSObject
- (BOOL)evaluateResumeToShorts;
@end

@interface YTSingleVideoController : NSObject
- (void)setAudioFormatConstraint:(id)arg1;
@end

@interface YTSingleVideoHeartbeatController : NSObject
- (void)haltIfNeeded;
@end

@interface YTSpeedmasterController : NSObject
- (id)speedmasterDidLongPressWithRecognizer:(id)arg1;
@end

@interface YTStartupAnimationViewController : UIViewController
- (void)dealloc;
- (void)playLottieAnimation;
- (void)viewDidLoad;
@end

@interface YTSurveyController : NSObject
- (void)showSurveyWithRenderer:(id)arg1 surveyParentResponder:(id)arg2;
@end

@interface YTToastOffsetController : NSObject
- (void)setWasPinnedTop:(BOOL)arg1;
- (void)update;
@end

@interface YTUserDefaults : NSUserDefaults
- (void)setProgress:(CGFloat)arg1;
@end

@interface YTVersionUtils : NSObject
+ (id)appID;
+ (id)appName;
+ (id)appVersion;
@end

@interface YTVerticalPanGestureRecognier : UIPanGestureRecognizer
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer;
@end

@interface YTVideoFreeZoomOverlayController : NSObject
- (void)freeZoomViewDidZoom:(id)view isTwoFingerZoom:(BOOL)twoFinger;
@end

@interface YTVideoQualitySwitchOriginalController : NSObject
- (void)dealloc;
- (id)redesignedController;
- (void)setRedesignedController:(id)arg1;
- (void)setUserSelectableFormats:(id)arg1;
@end

@interface YTWatchCinematicContainerController : NSObject
- (BOOL)isCinematicLightingAvailable;
@end

@interface YTWatchController : NSObject
- (void)handleRemoteControlEvent:(NSInteger)event withInterval:(double)interval;
@end

@interface YTWatchFloatingMiniplayerViewController : UIViewController
- (void)updateMiniBarPlayerStateFromRenderer;
@end

@interface YTWatchFloatingMiniplayerWithControlsOverlayView : UIView
- (void)layoutSubviews;
@end

@interface YTWatchFlowController : NSObject
- (BOOL)shouldExitFullScreenOnFinish;
@end

@interface YTWatchMiniBarViewController : UIViewController
- (void)updateMiniBarPlayerStateFromRenderer;
@end

@interface YTWatchNextResponseViewController : UIViewController
- (void)loadWithModel:(id)arg1;
@end

@interface YTWatchNextResultsViewController : UIViewController
- (void)setVisibleSections:(id)arg1;
@end

@interface YTWatchPlaybackController : NSObject
- (void)clearPlaybackController;
- (id)playbackControllerDidFinishPlaybackAndWillTransitionInternallyToNextPlayback:(id)arg1;
- (void)playbackControllerDidPause;
- (void)playbackControllerDidPlay;
@end

@interface YTWatchViewController : UIViewController
- (NSInteger)allowedFullScreenOrientations;
- (void)setFullscreen:(BOOL)arg1;
@end

@interface YTYouThereController : NSObject
- (BOOL)shouldShowYouTherePrompt;
@end

@interface _ASDisplayView : UIView
- (id)commentManager:(id)arg1;
- (void)didMoveToWindow;
- (id)postManager:(id)arg1;
- (id)savePFP:(id)arg1;
- (void)setKeepalive_node:(id)arg1;
@end

@interface _UIConcretePasteboard : NSObject
- (void)setString:(id)arg1;
@end

