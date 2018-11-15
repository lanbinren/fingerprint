#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

# device path
MY_DEVICE_ROOTDIR := device/mediateksample/k62v1_32_bsp

ifeq ($(strip $(TARGET_COPY_OUT_VENDOR)),)	
TARGET_COPY_OUT_VENDOR := vendor
endif

# android biometrics service
PRODUCT_PACKAGES += android.hardware.biometrics.fingerprint@2.1-service
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

# sunwave ta
PRODUCT_COPY_FILES += $(MY_DEVICE_ROOTDIR)/vendor/app/t6/5b9e0e41-2636-11e1-ad9e0002a5d5c51b.ta:$(TARGET_COPY_OUT_VENDOR)/app/t6/5b9e0e41-2636-11e1-ad9e0002a5d5c51b.ta

# sunwave vendor.sw.swfingerprint@1.0-service
PRODUCT_COPY_FILES += $(MY_DEVICE_ROOTDIR)/vendor/bin/hw/vendor.sw.swfingerprint@1.0-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/vendor.sw.swfingerprint@1.0-service

# sunwave vendor.sw.swfingerprint@1.0-service.rc
PRODUCT_COPY_FILES += $(MY_DEVICE_ROOTDIR)/vendor/etc/init/vendor.sw.swfingerprint@1.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.sw.swfingerprint@1.0-service.rc

# sunwave 32bits libs
PRODUCT_COPY_FILES += $(MY_DEVICE_ROOTDIR)/vendor/lib/vendor.sw.swfingerprint@1.0.so:$(TARGET_COPY_OUT_VENDOR)/lib/vendor.sw.swfingerprint@1.0.so
PRODUCT_COPY_FILES += $(MY_DEVICE_ROOTDIR)/vendor/lib/hw/vendor.sw.swfingerprint@1.0-impl.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/vendor.sw.swfingerprint@1.0-impl.so
HAVE_SUNWAVE_FINGERPRINT_FILE := $(shell test -f $(MY_DEVICE_ROOTDIR)/vendor/lib/hw/sunwave.fingerprint.so && echo yes)
ifeq ($(HAVE_SUNWAVE_FINGERPRINT_FILE),yes)
PRODUCT_COPY_FILES += $(MY_DEVICE_ROOTDIR)/vendor/lib/hw/sunwave.fingerprint.default.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/sunwave.fingerprint.default.so
else
PRODUCT_COPY_FILES += $(MY_DEVICE_ROOTDIR)/vendor/lib/hw/fingerprint.default.so:$(TARGET_COPY_OUT_VENDOR)/lib/hw/fingerprint.default.so
endif

# sunwave 64bits libs
HAVE_SUNWAVE_FINGERPRINT_FILE := $(shell test -f $(MY_DEVICE_ROOTDIR)/vendor/lib64/hw/sunwave.fingerprint.so && echo yes)
ifeq ($(HAVE_SUNWAVE_FINGERPRINT_FILE),yes)
PRODUCT_COPY_FILES += $(MY_DEVICE_ROOTDIR)/vendor/lib64/hw/sunwave.fingerprint.default.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/sunwave.fingerprint.default.so
else
PRODUCT_COPY_FILES += $(MY_DEVICE_ROOTDIR)/vendor/lib64/hw/fingerprint.default.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/fingerprint.default.so
endif

# sunwave sepolicy
#BOARD_SEPOLICY_DIRS += $(MY_DEVICE_ROOTDIR)/sunwave_AndroidO_sepolicy_hidl

# sunwave manifest.xml
DEVICE_MANIFEST_FILE += $(MY_DEVICE_ROOTDIR)/manifest.xml