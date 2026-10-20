//
// YTLiteClasses.h
// Reconstructed from com.dvntm.ytlite_5.2.2_iphoneos-arm64e.deb (YTLite.dylib)
// All 51 internal Objective-C classes and 3 categories
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import <WebKit/WebKit.h>
#import <Photos/Photos.h>
#import <PhotosUI/PhotosUI.h>
#import <AuthenticationServices/AuthenticationServices.h>
#import <MediaPlayer/MediaPlayer.h>

#ifdef __cplusplus
extern "C" {
#endif
NSString *jbroot(NSString *path);
#ifdef __cplusplus
}
#endif

// Forward declarations
@class InitWorkaround;
@class WelcomeVC;
@class DownloadMenuHelper;
@class YTPTableViewCell;
@class DVNPickerView;
@class DVNTableViewController;
@class TabbarVC;
@class YTPSettingsBuilder;
@class DVNTableModel;
@class DVNSection;
@class DVNCell;
@class DVNSupportersVC;
@class SBSegment;
@class SBPlaybackController;
@class SBManager;
@class SBPlayerDecorator;
@class SBPlayerDecorationData;
@class DVNMediaPicker;
@class YTPMedia;
@class DVNHorizontalPanDelegate;
@class ToastView;
@class ToastWindow;
@class ToastManager;
@class YTPAPIHelper;
@class Downloader;
@class AudioManager;
@class YTPDownloader;
@class SbWhitelistVC;
@class YTPTranslator;
@class TranslatorVC;
@class YTLUserDefaults;
@class DVNSheetPresenter;
@class PseudoDetentController;
@class PseudoDetentTransitioningDelegate;
@class DVNLongPressDelegate;
@class YTPPlayerHelper;
@class FFMpegHelper;
@class SRTParser;
@class YTPDB;
@class YTPSleepTimer;
@class RPCMedia;
@class YTPDiscordRPC;
@class DVNImageViewController;
@class BlurButton;
@class YTPSpeedMaster;
@class Dvbug;
@class YTLHelper;
@class YTPSpeedPopupController;
@class YTPSpeedControlView;
@class PlayerToast;
@class CustomHUD;

@protocol DownloaderDelegate <NSObject>
@optional
- (void)downloadProgress:(float)progress;
- (void)downloadDidFinish:(NSURL *)fileURL fileName:(NSString *)fileName;
- (void)downloadDidFailureWithError:(NSError *)error;
@end

@interface NSBundle (YTLite)
+ (NSBundle *)ytl_defaultBundle;
- (UIImage *)imageWithName:(NSString *)name;
- (UIImage *)originalImageWithName:(NSString *)name;
- (UIImage *)imageWithName:(NSString *)name tintColor:(UIColor *)tintColor;
@end

@interface NSString (YTL)
- (NSString *)ytl_localized;
@end

@interface UIViewController (DVNPatreonContext) <ASWebAuthenticationPresentationContextProviding>
- (ASPresentationAnchor)presentationAnchorForWebAuthenticationSession:(ASWebAuthenticationSession *)session;
@end

// Class [0] InitWorkaround
@interface InitWorkaround : UIViewController
{
    id /* block */ _completion; // offset 0x8
}
- (void)viewDidLoad; // IMP @ 0x14764
- (id /* block */)completion; // IMP @ 0x14bc4
- (void)setCompletion:(id /* block */)arg1; // IMP @ 0x14bd4
@end

// Class [1] WelcomeVC
@interface WelcomeVC : UIViewController
{
    UITableView *_tableView; // offset 0x8
    NSArray *_settingsData; // offset 0x10
}
- (void)viewDidLoad; // IMP @ 0x3bd9c
- (void)thanksButtonTapped; // IMP @ 0x3f2d0
- (void)contactsButtonTapped:(id)arg1; // IMP @ 0x3f4c8
- (id)imageNamed:(id)arg1; // IMP @ 0x426f4
- (double)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2; // IMP @ 0x4278c
- (NSInteger)numberOfSectionsInTableView:(id)arg1; // IMP @ 0x4279c
- (NSInteger)tableView:(id)arg1 numberOfRowsInSection:(NSInteger)arg2; // IMP @ 0x427a4
- (void)tableView:(id)arg1 willDisplayCell:(id)arg2 forRowAtIndexPath:(id)arg3; // IMP @ 0x427bc
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2; // IMP @ 0x427f8
- (BOOL)tableView:(id)arg1 shouldHighlightRowAtIndexPath:(id)arg2; // IMP @ 0x42eec
- (void)showAlertWithTitle:(id)arg1 imageName:(id)arg2; // IMP @ 0x42ef4
- (id)cellImageWithName:(id)arg1; // IMP @ 0x43c74
@end

// Class [2] DownloadMenuHelper
@interface DownloadMenuHelper : NSObject
+ (void)showDownloadSheetShorts:(id)arg1 withSender:(id)arg2; // IMP @ 0xf53fc
+ (void)showDownloadSheet:(id)arg1 withSender:(id)arg2; // IMP @ 0xf7c6c
- (void)showVideoSheet:(id)arg1 withSender:(id)arg2; // IMP @ 0xfb194
- (void)showImagesSheet:(id)arg1 withSender:(id)arg2; // IMP @ 0xfd1d4
- (void)showInformationSheet:(id)arg1 withSender:(id)arg2; // IMP @ 0xfe428
- (void)showExtPlayerSheet:(id)arg1 withSender:(id)arg2; // IMP @ 0x100a74
- (id)getVideoFormatsArray:(id)arg1 isShorts:(BOOL)arg2; // IMP @ 0x102a00
- (id)getAudioFormatsArray:(id)arg1; // IMP @ 0x103338
- (id)getBestAudioFormat:(id)arg1 playerVC:(id)arg2; // IMP @ 0x1039fc
- (id)getDefaultAudioTrack:(id)arg1; // IMP @ 0x104218
- (id)getEnglishAudioTrack:(id)arg1; // IMP @ 0x10451c
- (id)detailForMimeType:(id)arg1; // IMP @ 0x104924
- (NSInteger)getResoForQuality:(id)arg1; // IMP @ 0x104e10
- (void)downloadVideoWithFormat:(id)arg1 withAudioFormats:(id)arg2 fileName:(id)arg3 extension:(id)arg4 videoID:(id)arg5 playerVC:(id)arg6 sender:(id)arg7; // IMP @ 0x104f2c
- (void)downloadVideoWithFormat:(id)arg1 audioFormat:(id)arg2 fileName:(id)arg3 extension:(id)arg4 videoID:(id)arg5 playerVC:(id)arg6 sender:(id)arg7; // IMP @ 0x10618c
- (void)downloadVideoWithUrl:(id)arg1 audioUrl:(id)arg2 fileName:(id)arg3 extension:(id)arg4 videoID:(id)arg5 videoSize:(NSUInteger)arg6 audioSize:(NSUInteger)arg7 duration:(NSUInteger)arg8 captions:(id)arg9 playerVC:(id)arg10; // IMP @ 0x1065cc
- (void)getThumbnail:(id)arg1; // IMP @ 0x1069c0
- (void)checkSpaceAvailabilityForMedia:(NSInteger)arg1 completion:(id /* block */)arg2; // IMP @ 0x107364
- (void)showAudioTrackSelector:(id)arg1 sender:(id)arg2 playerVC:(id)arg3 completion:(id /* block */)arg4; // IMP @ 0x107844
- (BOOL)hasCaptions:(id)arg1; // IMP @ 0x108c58
- (void)showTranscriptSheet:(id)arg1 withSender:(id)arg2; // IMP @ 0x1093ec
- (void)showCaptionsSheet:(id)arg1 withSender:(id)arg2; // IMP @ 0x10a2d4
- (id)captionsForDownloading:(id)arg1; // IMP @ 0x10b290
- (id)titleForCaption:(id)arg1; // IMP @ 0x10ba6c
- (void)getCaptionsUrlSheet:(id)arg1 sender:(id)arg2 completion:(id /* block */)arg3; // IMP @ 0x10c030
- (void)shareSRT:(id)arg1 sourceView:(id)arg2; // IMP @ 0x10d350
@end

// Class [3] YTPTableViewCell
@interface YTPTableViewCell : UITableViewCell
- (void)setSelected:(BOOL)arg1 animated:(BOOL)arg2; // IMP @ 0x114d18
- (id)initWithStyle:(NSInteger)arg1 reuseIdentifier:(id)arg2; // IMP @ 0x114f74
@end

// Class [4] DVNPickerView
@interface DVNPickerView : UIPickerView
- (void)layoutSubviews; // IMP @ 0x115970
@end

