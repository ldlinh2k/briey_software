#ifndef POLY1305_H_
#define POLY1305_H_
	#define POLY_ADDR_CTRL         		0x08

	#define POLY_ADDR_STATUS       		0x09

	#define POLY_ADDR_BLOCKLEN      	0x0a

	#define POLY_ADDR_KEY_BASE     		0x10	//256-bit

	#define POLY_ADDR_BLOCK_BASE       	0x20	//128-bit


	#define POLY_ADDR_RESULT_BASE  		0x30	//up to 0x33 //128bit

	#define CONST_INIT  				0x1
	#define CONST_NEXT  				0x2
	#define CONST_FINISH  				0x4
typedef struct
{
  volatile uint32_t CHIP_SELECT;
  volatile uint32_t WRITE_ENABLE;
  volatile uint32_t ADDRESS;
  volatile uint32_t IDATA;
  volatile uint32_t ODATA;
} Poly_Reg;





#endif /* LIBS_POLY1305_H_ */
