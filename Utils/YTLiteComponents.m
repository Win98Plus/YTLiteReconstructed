//
// YTLiteComponents.m
// Reconstructed implementations for YTLite internal classes from YTLite.dylib
//

#import "../Headers/YTLite.h"
#import <netinet/in.h>

// MARK: - Class [1] WelcomeVC
@implementation WelcomeVC

- (void)viewDidLoad {
}

- (void)thanksButtonTapped {
}

- (void)contactsButtonTapped:(id)arg1 {
}

- (id)imageNamed:(id)arg1 {
    return nil;
}

- (double)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2 {
    return 0.0;
}

- (NSInteger)numberOfSectionsInTableView:(id)arg1 {
    return 0;
}

- (NSInteger)tableView:(id)arg1 numberOfRowsInSection:(NSInteger)arg2 {
    return 0;
}

- (void)tableView:(id)arg1 willDisplayCell:(id)arg2 forRowAtIndexPath:(id)arg3 {
}

- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2 {
    return nil;
}

- (BOOL)tableView:(id)arg1 shouldHighlightRowAtIndexPath:(id)arg2 {
    return 0;
}

- (void)showAlertWithTitle:(id)arg1 imageName:(id)arg2 {
}

- (id)cellImageWithName:(id)arg1 {
    return nil;
}

@end

// MARK: - Class [2] DownloadMenuHelper
@implementation DownloadMenuHelper

+ (void)showDownloadSheetShorts:(id)arg1 withSender:(id)arg2 {
}

+ (void)showDownloadSheet:(id)arg1 withSender:(id)arg2 {
}

- (void)showVideoSheet:(id)arg1 withSender:(id)arg2 {
}

- (void)showImagesSheet:(id)arg1 withSender:(id)arg2 {
}

- (void)showInformationSheet:(id)arg1 withSender:(id)arg2 {
}

- (void)showExtPlayerSheet:(id)arg1 withSender:(id)arg2 {
}

- (id)getVideoFormatsArray:(id)arg1 isShorts:(BOOL)arg2 {
    return nil;
}

- (id)getAudioFormatsArray:(id)arg1 {
    return nil;
}

- (id)getBestAudioFormat:(id)arg1 playerVC:(id)arg2 {
    return nil;
}

- (id)getDefaultAudioTrack:(id)arg1 {
    return nil;
}

- (id)getEnglishAudioTrack:(id)arg1 {
    return nil;
}

- (id)detailForMimeType:(id)arg1 {
    return nil;
}

- (NSInteger)getResoForQuality:(id)arg1 {
    return 0;
}

- (void)downloadVideoWithFormat:(id)arg1 withAudioFormats:(id)arg2 fileName:(id)arg3 extension:(id)arg4 videoID:(id)arg5 playerVC:(id)arg6 sender:(id)arg7 {
}

- (void)downloadVideoWithFormat:(id)arg1 audioFormat:(id)arg2 fileName:(id)arg3 extension:(id)arg4 videoID:(id)arg5 playerVC:(id)arg6 sender:(id)arg7 {
}

- (void)downloadVideoWithUrl:(id)arg1 audioUrl:(id)arg2 fileName:(id)arg3 extension:(id)arg4 videoID:(id)arg5 videoSize:(NSUInteger)arg6 audioSize:(NSUInteger)arg7 duration:(NSUInteger)arg8 captions:(id)arg9 playerVC:(id)arg10 {
}

- (void)getThumbnail:(id)arg1 {
}

- (void)checkSpaceAvailabilityForMedia:(NSInteger)arg1 completion:(id /* block */)arg2 {
}

- (void)showAudioTrackSelector:(id)arg1 sender:(id)arg2 playerVC:(id)arg3 completion:(id /* block */)arg4 {
}

- (BOOL)hasCaptions:(id)arg1 {
    return 0;
}

- (void)showTranscriptSheet:(id)arg1 withSender:(id)arg2 {
}

- (void)showCaptionsSheet:(id)arg1 withSender:(id)arg2 {
}

- (id)captionsForDownloading:(id)arg1 {
    return nil;
}

- (id)titleForCaption:(id)arg1 {
    return nil;
}

- (void)getCaptionsUrlSheet:(id)arg1 sender:(id)arg2 completion:(id /* block */)arg3 {
}

- (void)shareSRT:(id)arg1 sourceView:(id)arg2 {
}

@end

// MARK: - Class [3] YTPTableViewCell
@implementation YTPTableViewCell

- (void)setSelected:(BOOL)arg1 animated:(BOOL)arg2 {
}

- (id)initWithStyle:(NSInteger)arg1 reuseIdentifier:(id)arg2 {
    return nil;
}

@end

// MARK: - Class [4] DVNPickerView
@implementation DVNPickerView

- (void)layoutSubviews {
}

@end

// MARK: - Class [5] DVNTableViewController
@implementation DVNTableViewController

- (id)initWithModel:(id)arg1 defaults:(id)arg2 {
    return nil;
}

- (void)loadView {
}

- (void)viewDidLoad {
}

- (void)viewWillAppear:(BOOL)arg1 {
}

- (void)traitCollectionDidChange:(id)arg1 {
}

- (void)searchBarSearchButtonClicked:(id)arg1 {
}

- (void)_removeSearchFieldCornerRadius:(id)arg1 {
}

- (void)_performSearch:(id)arg1 {
}

- (void)searchBar:(id)arg1 textDidChange:(id)arg2 {
}

- (void)searchBarCancelButtonClicked:(id)arg1 {
}

- (void)searchBarTextDidBeginEditing:(id)arg1 {
}

- (void)searchBarTextDidEndEditing:(id)arg1 {
}

- (void)_searchClearTapped:(id)arg1 {
}

- (void)navigateToCell:(id)arg1 {
}

- (BOOL)cellExistsInModel:(id)arg1 target:(id)arg2 {
    return 0;
}

- (void)highlightRowAtIndexPath:(id)arg1 {
}

- (void)viewDidAppear:(BOOL)arg1 {
}

- (void)pushController:(id)arg1 withTitle:(id)arg2 {
}

- (void)addDismissButton:(BOOL)arg1 {
}

- (void)closeButtonTapped {
}

- (void)addLeftBarItem:(id)arg1 image:(id)arg2 handler:(id /* block */)arg3 {
}

- (void)addRightBarItem:(id)arg1 image:(id)arg2 handler:(id /* block */)arg3 {
}

- (void)_barButtonTriggered:(id)arg1 {
}

- (void)setupThanksHeart {
}

- (double)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2 {
    return 0.0;
}

- (id)tableView:(id)arg1 titleForHeaderInSection:(NSInteger)arg2 {
    return nil;
}

- (id)tableView:(id)arg1 titleForFooterInSection:(NSInteger)arg2 {
    return nil;
}

- (void)tableView:(id)arg1 willDisplayHeaderView:(id)arg2 forSection:(NSInteger)arg3 {
}

- (void)tableView:(id)arg1 willDisplayFooterView:(id)arg2 forSection:(NSInteger)arg3 {
}

- (double)tableView:(id)arg1 heightForFooterInSection:(NSInteger)arg2 {
    return 0.0;
}

- (NSInteger)numberOfSectionsInTableView:(id)arg1 {
    return 0;
}

- (NSInteger)tableView:(id)arg1 numberOfRowsInSection:(NSInteger)arg2 {
    return 0;
}

- (id)_cellForIndexPath:(id)arg1 {
    return nil;
}

- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2 {
    return nil;
}

- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2 {
}

- (id)formatSliderValue:(double)arg1 format:(NSInteger)arg2 {
    return nil;
}