// Class [5] DVNTableViewController
@interface DVNTableViewController : UITableViewController
{
    NSArray *_searchResults; // offset 0x8
    UISearchBar *_searchBar; // offset 0x10
    BOOL _isSearching; // offset 0x18
    DVNTableModel *_model; // offset 0x20
    NSUserDefaults *_defaults; // offset 0x28
    DVNCell *_pendingScrollCell; // offset 0x30
}
- (id)initWithModel:(id)arg1 defaults:(id)arg2; // IMP @ 0x115d2c
- (void)loadView; // IMP @ 0x116098
- (void)viewDidLoad; // IMP @ 0x116318
- (void)viewWillAppear:(BOOL)arg1; // IMP @ 0x117930
- (void)traitCollectionDidChange:(id)arg1; // IMP @ 0x1179a4
- (void)searchBarSearchButtonClicked:(id)arg1; // IMP @ 0x117aa0
- (void)_removeSearchFieldCornerRadius:(id)arg1; // IMP @ 0x117ab0
- (void)_performSearch:(id)arg1; // IMP @ 0x117e00
- (void)searchBar:(id)arg1 textDidChange:(id)arg2; // IMP @ 0x1187f0
- (void)searchBarCancelButtonClicked:(id)arg1; // IMP @ 0x118854
- (void)searchBarTextDidBeginEditing:(id)arg1; // IMP @ 0x1188cc
- (void)searchBarTextDidEndEditing:(id)arg1; // IMP @ 0x118cd8
- (void)_searchClearTapped:(id)arg1; // IMP @ 0x118da4
- (void)navigateToCell:(id)arg1; // IMP @ 0x118e3c
- (BOOL)cellExistsInModel:(id)arg1 target:(id)arg2; // IMP @ 0x11970c
- (void)highlightRowAtIndexPath:(id)arg1; // IMP @ 0x119d44
- (void)viewDidAppear:(BOOL)arg1; // IMP @ 0x119fe4
- (void)pushController:(id)arg1 withTitle:(id)arg2; // IMP @ 0x11a0fc
- (void)addDismissButton:(BOOL)arg1; // IMP @ 0x11a868
- (void)closeButtonTapped; // IMP @ 0x11a924
- (void)addLeftBarItem:(id)arg1 image:(id)arg2 handler:(id /* block */)arg3; // IMP @ 0x11a960
- (void)addRightBarItem:(id)arg1 image:(id)arg2 handler:(id /* block */)arg3; // IMP @ 0x11ab98
- (void)_barButtonTriggered:(id)arg1; // IMP @ 0x11adfc
- (void)setupThanksHeart; // IMP @ 0x11af8c
- (double)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2; // IMP @ 0x11b640
- (id)tableView:(id)arg1 titleForHeaderInSection:(NSInteger)arg2; // IMP @ 0x11b650
- (id)tableView:(id)arg1 titleForFooterInSection:(NSInteger)arg2; // IMP @ 0x11b744
- (void)tableView:(id)arg1 willDisplayHeaderView:(id)arg2 forSection:(NSInteger)arg3; // IMP @ 0x11b838
- (void)tableView:(id)arg1 willDisplayFooterView:(id)arg2 forSection:(NSInteger)arg3; // IMP @ 0x11bd5c
- (double)tableView:(id)arg1 heightForFooterInSection:(NSInteger)arg2; // IMP @ 0x11bf6c
- (NSInteger)numberOfSectionsInTableView:(id)arg1; // IMP @ 0x11c13c
- (NSInteger)tableView:(id)arg1 numberOfRowsInSection:(NSInteger)arg2; // IMP @ 0x11c1f8
- (id)_cellForIndexPath:(id)arg1; // IMP @ 0x11c330
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2; // IMP @ 0x11c4ec
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2; // IMP @ 0x11eb30
- (id)formatSliderValue:(double)arg1 format:(NSInteger)arg2; // IMP @ 0x11fba8
- (id)pickerView:(id)arg1 viewForRow:(NSInteger)arg2 forComponent:(NSInteger)arg3 reusingView:(id)arg4; // IMP @ 0x11fea0
- (NSInteger)numberOfComponentsInPickerView:(id)arg1; // IMP @ 0x1200b0
- (NSInteger)pickerView:(id)arg1 numberOfRowsInComponent:(NSInteger)arg2; // IMP @ 0x1200b8
- (void)pickerView:(id)arg1 didSelectRow:(NSInteger)arg2 inComponent:(NSInteger)arg3; // IMP @ 0x120128
- (id)headerImage:(id)arg1; // IMP @ 0x1202f8
- (id)iconImage:(id)arg1 mode:(NSInteger)arg2 size:(double)arg3; // IMP @ 0x12054c
- (id)accessoryImage:(id)arg1; // IMP @ 0x1207bc
- (id)_cellForTag:(NSInteger)arg1; // IMP @ 0x120a0c
- (id)_cellsForSection:(id)arg1; // IMP @ 0x120b60
- (id)switchForKey:(id)arg1; // IMP @ 0x120c70
- (void)toggleSwitch:(id)arg1; // IMP @ 0x120ef0
- (void)setSegment:(id)arg1; // IMP @ 0x121048
- (void)sliderValueChanged:(id)arg1; // IMP @ 0x1211a0
- (void)stepperValueChanged:(id)arg1; // IMP @ 0x1214c4
- (void)colorWellTap:(id)arg1; // IMP @ 0x121720
- (BOOL)textFieldShouldReturn:(id)arg1; // IMP @ 0x1218c0
- (void)titleValue:(id)arg1; // IMP @ 0x121920
- (id)segmentForItems:(id)arg1 isCompact:(BOOL)arg2; // IMP @ 0x121c98
- (id)sliderWithKey:(id)arg1 min:(double)arg2 max:(double)arg3; // IMP @ 0x122218
- (id)timePickerForCell:(id)arg1 indexPath:(id)arg2; // IMP @ 0x122560
- (id)stepperForCell:(id)arg1 indexPath:(id)arg2; // IMP @ 0x12275c
- (id)stepperLabelForCell:(id)arg1; // IMP @ 0x122950
- (id)colorWellForKey:(id)arg1 title:(id)arg2; // IMP @ 0x122cac
- (id)textFieldForCell:(id)arg1; // IMP @ 0x122e20
- (void)editorForIndexPath:(id)arg1; // IMP @ 0x1230c4
- (id)menuButtonWithTitle:(id)arg1 array:(id)arg2 key:(id)arg3; // IMP @ 0x123ea4
- (id)systemImage:(id)arg1 withSize:(double)arg2; // IMP @ 0x1249b4
- (BOOL)isRTL; // IMP @ 0x124c1c
- (void)_reloadSections; // IMP @ 0x124c88
- (void)dealloc; // IMP @ 0x124ce4
- (id)model; // IMP @ 0x124d74
- (void)setModel:(id)arg1; // IMP @ 0x124d84
- (id)defaults; // IMP @ 0x124dc0
- (void)setDefaults:(id)arg1; // IMP @ 0x124dd0
- (id)pendingScrollCell; // IMP @ 0x124e0c
- (void)setPendingScrollCell:(id)arg1; // IMP @ 0x124e1c
@end

// Class [6] TabbarVC
@interface TabbarVC : DVNTableViewController
{
    BOOL _isSettings; // offset 0x8
    NSArray *_sections; // offset 0x10
    NSArray *_tabs; // offset 0x18
    NSArray *_startup; // offset 0x20
    NSArray *_tabbar; // offset 0x28
    NSMutableArray *_activeTabs; // offset 0x30
    NSMutableArray *_inactiveTabs; // offset 0x38
}
- (id)init; // IMP @ 0x12e3a8
- (id)initForSettings:(BOOL)arg1; // IMP @ 0x12e3b8
- (void)loadView; // IMP @ 0x1305c0
- (void)closeButtonTapped; // IMP @ 0x130828
- (void)initTabs; // IMP @ 0x13083c
- (void)saveTabsOrder; // IMP @ 0x130f70
- (id)tableView:(id)arg1 titleForHeaderInSection:(NSInteger)arg2; // IMP @ 0x13176c
- (id)tableView:(id)arg1 titleForFooterInSection:(NSInteger)arg2; // IMP @ 0x131cec
- (NSInteger)numberOfSectionsInTableView:(id)arg1; // IMP @ 0x131f44
- (NSInteger)tableView:(id)arg1 numberOfRowsInSection:(NSInteger)arg2; // IMP @ 0x131f5c
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2; // IMP @ 0x131fb8
- (id)iconImageNamed:(id)arg1; // IMP @ 0x132fe4
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2; // IMP @ 0x133264
- (id)switchForKey:(id)arg1; // IMP @ 0x1338e0
- (void)toggleSwitch:(id)arg1; // IMP @ 0x133b74
- (id)segmentForItems:(id)arg1; // IMP @ 0x133fdc
- (void)setSegment:(id)arg1; // IMP @ 0x134798
- (BOOL)tableView:(id)arg1 canEditRowAtIndexPath:(id)arg2; // IMP @ 0x134ba4
- (BOOL)tableView:(id)arg1 canMoveRowAtIndexPath:(id)arg2; // IMP @ 0x134cb4
- (id)tableView:(id)arg1 targetIndexPathForMoveFromRowAtIndexPath:(id)arg2 toProposedIndexPath:(id)arg3; // IMP @ 0x134d10
- (void)tableView:(id)arg1 moveRowAtIndexPath:(id)arg2 toIndexPath:(id)arg3; // IMP @ 0x134d90
- (NSInteger)tableView:(id)arg1 editingStyleForRowAtIndexPath:(id)arg2; // IMP @ 0x134f34
- (void)tableView:(id)arg1 commitEditingStyle:(NSInteger)arg2 forRowAtIndexPath:(id)arg3; // IMP @ 0x135014
@end

// Class [7] YTPSettingsBuilder
@interface YTPSettingsBuilder : NSObject
{
    UIViewController *_presenter; // offset 0x8
}
- (id)rootTable; // IMP @ 0x13876c
- (id)downloadingTable; // IMP @ 0x13a270
- (id)navbarTable; // IMP @ 0x13db58
- (id)feedTable; // IMP @ 0x13f670
- (id)playerTable; // IMP @ 0x141938
- (id)shortsTable; // IMP @ 0x15638c
- (id)interfaceTable; // IMP @ 0x15ee0c
- (id)tabBarTable; // IMP @ 0x165f7c
- (id)sbTable; // IMP @ 0x166118
- (id)rpcTable; // IMP @ 0x169ca0
- (id)contribsTable; // IMP @ 0x16b8a0
- (id)libsTable; // IMP @ 0x170774
- (id)thanksTable; // IMP @ 0x173d48
- (id)prefsTable; // IMP @ 0x173f3c
- (id)devSection; // IMP @ 0x1751ec
- (id)creditsSection; // IMP @ 0x176c40
- (id)patreonSection:(id)arg1; // IMP @ 0x177828
- (id)patreonButtonCellWithType:(id)arg1 model:(id)arg2; // IMP @ 0x178310
- (void)importPreferences; // IMP @ 0x17950c
- (void)resetSettings; // IMP @ 0x179ce4
- (void)showDonationSheet:(id)arg1; // IMP @ 0x17a270
- (void)openURL:(id)arg1; // IMP @ 0x17dc70
- (id)thanksImage:(id)arg1; // IMP @ 0x17dda4
- (id)sbSegments; // IMP @ 0x17e128
- (void)clearCacheWithCompletion:(id /* block */)arg1; // IMP @ 0x180240
- (id)getCacheSize; // IMP @ 0x1806dc
- (id)presenter; // IMP @ 0x180cf4
- (void)setPresenter:(id)arg1; // IMP @ 0x180d0c
@end

// Class [8] DVNTableModel
@interface DVNTableModel : NSObject
{
    BOOL _showsThanksHeart; // offset 0x8
    BOOL _supportsSearching; // offset 0x9
    NSString *_title; // offset 0x10
    NSString *_header; // offset 0x18
    NSString *_footer; // offset 0x20
    UIFont *_headerFont; // offset 0x28
    UIFont *_footerFont; // offset 0x30
    NSInteger _headerAlignment; // offset 0x38
    NSInteger _footerAlignment; // offset 0x40
    NSArray *_sections; // offset 0x48
    UIViewController *_viewController; // offset 0x50
    UIViewController *_selfViewController; // offset 0x58
}
+ (id)model; // IMP @ 0x18b074
+ (id)modelWithTitle:(id)arg1 sections:(id)arg2; // IMP @ 0x18b090
+ (id)modelWithTitle:(id)arg1 header:(id)arg2 footer:(id)arg3 sections:(id)arg4; // IMP @ 0x18b168
+ (id)modelWithTitle:(id)arg1 header:(id)arg2 footer:(id)arg3 viewController:(id)arg4; // IMP @ 0x18b298
- (id)init; // IMP @ 0x18af44
- (void)addSection:(id)arg1; // IMP @ 0x18b3c8
- (void)addSections:(id)arg1; // IMP @ 0x18b424
- (id)cellForString:(id)arg1; // IMP @ 0x18b480
- (id)cellsMatching:(id /* block */)arg1; // IMP @ 0x18ba58
- (id)cellsMatchingRecursive:(id /* block */)arg1; // IMP @ 0x18bfa4
- (void)_collectMatching:(id /* block */)arg1 into:(id)arg2 visited:(id)arg3; // IMP @ 0x18c04c
- (id)title; // IMP @ 0x18c738
- (void)setTitle:(id)arg1; // IMP @ 0x18c740
- (id)header; // IMP @ 0x18c774
- (void)setHeader:(id)arg1; // IMP @ 0x18c77c
- (id)footer; // IMP @ 0x18c7b0
- (void)setFooter:(id)arg1; // IMP @ 0x18c7b8
- (id)headerFont; // IMP @ 0x18c7ec
- (void)setHeaderFont:(id)arg1; // IMP @ 0x18c7f4
- (id)footerFont; // IMP @ 0x18c828
- (void)setFooterFont:(id)arg1; // IMP @ 0x18c830
- (NSInteger)headerAlignment; // IMP @ 0x18c864
- (void)setHeaderAlignment:(NSInteger)arg1; // IMP @ 0x18c86c
- (NSInteger)footerAlignment; // IMP @ 0x18c874
- (void)setFooterAlignment:(NSInteger)arg1; // IMP @ 0x18c87c
- (BOOL)showsThanksHeart; // IMP @ 0x18c89c
- (void)setShowsThanksHeart:(BOOL)arg1; // IMP @ 0x18c8a4
- (BOOL)supportsSearching; // IMP @ 0x18c8c4
- (void)setSupportsSearching:(BOOL)arg1; // IMP @ 0x18c8cc
- (id)sections; // IMP @ 0x18c8ec
- (void)setSections:(id)arg1; // IMP @ 0x18c8f4
- (id)viewController; // IMP @ 0x18c900
- (void)setViewController:(id)arg1; // IMP @ 0x18c908
- (id)selfViewController; // IMP @ 0x18c93c
- (void)setSelfViewController:(id)arg1; // IMP @ 0x18c954
@end

