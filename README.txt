aosp_generic_device_files_2.3.7_r1
==================================

Adding new(Generic) Device to AOSP 2.3.7_r1

Host: ubuntu10.04
steps
1. create folder android/device/basharam(OEM)/basha(Device_name)
2. inside device/basharam/basha/ create AndroidProducts.mk
and add device deails
gedit AndroidProducts.mk
and add below lines 
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/full_basha.mk
    
3. create full_basha.mk and add below lines


#refers to source target/product/ folder
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)
#refers to source target/product/ folder
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk) 


# Overrides
PRODUCT_NAME := full_basha
PRODUCT_DEVICE := basha
PRODUCT_BRAND := Android
PRODUCT_MODEL := 2.3.7_r1 AOSP on basha

4. create BoardConfig.mk and add below line

# config.mk
#
# Product-specific compile-time definitions.
#

# The generic product target doesn't have any hardware-specific pieces.
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_CPU_ABI := armeabi
HAVE_HTC_AUDIO_DRIVER := true
BOARD_USES_GENERIC_AUDIO := true

# no hardware camera
USE_CAMERA_STUB := true

# Set /system/bin/sh to mksh, not ash, to test the transition.
TARGET_SHELL := mksh

# CPU
#TARGET_ARCH_VARIANT := armv7-a-neon // issues on GB, and slow neon emulation
#ARCH_ARM_HAVE_TLS_REGISTER := true

5. finally create vendorsetup.sh and add below line
add_lunch_combo full_basha-eng

6. cd myaosp/androdid/
source build/envsetup.sh

7. lunch

You're building on Linux

Lunch menu... pick a combo:
     1. generic-eng
     2. simulator
     3. full_basha-eng // our device is visible here
     4. full_passion-userdebug
     5. htc_vision-userdebug
     6. htc_vision-eng
     7. full_marakana_alpha-eng
     8. full_marakana_alpha-userdebug
     9. full_marakana_alpha-user
     10. full_crespo4g-userdebug
     11. full_crespo-userdebug
     
8. make -j2

9. after successful compilation start emulator 

$out/host/linux-x86/bin/emulator -sysdir out/target/product/basha/ -system out/target/product/basha/system.img -ramdisk out/target/product/basha/ramdisk.img -data out/target/product/basha/userdata.img -kernel prebuilt/android-arm/kernel/kernel-qemu -sdcard sdcard.img -skindir sdk/emulator/skins -skin WVGA800 -scale 0.7 -memory 512 -wipe-data -partition-size 200


10. on emulator click menu->settigs->about phone-> "verify build date and version"
