#!/usr/bin/env python3
"""
logos_to_objc.py
Standalone Logos (.x) to Objective-C (.m) preprocessor for Xcode builds when Theos is not installed.
Translates %hook, %end, %new, %property, %orig, and %c(ClassName) into standard Objective-C runtime
MSHookMessageEx / class_addMethod / objc_getAssociatedObject / objc_setAssociatedObject calls!
"""

import sys
import re

def convert_logos(src_text, unit_name):
    # Replace %c(ClassName) with objc_getClass("ClassName")
    src_text = re.sub(r'%c\((\w+)\)', r'objc_getClass("\1")', src_text)

    out_lines = [
        f"// Auto-generated from {unit_name}.x by scripts/logos_to_objc.py",
        "#import <Foundation/Foundation.h>",
        "#import <objc/runtime.h>",
        "#import <objc/message.h>",
        "#ifdef __cplusplus",
        'extern "C" void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old);',
        "#else",
        "extern void MSHookMessageEx(Class _class, SEL message, IMP hook, IMP *old);",
        "#endif",
        ""
    ]

    ctors = []
    cur_class = None
    in_method = False
    cur_method = None
    brace_depth = 0
    method_idx = 0

    lines = src_text.splitlines()
    i = 0
    while i < len(lines):
        line = lines[i]
        stripped = line.strip()

        m_hook = re.match(r'^%hook\s+(\w+)', stripped)
        if m_hook:
            cur_class = m_hook.group(1)
            i += 1
            continue

        if stripped == '%end':
            cur_class = None
            i += 1
            continue

        if cur_class:
            m_prop = re.match(r'^%property\s*\([^)]*\)\s*([\w\s\*]+?)\s*(\w+)\s*;', stripped)
            if m_prop:
                ptype, pname = m_prop.groups()
                ptype = ptype.strip()
                cap_name = pname[0].upper() + pname[1:]
                key_sym = f"_logos_prop_key${unit_name}${cur_class}${pname}"
                out_lines.append(f"static char {key_sym};")
                out_lines.append(f"static {ptype} _logos_get${unit_name}${cur_class}${pname}(id self, SEL _cmd) {{")
                out_lines.append(f"    return objc_getAssociatedObject(self, &{key_sym});")
                out_lines.append("}")
                out_lines.append(f"static void _logos_set${unit_name}${cur_class}${ pname }(id self, SEL _cmd, {ptype} val) {{")
                out_lines.append(f"    objc_setAssociatedObject(self, &{key_sym}, val, OBJC_ASSOCIATION_RETAIN_NONATOMIC);")
                out_lines.append("}")
                ctors.append(f'    class_addMethod(objc_getClass("{cur_class}"), @selector({pname}), (IMP)&_logos_get${unit_name}${cur_class}${pname}, "@@:");')
                ctors.append(f'    class_addMethod(objc_getClass("{cur_class}"), @selector(set{cap_name}:), (IMP)&_logos_set${unit_name}${cur_class}${pname}, "v@:@");')
                i += 1
                continue

            is_new = False
            if stripped.startswith('%new'):
                is_new = True
                i += 1
                while i < len(lines) and not lines[i].strip():
                    i += 1
                if i >= len(lines):
                    break
                line = lines[i]
                stripped = line.strip()

            m_meth = re.match(r'^([+-])\s*\(([^)]+)\)(.+?)\{\s*$', stripped)
            if m_meth:
                sign, ret_type, sig_rest = m_meth.groups()
                method_idx += 1
                # Parse selector and args
                parts = re.findall(r'(\w+)\s*:\s*\(([^)]+)\)\s*(\w+)', sig_rest)
                if parts:
                    sel_name = "".join(p[0] + ":" for p in parts)
                    c_args = ", ".join(["id self", "SEL _cmd"] + [f"{p[1].strip()} {p[2].strip()}" for p in parts])
                    call_args = ", ".join(["self", "_cmd"] + [p[2].strip() for p in parts])
                else:
                    sel_name = sig_rest.strip()
                    c_args = "id self, SEL _cmd"
                    call_args = "self, _cmd"

                fn_id = f"{unit_name}_{cur_class}_{method_idx}"
                orig_fn = f"_logos_orig${fn_id}"
                hook_fn = f"_logos_method${fn_id}"

                # Collect method body lines until matching '}'
                body_lines = []
                # Check if single-line method
                brace_depth = line.count('{') - line.count('}')
                if brace_depth == 0:
                    inner = stripped[stripped.find('{')+1:stripped.rfind('}')]
                    body_lines.append(inner)
                else:
                    i += 1
                    while i < len(lines) and brace_depth > 0:
                        bline = lines[i]
                        brace_depth += bline.count('{') - bline.count('}')
                        if brace_depth == 0:
                            body_lines.append(bline[:bline.rfind('}')])
                        else:
                            body_lines.append(bline)
                        i += 1
                    i -= 1

                body_str = "\n".join(body_lines)
                # Replace %orig(args) and %orig
                body_str = re.sub(r'%orig\(([^)]*)\)', lambda m: f"{orig_fn}(self, _cmd, {m.group(1)})" if m.group(1).strip() else f"{orig_fn}({call_args})", body_str)
                body_str = re.sub(r'%orig\b', f"{orig_fn}({call_args})", body_str)

                if not is_new:
                    out_lines.append(f"static {ret_type} (*{orig_fn})({c_args});")
                out_lines.append(f"static {ret_type} {hook_fn}({c_args}) {{")
                out_lines.append(body_str)
                out_lines.append("}")

                target_cls_expr = f'objc_getClass("{cur_class}")'
                if sign == '+':
                    target_cls_expr = f'object_getClass({target_cls_expr})'
                if is_new:
                    ctors.append(f'    class_addMethod({target_cls_expr}, @selector({sel_name}), (IMP)&{hook_fn}, "@@:");')
                else:
                    ctors.append(f'    MSHookMessageEx({target_cls_expr}, @selector({sel_name}), (IMP)&{hook_fn}, (IMP *)&{orig_fn});')
                i += 1
                continue

        out_lines.append(line)
        i += 1

    out_lines.append("")
    out_lines.append(f"__attribute__((constructor)) static void _logosLocalInit_{unit_name}(void) {{")
    out_lines.extend(ctors)
    out_lines.append("}")
    return "\n".join(out_lines) + "\n"

if __name__ == '__main__':
    in_file = sys.argv[1]
    out_file = sys.argv[2]
    unit = re.sub(r'\W+', '_', in_file.split('/')[-1].replace('.x', ''))
    with open(in_file, 'r') as f:
        text = f.read()
    with open(out_file, 'w') as f:
        f.write(convert_logos(text, unit))