// Class [9] DVNSection
@interface DVNSection : NSObject
{
    NSString *_header; // offset 0x8
    NSString *_footer; // offset 0x10
    NSString *_identifier; // offset 0x18
    UIImage *_headerIcon; // offset 0x20
    NSArray *_cells; // offset 0x28
    id /* block */ _cellsProvider; // offset 0x30
}
+ (id)sectionWithIdentifier:(id)arg1; // IMP @ 0x18d668
+ (id)sectionWithCells:(id)arg1 identifier:(id)arg2; // IMP @ 0x18d6bc
+ (id)sectionWithHeader:(id)arg1 cells:(id)arg2 identifier:(id)arg3; // IMP @ 0x18d9e0
+ (id)sectionWithHeader:(id)arg1 footer:(id)arg2 cells:(id)arg3 identifier:(id)arg4; // IMP @ 0x18dd2c
+ (id)sectionWithHeader:(id)arg1 headerIcon:(id)arg2 cells:(id)arg3 identifier:(id)arg4; // IMP @ 0x18e0a8
+ (id)sectionWithHeader:(id)arg1 headerIcon:(id)arg2 footer:(id)arg3 cells:(id)arg4 identifier:(id)arg5; // IMP @ 0x18e424
- (id)init; // IMP @ 0x18d1b8
- (void)_appendCells:(id)arg1; // IMP @ 0x18d25c
- (void)addCell:(id)arg1; // IMP @ 0x18e7c8
- (void)addCells:(id)arg1; // IMP @ 0x18e89c
- (id)header; // IMP @ 0x18e8d0
- (void)setHeader:(id)arg1; // IMP @ 0x18e8d8
- (id)footer; // IMP @ 0x18e90c
- (void)setFooter:(id)arg1; // IMP @ 0x18e914
- (id)identifier; // IMP @ 0x18e948
- (void)setIdentifier:(id)arg1; // IMP @ 0x18e950
- (id)headerIcon; // IMP @ 0x18e984
- (void)setHeaderIcon:(id)arg1; // IMP @ 0x18e98c
- (id)cells; // IMP @ 0x18e998
- (void)setCells:(id)arg1; // IMP @ 0x18e9a0
- (id /* block */)cellsProvider; // IMP @ 0x18e9d4
- (void)setCellsProvider:(id /* block */)arg1; // IMP @ 0x18e9dc
@end

// Class [10] DVNCell
@interface DVNCell : NSObject
{
    BOOL _reloadsCell; // offset 0x8
    BOOL _reloadsTable; // offset 0x9
    BOOL _shouldHideDetail; // offset 0xa
    NSString *_identifier; // offset 0x10
    NSString *_reuseIdentifier; // offset 0x18
    NSString *_title; // offset 0x20
    NSString *_subtitle; // offset 0x28
    NSString *_detailText; // offset 0x30
    NSString *_key; // offset 0x38
    NSString *_placeholder; // offset 0x40
    NSArray *_titleIndexes; // offset 0x48
    NSArray *_imageIndexes; // offset 0x50
    double _dividerValue; // offset 0x58
    double _minimumValue; // offset 0x60
    double _maximumValue; // offset 0x68
    NSInteger _sliderFormat; // offset 0x70
    NSInteger _renderingMode; // offset 0x78
    UIImage *_icon; // offset 0x80
    UIImage *_image; // offset 0x88
    UIImage *_accessoryIcon; // offset 0x90
    NSInteger _type; // offset 0x98
    UIColor *_tintColor; // offset 0xa0
    UIView *_sourceView; // offset 0xa8
    DVNTableModel *_controllerModel; // offset 0xb0
    NSDictionary *_customData; // offset 0xb8
    id /* block */ _handler; // offset 0xc0
    id /* block */ _selfHandler; // offset 0xc8
    id /* block */ _handlerWithCompletion; // offset 0xd0
    id /* block */ _subtitleProvider; // offset 0xd8
    id /* block */ _titleIndexesProvider; // offset 0xe0
    id /* block */ _validationHandler; // offset 0xe8
    NSString *_errorText; // offset 0xf0
}
+ (id)controllerCellWithModel:(id)arg1 title:(id)arg2 subtitle:(id)arg3 icon:(id)arg4; // IMP @ 0x18f304
+ (id)cellWithTitleIndexes:(id)arg1 key:(id)arg2; // IMP @ 0x18f3f4
+ (id)cellWithImageIndexes:(id)arg1 key:(id)arg2; // IMP @ 0x18f48c
+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 handler:(id /* block */)arg3; // IMP @ 0x18f524
+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 selfHandler:(id /* block */)arg3; // IMP @ 0x18f5e4
+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 type:(NSInteger)arg3 key:(id)arg4; // IMP @ 0x18f6a4
+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 icon:(id)arg3 type:(NSInteger)arg4 key:(id)arg5; // IMP @ 0x18f770
+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 imageIndexes:(id)arg3 key:(id)arg4; // IMP @ 0x18f864
+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 titleIndexes:(id)arg3 key:(id)arg4; // IMP @ 0x18f954
+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 titleIndexes:(id)arg3 type:(NSInteger)arg4 key:(id)arg5; // IMP @ 0x18fa44
+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 icon:(id)arg3 accessoryIcon:(id)arg4 type:(NSInteger)arg5 key:(id)arg6; // IMP @ 0x18fb38
+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 icon:(id)arg3 accessoryIcon:(id)arg4 type:(NSInteger)arg5 handler:(id /* block */)arg6; // IMP @ 0x18fc5c
+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 image:(id)arg3 accessoryIcon:(id)arg4 type:(NSInteger)arg5 handler:(id /* block */)arg6; // IMP @ 0x18fd80
+ (id)sliderCellWithMinimum:(double)arg1 maximum:(double)arg2 divider:(double)arg3 key:(id)arg4; // IMP @ 0x18feb8
+ (id)sliderCellWithMinimum:(double)arg1 maximum:(double)arg2 divider:(double)arg3 format:(NSInteger)arg4 key:(id)arg5; // IMP @ 0x18fecc
+ (id)textFieldCellWithTitle:(id)arg1 subtitle:(id)arg2 placeholder:(id)arg3 key:(id)arg4; // IMP @ 0x18ffac
+ (id)timePickerWithTitle:(id)arg1 subtitle:(id)arg2 minimum:(double)arg3 maximum:(double)arg4 format:(NSInteger)arg5 key:(id)arg6; // IMP @ 0x19009c
+ (id)stepperCellWithTitle:(id)arg1 subtitle:(id)arg2 minimum:(double)arg3 maximum:(double)arg4 step:(double)arg5 format:(NSInteger)arg6 key:(id)arg7; // IMP @ 0x1901b4
- (id)init; // IMP @ 0x18f228
- (id)identifier; // IMP @ 0x1902ec
- (void)setIdentifier:(id)arg1; // IMP @ 0x1902f4
- (id)reuseIdentifier; // IMP @ 0x190328
- (id)title; // IMP @ 0x190330
- (void)setTitle:(id)arg1; // IMP @ 0x190338
- (id)subtitle; // IMP @ 0x19036c
- (void)setSubtitle:(id)arg1; // IMP @ 0x190374
- (id)detailText; // IMP @ 0x1903a8
- (void)setDetailText:(id)arg1; // IMP @ 0x1903b0
- (id)key; // IMP @ 0x1903e4
- (void)setKey:(id)arg1; // IMP @ 0x1903ec
- (id)placeholder; // IMP @ 0x190420
- (void)setPlaceholder:(id)arg1; // IMP @ 0x190428
- (id)titleIndexes; // IMP @ 0x190434
- (void)setTitleIndexes:(id)arg1; // IMP @ 0x19043c
- (id)imageIndexes; // IMP @ 0x190470
- (void)setImageIndexes:(id)arg1; // IMP @ 0x190478
- (double)dividerValue; // IMP @ 0x1904ac
- (void)setDividerValue:(double)arg1; // IMP @ 0x1904b4
- (double)minimumValue; // IMP @ 0x1904bc
- (void)setMinimumValue:(double)arg1; // IMP @ 0x1904c4
- (double)maximumValue; // IMP @ 0x1904e4
- (void)setMaximumValue:(double)arg1; // IMP @ 0x1904ec
- (NSInteger)sliderFormat; // IMP @ 0x19050c
- (void)setSliderFormat:(NSInteger)arg1; // IMP @ 0x190514
- (BOOL)reloadsCell; // IMP @ 0x190534
- (void)setReloadsCell:(BOOL)arg1; // IMP @ 0x19053c
- (BOOL)reloadsTable; // IMP @ 0x19055c
- (void)setReloadsTable:(BOOL)arg1; // IMP @ 0x190564
- (BOOL)shouldHideDetail; // IMP @ 0x190584
- (void)setShouldHideDetail:(BOOL)arg1; // IMP @ 0x19058c
- (NSInteger)renderingMode; // IMP @ 0x1905ac
- (void)setRenderingMode:(NSInteger)arg1; // IMP @ 0x1905b4
- (id)icon; // IMP @ 0x1905d4
- (void)setIcon:(id)arg1; // IMP @ 0x1905dc
- (id)image; // IMP @ 0x190610
- (void)setImage:(id)arg1; // IMP @ 0x190618
- (id)accessoryIcon; // IMP @ 0x19064c
- (void)setAccessoryIcon:(id)arg1; // IMP @ 0x190654
- (NSInteger)type; // IMP @ 0x190688
- (void)setType:(NSInteger)arg1; // IMP @ 0x190690
- (id)tintColor; // IMP @ 0x1906b0
- (void)setTintColor:(id)arg1; // IMP @ 0x1906b8
- (id)sourceView; // IMP @ 0x1906ec
- (void)setSourceView:(id)arg1; // IMP @ 0x190704
- (id)controllerModel; // IMP @ 0x190738
- (void)setControllerModel:(id)arg1; // IMP @ 0x190740
- (id)customData; // IMP @ 0x190774
- (void)setCustomData:(id)arg1; // IMP @ 0x19077c
- (id /* block */)handler; // IMP @ 0x1907b0
- (void)setHandler:(id /* block */)arg1; // IMP @ 0x1907b8
- (id /* block */)selfHandler; // IMP @ 0x1907e8
- (void)setSelfHandler:(id /* block */)arg1; // IMP @ 0x1907f0
- (id /* block */)handlerWithCompletion; // IMP @ 0x1907f8
- (void)setHandlerWithCompletion:(id /* block */)arg1; // IMP @ 0x190800
- (id /* block */)subtitleProvider; // IMP @ 0x190830
- (void)setSubtitleProvider:(id /* block */)arg1; // IMP @ 0x190838
- (id /* block */)titleIndexesProvider; // IMP @ 0x190868
- (void)setTitleIndexesProvider:(id /* block */)arg1; // IMP @ 0x190870
- (id /* block */)validationHandler; // IMP @ 0x1908a0
- (void)setValidationHandler:(id /* block */)arg1; // IMP @ 0x1908a8
- (id)errorText; // IMP @ 0x1908b0
- (void)setErrorText:(id)arg1; // IMP @ 0x1908b8
@end

