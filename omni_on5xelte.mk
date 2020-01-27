##
# Copyright (C) 2020 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
##

# Release name
PRODUCT_RELEASE_NAME := on5xelte

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/pb/config/common.mk)

PRODUCT_LOCALES := en_US

# From runtime_libart.mk
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    dalvik.vm.image-dex2oat-Xms=64m \
    dalvik.vm.image-dex2oat-Xmx=64m \
    dalvik.vm.dex2oat-Xms=64m \
    dalvik.vm.dex2oat-Xmx=512m \
    ro.dalvik.vm.native.bridge=0

ADDITIONAL_DEFAULT_PROPERTIES += \
    pm.dexopt.first-boot=interpret-only \
    pm.dexopt.boot=verify-profile \
    pm.dexopt.install=interpret-only \
    pm.dexopt.bg-dexopt=speed-profile \
    pm.dexopt.ab-ota=speed-profile \
    pm.dexopt.nsys-library=speed \
    pm.dexopt.shared-apk=speed \
    pm.dexopt.forced-dexopt=speed \
    pm.dexopt.core-app=speed \
    dalvik.vm.image-dex2oat-filter=verify-at-runtime \
    dalvik.vm.dex2oat-filter=verify-at-runtime \
    dalvik.vm.usejit=true

# adb is there, so just add mtp for now
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# From core_tiny.mk
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.zygote=zygote32
PRODUCT_COPY_FILES += \
    system/core/rootdir/init.zygote32.rc:root/init.zygote32.rc

PRODUCT_PACKAGES += \
    charger_res_images \
    charger

## Device identifier. This must come after all inclusions
PRODUCT_NAME := omni_on5xelte
PRODUCT_DEVICE := on5xelte
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SM-G570F
