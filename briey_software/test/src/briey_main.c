#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <briey.h>
#include "ALU_custom.h"

void print(char *str){
	while(*str){
		uart_write(UART,*(str++));
	}
}

int main() {
	Uart_Config uartConfig;
	uartConfig.dataLength = 8;
	uartConfig.parity = NONE;
	uartConfig.stop = ONE;
	uartConfig.clockDivider = (CORE_HZ / 8 / 115200) - 1;
	uart_applyConfig(UART,&uartConfig);

	print("ALU_Custom - Le Duy Linh - 18200157\r\n");
	GPIO_ALU_RD_BASE->OUTPUT=0xFF;
	unsigned int ALU_op,ALU_rs1,ALU_rs2,result;
	int a=6;
	while(1)
	{
		result=0;
		ALU_op = GPIO_ALU_OP_BASE->INPUT;
		ALU_rs1 = GPIO_ALU_RS1_BASE->INPUT;
		ALU_rs2 = GPIO_ALU_RS2_BASE->INPUT;
		//int x = GPIO_B_BASE->INPUT;
		switch(ALU_op)
		{
			case 0: { result = ALU_custom_add(ALU_rs1,ALU_rs2); break;}
			case 1: { result = ALU_custom_sub(ALU_rs1,ALU_rs2); break;}
			case 2: { result = ALU_custom_sll(ALU_rs1,ALU_rs2); break;}
			case 3: { result = ALU_custom_srl(ALU_rs1,ALU_rs2); break;}
		}
		//GPIO_ALU_RD_BASE->OUTPUT=result;
		GPIO_A_BASE->OUTPUT=result;
	}

}


void irqCallback(){

}
