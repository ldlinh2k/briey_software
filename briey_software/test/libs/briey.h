/*
 * briey.h
 *
 *  Created on: Aug 24, 2016
 *      Author: clp
 */

#ifndef BRIEY_H_
#define BRIEY_H_

#include "timer.h"
#include "prescaler.h"
#include "interrupt.h"
#include "uart.h"
#include "vga.h"
#include "gpio.h"
#include "prince.h"
#include "present.h"
#include "dm_present.h"
#include "chacha.h"
#include "poly1305.h"

#define CORE_HZ 50000000

#define GPIO_A_BASE    	((Gpio_Reg*)(0xF0000000))
#define GPIO_B_BASE    	((Gpio_Reg*)(0xF0001000))
#define PRINCE_BASE 	((Prince_Reg*)(0xF0002000))
#define PRESENT_BASE  	((Present_Reg*)(0xF0002400))
#define DMPRESENT_BASE  ((DMPresent_Reg*)(0xF0002800))
#define CHACHA_BASE  	((Chacha_Reg*)(0xF0002C00))
#define POLY_BASE  		((Poly_Reg*)(0xF0003000))
#define UART      		((Uart_Reg*)(0xF0010000))
#define VGA_BASE      	((Vga_Reg*)(0xF0030000))


#define TIMER_PRESCALER ((Prescaler_Reg*)0xF0020000)
#define TIMER_INTERRUPT ((InterruptCtrl_Reg*)0xF0020010)
#define TIMER_A ((Timer_Reg*)0xF0020040)
#define TIMER_B ((Timer_Reg*)0xF0020050)
#define TIMER_C ((Timer_Reg*)0xF0020060)
#define TIMER_D ((Timer_Reg*)0xF0020070)

#define UART_SAMPLE_PER_BAUD 8


#endif /* BRIEY_H_ */
