#include "briey.h"
void chacha_write(uint32_t iData, uint32_t iAddress)
{
	CHACHA_BASE->ADDRESS		= iAddress;
	CHACHA_BASE->WRITE_ENABLE 	= 1;
	CHACHA_BASE->IDATA			= iData;
	CHACHA_BASE->CHIP_SELECT	= 1;
	CHACHA_BASE->CHIP_SELECT	= 0;
}
uint32_t chacha_read(uint32_t iAddress)
{
	CHACHA_BASE->ADDRESS		= iAddress;
	CHACHA_BASE->WRITE_ENABLE	= 0;
	CHACHA_BASE->CHIP_SELECT	= 1;
	uint32_t res 				= CHACHA_BASE->ODATA;
	CHACHA_BASE->CHIP_SELECT	= 0;
	return res;
}
void chacha_cipher(unsigned char key_length, uint32_t *key, uint32_t *block, uint32_t rounds,uint32_t *res)
{
	chacha_write(key[7],CHACHA_ADDR_KEY_BASE);
	chacha_write(key[6],CHACHA_ADDR_KEY_BASE+1);
	chacha_write(key[5],CHACHA_ADDR_KEY_BASE+2);
	chacha_write(key[4],CHACHA_ADDR_KEY_BASE+3);
	chacha_write(key[3],CHACHA_ADDR_KEY_BASE+4);
	chacha_write(key[2],CHACHA_ADDR_KEY_BASE+5);
	chacha_write(key[1],CHACHA_ADDR_KEY_BASE+6);
	chacha_write(key[0],CHACHA_ADDR_KEY_BASE+7);

	chacha_write(block[1],CHACHA_ADDR_BLOCK_BASE);
	chacha_write(block[0],CHACHA_ADDR_BLOCK_BASE+1);

	chacha_write(key_length,CHACHA_ADDR_KEYLEN);


	chacha_write(rounds,CHACHA_ADDR_ROUNDS);

	chacha_write(0x1,CHACHA_ADDR_CTRL);

	while (chacha_read(CHACHA_ADDR_STATUS)==0);

	res[15] = chacha_read(CHACHA_ADDR_RESULT_BASE);
	res[14] = chacha_read(CHACHA_ADDR_RESULT_BASE + 1);
	res[13] = chacha_read(CHACHA_ADDR_RESULT_BASE + 2);
	res[12] = chacha_read(CHACHA_ADDR_RESULT_BASE + 3);
	res[11] = chacha_read(CHACHA_ADDR_RESULT_BASE + 4);
	res[10] = chacha_read(CHACHA_ADDR_RESULT_BASE + 5);
	res[9] = chacha_read(CHACHA_ADDR_RESULT_BASE + 6);
	res[8] = chacha_read(CHACHA_ADDR_RESULT_BASE + 7);
	res[7] = chacha_read(CHACHA_ADDR_RESULT_BASE + 8);
	res[6] = chacha_read(CHACHA_ADDR_RESULT_BASE + 9);
	res[5] = chacha_read(CHACHA_ADDR_RESULT_BASE + 10);
	res[4] = chacha_read(CHACHA_ADDR_RESULT_BASE + 11);
	res[3] = chacha_read(CHACHA_ADDR_RESULT_BASE + 12);
	res[2] = chacha_read(CHACHA_ADDR_RESULT_BASE + 13);
	res[1] = chacha_read(CHACHA_ADDR_RESULT_BASE + 14);
	res[0] = chacha_read(CHACHA_ADDR_RESULT_BASE + 15);

	print("\r\t===========================CHACHA20 CIPHER==================================\r\n");
	print("\r\n");
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
	print256bit("KEY (128/256-bit) : ", key);
	print512bit("RESULT (512-bit) : ", res);
	//print("\r\n============================================================================\r\n");

}
