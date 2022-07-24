#ifndef PRESENT_H_
#define PRESENT_H_
//-------------------PRESENT ADDRESS---------------
#define PRESENT_ADDR_START     		0x00	//start
#define PRESENT_ADDR_EN_OR_DE   	0x08	//0-->en, 1-->de
#define PRESENT_ADDR_KEY_BASE   	0x01
#define PRESENT_ADDR_BLOCK_BASE 	0x04
#define PRESENT_ADDR_RESULT_BASE 	0x06

#define PRESENT_OP_EN				0x0
#define PRESENT_OP_DE				0x1
typedef struct
{
  volatile uint32_t CHIP_SELECT_N;
  volatile uint32_t WRITE_N;
  volatile uint32_t READ_N;
  volatile uint32_t ADDRESS;
  volatile uint32_t IDATA;
  volatile uint32_t ODATA;
} Present_Reg;




#endif /*PRESENT_H_ */
