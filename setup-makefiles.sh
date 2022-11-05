#!/bin/bash
#
# SPDX-FileCopyrightText: 2016 The CyanogenMod Project
# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

function vendor_imports() {
    cat <<EOF >>"$1"
		"hardware/qcom-caf/common/libqti-perfd-client",
		"vendor/qcom/opensource/display",
EOF
}

function lib_to_package_fixup_system_variants() {
    if [ "$2" != "system" ]; then
        return 1
    fi
    case "$1" in
          vendor.dolby.hardware.dms@2.0)
            echo "${1}_system"
            ;;
        *)
            return 1
            ;;
    esac
}
function lib_to_package_fixup() {
    lib_to_package_fixup_clang_rt_ubsan_standalone "$1" ||
        lib_to_package_fixup_proto_3_9_1 "$1" ||
        lib_to_package_fixup_system_variants "$@"
}


# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=alioth
export DEVICE_COMMON=sm8250-common
export VENDOR=xiaomi
export VENDOR_COMMON=${VENDOR}

"./../../${VENDOR_COMMON}/${DEVICE_COMMON}/setup-makefiles.sh" "$@"
