//
// YTLite.h
// Master Header for YTLite (YouTube Plus) v5.2.2
// Reconstructed from com.dvntm.ytlite_5.2.2_iphoneos-arm64e.deb
//

#ifndef YTLITE_H
#define YTLITE_H

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <dlfcn.h>
#import <sys/utsname.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import <SystemConfiguration/SystemConfiguration.h>

#import "YouTubeHeaders.h"
#import "YTLiteClasses.h"
#import "MobileFFmpeg/MobileFFmpegHeaders.h"

#define TWEAK_VERSION_STRING @"5.2.2"
#define YTLITE_SUITE_NAME @"com.dvntm.ytlite"
#define YTPLUS_BUNDLE_ID @"com.dvntm.ytplus"
#define YOUTUBE_BUNDLE_ID @"com.google.ios.youtube"
#define YOUTUBE_TEAM_ID @"EQHXZ8M8AV"

static inline BOOL YTLBool(NSString *key) {
    return [[YTLUserDefaults standardUserDefaults] boolForKey:key];
}

static inline NSInteger YTLInt(NSString *key) {
    return [[YTLUserDefaults standardUserDefaults] integerForKey:key];
}

static inline float YTLFloat(NSString *key) {
    return [[YTLUserDefaults standardUserDefaults] floatForKey:key];
}

static inline NSString *LOC(NSString *key) {
    return [key ytl_localized];
}

#endif /* YTLITE_H */
