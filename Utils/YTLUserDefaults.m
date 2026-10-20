//
// YTLUserDefaults.m
// Reconstructed from YTLite.dylib Class [30] YTLUserDefaults (0x1e60cc .. 0x1eea00)
//

#import "../Headers/YTLite.h"
#import <Security/Security.h>

@implementation YTLUserDefaults

+ (instancetype)standardUserDefaults {
    static YTLUserDefaults *defaults = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaults = [[self alloc] initWithSuiteName:YTLITE_SUITE_NAME];
        [defaults registerDefaults];
    });
    return defaults;
}

- (void)reset {
    [self removePersistentDomainForName:YTLITE_SUITE_NAME];
    [self registerDefaults];
}

+ (void)resetUserDefaults {
    [[self standardUserDefaults] reset];
}

- (void)registerDefaults {
    NSDictionary *defaults = @{
        @"noAds": @YES,
        @"backgroundPlayback": @YES,
        @"downloadManager": @YES,
        @"sponsorBlock": @YES,
        @"sbNotifications": @YES,
        @"sbSkippedDuration": @3.0,
        @"sbSkipDuration": @0.0,
        @"sponsor": @1,
        @"selfpromo": @1,
        @"interaction": @1,
        @"intro": @0,
        @"outro": @0,
        @"preview": @0,
        @"music_offtopic": @0,
        @"filler": @0,
        @"poi_highlight": @0,
        @"seekSensitivity": @1.0,
        @"gestWideness": @0.3,
        @"rcSkipForwardSec": @10.0,
        @"rcSkipBackwardSec": @10.0,
        @"activeTabs": @[@"FEwhat_to_watch", @"FEshorts", @"FEuploads", @"FEsubscriptions", @"FElibrary"]
    };
    [self registerDefaults:defaults];
}

- (UIColor *)colorForSegment:(NSString *)segment {
    NSDictionary<NSString *, UIColor *> *colors = @{
        @"sponsor": [UIColor colorWithRed:0.0 green:0.83 blue:0.0 alpha:1.0],
        @"selfpromo": [UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:1.0],
        @"interaction": [UIColor colorWithRed:0.8 green:0.0 blue:1.0 alpha:1.0],
        @"intro": [UIColor colorWithRed:0.0 green:1.0 blue:1.0 alpha:1.0],
        @"outro": [UIColor colorWithRed:0.01 green:0.01 blue:0.95 alpha:1.0],
        @"preview": [UIColor colorWithRed:0.0 green:0.56 blue:0.65 alpha:1.0],
        @"music_offtopic": [UIColor colorWithRed:1.0 green:0.6 blue:0.0 alpha:1.0],
        @"filler": [UIColor colorWithRed:0.45 green:0.2 blue:1.0 alpha:1.0],
        @"poi_highlight": [UIColor colorWithRed:1.0 green:0.09 blue:0.52 alpha:1.0],
        @"mainProgress": [UIColor redColor],
        @"gradientProgress": [UIColor redColor],
        @"scrubberColor": [UIColor redColor]
    };
    return colors[segment] ?: [UIColor redColor];
}

- (NSString *)sbPrivateUserID {
    NSString *existing = [self stringForKey:@"sbPrivateUserID"];
    if (existing.length >= 32) return existing;
    NSString *alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    NSMutableString *result = [NSMutableString stringWithCapacity:36];
    uint8_t randomBytes[36];
    if (SecRandomCopyBytes(kSecRandomDefault, sizeof(randomBytes), randomBytes) == errSecSuccess) {
        for (int i = 0; i < 36; i++) {
            unichar c = [alphabet characterAtIndex:(randomBytes[i] % alphabet.length)];
            [result appendFormat:@"%c", c];
        }
        [self setObject:result forKey:@"sbPrivateUserID"];
        return result;
    }
    return @"";
}

- (NSString *)sbPublicUserID:(NSString *)privateID {
    if (privateID.length == 0) return @"";
    NSData *data = [privateID dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(data.bytes, (CC_LONG)data.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}

+ (void)importYtlSettings:(id)completion {
    [[self standardUserDefaults] presentDocumentPicker:completion];
}

- (void)presentDocumentPicker:(id)completion {
    self->_completion = [completion copy];
}

+ (BOOL)exportYtlSettings:(UIView *)sourceView {
    NSDictionary *dict = [[self standardUserDefaults] dictionaryRepresentation];
    NSString *tempPath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"YTLite_Settings.plist"];
    return [dict writeToFile:tempPath atomically:YES];
}

+ (BOOL)writeYtlSettingsToFile:(NSString *)path {
    NSDictionary *dict = [[self standardUserDefaults] dictionaryRepresentation];
    return [dict writeToFile:path atomically:YES];
}

+ (BOOL)importSettingsFromPlist:(NSString *)path {
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    if (!dict) return NO;
    YTLUserDefaults *defs = [self standardUserDefaults];
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [defs setObject:obj forKey:key];
    }];
    return [defs synchronize];
}

+ (void)importSettingsWithPicker:(id)completion {}
+ (void)exportSettingsWithPicker:(UIView *)sourceView {}
+ (id)decodeLegacyObjectWithData:(NSData *)data {
    return [NSKeyedUnarchiver unarchivedObjectOfClass:[NSObject class] fromData:data error:nil];
}
+ (id)filteredDictionary {
    return [[self standardUserDefaults] dictionaryRepresentation];
}
+ (void)migrateLegacyKeys {}

- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentsAtURLs:(NSArray<NSURL *> *)urls {
    NSURL *url = urls.firstObject;
    if (!url) return;
    NSData *data = [NSData dataWithContentsOfURL:url options:0 error:nil];
    if (!data) return;
    NSDictionary *plist = [NSPropertyListSerialization propertyListWithData:data options:0 format:NULL error:nil];
    if ([plist isKindOfClass:[NSDictionary class]]) {
        [plist enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [self setObject:obj forKey:key];
        }];
        [self synchronize];
    }
}

- (void)documentPickerWasCancelled:(UIDocumentPickerViewController *)controller {}
- (id)completion { return _completion; }
- (void)setCompletion:(id)completion { _completion = [completion copy]; }

@end
