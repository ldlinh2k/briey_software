#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <briey.h>
//function----
//------------------------PRINCE-------------------
void prince_write(uint32_t iData, uint32_t iAddress)
{
	PRINCE_BASE->ADDRESS		= iAddress;
	PRINCE_BASE->WRITE_ENABLE 	= 1;
	PRINCE_BASE->IDATA			= iData;
	PRINCE_BASE->CHIP_SELECT	= 1;
	PRINCE_BASE->CHIP_SELECT	= 0;
}
uint32_t prince_read(uint32_t iAddress)
{
	PRINCE_BASE->ADDRESS		= iAddress;
	PRINCE_BASE->WRITE_ENABLE	= 0;
	PRINCE_BASE->CHIP_SELECT	= 1;
	uint32_t res 				= PRINCE_BASE->ODATA;
	PRINCE_BASE->CHIP_SELECT	= 0;
	return res;
}

void prince_cipher(uint32_t mode, uint32_t *key, uint32_t *block, uint32_t *res)
{
		//KEY----

		prince_write(key[3],PRINCE_ADDR_KEY3);
		prince_write(key[2],PRINCE_ADDR_KEY2);
		prince_write(key[1],PRINCE_ADDR_KEY1);
		prince_write(key[0],PRINCE_ADDR_KEY0);



		//EN-OR-DE---
		prince_write(mode,PRINCE_ADDR_CONFIG);

		//BLOCK----
		prince_write(block[1],PRINCE_ADDR_BLOCK1);
		prince_write(block[0],PRINCE_ADDR_BLOCK0);


		//START----
		prince_write(0x1,PRINCE_ADDR_CTRL);

		//wait result----
		while(prince_read(PRINCE_ADDR_STATUS)==0);
		res[1] = prince_read(PRINCE_ADDR_RESULT1);
		res[0] = prince_read(PRINCE_ADDR_RESULT0);
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

	print("====================================================\r\n");
	print("==========Add Prince Peripheral to Briey-SoC========\r\n");
	print("==========K18 FETEL - EMBEDDED SYSTEM -=============\r\n");
	print("=============LE DUY LINH - 18200157-================\r\n");
	print("====================================================\r\n");
	//******************************************************************
	//******************************PRINCE******************************
	//******************************************************************
	uint32_t key[4] 		= {0x0, 0x0, 0x0, 0x0};
	uint32_t block[2] 		= {0x0, 0x0};
	uint32_t real_res[2] 	= {0x0,0x0};
	//************************TEST 1 (ENCRYPT)**************************

	key[3]		= 0x00112233;
	key[2]		= 0x44556677;
	key[1]		= 0x8899aabb;
	key[0]		= 0xccddeeff;

	block[1] 	= 0x01234567;
	block[0] 	= 0x89abcdef;

	prince_cipher(PRINCE_OP_EN,key,block,real_res);
	GPIO_A_BASE->OUTPUT = real_res[1];
	GPIO_A_BASE->OUTPUT = real_res[0];


	//************************TEST 2 (ENCRYPT)*************************
	key[3]		= 0x00000000;
	key[2]		= 0x00000000;
	key[1]		= 0x00000000;
	key[0]		= 0x00000000;

	block[1] 	= 0x00000000;
	block[0] 	= 0x00000000;

	prince_cipher(PRINCE_OP_EN,key,block,real_res);
	GPIO_A_BASE->OUTPUT = real_res[1];
	GPIO_A_BASE->OUTPUT = real_res[0];


	//************************TEST 3 (ENCRYPT)*************************

	key[3]		= 0xd8cdb780;
	key[2]		= 0x70b4c55a;
	key[1]		= 0x818665aa;
	key[0]		= 0x0d02dfda;

	block[1] = 0x69c4e0d8;
	block[0] = 0x6a7b0430;

	prince_cipher(PRINCE_OP_EN,key,block,real_res);
	GPIO_A_BASE->OUTPUT = real_res[1];
	GPIO_A_BASE->OUTPUT = real_res[0];

	//************************TEST 4 (DECRYPT)*************************
	key[3]		= 0xd8cdb780;
	key[2]		= 0x70b4c55a;
	key[1]		= 0x818665aa;
	key[0]		= 0x0d02dfda;

	block[1] 	= 0x43c6b256;
	block[0] 	= 0xd79de7e8;

	prince_cipher(PRINCE_OP_DE,key,block,real_res);
	GPIO_A_BASE->OUTPUT = real_res[1];
	GPIO_A_BASE->OUTPUT = real_res[0];
	return 0;	
}
void irqCallback(){

}
