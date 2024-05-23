#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8250-common
include device/xiaomi/sm8250-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/alioth

BUILD_BROKEN_DUP_RULES := true

# Board
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# Display
TARGET_SCREEN_DENSITY := 440

# Reserve space for Vanilla Build
ifneq ($(BUILD_WITH_GAPPS),true)
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT ?= -1
ifeq ($(PRODUCT_VIRTUAL_AB_OTA),true)
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE ?= 1188036608
else
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE ?= 1957691392
endif
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT ?= -1
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE ?= 1258291200
BOARD_SYSTEM_EXTIMAGE_EXTFS_INODE_COUNT ?= -1
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE ?= 629145600
endif

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):init_xiaomi_alioth
TARGET_RECOVERY_DEVICE_MODULES := init_xiaomi_alioth

# Kernel
TARGET_KERNEL_CONFIG := alioth_defconfig

# OTA assert
TARGET_OTA_ASSERT_DEVICE := alioth,aliothin

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Inherit from the proprietary version
include vendor/xiaomi/alioth/BoardConfigVendor.mk
