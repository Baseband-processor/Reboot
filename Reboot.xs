#include "Ctxs.h"

#define SYS_DOWN	0x0001	
#define SYS_RESTART	SYS_DOWN
#define SYS_HALT	0x0002	
#define SYS_POWER_OFF	0x0003

void 
kernel_restart(cmd)
  char *cmd
CODE:
	kernel_restart_prepare(cmd);
	migrate_to_reboot_cpu();
	syscore_shutdown();
	if (!cmd){
		pr_emerg("Restarting system\n");
	}else{
		pr_emerg("Restarting system with command '%s'\n", cmd);
	}
  kmsg_dump(KMSG_DUMP_SHUTDOWN);
	machine_restart(cmd);
}