- (id)pickerView:(id)arg1 viewForRow:(NSInteger)arg2 forComponent:(NSInteger)arg3 reusingView:(id)arg4 {
    return nil;
}

- (NSInteger)numberOfComponentsInPickerView:(id)arg1 {
    return 0;
}

- (NSInteger)pickerView:(id)arg1 numberOfRowsInComponent:(NSInteger)arg2 {
    return 0;
}

- (void)pickerView:(id)arg1 didSelectRow:(NSInteger)arg2 inComponent:(NSInteger)arg3 {
}

- (id)headerImage:(id)arg1 {
    return nil;
}

- (id)iconImage:(id)arg1 mode:(NSInteger)arg2 size:(double)arg3 {
    return nil;
}

- (id)accessoryImage:(id)arg1 {
    return nil;
}

- (id)_cellForTag:(NSInteger)arg1 {
    return nil;
}

- (id)_cellsForSection:(id)arg1 {
    return nil;
}

- (id)switchForKey:(id)arg1 {
    return nil;
}

- (void)toggleSwitch:(id)arg1 {
}

- (void)setSegment:(id)arg1 {
}

- (void)sliderValueChanged:(id)arg1 {
}

- (void)stepperValueChanged:(id)arg1 {
}

- (void)colorWellTap:(id)arg1 {
}

- (BOOL)textFieldShouldReturn:(id)arg1 {
    return 0;
}

- (void)titleValue:(id)arg1 {
}

- (id)segmentForItems:(id)arg1 isCompact:(BOOL)arg2 {
    return nil;
}

- (id)sliderWithKey:(id)arg1 min:(double)arg2 max:(double)arg3 {
    return nil;
}

- (id)timePickerForCell:(id)arg1 indexPath:(id)arg2 {
    return nil;
}

- (id)stepperForCell:(id)arg1 indexPath:(id)arg2 {
    return nil;
}

- (id)stepperLabelForCell:(id)arg1 {
    return nil;
}

- (id)colorWellForKey:(id)arg1 title:(id)arg2 {
    return nil;
}

- (id)textFieldForCell:(id)arg1 {
    return nil;
}

- (void)editorForIndexPath:(id)arg1 {
}

- (id)menuButtonWithTitle:(id)arg1 array:(id)arg2 key:(id)arg3 {
    return nil;
}

- (id)systemImage:(id)arg1 withSize:(double)arg2 {
    return nil;
}

- (BOOL)isRTL {
    return 0;
}

- (void)_reloadSections {
}

- (void)dealloc {
}

- (id)model {
    return self->_model;
}

- (void)setModel:(id)arg1 {
    self->_model = arg1;
}

- (id)defaults {
    return self->_defaults;
}

- (void)setDefaults:(id)arg1 {
    self->_defaults = arg1;
}

- (id)pendingScrollCell {
    return self->_pendingScrollCell;
}

- (void)setPendingScrollCell:(id)arg1 {
    self->_pendingScrollCell = arg1;
}

@end

// MARK: - Class [6] TabbarVC
@implementation TabbarVC

- (id)init {
    self = [super init];
    return self;
}

- (id)initForSettings:(BOOL)arg1 {
    return nil;
}

- (void)loadView {
}

- (void)closeButtonTapped {
}

- (void)initTabs {
}

- (void)saveTabsOrder {
}

- (id)tableView:(id)arg1 titleForHeaderInSection:(NSInteger)arg2 {
    return nil;
}

