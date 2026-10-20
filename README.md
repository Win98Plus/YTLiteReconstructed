# YouTube Plus (ex. YTLite)

A flexible enhancer for YouTube on iOS, featuring over hundred customizable options. The original source code project based on [YTLite](https://github.com/dayanch96/YTLite).

## Overview

The source code work covers the following areas:

- Objective-C classes, categories and Logos hooks.
- Decoded strings protected by Hikari Obfuscator.
- Removed identified anti-debugging instructions from the analysed binary.
- Reconstructed the source files according to their functions.
- Added build support for Theos and Xcode.
- Included technical reports to help review the code.

The source files are organised by feature where possible. The original binary's layout and function offsets are recorded in the technical reports.

## Source layout

The source code is divided into the following files and directories.

| Path | Binary offsets | Contents |
|---|---|---|
| `DiscordRPC.x` | `0x8000–0xbff0` | Discord Rich Presence, including playback status, playback position and related controls. |
| `IconsAndFixes.x` | `0xbff0–0x11698` | Shorts and Moon icons, miniplayer corner rounding, sleep timer support and version text updates. |
| `Settings.x` | `0x11698–0x14c1c` | Adds the YTLite settings section and supports the iPad split-view interface. |
| `Sideloading.x` | `0x14c1c–0x1ea10` | Changes related to Google sign-in, app identity, keychain access and selected app integrity checks in sideloading environments. |
| `SponsorBlock.x` | `0x1ea10–0x268dc` | SponsorBlock playback controls and coloured markers on the video progress bar. |
| `YTLite.x` | `0x4c9e0–0xf054c` | Core features, including ad blocking, background playback, OLED interface options, playback speed controls, player gestures, Shorts customisation and tab bar changes. |
| `YTNativeShare.x` | `0xf054c–0xf1000` | Replaces the original share action sheet with a native iOS activity view. |
| `Headers/` | `0xf1000–0x23f874` | Reconstructed headers, class definitions and related declarations. |
| `Utils/` | `0xf1000–0x23f874` | Supporting Objective-C code, including logic for locating `YTLite.bundle`. |
| `LiveContainer_Ready/` | Patched binary | Contains the prepared `YTLite.dylib` and `YTLite.bundle` files. |
| `YTLite.xcodeproj/` | Xcode project | Project files for building the tweak with Xcode. |
| `Xcode/` | Build support | Logos build script and Substrate fallback implementation. |

## Features

### Core YouTube features

The reconstructed `YTLite.x` contains hooks related to:

- Ad blocking.
- Background playback.
- OLED interface options.
- Playback speed controls.
- Swipe gestures for volume, brightness and seeking.
- Shorts customisation.
- Tab bar changes.

### SponsorBlock

`SponsorBlock.x` contains code related to:

- Skipping marked sponsor segments during playback.
- Displaying coloured segment markers on the video progress bar.

### Discord Rich Presence

`DiscordRPC.x` contains hooks related to playback status, playback position and Discord Rich Presence controls.

### App settings and interface changes

`Settings.x` adds the YTLite settings section to YouTube's settings interface and includes support for the iPad split-view layout.

`IconsAndFixes.x` contains icon changes and selected interface fixes, including miniplayer corner rounding and sleep timer support.

### Sideloading support

`Sideloading.x` contains changes related to Google sign-in, app identity and selected app integrity checks. These hooks were from the analysed binary and may depend on the YouTube version and loading environment.

### Native sharing

`YTNativeShare.x` replaces the original YouTube share action sheet with the native iOS activity view.

### Mach-O structure

The binary uses the 64-bit ARM Mach-O format and includes chained fixups using `DYLD_CHAINED_PTR_64`.

The analysis identified imported symbols, function stubs and static initialisers, which helped establish the binary's layout.

### Objective-C metadata

The reconstructed source includes 58 Objective-C classes, 3 categories and 463 `%hook` and `%new` methods across 180 YouTube classes.

These results provide a basis for examining how YTLite interacts with YouTube's internal classes and methods.

## Build from source

The repository includes build support for Theos and Xcode.

### Requirements

- Theos and its required build tools.
- An appropriate iOS SDK.
- A supported ARM64 build environment.
- Xcode for the Xcode project build.
- Python 3 for the supplied Python scripts.

### Build with Theos

Use the command that matches your target environment.

**Rootless package**

```sh
make package ROOTLESS=1
```

**RootHide package**

```sh
make package ROOTHIDE=1
```

**LiveContainer build**

```sh
make LIVECONTAINER=1
```

The resulting files depend on the build configuration and the settings in the Makefile.

### Build with Xcode

1. Open `YTLite.xcodeproj`.
2. Select the `YTLite` scheme.
3. Select `Any iOS Device` with the ARM64 target where supported.
4. Build the project with `Cmd + B`.

The project includes `Xcode/build_logos.sh`, `scripts/logos_to_objc.py` and `Xcode/SubstrateFallback.m` to support the Xcode build process.

Review the project settings, SDK configuration and required dependencies if the build fails.

## Compatibility

The reconstructed code uses internal YouTube classes and methods. These may change between YouTube releases, so compatibility is not guaranteed.

The project provides source code and build configurations, but a successful build does not by itself confirm that every feature works as expected. Test the resulting build in the intended environment before relying on it.

## Credits

- **Original project:** [dayanch96/YTLite](https://github.com/dayanch96/YTLite)

This repository is an independent project based on the original YTLite binary. Credit for the original project belongs to its author.

## Disclaimer

This project is not affiliated with or endorsed by Google, YouTube or the original YTLite author.

It is provided for research, code review and educational purposes. The recovered source code and build files are provided without a guarantee of compatibility, correctness or continued support.
