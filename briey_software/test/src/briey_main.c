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
//CHACHA
	print("\r\t**********************************CHACHA TEST*******************************\r\n");
	uint32_t chacha_key[8] 		= {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
	uint32_t chacha_block[2] 	= {0x0, 0x0};
	uint32_t chacha_res[15] 	= {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
	uint32_t chacha_rounds = 8;
	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,chacha_rounds,chacha_res);
	chacha_block[1] 	= 0x0;
	chacha_block[0] 	= 0x0;
	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,12,chacha_res);
	chacha_block[1] 	= 0x0;
	chacha_block[0] 	= 0x0;
	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,20,chacha_res);
	chacha_block[1] 	= 0x0;
	chacha_block[0] 	= 0x0;
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,8,chacha_res);
	chacha_block[1] 	= 0x0;
	chacha_block[0] 	= 0x0;
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,12,chacha_res);
	chacha_block[1] 	= 0x0;
	chacha_block[0] 	= 0x0;
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,20,chacha_res);
	//test 2
	chacha_block[1]=0x0f1e2d3c;
	chacha_block[0]=0x4b596877;

			chacha_key[7]=0x00112233;
			chacha_key[6]=0x44556677;
			chacha_key[5]=0x8899aabb;
			chacha_key[4]=0xccddeeff;
			chacha_key[3]=0xffeeddcc;
			chacha_key[2]=0xbbaa9988;
			chacha_key[1]=0x77665544;
			chacha_key[0]= 0x33221100;
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,chacha_rounds,chacha_res);
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
