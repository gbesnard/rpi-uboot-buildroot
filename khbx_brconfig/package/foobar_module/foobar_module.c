#include <linux/init.h>
#include <linux/module.h>
#include <linux/fs.h>

int foobar_module_init(void)
{
	printk(KERN_ALERT "Inside the %s function\n", __FUNCTION__);
	return 0;
}

void foobar_module_exit(void)
{
	printk(KERN_ALERT "Inside the %s function\n", __FUNCTION__);
}

module_init(foobar_module_init);
module_exit(foobar_module_exit);
MODULE_LICENSE("GPL");
MODULE_AUTHOR("KHBX");