// Class [11] DVNSupportersVC
@interface DVNSupportersVC : UIViewController
{
    WKWebView *_webView; // offset 0x8
    UIActivityIndicatorView *_activityIndicator; // offset 0x10
}
- (void)viewDidLoad; // IMP @ 0x191890
- (void)webView:(id)arg1 didStartProvisionalNavigation:(id)arg2; // IMP @ 0x1923c4
- (void)webView:(id)arg1 didFinishNavigation:(id)arg2; // IMP @ 0x192404
- (void)webView:(id)arg1 didFailProvisionalNavigation:(id)arg2 withError:(id)arg3; // IMP @ 0x192444
@end

// Class [12] SBSegment
@interface SBSegment : NSObject
{
    BOOL _locked; // offset 0x8
    NSString *_uuid; // offset 0x10
    NSString *_category; // offset 0x18
    NSString *_actionType; // offset 0x20
    NSString *_segmentDescription; // offset 0x28
    double _start; // offset 0x30
    double _end; // offset 0x38
    double _videoDuration; // offset 0x40
    NSInteger _votes; // offset 0x48
}
+ (id)segmentWithDictionary:(id)arg1; // IMP @ 0x193364
- (id)uuid; // IMP @ 0x193ca4
- (void)setUuid:(id)arg1; // IMP @ 0x193cac
- (id)category; // IMP @ 0x193ce0
- (void)setCategory:(id)arg1; // IMP @ 0x193ce8
- (id)actionType; // IMP @ 0x193d1c
- (void)setActionType:(id)arg1; // IMP @ 0x193d24
- (id)segmentDescription; // IMP @ 0x193d58
- (void)setSegmentDescription:(id)arg1; // IMP @ 0x193d60
- (double)start; // IMP @ 0x193d94
- (void)setStart:(double)arg1; // IMP @ 0x193d9c
- (double)end; // IMP @ 0x193dbc
- (void)setEnd:(double)arg1; // IMP @ 0x193dc4
- (double)videoDuration; // IMP @ 0x193de4
- (void)setVideoDuration:(double)arg1; // IMP @ 0x193dec
- (BOOL)locked; // IMP @ 0x193e0c
- (void)setLocked:(BOOL)arg1; // IMP @ 0x193e14
- (NSInteger)votes; // IMP @ 0x193e34
- (void)setVotes:(NSInteger)arg1; // IMP @ 0x193e3c
@end

// Class [13] SBPlaybackController
@interface SBPlaybackController : NSObject
{
    YTPlayerViewController *_player; // offset 0x8
    NSString *_videoID; // offset 0x10
    NSMutableSet *_skippedUUIDs; // offset 0x18
}
- (id)initWithPlayer:(id)arg1; // IMP @ 0x194290
- (void)requestSbSegments; // IMP @ 0x194380
- (BOOL)shouldCheckSponsorBlock; // IMP @ 0x1945fc
- (void)skipSegmentIfNeeded; // IMP @ 0x1950e8
- (BOOL)segmentMeetsMinimumDuration:(id)arg1; // IMP @ 0x195eb8
- (void)handleSkipSegment:(id)arg1; // IMP @ 0x196230
- (void)handleHighlightSegment:(id)arg1; // IMP @ 0x196558
- (void)seekToTime:(double)arg1 forSegment:(id)arg2 undoTime:(double)arg3 attempts:(int)arg4; // IMP @ 0x196868
- (void)showSkippedToast:(id)arg1 undoTime:(double)arg2; // IMP @ 0x196e04
- (void)showSkipPromptToast:(id)arg1 timeBeforeSkip:(double)arg2 target:(double)arg3; // IMP @ 0x19757c
- (void)playSkipAudioIfNeeded; // IMP @ 0x197fa0
- (void)dealloc; // IMP @ 0x198144
@end

// Class [14] SBManager
@interface SBManager : NSObject
{
    NSString *_categories; // offset 0x8
    NSMutableDictionary *_segments; // offset 0x10
}
+ (id)sharedManager; // IMP @ 0x1991dc
- (id)init; // IMP @ 0x1992b8
- (void)getSegmentsForID:(id)arg1; // IMP @ 0x199af8
- (id)segments; // IMP @ 0x19ab50
- (void)setSegments:(id)arg1; // IMP @ 0x19ab58
@end

// Class [15] SBPlayerDecorator
@interface SBPlayerDecorator : NSObject
+ (void)addDurationWithoutSegments:(id)arg1 videoController:(id)arg2; // IMP @ 0x19b098
+ (BOOL)shouldDrawRoundedForBarView:(id)arg1; // IMP @ 0x19bfac
+ (id)_decorationDataForBarView:(id)arg1; // IMP @ 0x19c7b4
+ (void)drawSegmentsDecorationView:(id)arg1; // IMP @ 0x19d048
+ (void)drawSegmentsOnActiveDecorationView:(id)arg1; // IMP @ 0x19d0e8
+ (void)_drawSegmentsForData:(id)arg1; // IMP @ 0x19d4e8
+ (void)drawSegments:(id)arg1 layer:(id)arg2 playerVC:(id)arg3; // IMP @ 0x19e7b4
+ (void)drawSegmentableSegments:(id)arg1 playerBar:(id)arg2 playerVC:(id)arg3; // IMP @ 0x19f838
@end

// Class [16] SBPlayerDecorationData
@interface SBPlayerDecorationData : NSObject
{
    NSArray *_segments; // offset 0x8
    double _playerBarWidth; // offset 0x10
    double _mediaDuration; // offset 0x18
    UIView *_barView; // offset 0x20
}
- (id)segments; // IMP @ 0x1a2a40
- (void)setSegments:(id)arg1; // IMP @ 0x1a2a48
- (double)playerBarWidth; // IMP @ 0x1a2a54
- (void)setPlayerBarWidth:(double)arg1; // IMP @ 0x1a2a5c
- (double)mediaDuration; // IMP @ 0x1a2a7c
- (void)setMediaDuration:(double)arg1; // IMP @ 0x1a2a84
- (id)barView; // IMP @ 0x1a2aa4
- (void)setBarView:(id)arg1; // IMP @ 0x1a2abc
@end

// Class [17] DVNMediaPicker
@interface DVNMediaPicker : NSObject
{
    UIViewController *_viewController; // offset 0x8
}
+ (id)sharedPicker; // IMP @ 0x1a2b38
- (void)presentImagePickerForVC:(id)arg1; // IMP @ 0x1a2c30
- (void)picker:(id)arg1 didFinishPicking:(id)arg2; // IMP @ 0x1a2d44
- (void)presentFilePickerForVC:(id)arg1 isMultipleSelection:(BOOL)arg2; // IMP @ 0x1a3348
- (void)documentPicker:(id)arg1 didPickDocumentsAtURLs:(id)arg2; // IMP @ 0x1a6260
- (id)tempCopyOfURL:(id)arg1; // IMP @ 0x1a6364
- (void)prepareMediaForUse:(id)arg1; // IMP @ 0x1a65c0
- (void)prepareURLsForImport:(id)arg1; // IMP @ 0x1a72f0
@end

// Class [18] YTPMedia
@interface YTPMedia : NSObject
{
    BOOL _cairo; // offset 0x8
}
+ (id)sharedMedia; // IMP @ 0x1aa098
+ (NSInteger)pageStyle; // IMP @ 0x1aa174
+ (id)adaptiveBackgroundColor; // IMP @ 0x1aa2f8
+ (id)oledForColor:(id)arg1; // IMP @ 0x1aa5d4
+ (id)imageWithName:(id)arg1; // IMP @ 0x1aa920
+ (id)historyTab; // IMP @ 0x1aab50
+ (id)historyTabSelected; // IMP @ 0x1aae04
+ (id)watchLaterTab; // IMP @ 0x1ab1c0
+ (id)watchLaterTabSelected; // IMP @ 0x1ab3dc
+ (id)postsTab; // IMP @ 0x1ab6f8
+ (id)postsTabSelected; // IMP @ 0x1ab9e8
+ (id)hypeTab; // IMP @ 0x1abdc4
+ (id)hypeTabSelected; // IMP @ 0x1ac17c
+ (id)musicTab; // IMP @ 0x1ac62c
+ (id)musicTabSelected; // IMP @ 0x1acaa8
+ (id)liveTab; // IMP @ 0x1ad00c
+ (id)liveTabSelected; // IMP @ 0x1ad468
+ (id)gamingTab; // IMP @ 0x1ad9c8
+ (id)gamingTabSelected; // IMP @ 0x1ade34
+ (id)sportsTab; // IMP @ 0x1ae3b0
+ (id)sportsTabSelected; // IMP @ 0x1ae81c
+ (id)notificationsTab; // IMP @ 0x1aed98
+ (id)notificationsTabSelected; // IMP @ 0x1af194
+ (id)ytPlus; // IMP @ 0x1af6ac
+ (id)ytPlusShorts; // IMP @ 0x1af928
+ (id)sponsorblock; // IMP @ 0x1afba4
+ (id)lock; // IMP @ 0x1afea8
+ (id)volumeOff; // IMP @ 0x1b00c8
+ (id)volumeOn; // IMP @ 0x1b034c
+ (id)moon; // IMP @ 0x1b05a0
+ (id)downloading; // IMP @ 0x1b0784
+ (id)credits; // IMP @ 0x1b0a74
+ (id)donor; // IMP @ 0x1b0cf4
+ (id)feed; // IMP @ 0x1b0f30
+ (id)FEshorts; // IMP @ 0x1b114c
+ (id)interface; // IMP @ 0x1b13e4
+ (id)libs; // IMP @ 0x1b16a8
+ (id)localization; // IMP @ 0x1b18cc
+ (id)navbar; // IMP @ 0x1b1bd8
+ (id)open_new; // IMP @ 0x1b1e30
+ (id)player; // IMP @ 0x1b20d8
+ (id)support; // IMP @ 0x1b2340
+ (id)tabbar; // IMP @ 0x1b25bc
+ (id)ytl_settings; // IMP @ 0x1b2814
+ (id)captions; // IMP @ 0x1b2b1c
+ (id)FElibrary; // IMP @ 0x1b2dac
+ (id)FEsubscriptions; // IMP @ 0x1b306c
+ (id)FEuploads; // IMP @ 0x1b33dc
+ (id)FEwhat_to_watch; // IMP @ 0x1b3690
+ (id)link; // IMP @ 0x1b39ec
+ (id)x_prefs; // IMP @ 0x1b3c18
+ (id)box_checkmark; // IMP @ 0x1b3d60
+ (id)box_empty; // IMP @ 0x1b4088
+ (id)copy; // IMP @ 0x1b4330
+ (id)image_library; // IMP @ 0x1b4550
+ (id)image; // IMP @ 0x1b4878
+ (id)message; // IMP @ 0x1b4ac4
+ (id)music; // IMP @ 0x1b4d3c
+ (id)play_circle; // IMP @ 0x1b4f84
+ (id)show_image; // IMP @ 0x1b5278
+ (id)star_half; // IMP @ 0x1b5554
+ (id)youtube_logo; // IMP @ 0x1b580c
+ (id)check; // IMP @ 0x1b5b10
+ (id)empty; // IMP @ 0x1b5d50
+ (id)adaptiveDiscord; // IMP @ 0x1b5e88
- (void)setCairo:(BOOL)arg1; // IMP @ 0x1b63d8
- (BOOL)isCairo; // IMP @ 0x1b6720
@end

