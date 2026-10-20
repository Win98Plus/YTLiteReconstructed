//
// NSBundle+YTLite.m
// Reconstructed from YTLite.dylib (0x234154 .. 0x234de4)
// Supports LiveContainer (@loader_path/YTLite.bundle), Sideloaded (mainBundle), Rootless, Roothide (jbroot), and Rootful
//

#import "../Headers/YTLite.h"
#import <dlfcn.h>

typedef NSString *(*jbroot_func_t)(NSString *);

NSString *jbroot(NSString *path) {
    static jbroot_func_t dyn_jbroot = NULL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dyn_jbroot = (jbroot_func_t)dlsym(RTLD_DEFAULT, "_Z6jbrootP8NSString");
        if (!dyn_jbroot) {
            dyn_jbroot = (jbroot_func_t)dlsym(RTLD_DEFAULT, "jbroot");
        }
    });
    if (dyn_jbroot) {
        return dyn_jbroot(path);
    }
    if ([[NSFileManager defaultManager] fileExistsAtPath:[@"/var/jb" stringByAppendingPathComponent:path]]) {
        return [@"/var/jb" stringByAppendingPathComponent:path];
    }
    return path;
}

static NSString *ytl_dylibDirectory(void) {
    Dl_info info = {0};
    if (dladdr((const void *)&ytl_dylibDirectory, &info) && info.dli_fname) {
        NSString *dylibPath = [NSString stringWithUTF8String:info.dli_fname];
        return [dylibPath stringByDeletingLastPathComponent];
    }
    return nil;
}

@implementation NSBundle (YTLite)

+ (NSBundle *)ytl_defaultBundle {
    static NSBundle *bundle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSFileManager *fm = [NSFileManager defaultManager];
        NSString *tweakBundlePath = [[NSBundle mainBundle] pathForResource:@"YTLite" ofType:@"bundle"];
        NSString *dylibDir = ytl_dylibDirectory();
        NSString *liveContainerBundlePath1 = dylibDir ? [dylibDir stringByAppendingPathComponent:@"YTLite.bundle"] : nil;
        NSString *liveContainerBundlePath2 = dylibDir ? [dylibDir stringByAppendingPathComponent:@"Application Support/YTLite.bundle"] : nil;
        NSString *roothideBundlePath = jbroot(@"/Library/Application Support/YTLite.bundle");

        NSArray<NSString *> *candidates = @[
            tweakBundlePath ?: @"",
            liveContainerBundlePath1 ?: @"",
            liveContainerBundlePath2 ?: @"",
            roothideBundlePath ?: @"",
            @"/var/jb/Library/Application Support/YTLite.bundle",
            @"/Library/Application Support/YTLite.bundle"
        ];

        for (NSString *candidate in candidates) {
            if (candidate.length > 0 && [fm fileExistsAtPath:candidate]) {
                bundle = [NSBundle bundleWithPath:candidate];
                if (bundle) break;
            }
        }

        if (!bundle) {
            bundle = [NSBundle mainBundle];
            Class alertCls = NSClassFromString(@"YTAlertView");
            if (alertCls && [alertCls respondsToSelector:@selector(infoDialog)]) {
                YTAlertView *alertView = [alertCls infoDialog];
                [alertView setTitle:@"Warning"];
                [alertView setSubtitle:@"Resource files for YouTube Plus not found. YouTube might not function correctly."];
                [alertView show];
            }
        }
    });
    return bundle;
}

- (UIImage *)imageWithName:(NSString *)name {
    UIImage *img = [UIImage imageNamed:name inBundle:self compatibleWithTraitCollection:nil];
    return [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

- (UIImage *)originalImageWithName:(NSString *)name {
    return [UIImage imageNamed:name inBundle:self compatibleWithTraitCollection:nil];
}

- (UIImage *)imageWithName:(NSString *)name tintColor:(UIColor *)tintColor {
    UIImage *img = [self imageWithName:name];
    if (tintColor) {
        img = [[img imageWithTintColor:tintColor] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    img.accessibilityIdentifier = [NSString stringWithFormat:@"ytp_%@_image", name];
    return img;
}

@end

@implementation NSString (YTL)

- (NSString *)ytl_localized {
    NSBundle *bundle = [NSBundle ytl_defaultBundle];
    NSString *localized = [bundle localizedStringForKey:self value:@"" table:nil];
    return localized.length > 0 ? localized : self;
}

@end

@implementation UIViewController (DVNPatreonContext)

- (ASPresentationAnchor)presentationAnchorForWebAuthenticationSession:(ASWebAuthenticationSession *)session {
    return self.view.window;
}

@end
