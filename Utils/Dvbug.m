//
// Dvbug.m
// Reconstructed from YTLite.dylib Class [45] Dvbug (0x22739c .. 0x22a000)
// Safe Objective-C runtime ivar introspection and mutation helpers
//

#import "../Headers/YTLite.h"

@implementation Dvbug

+ (id)instanceForObject:(id)obj name:(NSString *)name {
    if (!obj || name.length == 0) {
        NSLog(@"DVN --- senderObject (%@) or name (%@) is nil", obj, name);
        return nil;
    }
    Ivar ivar = class_getInstanceVariable([obj class], [name UTF8String]);
    if (!ivar) return nil;
    return [obj valueForKey:name];
}

+ (void)observeIvar:(id)obj name:(NSString *)name {
    @try {
        Ivar ivar = class_getInstanceVariable([obj class], [name UTF8String]);
        if (!ivar) {
            NSLog(@"DVN --- ivar %@ not found in class %@", name, NSStringFromClass([obj class]));
            return;
        }
        id val = object_getIvar(obj, ivar);
        NSLog(@"DVN --- %@: %@", name, val ?: @"(null)");
    } @catch (NSException *e) {
        NSLog(@"DVN --- Error accessing ivar %@: %@", name, e);
    }
}

+ (id)getObservedIvar:(id)obj name:(NSString *)name {
    @try {
        Ivar ivar = class_getInstanceVariable([obj class], [name UTF8String]);
        if (!ivar) return nil;
        return object_getIvar(obj, ivar);
    } @catch (NSException *e) {
        NSLog(@"DVN --- error accessing ivar %@: %@, Stack: %@", name, e.reason, e.callStackSymbols);
        return nil;
    }
}

+ (void)setObservedIvar:(id)obj name:(NSString *)name value:(id)value {
    @try {
        Ivar ivar = class_getInstanceVariable([obj class], [name UTF8String]);
        if (ivar) object_setIvar(obj, ivar, value);
    } @catch (NSException *e) {
        NSLog(@"DVN --- error setting ivar %@: %@, Stack: %@", name, e.reason, e.callStackSymbols);
    }
}

+ (NSInteger)getObservedIntIvar:(id)obj name:(NSString *)name {
    @try {
        Ivar ivar = class_getInstanceVariable([obj class], [name UTF8String]);
        if (!ivar) return 0;
        return *(NSInteger *)((__bridge void *)obj + ivar_getOffset(ivar));
    } @catch (NSException *e) {
        return 0;
    }
}

+ (NSInteger)getObservedIvarLongLong:(id)obj name:(NSString *)name {
    return [self getObservedIntIvar:obj name:name];
}

+ (BOOL)getObservedBoolIvar:(id)obj name:(NSString *)name {
    @try {
        Ivar ivar = class_getInstanceVariable([obj class], [name UTF8String]);
        if (!ivar) return NO;
        return *(BOOL *)((__bridge void *)obj + ivar_getOffset(ivar));
    } @catch (NSException *e) {
        return NO;
    }
}

+ (void)setObservedBoolIvar:(id)obj name:(NSString *)name value:(BOOL)value {
    @try {
        Ivar ivar = class_getInstanceVariable([obj class], [name UTF8String]);
        if (ivar) *(BOOL *)((__bridge void *)obj + ivar_getOffset(ivar)) = value;
    } @catch (NSException *e) {
        NSLog(@"DVN --- error setting BOOL ivar %@: %@", name, e.reason);
    }
}

@end
