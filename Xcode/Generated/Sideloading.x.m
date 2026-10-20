// Auto-generated from Sideloading.x by scripts/logos_to_objc.py
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#ifdef __cplusplus
extern "C" void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old);
#else
extern void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old);
#endif

//
// Sideloading.x
// Reconstructed from YTLite.dylib TU 4 (0x14c1c .. 0x1ea10)
// Sideloading, LiveContainer, Keychain Access Group, Google Sign-In, iOSGuard Attestation, and Heartbeat fixes
//

#import "Headers/YTLite.h"
#import <Security/Security.h>

@implementation InitWorkaround

- (void)viewDidLoad {
    [super viewDidLoad];
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    spinner.color = [UIColor whiteColor];
    spinner.center = self.view.center;
    [self.view addSubview:spinner];
    [spinner startAnimating];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:YES completion:^{
            if (self.completion) {
                self.completion();
            }
        }];
    });
}

@end

static NSString *ytl_accessGroup(void) {
    static NSString *cachedGroup = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDictionary *query = @{
            (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
            (__bridge id)kSecAttrAccount: @"bundleSeedID",
            (__bridge id)kSecAttrService: @"",
            (__bridge id)kSecReturnAttributes: @YES
        };
        CFDictionaryRef result = NULL;
        OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, (CFTypeRef *)&result);
        if (status == errSecItemNotFound) {
            status = SecItemAdd((__bridge CFDictionaryRef)query, (CFTypeRef *)&result);
        }
        if (status == errSecSuccess && result) {
            NSDictionary *dict = (__bridge_transfer NSDictionary *)result;
            cachedGroup = [dict[(__bridge id)kSecAttrAccessGroup] copy];
        }
        if (!cachedGroup) {
            cachedGroup = @"EQHXZ8M8AV.com.google.ios.youtube";
        }
    });
    return cachedGroup;
}


static NSDictionary * (*_logos_orig$Sideloading_NSBundle_1)(id self, SEL _cmd);
static NSDictionary * _logos_method$Sideloading_NSBundle_1(id self, SEL _cmd) {
    NSDictionary *orig = _logos_orig$Sideloading_NSBundle_1(self, _cmd);
    if (self == [NSBundle mainBundle]) {
        NSMutableDictionary *dict = [orig mutableCopy];
        dict[@"CFBundleIdentifier"] = YOUTUBE_BUNDLE_ID;
        return [dict copy];
    }
    return orig;

}

static NSString * (*_logos_orig$Sideloading_NSBundle_2)(id self, SEL _cmd);
static NSString * _logos_method$Sideloading_NSBundle_2(id self, SEL _cmd) {
    NSArray *address = [NSThread callStackReturnAddresses];
    Dl_info info = {0};
    if (address.count > 1 && dladdr((void *)[address[1] longLongValue], &info) && info.dli_fname) {
        NSString *path = [NSString stringWithUTF8String:info.dli_fname];
        if ([path hasPrefix:[NSBundle mainBundle].bundlePath]) {
            return YOUTUBE_BUNDLE_ID;
        }
    }
    return _logos_orig$Sideloading_NSBundle_2(self, _cmd);

}

static id (*_logos_orig$Sideloading_NSBundle_3)(id self, SEL _cmd, NSString * key);
static id _logos_method$Sideloading_NSBundle_3(id self, SEL _cmd, NSString * key) {
    if ([key isEqualToString:@"CFBundleIdentifier"]) {
        return YOUTUBE_BUNDLE_ID;
    }
    if ([key isEqualToString:@"CFBundleDisplayName"] || [key isEqualToString:@"CFBundleName"]) {
        return @"YouTube";
    }
    return _logos_orig$Sideloading_NSBundle_3(self, _cmd, key);

}


+ (NSString *)appName { return @"YouTube"; }
+ (NSString *)appID { return YOUTUBE_BUNDLE_ID; }

+ (NSString *)appIdentifier { return YOUTUBE_BUNDLE_ID; }

+ (NSString *)shortAppName { return @"YouTube"; }

+ (NSString *)appName { return @"YouTube"; }

- (NSString *)bundleId { return YOUTUBE_BUNDLE_ID; }

