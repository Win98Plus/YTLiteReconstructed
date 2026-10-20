//
// Settings.x
// Reconstructed from YTLite.dylib TU 3 (0x11698 .. 0x14c1c)
// Injects YouTube Plus (YTLite) Settings section & SplitView/FlatView support into YouTube Settings
//

#import "Headers/YTLite.h"

static const NSInteger kYTLiteSettingsCategory = 516;

%hook YTCollectionViewController

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self respondsToSelector:@selector(sectionControllers)]) {
        NSArray *sections = [self valueForKey:@"sectionControllers"];
        if (indexPath.section < (NSInteger)sections.count) {
            id secCtrl = sections[indexPath.section];
            if ([secCtrl respondsToSelector:@selector(items)]) {
                NSArray *items = [secCtrl valueForKey:@"items"];
                if (indexPath.row < (NSInteger)items.count) {
                    id item = items[indexPath.row];
                    if ([item respondsToSelector:@selector(categoryId)]) {
                        NSInteger catId = [[item valueForKey:@"categoryId"] integerValue];
                        if (catId == kYTLiteSettingsCategory) {
                            YTPSettingsBuilder *builder = [[YTPSettingsBuilder alloc] init];
                            DVNTableModel *model = [builder rootTable];
                            DVNTableViewController *vc = [[DVNTableViewController alloc] initWithModel:model defaults:[YTLUserDefaults standardUserDefaults]];
                            [builder setPresenter:vc];

                            UIViewController *parentVC = self.parentViewController;
                            Class splitCls = objc_getClass("YTWrapperSplitViewController");
                            Class flatCls = objc_getClass("YTWrapperFlatViewController");
                            if (splitCls && [parentVC isKindOfClass:splitCls] && flatCls) {
                                id wrapper = [[flatCls alloc] initWithParentResponder:parentVC];
                                [wrapper setValue:@"YouTube Plus" forKey:@"title"];
                                [wrapper setValue:vc forKey:@"content"];
                                [parentVC setValue:wrapper forKey:@"secondViewController"];
                                id headerVC = [wrapper valueForKey:@"headerViewController"];
                                if ([headerVC respondsToSelector:@selector(updateHeaderWithButtonsToDisplay:)]) {
                                    [headerVC updateHeaderWithButtonsToDisplay:@0];
                                }
                            } else {
                                [vc addDismissButton:NO];
                                [self.navigationController pushViewController:vc animated:YES];
                            }
                            return;
                        }
                    }
                }
            }
        }
    }
    %orig;
}

%end

%hook YTQTMButton

- (void)layoutSubviews {
    %orig;
    if ([self.accessibilityIdentifier isEqualToString:@"id.ui.browse.back.button"]) {
        [self setTintColor:[UIColor labelColor]];
        if ([self respondsToSelector:@selector(setEnablePageStyling:)]) {
            [self setEnablePageStyling:NO];
        }
    }
}

%end

%hook YTAppSettingsPresentationData

+ (NSArray *)settingsCategoryOrder {
    NSArray *orig = %orig;
    NSMutableArray *mutableOrder = [orig mutableCopy];
    NSUInteger idx = [mutableOrder indexOfObject:@(1)];
    if (idx != NSNotFound) {
        [mutableOrder insertObject:@(kYTLiteSettingsCategory) atIndex:idx];
    } else {
        [mutableOrder insertObject:@(kYTLiteSettingsCategory) atIndex:0];
    }
    return [mutableOrder copy];
}

%end

%hook YTSettingsSectionController

- (void)setSelectedItem:(NSUInteger)selectedItem {
    NSLog(@"DVN --- setSelectedItem: %ld", (long)selectedItem);
    %orig;
}

%end

%hook YTSettingsSectionItemManager

%new
- (void)updateYTLiteSectionWithEntry:(id)entry {
    id delegate = [self valueForKey:@"_settingsViewControllerDelegate"];
    Class iconCls = objc_getClass("YTIIcon");
    id icon = [iconCls new];
    if ([icon respondsToSelector:@selector(setIconType:)]) {
        [icon setIconType:112];
    }
    if ([delegate respondsToSelector:@selector(setSectionItems:forCategory:title:icon:titleDescription:headerHidden:)]) {
        [delegate setSectionItems:@[] forCategory:kYTLiteSettingsCategory title:@"YouTube Plus" icon:icon titleDescription:nil headerHidden:NO];
    } else if ([delegate respondsToSelector:@selector(setSectionItems:forCategory:title:titleDescription:headerHidden:)]) {
        [delegate setSectionItems:@[] forCategory:kYTLiteSettingsCategory title:@"YouTube Plus" titleDescription:nil headerHidden:NO];
    }
}

- (void)updateSectionForCategory:(NSUInteger)category withEntry:(id)entry {
    if (category == kYTLiteSettingsCategory) {
        [self updateYTLiteSectionWithEntry:entry];
        return;
    }
    %orig;
}

%end
