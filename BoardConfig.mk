# Inherit from xiaomi mt6765-common
-include device/Infinix/X626/BoardConfigCommon.mk

DEVICE_PATH := device/Infinix/X626

# Board
# TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# Kernel
# TARGET_KERNEL_CONFIG := X626_defconfig
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/zImage

# OTA
TARGET_OTA_ASSERT_DEVICE := X626
