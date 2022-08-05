#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <briey.h>

void resetBlock(uint32_t *block)
{
	block[1]=0;
	block[0]=0;
}
int main() {
	Uart_Config uartConfig;
	uartConfig.dataLength = 8;
	uartConfig.parity = NONE;
	uartConfig.stop = ONE;
	uartConfig.clockDivider = (CORE_HZ / 8 / 115200) - 1;
	uart_applyConfig(UART,&uartConfig);
//CHACHA
	print("\r\n");
	print("\r\t*****************************************CHACHA TEST**************************************\r\n");
	uint32_t chacha_key[8] 		= {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
	uint32_t chacha_block[2] 	= {0x0, 0x0};
	uint32_t chacha_res[15] 	= {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
	print("\r\n\t==========================================TEST 1==========================================\r\n");
	print("\r\n\t[All zeros, 128-bit key, 8 rounds]\r\n");
	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,8,chacha_res);

	print("\r\n\t[All zeros, 128-bit key, 12 rounds]\r\n");
	resetBlock(chacha_block);
	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,12,chacha_res);

	print("\r\n\t[All zeros, 128-bit key, 20 rounds]\r\n");
	resetBlock(chacha_block);
	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,20,chacha_res);

	print("\r\n\t[All zeros, 256-bit key, 8 rounds]\r\n");
	resetBlock(chacha_block);
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,8,chacha_res);

	print("\r\n\t[All zeros, 256-bit key, 12 rounds]\r\n");
	resetBlock(chacha_block);
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,12,chacha_res);

	print("\r\n\t[All zeros, 256-bit key, 20 rounds]\r\n");
	resetBlock(chacha_block);
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,20,chacha_res);

	print("\r\n\t==========================================TEST 2==========================================\r\n");
	print("\r\n\t[256-bit key, 8 rounds]\r\n");
	chacha_block[1]=0x0f1e2d3c;
	chacha_block[0]=0x4b596877;

	chacha_key[7]=	0x00112233;
	chacha_key[6]=	0x44556677;
	chacha_key[5]=	0x8899aabb;
	chacha_key[4]=	0xccddeeff;
	chacha_key[3]=	0xffeeddcc;
	chacha_key[2]=	0xbbaa9988;
	chacha_key[1]=	0x77665544;
	chacha_key[0]= 	0x33221100;

	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,8,chacha_res);

	print("\r\n\t==========================================TEST 3==========================================\r\n");
	print("\r\n\t[All bits in key and IV are set. 128 bit key, 8 rounds]\r\n");
	//h2204d5b81ce662193e00966034f91302f14a3fb047f58b6e6ef0d721132304163e0fb640d76ff9c3b9cd99996e6e38fad13f0e31c82244d33abbc1b11e8bf12d
	chacha_block[1]=0xffffffff;
	chacha_block[0]=0xffffffff;

	chacha_key[7]=	0xffffffff;
	chacha_key[6]=	0xffffffff;
	chacha_key[5]=	0xffffffff;
	chacha_key[4]=	0xffffffff;
	chacha_key[3]=	0xffffffff;
	chacha_key[2]=	0xffffffff;
	chacha_key[1]=	0xffffffff;
	chacha_key[0]= 	0xffffffff;

	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,8,chacha_res);

	print("\r\n\t==========================================TEST 4==========================================\r\n");
	//128-bit key
	//ha7a6c81bd8ac106e8f3a46a1bc8ec702e95d18c7e0f424519aeafb54471d83a2bf888861586b73d228eaaf82f9665a5a155e867f93731bfbe24fab495590b231
	chacha_block[1]=0x0f1e2d3c;
	chacha_block[0]=0x4b596877;
	chacha_key[7]=	0x00112233;
	chacha_key[6]=	0x44556677;
	chacha_key[5]=	0x8899aabb;
	chacha_key[4]=	0xccddeeff;
	chacha_key[3]=	0x0;
	chacha_key[2]=	0x0;
	chacha_key[1]=	0x0;
	chacha_key[0]= 	0x0;

	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,8,chacha_res);

//PRINCE
	print("\r\t**********************************PRINCE TEST*******************************\r\n");
	uint32_t prince_key[4] 		= {0x0, 0x0, 0x0, 0x0};
	uint32_t prince_block[2] 		= {0x0, 0x0};
	uint32_t prince_res[2] 	= {0x0,0x0};
	print("\r\n\t===================================TEST 1===================================\r\n");

	prince_block[1] 	= 0x69c4e0d8;
	prince_block[0] 	= 0x6a7b0430;

	prince_key[3]		= 0xd8cdb780;
	prince_key[2]		= 0x70b4c55a;
	prince_key[1]		= 0x818665aa;
	prince_key[0]		= 0x0d02dfda;

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);

	print("\r\n\t===================================TEST 2===================================\r\n");

	prince_block[1] 	= 0x43c6b256;
	prince_block[0] 	= 0xd79de7e8;

	//USE THE SAME KEY

	prince_cipher(PRINCE_OP_DE,prince_key,prince_block,prince_res);
//PRESENT
	print("\r\n");
	print("\r\t******************************PRESENT TEST**********************************\r\n");
	unsigned int present_key[3] = {0x0, 0x0, 0x0};
	unsigned int present_block[2] 	= {0x0, 0x0};
	unsigned int present_res[2] 	= {0x0, 0x0};

	print("\r\n\t==================================TEST 1====================================\r\n");

	present_block[1]=0x4c746e67;
	present_block[0]=0x7579656e;

	present_key[2] = 0x46657465;
	present_key[1] = 0x6c48636d;
	present_key[0] = 0x7573;

	present_cipher(PRESENT_OP_EN,present_key,present_block,present_res);

	print("\r\n\t==================================TEST 2====================================\r\n");

	present_block[1]=0x0e1d00d4;
	present_block[0]=0xe46ba99c;

	//USE THE SAME KEY

	present_cipher(PRESENT_OP_DE,present_key,present_block,present_res);
	//DM_PRESENT
	print("\r\n");
	print("\r\t***************************DM_PRESENT TEST**********************************\r\n");
	unsigned int dm_present_key[3] 		= {0x0, 0x0, 0x0};
	unsigned int dm_present_block[2] 	= {0x0, 0x0};
	unsigned int dm_present_res[2] 		= {0x0, 0x0};

	print("\r\n\t==================================TEST 1====================================\r\n");

	dm_present_block[1]=0x4c746e67;
	dm_present_block[0]=0x7579656e;

	dm_present_key[2] = 0x46657465;
	dm_present_key[1] = 0x6c48636d;
	dm_present_key[0] = 0x7573;

	//expec: 42696eb3 9112ccf2

	dm_present_hash(dm_present_key,dm_present_block,dm_present_res);

	print("\r\n\t==================================TEST 2====================================\r\n");

	dm_present_block[1]=0x46657465;
	dm_present_block[0]=0x6c5f5553;

	dm_present_key[2] = 0x00000000;
	dm_present_key[1] = 0x00000000;
	dm_present_key[0] = 0x0001;
	//expec:d52384e3 dcee9ce7

	dm_present_hash(dm_present_key,dm_present_block,dm_present_res);
	print("\r\n\t==================================TEST 3====================================\r\n");

	dm_present_block[1]=0x31383230;
	dm_present_block[0]=0x30313833;

	dm_present_key[2] = 0x31383230;
	dm_present_key[1] = 0x30313833;
	dm_present_key[0] = 0x5553;
	//expec: 08e11c56 b6d5a592
	dm_present_hash(dm_present_key,dm_present_block,dm_present_res);

	return 0;	
}
void irqCallback(){

}
