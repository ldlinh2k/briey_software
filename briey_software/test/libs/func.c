//#include <briey.h>
////------------------------gcd------------------
//uint32_t gcd(uint32_t a, uint32_t b){
//	GCD->A = a;
//	GCD->B = b;
//	GCD->VALID = 0x00000001;
//	uint32_t rdyFlag = 0;
//	do{
//		rdyFlag = GCD->READY;
//	}while(!rdyFlag);
//	return GCD->RES;
//}
////---------------------------myRom----------------
//void avalon_write(uint32_t iData, uint32_t iAddress)
//{
//	MYROM->ADDRESS=iAddress;
//	MYROM->READ_N=1;
//	MYROM->WRITE_N=0;
//	MYROM->IDATA=iData;
//	MYROM->CHIP_SELECT=1;
//	MYROM->CHIP_SELECT=0;
//}
//
//uint32_t avalon_read(uint32_t iAddress)
//{
//	MYROM->ADDRESS=iAddress;
//	MYROM->READ_N=0;
//	MYROM->WRITE_N=1;
//	MYROM->CHIP_SELECT=1;
//	uint32_t res = MYROM->ODATA;
//	MYROM->CHIP_SELECT=0;
//	return res;
//}
////------------------------PRINCE-------------------
//void prince_write(uint32_t iData, uint32_t iAddress)
//{
//	PRINCE_BASE->ADDRESS=iAddress;
//	PRINCE_BASE->WRITE_ENABLE = 1;
//	PRINCE_BASE->IDATA=iData;
//	PRINCE_BASE->CHIP_SELECT=1;
//	PRINCE_BASE->CHIP_SELECT=0;
//}
//uint32_t prince_read(uint32_t iAddress)
//{
//	PRINCE_BASE->ADDRESS=iAddress;
//	PRINCE_BASE->WRITE_ENABLE=0;
//	PRINCE_BASE->CHIP_SELECT=1;
//	uint32_t res = PRINCE_BASE->ODATA;
//	PRINCE_BASE->CHIP_SELECT=0;
//	return res;
//}