// Class [19] DVNHorizontalPanDelegate
@interface DVNHorizontalPanDelegate : NSObject
- (BOOL)gestureRecognizerShouldBegin:(id)arg1; // IMP @ 0x1b9004
@end

// Class [20] ToastView
@interface ToastView : UIVisualEffectView
{
    NSMutableArray *_commandQueue; // offset 0x8
    BOOL _isiPad; // offset 0x10
    BOOL _isAnimating; // offset 0x11
    BOOL _ignoresFullscreenOpacity; // offset 0x12
    BOOL _ignoresPanGesture; // offset 0x13
    UIWindow *_ytSourceView; // offset 0x18
    UIView *_sourceView; // offset 0x20
    double _keyboardHeight; // offset 0x28
    double _goodHeight; // offset 0x30
    UILabel *_toastLabel; // offset 0x38
    UIProgressView *_toastProgress; // offset 0x40
    UIImageView *_toastIcon; // offset 0x48
    UIStackView *_actionsStack; // offset 0x50
    UIButton *_toastButton; // offset 0x58
    UIActivityIndicatorView *_activityIndicator; // offset 0x60
    NSTimer *_progressTimer; // offset 0x68
    NSLayoutConstraint *_topConstraint; // offset 0x70
    NSLayoutConstraint *_bottomConstraint; // offset 0x78
    NSLayoutConstraint *_centerXConstraint; // offset 0x80
    NSLayoutConstraint *_widthConstraint; // offset 0x88
    NSLayoutConstraint *_heightConstraint; // offset 0x90
    id /* block */ _completion; // offset 0x98
}
+ (void)initialize; // IMP @ 0x1b9734
+ (id)toastWindow; // IMP @ 0x1b97d0
- (id)init; // IMP @ 0x1ba078
- (void)enqueueCommand:(id /* block */)arg1; // IMP @ 0x1bb724
- (void)processQueue; // IMP @ 0x1bb7bc
- (void)setupInterfaceWithText:(id)arg1 progress:(float)arg2 withStop:(BOOL)arg3 isStatus:(BOOL)arg4 isSuccess:(BOOL)arg5 withWait:(BOOL)arg6; // IMP @ 0x1bb8f8
- (void)handlePanGesture:(id)arg1; // IMP @ 0x1bc268
- (void)handleTap; // IMP @ 0x1bd354
- (void)updateLayout; // IMP @ 0x1be2a0
- (void)calculateToastParametersWithKeyboardHeight:(double)arg1 bottomOffset:(void *)arg2 topOffset:(void *)arg3 scale:(void *)arg4; // IMP @ 0x1be3d8
- (void)configureToastAppearanceWithBottomOffset:(double)arg1 topOffset:(double)arg2 scale:(double)arg3 width:(double)arg4 animationDuration:(double)arg5; // IMP @ 0x1be814
- (void)configureToastAppearanceWithBottomOffset:(double)arg1 topOffset:(double)arg2 scale:(double)arg3 width:(double)arg4 alpha:(double)arg5 animationDuration:(double)arg6 completion:(id /* block */)arg7; // IMP @ 0x1bea98
- (void)setupObservers; // IMP @ 0x1bed60
- (void)removeObservers; // IMP @ 0x1bf0a8
- (void)goodHeightDidChange:(id)arg1; // IMP @ 0x1bf3fc
- (void)keyboardWillShow:(id)arg1; // IMP @ 0x1bf570
- (void)keyboardWillHide:(id)arg1; // IMP @ 0x1bf66c
- (void)cleanup; // IMP @ 0x1bf6ac
- (void)cancelButtonTapped; // IMP @ 0x1bf784
- (void)handleLongPress:(id)arg1; // IMP @ 0x1bf8f0
- (void)showProgressWithText:(id)arg1 progress:(float)arg2 withStop:(BOOL)arg3 stopCompletion:(id /* block */)arg4; // IMP @ 0x1bf98c
- (void)updateText:(id)arg1 progress:(float)arg2; // IMP @ 0x1bfcbc
- (void)updateText:(id)arg1 progress:(float)arg2 animated:(BOOL)arg3; // IMP @ 0x1bfd34
- (void)showMessageWithText:(id)arg1 isSuccess:(BOOL)arg2; // IMP @ 0x1bfdb0
- (void)showMessageWithText:(id)arg1 isSuccess:(BOOL)arg2 duration:(double)arg3; // IMP @ 0x1bfde8
- (void)showText:(id)arg1; // IMP @ 0x1c0100
- (void)showToast:(id)arg1; // IMP @ 0x1c0358
- (void)showProgressiveToastWithText:(id)arg1 duration:(double)arg2 isSuccess:(BOOL)arg3; // IMP @ 0x1c068c
- (void)showProgressiveToastWithText:(id)arg1 duration:(double)arg2 actionTitle:(id)arg3 actionCompletion:(id /* block */)arg4; // IMP @ 0x1c0950
- (void)showProgressiveToastWithText:(id)arg1 duration:(double)arg2 actionIcon:(id)arg3 actionCompletion:(id /* block */)arg4; // IMP @ 0x1c1034
- (void)showProgressiveToastWithText:(id)arg1 duration:(double)arg2 actionIcon:(id)arg3 ignoresPan:(BOOL)arg4 actionCompletion:(id /* block */)arg5; // IMP @ 0x1c1070
- (void)showDonationReminder:(id)arg1; // IMP @ 0x1c14e8
- (void)startTimerCountdown:(double)arg1; // IMP @ 0x1c1738
- (void)hideAnimatedWithCompletion:(id /* block */)arg1; // IMP @ 0x1c19b8
- (void)hideImmediately; // IMP @ 0x1c213c
- (void)hideWithDelay:(double)arg1; // IMP @ 0x1c218c
- (void)hide; // IMP @ 0x1c2244
- (BOOL)isHidden; // IMP @ 0x1c227c
- (void)hideWithCompletion:(id /* block */)arg1; // IMP @ 0x1c2348
- (BOOL)isLandscape; // IMP @ 0x1c24f8
- (BOOL)isFullscreen; // IMP @ 0x1c25c0
- (BOOL)isPinnedTop; // IMP @ 0x1c2614
- (double)bottomOffset; // IMP @ 0x1c2668
- (void)dealloc; // IMP @ 0x1c2754
- (id /* block */)completion; // IMP @ 0x1c27b8
- (void)setCompletion:(id /* block */)arg1; // IMP @ 0x1c27c8
@end

// Class [21] ToastWindow
@interface ToastWindow : UIWindow
+ (void)initialize; // IMP @ 0x1c897c
- (id)hitTest:(CGPoint)arg1 withEvent:(id)arg2; // IMP @ 0x1c77f8
- (id)initWithWindowScene:(id)arg1; // IMP @ 0x1c84d4
- (BOOL)canBecomeKeyWindow; // IMP @ 0x1c85c4
- (void)makeKeyAndVisible; // IMP @ 0x1c85cc
- (BOOL)shouldAffectStatusBarAppearance; // IMP @ 0x1c8688
- (BOOL)_windowControlsStatusBarOrientation; // IMP @ 0x1c8690
- (BOOL)_canBecomeKeyWindow; // IMP @ 0x1c8698
- (id)appKeyWindow; // IMP @ 0x1c86a0
@end

// Class [22] ToastManager
@interface ToastManager : NSObject
{
    BOOL _isPinnedTop; // offset 0x8
    BOOL _isFullscreen; // offset 0x9
    NSMutableArray *_toasts; // offset 0x10
    YTToastOffsetController *_offsetController; // offset 0x18
}
+ (id)sharedManager; // IMP @ 0x1c94f4
+ (void)showMessageWithText:(id)arg1 isSuccess:(BOOL)arg2; // IMP @ 0x1c9680
- (id)init; // IMP @ 0x1c95c4
- (void)registerToast:(id)arg1; // IMP @ 0x1c97cc
- (void)unregisterToast:(id)arg1; // IMP @ 0x1c9914
- (void)updateAllToasts; // IMP @ 0x1c9a0c
- (id)toasts; // IMP @ 0x1c9c94
- (void)setToasts:(id)arg1; // IMP @ 0x1c9c9c
- (id)offsetController; // IMP @ 0x1c9cd0
- (void)setOffsetController:(id)arg1; // IMP @ 0x1c9cd8
- (BOOL)isPinnedTop; // IMP @ 0x1c9d0c
- (void)setIsPinnedTop:(BOOL)arg1; // IMP @ 0x1c9d14
- (BOOL)isFullscreen; // IMP @ 0x1c9d34
- (void)setIsFullscreen:(BOOL)arg1; // IMP @ 0x1c9d3c
@end

// Class [23] YTPAPIHelper
@interface YTPAPIHelper : NSObject
+ (void)fetchChannelImageWithChannelID:(id)arg1 completion:(id /* block */)arg2; // IMP @ 0x1ca0f8
@end

// Class [24] Downloader
@interface Downloader : NSObject
{
    NSURLSession *_session; // offset 0x8
    NSURLSessionDownloadTask *_downloadTask; // offset 0x10
    NSString *_fileName; // offset 0x18
    NSUInteger _chunkSize; // offset 0x20
    NSUInteger _totalChunks; // offset 0x28
    NSUInteger _downloadedChunks; // offset 0x30
    NSFileHandle *_fileHandle; // offset 0x38
    NSURL *_fileURL; // offset 0x40
    NSInteger _totalDownloadedBytes; // offset 0x48
    NSInteger _totalExpectedBytes; // offset 0x50
    id<DownloaderDelegate> _delegate; // offset 0x58
}
- (id)init; // IMP @ 0x1cc7f0
- (void)downloadFileWithURL:(id)arg1 fileName:(id)arg2 fileSize:(NSUInteger)arg3; // IMP @ 0x1cc920
- (void)downloadNextChunk; // IMP @ 0x1ccf1c
- (void)cancelDownload; // IMP @ 0x1cd1bc
- (id)getFilePath; // IMP @ 0x1cd398
- (void)URLSession:(id)arg1 downloadTask:(id)arg2 didWriteData:(NSInteger)arg3 totalBytesWritten:(NSInteger)arg4 totalBytesExpectedToWrite:(NSInteger)arg5; // IMP @ 0x1cd8c4
- (void)URLSession:(id)arg1 downloadTask:(id)arg2 didFinishDownloadingToURL:(id)arg3; // IMP @ 0x1cd9c4
- (void)URLSession:(id)arg1 task:(id)arg2 didCompleteWithError:(id)arg3; // IMP @ 0x1cdcd4
- (id)delegate; // IMP @ 0x1cde60
- (void)setDelegate:(id)arg1; // IMP @ 0x1cde78
@end

// Class [25] AudioManager
@interface AudioManager : NSObject
{
    AVAudioPlayer *_audioPlayer; // offset 0x8
}
+ (id)sharedInstance; // IMP @ 0x1ce700
- (id)init; // IMP @ 0x1ce7f8
- (void)playAudio; // IMP @ 0x1cf0dc
- (void)stopAudio; // IMP @ 0x1cf1bc
- (void)audioPlayerDidFinishPlaying:(id)arg1 successfully:(BOOL)arg2; // IMP @ 0x1cf2cc
- (id)audioPlayer; // IMP @ 0x1cf2e8
- (void)setAudioPlayer:(id)arg1; // IMP @ 0x1cf2f0
@end

