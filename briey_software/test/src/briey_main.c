#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <briey.h>
#include "aes_custom.h"
#include "aes_custom_riscv.h"

uint32_t gcd(uint32_t a, uint32_t b){
	GCD->A = a;
	GCD->B = b;
	GCD->VALID = 0x00000001;
	uint32_t rdyFlag = 0;
	do{
		rdyFlag = GCD->READY;
	}while(!rdyFlag);
	return GCD->RES;
}

void print(char *str){
	while(*str){
		uart_write(UART,*(str++));
	}
}
unsigned int data;
unsigned int address;
int main() {
	Uart_Config uartConfig;
	uartConfig.dataLength = 8;
	uartConfig.parity = NONE;
	uartConfig.stop = ONE;
	uartConfig.clockDivider = (CORE_HZ / 8 / 115200) - 1;
	uart_applyConfig(UART,&uartConfig);

	print("Add GCD Peripheral to Briey-SoC\r\n");
	

	uint32_t myGCD=0;
	myGCD=gcd(1, 123913);
	myGCD=	gcd(461952, 116298);
	myGCD=	gcd(461952, 1162);
	myGCD=	gcd(461952, 11623);


	return 0;	
}


void irqCallback(){

}
