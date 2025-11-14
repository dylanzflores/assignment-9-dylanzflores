AESD_CHAR_DRIVER_VERSION = 1.0
AESD_CHAR_DRIVER_SITE = $(BR2_EXTERNAL_BASE_PATH)/package/aesd-char-driver
AESD_CHAR_DRIVER_SITE_METHOD = local

define AESD_CHAR_DRIVER_BUILD_CMDS
    $(MAKE) -C $(@D)/src
endef

define AESD_CHAR_DRIVER_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 644 $(@D)/src/aesdchar.ko \
        $(TARGET_DIR)/lib/modules/$(KERNEL_VERSION)/
endef

$(eval $(kernel-module))
$(eval $(generic-package))
