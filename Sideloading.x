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

%hook NSBundle

- (NSDictionary *)infoDictionary {
    NSDictionary *orig = %orig;
    if (self == [NSBundle mainBundle]) {
        NSMutableDictionary *dict = [orig mutableCopy];
        dict[@"CFBundleIdentifier"] = YOUTUBE_BUNDLE_ID;
        return [dict copy];
    }
    return orig;
}

- (NSString *)bundleIdentifier {
    NSArray *address = [NSThread callStackReturnAddresses];
    Dl_info info = {0};
    if (address.count > 1 && dladdr((void *)[address[1] longLongValue], &info) && info.dli_fname) {
        NSString *path = [NSString stringWithUTF8String:info.dli_fname];
        if ([path hasPrefix:[NSBundle mainBundle].bundlePath]) {
            return YOUTUBE_BUNDLE_ID;
        }
    }
    return %orig;
}

- (id)objectForInfoDictionaryKey:(NSString *)key {
    if ([key isEqualToString:@"CFBundleIdentifier"]) {
        return YOUTUBE_BUNDLE_ID;
    }
    if ([key isEqualToString:@"CFBundleDisplayName"] || [key isEqualToString:@"CFBundleName"]) {
        return @"YouTube";
    }
    return %orig;
}

%end

%hook YTVersionUtils
+ (NSString *)appName { return @"YouTube"; }
+ (NSString *)appID { return YOUTUBE_BUNDLE_ID; }
%end

%hook GCKBUtils
+ (NSString *)appIdentifier { return YOUTUBE_BUNDLE_ID; }
%end

%hook OGLBundle
+ (NSString *)shortAppName { return @"YouTube"; }
%end

%hook GVROverlayView
+ (NSString *)appName { return @"YouTube"; }
%end

%hook OGLPhenotypeFlagServiceImpl
- (NSString *)bundleId { return YOUTUBE_BUNDLE_ID; }
%end

%hook APMAEU
+ (BOOL)isFAS { return YES; }
%end

%hook GULAppEnvironmentUtil
+ (BOOL)isFromAppStore { return YES; }
%end

%hook SSOConfiguration

- (id)initWithClientID:(id)clientID supportedAccountServices:(id)services {
    self = %orig;
    if (self) {
        [self setValue:@"YouTube" forKey:@"_shortAppName"];
        [self setValue:YOUTUBE_BUNDLE_ID forKey:@"_applicationIdentifier"];
    }
    return self;
}

%end

%hook SSOKeychainHelper
+ (NSString *)accessGroup { return ytl_accessGroup(); }
+ (NSString *)sharedAccessGroup { return ytl_accessGroup(); }
%end

%hook SSOKeychainCore
+ (NSString *)accessGroup { return ytl_accessGroup(); }
+ (NSString *)sharedAccessGroup { return ytl_accessGroup(); }
%end

%hook SSOFolsomKeychainUtils
+ (NSString *)sharedAccessGroup { return ytl_accessGroup(); }
%end

%hook GNPEncryptionConfiguration
+ (NSString *)keychainAccessGroup { return ytl_accessGroup(); }
%end

%hook NSFileManager

- (NSURL *)containerURLForSecurityApplicationGroupIdentifier:(NSString *)groupIdentifier {
    NSURL *orig = %orig;
    if (orig) return orig;
    NSURL *docs = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    return [docs URLByAppendingPathComponent:@"AppGroup"];
}

%end

%hook SFAuthenticationViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig;
    if ([self respondsToSelector:@selector(remoteViewControllerWillDismiss:)]) {
        InitWorkaround *vc = [[InitWorkaround alloc] init];
        __weak typeof(self) weakSelf = self;
        [vc setCompletion:^{
            [weakSelf performSelector:@selector(remoteViewControllerWillDismiss:) withObject:nil];
        }];
        [self presentViewController:vc animated:NO completion:nil];
    }
}

%end

%hook YTInlineSignInController

- (void)didTapShowAddAccount {
    %orig;
}

%end

%hook YTFirstTimeSignInViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig;
}

- (void)viewDidDisappear:(BOOL)animated {
    %orig;
    YTAlertView *alert = [%c(YTAlertView) dialog];
    [alert setTitle:@"YouTube Plus"];
    [alert setSubtitle:LOC(@"LoginInfo")];
    [alert addTitle:LOC(@"OK") withAction:nil];
    [alert show];
}