- (id)tableView:(id)arg1 titleForFooterInSection:(NSInteger)arg2 {
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(id)arg1 {
    return 0;
}

- (NSInteger)tableView:(id)arg1 numberOfRowsInSection:(NSInteger)arg2 {
    return 0;
}

- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2 {
    return nil;
}

- (id)iconImageNamed:(id)arg1 {
    return nil;
}

- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2 {
}

- (id)switchForKey:(id)arg1 {
    return nil;
}

- (void)toggleSwitch:(id)arg1 {
}

- (id)segmentForItems:(id)arg1 {
    return nil;
}

- (void)setSegment:(id)arg1 {
}

- (BOOL)tableView:(id)arg1 canEditRowAtIndexPath:(id)arg2 {
    return 0;
}

- (BOOL)tableView:(id)arg1 canMoveRowAtIndexPath:(id)arg2 {
    return 0;
}

- (id)tableView:(id)arg1 targetIndexPathForMoveFromRowAtIndexPath:(id)arg2 toProposedIndexPath:(id)arg3 {
    return nil;
}

- (void)tableView:(id)arg1 moveRowAtIndexPath:(id)arg2 toIndexPath:(id)arg3 {
}

- (NSInteger)tableView:(id)arg1 editingStyleForRowAtIndexPath:(id)arg2 {
    return 0;
}

- (void)tableView:(id)arg1 commitEditingStyle:(NSInteger)arg2 forRowAtIndexPath:(id)arg3 {
}

@end

// MARK: - Class [7] YTPSettingsBuilder
@implementation YTPSettingsBuilder

- (id)rootTable {
    return nil;
}

- (id)downloadingTable {
    return nil;
}

- (id)navbarTable {
    return nil;
}

- (id)feedTable {
    return nil;
}

- (id)playerTable {
    return nil;
}

- (id)shortsTable {
    return nil;
}

- (id)interfaceTable {
    return nil;
}

- (id)tabBarTable {
    return nil;
}

- (id)sbTable {
    return nil;
}

- (id)rpcTable {
    return nil;
}

- (id)contribsTable {
    return nil;
}

- (id)libsTable {
    return nil;
}

- (id)thanksTable {
    return nil;
}

- (id)prefsTable {
    return nil;
}

- (id)devSection {
    return nil;
}

- (id)creditsSection {
    return nil;
}

- (id)patreonSection:(id)arg1 {
    return nil;
}

- (id)patreonButtonCellWithType:(id)arg1 model:(id)arg2 {
    return nil;
}

- (void)importPreferences {
}

- (void)resetSettings {
}

- (void)showDonationSheet:(id)arg1 {
}

- (void)openURL:(id)arg1 {
}

- (id)thanksImage:(id)arg1 {
    return nil;
}

- (id)sbSegments {
    return nil;
}

- (void)clearCacheWithCompletion:(id /* block */)arg1 {
}

- (id)getCacheSize {
    return nil;
}

- (id)presenter {
    return self->_presenter;
}

- (void)setPresenter:(id)arg1 {
    self->_presenter = arg1;
}

@end

// MARK: - Class [8] DVNTableModel
@implementation DVNTableModel

+ (id)model {
    return nil;
}

+ (id)modelWithTitle:(id)arg1 sections:(id)arg2 {
    return nil;
}

+ (id)modelWithTitle:(id)arg1 header:(id)arg2 footer:(id)arg3 sections:(id)arg4 {
    return nil;
}

+ (id)modelWithTitle:(id)arg1 header:(id)arg2 footer:(id)arg3 viewController:(id)arg4 {
    return nil;
}

- (id)init {
    self = [super init];
    return self;
}

- (void)addSection:(id)arg1 {
}

- (void)addSections:(id)arg1 {
}

- (id)cellForString:(id)arg1 {
    return nil;
}

- (id)cellsMatching:(id /* block */)arg1 {
    return nil;
}

- (id)cellsMatchingRecursive:(id /* block */)arg1 {
    return nil;
}

- (void)_collectMatching:(id /* block */)arg1 into:(id)arg2 visited:(id)arg3 {
}

- (id)title {
    return self->_title;
}

- (void)setTitle:(id)arg1 {
    self->_title = arg1;
}

- (id)header {
    return self->_header;
}

- (void)setHeader:(id)arg1 {
    self->_header = arg1;
}

- (id)footer {
    return self->_footer;
}

- (void)setFooter:(id)arg1 {
    self->_footer = arg1;
}

- (id)headerFont {
    return self->_headerFont;
}

- (void)setHeaderFont:(id)arg1 {
    self->_headerFont = arg1;
}

- (id)footerFont {
    return self->_footerFont;
}

- (void)setFooterFont:(id)arg1 {
    self->_footerFont = arg1;
}

- (NSInteger)headerAlignment {
    return self->_headerAlignment;
}

- (void)setHeaderAlignment:(NSInteger)arg1 {
    self->_headerAlignment = arg1;
}

- (NSInteger)footerAlignment {
    return self->_footerAlignment;
}

- (void)setFooterAlignment:(NSInteger)arg1 {
    self->_footerAlignment = arg1;
}

- (BOOL)showsThanksHeart {
    return self->_showsThanksHeart;
}

- (void)setShowsThanksHeart:(BOOL)arg1 {
    self->_showsThanksHeart = arg1;
}

- (BOOL)supportsSearching {
    return self->_supportsSearching;
}

- (void)setSupportsSearching:(BOOL)arg1 {
    self->_supportsSearching = arg1;
}

- (id)sections {
    return self->_sections;
}

- (void)setSections:(id)arg1 {
    self->_sections = arg1;
}

- (id)viewController {
    return self->_viewController;
}

- (void)setViewController:(id)arg1 {
    self->_viewController = arg1;
}

- (id)selfViewController {
    return self->_selfViewController;
}

- (void)setSelfViewController:(id)arg1 {
    self->_selfViewController = arg1;
}

@end

// MARK: - Class [9] DVNSection
@implementation DVNSection

+ (id)sectionWithIdentifier:(id)arg1 {
    return nil;
}

+ (id)sectionWithCells:(id)arg1 identifier:(id)arg2 {
    return nil;
}

+ (id)sectionWithHeader:(id)arg1 cells:(id)arg2 identifier:(id)arg3 {
    return nil;
}

+ (id)sectionWithHeader:(id)arg1 footer:(id)arg2 cells:(id)arg3 identifier:(id)arg4 {
    return nil;
}

+ (id)sectionWithHeader:(id)arg1 headerIcon:(id)arg2 cells:(id)arg3 identifier:(id)arg4 {
    return nil;
}

+ (id)sectionWithHeader:(id)arg1 headerIcon:(id)arg2 footer:(id)arg3 cells:(id)arg4 identifier:(id)arg5 {
    return nil;
}

- (id)init {
    self = [super init];
    return self;
}

- (void)_appendCells:(id)arg1 {
}

- (void)addCell:(id)arg1 {
}

- (void)addCells:(id)arg1 {
}

- (id)header {
    return self->_header;
}

- (void)setHeader:(id)arg1 {
    self->_header = arg1;
}

- (id)footer {
    return self->_footer;
}

- (void)setFooter:(id)arg1 {
    self->_footer = arg1;
}

- (id)identifier {
    return self->_identifier;
}

- (void)setIdentifier:(id)arg1 {
    self->_identifier = arg1;
}

- (id)headerIcon {
    return self->_headerIcon;
}

- (void)setHeaderIcon:(id)arg1 {
    self->_headerIcon = arg1;
}

- (id)cells {
    return self->_cells;
}

- (void)setCells:(id)arg1 {
    self->_cells = arg1;
}

- (id /* block */)cellsProvider {
    return self->_cellsProvider;
}

- (void)setCellsProvider:(id /* block */)arg1 {
    self->_cellsProvider = arg1;
}

@end

// MARK: - Class [10] DVNCell
@implementation DVNCell

+ (id)controllerCellWithModel:(id)arg1 title:(id)arg2 subtitle:(id)arg3 icon:(id)arg4 {
    return nil;
}

+ (id)cellWithTitleIndexes:(id)arg1 key:(id)arg2 {
    return nil;
}

+ (id)cellWithImageIndexes:(id)arg1 key:(id)arg2 {
    return nil;
}

+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 handler:(id /* block */)arg3 {
    return nil;
}

+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 selfHandler:(id /* block */)arg3 {
    return nil;
}

+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 type:(NSInteger)arg3 key:(id)arg4 {
    return nil;
}

+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 icon:(id)arg3 type:(NSInteger)arg4 key:(id)arg5 {
    return nil;
}

+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 imageIndexes:(id)arg3 key:(id)arg4 {
    return nil;
}

+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 titleIndexes:(id)arg3 key:(id)arg4 {
    return nil;
}

+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 titleIndexes:(id)arg3 type:(NSInteger)arg4 key:(id)arg5 {
    return nil;
}

+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 icon:(id)arg3 accessoryIcon:(id)arg4 type:(NSInteger)arg5 key:(id)arg6 {
    return nil;
}

+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 icon:(id)arg3 accessoryIcon:(id)arg4 type:(NSInteger)arg5 handler:(id /* block */)arg6 {
    return nil;
}

+ (id)cellWithTitle:(id)arg1 subtitle:(id)arg2 image:(id)arg3 accessoryIcon:(id)arg4 type:(NSInteger)arg5 handler:(id /* block */)arg6 {
    return nil;
}

+ (id)sliderCellWithMinimum:(double)arg1 maximum:(double)arg2 divider:(double)arg3 key:(id)arg4 {
    return nil;
}

+ (id)sliderCellWithMinimum:(double)arg1 maximum:(double)arg2 divider:(double)arg3 format:(NSInteger)arg4 key:(id)arg5 {
    return nil;
}

+ (id)textFieldCellWithTitle:(id)arg1 subtitle:(id)arg2 placeholder:(id)arg3 key:(id)arg4 {
    return nil;
}

+ (id)timePickerWithTitle:(id)arg1 subtitle:(id)arg2 minimum:(double)arg3 maximum:(double)arg4 format:(NSInteger)arg5 key:(id)arg6 {
    return nil;
}

+ (id)stepperCellWithTitle:(id)arg1 subtitle:(id)arg2 minimum:(double)arg3 maximum:(double)arg4 step:(double)arg5 format:(NSInteger)arg6 key:(id)arg7 {
    return nil;
}

- (id)init {
    self = [super init];
    return self;
}

- (id)identifier {
    return self->_identifier;
}

- (void)setIdentifier:(id)arg1 {
    self->_identifier = arg1;
}

- (id)reuseIdentifier {
    return self->_reuseIdentifier;
}

- (id)title {
    return self->_title;
}

- (void)setTitle:(id)arg1 {
    self->_title = arg1;
}

- (id)subtitle {
    return self->_subtitle;
}

- (void)setSubtitle:(id)arg1 {
    self->_subtitle = arg1;
}

- (id)detailText {
    return self->_detailText;
}

- (void)setDetailText:(id)arg1 {
    self->_detailText = arg1;
}

- (id)key {
    return self->_key;
}

- (void)setKey:(id)arg1 {
    self->_key = arg1;
}

- (id)placeholder {
    return self->_placeholder;
}

- (void)setPlaceholder:(id)arg1 {
    self->_placeholder = arg1;
}

- (id)titleIndexes {
    return self->_titleIndexes;
}

- (void)setTitleIndexes:(id)arg1 {
    self->_titleIndexes = arg1;
}

- (id)imageIndexes {
    return self->_imageIndexes;
}

- (void)setImageIndexes:(id)arg1 {
    self->_imageIndexes = arg1;
}

- (double)dividerValue {
    return self->_dividerValue;
}

- (void)setDividerValue:(double)arg1 {
    self->_dividerValue = arg1;
}

- (double)minimumValue {
    return self->_minimumValue;
}

- (void)setMinimumValue:(double)arg1 {
    self->_minimumValue = arg1;
}

- (double)maximumValue {
    return self->_maximumValue;
}

- (void)setMaximumValue:(double)arg1 {
    self->_maximumValue = arg1;
}

- (NSInteger)sliderFormat {
    return self->_sliderFormat;
}

- (void)setSliderFormat:(NSInteger)arg1 {
    self->_sliderFormat = arg1;
}

- (BOOL)reloadsCell {
    return self->_reloadsCell;
}

- (void)setReloadsCell:(BOOL)arg1 {
    self->_reloadsCell = arg1;
}

- (BOOL)reloadsTable {
    return self->_reloadsTable;
}

- (void)setReloadsTable:(BOOL)arg1 {
    self->_reloadsTable = arg1;
}

- (BOOL)shouldHideDetail {
    return self->_shouldHideDetail;
}

- (void)setShouldHideDetail:(BOOL)arg1 {
    self->_shouldHideDetail = arg1;
}

- (NSInteger)renderingMode {
    return self->_renderingMode;
}

- (void)setRenderingMode:(NSInteger)arg1 {
    self->_renderingMode = arg1;
}

- (id)icon {
    return self->_icon;
}

- (void)setIcon:(id)arg1 {
    self->_icon = arg1;
}

- (id)image {
    return self->_image;
}

- (void)setImage:(id)arg1 {
    self->_image = arg1;
}

- (id)accessoryIcon {
    return self->_accessoryIcon;
}

- (void)setAccessoryIcon:(id)arg1 {
    self->_accessoryIcon = arg1;
}

- (NSInteger)type {
    return self->_type;
}

- (void)setType:(NSInteger)arg1 {
    self->_type = arg1;
}

- (id)tintColor {
    return self->_tintColor;
}

- (void)setTintColor:(id)arg1 {
    self->_tintColor = arg1;
}

- (id)sourceView {
    return self->_sourceView;
}

- (void)setSourceView:(id)arg1 {
    self->_sourceView = arg1;
}

- (id)controllerModel {
    return self->_controllerModel;
}

- (void)setControllerModel:(id)arg1 {
    self->_controllerModel = arg1;
}

- (id)customData {
    return self->_customData;
}

- (void)setCustomData:(id)arg1 {
    self->_customData = arg1;
}

- (id /* block */)handler {
    return self->_handler;
}

- (void)setHandler:(id /* block */)arg1 {
    self->_handler = arg1;
}

- (id /* block */)selfHandler {
    return self->_selfHandler;
}

- (void)setSelfHandler:(id /* block */)arg1 {
    self->_selfHandler = arg1;
}

- (id /* block */)handlerWithCompletion {
    return self->_handlerWithCompletion;
}

- (void)setHandlerWithCompletion:(id /* block */)arg1 {
    self->_handlerWithCompletion = arg1;
}

- (id /* block */)subtitleProvider {
    return self->_subtitleProvider;
}

- (void)setSubtitleProvider:(id /* block */)arg1 {
    self->_subtitleProvider = arg1;
}

- (id /* block */)titleIndexesProvider {
    return self->_titleIndexesProvider;
}

- (void)setTitleIndexesProvider:(id /* block */)arg1 {
    self->_titleIndexesProvider = arg1;
}

- (id /* block */)validationHandler {
    return self->_validationHandler;
}

- (void)setValidationHandler:(id /* block */)arg1 {
    self->_validationHandler = arg1;
}

- (id)errorText {
    return self->_errorText;
}

- (void)setErrorText:(id)arg1 {
    self->_errorText = arg1;
}

@end

// MARK: - Class [11] DVNSupportersVC
@implementation DVNSupportersVC

- (void)viewDidLoad {
}

- (void)webView:(id)arg1 didStartProvisionalNavigation:(id)arg2 {
}

- (void)webView:(id)arg1 didFinishNavigation:(id)arg2 {
}

- (void)webView:(id)arg1 didFailProvisionalNavigation:(id)arg2 withError:(id)arg3 {
}

@end

// MARK: - Class [15] SBPlayerDecorator
@implementation SBPlayerDecorator

+ (void)addDurationWithoutSegments:(id)arg1 videoController:(id)arg2 {
}

+ (BOOL)shouldDrawRoundedForBarView:(id)arg1 {
    return 0;
}

+ (id)_decorationDataForBarView:(id)arg1 {
    return nil;
}

+ (void)drawSegmentsDecorationView:(id)arg1 {
}

+ (void)drawSegmentsOnActiveDecorationView:(id)arg1 {
}

+ (void)_drawSegmentsForData:(id)arg1 {
}

+ (void)drawSegments:(id)arg1 layer:(id)arg2 playerVC:(id)arg3 {
}

+ (void)drawSegmentableSegments:(id)arg1 playerBar:(id)arg2 playerVC:(id)arg3 {
}

@end

// MARK: - Class [16] SBPlayerDecorationData
@implementation SBPlayerDecorationData

- (id)segments {
    return self->_segments;
}

- (void)setSegments:(id)arg1 {
    self->_segments = arg1;
}

- (double)playerBarWidth {
    return self->_playerBarWidth;
}

- (void)setPlayerBarWidth:(double)arg1 {
    self->_playerBarWidth = arg1;
}

- (double)mediaDuration {
    return self->_mediaDuration;
}

- (void)setMediaDuration:(double)arg1 {
    self->_mediaDuration = arg1;
}

- (id)barView {
    return self->_barView;
}

- (void)setBarView:(id)arg1 {
    self->_barView = arg1;
}

@end

// MARK: - Class [17] DVNMediaPicker
@implementation DVNMediaPicker

+ (id)sharedPicker {
    static DVNMediaPicker *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (void)presentImagePickerForVC:(id)arg1 {
}

- (void)picker:(id)arg1 didFinishPicking:(id)arg2 {
}

- (void)presentFilePickerForVC:(id)arg1 isMultipleSelection:(BOOL)arg2 {
}

- (void)documentPicker:(id)arg1 didPickDocumentsAtURLs:(id)arg2 {
}

- (id)tempCopyOfURL:(id)arg1 {
    return nil;
}

- (void)prepareMediaForUse:(id)arg1 {
}

- (void)prepareURLsForImport:(id)arg1 {
}

@end

// MARK: - Class [18] YTPMedia
@implementation YTPMedia

+ (id)sharedMedia {
    static YTPMedia *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

+ (NSInteger)pageStyle {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"pageStyle"];
}

+ (id)adaptiveBackgroundColor {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"adaptiveBackgroundColor"];
}

+ (id)oledForColor:(id)arg1 {
    return nil;
}

+ (id)imageWithName:(id)arg1 {
    return nil;
}

+ (id)historyTab {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"historyTab"];
}

