FOOBAR_CHRDEV_VERSION = 1.0.0
FOOBAR_CHRDEV_SITE = git@github.com:gbesnard/chrdev-driver.git
FOOBAR_CHRDEV_SITE_METHOD = git
 
$(eval $(kernel-module))
$(eval $(generic-package))
