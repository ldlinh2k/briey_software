#ifndef PRINCE_H_
#define PRINCE_H_
//-------------------PRINCE ADDRESS---------------
#define PRINCE_ADDR_KEY0        0x10
#define PRINCE_ADDR_KEY1        0x11
#define PRINCE_ADDR_KEY2        0x12
#define PRINCE_ADDR_KEY3        0x13

#define PRINCE_ADDR_BLOCK0      0x20
#define PRINCE_ADDR_BLOCK1      0x21

#define PRINCE_ADDR_RESULT0     0x30
#define PRINCE_ADDR_RESULT1     0x31

#define PRINCE_ADDR_CTRL        0x08
#define PRINCE_ADDR_STATUS      0x09
#define PRINCE_ADDR_CONFIG      0x0a

#define PRINCE_ADDR_NAME0       0x0
#define PRINCE_ADDR_NAME1       0x1
#define PRINCE_ADDR_VERSION     0x2

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

#endif /* PRINCE_H_ */
