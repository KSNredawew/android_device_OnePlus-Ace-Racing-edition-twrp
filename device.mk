#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/oplus/ossi
# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/mtk_plpath_utils \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl-1.2-mtkimpl \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
     android.hardware.health@2.0-impl-2.1 \
     android.hardware.health@2.0-impl-default \
     android.hardware.health@2.1-service

PRODUCT_PACKAGES += \
     android.hardware.fastboot@1.0-impl-mtk

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    libz 

PRODUCT_PACKAGES += \
    update_engine_sideload
