#ifndef MYROM_H_
#define MYROM_H_

typedef struct
{
  volatile uint32_t CHIP_SELECT;
  volatile uint32_t WRITE_N;
  volatile uint32_t READ_N;
  volatile uint32_t ADDRESS;
  volatile uint32_t IDATA;
  volatile uint32_t ODATA;
} myRom_Reg;

#endif /* GCD_H_ */
