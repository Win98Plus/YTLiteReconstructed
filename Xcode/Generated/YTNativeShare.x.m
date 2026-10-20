// Auto-generated from YTNativeShare.x by scripts/logos_to_objc.py
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
#ifdef __cplusplus
extern "C" void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old);
#else
extern void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old);
#endif

//
// YTNativeShare.x
// Reconstructed from YTLite.dylib TU 10 (0xf054c)
// Replaces YouTube custom share sheet with native iOS UIActivityViewController
//

#import "Headers/YTLite.h"


static void (*_logos_orig$YTNativeShare_ELMPBShowActionSheetCommand_1)(id self, SEL _cmd, id context, id handler);
static void _logos_method$YTNativeShare_ELMPBShowActionSheetCommand_1(id self, SEL _cmd, id context, id handler) {
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:YTLITE_SUITE_NAME];
    if ([defaults boolForKey:@"nativeShare"]) {
        NSString *desc = [self description];
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"serialized_share_entity: \"([^\"]+)\"" options:0 error:nil];
        NSTextCheckingResult *match = [regex firstMatchInString:desc options:0 range:NSMakeRange(0, desc.length)];
        if (match && match.numberOfRanges > 1) {
            NSString *encoded = [desc substringWithRange:[match rangeAtIndex:1]];
            NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:[encoded stringByReplacingOccurrencesOfString:@"%3D" withString:@"="] options:0];
            NSString *decodedStr = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
            if (decodedStr.length > 0) {
                NSURL *shareURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://youtu.be/%@", decodedStr]];
                if (shareURL) {
                    UIViewController *topVC = [objc_getClass("YTUIUtils") topViewControllerForPresenting];
                    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[shareURL] applicationActivities:nil];
                    if ([context respondsToSelector:@selector(fromView)]) {
                        UIView *fromView = [context valueForKey:@"fromView"];
                        activityVC.popoverPresentationController.sourceView = fromView ?: topVC.view;
                    }
                    [topVC presentViewController:activityVC animated:YES completion:nil];
                    return;
                }
            }
        }
    }
    _logos_orig$YTNativeShare_ELMPBShowActionSheetCommand_1(self, _cmd, context, handler);

}


__attribute__((constructor)) static void _logosLocalInit_YTNativeShare(void) {
    MSHookMessageEx(objc_getClass("ELMPBShowActionSheetCommand"), @selector(executeWithCommandContext:handler:), (IMP)&_logos_method$YTNativeShare_ELMPBShowActionSheetCommand_1, (IMP *)&_logos_orig$YTNativeShare_ELMPBShowActionSheetCommand_1);
}
