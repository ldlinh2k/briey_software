...
#include "prince.h"

#define CORE_HZ 50000000

#define GPIO_A_BASE    ((Gpio_Reg*)(0xF0000000))
#define GPIO_B_BASE    ((Gpio_Reg*)(0xF0001000))
#define PRINCE_BASE 	((Prince_Reg*)(0xF0002000)) // PRINCE PERIPHERAL
#define UART      	((Uart_Reg*)(0xF0010000))
#define VGA_BASE       ((Vga_Reg*)(0xF0030000))
...
