#include "briey.h"
void poly_write(uint32_t iData, uint32_t iAddress)
{
	POLY_BASE->ADDRESS			= iAddress;
	POLY_BASE->WRITE_ENABLE 	= 1;
	POLY_BASE->IDATA			= iData;
	POLY_BASE->CHIP_SELECT		= 1;
	POLY_BASE->CHIP_SELECT		= 0;
}
uint32_t poly_read(uint32_t iAddress)
{
	POLY_BASE->ADDRESS		= iAddress;
	POLY_BASE->WRITE_ENABLE	= 0;
	POLY_BASE->CHIP_SELECT	= 1;
	uint32_t res 			= POLY_BASE->ODATA;
	POLY_BASE->CHIP_SELECT	= 0;
	return res;
}

//Init function:
//1. write 256-bit to key
//2. reset block
//3. write 1 to ctrl_reg
//4. wait ready
void poly_init(uint32_t *key)
{
	poly_write(key[7],POLY_ADDR_KEY_BASE);
	poly_write(key[6],POLY_ADDR_KEY_BASE + 1);
	poly_write(key[5],POLY_ADDR_KEY_BASE + 2);
	poly_write(key[4],POLY_ADDR_KEY_BASE + 3);
	poly_write(key[3],POLY_ADDR_KEY_BASE + 4);
	poly_write(key[2],POLY_ADDR_KEY_BASE + 5);
	poly_write(key[1],POLY_ADDR_KEY_BASE + 6);
	poly_write(key[0],POLY_ADDR_KEY_BASE + 7);

	poly_write(0x0,POLY_ADDR_BLOCK_BASE);
	poly_write(0x0,POLY_ADDR_BLOCK_BASE + 1);
	poly_write(0x0,POLY_ADDR_BLOCK_BASE + 2);
	poly_write(0x0,POLY_ADDR_BLOCK_BASE + 3);

	poly_write(CONST_INIT,POLY_ADDR_CTRL);
	while(poly_read(POLY_ADDR_STATUS)==0);
}

//write_block function:
//1. write data to block
//2. set number of bytes of block
//3. write 2 to ctrl_reg
//4. wait ready
void poly_write_block(uint32_t block_length,uint32_t *block)
{
	//16 bytes block input
	poly_write(block[3],POLY_ADDR_BLOCK_BASE);
	poly_write(block[2],POLY_ADDR_BLOCK_BASE + 1);
	poly_write(block[1],POLY_ADDR_BLOCK_BASE + 2);
	poly_write(block[0],POLY_ADDR_BLOCK_BASE + 3);

	//Set number of bytes
	poly_write(block_length,POLY_ADDR_BLOCKLEN);

	//write next to ctrl_reg
	poly_write(CONST_NEXT,POLY_ADDR_CTRL);

	//wait ready
	while(poly_read(POLY_ADDR_STATUS)==0);

}

//get_MAC (result) function:
//1.write 4 to ctrl_reg
//2.wait ready
void get_MAC(uint32_t *MAC)
{
	poly_write(CONST_FINISH,POLY_ADDR_CTRL);
	while(poly_read(POLY_ADDR_STATUS)==0);
	MAC[3] = poly_read(POLY_ADDR_RESULT_BASE);
	MAC[2] = poly_read(POLY_ADDR_RESULT_BASE + 1);
	MAC[1] = poly_read(POLY_ADDR_RESULT_BASE + 2);
	MAC[0] = poly_read(POLY_ADDR_RESULT_BASE + 3);
}
void poly_test_N_bytes(uint32_t block_length,uint32_t *key, uint32_t *block, uint32_t *res)
{

	poly_init(key);
	poly_write_block(block_length,block);
	get_MAC(res);

	print("\r\n");
	print128bit("\r\tPLAIN_TEXT (128-bit) : ", block);
	print256bit("KEY (256-bit): ", key);
	print128bit("RESULT (128-bit) : ", res);

}

void poly_test_rfc8439()
{
	//INPUT
	uint32_t rfc8439_key[8];
	uint32_t rfc8439_block2[4];
	uint32_t rfc8439_block1[4];
	uint32_t rfc8439_block0[4];

	rfc8439_key[7]= 0x85d6be78;
	rfc8439_key[6]= 0x57556d33;
	rfc8439_key[5]= 0x7f4452fe;
	rfc8439_key[4]= 0x42d506a8;
	rfc8439_key[3]= 0x0103808a;
	rfc8439_key[2]= 0xfb0db2fd;
	rfc8439_key[1]= 0x4abff6af;
	rfc8439_key[0]= 0x4149f51b;

	rfc8439_block2[3]= 0x43727970;
	rfc8439_block2[2]= 0x746f6772;
	rfc8439_block2[1]= 0x61706869;
	rfc8439_block2[0]= 0x6320466f;

	rfc8439_block1[3]= 0x72756d20;
	rfc8439_block1[2]= 0x52657365;
	rfc8439_block1[1]= 0x61726368;
	rfc8439_block1[0]= 0x2047726f;

	rfc8439_block0[3]= 0x75700000;
	rfc8439_block0[2]= 0x00000000;
	rfc8439_block0[1]= 0x00000000;
	rfc8439_block0[0]= 0x00000000;

	uint32_t rfc8439_res[4] = {0x00, 0x00, 0x00,0x00};

	//PROCESSING
	poly_init(rfc8439_key);
	poly_write_block(0x10,rfc8439_block2);
	poly_write_block(0x10,rfc8439_block1);
	poly_write_block(0x2,rfc8439_block0);

	//OUTPUT
	get_MAC(rfc8439_res);

	//print
	print128bit("\r\tPLAIN_TEXT (272-bit) : ", rfc8439_block2);
	print128bit("\r\t                       ", rfc8439_block1);
	print("\r\t                       ");
	print16bit(0x7570);
	print("\r\n");


	print256bit("KEY (256-bit): ", rfc8439_key);

	print128bit("RESULT (128-bit) : ", rfc8439_res);
}

void poly_test_long()
{
	uint32_t long_key[8];
	uint32_t long_block[4];
	uint32_t long_block_final[4];
	uint32_t long_res[4] = {0x00, 0x00, 0x00,0x00};

	long_key[7]= 0xf3000000;
	long_key[6]= 0x00000000;
	long_key[5]= 0x00000000;
	long_key[4]= 0x0000003f;
	long_key[3]= 0x3f000000;
	long_key[2]= 0x00000000;
	long_key[1]= 0x00000000;
	long_key[0]= 0x000000f3;

	long_block[3]= 0xffffffff;
	long_block[2]= 0xffffffff;
	long_block[1]= 0xffffffff;
	long_block[0]= 0xffffffff;

	long_block_final[3]= 0x01000000;
	long_block_final[2]= 0x00000000;
	long_block_final[1]= 0x00000000;
	long_block_final[0]= 0x00000000;

	//PROCESS
	poly_init(long_key);
	//write 64x128 bit block
	for(int i=0;i<64;i++)
	{
		poly_write_block(0x10,long_block);
	}
	//write final block
	poly_write_block(0x1,long_block_final);

	//get result
	get_MAC(long_res);

	//print
	print256bit("PLAIN_TEXT (8200-bit) : 0xff..ff01\r\n\tKEY (256-bit): ", long_key);
	print128bit("RESULT (128-bit) : ", long_res);

}
