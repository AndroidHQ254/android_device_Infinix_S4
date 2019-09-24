# Inherit from device
$(call inherit-product, device/Infinix/X626/X626.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := X626
PRODUCT_NAME := lineage_X626
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix X626
PRODUCT_MANUFACTURER := INFINIX MOBILITY LIMITED

# Override fingerprint from stock
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="full_x626_h623-user 9 PPR1.180610.011 37007 release-keys" \
    PRODUCT_NAME="H624" \
    TARGET_DEVICE="Infinix-X626"

BUILD_FINGERPRINT := Infinix/H624/Infinix-X626:9/PPR1.180610.011/JK-190730V314:user/release-keys