+ (BOOL)isFAS { return YES; }

+ (BOOL)isFromAppStore { return YES; }


static id (*_logos_orig$Sideloading_SSOConfiguration_4)(id self, SEL _cmd, id clientID, id services);
static id _logos_method$Sideloading_SSOConfiguration_4(id self, SEL _cmd, id clientID, id services) {
    self = _logos_orig$Sideloading_SSOConfiguration_4(self, _cmd, clientID, services);
    if (self) {
        [self setValue:@"YouTube" forKey:@"_shortAppName"];
        [self setValue:YOUTUBE_BUNDLE_ID forKey:@"_applicationIdentifier"];
    }
    return self;

}


+ (NSString *)accessGroup { return ytl_accessGroup(); }
+ (NSString *)sharedAccessGroup { return ytl_accessGroup(); }

+ (NSString *)accessGroup { return ytl_accessGroup(); }
+ (NSString *)sharedAccessGroup { return ytl_accessGroup(); }

+ (NSString *)sharedAccessGroup { return ytl_accessGroup(); }

+ (NSString *)keychainAccessGroup { return ytl_accessGroup(); }


static NSURL * (*_logos_orig$Sideloading_NSFileManager_5)(id self, SEL _cmd, NSString * groupIdentifier);
static NSURL * _logos_method$Sideloading_NSFileManager_5(id self, SEL _cmd, NSString * groupIdentifier) {
    NSURL *orig = _logos_orig$Sideloading_NSFileManager_5(self, _cmd, groupIdentifier);
    if (orig) return orig;
    NSURL *docs = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    return [docs URLByAppendingPathComponent:@"AppGroup"];

}



static void (*_logos_orig$Sideloading_SFAuthenticationViewController_6)(id self, SEL _cmd, BOOL animated);
static void _logos_method$Sideloading_SFAuthenticationViewController_6(id self, SEL _cmd, BOOL animated) {
    _logos_orig$Sideloading_SFAuthenticationViewController_6(self, _cmd, animated);
    if ([self respondsToSelector:@selector(remoteViewControllerWillDismiss:)]) {
        InitWorkaround *vc = [[InitWorkaround alloc] init];
        __weak typeof(self) weakSelf = self;
        [vc setCompletion:^{
            [weakSelf performSelector:@selector(remoteViewControllerWillDismiss:) withObject:nil];
        }];
        [self presentViewController:vc animated:NO completion:nil];
    }

}



static void (*_logos_orig$Sideloading_YTInlineSignInController_7)(id self, SEL _cmd);
static void _logos_method$Sideloading_YTInlineSignInController_7(id self, SEL _cmd) {
    _logos_orig$Sideloading_YTInlineSignInController_7(self, _cmd);

}



static void (*_logos_orig$Sideloading_YTFirstTimeSignInViewController_8)(id self, SEL _cmd, BOOL animated);
static void _logos_method$Sideloading_YTFirstTimeSignInViewController_8(id self, SEL _cmd, BOOL animated) {
    _logos_orig$Sideloading_YTFirstTimeSignInViewController_8(self, _cmd, animated);

}

static void (*_logos_orig$Sideloading_YTFirstTimeSignInViewController_9)(id self, SEL _cmd, BOOL animated);
static void _logos_method$Sideloading_YTFirstTimeSignInViewController_9(id self, SEL _cmd, BOOL animated) {
    _logos_orig$Sideloading_YTFirstTimeSignInViewController_9(self, _cmd, animated);
    YTAlertView *alert = [objc_getClass("YTAlertView") dialog];
    [alert setTitle:@"YouTube Plus"];
    [alert setSubtitle:LOC(@"LoginInfo")];
    [alert addTitle:LOC(@"OK") withAction:nil];
    [alert show];

}



static void (*_logos_orig$Sideloading_YTInlineSignInViewController_10)(id self, SEL _cmd, BOOL animated);
static void _logos_method$Sideloading_YTInlineSignInViewController_10(id self, SEL _cmd, BOOL animated) {
    _logos_orig$Sideloading_YTInlineSignInViewController_10(self, _cmd, animated);
    YTAlertView *alert = [objc_getClass("YTAlertView") dialog];
    [alert setTitle:@"YouTube Plus"];
    [alert setSubtitle:LOC(@"LoginInfo")];
    [alert addTitle:LOC(@"OK") withAction:nil];
    [alert show];

}



