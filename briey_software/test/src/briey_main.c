#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <briey.h>
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
void avalon_write(uint32_t iData, uint32_t iAddress)
{
	MYROM->ADDRESS=iAddress;
	MYROM->READ_N=1;
	MYROM->WRITE_N=0;
	MYROM->IDATA=iData;
	MYROM->CHIP_SELECT=1;
	MYROM->CHIP_SELECT=0;
}

uint32_t avalon_read(uint32_t iAddress)
{
	MYROM->ADDRESS=iAddress;
	MYROM->READ_N=0;
	MYROM->WRITE_N=1;
	MYROM->CHIP_SELECT=1;
	uint32_t res = MYROM->ODATA;
	MYROM->CHIP_SELECT=0;
	return res;
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
	myGCD=gcd(16, 8);
	myGCD=	gcd(461952, 116298);
	myGCD=	gcd(461952, 1162);
	myGCD=	gcd(461952, 11623);

	unsigned int res=0;
	avalon_write(0x35,0);
	avalon_write(0x69,3);
	avalon_write(0x456,2);
	avalon_write(0x78,1);

	res=avalon_read(3);
	res=avalon_read(2);
	res=avalon_read(1);
	res=avalon_read(0);

	MYROM->ADDRESS=0;
	MYROM->READ_N=1;
	MYROM->WRITE_N=0;
	MYROM->IDATA=69;
	MYROM->CHIP_SELECT=1;
	MYROM->CHIP_SELECT=0;

	MYROM->ADDRESS=1;
	MYROM->READ_N=1;
	MYROM->WRITE_N=0;
	MYROM->IDATA=96;
	MYROM->CHIP_SELECT=1;
	MYROM->CHIP_SELECT=0;

	//read
	MYROM->ADDRESS=0;
	MYROM->READ_N=0;
	MYROM->WRITE_N=1;
	MYROM->CHIP_SELECT=1;
	res = MYROM->ODATA;
	MYROM->CHIP_SELECT=0;

	MYROM->ADDRESS=1;
	MYROM->READ_N=0;
	MYROM->WRITE_N=1;
	MYROM->CHIP_SELECT=1;
	res = MYROM->ODATA;
	MYROM->CHIP_SELECT=0;
	return 0;	
}


void irqCallback(){

}
