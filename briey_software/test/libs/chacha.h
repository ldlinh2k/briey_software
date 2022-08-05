#ifndef CHACHA_H_
#define CHACHA_H_
	#define CHACHA_ADDR_CTRL         	0x08
	#define CTRL_INIT_BIT     			0x0
	#define CTRL_NEXT_BIT     			0x1

	#define CHACHA_ADDR_STATUS       	0x09
	#define STATUS_READY_BIT  0x0;

	#define CHACHA_ADDR_KEYLEN      	0x0a

	#define CHACHA_ADDR_ROUNDS       	0x0b

	#define CHACHA_ADDR_KEY_BASE        0x10//up to 0x17

	#define CHACHA_ADDR_BLOCK_BASE		0x20


	#define CHACHA_ADDR_RESULT_BASE  	0x80	//up to 0x8f

 	#define KEY_128_BITS  				0x0
 	#define KEY_256_BITS  				0x1

typedef struct
{
  volatile uint32_t CHIP_SELECT;
  volatile uint32_t WRITE_ENABLE;
  volatile uint32_t ADDRESS;
  volatile uint32_t IDATA;
  volatile uint32_t ODATA;
} Chacha_Reg;


#endif /* LIBS_CHACHA_H_ */