%end

%hook YTInlineSignInViewController

- (void)viewDidDisappear:(BOOL)animated {
    %orig;
    YTAlertView *alert = [%c(YTAlertView) dialog];
    [alert setTitle:@"YouTube Plus"];
    [alert setSubtitle:LOC(@"LoginInfo")];
    [alert addTitle:LOC(@"OK") withAction:nil];
    [alert show];
}

%end

%hook NSMutableURLRequest

+ (id)ak_clientInfoHeader {
    NSMutableDictionary *dict = [%orig mutableCopy];
    NSString *actualBundleId = [NSBundle mainBundle].bundleIdentifier;
    if (actualBundleId && dict[@"X-MMe-Client-Info"]) {
        dict[@"X-MMe-Client-Info"] = [dict[@"X-MMe-Client-Info"] stringByReplacingOccurrencesOfString:actualBundleId withString:YOUTUBE_BUNDLE_ID];
    }
    return [dict copy];
}

- (NSDictionary *)allHTTPHeaderFields {
    NSMutableDictionary *dict = [%orig mutableCopy];
    NSString *actualBundleId = [NSBundle mainBundle].bundleIdentifier;
    if (actualBundleId && dict[@"User-Agent"]) {
        dict[@"User-Agent"] = [dict[@"User-Agent"] stringByReplacingOccurrencesOfString:actualBundleId withString:YOUTUBE_BUNDLE_ID];
    }
    return [dict copy];
}

%end

%hook LSApplicationProxy
- (NSString *)teamID { return YOUTUBE_TEAM_ID; }
- (NSString *)appIDPrefix { return YOUTUBE_TEAM_ID; }
- (NSString *)applicationIdentifier {
    NSString *orig = %orig;
    NSString *actualBundleId = [NSBundle mainBundle].bundleIdentifier;
    if (orig && actualBundleId) {
        return [orig stringByReplacingOccurrencesOfString:actualBundleId withString:YOUTUBE_BUNDLE_ID];
    }
    return @"EQHXZ8M8AV.com.google.ios.youtube";
}
%end

%hook LSBundleProxy
- (NSString *)bundleIdentifier {
    NSString *orig = %orig;
    NSString *actualBundleId = [NSBundle mainBundle].bundleIdentifier;
    if (orig && actualBundleId) {
        return [orig stringByReplacingOccurrencesOfString:actualBundleId withString:YOUTUBE_BUNDLE_ID];
    }
    return YOUTUBE_BUNDLE_ID;
}
%end

// Playback attestation & heartbeat fixes for sideloaded / LiveContainer installs
%hook YTIIosPlayerAttestationConfig
- (BOOL)iosguardEnable { return NO; }
- (BOOL)hasIosguardEnable { return NO; }
%end

%hook YTIHeartbeatAttestationConfig
- (BOOL)requiresAttestation { return NO; }
- (BOOL)hasRequiresAttestation { return NO; }
%end

%hook YTIIosPlayerConfig
- (BOOL)heartbeatPolicyErrorIsNonFatal { return YES; }
- (BOOL)hasHeartbeatPolicyErrorIsNonFatal { return YES; }
- (BOOL)requestIosguardDataAfterPlaybackStarts { return NO; }
- (BOOL)hasRequestIosguardDataAfterPlaybackStarts { return NO; }
%end

%hook YTIHeartbeatResponse
- (BOOL)stopHeartbeat { return NO; }
- (BOOL)hasStopHeartbeat { return NO; }
- (BOOL)authenticationMismatch { return NO; }
- (BOOL)hasAuthenticationMismatch { return NO; }
%end

%hook YTSingleVideoHeartbeatController
- (void)haltIfNeeded {}
%end

%hook YTPlaybackHeartbeatController
- (void)haltPlaybackWithError:(id)error forHeartbeatController:(id)controller {}
%end

%hook MDXLocalNetworkPermissions
- (NSInteger)lastKnownPermissionsStatus { return 2; }
- (BOOL)isAuthorized { return YES; }
- (BOOL)localNetworkPermissionCheckRequired { return NO; }
%end
