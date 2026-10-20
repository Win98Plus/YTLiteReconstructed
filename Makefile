ifeq ($(ROOTLESS),1)
    THEOS_PACKAGE_SCHEME = rootless
    ARCHS = arm64
else ifeq ($(ROOTHIDE),1)
    THEOS_PACKAGE_SCHEME = roothide
    ARCHS = arm64e
else ifeq ($(LIVECONTAINER),1)
    ARCHS = arm64
else
    ARCHS = arm64
endif

DEBUG = 0
FINALPACKAGE = 1
PACKAGE_VERSION = 5.2.2
TARGET := iphone:clang:16.5:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = YTLite

$(TWEAK_NAME)_FILES = DiscordRPC.x IconsAndFixes.x Settings.x Sideloading.x SponsorBlock.x YTNativeShare.x YTLite.x $(wildcard Utils/*.m)
$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation CoreFoundation CoreGraphics QuartzCore AVFoundation AVKit Photos PhotosUI AudioToolbox VideoToolbox CoreMedia CoreVideo MediaPlayer Security SystemConfiguration AuthenticationServices WebKit UniformTypeIdentifiers CoreServices
$(TWEAK_NAME)_LIBRARIES = z bz2 iconv c++
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -IHeaders -DTWEAK_VERSION=\"$(PACKAGE_VERSION)\"

ifeq ($(LIVECONTAINER),1)
    $(TWEAK_NAME)_CFLAGS += -DLIVECONTAINER=1
    $(TWEAK_NAME)_LDFLAGS += -Wl,-rpath,@executable_path/Frameworks -Wl,-rpath,@loader_path
endif

include $(THEOS_MAKE_PATH)/tweak.mk

after-stage::
	@find $(THEOS_STAGING_DIR) -name ".DS_Store" -delete
