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

	//AES
	print("\r\t*********************************AES TEST***********************************\r\n");
	    unsigned int aes_key_128[4] = {0x0, 0x0, 0x0, 0x0};
	    unsigned int aes_block[4] 	= {0x0, 0x0, 0x0, 0x0};

	    unsigned int aes_res[4] 	= {0x0, 0x0, 0x0, 0x0};

	    print("\r\n\t=================================TEST 1=====================================\r\n");
	    aes_block[3] 	= 0x33343536;
	    aes_block[2] 	= 0x39303132;
	    aes_block[1] 	= 0x35363738;
	    aes_block[0] 	= 0x31323334;

		aes_key_128[3] 	= 0x37363534;
	    aes_key_128[2] 	= 0x31303938;
	    aes_key_128[1] 	= 0x35343332;
	    aes_key_128[0]	= 0x39383736;

	   	aes_128_cipher(AES_OP_EN, aes_key_128, aes_block, aes_res);
	   	print("\r\n\t=================================TEST 2=====================================\r\n");

	    aes_block[3] 	= 0xa1e33d0b;
	    aes_block[2] 	= 0xd07781b2;
	    aes_block[1] 	= 0x53e5f4da;
	    aes_block[0] 	= 0x6f2f5312;

	    //USE THE SAME KEY

	   	aes_128_cipher(AES_OP_DE, aes_key_128, aes_block, aes_res);
	   	print("\r\n\t=================================TEST 3=====================================\r\n");

	    aes_block[3] 	= 0x7393172a;
	    aes_block[2] 	= 0xe93d7e11;
	    aes_block[1] 	= 0x2e409f96;
	    aes_block[0] 	= 0x6bc1bee2;

		aes_key_128[3] 	= 0x09cf4f3c;
	    aes_key_128[2] 	= 0xabf71588;
	    aes_key_128[1] 	= 0x28aed2a6;
	    aes_key_128[0]	= 0x2b7e1516;
	   	aes_128_cipher(AES_OP_EN, aes_key_128, aes_block, aes_res);
	   	print("\r\n\t=================================TEST 4=====================================\r\n");

	    aes_block[3] 	= 0x2466ef97;
	    aes_block[2] 	= 0xa89ecaf3;
	    aes_block[1] 	= 0x0d7a3660;
	    aes_block[0] 	= 0x3ad77bb4;

	    //USE THE SAME KEY

	   	aes_128_cipher(AES_OP_DE, aes_key_128, aes_block, aes_res);


	   	print("\r\n\t========================================TEST 5(AES256)==========================================\r\n");
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


	   	print("\r\n\t========================================TEST 6(AES256)==========================================\r\n");
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

	//POLY1305
	print("\r\n");
	print("\r\t*****************************************POLY1305 TEST************************************\r\n");
	uint32_t poly_key[8] 	= {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
	uint32_t poly_block[4] 	= {0x0, 0x0,0x0,0x0};
	uint32_t poly_res[4] 	= {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
	print("\r\n\t==========================================TEST 1==========================================\r\n");
	//key 85d6be78 57556d33 7f4452fe 42d506a8 0103808a fb0db2fd 4abff6af 4149f51b
	//0 bytes message
	//res expec: h0103808a fb0db2fd 4abff6af 4149f51b
	poly_key[7]= 0x85d6be78;
	poly_key[6]= 0x57556d33;
	poly_key[5]= 0x7f4452fe;
	poly_key[4]= 0x42d506a8;
	poly_key[3]= 0x0103808a;
	poly_key[2]= 0xfb0db2fd;
	poly_key[1]= 0x4abff6af;
	poly_key[0]= 0x4149f51b;

	poly_test_N_bytes(0,poly_key,poly_block,poly_res);
	print("\r\n\t==========================================TEST 2==========================================\r\n");
	poly_block[3] = 0x31000000;
	//USE THE SAME KEY
	//res expec: h8097ddf5_19b7f412_0b57fabf_925a19ac
	//1 byte message: 31
	poly_test_N_bytes(1,poly_key,poly_block,poly_res);

	print("\r\n\t==========================================TEST 3==========================================\r\n");
	//res expec: ha8061dc1_305136c6_c22b8baf_0c0127a9
	poly_test_rfc8439();

	print("\r\n\t==========================================TEST 4==========================================\r\n");
	//res expec: hdc0964e5 ce9cd7d9 a7571faf a5dc0473
	poly_test_long();
	//ab
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
	print("\r\n\t==================================TEST 1====================================\r\n");

	present_block[1]=0x4c746e67;
	present_block[0]=0x7579656e;

	present_key[2] = 0x46657465;
	present_key[1] = 0x6c48636d;
	present_key[0] = 0x7573;

	//expec: 42696eb3 9112ccf2

	present_hash(present_key,present_block,present_res);

	print("\r\n\t==================================TEST 2====================================\r\n");

	present_block[1]=0x46657465;
	present_block[0]=0x6c5f5553;

	present_key[2] = 0x00000000;
	present_key[1] = 0x00000000;
	present_key[0] = 0x0001;
	//expec:d52384e3 dcee9ce7
	present_hash(present_key,present_block,present_res);
	print("\r\n\t==================================TEST 3====================================\r\n");

	present_block[1]=0x31383230;
	present_block[0]=0x30313833;

	present_key[2] = 0x31383230;
	present_key[1] = 0x30313833;
	present_key[0] = 0x5553;
	//expec: 08e11c56 b6d5a592


	present_hash(present_key,present_block,present_res);
	return 0;	
}
void irqCallback(){

}
