COMMON_PATH := device/Infinix/X626

# Architecture
ifeq ($(FORCE_32_BIT),true)
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
else
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_CPU_ABI_LIST_64_BIT := $(TARGET_CPU_ABI)
TARGET_CPU_ABI_LIST_32_BIT := $(TARGET_2ND_CPU_ABI),$(TARGET_2ND_CPU_ABI2)
TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI_LIST_64_BIT),$(TARGET_CPU_ABI_LIST_32_BIT)
endif

# Platform
TARGET_BOARD_PLATFORM := mt6765

# Bootloader
TARGET_NO_BOOTLOADER := true

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_USES_64_BIT_BINDER := true
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x11b00000 --second_offset 0x00f00000 --tags_offset 0x07880000
BOARD_KERNEL_IMAGE_NAME := zImage
# TARGET_KERNEL_ARCH := arm64
# TARGET_KERNEL_SOURCE := kernel/Infinix/X626

# Dex
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT ?= true
  endif
endif
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= true

# Graphics
TARGET_USES_HWC2 := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Misc
BOARD_VENDOR := Infinix
PRODUCT_GMS_CLIENTID_BASE := android-transsion-infinix-rev1

# Panel vsync offsets
VSYNC_EVENT_PHASE_OFFSET_NS := 8300000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 8300000
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4027375616
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_VENDORIMAGE_PARTITION_SIZE := 696254464
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Mediatek support
BOARD_USES_MTK_HARDWARE:=true

# Audio
BOARD_USES_MTK_AUDIO := true

# Recovery
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/recovery.fstab

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_USE_FRAMEBUFFER_ALPHA_CHANNEL := true
RECOVERY_SDCARD_ON_DATA := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TARGET_DISABLE_TRIPLE_BUFFERING := false
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"

########
# TWRP #
########

# Resolution
TW_THEME := portrait_hdpi
DEVICE_SCREEN_WIDTH := 720
DEVICE_SCREEN_HEIGHT := 1520

# Display
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_DEFAULT_BRIGHTNESS := 188
TW_MAX_BRIGHTNESS := 255
TW_NO_SCREEN_BLANK := true
TW_NO_SCREEN_TIMEOUT := true
TW_NO_BATT_PERCENT := false
TW_SCREEN_BLANK_ON_BOOT := true

TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
TW_USE_TOOLBOX := true

# Excludes
TW_EXCLUDE_TWRPAPP := true

# Crypto
TW_INCLUDE_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/bootdevice/by-name/userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,discard,noauto_da_alloc,barrier=0,data=ordered"

# Debug
TWRP_INCLUDE_LOGCAT := true

# Storage
TW_HAS_MTP := true
TW_MTP_DEVICE := /dev/mtp_usb
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_NO_USB_STORAGE := false

# Languages
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := en

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

BOARD_SEPOLICY_DIRS := \
       $(COMMON_PATH)/sepolicy

# Treble
BOARD_VNDK_VERSION  := current
TARGET_COPY_OUT_VENDOR := vendor
PRODUCT_FULL_TREBLE_OVERRIDE := true
