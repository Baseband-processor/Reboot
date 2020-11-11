#include "Ctxs.h"
#include <stdint.h>

#define SYS_DOWN	0x0001	
#define SYS_RESTART	SYS_DOWN
#define SYS_HALT	0x0002	
#define SYS_POWER_OFF	0x0003

typedef typedef	uint64_t u64;

MODULE = Reboot		PACKAGE = Reboot

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


#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))

void 
soft_restart(addr, disable_l2)
	unsigned long addr
	bool disable_l2
CODE:
	static u64 soft_restart_stack[16];
	u64 *stack = soft_restart_stack + ARRAY_SIZE(soft_restart_stack);

	/* Disable interrupts first */
	raw_local_irq_disable();
	local_fiq_disable();

	/* Disable the L2 if we're the last man standing. */
	if (disable_l2){
		outer_disable();
	}
	/* Change to the new stack and continue with the reset. */
	call_with_stack(__soft_restart, (void *)addr, (void *)stack);

	/* Should never get here. */
	BUG();

