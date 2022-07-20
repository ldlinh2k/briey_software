#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <briey.h>


int main() {
	Uart_Config uartConfig;
	uartConfig.dataLength = 8;
	uartConfig.parity = NONE;
	uartConfig.stop = ONE;
	uartConfig.clockDivider = (CORE_HZ / 8 / 115200) - 1;
	uart_applyConfig(UART,&uartConfig);

	print("============================================================================\r\n");
	print("===============================PRINCE TEST==================================\r\n");
	print("=========================LE DUY LINH - 18200157-============================\r\n");
	print("============================================================================\r\n");
	uint32_t prince_key[4] 		= {0x0, 0x0, 0x0, 0x0};
	uint32_t prince_block[2] 		= {0x0, 0x0};
	uint32_t prince_res[2] 	= {0x0,0x0};
	print("\r\n===================================TEST 1===================================\r\n");

	prince_block[1] 	= 0x01234567;
	prince_block[0] 	= 0x89abcdef;

	prince_key[3]		= 0x00112233;
	prince_key[2]		= 0x44556677;
	prince_key[1]		= 0x8899aabb;
	prince_key[0]		= 0xccddeeff;

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);

	print("\r\n===================================TEST 2===================================\r\n");

	prince_block[1] 	= 0x00000000;
	prince_block[0] 	= 0x00000000;

	prince_key[3]		= 0x00000000;
	prince_key[2]		= 0x00000000;
	prince_key[1]		= 0x00000000;
	prince_key[0]		= 0x00000000;

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
	print("\r\n===================================TEST 3===================================\r\n");

	prince_block[1] 	= 0x69c4e0d8;
	prince_block[0] 	= 0x6a7b0430;

	prince_key[3]		= 0xd8cdb780;
	prince_key[2]		= 0x70b4c55a;
	prince_key[1]		= 0x818665aa;
	prince_key[0]		= 0x0d02dfda;

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
	print("\r\n===================================TEST 4===================================\r\n");

	prince_block[1] 	= 0x43c6b256;
	prince_block[0] 	= 0xd79de7e8;

	prince_key[3]		= 0xd8cdb780;
	prince_key[2]		= 0x70b4c55a;
	prince_key[1]		= 0x818665aa;
	prince_key[0]		= 0x0d02dfda;

	prince_cipher(PRINCE_OP_DE,prince_key,prince_block,prince_res);

	print("============================================================================\r\n");
	print("===============================AES TEST=====================================\r\n");
	print("=========================LE DUY LINH - 18200157-============================\r\n");
	print("============================================================================\r\n");
    unsigned int aes_key_128[4] = {0x0, 0x0, 0x0, 0x0};
    unsigned int aes_block[4] 	= {0x0, 0x0, 0x0, 0x0};

    unsigned int aes_res[4] 	= {0x0, 0x0, 0x0, 0x0};

	print("\r\n=================================TEST 1=====================================\r\n");

    aes_block[3] 	= 0x33343536;
    aes_block[2] 	= 0x39303132;
    aes_block[1] 	= 0x35363738;
    aes_block[0] 	= 0x31323334;

	aes_key_128[3] 	= 0x37363534;
    aes_key_128[2] 	= 0x31303938;
    aes_key_128[1] 	= 0x35343332;
    aes_key_128[0]	= 0x39383736;

   	aes_128_cipher(AES_OP_EN, aes_key_128, aes_block, aes_res);
	print("\r\n=================================TEST 2=====================================\r\n");

    aes_block[3] 	= 0xfd1ee6b4;
    aes_block[2] 	= 0xbd2fb855;
    aes_block[1] 	= 0x6428318a;
    aes_block[0] 	= 0x6e6f9733;

	aes_key_128[3] 	= 0x33343536;
    aes_key_128[2] 	= 0x39303132;
    aes_key_128[1] 	= 0x35363738;
    aes_key_128[0]	= 0x31323334;

   	aes_128_cipher(AES_OP_DE, aes_key_128, aes_block, aes_res);
	print("\r\n=================================TEST 3=====================================\r\n");

    aes_block[3] 	= 0x7393172a;
    aes_block[2] 	= 0xe93d7e11;
    aes_block[1] 	= 0x2e409f96;
    aes_block[0] 	= 0x6bc1bee2;

	aes_key_128[3] 	= 0x09cf4f3c;
    aes_key_128[2] 	= 0xabf71588;
    aes_key_128[1] 	= 0x28aed2a6;
    aes_key_128[0]	= 0x2b7e1516;
   	aes_128_cipher(AES_OP_EN, aes_key_128, aes_block, aes_res);
	print("\r\n=================================TEST 4=====================================\r\n");

    aes_block[3] 	= 0x2466ef97;
    aes_block[2] 	= 0xa89ecaf3;
    aes_block[1] 	= 0x0d7a3660;
    aes_block[0] 	= 0x3ad77bb4;

	aes_key_128[3] 	= 0x09cf4f3c;
    aes_key_128[2] 	= 0xabf71588;
    aes_key_128[1] 	= 0x28aed2a6;
    aes_key_128[0]	= 0x2b7e1516;

   	aes_128_cipher(AES_OP_DE, aes_key_128, aes_block, aes_res);

   	print("\r\n==========================================TEST 5(AES256)========================================\r\n");
    unsigned int aes_key_256[8] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};

    aes_block[3] 	= 0x7393172a;
    aes_block[2] 	= 0xe93d7e11;
    aes_block[1] 	= 0x2e409f96;
    aes_block[0] 	= 0x6bc1bee2;

    aes_key_256[7] 	= 0x0914dff4;
    aes_key_256[6] 	= 0x2d9810a3;
    aes_key_256[5] 	= 0x3b6108d7;
    aes_key_256[4]	= 0x1f352c07;
    aes_key_256[3] 	= 0x857d7781;
    aes_key_256[2] 	= 0x2b73aef0;
    aes_key_256[1] 	= 0x15ca71be;
    aes_key_256[0]	= 0x603deb10;

    aes_256_cipher(AES_OP_EN, aes_key_256, aes_block, aes_res);

   	print("\r\n==========================================TEST 6(AES256)========================================\r\n");

    aes_block[3] 	= 0x3db181f8 ;
    aes_block[2] 	= 0x064b5a7e ;
    aes_block[1] 	= 0xb5d2a03c;
    aes_block[0] 	= 0xf3eed1bd;

    aes_key_256[7] 	= 0x0914dff4;
    aes_key_256[6] 	= 0x2d9810a3;
    aes_key_256[5] 	= 0x3b6108d7;
    aes_key_256[4]	= 0x1f352c07;
    aes_key_256[3] 	= 0x857d7781;
    aes_key_256[2] 	= 0x2b73aef0;
    aes_key_256[1] 	= 0x15ca71be;
    aes_key_256[0]	= 0x603deb10;

    aes_256_cipher(AES_OP_DE, aes_key_256, aes_block, aes_res);
	return 0;	
}
void irqCallback(){

}
