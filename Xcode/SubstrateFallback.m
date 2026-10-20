//
// SubstrateFallback.m
// Dynamic resolver for MSHookMessageEx: uses CydiaSubstrate / ElleKit / libsubstrate if loaded,
// and falls back to Objective-C runtime method swizzling in pure jailed / Xcode environments.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <dlfcn.h>

typedef void (*MSHookMessageEx_func_t)(Class _class, SEL message, IMP hook, IMP *old);

void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old) {
    if (!_class || !message || !hook) return;
    static MSHookMessageEx_func_t real_MSHookMessageEx = NULL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        const char *libs[] = {
            "@rpath/CydiaSubstrate.framework/CydiaSubstrate",
            "/usr/lib/libsubstrate.dylib",
            "/var/jb/usr/lib/libsubstrate.dylib",
            "/var/jb/usr/lib/libellekit.dylib",
            NULL
        };
        for (int i = 0; libs[i] != NULL; i++) {
            void *handle = dlopen(libs[i], RTLD_LAZY | RTLD_NOLOAD);
            if (!handle) handle = dlopen(libs[i], RTLD_LAZY);
            if (handle) {
                void *sym = dlsym(handle, "MSHookMessageEx");
                if (sym && sym != (void *)&MSHookMessageEx) {
                    real_MSHookMessageEx = (MSHookMessageEx_func_t)sym;
                    break;
                }
            }
        }
    });

    if (real_MSHookMessageEx && real_MSHookMessageEx != &MSHookMessageEx) {
        real_MSHookMessageEx(_class, message, hook, old);
        return;
    }

    // Pure Objective-C runtime fallback (LiveContainer / Jailed / Xcode)
    Method method = class_getInstanceMethod(_class, message);
    if (method) {
        IMP origImp = method_getImplementation(method);
        if (old) *old = origImp;
        const char *types = method_getTypeEncoding(method);
        if (!class_addMethod(_class, message, hook, types)) {
            method_setImplementation(method, hook);
        }
    } else if (old) {
        *old = NULL;
    }
}
