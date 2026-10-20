#!/bin/bash
set -e
SRC_DIR="${PROJECT_DIR:-$(cd "$(dirname "$0")/.." && pwd)}"
GEN_DIR="${SRC_DIR}/Xcode/Generated"
mkdir -p "${GEN_DIR}"

LOGOS_PL=""
if [ -n "${THEOS}" ] && [ -f "${THEOS}/bin/logos.pl" ]; then
    LOGOS_PL="${THEOS}/bin/logos.pl"
elif [ -f "/opt/theos/bin/logos.pl" ]; then
    LOGOS_PL="/opt/theos/bin/logos.pl"
elif [ -f "${HOME}/theos/bin/logos.pl" ]; then
    LOGOS_PL="${HOME}/theos/bin/logos.pl"
fi

for xfile in "${SRC_DIR}"/*.x; do
    base=$(basename "${xfile}" .x)
    out="${GEN_DIR}/${base}.x.m"
    if [ -n "${LOGOS_PL}" ]; then
        perl "${LOGOS_PL}" "${xfile}" > "${out}"
    else
        python3 "${SRC_DIR}/scripts/logos_to_objc.py" "${xfile}" "${out}"
    fi
done
echo "Preprocessed Logos (.x) files into ${GEN_DIR}"