+ (id)historyTabSelected {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"historyTabSelected"];
}

+ (id)watchLaterTab {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"watchLaterTab"];
}

+ (id)watchLaterTabSelected {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"watchLaterTabSelected"];
}

+ (id)postsTab {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"postsTab"];
}

+ (id)postsTabSelected {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"postsTabSelected"];
}

+ (id)hypeTab {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"hypeTab"];
}

+ (id)hypeTabSelected {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"hypeTabSelected"];
}

+ (id)musicTab {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"musicTab"];
}

+ (id)musicTabSelected {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"musicTabSelected"];
}

+ (id)liveTab {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"liveTab"];
}

+ (id)liveTabSelected {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"liveTabSelected"];
}

+ (id)gamingTab {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"gamingTab"];
}

+ (id)gamingTabSelected {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"gamingTabSelected"];
}

+ (id)sportsTab {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"sportsTab"];
}

+ (id)sportsTabSelected {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"sportsTabSelected"];
}

+ (id)notificationsTab {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"notificationsTab"];
}

+ (id)notificationsTabSelected {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"notificationsTabSelected"];
}

+ (id)ytPlus {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"ytPlus"];
}

+ (id)ytPlusShorts {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"ytPlusShorts"];
}

+ (id)sponsorblock {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"sponsorblock"];
}

