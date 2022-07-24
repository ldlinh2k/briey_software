#ifndef PRINCE_H_
#define PRINCE_H_
//-------------------PRINCE ADDRESS---------------
#define PRINCE_ADDR_KEY_BASE        0x10

#define PRINCE_ADDR_BLOCK_BASE      0x20


#define PRINCE_ADDR_RESULT_BASE     0x30

#define PRINCE_ADDR_CTRL        0x08
#define PRINCE_ADDR_STATUS      0x09
#define PRINCE_ADDR_CONFIG      0x0a

#define PRINCE_OP_EN            0x1
#define PRINCE_OP_DE            0x0

typedef struct
{
  volatile uint32_t CHIP_SELECT;
  volatile uint32_t WRITE_ENABLE;
  volatile uint32_t ADDRESS;
  volatile uint32_t IDATA;
  volatile uint32_t ODATA;
} Prince_Reg;

//function
void prince_write(uint32_t iData, uint32_t iAddress);
uint32_t prince_read(uint32_t iAddress);
void prince_cipher(uint32_t mode, uint32_t *key, uint32_t *block, uint32_t *res);
#endif /* PRINCE_H_ */
