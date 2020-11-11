#ifndef __CTXS_H
#define __CTXS_H

// Made by Edoardo Mantovani, 2020
// import libraries

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <stdbool.h> 

#ifdef _DEVICE_H_
  #include <linux/device.h>
#endif

#ifdef _UAPI_LINUX_REBOOT_H
  #include <linux/reboot.h>
#endif

#ifndef _LINUX_KMSG_DUMP_H
  #include <linux/kmsg_dump.h>
#endif

#include "ppport.h"

#endif /* __CTXS_H */