+ (id)lock {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"lock"];
}

+ (id)volumeOff {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"volumeOff"];
}

+ (id)volumeOn {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"volumeOn"];
}

+ (id)moon {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"moon"];
}

+ (id)downloading {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"downloading"];
}

+ (id)credits {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"credits"];
}

+ (id)donor {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"donor"];
}

+ (id)feed {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"feed"];
}

+ (id)FEshorts {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"FEshorts"];
}

+ (id)interface {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"interface"];
}

+ (id)libs {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"libs"];
}

+ (id)localization {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"localization"];
}

+ (id)navbar {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"navbar"];
}

+ (id)open_new {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"open_new"];
}

+ (id)player {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"player"];
}

+ (id)support {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"support"];
}

+ (id)tabbar {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"tabbar"];
}

+ (id)ytl_settings {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"ytl_settings"];
}

+ (id)captions {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"captions"];
}

+ (id)FElibrary {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"FElibrary"];
}

+ (id)FEsubscriptions {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"FEsubscriptions"];
}

+ (id)FEuploads {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"FEuploads"];
}

+ (id)FEwhat_to_watch {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"FEwhat_to_watch"];
}

+ (id)link {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"link"];
}

+ (id)x_prefs {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"x_prefs"];
}

+ (id)box_checkmark {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"box_checkmark"];
}

+ (id)box_empty {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"box_empty"];
}

+ (id)copy {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"copy"];
}

+ (id)image_library {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"image_library"];
}

+ (id)image {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"image"];
}

+ (id)message {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"message"];
}

+ (id)music {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"music"];
}

+ (id)play_circle {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"play_circle"];
}

+ (id)show_image {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"show_image"];
}

+ (id)star_half {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"star_half"];
}

+ (id)youtube_logo {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"youtube_logo"];
}

+ (id)check {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"check"];
}

+ (id)empty {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"empty"];
}

+ (id)adaptiveDiscord {
    return [[NSBundle ytl_defaultBundle] imageWithName:@"adaptiveDiscord"];
}

- (void)setCairo:(BOOL)arg1 {
    self->_cairo = arg1;
}

- (BOOL)isCairo {
    return 0;
}

@end

// MARK: - Class [19] DVNHorizontalPanDelegate
@implementation DVNHorizontalPanDelegate

- (BOOL)gestureRecognizerShouldBegin:(id)arg1 {
    return 0;
}

@end

// MARK: - Class [20] ToastView
@implementation ToastView

+ (void)initialize {
}

+ (id)toastWindow {
    return nil;
}

- (id)init {
    self = [super init];
    return self;
}

- (void)enqueueCommand:(id /* block */)arg1 {
}

- (void)processQueue {
}

- (void)setupInterfaceWithText:(id)arg1 progress:(float)arg2 withStop:(BOOL)arg3 isStatus:(BOOL)arg4 isSuccess:(BOOL)arg5 withWait:(BOOL)arg6 {
}

- (void)handlePanGesture:(id)arg1 {
}

- (void)handleTap {
}

- (void)updateLayout {
}

- (void)calculateToastParametersWithKeyboardHeight:(double)arg1 bottomOffset:(void *)arg2 topOffset:(void *)arg3 scale:(void *)arg4 {
}

- (void)configureToastAppearanceWithBottomOffset:(double)arg1 topOffset:(double)arg2 scale:(double)arg3 width:(double)arg4 animationDuration:(double)arg5 {
}

- (void)configureToastAppearanceWithBottomOffset:(double)arg1 topOffset:(double)arg2 scale:(double)arg3 width:(double)arg4 alpha:(double)arg5 animationDuration:(double)arg6 completion:(id /* block */)arg7 {
}

- (void)setupObservers {
}

- (void)removeObservers {
}

- (void)goodHeightDidChange:(id)arg1 {
}

- (void)keyboardWillShow:(id)arg1 {
}

- (void)keyboardWillHide:(id)arg1 {
}

- (void)cleanup {
}

- (void)cancelButtonTapped {
}

- (void)handleLongPress:(id)arg1 {
}

- (void)showProgressWithText:(id)arg1 progress:(float)arg2 withStop:(BOOL)arg3 stopCompletion:(id /* block */)arg4 {
}

- (void)updateText:(id)arg1 progress:(float)arg2 {
}

- (void)updateText:(id)arg1 progress:(float)arg2 animated:(BOOL)arg3 {
}

- (void)showMessageWithText:(id)arg1 isSuccess:(BOOL)arg2 {
}

- (void)showMessageWithText:(id)arg1 isSuccess:(BOOL)arg2 duration:(double)arg3 {
}

- (void)showText:(id)arg1 {
}

- (void)showToast:(id)arg1 {
}

- (void)showProgressiveToastWithText:(id)arg1 duration:(double)arg2 isSuccess:(BOOL)arg3 {
}

- (void)showProgressiveToastWithText:(id)arg1 duration:(double)arg2 actionTitle:(id)arg3 actionCompletion:(id /* block */)arg4 {
}

- (void)showProgressiveToastWithText:(id)arg1 duration:(double)arg2 actionIcon:(id)arg3 actionCompletion:(id /* block */)arg4 {
}

- (void)showProgressiveToastWithText:(id)arg1 duration:(double)arg2 actionIcon:(id)arg3 ignoresPan:(BOOL)arg4 actionCompletion:(id /* block */)arg5 {
}

- (void)showDonationReminder:(id)arg1 {
}

- (void)startTimerCountdown:(double)arg1 {
}

- (void)hideAnimatedWithCompletion:(id /* block */)arg1 {
}

- (void)hideImmediately {
}

- (void)hideWithDelay:(double)arg1 {
}

- (void)hide {
}

- (BOOL)isHidden {
    return 0;
}

- (void)hideWithCompletion:(id /* block */)arg1 {
}

- (BOOL)isLandscape {
    return 0;
}

- (BOOL)isFullscreen {
    return 0;
}

- (BOOL)isPinnedTop {
    return 0;
}

- (double)bottomOffset {
    return 0.0;
}

- (void)dealloc {
}

- (id /* block */)completion {
    return self->_completion;
}

- (void)setCompletion:(id /* block */)arg1 {
    self->_completion = arg1;
}

@end

// MARK: - Class [21] ToastWindow
@implementation ToastWindow

+ (void)initialize {
}

- (id)hitTest:(CGPoint)arg1 withEvent:(id)arg2 {
    return nil;
}

- (id)initWithWindowScene:(id)arg1 {
    return nil;
}

- (BOOL)canBecomeKeyWindow {
    return 0;
}

- (void)makeKeyAndVisible {
}

- (BOOL)shouldAffectStatusBarAppearance {
    return 0;
}

- (BOOL)_windowControlsStatusBarOrientation {
    return 0;
}

- (BOOL)_canBecomeKeyWindow {
    return 0;
}

- (id)appKeyWindow {
    return nil;
}

@end

// MARK: - Class [22] ToastManager
@implementation ToastManager

