#include "briey.h"
void dm_present_write(uint32_t iData, uint32_t iAddress)
{
	DMPRESENT_BASE->ADDRESS			= iAddress;
	DMPRESENT_BASE->WRITE_N 		= 0;
	DMPRESENT_BASE->READ_N 			= 1;
	DMPRESENT_BASE->IDATA			= iData;
	DMPRESENT_BASE->CHIP_SELECT_N	= 0;
	DMPRESENT_BASE->CHIP_SELECT_N	= 1;
}
uint32_t dm_present_read(uint32_t iAddress)
{
	DMPRESENT_BASE->ADDRESS			= iAddress;
	DMPRESENT_BASE->READ_N			= 0;
	DMPRESENT_BASE->WRITE_N			= 1;
	DMPRESENT_BASE->CHIP_SELECT_N	= 0;
	uint32_t res 					= DMPRESENT_BASE->ODATA;
	DMPRESENT_BASE->CHIP_SELECT_N	= 1;
	return res;
}
void dm_present_hash(uint32_t *key, uint32_t *block, uint32_t *res) {

	//PLAIN_TEXT
	dm_present_write(block[1],PRESENT_ADDR_BLOCK_BASE +1);
	dm_present_write(block[0],PRESENT_ADDR_BLOCK_BASE);

	//KEY
	dm_present_write(key[2],PRESENT_ADDR_KEY_BASE +2);
	dm_present_write(key[1],PRESENT_ADDR_KEY_BASE +1);
	dm_present_write(key[0],PRESENT_ADDR_KEY_BASE);

	//START
	dm_present_write(0x1,PRESENT_ADDR_START);
    while(dm_present_read(PRESENT_ADDR_RESULT_BASE) == 0);

    res[1] = dm_present_read(PRESENT_ADDR_RESULT_BASE +1);
    res[0] = dm_present_read(PRESENT_ADDR_RESULT_BASE);


    //print result to terminal
	print("\r\t===========================DM_PRESENT HASH==================================\r\n");
	print("\r\n");
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
	print80bit("KEY (80-bit) : ", key);
	print64bit("RESULT (64-bit) : ", res);
	//print("\r\n============================================================================\r\n");
}