// Class [26] YTPDownloader
@interface YTPDownloader : NSObject
{
    NSURLSession *_session; // offset 0x8
    NSURLSessionDataTask *_dataTask; // offset 0x10
    NSFileHandle *_fileHandle; // offset 0x18
    NSString *_fileName; // offset 0x20
    NSString *_videoID; // offset 0x28
    NSInteger _totalFileSize; // offset 0x30
    NSInteger _downloadedSize; // offset 0x38
    NSMutableDictionary *_chunkMap; // offset 0x40
    NSUInteger _chunkSize; // offset 0x48
    NSString *_filePath; // offset 0x50
    NSString *_chunkMapPath; // offset 0x58
    id<DownloaderDelegate> _delegate; // offset 0x60
}
- (id)init; // IMP @ 0x1cf6e8
- (void)cancelDownload; // IMP @ 0x1cf840
- (void)cleanup; // IMP @ 0x1cf8b4
- (void)downloadFileWithURL:(id)arg1 fileName:(id)arg2 videoID:(id)arg3 fileSize:(NSUInteger)arg4; // IMP @ 0x1cfae8
- (id)hashForFile:(id)arg1 fileSize:(NSUInteger)arg2; // IMP @ 0x1d0474
- (id)createTempDirectoryIfNeeded; // IMP @ 0x1d0654
- (id)getFilePath; // IMP @ 0x1d0b54
- (id)getChunkMapPath; // IMP @ 0x1d0c2c
- (void)saveChunkMap; // IMP @ 0x1d0e38
- (BOOL)loadChunkMap; // IMP @ 0x1d1454
- (void)continueDownloadingForURL:(id)arg1; // IMP @ 0x1d235c
- (void)URLSession:(id)arg1 dataTask:(id)arg2 didReceiveData:(id)arg3; // IMP @ 0x1d3288
- (void)URLSession:(id)arg1 task:(id)arg2 didCompleteWithError:(id)arg3; // IMP @ 0x1d3c4c
- (id)delegate; // IMP @ 0x1d47a4
- (void)setDelegate:(id)arg1; // IMP @ 0x1d47bc
@end

// Class [27] SbWhitelistVC
@interface SbWhitelistVC : DVNTableViewController
{
    UIButton *_sortButton; // offset 0x8
    NSArray *_sections; // offset 0x10
    NSMutableArray *_channels; // offset 0x18
}
- (id)init; // IMP @ 0x1d5f64
- (void)setupWhitelist; // IMP @ 0x1d60a8
- (void)loadView; // IMP @ 0x1d77d8
- (void)closeButtonTapped; // IMP @ 0x1d7ca4
- (id)tableView:(id)arg1 titleForHeaderInSection:(NSInteger)arg2; // IMP @ 0x1d7cb8
- (void)tableView:(id)arg1 willDisplayHeaderView:(id)arg2 forSection:(NSInteger)arg3; // IMP @ 0x1d7ebc
- (id)getSortActions; // IMP @ 0x1d87f4
- (void)updateSortMenu; // IMP @ 0x1d9e2c
- (NSInteger)numberOfSectionsInTableView:(id)arg1; // IMP @ 0x1da0d0
- (NSInteger)tableView:(id)arg1 numberOfRowsInSection:(NSInteger)arg2; // IMP @ 0x1da0e8
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2; // IMP @ 0x1da144
- (BOOL)tableView:(id)arg1 shouldHighlightRowAtIndexPath:(id)arg2; // IMP @ 0x1da910
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2; // IMP @ 0x1da918
- (id)tableView:(id)arg1 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)arg2; // IMP @ 0x1dad10
- (void)removeChannelWithLink:(id)arg1; // IMP @ 0x1db2b8
- (id)ytlImageWithName:(id)arg1; // IMP @ 0x1db918
- (id)channelImage:(id)arg1; // IMP @ 0x1db9d8
@end

// Class [28] YTPTranslator
@interface YTPTranslator : NSObject
+ (void)translateText:(id)arg1 fromLanguage:(id)arg2 toLanguage:(id)arg3 completion:(id /* block */)arg4; // IMP @ 0x1dde34
+ (void)translateSingleText:(id)arg1 fromLanguage:(id)arg2 toLanguage:(id)arg3 completion:(id /* block */)arg4; // IMP @ 0x1de8b8
@end

// Class [29] TranslatorVC
@interface TranslatorVC : UITableViewController
{
    UITableView *_tableView; // offset 0x8
    UIButton *_translateButton; // offset 0x10
    UITextView *_textView; // offset 0x18
    NSString *_sourceText; // offset 0x20
    NSInteger _langIndex; // offset 0x28
    NSArray *_sections; // offset 0x30
    NSArray *_type; // offset 0x38
    NSArray *_translation; // offset 0x40
    NSArray *_translate; // offset 0x48
}
- (id)initWithText:(id)arg1; // IMP @ 0x1dffc8
- (void)viewDidLoad; // IMP @ 0x1e0ce4
- (void)closeButtonTapped; // IMP @ 0x1e1270
- (void)tableView:(id)arg1 willDisplayHeaderView:(id)arg2 forSection:(NSInteger)arg3; // IMP @ 0x1e12ac
- (double)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2; // IMP @ 0x1e14e0
- (NSInteger)numberOfSectionsInTableView:(id)arg1; // IMP @ 0x1e1550
- (NSInteger)tableView:(id)arg1 numberOfRowsInSection:(NSInteger)arg2; // IMP @ 0x1e1568
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2; // IMP @ 0x1e15c4
- (id)menuButtonWithTitle:(id)arg1 array:(id)arg2; // IMP @ 0x1e2d58
- (id)systemImage:(id)arg1 withSize:(double)arg2; // IMP @ 0x1e363c
- (BOOL)isRTL; // IMP @ 0x1e38a4
- (void)translateText; // IMP @ 0x1e3910
- (BOOL)tableView:(id)arg1 shouldHighlightRowAtIndexPath:(id)arg2; // IMP @ 0x1e4008
- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2; // IMP @ 0x1e4010
@end

// Class [30] YTLUserDefaults
@interface YTLUserDefaults : NSUserDefaults
{
    id /* block */ _prefsPickerCompletion; // offset 0x20
}
+ (id)standardUserDefaults; // IMP @ 0x1e60cc
+ (void)importYtlSettings:(id /* block */)arg1; // IMP @ 0x1ec1e8
+ (void)exportYtlSettings:(id)arg1; // IMP @ 0x1ed410
+ (void)resetUserDefaults; // IMP @ 0x1eda90
+ (BOOL)boolForKey:(id)arg1; // IMP @ 0x1edad0
+ (NSInteger)integerForKey:(id)arg1; // IMP @ 0x1edb48
+ (double)floatForKey:(id)arg1; // IMP @ 0x1edbc0
+ (void)setBool:(BOOL)arg1 forKey:(id)arg2; // IMP @ 0x1edc44
+ (void)setInteger:(NSInteger)arg1 forKey:(id)arg2; // IMP @ 0x1edcd4
+ (void)setFloat:(double)arg1 forKey:(id)arg2; // IMP @ 0x1edd64
- (void)reset; // IMP @ 0x1e6360
- (void)registerDefaults; // IMP @ 0x1e6500
- (id)colorForSegment:(id)arg1; // IMP @ 0x1eaa6c
- (id)sbPrivateUserID; // IMP @ 0x1eb70c
- (id)sbPublicUserID:(id)arg1; // IMP @ 0x1ebf38
- (void)presentDocumentPicker:(id /* block */)arg1; // IMP @ 0x1ecf10
- (void)documentPicker:(id)arg1 didPickDocumentAtURL:(id)arg2; // IMP @ 0x1ed31c
- (id /* block */)prefsPickerCompletion; // IMP @ 0x1eddfc
- (void)setPrefsPickerCompletion:(id /* block */)arg1; // IMP @ 0x1ede0c
@end

// Class [31] DVNSheetPresenter
@interface DVNSheetPresenter : NSObject
+ (void)presentCustomHeightViewController:(id)arg1 fromViewController:(id)arg2; // IMP @ 0x1ef3f4
+ (void)presentHalfScreenViewController:(id)arg1 fromViewController:(id)arg2; // IMP @ 0x1ef8e4
+ (void)presentViewController:(id)arg1 fromViewController:(id)arg2 withHeight:(double)arg3; // IMP @ 0x1efc6c
@end

// Class [32] PseudoDetentController
@interface PseudoDetentController : UIPresentationController
{
    id /* block */ _heightCalculator; // offset 0x8
    double _customHeight; // offset 0x10
    UIView *_dimmingView; // offset 0x18
}
- (id)initWithPresentedViewController:(id)arg1 presentingViewController:(id)arg2; // IMP @ 0x1f06fc
- (void)dismissController; // IMP @ 0x1f08f8
- (CGRect)frameOfPresentedViewInContainerView; // IMP @ 0x1f095c
- (void)containerViewWillLayoutSubviews; // IMP @ 0x1f0a98
- (void)presentationTransitionWillBegin; // IMP @ 0x1f0b60
- (void)dismissalTransitionWillBegin; // IMP @ 0x1f0ec4
- (id /* block */)heightCalculator; // IMP @ 0x1f104c
- (void)setHeightCalculator:(id /* block */)arg1; // IMP @ 0x1f105c
- (double)customHeight; // IMP @ 0x1f1090
- (void)setCustomHeight:(double)arg1; // IMP @ 0x1f10a0
- (id)dimmingView; // IMP @ 0x1f10b0
- (void)setDimmingView:(id)arg1; // IMP @ 0x1f10c0
@end

// Class [33] PseudoDetentTransitioningDelegate
@interface PseudoDetentTransitioningDelegate : NSObject
{
    id /* block */ _heightCalculator; // offset 0x8
    double _customHeight; // offset 0x10
}
- (id)presentationControllerForPresentedViewController:(id)arg1 presentingViewController:(id)arg2 sourceViewController:(id)arg3; // IMP @ 0x1f1860
- (id /* block */)heightCalculator; // IMP @ 0x1f1930
- (void)setHeightCalculator:(id /* block */)arg1; // IMP @ 0x1f1938
- (double)customHeight; // IMP @ 0x1f1968
- (void)setCustomHeight:(double)arg1; // IMP @ 0x1f1970
@end

// Class [34] DVNLongPressDelegate
@interface DVNLongPressDelegate : NSObject
{
    UIView *_view; // offset 0x8
    NSInteger _mode; // offset 0x10
}
- (BOOL)isTouchInSpeedZone:(CGPoint)arg1; // IMP @ 0x1f1aa4
- (BOOL)gestureRecognizer:(id)arg1 shouldReceiveTouch:(id)arg2; // IMP @ 0x1f1d28
- (id)view; // IMP @ 0x1f1dc0
- (void)setView:(id)arg1; // IMP @ 0x1f1dd8
- (NSInteger)mode; // IMP @ 0x1f1e0c
- (void)setMode:(NSInteger)arg1; // IMP @ 0x1f1e14
@end

// Class [35] YTPPlayerHelper
@interface YTPPlayerHelper : NSObject
+ (id)getVideoID:(id)arg1; // IMP @ 0x1f1f6c
+ (void)openVideoWithID:(id)arg1; // IMP @ 0x1f232c
+ (void)openVideoWithID:(id)arg1 handler:(id)arg2; // IMP @ 0x1f2724
+ (void)openVideoWithID:(id)arg1 viewController:(id)arg2; // IMP @ 0x1f3058
@end

