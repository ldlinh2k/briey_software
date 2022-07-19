#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <briey.h>
//function----

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
	uint32_t prince_key[4] 		= {0x0, 0x0, 0x0, 0x0};
	uint32_t prince_block[2] 		= {0x0, 0x0};
	uint32_t prince_res[2] 	= {0x0,0x0};
	//************************TEST 1 (ENCRYPT)**************************

	prince_key[3]		= 0x00112233;
	prince_key[2]		= 0x44556677;
	prince_key[1]		= 0x8899aabb;
	prince_key[0]		= 0xccddeeff;

	prince_block[1] 	= 0x01234567;
	prince_block[0] 	= 0x89abcdef;

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
	GPIO_A_BASE->OUTPUT = prince_res[1];
	GPIO_A_BASE->OUTPUT = prince_res[0];


	//************************TEST 2 (ENCRYPT)*************************
	prince_key[3]		= 0x00000000;
	prince_key[2]		= 0x00000000;
	prince_key[1]		= 0x00000000;
	prince_key[0]		= 0x00000000;

	prince_block[1] 	= 0x00000000;
	prince_block[0] 	= 0x00000000;

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
	GPIO_A_BASE->OUTPUT = prince_res[1];
	GPIO_A_BASE->OUTPUT = prince_res[0];


	//************************TEST 3 (ENCRYPT)*************************

	prince_key[3]		= 0xd8cdb780;
	prince_key[2]		= 0x70b4c55a;
	prince_key[1]		= 0x818665aa;
	prince_key[0]		= 0x0d02dfda;

	prince_block[1] = 0x69c4e0d8;
	prince_block[0] = 0x6a7b0430;

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
	GPIO_A_BASE->OUTPUT = prince_res[1];
	GPIO_A_BASE->OUTPUT = prince_res[0];

	//************************TEST 4 (DECRYPT)*************************
	prince_key[3]		= 0xd8cdb780;
	prince_key[2]		= 0x70b4c55a;
	prince_key[1]		= 0x818665aa;
	prince_key[0]		= 0x0d02dfda;

	prince_block[1] 	= 0x43c6b256;
	prince_block[0] 	= 0xd79de7e8;

	prince_cipher(PRINCE_OP_DE,prince_key,prince_block,prince_res);
	GPIO_A_BASE->OUTPUT = prince_res[1];
	GPIO_A_BASE->OUTPUT = prince_res[0];

	//******************************************************************
	//******************************AES*********************************
	//******************************************************************
    unsigned int aes_key_128[4] = {0x0, 0x0, 0x0, 0x0};
    unsigned int aes_block[4] 	= {0x0, 0x0, 0x0, 0x0};

    unsigned int aes_res[4] 	= {0x0, 0x0, 0x0, 0x0};

    // ============================= TEST 1 - EN ============================
    aes_key_128[0] = 0x39383736;
    aes_key_128[1] = 0x35343332;
    aes_key_128[2] = 0x31303938;
    aes_key_128[3] = 0x37363534;

    aes_block[0] = 0x31323334;
    aes_block[1] = 0x35363738;
    aes_block[2] = 0x39303132;
    aes_block[3] = 0x33343536;

    aes_res[0] = 0x6f2f5312;
    aes_res[1] = 0x53e5f4da;
    aes_res[2] = 0xd07781b2;
    aes_res[3] = 0xa1e33d0b;

	aes_128_cipher(AES_OP_EN, aes_key_128, aes_block, aes_res);

	return 0;	
}
void irqCallback(){

}
