#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/oplus/ossi

# Build Hack
BUILD_BROKEN_DUP_RULES := true

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    system \
    product \
    system_ext \
    vendor \
    vbmeta_system \
    odm \
    vbmeta_vendor

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a78

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_32_BIT_APPS := true
TARGET_SUPPORTS_64_BIT_APPS := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Assertation
TARGET_OTA_ASSERT_DEVICE := ossi

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := k6895v1_64
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := mt6895

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x3fff8000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x26f08000
BOARD_KERNEL_TAGS_OFFSET := 0x07c88000
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_KERNEL_CONFIG := ossi_defconfig
TARGET_KERNEL_SOURCE := kernel/oplus/ossi

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
endif

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_ROLLBACK_INDEX := 0

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 33554432

BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_SIZE := 9122611200
BOARD_MAIN_PARTITION_LIST := system system_ext vendor product odm my_product my_engineering my_company my_carrier my_region my_heytap my_stock my_preload my_bigball my_manifest

# File systems
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

# Screen density
TARGET_SCREEN_DENSITY := 480

# Resolution
TARGET_SCREEN_HEIGHT := 2460
TARGET_SCREEN_WIDTH := 1080

# Treble
BOARD_VNDK_VERSION := current

# Recovery
TARGET_NO_RECOVERY := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
BOARD_USES_RECOVERY_AS_BOOT := true

# Debug
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

# Hack
PLATFORM_VERSION := 15
PLATFORM_VERSION_LAST_STABLE := 12
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31

# TWRP Configuration
TW_FRAMERATE := 120
TW_THEME := portrait_hdpi
TW_INPUT_BLACKLIST := hbtp_vm
TW_DEFAULT_BRIGHTNESS := 1000
TW_DEVICE_VERSION := KSN-OnePlus Ace Racing edition
TW_LOAD_VENDOR_MODULES := "touchpanel.ko oplus_bsp_tp_custom.ko oplus_bsp_tp_common.ko oplus_bsp_tp_novatek_common.ko oplus_bsp_tp_nt36672c_noflash.ko oplus_bsp_tp_ilitek_common.ko oplus_bsp_tp_ilitek7807s.ko oplus_bsp_tp_syna_common.ko oplus_bsp_tp_tcm_S3910.ko oplus_bsp_tp_ft3681.ko oplus_bsp_tp_focal_common.ko oplus_bsp_tp_ft3683g.ko i2c-mt65xx.ko spi-mt65xx.ko"
TW_CUSTOM_CPU_TEMP_PATH := /sys/class/thermal/thermal_zone54/temp
TW_EXCLUDE_APEX := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TARGET_USES_MKE2FS := true
TW_INCLUDE_FASTBOOTD := true
TW_INCLUDE_FUSE_EXFAT := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_MTP_DEVICE := "OnePlus Ace Racing edition"
TW_INCLUDE_EROFS := true
TW_INCLUDE_LOGICAL := true
TW_USE_FSCRYPT_POLICY := 2
TW_BACKUP_EXCLUDE_EROFS := false
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_LIBRESETPROP := true