// Class [36] FFMpegHelper
@interface FFMpegHelper : NSObject
{
    NSObject<OS_dispatch_queue> *_ffmpegQueue; // offset 0x8
    Statistics *_statistics; // offset 0x10
    ToastView *_toastView; // offset 0x18
    NSInteger _duration; // offset 0x20
    BOOL _isProcessing; // offset 0x28
}
+ (id)sharedInstance; // IMP @ 0x1f3a68
- (id)init; // IMP @ 0x1f3b60
- (void)statisticsCallback:(id)arg1; // IMP @ 0x1f3e30
- (void)mergeVideo:(id)arg1 withAudio:(id)arg2 captions:(id)arg3 duration:(NSInteger)arg4 completion:(id /* block */)arg5; // IMP @ 0x1f3f20
- (id)getCommandWithVideoURL:(id)arg1 audioURL:(id)arg2 captionsURL:(id)arg3 thumbnailURL:(id)arg4 duration:(NSInteger)arg5 outputURL:(id)arg6; // IMP @ 0x1f56b4
- (void)cutAudio:(id)arg1 duration:(NSInteger)arg2 completion:(id /* block */)arg3; // IMP @ 0x1f7644
- (void)logCallback:(NSInteger)arg1 :(int)arg2 :(id)arg3; // IMP @ 0x1f8a60
- (void)getCleanLog:(id)arg1; // IMP @ 0x1f8a7c
- (void)setActive; // IMP @ 0x1f9184
- (void)updateProgressDialog; // IMP @ 0x1f91e4
- (id)codeForCaps:(id)arg1; // IMP @ 0x1f9574
@end

// Class [37] SRTParser
@interface SRTParser : NSObject
{
    NSMutableArray *_srtLines; // offset 0x8
    NSMutableString *_currentText; // offset 0x10
    NSString *_videoID; // offset 0x18
    NSInteger _index; // offset 0x20
    double _start; // offset 0x28
    double _end; // offset 0x30
    double _duration; // offset 0x38
    BOOL _isTranscript; // offset 0x40
}
- (id)init; // IMP @ 0x1fd818
- (void)parseXMLFromURL:(id)arg1 forLanguage:(id)arg2 videoID:(id)arg3 completion:(id /* block */)arg4; // IMP @ 0x1fd908
- (id)srtForLanguage:(id)arg1 videoID:(id)arg2 error:(NSError **)arg3; // IMP @ 0x1fde5c
- (void)parseTranscriptFromURL:(id)arg1 completion:(id /* block */)arg2; // IMP @ 0x1fe8a4
- (void)parser:(id)arg1 didStartElement:(id)arg2 namespaceURI:(id)arg3 qualifiedName:(id)arg4 attributes:(id)arg5; // IMP @ 0x1fee8c
- (void)parser:(id)arg1 foundCharacters:(id)arg2; // IMP @ 0x1ff154
- (void)parser:(id)arg1 didEndElement:(id)arg2 namespaceURI:(id)arg3 qualifiedName:(id)arg4; // IMP @ 0x1ff190
- (void)generateSRTWithText:(id)arg1; // IMP @ 0x1ff384
- (void)generateTranscriptWithText:(id)arg1; // IMP @ 0x1ff640
- (id)formatTime:(double)arg1; // IMP @ 0x1ff7c0
- (id)decodeHTMLСhars:(id)arg1; // IMP @ 0x1ffa1c
@end

// Class [38] YTPDB
@interface YTPDB : NSObject
+ (id)thanks; // IMP @ 0x200cd8
+ (id)clip; // IMP @ 0x203248
+ (id)report; // IMP @ 0x20501c
+ (id)hype; // IMP @ 0x207c98
+ (id)stopAds; // IMP @ 0x20ad20
+ (id)supportedLanguages; // IMP @ 0x20fd44
+ (id)langCodeForIndex:(NSInteger)arg1; // IMP @ 0x21001c
+ (NSUInteger)indexOfPreferredLanguage; // IMP @ 0x210508
@end

// Class [39] YTPSleepTimer
@interface YTPSleepTimer : NSObject
{
    NSObject<OS_dispatch_source> *_timer; // offset 0x8
    NSObject<OS_dispatch_queue> *_timerQueue; // offset 0x10
    UIImage *_icon; // offset 0x18
    NSUInteger _mode; // offset 0x20
    NSUInteger _timerStyle; // offset 0x28
    BOOL _didStartFade; // offset 0x30
    double _endTimestamp; // offset 0x38
}
+ (id)sharedTimer; // IMP @ 0x210c84
- (id)timerQueue; // IMP @ 0x210d7c
- (BOOL)isRunning; // IMP @ 0x211018
- (void)showOptions:(id)arg1; // IMP @ 0x211090
- (void)showTimeSelector; // IMP @ 0x212468
- (void)startForSeconds:(double)arg1; // IMP @ 0x212a50
- (void)startForEndOfVideo; // IMP @ 0x212b44
- (void)startTimer; // IMP @ 0x212bfc
- (void)stopWithFadeIfNeeded:(double)arg1; // IMP @ 0x2132fc
- (void)stopWithFadeDuration:(double)arg1 stopAfter:(double)arg2; // IMP @ 0x21344c
- (void)stop; // IMP @ 0x213804
- (void)cancel; // IMP @ 0x21383c
- (void)cancelIfPlayerClosed; // IMP @ 0x213848
- (double)remainingSeconds; // IMP @ 0x2138b0
- (double)remainingSecondsForCurrentVideo; // IMP @ 0x213a14
- (double)secondsForDate:(id)arg1; // IMP @ 0x213c0c
- (id)formattedTime:(double)arg1; // IMP @ 0x213e40
- (id)getPlayerIfAvailable; // IMP @ 0x213f88
- (id)globalSlimBar; // IMP @ 0x2142c8
- (id)playerSlimBar; // IMP @ 0x2145b8
- (void)globalSlimBarVisibilityChange; // IMP @ 0x2148dc
- (void)playerSlimBarVisibilityChange; // IMP @ 0x2149f8
- (id)slimBarForStyle:(NSUInteger)arg1; // IMP @ 0x214d8c
- (id)barsForStyle:(NSUInteger)arg1; // IMP @ 0x214dc4
- (id)attributedTitle:(id)arg1 image:(id)arg2; // IMP @ 0x214f50
- (void)applyTitle:(id)arg1 image:(id)arg2 color:(id)arg3 toBar:(id)arg4; // IMP @ 0x2151ec
- (void)attachTapHandlerToBar:(id)arg1; // IMP @ 0x215370
- (void)removeTapHandlerOnBar:(id)arg1; // IMP @ 0x215838
- (void)onSlimBarTap:(id)arg1; // IMP @ 0x215c34
- (void)slimBarVisibilityChange:(NSUInteger)arg1; // IMP @ 0x2165ac
- (void)showSlimBarWithTitle:(id)arg1 image:(id)arg2 color:(id)arg3 style:(NSUInteger)arg4; // IMP @ 0x216650
- (void)updateSlimBarTitle:(id)arg1 style:(NSUInteger)arg2; // IMP @ 0x2169d4
- (void)hideSlimBarWithStyle:(NSUInteger)arg1; // IMP @ 0x216dac
- (BOOL)pausePlayback; // IMP @ 0x217538
- (void)finishTimerAndCleanup; // IMP @ 0x2178ac
- (void)cleanup; // IMP @ 0x2179e4
@end

// Class [40] RPCMedia
@interface RPCMedia : NSObject
{
    BOOL _isPaused; // offset 0x8
    NSString *_videoID; // offset 0x10
    NSString *_title; // offset 0x18
    NSString *_author; // offset 0x20
    double _totalTime; // offset 0x28
    double _currentTime; // offset 0x30
    NSString *_thumbnailURL; // offset 0x38
}
+ (id)mediaWithPlayer:(id)arg1; // IMP @ 0x21a32c
- (id)videoID; // IMP @ 0x21a74c
- (void)setVideoID:(id)arg1; // IMP @ 0x21a754
- (id)title; // IMP @ 0x21a784
- (void)setTitle:(id)arg1; // IMP @ 0x21a78c
- (id)author; // IMP @ 0x21a7bc
- (void)setAuthor:(id)arg1; // IMP @ 0x21a7c4
- (BOOL)isPaused; // IMP @ 0x21a7f4
- (void)setIsPaused:(BOOL)arg1; // IMP @ 0x21a7fc
- (double)totalTime; // IMP @ 0x21a81c
- (void)setTotalTime:(double)arg1; // IMP @ 0x21a824
- (double)currentTime; // IMP @ 0x21a844
- (void)setCurrentTime:(double)arg1; // IMP @ 0x21a84c
- (id)thumbnailURL; // IMP @ 0x21a86c
- (void)setThumbnailURL:(id)arg1; // IMP @ 0x21a874
@end

// Class [41] YTPDiscordRPC
@interface YTPDiscordRPC : NSObject
{
    NSString *_currentVideoID; // offset 0x8
    NSDate *_lastSendDate; // offset 0x10
    RPCMedia *_media; // offset 0x18
    NSString *_serverURL; // offset 0x20
}
+ (id)sharedPresence; // IMP @ 0x21ad18
+ (void)checkLocalNetworkPermission:(id /* block */)arg1; // IMP @ 0x21ae10
- (void)setServerURL:(id)arg1; // IMP @ 0x21b1b4
- (void)startIfPossible; // IMP @ 0x21b804
- (void)startRPC; // IMP @ 0x21c38c
- (void)updateTime; // IMP @ 0x21c69c
- (void)updateState; // IMP @ 0x21c7e4
- (void)clearPlayback; // IMP @ 0x21c92c
- (id)buildBody; // IMP @ 0x21cbe8
- (void)sendBody; // IMP @ 0x21d50c
- (void)_send:(id)arg1; // IMP @ 0x21d6a0
- (void)showAlertWithMessage:(id)arg1 showSettingsButton:(BOOL)arg2; // IMP @ 0x21dd68
- (id)media; // IMP @ 0x21e39c
- (void)setMedia:(id)arg1; // IMP @ 0x21e3a4
- (id)serverURL; // IMP @ 0x21e3d8
@end

// Class [42] DVNImageViewController
@interface DVNImageViewController : UIViewController
{
    UIScrollView *_scrollView; // offset 0x8
    UIImageView *_imageView; // offset 0x10
    UIImage *_fullImage; // offset 0x18
}
- (void)viewDidLoad; // IMP @ 0x21f340
- (void)setupNavbar; // IMP @ 0x21f3a0
- (void)setupViewer; // IMP @ 0x2200c0
- (id)viewForZoomingInScrollView:(id)arg1; // IMP @ 0x2208a4
- (void)viewDidLayoutSubviews; // IMP @ 0x2208b4
- (void)handleDoubleTap:(id)arg1; // IMP @ 0x2209bc
- (void)scrollViewDidZoom:(id)arg1; // IMP @ 0x220b40
- (void)scrollViewDidEndZooming:(id)arg1 withView:(id)arg2 atScale:(double)arg3; // IMP @ 0x220b74
- (void)scrollViewWillBeginZooming:(id)arg1 withView:(id)arg2; // IMP @ 0x220ba8
- (void)adjustScrollViewInsets; // IMP @ 0x220bdc
- (void)adjustHorizontalInsetsWithImageWidth:(double)arg1; // IMP @ 0x220cdc
- (void)adjustVerticalInsetsWithImageHeight:(double)arg1; // IMP @ 0x220dd4
- (void)hapticFeedback; // IMP @ 0x220ee8
- (void)closeButtonTapped; // IMP @ 0x220f5c
- (void)share; // IMP @ 0x220fb4
- (id)fullImage; // IMP @ 0x2212e4
- (void)setFullImage:(id)arg1; // IMP @ 0x2212f4
@end

