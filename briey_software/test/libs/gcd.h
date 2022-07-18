#ifndef GCD_H_
#define GCD_H_
#include <stdint.h>

typedef struct
{
  volatile uint32_t A;
  volatile uint32_t B;
  volatile uint32_t RES;
  volatile uint32_t READY;
  volatile uint32_t VALID;
} Gcd_Reg;
//uint32_t gcd(uint32_t a, uint32_t b);
#endif /* GCD_H_ */