static id (*_logos_orig$Sideloading_NSMutableURLRequest_11)(id self, SEL _cmd);
static id _logos_method$Sideloading_NSMutableURLRequest_11(id self, SEL _cmd) {
    NSMutableDictionary *dict = [_logos_orig$Sideloading_NSMutableURLRequest_11(self, _cmd) mutableCopy];
    NSString *actualBundleId = [NSBundle mainBundle].bundleIdentifier;
    if (actualBundleId && dict[@"X-MMe-Client-Info"]) {
        dict[@"X-MMe-Client-Info"] = [dict[@"X-MMe-Client-Info"] stringByReplacingOccurrencesOfString:actualBundleId withString:YOUTUBE_BUNDLE_ID];
    }
    return [dict copy];

}

static NSDictionary * (*_logos_orig$Sideloading_NSMutableURLRequest_12)(id self, SEL _cmd);
static NSDictionary * _logos_method$Sideloading_NSMutableURLRequest_12(id self, SEL _cmd) {
    NSMutableDictionary *dict = [_logos_orig$Sideloading_NSMutableURLRequest_12(self, _cmd) mutableCopy];
    NSString *actualBundleId = [NSBundle mainBundle].bundleIdentifier;
    if (actualBundleId && dict[@"User-Agent"]) {
        dict[@"User-Agent"] = [dict[@"User-Agent"] stringByReplacingOccurrencesOfString:actualBundleId withString:YOUTUBE_BUNDLE_ID];
    }
    return [dict copy];

}


- (NSString *)teamID { return YOUTUBE_TEAM_ID; }
- (NSString *)appIDPrefix { return YOUTUBE_TEAM_ID; }
static NSString * (*_logos_orig$Sideloading_LSApplicationProxy_13)(id self, SEL _cmd);
static NSString * _logos_method$Sideloading_LSApplicationProxy_13(id self, SEL _cmd) {
    NSString *orig = _logos_orig$Sideloading_LSApplicationProxy_13(self, _cmd);
    NSString *actualBundleId = [NSBundle mainBundle].bundleIdentifier;
    if (orig && actualBundleId) {
        return [orig stringByReplacingOccurrencesOfString:actualBundleId withString:YOUTUBE_BUNDLE_ID];
    }
    return @"EQHXZ8M8AV.com.google.ios.youtube";

}

static NSString * (*_logos_orig$Sideloading_LSBundleProxy_14)(id self, SEL _cmd);
static NSString * _logos_method$Sideloading_LSBundleProxy_14(id self, SEL _cmd) {
    NSString *orig = _logos_orig$Sideloading_LSBundleProxy_14(self, _cmd);
    NSString *actualBundleId = [NSBundle mainBundle].bundleIdentifier;
    if (orig && actualBundleId) {
        return [orig stringByReplacingOccurrencesOfString:actualBundleId withString:YOUTUBE_BUNDLE_ID];
    }
    return YOUTUBE_BUNDLE_ID;

}

// Playback attestation & heartbeat fixes for sideloaded / LiveContainer installs
- (BOOL)iosguardEnable { return NO; }
- (BOOL)hasIosguardEnable { return NO; }

- (BOOL)requiresAttestation { return NO; }
- (BOOL)hasRequiresAttestation { return NO; }

- (BOOL)heartbeatPolicyErrorIsNonFatal { return YES; }
- (BOOL)hasHeartbeatPolicyErrorIsNonFatal { return YES; }
- (BOOL)requestIosguardDataAfterPlaybackStarts { return NO; }
- (BOOL)hasRequestIosguardDataAfterPlaybackStarts { return NO; }

- (BOOL)stopHeartbeat { return NO; }
- (BOOL)hasStopHeartbeat { return NO; }
- (BOOL)authenticationMismatch { return NO; }
- (BOOL)hasAuthenticationMismatch { return NO; }

- (void)haltIfNeeded {}

