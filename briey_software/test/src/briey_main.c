#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <briey.h>
//function----
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
//---------------------------myRom----------------
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
//------------------------PRINCE-------------------
void prince_write(uint32_t iData, uint32_t iAddress)
{
	PRINCE_BASE->ADDRESS=iAddress;
	PRINCE_BASE->WRITE_ENABLE = 1;
	PRINCE_BASE->IDATA=iData;
	PRINCE_BASE->CHIP_SELECT=1;
	PRINCE_BASE->CHIP_SELECT=0;
}
uint32_t prince_read(uint32_t iAddress)
{
	PRINCE_BASE->ADDRESS=iAddress;
	PRINCE_BASE->WRITE_ENABLE=0;
	PRINCE_BASE->CHIP_SELECT=1;
	uint32_t res = PRINCE_BASE->ODATA;
	PRINCE_BASE->CHIP_SELECT=0;
	return res;
}

void prince_cipher(uint32_t mode, unsigned int *key, unsigned int *block, unsigned int *res)
{
	//KEY----
		prince_write(key[0],PRINCE_ADDR_KEY0);
		prince_write(key[1],PRINCE_ADDR_KEY1);
		prince_write(key[2],PRINCE_ADDR_KEY2);
		prince_write(key[3],PRINCE_ADDR_KEY3);

		//EN-OR-DE
		prince_write(mode,PRINCE_ADDR_CONFIG);

		//BLOCK--
		prince_write(block[0],PRINCE_ADDR_BLOCK0);
		prince_write(block[1],PRINCE_ADDR_BLOCK1);
		//START
		prince_write(0x1,PRINCE_ADDR_CTRL);

		//wait
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

	print("Add GCD Peripheral to Briey-SoC\r\n");
	
	//******************************************************************
	//**************************************PRINCE**********************
	//******************************************************************
	unsigned int key[4] 	= {0x0, 0x0, 0x0, 0x0};
	unsigned int block[2] 	= {0x0, 0x0};
	unsigned int real_res[2] = {0x0,0x0};
	//**********************************TEST 1 *************************

	key[3]	= 0x00112233;       // Key (128 bits)
	key[2]	= 0x44556677;
	key[1]	= 0x8899aabb;
	key[0]	= 0xccddeeff;
	block[1] = 0x01234567;      // Block (message in)
	block[0] = 0x89abcdef;
//	exp_res[0] = 0x8de756ee;
//	exp_res[1] = 0xd6dcb597;    // Expected cipher out


	prince_cipher(PRINCE_OP_EN,key,block,real_res);
	GPIO_A_BASE->OUTPUT = real_res[0];
	GPIO_A_BASE->OUTPUT = real_res[1];

	//**********************************TEST 2 *************************
	key[3]	= 0x00000000;       // Key (128 bits)
	key[2]	= 0x00000000;
	key[1]	= 0x00000000;
	key[0]	= 0x00000000;
	block[1] = 0x00000000;      // Block (message in)
	block[0] = 0x00000000;
//	exp_res[0] = 0x0d02dfda;
//	exp_res[1] = 0x818665aa;    // Expected cipher out

	prince_cipher(PRINCE_OP_EN,key,block,real_res);
	GPIO_A_BASE->OUTPUT = real_res[0];
	GPIO_A_BASE->OUTPUT = real_res[1];

	//-------------------------------------TEST 3 (DECRYPT)------------------------

	key[3]	= 0xd8cdb780;       // Key (128 bits)
	key[2]	= 0x70b4c55a;
	key[1]	= 0x818665aa;
	key[0]	= 0x0d02dfda;
	block[1] = 0x43c6b256;      // Block (message in)
	block[0] = 0xd79de7e8;
//	exp_res[0] = 0x6a7b0430;
//	exp_res[1] = 0x69c4e0d8;    // Expected cipher out

	prince_cipher(PRINCE_OP_DE,key,block,real_res);
	GPIO_A_BASE->OUTPUT = real_res[0];
	GPIO_A_BASE->OUTPUT = real_res[1];
	//----------------------------------TEST 4-------------------------
	key[3]	= 0xd8cdb780;       // Key (128 bits)
	key[2]	= 0x70b4c55a;
	key[1]	= 0x818665aa;
	key[0]	= 0x0d02dfda;
	block[1] = 0x69c4e0d8;      // Block (message in)
	block[0] = 0x6a7b0430;
//	exp_res[0] = 0xd79de7e8;
//	exp_res[1] = 0x43c6b256;    // Expected cipher out

	prince_cipher(PRINCE_OP_EN,key,block,real_res);
	GPIO_A_BASE->OUTPUT = real_res[0];
	GPIO_A_BASE->OUTPUT = real_res[1];
	//---------------------------------------
	uint32_t myGCD=0;
	myGCD=	gcd(16, 8);
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

	return 0;	
}


void irqCallback(){

}
