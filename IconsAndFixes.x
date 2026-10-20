//
// IconsAndFixes.x
// Reconstructed from YTLite.dylib TU 2 (0xbff0 .. 0x11698)
// Custom icon replacements, sleep timer icon hook, miniplayer corner radius, and version fixes
//

#import "Headers/YTLite.h"

%hook YTIIcon

- (NSInteger)iconType {
    return %orig;
}

%end

%hook QTMIcon

+ (UIImage *)imageWithName:(NSString *)name color:(UIColor *)color {
    if ([name isEqualToString:@"youtube_outline/moon_z_24pt"]) {
        return [[NSBundle ytl_defaultBundle] imageWithName:@"moon" tintColor:color];
    }
    return %orig;
}

%end

%hook YTELMResourceLoader

- (UIImage *)imageWithName:(NSString *)name color:(UIColor *)color bundleId:(NSString *)bundleId {
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
    return %orig;
}

%end

%hook YTWatchFloatingMiniplayerWithControlsOverlayView

- (void)layoutSubviews {
    %orig;
    self.layer.cornerRadius = 12.0;
    self.layer.masksToBounds = YES;
}

%end

%hook YTVersionUtils

+ (NSString *)appVersion {
    NSString *ver = %orig;
    if ([ver isEqualToString:@"20.21.6"]) {
        return @"20.21.6";
    }
    return ver;
}

%end

%hook YTSettingsCell

- (void)setDetailText:(NSString *)detailText {
    if ([detailText isEqualToString:@"20.21.6"]) {
        NSString *realVer = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
        if (realVer) detailText = realVer;
    }
    %orig(detailText);
}

%end

%hook ELMTouchCommandPropertiesHandler

- (void)handleTap {
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
    %orig;
}

%end