+ (id)sharedManager {
    static ToastManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

+ (void)showMessageWithText:(id)arg1 isSuccess:(BOOL)arg2 {
}

- (id)init {
    self = [super init];
    return self;
}

- (void)registerToast:(id)arg1 {
}

- (void)unregisterToast:(id)arg1 {
}

- (void)updateAllToasts {
}

- (id)toasts {
    return self->_toasts;
}

- (void)setToasts:(id)arg1 {
    self->_toasts = arg1;
}

- (id)offsetController {
    return self->_offsetController;
}

- (void)setOffsetController:(id)arg1 {
    self->_offsetController = arg1;
}

- (BOOL)isPinnedTop {
    return self->_isPinnedTop;
}

- (void)setIsPinnedTop:(BOOL)arg1 {
    self->_isPinnedTop = arg1;
}

- (BOOL)isFullscreen {
    return self->_isFullscreen;
}

- (void)setIsFullscreen:(BOOL)arg1 {
    self->_isFullscreen = arg1;
}

@end

// MARK: - Class [23] YTPAPIHelper
@implementation YTPAPIHelper

+ (void)fetchChannelImageWithChannelID:(id)arg1 completion:(id /* block */)arg2 {
}

@end

// MARK: - Class [24] Downloader
@implementation Downloader

- (id)init {
    self = [super init];
    return self;
}

- (void)downloadFileWithURL:(id)arg1 fileName:(id)arg2 fileSize:(NSUInteger)arg3 {
}

- (void)downloadNextChunk {
}

- (void)cancelDownload {
}

- (id)getFilePath {
    return nil;
}

- (void)URLSession:(id)arg1 downloadTask:(id)arg2 didWriteData:(NSInteger)arg3 totalBytesWritten:(NSInteger)arg4 totalBytesExpectedToWrite:(NSInteger)arg5 {
}

- (void)URLSession:(id)arg1 downloadTask:(id)arg2 didFinishDownloadingToURL:(id)arg3 {
}

- (void)URLSession:(id)arg1 task:(id)arg2 didCompleteWithError:(id)arg3 {
}

- (id)delegate {
    return self->_delegate;
}

- (void)setDelegate:(id)arg1 {
    self->_delegate = arg1;
}

@end

// MARK: - Class [25] AudioManager
@implementation AudioManager

+ (id)sharedInstance {
    static AudioManager *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (id)init {
    self = [super init];
    return self;
}

- (void)playAudio {
}

- (void)stopAudio {
}

- (void)audioPlayerDidFinishPlaying:(id)arg1 successfully:(BOOL)arg2 {
}

- (id)audioPlayer {
    return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)arg1 {
    self->_audioPlayer = arg1;
}

@end

// MARK: - Class [26] YTPDownloader
@implementation YTPDownloader

- (id)init {
    self = [super init];
    return self;
}

- (void)cancelDownload {
}

- (void)cleanup {
}

- (void)downloadFileWithURL:(id)arg1 fileName:(id)arg2 videoID:(id)arg3 fileSize:(NSUInteger)arg4 {
}

- (id)hashForFile:(id)arg1 fileSize:(NSUInteger)arg2 {
    return nil;
}

- (id)createTempDirectoryIfNeeded {
    return nil;
}

- (id)getFilePath {
    return nil;
}

- (id)getChunkMapPath {
    return nil;
}

- (void)saveChunkMap {
}

- (BOOL)loadChunkMap {
    return 0;
}

- (void)continueDownloadingForURL:(id)arg1 {
}

- (void)URLSession:(id)arg1 dataTask:(id)arg2 didReceiveData:(id)arg3 {
}

- (void)URLSession:(id)arg1 task:(id)arg2 didCompleteWithError:(id)arg3 {
}

- (id)delegate {
    return self->_delegate;
}

- (void)setDelegate:(id)arg1 {
    self->_delegate = arg1;
}

@end

// MARK: - Class [27] SbWhitelistVC
@implementation SbWhitelistVC

- (id)init {
    self = [super init];
    return self;
}

- (void)setupWhitelist {
}

- (void)loadView {
}

- (void)closeButtonTapped {
}

- (id)tableView:(id)arg1 titleForHeaderInSection:(NSInteger)arg2 {
    return nil;
}

- (void)tableView:(id)arg1 willDisplayHeaderView:(id)arg2 forSection:(NSInteger)arg3 {
}

- (id)getSortActions {
    return nil;
}

- (void)updateSortMenu {
}

- (NSInteger)numberOfSectionsInTableView:(id)arg1 {
    return 0;
}

- (NSInteger)tableView:(id)arg1 numberOfRowsInSection:(NSInteger)arg2 {
    return 0;
}

- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2 {
    return nil;
}

- (BOOL)tableView:(id)arg1 shouldHighlightRowAtIndexPath:(id)arg2 {
    return 0;
}

- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2 {
}

- (id)tableView:(id)arg1 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)arg2 {
    return nil;
}

- (void)removeChannelWithLink:(id)arg1 {
}

- (id)ytlImageWithName:(id)arg1 {
    return nil;
}

- (id)channelImage:(id)arg1 {
    return nil;
}

@end

// MARK: - Class [28] YTPTranslator
@implementation YTPTranslator

+ (void)translateText:(id)arg1 fromLanguage:(id)arg2 toLanguage:(id)arg3 completion:(id /* block */)arg4 {
}

+ (void)translateSingleText:(id)arg1 fromLanguage:(id)arg2 toLanguage:(id)arg3 completion:(id /* block */)arg4 {
}

@end

// MARK: - Class [29] TranslatorVC
@implementation TranslatorVC

- (id)initWithText:(id)arg1 {
    return nil;
}

- (void)viewDidLoad {
}

- (void)closeButtonTapped {
}

- (void)tableView:(id)arg1 willDisplayHeaderView:(id)arg2 forSection:(NSInteger)arg3 {
}

- (double)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2 {
    return 0.0;
}

- (NSInteger)numberOfSectionsInTableView:(id)arg1 {
    return 0;
}

- (NSInteger)tableView:(id)arg1 numberOfRowsInSection:(NSInteger)arg2 {
    return 0;
}

- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2 {
    return nil;
}

- (id)menuButtonWithTitle:(id)arg1 array:(id)arg2 {
    return nil;
}

- (id)systemImage:(id)arg1 withSize:(double)arg2 {
    return nil;
}

- (BOOL)isRTL {
    return 0;
}

- (void)translateText {
}

- (BOOL)tableView:(id)arg1 shouldHighlightRowAtIndexPath:(id)arg2 {
    return 0;
}

- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(id)arg2 {
}

@end

// MARK: - Class [31] DVNSheetPresenter
@implementation DVNSheetPresenter

+ (void)presentCustomHeightViewController:(id)arg1 fromViewController:(id)arg2 {
}

+ (void)presentHalfScreenViewController:(id)arg1 fromViewController:(id)arg2 {
}

+ (void)presentViewController:(id)arg1 fromViewController:(id)arg2 withHeight:(double)arg3 {
}

@end

// MARK: - Class [32] PseudoDetentController
@implementation PseudoDetentController

- (id)initWithPresentedViewController:(id)arg1 presentingViewController:(id)arg2 {
    return nil;
}

- (void)dismissController {
}

- (CGRect)frameOfPresentedViewInContainerView {
    return CGRectZero;
}

- (void)containerViewWillLayoutSubviews {
}

- (void)presentationTransitionWillBegin {
}

- (void)dismissalTransitionWillBegin {
}

- (id /* block */)heightCalculator {
    return self->_heightCalculator;
}

- (void)setHeightCalculator:(id /* block */)arg1 {
    self->_heightCalculator = arg1;
}

- (double)customHeight {
    return self->_customHeight;
}

- (void)setCustomHeight:(double)arg1 {
    self->_customHeight = arg1;
}

- (id)dimmingView {
    return self->_dimmingView;
}

- (void)setDimmingView:(id)arg1 {
    self->_dimmingView = arg1;
}

@end

// MARK: - Class [33] PseudoDetentTransitioningDelegate
@implementation PseudoDetentTransitioningDelegate

- (id)presentationControllerForPresentedViewController:(id)arg1 presentingViewController:(id)arg2 sourceViewController:(id)arg3 {
    return nil;
}

- (id /* block */)heightCalculator {
    return self->_heightCalculator;
}

- (void)setHeightCalculator:(id /* block */)arg1 {
    self->_heightCalculator = arg1;
}

- (double)customHeight {
    return self->_customHeight;
}

- (void)setCustomHeight:(double)arg1 {
    self->_customHeight = arg1;
}

@end

// MARK: - Class [34] DVNLongPressDelegate
@implementation DVNLongPressDelegate

- (BOOL)isTouchInSpeedZone:(CGPoint)arg1 {
    return 0;
}

- (BOOL)gestureRecognizer:(id)arg1 shouldReceiveTouch:(id)arg2 {
    return 0;
}

- (id)view {
    return self->_view;
}

- (void)setView:(id)arg1 {
    self->_view = arg1;
}

- (NSInteger)mode {
    return self->_mode;
}

- (void)setMode:(NSInteger)arg1 {
    self->_mode = arg1;
}

@end

// MARK: - Class [35] YTPPlayerHelper
@implementation YTPPlayerHelper

+ (id)getVideoID:(id)arg1 {
    return nil;
}

+ (void)openVideoWithID:(id)arg1 {
}

+ (void)openVideoWithID:(id)arg1 handler:(id)arg2 {
}

+ (void)openVideoWithID:(id)arg1 viewController:(id)arg2 {
}

@end

// MARK: - Class [36] FFMpegHelper
@implementation FFMpegHelper

+ (id)sharedInstance {
    static FFMpegHelper *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (id)init {
    self = [super init];
    return self;
}

- (void)statisticsCallback:(id)arg1 {
}

- (void)mergeVideo:(id)arg1 withAudio:(id)arg2 captions:(id)arg3 duration:(NSInteger)arg4 completion:(id /* block */)arg5 {
}

- (id)getCommandWithVideoURL:(id)arg1 audioURL:(id)arg2 captionsURL:(id)arg3 thumbnailURL:(id)arg4 duration:(NSInteger)arg5 outputURL:(id)arg6 {
    return nil;
}

- (void)cutAudio:(id)arg1 duration:(NSInteger)arg2 completion:(id /* block */)arg3 {
}

- (void)logCallback:(NSInteger)arg1 :(int)arg2 :(id)arg3 {
}

- (void)getCleanLog:(id)arg1 {
}

- (void)setActive {
}

- (void)updateProgressDialog {
}

- (id)codeForCaps:(id)arg1 {
    return nil;
}

@end

// MARK: - Class [37] SRTParser
@implementation SRTParser

- (id)init {
    self = [super init];
    return self;
}

- (void)parseXMLFromURL:(id)arg1 forLanguage:(id)arg2 videoID:(id)arg3 completion:(id /* block */)arg4 {
}

- (id)srtForLanguage:(id)arg1 videoID:(id)arg2 error:(NSError **)arg3 {
    return nil;
}

- (void)parseTranscriptFromURL:(id)arg1 completion:(id /* block */)arg2 {
}

- (void)parser:(id)arg1 didStartElement:(id)arg2 namespaceURI:(id)arg3 qualifiedName:(id)arg4 attributes:(id)arg5 {
}

- (void)parser:(id)arg1 foundCharacters:(id)arg2 {
}

- (void)parser:(id)arg1 didEndElement:(id)arg2 namespaceURI:(id)arg3 qualifiedName:(id)arg4 {
}

- (void)generateSRTWithText:(id)arg1 {
}

- (void)generateTranscriptWithText:(id)arg1 {
}

- (id)formatTime:(double)arg1 {
    return nil;
}

- (id)decodeHTMLСhars:(id)arg1 {
    return nil;
}

@end

// MARK: - Class [38] YTPDB
@implementation YTPDB

+ (id)thanks {
    return nil;
}

+ (id)clip {
    return nil;
}

+ (id)report {
    return nil;
}

+ (id)hype {
    return nil;
}

+ (id)stopAds {
    return nil;
}

+ (id)supportedLanguages {
    return nil;
}

+ (id)langCodeForIndex:(NSInteger)arg1 {
    return nil;
}

+ (NSUInteger)indexOfPreferredLanguage {
    return 0;
}

@end

// MARK: - Class [39] YTPSleepTimer
@implementation YTPSleepTimer

+ (id)sharedTimer {
    static YTPSleepTimer *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (id)timerQueue {
    return self->_timerQueue;
}

- (BOOL)isRunning {
    return 0;
}

- (void)showOptions:(id)arg1 {
}

- (void)showTimeSelector {
}

- (void)startForSeconds:(double)arg1 {
}

- (void)startForEndOfVideo {
}

- (void)startTimer {
}

- (void)stopWithFadeIfNeeded:(double)arg1 {
}

- (void)stopWithFadeDuration:(double)arg1 stopAfter:(double)arg2 {
}

- (void)stop {
}

- (void)cancel {
}

- (void)cancelIfPlayerClosed {
}

- (double)remainingSeconds {
    return 0.0;
}

- (double)remainingSecondsForCurrentVideo {
    return 0.0;
}

- (double)secondsForDate:(id)arg1 {
    return 0.0;
}

- (id)formattedTime:(double)arg1 {
    return nil;
}

- (id)getPlayerIfAvailable {
    return nil;
}

- (id)globalSlimBar {
    return nil;
}

- (id)playerSlimBar {
    return nil;
}

- (void)globalSlimBarVisibilityChange {
}

- (void)playerSlimBarVisibilityChange {
}

- (id)slimBarForStyle:(NSUInteger)arg1 {
    return nil;
}

- (id)barsForStyle:(NSUInteger)arg1 {
    return nil;
}

- (id)attributedTitle:(id)arg1 image:(id)arg2 {
    return nil;
}

- (void)applyTitle:(id)arg1 image:(id)arg2 color:(id)arg3 toBar:(id)arg4 {
}

- (void)attachTapHandlerToBar:(id)arg1 {
}

- (void)removeTapHandlerOnBar:(id)arg1 {
}

- (void)onSlimBarTap:(id)arg1 {
}

- (void)slimBarVisibilityChange:(NSUInteger)arg1 {
}

- (void)showSlimBarWithTitle:(id)arg1 image:(id)arg2 color:(id)arg3 style:(NSUInteger)arg4 {
}

- (void)updateSlimBarTitle:(id)arg1 style:(NSUInteger)arg2 {
}

- (void)hideSlimBarWithStyle:(NSUInteger)arg1 {
}

- (BOOL)pausePlayback {
    return 0;
}

- (void)finishTimerAndCleanup {
}

- (void)cleanup {
}

@end

// MARK: - Class [42] DVNImageViewController
@implementation DVNImageViewController

- (void)viewDidLoad {
}

- (void)setupNavbar {
}

- (void)setupViewer {
}

- (id)viewForZoomingInScrollView:(id)arg1 {
    return nil;
}

- (void)viewDidLayoutSubviews {
}

- (void)handleDoubleTap:(id)arg1 {
}

- (void)scrollViewDidZoom:(id)arg1 {
}

- (void)scrollViewDidEndZooming:(id)arg1 withView:(id)arg2 atScale:(double)arg3 {
}

- (void)scrollViewWillBeginZooming:(id)arg1 withView:(id)arg2 {
}

- (void)adjustScrollViewInsets {
}

- (void)adjustHorizontalInsetsWithImageWidth:(double)arg1 {
}

- (void)adjustVerticalInsetsWithImageHeight:(double)arg1 {
}

- (void)hapticFeedback {
}

- (void)closeButtonTapped {
}

- (void)share {
}

- (id)fullImage {
    return self->_fullImage;
}

- (void)setFullImage:(id)arg1 {
    self->_fullImage = arg1;
}

@end

// MARK: - Class [43] BlurButton
@implementation BlurButton

+ (id)createButtonWithImage:(id)arg1 target:(id)arg2 action:(SEL)arg3 menu:(id)arg4 {
    return nil;
}

- (void)setHighlighted:(BOOL)arg1 {
}

@end

// MARK: - Class [44] YTPSpeedMaster
@implementation YTPSpeedMaster

+ (id)sharedMaster {
    static YTPSpeedMaster *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

+ (id)getPlayerIfAvailable {
    return nil;
}

+ (double)currentPlaybackRate {
    return 0.0;
}

+ (double)playbackRateForPlayer:(id)arg1 {
    return 0.0;
}

+ (void)setPlaybackRate:(double)arg1 forPlayer:(id)arg2 {
}

+ (void)_applyPendingRateForPlayer:(id)arg1 {
}

- (void)manageSpeedMaster:(id)arg1 playerOverlayVC:(id)arg2 {
}

- (id)speedArray {
    return self->_speedArray;
}

- (NSInteger)nearestIndexForRate:(double)arg1 {
    return 0;
}

- (double)currentPlaybackRate {
    return 0.0;
}

- (void)setPlaybackRate:(double)arg1 {
}

@end

// MARK: - Class [46] YTLHelper
@implementation YTLHelper

+ (id)YTImageNamed:(id)arg1 {
    return nil;
}

+ (id)YTLImageNamed:(id)arg1 {
    return nil;
}

+ (BOOL)isConnectedToWiFi {
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, (const struct sockaddr *)&zeroAddress);
    if (!reachability) return NO;
    SCNetworkReachabilityFlags flags = 0;
    BOOL ok = SCNetworkReachabilityGetFlags(reachability, &flags);
    CFRelease(reachability);
    if (!ok) return NO;
    return (flags & kSCNetworkReachabilityFlagsReachable) && !(flags & kSCNetworkReachabilityFlagsIsWWAN);
}

+ (id)createYTQTMButton:(id)arg1 accessibilityLabel:(id)arg2 buttonLabel:(id)arg3 icon:(id)arg4 selector:(SEL)arg5 {
    return nil;
}

+ (id)createYTQTMButton:(id)arg1 accessibilityLabel:(id)arg2 buttonLabel:(id)arg3 icon:(id)arg4 size:(CGSize)arg5 selector:(SEL)arg6 {
    return nil;
}

+ (id)createOverlayButton:(id)arg1 accessibilityLabel:(id)arg2 buttonLabel:(id)arg3 icon:(id)arg4 selector:(SEL)arg5 {
    return nil;
}

+ (void)downloadImageFromURL:(id)arg1 download:(BOOL)arg2 {
}

+ (void)genImageFromLayer:(id)arg1 backgroundColor:(id)arg2 completionHandler:(id /* block */)arg3 {
}

+ (id)resizeImage:(id)arg1 toSize:(double)arg2 {
    return nil;
}

- (id)init {
    self = [super init];
    return self;
}

- (void)downloadVideoWithUrl:(id)arg1 audioUrl:(id)arg2 fileName:(id)arg3 format:(id)arg4 videoID:(id)arg5 videoSize:(NSUInteger)arg6 audioSize:(NSUInteger)arg7 duration:(NSUInteger)arg8 captions:(id)arg9 {
}

- (void)downloadAudioWithUrl:(id)arg1 fileName:(id)arg2 videoID:(id)arg3 audioSize:(NSUInteger)arg4 duration:(NSUInteger)arg5 {
}

- (void)downloadProgress:(float)arg1 {
}

- (void)downloadDidFinish:(id)arg1 fileName:(id)arg2 {
}

- (void)downloadDidFailureWithError:(id)arg1 {
}

- (void)saveMedia:(id)arg1 {
}

- (void)shareMedia:(id)arg1 {
}

- (void)cleanup {
}

- (void)askForAction:(id)arg1 {
}

- (id)resizeImage:(id)arg1 toSize:(double)arg2 {
    return nil;
}

- (id)imageNamed:(id)arg1 {
    return nil;
}

@end

// MARK: - Class [47] YTPSpeedPopupController
@implementation YTPSpeedPopupController

+ (id)speedController {
    return nil;
}

- (void)presentFromViewController:(id)arg1 {
}

- (void)viewDidAppear:(BOOL)arg1 {
}

- (void)viewDidLoad {
}

- (double)calculateWidth {
    return 0.0;
}

- (double)bottomConstant {
    return 0.0;
}

- (BOOL)isiPad {
    return 0;
}

- (BOOL)hasNotch {
    return 0;
}

- (void)dismiss {
}

- (void)handlePan:(id)arg1 {
}

- (BOOL)gestureRecognizer:(id)arg1 shouldReceiveTouch:(id)arg2 {
    return 0;
}

- (id)speedView {
    return self->_speedView;
}

- (void)setSpeedView:(id)arg1 {
    self->_speedView = arg1;
}

- (id)bottomConstraint {
    return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)arg1 {
    self->_bottomConstraint = arg1;
}

@end

// MARK: - Class [48] YTPSpeedControlView
@implementation YTPSpeedControlView

+ (id)speedControls {
    return nil;
}

- (id)initWithFrame:(CGRect)arg1 {
    return nil;
}

- (void)setupUI {
}

- (id)makeStepButton:(id)arg1 {
    return nil;
}

- (id)makePresetButton:(id)arg1 {
    return nil;
}

- (void)sliderChanged:(id)arg1 {
}

- (void)sliderTapped:(id)arg1 {
}

- (void)minusTapped {
}

- (void)plusTapped {
}

- (void)presetTapped:(id)arg1 {
}

- (void)updateLabel:(float)arg1 {
}

@end

// MARK: - Class [49] PlayerToast
@implementation PlayerToast

+ (id)sharedToast {
    static PlayerToast *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

- (id)init {
    self = [super init];
    return self;
}

- (void)showPlayerToastWithText:(id)arg1 value:(double)arg2 style:(NSInteger)arg3 isCompact:(BOOL)arg4 {
}

- (void)prepareForPresentation {
}

- (void)updateToastText:(id)arg1 value:(double)arg2 {
}

- (void)setProgress:(double)arg1 {
}

- (void)hideToast {
}

- (void)setupConstraints {
}

- (void)clearConstraints {
}

- (id)imgForVal:(double)arg1 {
    return nil;
}

- (id)subLabelForVal:(double)arg1 style:(NSInteger)arg2 {
    return nil;
}

- (void)setupSubForStyle:(NSInteger)arg1 {
}

- (void)setValue:(double)arg1 forEventWithStyle:(NSInteger)arg2 {
}

- (id)sourceView {
    return nil;
}

- (BOOL)isLandscape {
    return 0;
}

@end

// MARK: - Class [50] CustomHUD
@implementation CustomHUD

- (id)init {
    self = [super init];
    return self;
}

- (void)addToController {
}

- (void)removeFromController {
}

- (void)setVolumeLevel:(float)arg1 {
}

- (float)volumeLevel {
    return 0.0;
}

- (id)windowSceneForVolumeDisplay {
    return nil;
}

- (id)volumeAudioCategory {
    return nil;
}

- (id)controller {
    return self->_controller;
}

@end

