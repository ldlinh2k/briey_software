#include "briey.h"
void aes_write(uint32_t iData, uint32_t iAddress)
{
	AES_BASE->ADDRESS		= iAddress;
	AES_BASE->WRITE_ENABLE 	= 1;
	AES_BASE->IDATA			= iData;
	AES_BASE->CHIP_SELECT	= 1;
	AES_BASE->CHIP_SELECT	= 0;
}
uint32_t aes_read(uint32_t iAddress)
{
	AES_BASE->ADDRESS		= iAddress;
	AES_BASE->WRITE_ENABLE	= 0;
	AES_BASE->CHIP_SELECT	= 1;
	uint32_t res 				= AES_BASE->ODATA;
	AES_BASE->CHIP_SELECT	= 0;
	return res;
}
void aes_128_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
	aes_write(0x0,AES_ADDR_KEY_BASE +7);
	aes_write(0x0,AES_ADDR_KEY_BASE +6);
	aes_write(0x0,AES_ADDR_KEY_BASE +5);
	aes_write(0x0,AES_ADDR_KEY_BASE +4);
	aes_write(key[3],AES_ADDR_KEY_BASE +3);
	aes_write(key[2],AES_ADDR_KEY_BASE +2);
	aes_write(key[1],AES_ADDR_KEY_BASE +1);
	aes_write(key[0],AES_ADDR_KEY_BASE);

	aes_write(AES_CONFIG_128_KEY,AES_ADDR_CONFIG);
	aes_write(AES_CTRL_INIT_KEY,AES_ADDR_CTRL);

    while(aes_read(AES_ADDR_STATUS) == 0);

    aes_write(block[3],AES_ADDR_BLOCK_BASE + 3);
    aes_write(block[2],AES_ADDR_BLOCK_BASE + 2);
    aes_write(block[1],AES_ADDR_BLOCK_BASE + 1);
    aes_write(block[0],AES_ADDR_BLOCK_BASE + 0);


    unsigned char AES_CONFIG = 0x00;
	if (operation == 0x01)
		AES_CONFIG = AES_CONFIG_128_EN;
	else
		AES_CONFIG = AES_CONFIG_128_DE;

	aes_write(AES_CONFIG,AES_ADDR_CONFIG);
    aes_write(AES_CTRL_START, AES_ADDR_CTRL);

    while(aes_read(AES_ADDR_STATUS) == 0);

    res[3] = aes_read(AES_ADDR_RESULT_BASE + 3);
    res[2] = aes_read(AES_ADDR_RESULT_BASE + 2);
    res[1] = aes_read(AES_ADDR_RESULT_BASE + 1);
    res[0] = aes_read(AES_ADDR_RESULT_BASE + 0);

    //print result to terminal
	if(operation == 0x1)
		print("\r\t============================AES128 ENCRYPTTION==============================\r\n");
	else
		print("\r\t============================AES128 DECRYPTTION==============================\r\n");
	print("\r\n");
	print128bit("\r\tPLAIN_TEXT (128-bit) : ", block);
	print128bit("KEY (128-bit) : ", key);
	print128bit("RESULT (128-bit) : ", res);
}

void aes_256_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
	aes_write(key[7],AES_ADDR_KEY_BASE +7);
	aes_write(key[6],AES_ADDR_KEY_BASE +6);
	aes_write(key[5],AES_ADDR_KEY_BASE +5);
	aes_write(key[4],AES_ADDR_KEY_BASE +4);
	aes_write(key[3],AES_ADDR_KEY_BASE +3);
	aes_write(key[2],AES_ADDR_KEY_BASE +2);
	aes_write(key[1],AES_ADDR_KEY_BASE +1);
	aes_write(key[0],AES_ADDR_KEY_BASE);

	aes_write(AES_CONFIG_256_KEY,AES_ADDR_CONFIG);
	aes_write(AES_CTRL_INIT_KEY,AES_ADDR_CTRL);

    while(aes_read(AES_ADDR_STATUS) == 0);

    aes_write(block[3],AES_ADDR_BLOCK_BASE + 3);
    aes_write(block[2],AES_ADDR_BLOCK_BASE + 2);
    aes_write(block[1],AES_ADDR_BLOCK_BASE + 1);
    aes_write(block[0],AES_ADDR_BLOCK_BASE + 0);


    unsigned char AES_CONFIG = 0x00;
	if (operation == 0x01)
		AES_CONFIG = AES_CONFIG_256_EN;
	else
		AES_CONFIG = AES_CONFIG_256_DE;

	aes_write(AES_CONFIG, AES_ADDR_CONFIG);
    aes_write(AES_CTRL_START, AES_ADDR_CTRL);

    while(aes_read(AES_ADDR_STATUS) == 0);

    res[3] = aes_read(AES_ADDR_RESULT_BASE + 3);
    res[2] = aes_read(AES_ADDR_RESULT_BASE + 2);
    res[1] = aes_read(AES_ADDR_RESULT_BASE + 1);
    res[0] = aes_read(AES_ADDR_RESULT_BASE + 0);

    //print result to terminal
	if(operation == 0x1)
		print("\r\t======================================AES256 ENCRYPTTION========================================\r\n");
	else
		print("\r\t======================================AES256 DECRYPTTION========================================\r\n");
	print("\r\n");
	print128bit("PLAIN_TEXT (128-bit) : ", block);
	print256bit("KEY (256-bit) : ", key);
	print128bit("RESULT (128-bit) : ", res);
	//print("\r\n================================================================================================\r\n");

}