- (void)haltPlaybackWithError:(id)error forHeartbeatController:(id)controller {}

- (NSInteger)lastKnownPermissionsStatus { return 2; }
- (BOOL)isAuthorized { return YES; }
- (BOOL)localNetworkPermissionCheckRequired { return NO; }

__attribute__((constructor)) static void _logosLocalInit_Sideloading(void) {
    MSHookMessageEx(objc_getClass("NSBundle"), @selector(infoDictionary), (IMP)&_logos_method$Sideloading_NSBundle_1, (IMP *)&_logos_orig$Sideloading_NSBundle_1);
    MSHookMessageEx(objc_getClass("NSBundle"), @selector(bundleIdentifier), (IMP)&_logos_method$Sideloading_NSBundle_2, (IMP *)&_logos_orig$Sideloading_NSBundle_2);
    MSHookMessageEx(objc_getClass("NSBundle"), @selector(objectForInfoDictionaryKey:), (IMP)&_logos_method$Sideloading_NSBundle_3, (IMP *)&_logos_orig$Sideloading_NSBundle_3);
    MSHookMessageEx(objc_getClass("SSOConfiguration"), @selector(initWithClientID:supportedAccountServices:), (IMP)&_logos_method$Sideloading_SSOConfiguration_4, (IMP *)&_logos_orig$Sideloading_SSOConfiguration_4);
    MSHookMessageEx(objc_getClass("NSFileManager"), @selector(containerURLForSecurityApplicationGroupIdentifier:), (IMP)&_logos_method$Sideloading_NSFileManager_5, (IMP *)&_logos_orig$Sideloading_NSFileManager_5);
    MSHookMessageEx(objc_getClass("SFAuthenticationViewController"), @selector(viewDidAppear:), (IMP)&_logos_method$Sideloading_SFAuthenticationViewController_6, (IMP *)&_logos_orig$Sideloading_SFAuthenticationViewController_6);
    MSHookMessageEx(objc_getClass("YTInlineSignInController"), @selector(didTapShowAddAccount), (IMP)&_logos_method$Sideloading_YTInlineSignInController_7, (IMP *)&_logos_orig$Sideloading_YTInlineSignInController_7);
    MSHookMessageEx(objc_getClass("YTFirstTimeSignInViewController"), @selector(viewDidAppear:), (IMP)&_logos_method$Sideloading_YTFirstTimeSignInViewController_8, (IMP *)&_logos_orig$Sideloading_YTFirstTimeSignInViewController_8);
    MSHookMessageEx(objc_getClass("YTFirstTimeSignInViewController"), @selector(viewDidDisappear:), (IMP)&_logos_method$Sideloading_YTFirstTimeSignInViewController_9, (IMP *)&_logos_orig$Sideloading_YTFirstTimeSignInViewController_9);
    MSHookMessageEx(objc_getClass("YTInlineSignInViewController"), @selector(viewDidDisappear:), (IMP)&_logos_method$Sideloading_YTInlineSignInViewController_10, (IMP *)&_logos_orig$Sideloading_YTInlineSignInViewController_10);
    MSHookMessageEx(object_getClass(objc_getClass("NSMutableURLRequest")), @selector(ak_clientInfoHeader), (IMP)&_logos_method$Sideloading_NSMutableURLRequest_11, (IMP *)&_logos_orig$Sideloading_NSMutableURLRequest_11);
    MSHookMessageEx(objc_getClass("NSMutableURLRequest"), @selector(allHTTPHeaderFields), (IMP)&_logos_method$Sideloading_NSMutableURLRequest_12, (IMP *)&_logos_orig$Sideloading_NSMutableURLRequest_12);
    MSHookMessageEx(objc_getClass("LSApplicationProxy"), @selector(applicationIdentifier), (IMP)&_logos_method$Sideloading_LSApplicationProxy_13, (IMP *)&_logos_orig$Sideloading_LSApplicationProxy_13);
    MSHookMessageEx(objc_getClass("LSBundleProxy"), @selector(bundleIdentifier), (IMP)&_logos_method$Sideloading_LSBundleProxy_14, (IMP *)&_logos_orig$Sideloading_LSBundleProxy_14);
}
