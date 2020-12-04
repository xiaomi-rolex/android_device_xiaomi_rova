#
# Copyright (C) 2017-2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, vendor/xiaomi/rova/rova-vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n_mr1.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage/lineage-sdk \
    $(LOCAL_PATH)/overlay/packages/apps/Snap

# Inherit from msm8917-common
$(call inherit-product, device/xiaomi/msm8917-common/msm8917.mk)

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/rolex/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/rolex/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/rolex/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/rolex/mixer_paths.xml \
    $(LOCAL_PATH)/audio/rolex/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/rolex/mixer_paths_mtp.xml \
    $(LOCAL_PATH)/audio/rolex/mixer_paths_qrd_sku1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/rolex/mixer_paths_qrd_sku1.xml \
    $(LOCAL_PATH)/audio/rolex/mixer_paths_qrd_sku2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/rolex/mixer_paths_qrd_sku2.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/riva/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/riva/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/riva/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/riva/mixer_paths.xml \
    $(LOCAL_PATH)/audio/riva/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/riva/mixer_paths_mtp.xml \
    $(LOCAL_PATH)/audio/riva/mixer_paths_qrd_sku1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/riva/mixer_paths_qrd_sku1.xml \
    $(LOCAL_PATH)/audio/riva/mixer_paths_qrd_sku2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/riva/mixer_paths_qrd_sku2.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/misc/blank.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/misc/blank.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(LOCAL_PATH)/misc/blank.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml \
    $(LOCAL_PATH)/misc/blank.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd_sku1.xml \
    $(LOCAL_PATH)/misc/blank.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_qrd_sku2.xml

# Camera
PRODUCT_PACKAGES += \
    camera.msm8937 \
    libmm-qcamera

# ConsumerIr
PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/misc/blankfile:$(TARGET_COPY_OUT_VENDOR)/lib/hw/consumerir.default.so \
    $(LOCAL_PATH)/misc/blankfile:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/consumerir.default.so \

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/ft5346.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/ft5346.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/goodix-ts.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/goodix-ts.kl \
    $(LOCAL_PATH)/keylayout/msm8920-sku7-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/msm8920-sku7-snd-card_Button_Jack.kl

# Properties
-include device/xiaomi/rova/prop.mk

# Ramdisk
PRODUCT_PACKAGES += \
    init.rova.rc

PRODUCT_PACKAGES += \
    init.qcom.early_boot.sh

PRODUCT_PACKAGES += \
    init.audio.rc \
    init.audio.sh

PRODUCT_PACKAGES += \
    init.ir.rc \
    init.ir.sh

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf

# Shims
PRODUCT_PACKAGES += \
    libandroid_shim \
    libshim_camera \
    libwui

# VNDK
PRODUCT_PACKAGES += \
    vndk_package \
    vndk-ext

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
