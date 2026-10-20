// Auto-generated from Settings.x by scripts/logos_to_objc.py
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#ifdef __cplusplus
extern "C" void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old);
#else
extern void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old);
#endif

//
// Settings.x
// Reconstructed from YTLite.dylib TU 3 (0x11698 .. 0x14c1c)
// Injects YouTube Plus (YTLite) Settings section & SplitView/FlatView support into YouTube Settings
//

#import "Headers/YTLite.h"

static const NSInteger kYTLiteSettingsCategory = 516;


static void (*_logos_orig$Settings_YTCollectionViewController_1)(id self, SEL _cmd, UICollectionView * collectionView, NSIndexPath * indexPath);
static void _logos_method$Settings_YTCollectionViewController_1(id self, SEL _cmd, UICollectionView * collectionView, NSIndexPath * indexPath) {
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
    _logos_orig$Settings_YTCollectionViewController_1(self, _cmd, collectionView, indexPath);

}



static void (*_logos_orig$Settings_YTQTMButton_2)(id self, SEL _cmd);
static void _logos_method$Settings_YTQTMButton_2(id self, SEL _cmd) {
    _logos_orig$Settings_YTQTMButton_2(self, _cmd);
    if ([self.accessibilityIdentifier isEqualToString:@"id.ui.browse.back.button"]) {
        [self setTintColor:[UIColor labelColor]];
        if ([self respondsToSelector:@selector(setEnablePageStyling:)]) {
            [self setEnablePageStyling:NO];
        }
    }

}



static NSArray * (*_logos_orig$Settings_YTAppSettingsPresentationData_3)(id self, SEL _cmd);
static NSArray * _logos_method$Settings_YTAppSettingsPresentationData_3(id self, SEL _cmd) {
    NSArray *orig = _logos_orig$Settings_YTAppSettingsPresentationData_3(self, _cmd);
    NSMutableArray *mutableOrder = [orig mutableCopy];
    NSUInteger idx = [mutableOrder indexOfObject:@(1)];
    if (idx != NSNotFound) {
        [mutableOrder insertObject:@(kYTLiteSettingsCategory) atIndex:idx];
    } else {
        [mutableOrder insertObject:@(kYTLiteSettingsCategory) atIndex:0];
    }
    return [mutableOrder copy];

}



static void (*_logos_orig$Settings_YTSettingsSectionController_4)(id self, SEL _cmd, NSUInteger selectedItem);
static void _logos_method$Settings_YTSettingsSectionController_4(id self, SEL _cmd, NSUInteger selectedItem) {
    NSLog(@"DVN --- setSelectedItem: %ld", (long)selectedItem);
    _logos_orig$Settings_YTSettingsSectionController_4(self, _cmd, selectedItem);

}



static void _logos_method$Settings_YTSettingsSectionItemManager_5(id self, SEL _cmd, id entry) {
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

static void (*_logos_orig$Settings_YTSettingsSectionItemManager_6)(id self, SEL _cmd, NSUInteger category, id entry);
static void _logos_method$Settings_YTSettingsSectionItemManager_6(id self, SEL _cmd, NSUInteger category, id entry) {
    if (category == kYTLiteSettingsCategory) {
        [self updateYTLiteSectionWithEntry:entry];
        return;
    }
    _logos_orig$Settings_YTSettingsSectionItemManager_6(self, _cmd, category, entry);

}


__attribute__((constructor)) static void _logosLocalInit_Settings(void) {
    MSHookMessageEx(objc_getClass("YTCollectionViewController"), @selector(collectionView:didSelectItemAtIndexPath:), (IMP)&_logos_method$Settings_YTCollectionViewController_1, (IMP *)&_logos_orig$Settings_YTCollectionViewController_1);
    MSHookMessageEx(objc_getClass("YTQTMButton"), @selector(layoutSubviews), (IMP)&_logos_method$Settings_YTQTMButton_2, (IMP *)&_logos_orig$Settings_YTQTMButton_2);
    MSHookMessageEx(object_getClass(objc_getClass("YTAppSettingsPresentationData")), @selector(settingsCategoryOrder), (IMP)&_logos_method$Settings_YTAppSettingsPresentationData_3, (IMP *)&_logos_orig$Settings_YTAppSettingsPresentationData_3);
    MSHookMessageEx(objc_getClass("YTSettingsSectionController"), @selector(setSelectedItem:), (IMP)&_logos_method$Settings_YTSettingsSectionController_4, (IMP *)&_logos_orig$Settings_YTSettingsSectionController_4);
    class_addMethod(objc_getClass("YTSettingsSectionItemManager"), @selector(updateYTLiteSectionWithEntry:), (IMP)&_logos_method$Settings_YTSettingsSectionItemManager_5, "@@:");
    MSHookMessageEx(objc_getClass("YTSettingsSectionItemManager"), @selector(updateSectionForCategory:withEntry:), (IMP)&_logos_method$Settings_YTSettingsSectionItemManager_6, (IMP *)&_logos_orig$Settings_YTSettingsSectionItemManager_6);
}
