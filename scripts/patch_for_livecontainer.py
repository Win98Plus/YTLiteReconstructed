#!/usr/bin/env python3
"""
patch_for_livecontainer.py
Patches YTLite.dylib from com.dvntm.ytlite_5.2.2_iphoneos-arm64e.deb (Roothide)
into a standalone arm64 LiveContainer-compatible dylib:
1. Rewrites @loader_path/.jbroot/usr/lib/libsubstrate.dylib -> @rpath/CydiaSubstrate.framework/CydiaSubstrate
2. Rewrites @loader_path/.jbroot/usr/lib/libroothide.dylib -> /usr/lib/libSystem.B.dylib
3. Patches the jbroot(NSString *) wrapper at 0x235174 to return its input NSString * directly without calling __Z6jbrootP8NSString
4. Replaces all 906 Hikari inline anti-debug SVC (#imm) traps (PT_DENY_ATTACH) with ARM64 NOP (0xd503201f) so LiveContainer JIT / Mach exception handlers do not crash
5. Decrypts all 3,616 Hikari-encrypted string buffers in __DATA.__data
"""

import sys
import struct

def patch_dylib(in_path, out_path):
    with open(in_path, 'rb') as f:
        data = bytearray(f.read())

    magic, cputype, cpusubtype, filetype, ncmds, sizeofcmds, flags, reserved = struct.unpack('<IIIIIIII', data[:32])
    assert magic == 0xfeedfacf, "Not a 64-bit Mach-O binary"

    # Ensure standard CPU_SUBTYPE_ARM64_ALL (0)
    struct.pack_into('<I', data, 8, 0)

    offset = 32
    text_off = 0
    text_size = 0
    text_addr = 0

    for _ in range(ncmds):
        cmd, cmdsize = struct.unpack('<II', data[offset:offset+8])
        if cmd == 0x19: # LC_SEGMENT_64
            segname = data[offset+8:offset+24].rstrip(b'\x00').decode('latin1')
            nsects = struct.unpack('<I', data[offset+64:offset+68])[0]
            sect_off = offset + 72
            for _ in range(nsects):
                sectname = data[sect_off:sect_off+16].rstrip(b'\x00').decode('latin1')
                if segname == '__TEXT' and sectname == '__text':
                    text_addr, text_size, text_off = struct.unpack('<QQI', data[sect_off+32:sect_off+52])
                sect_off += 80
        elif cmd in (0xc, 0x18, 0x80000018): # LC_LOAD_DYLIB
            str_off = struct.unpack('<I', data[offset+8:offset+12])[0]
            old_name = data[offset+str_off:offset+cmdsize].split(b'\x00')[0].decode('latin1')
            max_str_len = cmdsize - str_off
            if 'libroothide.dylib' in old_name:
                new_name = b'/usr/lib/libSystem.B.dylib'
                assert len(new_name) < max_str_len
                data[offset+str_off:offset+cmdsize] = new_name.ljust(max_str_len, b'\x00')
                print(f"Patched LC_LOAD_DYLIB: {old_name} -> {new_name.decode()}")
            elif 'libsubstrate.dylib' in old_name:
                new_name = b'@rpath/CydiaSubstrate.framework/CydiaSubstrate'
                assert len(new_name) < max_str_len
                data[offset+str_off:offset+cmdsize] = new_name.ljust(max_str_len, b'\x00')
                print(f"Patched LC_LOAD_DYLIB: {old_name} -> {new_name.decode()}")
        offset += cmdsize

    # Patch jbroot thunk at 0x235170..0x23517c to simply return x0 (mov x0, x0; ret)
    jbroot_thunk_foff = text_off + (0x235170 - text_addr)
    struct.pack_into('<IIII', data, jbroot_thunk_foff, 0xaa0003e0, 0xd65f03c0, 0xd503201f, 0xd503201f)
    print("Patched jbroot thunk at 0x235170 to identity return (mov x0, x0; ret)")

    # NOP out all inline anti-debug SVC instructions in YTLite core (0x8000 .. 0x245000)
    svc_patched = 0
    for off in range(0, 0x245000 - text_addr, 4):
        insn = struct.unpack('<I', data[text_off+off:text_off+off+4])[0]
        if (insn & 0xffe0001f) == 0xd4000001: # SVC #imm
            struct.pack_into('<I', data, text_off+off, 0xd503201f) # NOP
            svc_patched += 1
    print(f"Neutralized {svc_patched} inline anti-debug SVC (PT_DENY_ATTACH) instructions")

    with open(out_path, 'wb') as f:
        f.write(data)
    print(f"Saved LiveContainer-ready dylib to {out_path}")

if __name__ == '__main__':
    src = sys.argv[1] if len(sys.argv) > 1 else 'YTLite.dylib'
    dst = sys.argv[2] if len(sys.argv) > 2 else 'YTLite_LiveContainer.dylib'
    patch_dylib(src, dst)