// Class [43] BlurButton
@interface BlurButton : UIButton
{
    UIImageView *_buttonImageView; // offset 0x8
}
+ (id)createButtonWithImage:(id)arg1 target:(id)arg2 action:(SEL)arg3 menu:(id)arg4; // IMP @ 0x222978
- (void)setHighlighted:(BOOL)arg1; // IMP @ 0x222cbc
@end

// Class [44] YTPSpeedMaster
@interface YTPSpeedMaster : NSObject
{
    NSArray *_speedArray; // offset 0x8
    NSInteger _speedIndex; // offset 0x10
    double _minRate; // offset 0x18
    double _maxRate; // offset 0x20
    double _rateStep; // offset 0x28
    double _rateBeforeSpeedmaster; // offset 0x30
    CGPoint _startLocation; // offset 0x38
    double _gestureBaseRate; // offset 0x48
    NSInteger _gestureBaseIndex; // offset 0x50
    YTMainAppVideoPlayerOverlayViewController *_controller; // offset 0x58
}
+ (id)sharedMaster; // IMP @ 0x2230b4
+ (id)getPlayerIfAvailable; // IMP @ 0x224de8
+ (double)currentPlaybackRate; // IMP @ 0x225734
+ (double)playbackRateForPlayer:(id)arg1; // IMP @ 0x2258a0
+ (void)setPlaybackRate:(double)arg1 forPlayer:(id)arg2; // IMP @ 0x225a18
+ (void)_applyPendingRateForPlayer:(id)arg1; // IMP @ 0x225dd8
- (void)manageSpeedMaster:(id)arg1 playerOverlayVC:(id)arg2; // IMP @ 0x2231ac
- (id)speedArray; // IMP @ 0x2248e8
- (NSInteger)nearestIndexForRate:(double)arg1; // IMP @ 0x224c78
- (double)currentPlaybackRate; // IMP @ 0x225124
- (void)setPlaybackRate:(double)arg1; // IMP @ 0x225244
@end

// Class [45] Dvbug
@interface Dvbug : NSObject
+ (id)instanceForObject:(id)arg1 name:(id)arg2; // IMP @ 0x22739c
+ (void)observeIvar:(id)arg1 name:(id)arg2; // IMP @ 0x22783c
+ (id)getObservedIvar:(id)arg1 name:(id)arg2; // IMP @ 0x228160
+ (void)setObservedIvar:(id)arg1 name:(id)arg2 value:(id)arg3; // IMP @ 0x228674
+ (NSInteger)getObservedIntIvar:(id)arg1 name:(id)arg2; // IMP @ 0x228b54
+ (NSInteger)getObservedIvarLongLong:(id)arg1 name:(id)arg2; // IMP @ 0x2290f4
+ (BOOL)getObservedBoolIvar:(id)arg1 name:(id)arg2; // IMP @ 0x229604
+ (void)setObservedBoolIvar:(id)arg1 name:(id)arg2 value:(BOOL)arg3; // IMP @ 0x229b7c
@end

// Class [46] YTLHelper
@interface YTLHelper : NSObject
{
    NSCharacterSet *_illegalChars; // offset 0x8
    YTPDownloader *_downloader; // offset 0x10
    ToastView *_toastView; // offset 0x18
    NSString *_title; // offset 0x20
    NSString *_videoID; // offset 0x28
    NSString *_format; // offset 0x30
    NSUInteger _duration; // offset 0x38
    BOOL _isVideoDownloaded; // offset 0x40
    BOOL _isAudioOnly; // offset 0x41
    NSURL *_videoUrl; // offset 0x48
    NSURL *_audioUrl; // offset 0x50
    NSURL *_captionsUrl; // offset 0x58
    NSUInteger _audioSize; // offset 0x60
}
+ (id)YTImageNamed:(id)arg1; // IMP @ 0x22f4c0
+ (id)YTLImageNamed:(id)arg1; // IMP @ 0x22f6b4
+ (BOOL)isConnectedToWiFi; // IMP @ 0x22f8b8
+ (id)createYTQTMButton:(id)arg1 accessibilityLabel:(id)arg2 buttonLabel:(id)arg3 icon:(id)arg4 selector:(SEL)arg5; // IMP @ 0x22f94c
+ (id)createYTQTMButton:(id)arg1 accessibilityLabel:(id)arg2 buttonLabel:(id)arg3 icon:(id)arg4 size:(CGSize)arg5 selector:(SEL)arg6; // IMP @ 0x22fa24
+ (id)createOverlayButton:(id)arg1 accessibilityLabel:(id)arg2 buttonLabel:(id)arg3 icon:(id)arg4 selector:(SEL)arg5; // IMP @ 0x22fdf8
+ (void)downloadImageFromURL:(id)arg1 download:(BOOL)arg2; // IMP @ 0x2302b0
+ (void)genImageFromLayer:(id)arg1 backgroundColor:(id)arg2 completionHandler:(id /* block */)arg3; // IMP @ 0x2311f0
+ (id)resizeImage:(id)arg1 toSize:(double)arg2; // IMP @ 0x231388
- (id)init; // IMP @ 0x22aa5c
- (void)downloadVideoWithUrl:(id)arg1 audioUrl:(id)arg2 fileName:(id)arg3 format:(id)arg4 videoID:(id)arg5 videoSize:(NSUInteger)arg6 audioSize:(NSUInteger)arg7 duration:(NSUInteger)arg8 captions:(id)arg9; // IMP @ 0x22ac34
- (void)downloadAudioWithUrl:(id)arg1 fileName:(id)arg2 videoID:(id)arg3 audioSize:(NSUInteger)arg4 duration:(NSUInteger)arg5; // IMP @ 0x22b1c0
- (void)downloadProgress:(float)arg1; // IMP @ 0x22b770
- (void)downloadDidFinish:(id)arg1 fileName:(id)arg2; // IMP @ 0x22bbb4
- (void)downloadDidFailureWithError:(id)arg1; // IMP @ 0x22d4cc
- (void)saveMedia:(id)arg1; // IMP @ 0x22d744
- (void)shareMedia:(id)arg1; // IMP @ 0x22dcb8
- (void)cleanup; // IMP @ 0x22e1a4
- (void)askForAction:(id)arg1; // IMP @ 0x22e364
- (id)resizeImage:(id)arg1 toSize:(double)arg2; // IMP @ 0x22ef58
- (id)imageNamed:(id)arg1; // IMP @ 0x22f20c
@end

// Class [47] YTPSpeedPopupController
@interface YTPSpeedPopupController : UIViewController
{
    double _dismissVelocity; // offset 0x8
    YTPSpeedControlView *_speedView; // offset 0x10
    NSLayoutConstraint *_bottomConstraint; // offset 0x18
}
+ (id)speedController; // IMP @ 0x2352e4
- (void)presentFromViewController:(id)arg1; // IMP @ 0x235334
- (void)viewDidAppear:(BOOL)arg1; // IMP @ 0x23537c
- (void)viewDidLoad; // IMP @ 0x2354ec
- (double)calculateWidth; // IMP @ 0x235cec
- (double)bottomConstant; // IMP @ 0x235dbc
- (BOOL)isiPad; // IMP @ 0x235de8
- (BOOL)hasNotch; // IMP @ 0x23611c
- (void)dismiss; // IMP @ 0x2361c0
- (void)handlePan:(id)arg1; // IMP @ 0x236414
- (BOOL)gestureRecognizer:(id)arg1 shouldReceiveTouch:(id)arg2; // IMP @ 0x236924
- (id)speedView; // IMP @ 0x236994
- (void)setSpeedView:(id)arg1; // IMP @ 0x2369a4
- (id)bottomConstraint; // IMP @ 0x2369e0
- (void)setBottomConstraint:(id)arg1; // IMP @ 0x2369f0
@end

// Class [48] YTPSpeedControlView
@interface YTPSpeedControlView : UIView
{
    UISlider *_slider; // offset 0x8
    UILabel *_valueLabel; // offset 0x10
    NSArray *_presets; // offset 0x18
    float _step; // offset 0x20
}
+ (id)speedControls; // IMP @ 0x237ae8
- (id)initWithFrame:(CGRect)arg1; // IMP @ 0x237b20
- (void)setupUI; // IMP @ 0x237d28
- (id)makeStepButton:(id)arg1; // IMP @ 0x238bd4
- (id)makePresetButton:(id)arg1; // IMP @ 0x238eb0
- (void)sliderChanged:(id)arg1; // IMP @ 0x239258
- (void)sliderTapped:(id)arg1; // IMP @ 0x2392e8
- (void)minusTapped; // IMP @ 0x2393f0
- (void)plusTapped; // IMP @ 0x2394a4
- (void)presetTapped:(id)arg1; // IMP @ 0x23953c
- (void)updateLabel:(float)arg1; // IMP @ 0x2395cc
@end

// Class [49] PlayerToast
@interface PlayerToast : UIView
{
    BOOL _isCompact; // offset 0x8
    NSInteger _style; // offset 0x10
    NSMutableArray *_activeConstraints; // offset 0x18
    UIView *_containerView; // offset 0x20
    UIVisualEffectView *_toastView; // offset 0x28
    UIImageView *_toastImage; // offset 0x30
    UILabel *_toastLabel; // offset 0x38
    UILabel *_toastSubLabel; // offset 0x40
    UIView *_toastProgress; // offset 0x48
    CAShapeLayer *_progressLayer; // offset 0x50
    CustomHUD *_volumeHUD; // offset 0x58
}
+ (id)sharedToast; // IMP @ 0x23abbc
- (id)init; // IMP @ 0x23acb4
- (void)showPlayerToastWithText:(id)arg1 value:(double)arg2 style:(NSInteger)arg3 isCompact:(BOOL)arg4; // IMP @ 0x23b47c
- (void)prepareForPresentation; // IMP @ 0x23b90c
- (void)updateToastText:(id)arg1 value:(double)arg2; // IMP @ 0x23b990
- (void)setProgress:(double)arg1; // IMP @ 0x23bc58
- (void)hideToast; // IMP @ 0x23bda8
- (void)setupConstraints; // IMP @ 0x23bf38
- (void)clearConstraints; // IMP @ 0x23c8a4
- (id)imgForVal:(double)arg1; // IMP @ 0x23c8ec
- (id)subLabelForVal:(double)arg1 style:(NSInteger)arg2; // IMP @ 0x23d3e4
- (void)setupSubForStyle:(NSInteger)arg1; // IMP @ 0x23d624
- (void)setValue:(double)arg1 forEventWithStyle:(NSInteger)arg2; // IMP @ 0x23d6a8
- (id)sourceView; // IMP @ 0x23d8f4
- (BOOL)isLandscape; // IMP @ 0x23d978
@end

// Class [50] CustomHUD
@interface CustomHUD : NSObject
{
    MPVolumeController *_controller; // offset 0x8
}
- (id)init; // IMP @ 0x23f450
- (void)addToController; // IMP @ 0x23f504
- (void)removeFromController; // IMP @ 0x23f570
- (void)setVolumeLevel:(float)arg1; // IMP @ 0x23f5dc
- (float)volumeLevel; // IMP @ 0x23f614
- (id)windowSceneForVolumeDisplay; // IMP @ 0x23f624
- (id)volumeAudioCategory; // IMP @ 0x23f6a8
- (id)controller; // IMP @ 0x23f6b8
@end

