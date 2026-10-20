// Auto-generated from IconsAndFixes.x by scripts/logos_to_objc.py
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#ifdef __cplusplus
extern "C" void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old);
#else
extern void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old);
#endif

//
// IconsAndFixes.x
// Reconstructed from YTLite.dylib TU 2 (0xbff0 .. 0x11698)
// Custom icon replacements, sleep timer icon hook, miniplayer corner radius, and version fixes
//

#import "Headers/YTLite.h"


static NSInteger (*_logos_orig$IconsAndFixes_YTIIcon_1)(id self, SEL _cmd);
static NSInteger _logos_method$IconsAndFixes_YTIIcon_1(id self, SEL _cmd) {
    return _logos_orig$IconsAndFixes_YTIIcon_1(self, _cmd);

}



static UIImage * (*_logos_orig$IconsAndFixes_QTMIcon_2)(id self, SEL _cmd, NSString * name, UIColor * color);
static UIImage * _logos_method$IconsAndFixes_QTMIcon_2(id self, SEL _cmd, NSString * name, UIColor * color) {
    if ([name isEqualToString:@"youtube_outline/moon_z_24pt"]) {
        return [[NSBundle ytl_defaultBundle] imageWithName:@"moon" tintColor:color];
    }
    return _logos_orig$IconsAndFixes_QTMIcon_2(self, _cmd, name, color);

}



static UIImage * (*_logos_orig$IconsAndFixes_YTELMResourceLoader_3)(id self, SEL _cmd, NSString * name, UIColor * color, NSString * bundleId);
static UIImage * _logos_method$IconsAndFixes_YTELMResourceLoader_3(id self, SEL _cmd, NSString * name, UIColor * color, NSString * bundleId) {
    if ([name isEqualToString:@"ic_shorts_like_outline_32dp"] ||
        [name isEqualToString:@"ic_shorts_dislike_outline_32dp"] ||
        [name isEqualToString:@"ic_shorts_comment_outline_32dp"] ||
        [name isEqualToString:@"ic_shorts_share_outline_32dp"] ||
        [name isEqualToString:@"ic_shorts_remix_outline_32dp"] ||
        [name isEqualToString:@"ic_shorts_thumb_up_filled_style_c"] ||
        [name isEqualToString:@"ic_shorts_thumb_down_filled_style_c"] ||
        [name isEqualToString:@"ic_shorts_thumb_up_colored_style_c"] ||
        [name isEqualToString:@"ic_shorts_thumb_down_colored_style_c"] ||
        [name isEqualToString:@"ic_shorts_comment_filled_style_c"] ||
        [name isEqualToString:@"ic_shorts_share_filled_style_c"] ||
        [name isEqualToString:@"ic_remix_filled"] ||
        [name isEqualToString:@"youtube_shorts_24"] ||
        [name isEqualToString:@"youtube_shorts_24_cairo"]) {
        UIImage *customImg = [[NSBundle ytl_defaultBundle] imageWithName:name tintColor:color];
        if (customImg) return customImg;
    }
    return _logos_orig$IconsAndFixes_YTELMResourceLoader_3(self, _cmd, name, color, bundleId);

}



static void (*_logos_orig$IconsAndFixes_YTWatchFloatingMiniplayerWithControlsOverlayView_4)(id self, SEL _cmd);
static void _logos_method$IconsAndFixes_YTWatchFloatingMiniplayerWithControlsOverlayView_4(id self, SEL _cmd) {
    _logos_orig$IconsAndFixes_YTWatchFloatingMiniplayerWithControlsOverlayView_4(self, _cmd);
    self.layer.cornerRadius = 12.0;
    self.layer.masksToBounds = YES;

}



static NSString * (*_logos_orig$IconsAndFixes_YTVersionUtils_5)(id self, SEL _cmd);
static NSString * _logos_method$IconsAndFixes_YTVersionUtils_5(id self, SEL _cmd) {
    NSString *ver = _logos_orig$IconsAndFixes_YTVersionUtils_5(self, _cmd);
    if ([ver isEqualToString:@"20.21.6"]) {
        return @"20.21.6";
    }
    return ver;

}



