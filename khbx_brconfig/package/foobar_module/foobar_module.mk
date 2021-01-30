FOOBAR_MODULE_VERSION = 1.0
FOOBAR_MODULE_SITE = $(BR2_EXTERNAL_KHBX_PATH)/package/foobar_module
FOOBAR_MODULE_SITE_METHOD = local
 
$(eval $(kernel-module))
$(eval $(generic-package))
