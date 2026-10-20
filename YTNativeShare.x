//
// YTNativeShare.x
// Reconstructed from YTLite.dylib TU 10 (0xf054c)
// Replaces YouTube custom share sheet with native iOS UIActivityViewController
//

#import "Headers/YTLite.h"

%hook ELMPBShowActionSheetCommand

- (void)executeWithCommandContext:(id)context handler:(id)handler {
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
                    UIViewController *topVC = [%c(YTUIUtils) topViewControllerForPresenting];
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
    %orig;
}

%end