static void (*_logos_orig$IconsAndFixes_YTSettingsCell_6)(id self, SEL _cmd, NSString * detailText);
static void _logos_method$IconsAndFixes_YTSettingsCell_6(id self, SEL _cmd, NSString * detailText) {
    if ([detailText isEqualToString:@"20.21.6"]) {
        NSString *realVer = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
        if (realVer) detailText = realVer;
    }
    _logos_orig$IconsAndFixes_YTSettingsCell_6(self, _cmd, detailText);

}



static void (*_logos_orig$IconsAndFixes_ELMTouchCommandPropertiesHandler_7)(id self, SEL _cmd);
static void _logos_method$IconsAndFixes_ELMTouchCommandPropertiesHandler_7(id self, SEL _cmd) {
    Ivar ctrlIvar = class_getInstanceVariable([self class], "_controller");
    if (ctrlIvar) {
        id controller = [self valueForKey:@"_controller"];
        id node = [controller valueForKey:@"node"];
        NSString *accId = [node valueForKey:@"_accessibilityIdentifier"];
        if ([accId hasPrefix:@"id.elements.components.overflow_menu_item_"]) {
            NSArray *subnodes = [node valueForKey:@"subnodes"];
            for (id sub in subnodes) {
                if ([[sub valueForKey:@"_accessibilityIdentifier"] isEqualToString:@"ytp_moon_image"]) {
                    [[YTPSleepTimer sharedTimer] showOptions:nil];
                    return;
                }
            }
        }
    }
    _logos_orig$IconsAndFixes_ELMTouchCommandPropertiesHandler_7(self, _cmd);

}


__attribute__((constructor)) static void _logosLocalInit_IconsAndFixes(void) {
    MSHookMessageEx(objc_getClass("YTIIcon"), @selector(iconType), (IMP)&_logos_method$IconsAndFixes_YTIIcon_1, (IMP *)&_logos_orig$IconsAndFixes_YTIIcon_1);
    MSHookMessageEx(object_getClass(objc_getClass("QTMIcon")), @selector(imageWithName:color:), (IMP)&_logos_method$IconsAndFixes_QTMIcon_2, (IMP *)&_logos_orig$IconsAndFixes_QTMIcon_2);
    MSHookMessageEx(objc_getClass("YTELMResourceLoader"), @selector(imageWithName:color:bundleId:), (IMP)&_logos_method$IconsAndFixes_YTELMResourceLoader_3, (IMP *)&_logos_orig$IconsAndFixes_YTELMResourceLoader_3);
    MSHookMessageEx(objc_getClass("YTWatchFloatingMiniplayerWithControlsOverlayView"), @selector(layoutSubviews), (IMP)&_logos_method$IconsAndFixes_YTWatchFloatingMiniplayerWithControlsOverlayView_4, (IMP *)&_logos_orig$IconsAndFixes_YTWatchFloatingMiniplayerWithControlsOverlayView_4);
    MSHookMessageEx(object_getClass(objc_getClass("YTVersionUtils")), @selector(appVersion), (IMP)&_logos_method$IconsAndFixes_YTVersionUtils_5, (IMP *)&_logos_orig$IconsAndFixes_YTVersionUtils_5);
    MSHookMessageEx(objc_getClass("YTSettingsCell"), @selector(setDetailText:), (IMP)&_logos_method$IconsAndFixes_YTSettingsCell_6, (IMP *)&_logos_orig$IconsAndFixes_YTSettingsCell_6);
    MSHookMessageEx(objc_getClass("ELMTouchCommandPropertiesHandler"), @selector(handleTap), (IMP)&_logos_method$IconsAndFixes_ELMTouchCommandPropertiesHandler_7, (IMP *)&_logos_orig$IconsAndFixes_ELMTouchCommandPropertiesHandler_7);
}
