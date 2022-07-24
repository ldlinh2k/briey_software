#include "briey.h"
void present_write(uint32_t iData, uint32_t iAddress)
{
	PRESENT_BASE->ADDRESS		= iAddress;
	PRESENT_BASE->WRITE_N 		= 0;
	PRESENT_BASE->READ_N 		= 1;
	PRESENT_BASE->IDATA			= iData;
	PRESENT_BASE->CHIP_SELECT_N	= 0;
	PRESENT_BASE->CHIP_SELECT_N	= 1;
}
uint32_t present_read(uint32_t iAddress)
{
	PRESENT_BASE->ADDRESS		= iAddress;
	PRESENT_BASE->READ_N		= 0;
	PRESENT_BASE->WRITE_N		= 1;
	PRESENT_BASE->CHIP_SELECT_N	= 0;
	uint32_t res 				= PRESENT_BASE->ODATA;
	PRESENT_BASE->CHIP_SELECT_N	= 1;
	return res;
}
void present_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {

	//EN_OR_DE
	if(operation == PRESENT_OP_EN) present_write(PRESENT_OP_EN,PRESENT_ADDR_EN_OR_DE);
	else present_write(PRESENT_OP_DE,PRESENT_ADDR_EN_OR_DE);

	//PLAIN_TEXT
	present_write(block[1],PRESENT_ADDR_BLOCK_BASE +1);
	present_write(block[0],PRESENT_ADDR_BLOCK_BASE);

	//KEY
	present_write(key[2],PRESENT_ADDR_KEY_BASE +2);
	present_write(key[1],PRESENT_ADDR_KEY_BASE +1);
	present_write(key[0],PRESENT_ADDR_KEY_BASE);

	//START
	present_write(0x1,PRESENT_ADDR_START);
    while(present_read(PRESENT_ADDR_RESULT_BASE) == 0);

    res[1] = present_read(PRESENT_ADDR_RESULT_BASE +1);
    res[0] =present_read(PRESENT_ADDR_RESULT_BASE);


    //print result to terminal
	if(operation == PRESENT_OP_EN)
		print("\r\t===========================PRESENT ENCRYPTTION==============================\r\n");
	else
		print("\r\t===========================PRESENT DECRYPTTION==============================\r\n");
	print("\r\n");
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
	print80bit("KEY (80-bit) : ", key);
	print64bit("RESULT (64-bit) : ", res);
	//print("\r\n============================================================================\r\n");
}
