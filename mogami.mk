#
# Copyright (C) 2011 The CyanogenMod Project
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
-include device/semc/msm7x30-common/msm7x30.mk

COMMON_PATH := device/semc/mogami-common

$(call inherit-product-if-exists, vendor/semc/mogami-common/mogami-vendor-blobs.mk)

DEVICE_PACKAGE_OVERLAYS += device/semc/mogami-common/overlay

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Init file
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/init.semc.rc:root/init.semc.rc

# WiFi config & related files
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/hostapd.conf:system/etc/wifi/hostapd.conf \
    $(COMMON_PATH)/rootdir/wifiload:system/bin/wifiload

PRODUCT_PACKAGES += \
    wpa_supplicant.conf \
    hostapd_cli \
    hostapd

PRODUCT_PACKAGES += \
    Fmapplication \
    fmapp \
    libfm_stack \
    fmreceiverif \
    com.ti.fm.fmreceiverif.xml \
    FmRxService \
    libfmrx

# Bluetooth BlueZ
PRODUCT_PACKAGES += \
    bluetoothd \
    hciattach \
    hciconfig \
    hcitool \
    javax.btobex \
    libbluetoothd

PRODUCT_COPY_FILES := \
    system/bluetooth/data/audio.conf:system/etc/bluetooth/audio.conf \
    system/bluetooth/data/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
    system/bluetooth/data/blacklist.conf:system/etc/bluetooth/blacklist.conf \
    system/bluetooth/data/input.conf:system/etc/bluetooth/input.conf \
    system/bluetooth/data/network.conf:system/etc/bluetooth/network.conf

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.softap.interface=wlan0 \
    wifi.softapconcurrent.interface=wlan0 \
    ro.telephony.ril_class=SemcQualcomm7x30RIL \
    ro.telephony.default_network=0
