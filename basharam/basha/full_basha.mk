# Defines a list of languages to be supported by our device
#$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)


# Defines the rules for building the base Android platform,
# but itself is not specialized for any particular device
#$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)


# Overrides
PRODUCT_NAME := full_basha
PRODUCT_DEVICE := basha
PRODUCT_BRAND := Android
PRODUCT_MODEL := 2.3.7_r1 AOSP on basha

# Include the common definitions and packages
#include $(LOCAL_PATH)/common.mk

