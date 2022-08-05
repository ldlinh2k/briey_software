#ifndef DM_PRESENT_H_
#define DM_PRESENT_H_
//-------------------PRESENT ADDRESS---------------
#define DMPRESENT_ADDR_START     		0x00	//start
#define DMPRESENT_ADDR_KEY_BASE   	0x01
#define DMPRESENT_ADDR_BLOCK_BASE 	0x04
#define DMPRESENT_ADDR_RESULT_BASE 	0x06

typedef struct
{
  volatile uint32_t CHIP_SELECT_N;
  volatile uint32_t WRITE_N;
  volatile uint32_t READ_N;
  volatile uint32_t ADDRESS;
  volatile uint32_t IDATA;
  volatile uint32_t ODATA;
} DMPresent_Reg;




#endif /*DM_PRESENT_H_ */
