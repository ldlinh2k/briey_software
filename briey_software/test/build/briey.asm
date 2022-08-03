
build/briey.elf:     file format elf32-littleriscv


Disassembly of section .vector:

80000000 <crtStart>:
.global crtStart
.global main
.global irqCallback

crtStart:
  j crtInit
80000000:	0b40006f          	j	800000b4 <crtInit>
  nop
80000004:	00000013          	nop
  nop
80000008:	00000013          	nop
  nop
8000000c:	00000013          	nop
  nop
80000010:	00000013          	nop
  nop
80000014:	00000013          	nop
  nop
80000018:	00000013          	nop
  nop
8000001c:	00000013          	nop

80000020 <trap_entry>:

.global  trap_entry
trap_entry:
  sw x1,  - 1*4(sp)
80000020:	fe112e23          	sw	ra,-4(sp)
  sw x5,  - 2*4(sp)
80000024:	fe512c23          	sw	t0,-8(sp)
  sw x6,  - 3*4(sp)
80000028:	fe612a23          	sw	t1,-12(sp)
  sw x7,  - 4*4(sp)
8000002c:	fe712823          	sw	t2,-16(sp)
  sw x10, - 5*4(sp)
80000030:	fea12623          	sw	a0,-20(sp)
  sw x11, - 6*4(sp)
80000034:	feb12423          	sw	a1,-24(sp)
  sw x12, - 7*4(sp)
80000038:	fec12223          	sw	a2,-28(sp)
  sw x13, - 8*4(sp)
8000003c:	fed12023          	sw	a3,-32(sp)
  sw x14, - 9*4(sp)
80000040:	fce12e23          	sw	a4,-36(sp)
  sw x15, -10*4(sp)
80000044:	fcf12c23          	sw	a5,-40(sp)
  sw x16, -11*4(sp)
80000048:	fd012a23          	sw	a6,-44(sp)
  sw x17, -12*4(sp)
8000004c:	fd112823          	sw	a7,-48(sp)
  sw x28, -13*4(sp)
80000050:	fdc12623          	sw	t3,-52(sp)
  sw x29, -14*4(sp)
80000054:	fdd12423          	sw	t4,-56(sp)
  sw x30, -15*4(sp)
80000058:	fde12223          	sw	t5,-60(sp)
  sw x31, -16*4(sp)
8000005c:	fdf12023          	sw	t6,-64(sp)
  addi sp,sp,-16*4
80000060:	fc010113          	addi	sp,sp,-64
  call irqCallback
80000064:	c0001097          	auipc	ra,0xc0001
80000068:	ab0080e7          	jalr	-1360(ra) # 40000b14 <irqCallback>
  lw x1 , 15*4(sp)
8000006c:	03c12083          	lw	ra,60(sp)
  lw x5,  14*4(sp)
80000070:	03812283          	lw	t0,56(sp)
  lw x6,  13*4(sp)
80000074:	03412303          	lw	t1,52(sp)
  lw x7,  12*4(sp)
80000078:	03012383          	lw	t2,48(sp)
  lw x10, 11*4(sp)
8000007c:	02c12503          	lw	a0,44(sp)
  lw x11, 10*4(sp)
80000080:	02812583          	lw	a1,40(sp)
  lw x12,  9*4(sp)
80000084:	02412603          	lw	a2,36(sp)
  lw x13,  8*4(sp)
80000088:	02012683          	lw	a3,32(sp)
  lw x14,  7*4(sp)
8000008c:	01c12703          	lw	a4,28(sp)
  lw x15,  6*4(sp)
80000090:	01812783          	lw	a5,24(sp)
  lw x16,  5*4(sp)
80000094:	01412803          	lw	a6,20(sp)
  lw x17,  4*4(sp)
80000098:	01012883          	lw	a7,16(sp)
  lw x28,  3*4(sp)
8000009c:	00c12e03          	lw	t3,12(sp)
  lw x29,  2*4(sp)
800000a0:	00812e83          	lw	t4,8(sp)
  lw x30,  1*4(sp)
800000a4:	00412f03          	lw	t5,4(sp)
  lw x31,  0*4(sp)
800000a8:	00012f83          	lw	t6,0(sp)
  addi sp,sp,16*4
800000ac:	04010113          	addi	sp,sp,64
  mret
800000b0:	30200073          	mret

800000b4 <crtInit>:


crtInit:
  .option push
  .option norelax
  la gp, __global_pointer$
800000b4:	c0003197          	auipc	gp,0xc0003
800000b8:	fec18193          	addi	gp,gp,-20 # 400030a0 <__global_pointer$>
  .option pop
  la sp, _stack_start
800000bc:	00001117          	auipc	sp,0x1
800000c0:	88410113          	addi	sp,sp,-1916 # 80000940 <_stack_start>

800000c4 <bss_init>:

bss_init:
  la a0, _bss_start
800000c4:	c0002517          	auipc	a0,0xc0002
800000c8:	7dc50513          	addi	a0,a0,2012 # 400028a0 <_bss_end>
  la a1, _bss_end
800000cc:	c0002597          	auipc	a1,0xc0002
800000d0:	7d458593          	addi	a1,a1,2004 # 400028a0 <_bss_end>

800000d4 <bss_loop>:
bss_loop:
  beq a0,a1,bss_done
800000d4:	00b50863          	beq	a0,a1,800000e4 <bss_done>
  sw zero,0(a0)
800000d8:	00052023          	sw	zero,0(a0)
  add a0,a0,4
800000dc:	00450513          	addi	a0,a0,4
  j bss_loop
800000e0:	ff5ff06f          	j	800000d4 <bss_loop>

800000e4 <bss_done>:
bss_done:

ctors_init:
  la a0, _ctors_start
800000e4:	c0002517          	auipc	a0,0xc0002
800000e8:	7b850513          	addi	a0,a0,1976 # 4000289c <_ctors_end>
  addi sp,sp,-4
800000ec:	ffc10113          	addi	sp,sp,-4

800000f0 <ctors_loop>:
ctors_loop:
  la a1, _ctors_end
800000f0:	c0002597          	auipc	a1,0xc0002
800000f4:	7ac58593          	addi	a1,a1,1964 # 4000289c <_ctors_end>
  beq a0,a1,ctors_done
800000f8:	00b50e63          	beq	a0,a1,80000114 <ctors_done>
  lw a3,0(a0)
800000fc:	00052683          	lw	a3,0(a0)
  add a0,a0,4
80000100:	00450513          	addi	a0,a0,4
  sw a0,0(sp)
80000104:	00a12023          	sw	a0,0(sp)
  jalr  a3
80000108:	000680e7          	jalr	a3
  lw a0,0(sp)
8000010c:	00012503          	lw	a0,0(sp)
  j ctors_loop
80000110:	fe1ff06f          	j	800000f0 <ctors_loop>

80000114 <ctors_done>:
ctors_done:
  addi sp,sp,4
80000114:	00410113          	addi	sp,sp,4


  li a0, 0x880     //880 enable timer + external interrupts
80000118:	00001537          	lui	a0,0x1
8000011c:	88050513          	addi	a0,a0,-1920 # 880 <_stack_size+0x80>
  csrw mie,a0
80000120:	30451073          	csrw	mie,a0
  li a0, 0x1808     //1808 enable interrupts
80000124:	00002537          	lui	a0,0x2
80000128:	80850513          	addi	a0,a0,-2040 # 1808 <_stack_size+0x1008>
  csrw mstatus,a0
8000012c:	30051073          	csrw	mstatus,a0

  call main
80000130:	c0000097          	auipc	ra,0xc0000
80000134:	57c080e7          	jalr	1404(ra) # 400006ac <main>

80000138 <infinitLoop>:
infinitLoop:
  j infinitLoop
80000138:	0000006f          	j	80000138 <infinitLoop>

Disassembly of section .memory:

40000000 <timer_init>:
  volatile uint32_t CLEARS_TICKS;
  volatile uint32_t LIMIT;
  volatile uint32_t VALUE;
} Timer_Reg;

static void timer_init(Timer_Reg *reg){
40000000:	fe010113          	addi	sp,sp,-32
40000004:	00812e23          	sw	s0,28(sp)
40000008:	02010413          	addi	s0,sp,32
4000000c:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000010:	fec42783          	lw	a5,-20(s0)
40000014:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000018:	fec42783          	lw	a5,-20(s0)
4000001c:	0007a423          	sw	zero,8(a5)
}
40000020:	00000013          	nop
40000024:	01c12403          	lw	s0,28(sp)
40000028:	02010113          	addi	sp,sp,32
4000002c:	00008067          	ret

40000030 <prescaler_init>:
typedef struct
{
  volatile uint32_t LIMIT;
} Prescaler_Reg;

static void prescaler_init(Prescaler_Reg* reg){
40000030:	fe010113          	addi	sp,sp,-32
40000034:	00812e23          	sw	s0,28(sp)
40000038:	02010413          	addi	s0,sp,32
4000003c:	fea42623          	sw	a0,-20(s0)

}
40000040:	00000013          	nop
40000044:	01c12403          	lw	s0,28(sp)
40000048:	02010113          	addi	sp,sp,32
4000004c:	00008067          	ret

40000050 <interruptCtrl_init>:
{
  volatile uint32_t PENDINGS;
  volatile uint32_t MASKS;
} InterruptCtrl_Reg;

static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40000050:	fe010113          	addi	sp,sp,-32
40000054:	00812e23          	sw	s0,28(sp)
40000058:	02010413          	addi	s0,sp,32
4000005c:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40000060:	fec42783          	lw	a5,-20(s0)
40000064:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40000068:	fec42783          	lw	a5,-20(s0)
4000006c:	fff00713          	li	a4,-1
40000070:	00e7a023          	sw	a4,0(a5)
}
40000074:	00000013          	nop
40000078:	01c12403          	lw	s0,28(sp)
4000007c:	02010113          	addi	sp,sp,32
40000080:	00008067          	ret

40000084 <uart_writeAvailability>:
	enum UartParity parity;
	enum UartStop stop;
	uint32_t clockDivider;
} Uart_Config;

static uint32_t uart_writeAvailability(Uart_Reg *reg){
40000084:	fe010113          	addi	sp,sp,-32
40000088:	00812e23          	sw	s0,28(sp)
4000008c:	02010413          	addi	s0,sp,32
40000090:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000094:	fec42783          	lw	a5,-20(s0)
40000098:	0047a783          	lw	a5,4(a5)
4000009c:	0107d793          	srli	a5,a5,0x10
400000a0:	0ff7f793          	zext.b	a5,a5
}
400000a4:	00078513          	mv	a0,a5
400000a8:	01c12403          	lw	s0,28(sp)
400000ac:	02010113          	addi	sp,sp,32
400000b0:	00008067          	ret

400000b4 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
400000b4:	fe010113          	addi	sp,sp,-32
400000b8:	00812e23          	sw	s0,28(sp)
400000bc:	02010413          	addi	s0,sp,32
400000c0:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
400000c4:	fec42783          	lw	a5,-20(s0)
400000c8:	0047a783          	lw	a5,4(a5)
400000cc:	0187d793          	srli	a5,a5,0x18
}
400000d0:	00078513          	mv	a0,a5
400000d4:	01c12403          	lw	s0,28(sp)
400000d8:	02010113          	addi	sp,sp,32
400000dc:	00008067          	ret

400000e0 <uart_write>:

static void uart_write(Uart_Reg *reg, uint32_t data){
400000e0:	fe010113          	addi	sp,sp,-32
400000e4:	00112e23          	sw	ra,28(sp)
400000e8:	00812c23          	sw	s0,24(sp)
400000ec:	02010413          	addi	s0,sp,32
400000f0:	fea42623          	sw	a0,-20(s0)
400000f4:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
400000f8:	00000013          	nop
400000fc:	fec42503          	lw	a0,-20(s0)
40000100:	f85ff0ef          	jal	ra,40000084 <uart_writeAvailability>
40000104:	00050793          	mv	a5,a0
40000108:	fe078ae3          	beqz	a5,400000fc <uart_write+0x1c>
	reg->DATA = data;
4000010c:	fec42783          	lw	a5,-20(s0)
40000110:	fe842703          	lw	a4,-24(s0)
40000114:	00e7a023          	sw	a4,0(a5)
}
40000118:	00000013          	nop
4000011c:	01c12083          	lw	ra,28(sp)
40000120:	01812403          	lw	s0,24(sp)
40000124:	02010113          	addi	sp,sp,32
40000128:	00008067          	ret

4000012c <uart_applyConfig>:

static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
4000012c:	fe010113          	addi	sp,sp,-32
40000130:	00812e23          	sw	s0,28(sp)
40000134:	02010413          	addi	s0,sp,32
40000138:	fea42623          	sw	a0,-20(s0)
4000013c:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40000140:	fe842783          	lw	a5,-24(s0)
40000144:	00c7a703          	lw	a4,12(a5)
40000148:	fec42783          	lw	a5,-20(s0)
4000014c:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40000150:	fe842783          	lw	a5,-24(s0)
40000154:	0007a783          	lw	a5,0(a5)
40000158:	fff78713          	addi	a4,a5,-1
4000015c:	fe842783          	lw	a5,-24(s0)
40000160:	0047a783          	lw	a5,4(a5)
40000164:	00879793          	slli	a5,a5,0x8
40000168:	00f76733          	or	a4,a4,a5
4000016c:	fe842783          	lw	a5,-24(s0)
40000170:	0087a783          	lw	a5,8(a5)
40000174:	01079793          	slli	a5,a5,0x10
40000178:	00f76733          	or	a4,a4,a5
4000017c:	fec42783          	lw	a5,-20(s0)
40000180:	00e7a623          	sw	a4,12(a5)
}
40000184:	00000013          	nop
40000188:	01c12403          	lw	s0,28(sp)
4000018c:	02010113          	addi	sp,sp,32
40000190:	00008067          	ret

40000194 <vga_isBusy>:
  volatile uint32_t  FRAME_BASE;
  volatile uint32_t  DUMMY0[13];
  volatile Vga_Timing TIMING;
} Vga_Reg;

static uint32_t vga_isBusy(Vga_Reg *reg){
40000194:	fe010113          	addi	sp,sp,-32
40000198:	00812e23          	sw	s0,28(sp)
4000019c:	02010413          	addi	s0,sp,32
400001a0:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
400001a4:	fec42783          	lw	a5,-20(s0)
400001a8:	0007a783          	lw	a5,0(a5)
400001ac:	0027f793          	andi	a5,a5,2
400001b0:	00f037b3          	snez	a5,a5
400001b4:	0ff7f793          	zext.b	a5,a5
}
400001b8:	00078513          	mv	a0,a5
400001bc:	01c12403          	lw	s0,28(sp)
400001c0:	02010113          	addi	sp,sp,32
400001c4:	00008067          	ret

400001c8 <vga_run>:

static void vga_run(Vga_Reg *reg){
400001c8:	fe010113          	addi	sp,sp,-32
400001cc:	00812e23          	sw	s0,28(sp)
400001d0:	02010413          	addi	s0,sp,32
400001d4:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
400001d8:	fec42783          	lw	a5,-20(s0)
400001dc:	00100713          	li	a4,1
400001e0:	00e7a023          	sw	a4,0(a5)
}
400001e4:	00000013          	nop
400001e8:	01c12403          	lw	s0,28(sp)
400001ec:	02010113          	addi	sp,sp,32
400001f0:	00008067          	ret

400001f4 <vga_stop>:

static void vga_stop(Vga_Reg *reg){
400001f4:	fe010113          	addi	sp,sp,-32
400001f8:	00112e23          	sw	ra,28(sp)
400001fc:	00812c23          	sw	s0,24(sp)
40000200:	02010413          	addi	s0,sp,32
40000204:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40000208:	fec42783          	lw	a5,-20(s0)
4000020c:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40000210:	00000013          	nop
40000214:	fec42503          	lw	a0,-20(s0)
40000218:	f7dff0ef          	jal	ra,40000194 <vga_isBusy>
4000021c:	00050793          	mv	a5,a0
40000220:	fe079ae3          	bnez	a5,40000214 <vga_stop+0x20>
}
40000224:	00000013          	nop
40000228:	00000013          	nop
4000022c:	01c12083          	lw	ra,28(sp)
40000230:	01812403          	lw	s0,24(sp)
40000234:	02010113          	addi	sp,sp,32
40000238:	00008067          	ret

4000023c <prince_write>:
#include "briey.h"
void prince_write(uint32_t iData, uint32_t iAddress)
{
4000023c:	fe010113          	addi	sp,sp,-32
40000240:	00812e23          	sw	s0,28(sp)
40000244:	02010413          	addi	s0,sp,32
40000248:	fea42623          	sw	a0,-20(s0)
4000024c:	feb42423          	sw	a1,-24(s0)
	PRINCE_BASE->ADDRESS		= iAddress;
40000250:	f00027b7          	lui	a5,0xf0002
40000254:	fe842703          	lw	a4,-24(s0)
40000258:	00e7a423          	sw	a4,8(a5) # f0002008 <_stack_start+0x700016c8>
	PRINCE_BASE->WRITE_ENABLE 	= 1;
4000025c:	f00027b7          	lui	a5,0xf0002
40000260:	00100713          	li	a4,1
40000264:	00e7a223          	sw	a4,4(a5) # f0002004 <_stack_start+0x700016c4>
	PRINCE_BASE->IDATA			= iData;
40000268:	f00027b7          	lui	a5,0xf0002
4000026c:	fec42703          	lw	a4,-20(s0)
40000270:	00e7a623          	sw	a4,12(a5) # f000200c <_stack_start+0x700016cc>
	PRINCE_BASE->CHIP_SELECT	= 1;
40000274:	f00027b7          	lui	a5,0xf0002
40000278:	00100713          	li	a4,1
4000027c:	00e7a023          	sw	a4,0(a5) # f0002000 <_stack_start+0x700016c0>
	PRINCE_BASE->CHIP_SELECT	= 0;
40000280:	f00027b7          	lui	a5,0xf0002
40000284:	0007a023          	sw	zero,0(a5) # f0002000 <_stack_start+0x700016c0>
}
40000288:	00000013          	nop
4000028c:	01c12403          	lw	s0,28(sp)
40000290:	02010113          	addi	sp,sp,32
40000294:	00008067          	ret

40000298 <prince_read>:
uint32_t prince_read(uint32_t iAddress)
{
40000298:	fd010113          	addi	sp,sp,-48
4000029c:	02812623          	sw	s0,44(sp)
400002a0:	03010413          	addi	s0,sp,48
400002a4:	fca42e23          	sw	a0,-36(s0)
	PRINCE_BASE->ADDRESS		= iAddress;
400002a8:	f00027b7          	lui	a5,0xf0002
400002ac:	fdc42703          	lw	a4,-36(s0)
400002b0:	00e7a423          	sw	a4,8(a5) # f0002008 <_stack_start+0x700016c8>
	PRINCE_BASE->WRITE_ENABLE	= 0;
400002b4:	f00027b7          	lui	a5,0xf0002
400002b8:	0007a223          	sw	zero,4(a5) # f0002004 <_stack_start+0x700016c4>
	PRINCE_BASE->CHIP_SELECT	= 1;
400002bc:	f00027b7          	lui	a5,0xf0002
400002c0:	00100713          	li	a4,1
400002c4:	00e7a023          	sw	a4,0(a5) # f0002000 <_stack_start+0x700016c0>
	uint32_t res 				= PRINCE_BASE->ODATA;
400002c8:	f00027b7          	lui	a5,0xf0002
400002cc:	0107a783          	lw	a5,16(a5) # f0002010 <_stack_start+0x700016d0>
400002d0:	fef42623          	sw	a5,-20(s0)
	PRINCE_BASE->CHIP_SELECT	= 0;
400002d4:	f00027b7          	lui	a5,0xf0002
400002d8:	0007a023          	sw	zero,0(a5) # f0002000 <_stack_start+0x700016c0>
	return res;
400002dc:	fec42783          	lw	a5,-20(s0)
}
400002e0:	00078513          	mv	a0,a5
400002e4:	02c12403          	lw	s0,44(sp)
400002e8:	03010113          	addi	sp,sp,48
400002ec:	00008067          	ret

400002f0 <prince_cipher>:

void prince_cipher(uint32_t mode, uint32_t *key, uint32_t *block, uint32_t *res)
{
400002f0:	fe010113          	addi	sp,sp,-32
400002f4:	00112e23          	sw	ra,28(sp)
400002f8:	00812c23          	sw	s0,24(sp)
400002fc:	00912a23          	sw	s1,20(sp)
40000300:	02010413          	addi	s0,sp,32
40000304:	fea42623          	sw	a0,-20(s0)
40000308:	feb42423          	sw	a1,-24(s0)
4000030c:	fec42223          	sw	a2,-28(s0)
40000310:	fed42023          	sw	a3,-32(s0)
		//EN-OR-DE---
		prince_write(mode,PRINCE_ADDR_CONFIG);
40000314:	00a00593          	li	a1,10
40000318:	fec42503          	lw	a0,-20(s0)
4000031c:	f21ff0ef          	jal	ra,4000023c <prince_write>

		//BLOCK----
		prince_write(block[1],PRINCE_ADDR_BLOCK_BASE +1);
40000320:	fe442783          	lw	a5,-28(s0)
40000324:	00478793          	addi	a5,a5,4
40000328:	0007a783          	lw	a5,0(a5)
4000032c:	02100593          	li	a1,33
40000330:	00078513          	mv	a0,a5
40000334:	f09ff0ef          	jal	ra,4000023c <prince_write>
		prince_write(block[0],PRINCE_ADDR_BLOCK_BASE);
40000338:	fe442783          	lw	a5,-28(s0)
4000033c:	0007a783          	lw	a5,0(a5)
40000340:	02000593          	li	a1,32
40000344:	00078513          	mv	a0,a5
40000348:	ef5ff0ef          	jal	ra,4000023c <prince_write>

		//KEY----

		prince_write(key[3],PRINCE_ADDR_KEY_BASE +3);
4000034c:	fe842783          	lw	a5,-24(s0)
40000350:	00c78793          	addi	a5,a5,12
40000354:	0007a783          	lw	a5,0(a5)
40000358:	01300593          	li	a1,19
4000035c:	00078513          	mv	a0,a5
40000360:	eddff0ef          	jal	ra,4000023c <prince_write>
		prince_write(key[2],PRINCE_ADDR_KEY_BASE +2);
40000364:	fe842783          	lw	a5,-24(s0)
40000368:	00878793          	addi	a5,a5,8
4000036c:	0007a783          	lw	a5,0(a5)
40000370:	01200593          	li	a1,18
40000374:	00078513          	mv	a0,a5
40000378:	ec5ff0ef          	jal	ra,4000023c <prince_write>
		prince_write(key[1],PRINCE_ADDR_KEY_BASE +1);
4000037c:	fe842783          	lw	a5,-24(s0)
40000380:	00478793          	addi	a5,a5,4
40000384:	0007a783          	lw	a5,0(a5)
40000388:	01100593          	li	a1,17
4000038c:	00078513          	mv	a0,a5
40000390:	eadff0ef          	jal	ra,4000023c <prince_write>
		prince_write(key[0],PRINCE_ADDR_KEY_BASE);
40000394:	fe842783          	lw	a5,-24(s0)
40000398:	0007a783          	lw	a5,0(a5)
4000039c:	01000593          	li	a1,16
400003a0:	00078513          	mv	a0,a5
400003a4:	e99ff0ef          	jal	ra,4000023c <prince_write>

		//START----
		prince_write(0x1,PRINCE_ADDR_CTRL);
400003a8:	00800593          	li	a1,8
400003ac:	00100513          	li	a0,1
400003b0:	e8dff0ef          	jal	ra,4000023c <prince_write>

		//wait result----
		while(prince_read(PRINCE_ADDR_STATUS)==0);
400003b4:	00000013          	nop
400003b8:	00900513          	li	a0,9
400003bc:	eddff0ef          	jal	ra,40000298 <prince_read>
400003c0:	00050793          	mv	a5,a0
400003c4:	fe078ae3          	beqz	a5,400003b8 <prince_cipher+0xc8>
		res[1] = prince_read(PRINCE_ADDR_RESULT_BASE +1);
400003c8:	fe042783          	lw	a5,-32(s0)
400003cc:	00478493          	addi	s1,a5,4
400003d0:	03100513          	li	a0,49
400003d4:	ec5ff0ef          	jal	ra,40000298 <prince_read>
400003d8:	00050793          	mv	a5,a0
400003dc:	00f4a023          	sw	a5,0(s1)
		res[0] = prince_read(PRINCE_ADDR_RESULT_BASE);
400003e0:	03000513          	li	a0,48
400003e4:	eb5ff0ef          	jal	ra,40000298 <prince_read>
400003e8:	00050713          	mv	a4,a0
400003ec:	fe042783          	lw	a5,-32(s0)
400003f0:	00e7a023          	sw	a4,0(a5)

		//print result to terminal
		if(mode == PRINCE_OP_EN)
400003f4:	fec42703          	lw	a4,-20(s0)
400003f8:	00100793          	li	a5,1
400003fc:	00f71a63          	bne	a4,a5,40000410 <prince_cipher+0x120>
			print("\r\t=============================PRINCE ENCRYPTTION=============================\r\n");
40000400:	400027b7          	lui	a5,0x40002
40000404:	f7078513          	addi	a0,a5,-144 # 40001f70 <vga_simRes_h160_v120+0x20>
40000408:	62c010ef          	jal	ra,40001a34 <print>
4000040c:	0100006f          	j	4000041c <prince_cipher+0x12c>
		else
			print("\r\t=============================PRINCE DECRYPTTION=============================\r\n");
40000410:	400027b7          	lui	a5,0x40002
40000414:	fc478513          	addi	a0,a5,-60 # 40001fc4 <vga_simRes_h160_v120+0x74>
40000418:	61c010ef          	jal	ra,40001a34 <print>
		print("\r\n");
4000041c:	400027b7          	lui	a5,0x40002
40000420:	01878513          	addi	a0,a5,24 # 40002018 <vga_simRes_h160_v120+0xc8>
40000424:	610010ef          	jal	ra,40001a34 <print>
		print64bit("PLAIN_TEXT (64-bit) : ", block);
40000428:	fe442583          	lw	a1,-28(s0)
4000042c:	400027b7          	lui	a5,0x40002
40000430:	01c78513          	addi	a0,a5,28 # 4000201c <vga_simRes_h160_v120+0xcc>
40000434:	069010ef          	jal	ra,40001c9c <print64bit>
		print128bit("KEY (128-bit) : ", key);
40000438:	fe842583          	lw	a1,-24(s0)
4000043c:	400027b7          	lui	a5,0x40002
40000440:	03478513          	addi	a0,a5,52 # 40002034 <vga_simRes_h160_v120+0xe4>
40000444:	0c9010ef          	jal	ra,40001d0c <print128bit>
		print64bit("RESULT (64-bit) : ", res);
40000448:	fe042583          	lw	a1,-32(s0)
4000044c:	400027b7          	lui	a5,0x40002
40000450:	04878513          	addi	a0,a5,72 # 40002048 <vga_simRes_h160_v120+0xf8>
40000454:	049010ef          	jal	ra,40001c9c <print64bit>
		//print("\r\n============================================================================\r\n");

}
40000458:	00000013          	nop
4000045c:	01c12083          	lw	ra,28(sp)
40000460:	01812403          	lw	s0,24(sp)
40000464:	01412483          	lw	s1,20(sp)
40000468:	02010113          	addi	sp,sp,32
4000046c:	00008067          	ret

40000470 <timer_init>:
static void timer_init(Timer_Reg *reg){
40000470:	fe010113          	addi	sp,sp,-32
40000474:	00812e23          	sw	s0,28(sp)
40000478:	02010413          	addi	s0,sp,32
4000047c:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000480:	fec42783          	lw	a5,-20(s0)
40000484:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000488:	fec42783          	lw	a5,-20(s0)
4000048c:	0007a423          	sw	zero,8(a5)
}
40000490:	00000013          	nop
40000494:	01c12403          	lw	s0,28(sp)
40000498:	02010113          	addi	sp,sp,32
4000049c:	00008067          	ret

400004a0 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
400004a0:	fe010113          	addi	sp,sp,-32
400004a4:	00812e23          	sw	s0,28(sp)
400004a8:	02010413          	addi	s0,sp,32
400004ac:	fea42623          	sw	a0,-20(s0)
}
400004b0:	00000013          	nop
400004b4:	01c12403          	lw	s0,28(sp)
400004b8:	02010113          	addi	sp,sp,32
400004bc:	00008067          	ret

400004c0 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
400004c0:	fe010113          	addi	sp,sp,-32
400004c4:	00812e23          	sw	s0,28(sp)
400004c8:	02010413          	addi	s0,sp,32
400004cc:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
400004d0:	fec42783          	lw	a5,-20(s0)
400004d4:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
400004d8:	fec42783          	lw	a5,-20(s0)
400004dc:	fff00713          	li	a4,-1
400004e0:	00e7a023          	sw	a4,0(a5)
}
400004e4:	00000013          	nop
400004e8:	01c12403          	lw	s0,28(sp)
400004ec:	02010113          	addi	sp,sp,32
400004f0:	00008067          	ret

400004f4 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
400004f4:	fe010113          	addi	sp,sp,-32
400004f8:	00812e23          	sw	s0,28(sp)
400004fc:	02010413          	addi	s0,sp,32
40000500:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000504:	fec42783          	lw	a5,-20(s0)
40000508:	0047a783          	lw	a5,4(a5)
4000050c:	0107d793          	srli	a5,a5,0x10
40000510:	0ff7f793          	zext.b	a5,a5
}
40000514:	00078513          	mv	a0,a5
40000518:	01c12403          	lw	s0,28(sp)
4000051c:	02010113          	addi	sp,sp,32
40000520:	00008067          	ret

40000524 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40000524:	fe010113          	addi	sp,sp,-32
40000528:	00812e23          	sw	s0,28(sp)
4000052c:	02010413          	addi	s0,sp,32
40000530:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40000534:	fec42783          	lw	a5,-20(s0)
40000538:	0047a783          	lw	a5,4(a5)
4000053c:	0187d793          	srli	a5,a5,0x18
}
40000540:	00078513          	mv	a0,a5
40000544:	01c12403          	lw	s0,28(sp)
40000548:	02010113          	addi	sp,sp,32
4000054c:	00008067          	ret

40000550 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40000550:	fe010113          	addi	sp,sp,-32
40000554:	00112e23          	sw	ra,28(sp)
40000558:	00812c23          	sw	s0,24(sp)
4000055c:	02010413          	addi	s0,sp,32
40000560:	fea42623          	sw	a0,-20(s0)
40000564:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40000568:	00000013          	nop
4000056c:	fec42503          	lw	a0,-20(s0)
40000570:	f85ff0ef          	jal	ra,400004f4 <uart_writeAvailability>
40000574:	00050793          	mv	a5,a0
40000578:	fe078ae3          	beqz	a5,4000056c <uart_write+0x1c>
	reg->DATA = data;
4000057c:	fec42783          	lw	a5,-20(s0)
40000580:	fe842703          	lw	a4,-24(s0)
40000584:	00e7a023          	sw	a4,0(a5)
}
40000588:	00000013          	nop
4000058c:	01c12083          	lw	ra,28(sp)
40000590:	01812403          	lw	s0,24(sp)
40000594:	02010113          	addi	sp,sp,32
40000598:	00008067          	ret

4000059c <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
4000059c:	fe010113          	addi	sp,sp,-32
400005a0:	00812e23          	sw	s0,28(sp)
400005a4:	02010413          	addi	s0,sp,32
400005a8:	fea42623          	sw	a0,-20(s0)
400005ac:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
400005b0:	fe842783          	lw	a5,-24(s0)
400005b4:	00c7a703          	lw	a4,12(a5)
400005b8:	fec42783          	lw	a5,-20(s0)
400005bc:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
400005c0:	fe842783          	lw	a5,-24(s0)
400005c4:	0007a783          	lw	a5,0(a5)
400005c8:	fff78713          	addi	a4,a5,-1
400005cc:	fe842783          	lw	a5,-24(s0)
400005d0:	0047a783          	lw	a5,4(a5)
400005d4:	00879793          	slli	a5,a5,0x8
400005d8:	00f76733          	or	a4,a4,a5
400005dc:	fe842783          	lw	a5,-24(s0)
400005e0:	0087a783          	lw	a5,8(a5)
400005e4:	01079793          	slli	a5,a5,0x10
400005e8:	00f76733          	or	a4,a4,a5
400005ec:	fec42783          	lw	a5,-20(s0)
400005f0:	00e7a623          	sw	a4,12(a5)
}
400005f4:	00000013          	nop
400005f8:	01c12403          	lw	s0,28(sp)
400005fc:	02010113          	addi	sp,sp,32
40000600:	00008067          	ret

40000604 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40000604:	fe010113          	addi	sp,sp,-32
40000608:	00812e23          	sw	s0,28(sp)
4000060c:	02010413          	addi	s0,sp,32
40000610:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40000614:	fec42783          	lw	a5,-20(s0)
40000618:	0007a783          	lw	a5,0(a5)
4000061c:	0027f793          	andi	a5,a5,2
40000620:	00f037b3          	snez	a5,a5
40000624:	0ff7f793          	zext.b	a5,a5
}
40000628:	00078513          	mv	a0,a5
4000062c:	01c12403          	lw	s0,28(sp)
40000630:	02010113          	addi	sp,sp,32
40000634:	00008067          	ret

40000638 <vga_run>:
static void vga_run(Vga_Reg *reg){
40000638:	fe010113          	addi	sp,sp,-32
4000063c:	00812e23          	sw	s0,28(sp)
40000640:	02010413          	addi	s0,sp,32
40000644:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40000648:	fec42783          	lw	a5,-20(s0)
4000064c:	00100713          	li	a4,1
40000650:	00e7a023          	sw	a4,0(a5)
}
40000654:	00000013          	nop
40000658:	01c12403          	lw	s0,28(sp)
4000065c:	02010113          	addi	sp,sp,32
40000660:	00008067          	ret

40000664 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40000664:	fe010113          	addi	sp,sp,-32
40000668:	00112e23          	sw	ra,28(sp)
4000066c:	00812c23          	sw	s0,24(sp)
40000670:	02010413          	addi	s0,sp,32
40000674:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40000678:	fec42783          	lw	a5,-20(s0)
4000067c:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40000680:	00000013          	nop
40000684:	fec42503          	lw	a0,-20(s0)
40000688:	f7dff0ef          	jal	ra,40000604 <vga_isBusy>
4000068c:	00050793          	mv	a5,a0
40000690:	fe079ae3          	bnez	a5,40000684 <vga_stop+0x20>
}
40000694:	00000013          	nop
40000698:	00000013          	nop
4000069c:	01c12083          	lw	ra,28(sp)
400006a0:	01812403          	lw	s0,24(sp)
400006a4:	02010113          	addi	sp,sp,32
400006a8:	00008067          	ret

400006ac <main>:
#include <stdint.h>
#include <stdlib.h>
#include <briey.h>


int main() {
400006ac:	f5010113          	addi	sp,sp,-176
400006b0:	0a112623          	sw	ra,172(sp)
400006b4:	0a812423          	sw	s0,168(sp)
400006b8:	0b010413          	addi	s0,sp,176
	Uart_Config uartConfig;
	uartConfig.dataLength = 8;
400006bc:	00800793          	li	a5,8
400006c0:	fef42023          	sw	a5,-32(s0)
	uartConfig.parity = NONE;
400006c4:	fe042223          	sw	zero,-28(s0)
	uartConfig.stop = ONE;
400006c8:	fe042423          	sw	zero,-24(s0)
	uartConfig.clockDivider = (CORE_HZ / 8 / 115200) - 1;
400006cc:	03500793          	li	a5,53
400006d0:	fef42623          	sw	a5,-20(s0)
	uart_applyConfig(UART,&uartConfig);
400006d4:	fe040793          	addi	a5,s0,-32
400006d8:	00078593          	mv	a1,a5
400006dc:	f0010537          	lui	a0,0xf0010
400006e0:	ebdff0ef          	jal	ra,4000059c <uart_applyConfig>

	print("\r\t**********************************PRINCE TEST*******************************\r\n");
400006e4:	400027b7          	lui	a5,0x40002
400006e8:	0bc78513          	addi	a0,a5,188 # 400020bc <vga_simRes_h160_v120+0x20>
400006ec:	348010ef          	jal	ra,40001a34 <print>
	uint32_t prince_key[4] 		= {0x0, 0x0, 0x0, 0x0};
400006f0:	fc042823          	sw	zero,-48(s0)
400006f4:	fc042a23          	sw	zero,-44(s0)
400006f8:	fc042c23          	sw	zero,-40(s0)
400006fc:	fc042e23          	sw	zero,-36(s0)
	uint32_t prince_block[2] 		= {0x0, 0x0};
40000700:	fc042423          	sw	zero,-56(s0)
40000704:	fc042623          	sw	zero,-52(s0)
	uint32_t prince_res[2] 	= {0x0,0x0};
40000708:	fc042023          	sw	zero,-64(s0)
4000070c:	fc042223          	sw	zero,-60(s0)
	print("\r\n\t===================================TEST 1===================================\r\n");
40000710:	400027b7          	lui	a5,0x40002
40000714:	11078513          	addi	a0,a5,272 # 40002110 <vga_simRes_h160_v120+0x74>
40000718:	31c010ef          	jal	ra,40001a34 <print>

	prince_block[1] 	= 0x69c4e0d8;
4000071c:	69c4e7b7          	lui	a5,0x69c4e
40000720:	0d878793          	addi	a5,a5,216 # 69c4e0d8 <__global_pointer$+0x29c4b038>
40000724:	fcf42623          	sw	a5,-52(s0)
	prince_block[0] 	= 0x6a7b0430;
40000728:	6a7b07b7          	lui	a5,0x6a7b0
4000072c:	43078793          	addi	a5,a5,1072 # 6a7b0430 <__global_pointer$+0x2a7ad390>
40000730:	fcf42423          	sw	a5,-56(s0)

	prince_key[3]		= 0xd8cdb780;
40000734:	d8cdb7b7          	lui	a5,0xd8cdb
40000738:	78078793          	addi	a5,a5,1920 # d8cdb780 <_stack_start+0x58cdae40>
4000073c:	fcf42e23          	sw	a5,-36(s0)
	prince_key[2]		= 0x70b4c55a;
40000740:	70b4c7b7          	lui	a5,0x70b4c
40000744:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b494ba>
40000748:	fcf42c23          	sw	a5,-40(s0)
	prince_key[1]		= 0x818665aa;
4000074c:	818667b7          	lui	a5,0x81866
40000750:	5aa78793          	addi	a5,a5,1450 # 818665aa <_stack_start+0x1865c6a>
40000754:	fcf42a23          	sw	a5,-44(s0)
	prince_key[0]		= 0x0d02dfda;
40000758:	0d02e7b7          	lui	a5,0xd02e
4000075c:	fda78793          	addi	a5,a5,-38 # d02dfda <_stack_size+0xd02d7da>
40000760:	fcf42823          	sw	a5,-48(s0)

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
40000764:	fc040693          	addi	a3,s0,-64
40000768:	fc840713          	addi	a4,s0,-56
4000076c:	fd040793          	addi	a5,s0,-48
40000770:	00070613          	mv	a2,a4
40000774:	00078593          	mv	a1,a5
40000778:	00100513          	li	a0,1
4000077c:	b75ff0ef          	jal	ra,400002f0 <prince_cipher>

	print("\r\n\t===================================TEST 2===================================\r\n");
40000780:	400027b7          	lui	a5,0x40002
40000784:	16478513          	addi	a0,a5,356 # 40002164 <vga_simRes_h160_v120+0xc8>
40000788:	2ac010ef          	jal	ra,40001a34 <print>

	prince_block[1] 	= 0x43c6b256;
4000078c:	43c6b7b7          	lui	a5,0x43c6b
40000790:	25678793          	addi	a5,a5,598 # 43c6b256 <__global_pointer$+0x3c681b6>
40000794:	fcf42623          	sw	a5,-52(s0)
	prince_block[0] 	= 0xd79de7e8;
40000798:	d79de7b7          	lui	a5,0xd79de
4000079c:	7e878793          	addi	a5,a5,2024 # d79de7e8 <_stack_start+0x579ddea8>
400007a0:	fcf42423          	sw	a5,-56(s0)

	//USE THE SAME KEY



	prince_cipher(PRINCE_OP_DE,prince_key,prince_block,prince_res);
400007a4:	fc040693          	addi	a3,s0,-64
400007a8:	fc840713          	addi	a4,s0,-56
400007ac:	fd040793          	addi	a5,s0,-48
400007b0:	00070613          	mv	a2,a4
400007b4:	00078593          	mv	a1,a5
400007b8:	00000513          	li	a0,0
400007bc:	b35ff0ef          	jal	ra,400002f0 <prince_cipher>
	//
	//	//USE THE SAME KEY
	//
	//	prince_cipher(PRINCE_OP_DE,prince_key,prince_block,prince_res);

	print("\r\n");
400007c0:	400027b7          	lui	a5,0x40002
400007c4:	1b878513          	addi	a0,a5,440 # 400021b8 <vga_simRes_h160_v120+0x11c>
400007c8:	26c010ef          	jal	ra,40001a34 <print>
	print("\r\t*********************************AES TEST***********************************\r\n");
400007cc:	400027b7          	lui	a5,0x40002
400007d0:	1bc78513          	addi	a0,a5,444 # 400021bc <vga_simRes_h160_v120+0x120>
400007d4:	260010ef          	jal	ra,40001a34 <print>
    unsigned int aes_key_128[4] = {0x0, 0x0, 0x0, 0x0};
400007d8:	fa042823          	sw	zero,-80(s0)
400007dc:	fa042a23          	sw	zero,-76(s0)
400007e0:	fa042c23          	sw	zero,-72(s0)
400007e4:	fa042e23          	sw	zero,-68(s0)
    unsigned int aes_block[4] 	= {0x0, 0x0, 0x0, 0x0};
400007e8:	fa042023          	sw	zero,-96(s0)
400007ec:	fa042223          	sw	zero,-92(s0)
400007f0:	fa042423          	sw	zero,-88(s0)
400007f4:	fa042623          	sw	zero,-84(s0)

    unsigned int aes_res[4] 	= {0x0, 0x0, 0x0, 0x0};
400007f8:	f8042823          	sw	zero,-112(s0)
400007fc:	f8042a23          	sw	zero,-108(s0)
40000800:	f8042c23          	sw	zero,-104(s0)
40000804:	f8042e23          	sw	zero,-100(s0)

    print("\r\n\t=================================TEST 1=====================================\r\n");
40000808:	400027b7          	lui	a5,0x40002
4000080c:	21078513          	addi	a0,a5,528 # 40002210 <vga_simRes_h160_v120+0x174>
40000810:	224010ef          	jal	ra,40001a34 <print>

    aes_block[3] 	= 0x33343536;
40000814:	333437b7          	lui	a5,0x33343
40000818:	53678793          	addi	a5,a5,1334 # 33343536 <_stack_size+0x33342d36>
4000081c:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0x39303132;
40000820:	393037b7          	lui	a5,0x39303
40000824:	13278793          	addi	a5,a5,306 # 39303132 <_stack_size+0x39302932>
40000828:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x35363738;
4000082c:	353637b7          	lui	a5,0x35363
40000830:	73878793          	addi	a5,a5,1848 # 35363738 <_stack_size+0x35362f38>
40000834:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x31323334;
40000838:	313237b7          	lui	a5,0x31323
4000083c:	33478793          	addi	a5,a5,820 # 31323334 <_stack_size+0x31322b34>
40000840:	faf42023          	sw	a5,-96(s0)

	aes_key_128[3] 	= 0x37363534;
40000844:	373637b7          	lui	a5,0x37363
40000848:	53478793          	addi	a5,a5,1332 # 37363534 <_stack_size+0x37362d34>
4000084c:	faf42e23          	sw	a5,-68(s0)
    aes_key_128[2] 	= 0x31303938;
40000850:	313047b7          	lui	a5,0x31304
40000854:	93878793          	addi	a5,a5,-1736 # 31303938 <_stack_size+0x31303138>
40000858:	faf42c23          	sw	a5,-72(s0)
    aes_key_128[1] 	= 0x35343332;
4000085c:	353437b7          	lui	a5,0x35343
40000860:	33278793          	addi	a5,a5,818 # 35343332 <_stack_size+0x35342b32>
40000864:	faf42a23          	sw	a5,-76(s0)
    aes_key_128[0]	= 0x39383736;
40000868:	393837b7          	lui	a5,0x39383
4000086c:	73678793          	addi	a5,a5,1846 # 39383736 <_stack_size+0x39382f36>
40000870:	faf42823          	sw	a5,-80(s0)

   	aes_128_cipher(AES_OP_EN, aes_key_128, aes_block, aes_res);
40000874:	f9040693          	addi	a3,s0,-112
40000878:	fa040713          	addi	a4,s0,-96
4000087c:	fb040793          	addi	a5,s0,-80
40000880:	00070613          	mv	a2,a4
40000884:	00078593          	mv	a1,a5
40000888:	00100513          	li	a0,1
4000088c:	271000ef          	jal	ra,400012fc <aes_128_cipher>

   	print("\r\n\t=================================TEST 2=====================================\r\n");
40000890:	400027b7          	lui	a5,0x40002
40000894:	26478513          	addi	a0,a5,612 # 40002264 <vga_simRes_h160_v120+0x1c8>
40000898:	19c010ef          	jal	ra,40001a34 <print>

    aes_block[3] 	= 0xa1e33d0b;
4000089c:	a1e347b7          	lui	a5,0xa1e34
400008a0:	d0b78793          	addi	a5,a5,-757 # a1e33d0b <_stack_start+0x21e333cb>
400008a4:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0xd07781b2;
400008a8:	d07787b7          	lui	a5,0xd0778
400008ac:	1b278793          	addi	a5,a5,434 # d07781b2 <_stack_start+0x50777872>
400008b0:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x53e5f4da;
400008b4:	53e5f7b7          	lui	a5,0x53e5f
400008b8:	4da78793          	addi	a5,a5,1242 # 53e5f4da <__global_pointer$+0x13e5c43a>
400008bc:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x6f2f5312;
400008c0:	6f2f57b7          	lui	a5,0x6f2f5
400008c4:	31278793          	addi	a5,a5,786 # 6f2f5312 <__global_pointer$+0x2f2f2272>
400008c8:	faf42023          	sw	a5,-96(s0)

    //USE THE SAME KEY

   	aes_128_cipher(AES_OP_DE, aes_key_128, aes_block, aes_res);
400008cc:	f9040693          	addi	a3,s0,-112
400008d0:	fa040713          	addi	a4,s0,-96
400008d4:	fb040793          	addi	a5,s0,-80
400008d8:	00070613          	mv	a2,a4
400008dc:	00078593          	mv	a1,a5
400008e0:	00000513          	li	a0,0
400008e4:	219000ef          	jal	ra,400012fc <aes_128_cipher>
//    //USE THE SAME KEY
//
//   	aes_128_cipher(AES_OP_DE, aes_key_128, aes_block, aes_res);


   	print("\r\n\t========================================TEST 1(AES256)==========================================\r\n");
400008e8:	400027b7          	lui	a5,0x40002
400008ec:	2b878513          	addi	a0,a5,696 # 400022b8 <vga_simRes_h160_v120+0x21c>
400008f0:	144010ef          	jal	ra,40001a34 <print>
    unsigned int aes_key_256[8] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
400008f4:	f6042823          	sw	zero,-144(s0)
400008f8:	f6042a23          	sw	zero,-140(s0)
400008fc:	f6042c23          	sw	zero,-136(s0)
40000900:	f6042e23          	sw	zero,-132(s0)
40000904:	f8042023          	sw	zero,-128(s0)
40000908:	f8042223          	sw	zero,-124(s0)
4000090c:	f8042423          	sw	zero,-120(s0)
40000910:	f8042623          	sw	zero,-116(s0)

    aes_block[3] 	= 0x7393172a;
40000914:	739317b7          	lui	a5,0x73931
40000918:	72a78793          	addi	a5,a5,1834 # 7393172a <__global_pointer$+0x3392e68a>
4000091c:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0xe93d7e11;
40000920:	e93d87b7          	lui	a5,0xe93d8
40000924:	e1178793          	addi	a5,a5,-495 # e93d7e11 <_stack_start+0x693d74d1>
40000928:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x2e409f96;
4000092c:	2e40a7b7          	lui	a5,0x2e40a
40000930:	f9678793          	addi	a5,a5,-106 # 2e409f96 <_stack_size+0x2e409796>
40000934:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x6bc1bee2;
40000938:	6bc1c7b7          	lui	a5,0x6bc1c
4000093c:	ee278793          	addi	a5,a5,-286 # 6bc1bee2 <__global_pointer$+0x2bc18e42>
40000940:	faf42023          	sw	a5,-96(s0)

    aes_key_256[7] 	= 0x0914dff4;
40000944:	0914e7b7          	lui	a5,0x914e
40000948:	ff478793          	addi	a5,a5,-12 # 914dff4 <_stack_size+0x914d7f4>
4000094c:	f8f42623          	sw	a5,-116(s0)
    aes_key_256[6] 	= 0x2d9810a3;
40000950:	2d9817b7          	lui	a5,0x2d981
40000954:	0a378793          	addi	a5,a5,163 # 2d9810a3 <_stack_size+0x2d9808a3>
40000958:	f8f42423          	sw	a5,-120(s0)
    aes_key_256[5] 	= 0x3b6108d7;
4000095c:	3b6117b7          	lui	a5,0x3b611
40000960:	8d778793          	addi	a5,a5,-1833 # 3b6108d7 <_stack_size+0x3b6100d7>
40000964:	f8f42223          	sw	a5,-124(s0)
    aes_key_256[4]	= 0x1f352c07;
40000968:	1f3537b7          	lui	a5,0x1f353
4000096c:	c0778793          	addi	a5,a5,-1017 # 1f352c07 <_stack_size+0x1f352407>
40000970:	f8f42023          	sw	a5,-128(s0)
    aes_key_256[3] 	= 0x857d7781;
40000974:	857d77b7          	lui	a5,0x857d7
40000978:	78178793          	addi	a5,a5,1921 # 857d7781 <_stack_start+0x57d6e41>
4000097c:	f6f42e23          	sw	a5,-132(s0)
    aes_key_256[2] 	= 0x2b73aef0;
40000980:	2b73b7b7          	lui	a5,0x2b73b
40000984:	ef078793          	addi	a5,a5,-272 # 2b73aef0 <_stack_size+0x2b73a6f0>
40000988:	f6f42c23          	sw	a5,-136(s0)
    aes_key_256[1] 	= 0x15ca71be;
4000098c:	15ca77b7          	lui	a5,0x15ca7
40000990:	1be78793          	addi	a5,a5,446 # 15ca71be <_stack_size+0x15ca69be>
40000994:	f6f42a23          	sw	a5,-140(s0)
    aes_key_256[0]	= 0x603deb10;
40000998:	603df7b7          	lui	a5,0x603df
4000099c:	b1078793          	addi	a5,a5,-1264 # 603deb10 <__global_pointer$+0x203dba70>
400009a0:	f6f42823          	sw	a5,-144(s0)

    aes_256_cipher(AES_OP_EN, aes_key_256, aes_block, aes_res);
400009a4:	f9040693          	addi	a3,s0,-112
400009a8:	fa040713          	addi	a4,s0,-96
400009ac:	f7040793          	addi	a5,s0,-144
400009b0:	00070613          	mv	a2,a4
400009b4:	00078593          	mv	a1,a5
400009b8:	00100513          	li	a0,1
400009bc:	3a5000ef          	jal	ra,40001560 <aes_256_cipher>


   	print("\r\n\t========================================TEST 2(AES256)==========================================\r\n");
400009c0:	400027b7          	lui	a5,0x40002
400009c4:	32078513          	addi	a0,a5,800 # 40002320 <vga_simRes_h160_v120+0x284>
400009c8:	06c010ef          	jal	ra,40001a34 <print>
    aes_block[3] 	= 0x3db181f8 ;
400009cc:	3db187b7          	lui	a5,0x3db18
400009d0:	1f878793          	addi	a5,a5,504 # 3db181f8 <_stack_size+0x3db179f8>
400009d4:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0x064b5a7e ;
400009d8:	064b67b7          	lui	a5,0x64b6
400009dc:	a7e78793          	addi	a5,a5,-1410 # 64b5a7e <_stack_size+0x64b527e>
400009e0:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0xb5d2a03c;
400009e4:	b5d2a7b7          	lui	a5,0xb5d2a
400009e8:	03c78793          	addi	a5,a5,60 # b5d2a03c <_stack_start+0x35d296fc>
400009ec:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0xf3eed1bd;
400009f0:	f3eed7b7          	lui	a5,0xf3eed
400009f4:	1bd78793          	addi	a5,a5,445 # f3eed1bd <_stack_start+0x73eec87d>
400009f8:	faf42023          	sw	a5,-96(s0)

    //USE THE SAME KEY

    aes_256_cipher(AES_OP_DE, aes_key_256, aes_block, aes_res);
400009fc:	f9040693          	addi	a3,s0,-112
40000a00:	fa040713          	addi	a4,s0,-96
40000a04:	f7040793          	addi	a5,s0,-144
40000a08:	00070613          	mv	a2,a4
40000a0c:	00078593          	mv	a1,a5
40000a10:	00000513          	li	a0,0
40000a14:	34d000ef          	jal	ra,40001560 <aes_256_cipher>

	print("\r\n");
40000a18:	400027b7          	lui	a5,0x40002
40000a1c:	1b878513          	addi	a0,a5,440 # 400021b8 <vga_simRes_h160_v120+0x11c>
40000a20:	014010ef          	jal	ra,40001a34 <print>
		print("\r\t******************************PRESENT TEST**********************************\r\n");
40000a24:	400027b7          	lui	a5,0x40002
40000a28:	38878513          	addi	a0,a5,904 # 40002388 <vga_simRes_h160_v120+0x2ec>
40000a2c:	008010ef          	jal	ra,40001a34 <print>
		unsigned int present_key[3] = {0x0, 0x0, 0x0};
40000a30:	f6042223          	sw	zero,-156(s0)
40000a34:	f6042423          	sw	zero,-152(s0)
40000a38:	f6042623          	sw	zero,-148(s0)
		unsigned int present_block[2] 	= {0x0, 0x0};
40000a3c:	f4042e23          	sw	zero,-164(s0)
40000a40:	f6042023          	sw	zero,-160(s0)
		unsigned int present_res[2] 	= {0x0, 0x0};
40000a44:	f4042a23          	sw	zero,-172(s0)
40000a48:	f4042c23          	sw	zero,-168(s0)

		print("\r\n\t==================================TEST 1====================================\r\n");
40000a4c:	400027b7          	lui	a5,0x40002
40000a50:	3dc78513          	addi	a0,a5,988 # 400023dc <vga_simRes_h160_v120+0x340>
40000a54:	7e1000ef          	jal	ra,40001a34 <print>

		present_block[1]=0x4c746e67;
40000a58:	4c7477b7          	lui	a5,0x4c747
40000a5c:	e6778793          	addi	a5,a5,-409 # 4c746e67 <__global_pointer$+0xc743dc7>
40000a60:	f6f42023          	sw	a5,-160(s0)
		present_block[0]=0x7579656e;
40000a64:	757967b7          	lui	a5,0x75796
40000a68:	56e78793          	addi	a5,a5,1390 # 7579656e <__global_pointer$+0x357934ce>
40000a6c:	f4f42e23          	sw	a5,-164(s0)

		present_key[2] = 0x46657465;
40000a70:	466577b7          	lui	a5,0x46657
40000a74:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x66543c5>
40000a78:	f6f42623          	sw	a5,-148(s0)
		present_key[1] = 0x6c48636d;
40000a7c:	6c4867b7          	lui	a5,0x6c486
40000a80:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c4832cd>
40000a84:	f6f42423          	sw	a5,-152(s0)
		present_key[0] = 0x7573;
40000a88:	000077b7          	lui	a5,0x7
40000a8c:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
40000a90:	f6f42223          	sw	a5,-156(s0)

		present_cipher(PRESENT_OP_EN,present_key,present_block,present_res);
40000a94:	f5440693          	addi	a3,s0,-172
40000a98:	f5c40713          	addi	a4,s0,-164
40000a9c:	f6440793          	addi	a5,s0,-156
40000aa0:	00070613          	mv	a2,a4
40000aa4:	00078593          	mv	a1,a5
40000aa8:	00000513          	li	a0,0
40000aac:	3b8000ef          	jal	ra,40000e64 <present_cipher>

		print("\r\n\t==================================TEST 2====================================\r\n");
40000ab0:	400027b7          	lui	a5,0x40002
40000ab4:	43078513          	addi	a0,a5,1072 # 40002430 <vga_simRes_h160_v120+0x394>
40000ab8:	77d000ef          	jal	ra,40001a34 <print>

		present_block[1]=0x0e1d00d4;
40000abc:	0e1d07b7          	lui	a5,0xe1d0
40000ac0:	0d478793          	addi	a5,a5,212 # e1d00d4 <_stack_size+0xe1cf8d4>
40000ac4:	f6f42023          	sw	a5,-160(s0)
		present_block[0]=0xe46ba99c;
40000ac8:	e46bb7b7          	lui	a5,0xe46bb
40000acc:	99c78793          	addi	a5,a5,-1636 # e46ba99c <_stack_start+0x646ba05c>
40000ad0:	f4f42e23          	sw	a5,-164(s0)

		//USE THE SAME KEY

		present_cipher(PRESENT_OP_DE,present_key,present_block,present_res);
40000ad4:	f5440693          	addi	a3,s0,-172
40000ad8:	f5c40713          	addi	a4,s0,-164
40000adc:	f6440793          	addi	a5,s0,-156
40000ae0:	00070613          	mv	a2,a4
40000ae4:	00078593          	mv	a1,a5
40000ae8:	00100513          	li	a0,1
40000aec:	378000ef          	jal	ra,40000e64 <present_cipher>
//		present_block[0]=0xb0b1c9b4;
//
//		//USE THE SAME KEY
//
//		present_cipher(PRESENT_OP_DE,present_key,present_block,present_res);
		print("\r\n");
40000af0:	400027b7          	lui	a5,0x40002
40000af4:	1b878513          	addi	a0,a5,440 # 400021b8 <vga_simRes_h160_v120+0x11c>
40000af8:	73d000ef          	jal	ra,40001a34 <print>
	return 0;	
40000afc:	00000793          	li	a5,0
}
40000b00:	00078513          	mv	a0,a5
40000b04:	0ac12083          	lw	ra,172(sp)
40000b08:	0a812403          	lw	s0,168(sp)
40000b0c:	0b010113          	addi	sp,sp,176
40000b10:	00008067          	ret

40000b14 <irqCallback>:
void irqCallback(){
40000b14:	ff010113          	addi	sp,sp,-16
40000b18:	00812623          	sw	s0,12(sp)
40000b1c:	01010413          	addi	s0,sp,16

}
40000b20:	00000013          	nop
40000b24:	00c12403          	lw	s0,12(sp)
40000b28:	01010113          	addi	sp,sp,16
40000b2c:	00008067          	ret

40000b30 <timer_init>:
static void timer_init(Timer_Reg *reg){
40000b30:	fe010113          	addi	sp,sp,-32
40000b34:	00812e23          	sw	s0,28(sp)
40000b38:	02010413          	addi	s0,sp,32
40000b3c:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000b40:	fec42783          	lw	a5,-20(s0)
40000b44:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000b48:	fec42783          	lw	a5,-20(s0)
40000b4c:	0007a423          	sw	zero,8(a5)
}
40000b50:	00000013          	nop
40000b54:	01c12403          	lw	s0,28(sp)
40000b58:	02010113          	addi	sp,sp,32
40000b5c:	00008067          	ret

40000b60 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40000b60:	fe010113          	addi	sp,sp,-32
40000b64:	00812e23          	sw	s0,28(sp)
40000b68:	02010413          	addi	s0,sp,32
40000b6c:	fea42623          	sw	a0,-20(s0)
}
40000b70:	00000013          	nop
40000b74:	01c12403          	lw	s0,28(sp)
40000b78:	02010113          	addi	sp,sp,32
40000b7c:	00008067          	ret

40000b80 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40000b80:	fe010113          	addi	sp,sp,-32
40000b84:	00812e23          	sw	s0,28(sp)
40000b88:	02010413          	addi	s0,sp,32
40000b8c:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40000b90:	fec42783          	lw	a5,-20(s0)
40000b94:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40000b98:	fec42783          	lw	a5,-20(s0)
40000b9c:	fff00713          	li	a4,-1
40000ba0:	00e7a023          	sw	a4,0(a5)
}
40000ba4:	00000013          	nop
40000ba8:	01c12403          	lw	s0,28(sp)
40000bac:	02010113          	addi	sp,sp,32
40000bb0:	00008067          	ret

40000bb4 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40000bb4:	fe010113          	addi	sp,sp,-32
40000bb8:	00812e23          	sw	s0,28(sp)
40000bbc:	02010413          	addi	s0,sp,32
40000bc0:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000bc4:	fec42783          	lw	a5,-20(s0)
40000bc8:	0047a783          	lw	a5,4(a5)
40000bcc:	0107d793          	srli	a5,a5,0x10
40000bd0:	0ff7f793          	zext.b	a5,a5
}
40000bd4:	00078513          	mv	a0,a5
40000bd8:	01c12403          	lw	s0,28(sp)
40000bdc:	02010113          	addi	sp,sp,32
40000be0:	00008067          	ret

40000be4 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40000be4:	fe010113          	addi	sp,sp,-32
40000be8:	00812e23          	sw	s0,28(sp)
40000bec:	02010413          	addi	s0,sp,32
40000bf0:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40000bf4:	fec42783          	lw	a5,-20(s0)
40000bf8:	0047a783          	lw	a5,4(a5)
40000bfc:	0187d793          	srli	a5,a5,0x18
}
40000c00:	00078513          	mv	a0,a5
40000c04:	01c12403          	lw	s0,28(sp)
40000c08:	02010113          	addi	sp,sp,32
40000c0c:	00008067          	ret

40000c10 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40000c10:	fe010113          	addi	sp,sp,-32
40000c14:	00112e23          	sw	ra,28(sp)
40000c18:	00812c23          	sw	s0,24(sp)
40000c1c:	02010413          	addi	s0,sp,32
40000c20:	fea42623          	sw	a0,-20(s0)
40000c24:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40000c28:	00000013          	nop
40000c2c:	fec42503          	lw	a0,-20(s0)
40000c30:	f85ff0ef          	jal	ra,40000bb4 <uart_writeAvailability>
40000c34:	00050793          	mv	a5,a0
40000c38:	fe078ae3          	beqz	a5,40000c2c <uart_write+0x1c>
	reg->DATA = data;
40000c3c:	fec42783          	lw	a5,-20(s0)
40000c40:	fe842703          	lw	a4,-24(s0)
40000c44:	00e7a023          	sw	a4,0(a5)
}
40000c48:	00000013          	nop
40000c4c:	01c12083          	lw	ra,28(sp)
40000c50:	01812403          	lw	s0,24(sp)
40000c54:	02010113          	addi	sp,sp,32
40000c58:	00008067          	ret

40000c5c <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40000c5c:	fe010113          	addi	sp,sp,-32
40000c60:	00812e23          	sw	s0,28(sp)
40000c64:	02010413          	addi	s0,sp,32
40000c68:	fea42623          	sw	a0,-20(s0)
40000c6c:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40000c70:	fe842783          	lw	a5,-24(s0)
40000c74:	00c7a703          	lw	a4,12(a5)
40000c78:	fec42783          	lw	a5,-20(s0)
40000c7c:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40000c80:	fe842783          	lw	a5,-24(s0)
40000c84:	0007a783          	lw	a5,0(a5)
40000c88:	fff78713          	addi	a4,a5,-1
40000c8c:	fe842783          	lw	a5,-24(s0)
40000c90:	0047a783          	lw	a5,4(a5)
40000c94:	00879793          	slli	a5,a5,0x8
40000c98:	00f76733          	or	a4,a4,a5
40000c9c:	fe842783          	lw	a5,-24(s0)
40000ca0:	0087a783          	lw	a5,8(a5)
40000ca4:	01079793          	slli	a5,a5,0x10
40000ca8:	00f76733          	or	a4,a4,a5
40000cac:	fec42783          	lw	a5,-20(s0)
40000cb0:	00e7a623          	sw	a4,12(a5)
}
40000cb4:	00000013          	nop
40000cb8:	01c12403          	lw	s0,28(sp)
40000cbc:	02010113          	addi	sp,sp,32
40000cc0:	00008067          	ret

40000cc4 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40000cc4:	fe010113          	addi	sp,sp,-32
40000cc8:	00812e23          	sw	s0,28(sp)
40000ccc:	02010413          	addi	s0,sp,32
40000cd0:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40000cd4:	fec42783          	lw	a5,-20(s0)
40000cd8:	0007a783          	lw	a5,0(a5)
40000cdc:	0027f793          	andi	a5,a5,2
40000ce0:	00f037b3          	snez	a5,a5
40000ce4:	0ff7f793          	zext.b	a5,a5
}
40000ce8:	00078513          	mv	a0,a5
40000cec:	01c12403          	lw	s0,28(sp)
40000cf0:	02010113          	addi	sp,sp,32
40000cf4:	00008067          	ret

40000cf8 <vga_run>:
static void vga_run(Vga_Reg *reg){
40000cf8:	fe010113          	addi	sp,sp,-32
40000cfc:	00812e23          	sw	s0,28(sp)
40000d00:	02010413          	addi	s0,sp,32
40000d04:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40000d08:	fec42783          	lw	a5,-20(s0)
40000d0c:	00100713          	li	a4,1
40000d10:	00e7a023          	sw	a4,0(a5)
}
40000d14:	00000013          	nop
40000d18:	01c12403          	lw	s0,28(sp)
40000d1c:	02010113          	addi	sp,sp,32
40000d20:	00008067          	ret

40000d24 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40000d24:	fe010113          	addi	sp,sp,-32
40000d28:	00112e23          	sw	ra,28(sp)
40000d2c:	00812c23          	sw	s0,24(sp)
40000d30:	02010413          	addi	s0,sp,32
40000d34:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40000d38:	fec42783          	lw	a5,-20(s0)
40000d3c:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40000d40:	00000013          	nop
40000d44:	fec42503          	lw	a0,-20(s0)
40000d48:	f7dff0ef          	jal	ra,40000cc4 <vga_isBusy>
40000d4c:	00050793          	mv	a5,a0
40000d50:	fe079ae3          	bnez	a5,40000d44 <vga_stop+0x20>
}
40000d54:	00000013          	nop
40000d58:	00000013          	nop
40000d5c:	01c12083          	lw	ra,28(sp)
40000d60:	01812403          	lw	s0,24(sp)
40000d64:	02010113          	addi	sp,sp,32
40000d68:	00008067          	ret

40000d6c <present_write>:
#include "briey.h"
void present_write(uint32_t iData, uint32_t iAddress)
{
40000d6c:	fe010113          	addi	sp,sp,-32
40000d70:	00812e23          	sw	s0,28(sp)
40000d74:	02010413          	addi	s0,sp,32
40000d78:	fea42623          	sw	a0,-20(s0)
40000d7c:	feb42423          	sw	a1,-24(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
40000d80:	f00037b7          	lui	a5,0xf0003
40000d84:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000d88:	fe842703          	lw	a4,-24(s0)
40000d8c:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->WRITE_N 		= 0;
40000d90:	f00037b7          	lui	a5,0xf0003
40000d94:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000d98:	0007a223          	sw	zero,4(a5)
	PRESENT_BASE->READ_N 		= 1;
40000d9c:	f00037b7          	lui	a5,0xf0003
40000da0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000da4:	00100713          	li	a4,1
40000da8:	00e7a423          	sw	a4,8(a5)
	PRESENT_BASE->IDATA			= iData;
40000dac:	f00037b7          	lui	a5,0xf0003
40000db0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000db4:	fec42703          	lw	a4,-20(s0)
40000db8:	00e7a823          	sw	a4,16(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
40000dbc:	f00037b7          	lui	a5,0xf0003
40000dc0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000dc4:	0007a023          	sw	zero,0(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
40000dc8:	f00037b7          	lui	a5,0xf0003
40000dcc:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000dd0:	00100713          	li	a4,1
40000dd4:	00e7a023          	sw	a4,0(a5)
}
40000dd8:	00000013          	nop
40000ddc:	01c12403          	lw	s0,28(sp)
40000de0:	02010113          	addi	sp,sp,32
40000de4:	00008067          	ret

40000de8 <present_read>:
uint32_t present_read(uint32_t iAddress)
{
40000de8:	fd010113          	addi	sp,sp,-48
40000dec:	02812623          	sw	s0,44(sp)
40000df0:	03010413          	addi	s0,sp,48
40000df4:	fca42e23          	sw	a0,-36(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
40000df8:	f00037b7          	lui	a5,0xf0003
40000dfc:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000e00:	fdc42703          	lw	a4,-36(s0)
40000e04:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->READ_N		= 0;
40000e08:	f00037b7          	lui	a5,0xf0003
40000e0c:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000e10:	0007a423          	sw	zero,8(a5)
	PRESENT_BASE->WRITE_N		= 1;
40000e14:	f00037b7          	lui	a5,0xf0003
40000e18:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000e1c:	00100713          	li	a4,1
40000e20:	00e7a223          	sw	a4,4(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
40000e24:	f00037b7          	lui	a5,0xf0003
40000e28:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000e2c:	0007a023          	sw	zero,0(a5)
	uint32_t res 				= PRESENT_BASE->ODATA;
40000e30:	f00037b7          	lui	a5,0xf0003
40000e34:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000e38:	0147a783          	lw	a5,20(a5)
40000e3c:	fef42623          	sw	a5,-20(s0)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
40000e40:	f00037b7          	lui	a5,0xf0003
40000e44:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40000e48:	00100713          	li	a4,1
40000e4c:	00e7a023          	sw	a4,0(a5)
	return res;
40000e50:	fec42783          	lw	a5,-20(s0)
}
40000e54:	00078513          	mv	a0,a5
40000e58:	02c12403          	lw	s0,44(sp)
40000e5c:	03010113          	addi	sp,sp,48
40000e60:	00008067          	ret

40000e64 <present_cipher>:
void present_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
40000e64:	fe010113          	addi	sp,sp,-32
40000e68:	00112e23          	sw	ra,28(sp)
40000e6c:	00812c23          	sw	s0,24(sp)
40000e70:	00912a23          	sw	s1,20(sp)
40000e74:	02010413          	addi	s0,sp,32
40000e78:	00050793          	mv	a5,a0
40000e7c:	feb42423          	sw	a1,-24(s0)
40000e80:	fec42223          	sw	a2,-28(s0)
40000e84:	fed42023          	sw	a3,-32(s0)
40000e88:	fef407a3          	sb	a5,-17(s0)

	//EN_OR_DE
	if(operation == PRESENT_OP_EN) present_write(PRESENT_OP_EN,PRESENT_ADDR_EN_OR_DE);
40000e8c:	fef44783          	lbu	a5,-17(s0)
40000e90:	00079a63          	bnez	a5,40000ea4 <present_cipher+0x40>
40000e94:	00800593          	li	a1,8
40000e98:	00000513          	li	a0,0
40000e9c:	ed1ff0ef          	jal	ra,40000d6c <present_write>
40000ea0:	0100006f          	j	40000eb0 <present_cipher+0x4c>
	else present_write(PRESENT_OP_DE,PRESENT_ADDR_EN_OR_DE);
40000ea4:	00800593          	li	a1,8
40000ea8:	00100513          	li	a0,1
40000eac:	ec1ff0ef          	jal	ra,40000d6c <present_write>

	//PLAIN_TEXT
	present_write(block[1],PRESENT_ADDR_BLOCK_BASE +1);
40000eb0:	fe442783          	lw	a5,-28(s0)
40000eb4:	00478793          	addi	a5,a5,4
40000eb8:	0007a783          	lw	a5,0(a5)
40000ebc:	00500593          	li	a1,5
40000ec0:	00078513          	mv	a0,a5
40000ec4:	ea9ff0ef          	jal	ra,40000d6c <present_write>
	present_write(block[0],PRESENT_ADDR_BLOCK_BASE);
40000ec8:	fe442783          	lw	a5,-28(s0)
40000ecc:	0007a783          	lw	a5,0(a5)
40000ed0:	00400593          	li	a1,4
40000ed4:	00078513          	mv	a0,a5
40000ed8:	e95ff0ef          	jal	ra,40000d6c <present_write>

	//KEY
	present_write(key[2],PRESENT_ADDR_KEY_BASE +2);
40000edc:	fe842783          	lw	a5,-24(s0)
40000ee0:	00878793          	addi	a5,a5,8
40000ee4:	0007a783          	lw	a5,0(a5)
40000ee8:	00300593          	li	a1,3
40000eec:	00078513          	mv	a0,a5
40000ef0:	e7dff0ef          	jal	ra,40000d6c <present_write>
	present_write(key[1],PRESENT_ADDR_KEY_BASE +1);
40000ef4:	fe842783          	lw	a5,-24(s0)
40000ef8:	00478793          	addi	a5,a5,4
40000efc:	0007a783          	lw	a5,0(a5)
40000f00:	00200593          	li	a1,2
40000f04:	00078513          	mv	a0,a5
40000f08:	e65ff0ef          	jal	ra,40000d6c <present_write>
	present_write(key[0],PRESENT_ADDR_KEY_BASE);
40000f0c:	fe842783          	lw	a5,-24(s0)
40000f10:	0007a783          	lw	a5,0(a5)
40000f14:	00100593          	li	a1,1
40000f18:	00078513          	mv	a0,a5
40000f1c:	e51ff0ef          	jal	ra,40000d6c <present_write>

	//START
	present_write(0x1,PRESENT_ADDR_START);
40000f20:	00000593          	li	a1,0
40000f24:	00100513          	li	a0,1
40000f28:	e45ff0ef          	jal	ra,40000d6c <present_write>
    while(present_read(PRESENT_ADDR_RESULT_BASE) == 0);
40000f2c:	00000013          	nop
40000f30:	00600513          	li	a0,6
40000f34:	eb5ff0ef          	jal	ra,40000de8 <present_read>
40000f38:	00050793          	mv	a5,a0
40000f3c:	fe078ae3          	beqz	a5,40000f30 <present_cipher+0xcc>

    res[1] = present_read(PRESENT_ADDR_RESULT_BASE +1);
40000f40:	fe042783          	lw	a5,-32(s0)
40000f44:	00478493          	addi	s1,a5,4
40000f48:	00700513          	li	a0,7
40000f4c:	e9dff0ef          	jal	ra,40000de8 <present_read>
40000f50:	00050793          	mv	a5,a0
40000f54:	00f4a023          	sw	a5,0(s1)
    res[0] =present_read(PRESENT_ADDR_RESULT_BASE);
40000f58:	00600513          	li	a0,6
40000f5c:	e8dff0ef          	jal	ra,40000de8 <present_read>
40000f60:	00050713          	mv	a4,a0
40000f64:	fe042783          	lw	a5,-32(s0)
40000f68:	00e7a023          	sw	a4,0(a5)


    //print result to terminal
	if(operation == PRESENT_OP_EN)
40000f6c:	fef44783          	lbu	a5,-17(s0)
40000f70:	00079a63          	bnez	a5,40000f84 <present_cipher+0x120>
		print("\r\t===========================PRESENT ENCRYPTTION==============================\r\n");
40000f74:	400027b7          	lui	a5,0x40002
40000f78:	4e478513          	addi	a0,a5,1252 # 400024e4 <vga_simRes_h160_v120+0x20>
40000f7c:	2b9000ef          	jal	ra,40001a34 <print>
40000f80:	0100006f          	j	40000f90 <present_cipher+0x12c>
	else
		print("\r\t===========================PRESENT DECRYPTTION==============================\r\n");
40000f84:	400027b7          	lui	a5,0x40002
40000f88:	53878513          	addi	a0,a5,1336 # 40002538 <vga_simRes_h160_v120+0x74>
40000f8c:	2a9000ef          	jal	ra,40001a34 <print>
	print("\r\n");
40000f90:	400027b7          	lui	a5,0x40002
40000f94:	58c78513          	addi	a0,a5,1420 # 4000258c <vga_simRes_h160_v120+0xc8>
40000f98:	29d000ef          	jal	ra,40001a34 <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
40000f9c:	fe442583          	lw	a1,-28(s0)
40000fa0:	400027b7          	lui	a5,0x40002
40000fa4:	59078513          	addi	a0,a5,1424 # 40002590 <vga_simRes_h160_v120+0xcc>
40000fa8:	4f5000ef          	jal	ra,40001c9c <print64bit>
	print80bit("KEY (80-bit) : ", key);
40000fac:	fe842583          	lw	a1,-24(s0)
40000fb0:	400027b7          	lui	a5,0x40002
40000fb4:	5ac78513          	addi	a0,a5,1452 # 400025ac <vga_simRes_h160_v120+0xe8>
40000fb8:	5ed000ef          	jal	ra,40001da4 <print80bit>
	print64bit("RESULT (64-bit) : ", res);
40000fbc:	fe042583          	lw	a1,-32(s0)
40000fc0:	400027b7          	lui	a5,0x40002
40000fc4:	5bc78513          	addi	a0,a5,1468 # 400025bc <vga_simRes_h160_v120+0xf8>
40000fc8:	4d5000ef          	jal	ra,40001c9c <print64bit>
	//print("\r\n============================================================================\r\n");
}
40000fcc:	00000013          	nop
40000fd0:	01c12083          	lw	ra,28(sp)
40000fd4:	01812403          	lw	s0,24(sp)
40000fd8:	01412483          	lw	s1,20(sp)
40000fdc:	02010113          	addi	sp,sp,32
40000fe0:	00008067          	ret

40000fe4 <timer_init>:
static void timer_init(Timer_Reg *reg){
40000fe4:	fe010113          	addi	sp,sp,-32
40000fe8:	00812e23          	sw	s0,28(sp)
40000fec:	02010413          	addi	s0,sp,32
40000ff0:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000ff4:	fec42783          	lw	a5,-20(s0)
40000ff8:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000ffc:	fec42783          	lw	a5,-20(s0)
40001000:	0007a423          	sw	zero,8(a5)
}
40001004:	00000013          	nop
40001008:	01c12403          	lw	s0,28(sp)
4000100c:	02010113          	addi	sp,sp,32
40001010:	00008067          	ret

40001014 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001014:	fe010113          	addi	sp,sp,-32
40001018:	00812e23          	sw	s0,28(sp)
4000101c:	02010413          	addi	s0,sp,32
40001020:	fea42623          	sw	a0,-20(s0)
}
40001024:	00000013          	nop
40001028:	01c12403          	lw	s0,28(sp)
4000102c:	02010113          	addi	sp,sp,32
40001030:	00008067          	ret

40001034 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001034:	fe010113          	addi	sp,sp,-32
40001038:	00812e23          	sw	s0,28(sp)
4000103c:	02010413          	addi	s0,sp,32
40001040:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001044:	fec42783          	lw	a5,-20(s0)
40001048:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
4000104c:	fec42783          	lw	a5,-20(s0)
40001050:	fff00713          	li	a4,-1
40001054:	00e7a023          	sw	a4,0(a5)
}
40001058:	00000013          	nop
4000105c:	01c12403          	lw	s0,28(sp)
40001060:	02010113          	addi	sp,sp,32
40001064:	00008067          	ret

40001068 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40001068:	fe010113          	addi	sp,sp,-32
4000106c:	00812e23          	sw	s0,28(sp)
40001070:	02010413          	addi	s0,sp,32
40001074:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40001078:	fec42783          	lw	a5,-20(s0)
4000107c:	0047a783          	lw	a5,4(a5)
40001080:	0107d793          	srli	a5,a5,0x10
40001084:	0ff7f793          	zext.b	a5,a5
}
40001088:	00078513          	mv	a0,a5
4000108c:	01c12403          	lw	s0,28(sp)
40001090:	02010113          	addi	sp,sp,32
40001094:	00008067          	ret

40001098 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40001098:	fe010113          	addi	sp,sp,-32
4000109c:	00812e23          	sw	s0,28(sp)
400010a0:	02010413          	addi	s0,sp,32
400010a4:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
400010a8:	fec42783          	lw	a5,-20(s0)
400010ac:	0047a783          	lw	a5,4(a5)
400010b0:	0187d793          	srli	a5,a5,0x18
}
400010b4:	00078513          	mv	a0,a5
400010b8:	01c12403          	lw	s0,28(sp)
400010bc:	02010113          	addi	sp,sp,32
400010c0:	00008067          	ret

400010c4 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
400010c4:	fe010113          	addi	sp,sp,-32
400010c8:	00112e23          	sw	ra,28(sp)
400010cc:	00812c23          	sw	s0,24(sp)
400010d0:	02010413          	addi	s0,sp,32
400010d4:	fea42623          	sw	a0,-20(s0)
400010d8:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
400010dc:	00000013          	nop
400010e0:	fec42503          	lw	a0,-20(s0)
400010e4:	f85ff0ef          	jal	ra,40001068 <uart_writeAvailability>
400010e8:	00050793          	mv	a5,a0
400010ec:	fe078ae3          	beqz	a5,400010e0 <uart_write+0x1c>
	reg->DATA = data;
400010f0:	fec42783          	lw	a5,-20(s0)
400010f4:	fe842703          	lw	a4,-24(s0)
400010f8:	00e7a023          	sw	a4,0(a5)
}
400010fc:	00000013          	nop
40001100:	01c12083          	lw	ra,28(sp)
40001104:	01812403          	lw	s0,24(sp)
40001108:	02010113          	addi	sp,sp,32
4000110c:	00008067          	ret

40001110 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001110:	fe010113          	addi	sp,sp,-32
40001114:	00812e23          	sw	s0,28(sp)
40001118:	02010413          	addi	s0,sp,32
4000111c:	fea42623          	sw	a0,-20(s0)
40001120:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001124:	fe842783          	lw	a5,-24(s0)
40001128:	00c7a703          	lw	a4,12(a5)
4000112c:	fec42783          	lw	a5,-20(s0)
40001130:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001134:	fe842783          	lw	a5,-24(s0)
40001138:	0007a783          	lw	a5,0(a5)
4000113c:	fff78713          	addi	a4,a5,-1
40001140:	fe842783          	lw	a5,-24(s0)
40001144:	0047a783          	lw	a5,4(a5)
40001148:	00879793          	slli	a5,a5,0x8
4000114c:	00f76733          	or	a4,a4,a5
40001150:	fe842783          	lw	a5,-24(s0)
40001154:	0087a783          	lw	a5,8(a5)
40001158:	01079793          	slli	a5,a5,0x10
4000115c:	00f76733          	or	a4,a4,a5
40001160:	fec42783          	lw	a5,-20(s0)
40001164:	00e7a623          	sw	a4,12(a5)
}
40001168:	00000013          	nop
4000116c:	01c12403          	lw	s0,28(sp)
40001170:	02010113          	addi	sp,sp,32
40001174:	00008067          	ret

40001178 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001178:	fe010113          	addi	sp,sp,-32
4000117c:	00812e23          	sw	s0,28(sp)
40001180:	02010413          	addi	s0,sp,32
40001184:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001188:	fec42783          	lw	a5,-20(s0)
4000118c:	0007a783          	lw	a5,0(a5)
40001190:	0027f793          	andi	a5,a5,2
40001194:	00f037b3          	snez	a5,a5
40001198:	0ff7f793          	zext.b	a5,a5
}
4000119c:	00078513          	mv	a0,a5
400011a0:	01c12403          	lw	s0,28(sp)
400011a4:	02010113          	addi	sp,sp,32
400011a8:	00008067          	ret

400011ac <vga_run>:
static void vga_run(Vga_Reg *reg){
400011ac:	fe010113          	addi	sp,sp,-32
400011b0:	00812e23          	sw	s0,28(sp)
400011b4:	02010413          	addi	s0,sp,32
400011b8:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
400011bc:	fec42783          	lw	a5,-20(s0)
400011c0:	00100713          	li	a4,1
400011c4:	00e7a023          	sw	a4,0(a5)
}
400011c8:	00000013          	nop
400011cc:	01c12403          	lw	s0,28(sp)
400011d0:	02010113          	addi	sp,sp,32
400011d4:	00008067          	ret

400011d8 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
400011d8:	fe010113          	addi	sp,sp,-32
400011dc:	00112e23          	sw	ra,28(sp)
400011e0:	00812c23          	sw	s0,24(sp)
400011e4:	02010413          	addi	s0,sp,32
400011e8:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
400011ec:	fec42783          	lw	a5,-20(s0)
400011f0:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
400011f4:	00000013          	nop
400011f8:	fec42503          	lw	a0,-20(s0)
400011fc:	f7dff0ef          	jal	ra,40001178 <vga_isBusy>
40001200:	00050793          	mv	a5,a0
40001204:	fe079ae3          	bnez	a5,400011f8 <vga_stop+0x20>
}
40001208:	00000013          	nop
4000120c:	00000013          	nop
40001210:	01c12083          	lw	ra,28(sp)
40001214:	01812403          	lw	s0,24(sp)
40001218:	02010113          	addi	sp,sp,32
4000121c:	00008067          	ret

40001220 <aes_write>:
#include "briey.h"
void aes_write(uint32_t iData, uint32_t iAddress)
{
40001220:	fe010113          	addi	sp,sp,-32
40001224:	00812e23          	sw	s0,28(sp)
40001228:	02010413          	addi	s0,sp,32
4000122c:	fea42623          	sw	a0,-20(s0)
40001230:	feb42423          	sw	a1,-24(s0)
	AES_BASE->ADDRESS		= iAddress;
40001234:	f00027b7          	lui	a5,0xf0002
40001238:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000123c:	fe842703          	lw	a4,-24(s0)
40001240:	00e7a423          	sw	a4,8(a5)
	AES_BASE->WRITE_ENABLE 	= 1;
40001244:	f00027b7          	lui	a5,0xf0002
40001248:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000124c:	00100713          	li	a4,1
40001250:	00e7a223          	sw	a4,4(a5)
	AES_BASE->IDATA			= iData;
40001254:	f00027b7          	lui	a5,0xf0002
40001258:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000125c:	fec42703          	lw	a4,-20(s0)
40001260:	00e7a623          	sw	a4,12(a5)
	AES_BASE->CHIP_SELECT	= 1;
40001264:	f00027b7          	lui	a5,0xf0002
40001268:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000126c:	00100713          	li	a4,1
40001270:	00e7a023          	sw	a4,0(a5)
	AES_BASE->CHIP_SELECT	= 0;
40001274:	f00027b7          	lui	a5,0xf0002
40001278:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000127c:	0007a023          	sw	zero,0(a5)
}
40001280:	00000013          	nop
40001284:	01c12403          	lw	s0,28(sp)
40001288:	02010113          	addi	sp,sp,32
4000128c:	00008067          	ret

40001290 <aes_read>:
uint32_t aes_read(uint32_t iAddress)
{
40001290:	fd010113          	addi	sp,sp,-48
40001294:	02812623          	sw	s0,44(sp)
40001298:	03010413          	addi	s0,sp,48
4000129c:	fca42e23          	sw	a0,-36(s0)
	AES_BASE->ADDRESS		= iAddress;
400012a0:	f00027b7          	lui	a5,0xf0002
400012a4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400012a8:	fdc42703          	lw	a4,-36(s0)
400012ac:	00e7a423          	sw	a4,8(a5)
	AES_BASE->WRITE_ENABLE	= 0;
400012b0:	f00027b7          	lui	a5,0xf0002
400012b4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400012b8:	0007a223          	sw	zero,4(a5)
	AES_BASE->CHIP_SELECT	= 1;
400012bc:	f00027b7          	lui	a5,0xf0002
400012c0:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400012c4:	00100713          	li	a4,1
400012c8:	00e7a023          	sw	a4,0(a5)
	uint32_t res 				= AES_BASE->ODATA;
400012cc:	f00027b7          	lui	a5,0xf0002
400012d0:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400012d4:	0107a783          	lw	a5,16(a5)
400012d8:	fef42623          	sw	a5,-20(s0)
	AES_BASE->CHIP_SELECT	= 0;
400012dc:	f00027b7          	lui	a5,0xf0002
400012e0:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400012e4:	0007a023          	sw	zero,0(a5)
	return res;
400012e8:	fec42783          	lw	a5,-20(s0)
}
400012ec:	00078513          	mv	a0,a5
400012f0:	02c12403          	lw	s0,44(sp)
400012f4:	03010113          	addi	sp,sp,48
400012f8:	00008067          	ret

400012fc <aes_128_cipher>:
void aes_128_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
400012fc:	fd010113          	addi	sp,sp,-48
40001300:	02112623          	sw	ra,44(sp)
40001304:	02812423          	sw	s0,40(sp)
40001308:	02912223          	sw	s1,36(sp)
4000130c:	03010413          	addi	s0,sp,48
40001310:	00050793          	mv	a5,a0
40001314:	fcb42c23          	sw	a1,-40(s0)
40001318:	fcc42a23          	sw	a2,-44(s0)
4000131c:	fcd42823          	sw	a3,-48(s0)
40001320:	fcf40fa3          	sb	a5,-33(s0)
	aes_write(0x0,AES_ADDR_KEY_BASE +7);
40001324:	01700593          	li	a1,23
40001328:	00000513          	li	a0,0
4000132c:	ef5ff0ef          	jal	ra,40001220 <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +6);
40001330:	01600593          	li	a1,22
40001334:	00000513          	li	a0,0
40001338:	ee9ff0ef          	jal	ra,40001220 <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +5);
4000133c:	01500593          	li	a1,21
40001340:	00000513          	li	a0,0
40001344:	eddff0ef          	jal	ra,40001220 <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +4);
40001348:	01400593          	li	a1,20
4000134c:	00000513          	li	a0,0
40001350:	ed1ff0ef          	jal	ra,40001220 <aes_write>
	aes_write(key[3],AES_ADDR_KEY_BASE +3);
40001354:	fd842783          	lw	a5,-40(s0)
40001358:	00c78793          	addi	a5,a5,12
4000135c:	0007a783          	lw	a5,0(a5)
40001360:	01300593          	li	a1,19
40001364:	00078513          	mv	a0,a5
40001368:	eb9ff0ef          	jal	ra,40001220 <aes_write>
	aes_write(key[2],AES_ADDR_KEY_BASE +2);
4000136c:	fd842783          	lw	a5,-40(s0)
40001370:	00878793          	addi	a5,a5,8
40001374:	0007a783          	lw	a5,0(a5)
40001378:	01200593          	li	a1,18
4000137c:	00078513          	mv	a0,a5
40001380:	ea1ff0ef          	jal	ra,40001220 <aes_write>
	aes_write(key[1],AES_ADDR_KEY_BASE +1);
40001384:	fd842783          	lw	a5,-40(s0)
40001388:	00478793          	addi	a5,a5,4
4000138c:	0007a783          	lw	a5,0(a5)
40001390:	01100593          	li	a1,17
40001394:	00078513          	mv	a0,a5
40001398:	e89ff0ef          	jal	ra,40001220 <aes_write>
	aes_write(key[0],AES_ADDR_KEY_BASE);
4000139c:	fd842783          	lw	a5,-40(s0)
400013a0:	0007a783          	lw	a5,0(a5)
400013a4:	01000593          	li	a1,16
400013a8:	00078513          	mv	a0,a5
400013ac:	e75ff0ef          	jal	ra,40001220 <aes_write>

	aes_write(AES_CONFIG_128_KEY,AES_ADDR_CONFIG);
400013b0:	00a00593          	li	a1,10
400013b4:	00000513          	li	a0,0
400013b8:	e69ff0ef          	jal	ra,40001220 <aes_write>
	aes_write(AES_CTRL_INIT_KEY,AES_ADDR_CTRL);
400013bc:	00800593          	li	a1,8
400013c0:	00100513          	li	a0,1
400013c4:	e5dff0ef          	jal	ra,40001220 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
400013c8:	00000013          	nop
400013cc:	00900513          	li	a0,9
400013d0:	ec1ff0ef          	jal	ra,40001290 <aes_read>
400013d4:	00050793          	mv	a5,a0
400013d8:	fe078ae3          	beqz	a5,400013cc <aes_128_cipher+0xd0>

    aes_write(block[3],AES_ADDR_BLOCK_BASE + 3);
400013dc:	fd442783          	lw	a5,-44(s0)
400013e0:	00c78793          	addi	a5,a5,12
400013e4:	0007a783          	lw	a5,0(a5)
400013e8:	02300593          	li	a1,35
400013ec:	00078513          	mv	a0,a5
400013f0:	e31ff0ef          	jal	ra,40001220 <aes_write>
    aes_write(block[2],AES_ADDR_BLOCK_BASE + 2);
400013f4:	fd442783          	lw	a5,-44(s0)
400013f8:	00878793          	addi	a5,a5,8
400013fc:	0007a783          	lw	a5,0(a5)
40001400:	02200593          	li	a1,34
40001404:	00078513          	mv	a0,a5
40001408:	e19ff0ef          	jal	ra,40001220 <aes_write>
    aes_write(block[1],AES_ADDR_BLOCK_BASE + 1);
4000140c:	fd442783          	lw	a5,-44(s0)
40001410:	00478793          	addi	a5,a5,4
40001414:	0007a783          	lw	a5,0(a5)
40001418:	02100593          	li	a1,33
4000141c:	00078513          	mv	a0,a5
40001420:	e01ff0ef          	jal	ra,40001220 <aes_write>
    aes_write(block[0],AES_ADDR_BLOCK_BASE + 0);
40001424:	fd442783          	lw	a5,-44(s0)
40001428:	0007a783          	lw	a5,0(a5)
4000142c:	02000593          	li	a1,32
40001430:	00078513          	mv	a0,a5
40001434:	dedff0ef          	jal	ra,40001220 <aes_write>


    unsigned char AES_CONFIG = 0x00;
40001438:	fe0407a3          	sb	zero,-17(s0)
	if (operation == 0x01)
4000143c:	fdf44703          	lbu	a4,-33(s0)
40001440:	00100793          	li	a5,1
40001444:	00f71863          	bne	a4,a5,40001454 <aes_128_cipher+0x158>
		AES_CONFIG = AES_CONFIG_128_EN;
40001448:	00100793          	li	a5,1
4000144c:	fef407a3          	sb	a5,-17(s0)
40001450:	0080006f          	j	40001458 <aes_128_cipher+0x15c>
	else
		AES_CONFIG = AES_CONFIG_128_DE;
40001454:	fe0407a3          	sb	zero,-17(s0)

	aes_write(AES_CONFIG,AES_ADDR_CONFIG);
40001458:	fef44783          	lbu	a5,-17(s0)
4000145c:	00a00593          	li	a1,10
40001460:	00078513          	mv	a0,a5
40001464:	dbdff0ef          	jal	ra,40001220 <aes_write>
    aes_write(AES_CTRL_START, AES_ADDR_CTRL);
40001468:	00800593          	li	a1,8
4000146c:	00200513          	li	a0,2
40001470:	db1ff0ef          	jal	ra,40001220 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
40001474:	00000013          	nop
40001478:	00900513          	li	a0,9
4000147c:	e15ff0ef          	jal	ra,40001290 <aes_read>
40001480:	00050793          	mv	a5,a0
40001484:	fe078ae3          	beqz	a5,40001478 <aes_128_cipher+0x17c>

    res[3] = aes_read(AES_ADDR_RESULT_BASE + 3);
40001488:	fd042783          	lw	a5,-48(s0)
4000148c:	00c78493          	addi	s1,a5,12
40001490:	03300513          	li	a0,51
40001494:	dfdff0ef          	jal	ra,40001290 <aes_read>
40001498:	00050793          	mv	a5,a0
4000149c:	00f4a023          	sw	a5,0(s1)
    res[2] = aes_read(AES_ADDR_RESULT_BASE + 2);
400014a0:	fd042783          	lw	a5,-48(s0)
400014a4:	00878493          	addi	s1,a5,8
400014a8:	03200513          	li	a0,50
400014ac:	de5ff0ef          	jal	ra,40001290 <aes_read>
400014b0:	00050793          	mv	a5,a0
400014b4:	00f4a023          	sw	a5,0(s1)
    res[1] = aes_read(AES_ADDR_RESULT_BASE + 1);
400014b8:	fd042783          	lw	a5,-48(s0)
400014bc:	00478493          	addi	s1,a5,4
400014c0:	03100513          	li	a0,49
400014c4:	dcdff0ef          	jal	ra,40001290 <aes_read>
400014c8:	00050793          	mv	a5,a0
400014cc:	00f4a023          	sw	a5,0(s1)
    res[0] = aes_read(AES_ADDR_RESULT_BASE + 0);
400014d0:	03000513          	li	a0,48
400014d4:	dbdff0ef          	jal	ra,40001290 <aes_read>
400014d8:	00050713          	mv	a4,a0
400014dc:	fd042783          	lw	a5,-48(s0)
400014e0:	00e7a023          	sw	a4,0(a5)

    //print result to terminal
	if(operation == 0x1)
400014e4:	fdf44703          	lbu	a4,-33(s0)
400014e8:	00100793          	li	a5,1
400014ec:	00f71a63          	bne	a4,a5,40001500 <aes_128_cipher+0x204>
		print("\r\t============================AES128 ENCRYPTTION==============================\r\n");
400014f0:	400027b7          	lui	a5,0x40002
400014f4:	63078513          	addi	a0,a5,1584 # 40002630 <vga_simRes_h160_v120+0x20>
400014f8:	53c000ef          	jal	ra,40001a34 <print>
400014fc:	0100006f          	j	4000150c <aes_128_cipher+0x210>
	else
		print("\r\t============================AES128 DECRYPTTION==============================\r\n");
40001500:	400027b7          	lui	a5,0x40002
40001504:	68478513          	addi	a0,a5,1668 # 40002684 <vga_simRes_h160_v120+0x74>
40001508:	52c000ef          	jal	ra,40001a34 <print>
	print("\r\n");
4000150c:	400027b7          	lui	a5,0x40002
40001510:	6d878513          	addi	a0,a5,1752 # 400026d8 <vga_simRes_h160_v120+0xc8>
40001514:	520000ef          	jal	ra,40001a34 <print>
	print128bit("\r\tPLAIN_TEXT (128-bit) : ", block);
40001518:	fd442583          	lw	a1,-44(s0)
4000151c:	400027b7          	lui	a5,0x40002
40001520:	6dc78513          	addi	a0,a5,1756 # 400026dc <vga_simRes_h160_v120+0xcc>
40001524:	7e8000ef          	jal	ra,40001d0c <print128bit>
	print128bit("KEY (128-bit) : ", key);
40001528:	fd842583          	lw	a1,-40(s0)
4000152c:	400027b7          	lui	a5,0x40002
40001530:	6f878513          	addi	a0,a5,1784 # 400026f8 <vga_simRes_h160_v120+0xe8>
40001534:	7d8000ef          	jal	ra,40001d0c <print128bit>
	print128bit("RESULT (128-bit) : ", res);
40001538:	fd042583          	lw	a1,-48(s0)
4000153c:	400027b7          	lui	a5,0x40002
40001540:	70c78513          	addi	a0,a5,1804 # 4000270c <vga_simRes_h160_v120+0xfc>
40001544:	7c8000ef          	jal	ra,40001d0c <print128bit>
}
40001548:	00000013          	nop
4000154c:	02c12083          	lw	ra,44(sp)
40001550:	02812403          	lw	s0,40(sp)
40001554:	02412483          	lw	s1,36(sp)
40001558:	03010113          	addi	sp,sp,48
4000155c:	00008067          	ret

40001560 <aes_256_cipher>:

void aes_256_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
40001560:	fd010113          	addi	sp,sp,-48
40001564:	02112623          	sw	ra,44(sp)
40001568:	02812423          	sw	s0,40(sp)
4000156c:	02912223          	sw	s1,36(sp)
40001570:	03010413          	addi	s0,sp,48
40001574:	00050793          	mv	a5,a0
40001578:	fcb42c23          	sw	a1,-40(s0)
4000157c:	fcc42a23          	sw	a2,-44(s0)
40001580:	fcd42823          	sw	a3,-48(s0)
40001584:	fcf40fa3          	sb	a5,-33(s0)
	aes_write(key[7],AES_ADDR_KEY_BASE +7);
40001588:	fd842783          	lw	a5,-40(s0)
4000158c:	01c78793          	addi	a5,a5,28
40001590:	0007a783          	lw	a5,0(a5)
40001594:	01700593          	li	a1,23
40001598:	00078513          	mv	a0,a5
4000159c:	c85ff0ef          	jal	ra,40001220 <aes_write>
	aes_write(key[6],AES_ADDR_KEY_BASE +6);
400015a0:	fd842783          	lw	a5,-40(s0)
400015a4:	01878793          	addi	a5,a5,24
400015a8:	0007a783          	lw	a5,0(a5)
400015ac:	01600593          	li	a1,22
400015b0:	00078513          	mv	a0,a5
400015b4:	c6dff0ef          	jal	ra,40001220 <aes_write>
	aes_write(key[5],AES_ADDR_KEY_BASE +5);
400015b8:	fd842783          	lw	a5,-40(s0)
400015bc:	01478793          	addi	a5,a5,20
400015c0:	0007a783          	lw	a5,0(a5)
400015c4:	01500593          	li	a1,21
400015c8:	00078513          	mv	a0,a5
400015cc:	c55ff0ef          	jal	ra,40001220 <aes_write>
	aes_write(key[4],AES_ADDR_KEY_BASE +4);
400015d0:	fd842783          	lw	a5,-40(s0)
400015d4:	01078793          	addi	a5,a5,16
400015d8:	0007a783          	lw	a5,0(a5)
400015dc:	01400593          	li	a1,20
400015e0:	00078513          	mv	a0,a5
400015e4:	c3dff0ef          	jal	ra,40001220 <aes_write>
	aes_write(key[3],AES_ADDR_KEY_BASE +3);
400015e8:	fd842783          	lw	a5,-40(s0)
400015ec:	00c78793          	addi	a5,a5,12
400015f0:	0007a783          	lw	a5,0(a5)
400015f4:	01300593          	li	a1,19
400015f8:	00078513          	mv	a0,a5
400015fc:	c25ff0ef          	jal	ra,40001220 <aes_write>
	aes_write(key[2],AES_ADDR_KEY_BASE +2);
40001600:	fd842783          	lw	a5,-40(s0)
40001604:	00878793          	addi	a5,a5,8
40001608:	0007a783          	lw	a5,0(a5)
4000160c:	01200593          	li	a1,18
40001610:	00078513          	mv	a0,a5
40001614:	c0dff0ef          	jal	ra,40001220 <aes_write>
	aes_write(key[1],AES_ADDR_KEY_BASE +1);
40001618:	fd842783          	lw	a5,-40(s0)
4000161c:	00478793          	addi	a5,a5,4
40001620:	0007a783          	lw	a5,0(a5)
40001624:	01100593          	li	a1,17
40001628:	00078513          	mv	a0,a5
4000162c:	bf5ff0ef          	jal	ra,40001220 <aes_write>
	aes_write(key[0],AES_ADDR_KEY_BASE);
40001630:	fd842783          	lw	a5,-40(s0)
40001634:	0007a783          	lw	a5,0(a5)
40001638:	01000593          	li	a1,16
4000163c:	00078513          	mv	a0,a5
40001640:	be1ff0ef          	jal	ra,40001220 <aes_write>

	aes_write(AES_CONFIG_256_KEY,AES_ADDR_CONFIG);
40001644:	00a00593          	li	a1,10
40001648:	00200513          	li	a0,2
4000164c:	bd5ff0ef          	jal	ra,40001220 <aes_write>
	aes_write(AES_CTRL_INIT_KEY,AES_ADDR_CTRL);
40001650:	00800593          	li	a1,8
40001654:	00100513          	li	a0,1
40001658:	bc9ff0ef          	jal	ra,40001220 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
4000165c:	00000013          	nop
40001660:	00900513          	li	a0,9
40001664:	c2dff0ef          	jal	ra,40001290 <aes_read>
40001668:	00050793          	mv	a5,a0
4000166c:	fe078ae3          	beqz	a5,40001660 <aes_256_cipher+0x100>

    aes_write(block[3],AES_ADDR_BLOCK_BASE + 3);
40001670:	fd442783          	lw	a5,-44(s0)
40001674:	00c78793          	addi	a5,a5,12
40001678:	0007a783          	lw	a5,0(a5)
4000167c:	02300593          	li	a1,35
40001680:	00078513          	mv	a0,a5
40001684:	b9dff0ef          	jal	ra,40001220 <aes_write>
    aes_write(block[2],AES_ADDR_BLOCK_BASE + 2);
40001688:	fd442783          	lw	a5,-44(s0)
4000168c:	00878793          	addi	a5,a5,8
40001690:	0007a783          	lw	a5,0(a5)
40001694:	02200593          	li	a1,34
40001698:	00078513          	mv	a0,a5
4000169c:	b85ff0ef          	jal	ra,40001220 <aes_write>
    aes_write(block[1],AES_ADDR_BLOCK_BASE + 1);
400016a0:	fd442783          	lw	a5,-44(s0)
400016a4:	00478793          	addi	a5,a5,4
400016a8:	0007a783          	lw	a5,0(a5)
400016ac:	02100593          	li	a1,33
400016b0:	00078513          	mv	a0,a5
400016b4:	b6dff0ef          	jal	ra,40001220 <aes_write>
    aes_write(block[0],AES_ADDR_BLOCK_BASE + 0);
400016b8:	fd442783          	lw	a5,-44(s0)
400016bc:	0007a783          	lw	a5,0(a5)
400016c0:	02000593          	li	a1,32
400016c4:	00078513          	mv	a0,a5
400016c8:	b59ff0ef          	jal	ra,40001220 <aes_write>


    unsigned char AES_CONFIG = 0x00;
400016cc:	fe0407a3          	sb	zero,-17(s0)
	if (operation == 0x01)
400016d0:	fdf44703          	lbu	a4,-33(s0)
400016d4:	00100793          	li	a5,1
400016d8:	00f71863          	bne	a4,a5,400016e8 <aes_256_cipher+0x188>
		AES_CONFIG = AES_CONFIG_256_EN;
400016dc:	00300793          	li	a5,3
400016e0:	fef407a3          	sb	a5,-17(s0)
400016e4:	00c0006f          	j	400016f0 <aes_256_cipher+0x190>
	else
		AES_CONFIG = AES_CONFIG_256_DE;
400016e8:	00200793          	li	a5,2
400016ec:	fef407a3          	sb	a5,-17(s0)

	aes_write(AES_CONFIG, AES_ADDR_CONFIG);
400016f0:	fef44783          	lbu	a5,-17(s0)
400016f4:	00a00593          	li	a1,10
400016f8:	00078513          	mv	a0,a5
400016fc:	b25ff0ef          	jal	ra,40001220 <aes_write>
    aes_write(AES_CTRL_START, AES_ADDR_CTRL);
40001700:	00800593          	li	a1,8
40001704:	00200513          	li	a0,2
40001708:	b19ff0ef          	jal	ra,40001220 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
4000170c:	00000013          	nop
40001710:	00900513          	li	a0,9
40001714:	b7dff0ef          	jal	ra,40001290 <aes_read>
40001718:	00050793          	mv	a5,a0
4000171c:	fe078ae3          	beqz	a5,40001710 <aes_256_cipher+0x1b0>

    res[3] = aes_read(AES_ADDR_RESULT_BASE + 3);
40001720:	fd042783          	lw	a5,-48(s0)
40001724:	00c78493          	addi	s1,a5,12
40001728:	03300513          	li	a0,51
4000172c:	b65ff0ef          	jal	ra,40001290 <aes_read>
40001730:	00050793          	mv	a5,a0
40001734:	00f4a023          	sw	a5,0(s1)
    res[2] = aes_read(AES_ADDR_RESULT_BASE + 2);
40001738:	fd042783          	lw	a5,-48(s0)
4000173c:	00878493          	addi	s1,a5,8
40001740:	03200513          	li	a0,50
40001744:	b4dff0ef          	jal	ra,40001290 <aes_read>
40001748:	00050793          	mv	a5,a0
4000174c:	00f4a023          	sw	a5,0(s1)
    res[1] = aes_read(AES_ADDR_RESULT_BASE + 1);
40001750:	fd042783          	lw	a5,-48(s0)
40001754:	00478493          	addi	s1,a5,4
40001758:	03100513          	li	a0,49
4000175c:	b35ff0ef          	jal	ra,40001290 <aes_read>
40001760:	00050793          	mv	a5,a0
40001764:	00f4a023          	sw	a5,0(s1)
    res[0] = aes_read(AES_ADDR_RESULT_BASE + 0);
40001768:	03000513          	li	a0,48
4000176c:	b25ff0ef          	jal	ra,40001290 <aes_read>
40001770:	00050713          	mv	a4,a0
40001774:	fd042783          	lw	a5,-48(s0)
40001778:	00e7a023          	sw	a4,0(a5)

    //print result to terminal
	if(operation == 0x1)
4000177c:	fdf44703          	lbu	a4,-33(s0)
40001780:	00100793          	li	a5,1
40001784:	00f71a63          	bne	a4,a5,40001798 <aes_256_cipher+0x238>
		print("\r\t======================================AES256 ENCRYPTTION========================================\r\n");
40001788:	400027b7          	lui	a5,0x40002
4000178c:	72078513          	addi	a0,a5,1824 # 40002720 <vga_simRes_h160_v120+0x110>
40001790:	2a4000ef          	jal	ra,40001a34 <print>
40001794:	0100006f          	j	400017a4 <aes_256_cipher+0x244>
	else
		print("\r\t======================================AES256 DECRYPTTION========================================\r\n");
40001798:	400027b7          	lui	a5,0x40002
4000179c:	78878513          	addi	a0,a5,1928 # 40002788 <vga_simRes_h160_v120+0x178>
400017a0:	294000ef          	jal	ra,40001a34 <print>
	print("\r\n");
400017a4:	400027b7          	lui	a5,0x40002
400017a8:	6d878513          	addi	a0,a5,1752 # 400026d8 <vga_simRes_h160_v120+0xc8>
400017ac:	288000ef          	jal	ra,40001a34 <print>
	print128bit("PLAIN_TEXT (128-bit) : ", block);
400017b0:	fd442583          	lw	a1,-44(s0)
400017b4:	400027b7          	lui	a5,0x40002
400017b8:	7f078513          	addi	a0,a5,2032 # 400027f0 <vga_simRes_h160_v120+0x1e0>
400017bc:	550000ef          	jal	ra,40001d0c <print128bit>
	print256bit("KEY (256-bit) : ", key);
400017c0:	fd842583          	lw	a1,-40(s0)
400017c4:	400037b7          	lui	a5,0x40003
400017c8:	80878513          	addi	a0,a5,-2040 # 40002808 <vga_simRes_h160_v120+0x1f8>
400017cc:	65c000ef          	jal	ra,40001e28 <print256bit>
	print128bit("RESULT (128-bit) : ", res);
400017d0:	fd042583          	lw	a1,-48(s0)
400017d4:	400027b7          	lui	a5,0x40002
400017d8:	70c78513          	addi	a0,a5,1804 # 4000270c <vga_simRes_h160_v120+0xfc>
400017dc:	530000ef          	jal	ra,40001d0c <print128bit>
	//print("\r\n================================================================================================\r\n");

}
400017e0:	00000013          	nop
400017e4:	02c12083          	lw	ra,44(sp)
400017e8:	02812403          	lw	s0,40(sp)
400017ec:	02412483          	lw	s1,36(sp)
400017f0:	03010113          	addi	sp,sp,48
400017f4:	00008067          	ret

400017f8 <timer_init>:
static void timer_init(Timer_Reg *reg){
400017f8:	fe010113          	addi	sp,sp,-32
400017fc:	00812e23          	sw	s0,28(sp)
40001800:	02010413          	addi	s0,sp,32
40001804:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40001808:	fec42783          	lw	a5,-20(s0)
4000180c:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40001810:	fec42783          	lw	a5,-20(s0)
40001814:	0007a423          	sw	zero,8(a5)
}
40001818:	00000013          	nop
4000181c:	01c12403          	lw	s0,28(sp)
40001820:	02010113          	addi	sp,sp,32
40001824:	00008067          	ret

40001828 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001828:	fe010113          	addi	sp,sp,-32
4000182c:	00812e23          	sw	s0,28(sp)
40001830:	02010413          	addi	s0,sp,32
40001834:	fea42623          	sw	a0,-20(s0)
}
40001838:	00000013          	nop
4000183c:	01c12403          	lw	s0,28(sp)
40001840:	02010113          	addi	sp,sp,32
40001844:	00008067          	ret

40001848 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001848:	fe010113          	addi	sp,sp,-32
4000184c:	00812e23          	sw	s0,28(sp)
40001850:	02010413          	addi	s0,sp,32
40001854:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001858:	fec42783          	lw	a5,-20(s0)
4000185c:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001860:	fec42783          	lw	a5,-20(s0)
40001864:	fff00713          	li	a4,-1
40001868:	00e7a023          	sw	a4,0(a5)
}
4000186c:	00000013          	nop
40001870:	01c12403          	lw	s0,28(sp)
40001874:	02010113          	addi	sp,sp,32
40001878:	00008067          	ret

4000187c <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
4000187c:	fe010113          	addi	sp,sp,-32
40001880:	00812e23          	sw	s0,28(sp)
40001884:	02010413          	addi	s0,sp,32
40001888:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
4000188c:	fec42783          	lw	a5,-20(s0)
40001890:	0047a783          	lw	a5,4(a5)
40001894:	0107d793          	srli	a5,a5,0x10
40001898:	0ff7f793          	zext.b	a5,a5
}
4000189c:	00078513          	mv	a0,a5
400018a0:	01c12403          	lw	s0,28(sp)
400018a4:	02010113          	addi	sp,sp,32
400018a8:	00008067          	ret

400018ac <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
400018ac:	fe010113          	addi	sp,sp,-32
400018b0:	00812e23          	sw	s0,28(sp)
400018b4:	02010413          	addi	s0,sp,32
400018b8:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
400018bc:	fec42783          	lw	a5,-20(s0)
400018c0:	0047a783          	lw	a5,4(a5)
400018c4:	0187d793          	srli	a5,a5,0x18
}
400018c8:	00078513          	mv	a0,a5
400018cc:	01c12403          	lw	s0,28(sp)
400018d0:	02010113          	addi	sp,sp,32
400018d4:	00008067          	ret

400018d8 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
400018d8:	fe010113          	addi	sp,sp,-32
400018dc:	00112e23          	sw	ra,28(sp)
400018e0:	00812c23          	sw	s0,24(sp)
400018e4:	02010413          	addi	s0,sp,32
400018e8:	fea42623          	sw	a0,-20(s0)
400018ec:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
400018f0:	00000013          	nop
400018f4:	fec42503          	lw	a0,-20(s0)
400018f8:	f85ff0ef          	jal	ra,4000187c <uart_writeAvailability>
400018fc:	00050793          	mv	a5,a0
40001900:	fe078ae3          	beqz	a5,400018f4 <uart_write+0x1c>
	reg->DATA = data;
40001904:	fec42783          	lw	a5,-20(s0)
40001908:	fe842703          	lw	a4,-24(s0)
4000190c:	00e7a023          	sw	a4,0(a5)
}
40001910:	00000013          	nop
40001914:	01c12083          	lw	ra,28(sp)
40001918:	01812403          	lw	s0,24(sp)
4000191c:	02010113          	addi	sp,sp,32
40001920:	00008067          	ret

40001924 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001924:	fe010113          	addi	sp,sp,-32
40001928:	00812e23          	sw	s0,28(sp)
4000192c:	02010413          	addi	s0,sp,32
40001930:	fea42623          	sw	a0,-20(s0)
40001934:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001938:	fe842783          	lw	a5,-24(s0)
4000193c:	00c7a703          	lw	a4,12(a5)
40001940:	fec42783          	lw	a5,-20(s0)
40001944:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001948:	fe842783          	lw	a5,-24(s0)
4000194c:	0007a783          	lw	a5,0(a5)
40001950:	fff78713          	addi	a4,a5,-1
40001954:	fe842783          	lw	a5,-24(s0)
40001958:	0047a783          	lw	a5,4(a5)
4000195c:	00879793          	slli	a5,a5,0x8
40001960:	00f76733          	or	a4,a4,a5
40001964:	fe842783          	lw	a5,-24(s0)
40001968:	0087a783          	lw	a5,8(a5)
4000196c:	01079793          	slli	a5,a5,0x10
40001970:	00f76733          	or	a4,a4,a5
40001974:	fec42783          	lw	a5,-20(s0)
40001978:	00e7a623          	sw	a4,12(a5)
}
4000197c:	00000013          	nop
40001980:	01c12403          	lw	s0,28(sp)
40001984:	02010113          	addi	sp,sp,32
40001988:	00008067          	ret

4000198c <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
4000198c:	fe010113          	addi	sp,sp,-32
40001990:	00812e23          	sw	s0,28(sp)
40001994:	02010413          	addi	s0,sp,32
40001998:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
4000199c:	fec42783          	lw	a5,-20(s0)
400019a0:	0007a783          	lw	a5,0(a5)
400019a4:	0027f793          	andi	a5,a5,2
400019a8:	00f037b3          	snez	a5,a5
400019ac:	0ff7f793          	zext.b	a5,a5
}
400019b0:	00078513          	mv	a0,a5
400019b4:	01c12403          	lw	s0,28(sp)
400019b8:	02010113          	addi	sp,sp,32
400019bc:	00008067          	ret

400019c0 <vga_run>:
static void vga_run(Vga_Reg *reg){
400019c0:	fe010113          	addi	sp,sp,-32
400019c4:	00812e23          	sw	s0,28(sp)
400019c8:	02010413          	addi	s0,sp,32
400019cc:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
400019d0:	fec42783          	lw	a5,-20(s0)
400019d4:	00100713          	li	a4,1
400019d8:	00e7a023          	sw	a4,0(a5)
}
400019dc:	00000013          	nop
400019e0:	01c12403          	lw	s0,28(sp)
400019e4:	02010113          	addi	sp,sp,32
400019e8:	00008067          	ret

400019ec <vga_stop>:
static void vga_stop(Vga_Reg *reg){
400019ec:	fe010113          	addi	sp,sp,-32
400019f0:	00112e23          	sw	ra,28(sp)
400019f4:	00812c23          	sw	s0,24(sp)
400019f8:	02010413          	addi	s0,sp,32
400019fc:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40001a00:	fec42783          	lw	a5,-20(s0)
40001a04:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001a08:	00000013          	nop
40001a0c:	fec42503          	lw	a0,-20(s0)
40001a10:	f7dff0ef          	jal	ra,4000198c <vga_isBusy>
40001a14:	00050793          	mv	a5,a0
40001a18:	fe079ae3          	bnez	a5,40001a0c <vga_stop+0x20>
}
40001a1c:	00000013          	nop
40001a20:	00000013          	nop
40001a24:	01c12083          	lw	ra,28(sp)
40001a28:	01812403          	lw	s0,24(sp)
40001a2c:	02010113          	addi	sp,sp,32
40001a30:	00008067          	ret

40001a34 <print>:
#include <briey.h>

void print(char *str){
40001a34:	fe010113          	addi	sp,sp,-32
40001a38:	00112e23          	sw	ra,28(sp)
40001a3c:	00812c23          	sw	s0,24(sp)
40001a40:	02010413          	addi	s0,sp,32
40001a44:	fea42623          	sw	a0,-20(s0)
	while(*str){
40001a48:	0200006f          	j	40001a68 <print+0x34>
		uart_write(UART,*(str++));
40001a4c:	fec42783          	lw	a5,-20(s0)
40001a50:	00178713          	addi	a4,a5,1
40001a54:	fee42623          	sw	a4,-20(s0)
40001a58:	0007c783          	lbu	a5,0(a5)
40001a5c:	00078593          	mv	a1,a5
40001a60:	f0010537          	lui	a0,0xf0010
40001a64:	e75ff0ef          	jal	ra,400018d8 <uart_write>
	while(*str){
40001a68:	fec42783          	lw	a5,-20(s0)
40001a6c:	0007c783          	lbu	a5,0(a5)
40001a70:	fc079ee3          	bnez	a5,40001a4c <print+0x18>
	}
}
40001a74:	00000013          	nop
40001a78:	00000013          	nop
40001a7c:	01c12083          	lw	ra,28(sp)
40001a80:	01812403          	lw	s0,24(sp)
40001a84:	02010113          	addi	sp,sp,32
40001a88:	00008067          	ret

40001a8c <print16bit>:

void print16bit(uint32_t n)
{
40001a8c:	fc010113          	addi	sp,sp,-64
40001a90:	02112e23          	sw	ra,60(sp)
40001a94:	02812c23          	sw	s0,56(sp)
40001a98:	04010413          	addi	s0,sp,64
40001a9c:	fca42623          	sw	a0,-52(s0)

    int i = 0;
40001aa0:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40001aa4:	fc042e23          	sw	zero,-36(s0)
40001aa8:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40001aac:	fcc42783          	lw	a5,-52(s0)
40001ab0:	00f7f793          	andi	a5,a5,15
40001ab4:	40003737          	lui	a4,0x40003
40001ab8:	88070713          	addi	a4,a4,-1920 # 40002880 <vga_simRes_h160_v120+0x24>
40001abc:	00f707b3          	add	a5,a4,a5
40001ac0:	0007c703          	lbu	a4,0(a5)
40001ac4:	fec42783          	lw	a5,-20(s0)
40001ac8:	ff040693          	addi	a3,s0,-16
40001acc:	00f687b3          	add	a5,a3,a5
40001ad0:	fee78623          	sb	a4,-20(a5)
        i++;
40001ad4:	fec42783          	lw	a5,-20(s0)
40001ad8:	00178793          	addi	a5,a5,1
40001adc:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40001ae0:	fcc42783          	lw	a5,-52(s0)
40001ae4:	0047d793          	srli	a5,a5,0x4
40001ae8:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40001aec:	fcc42783          	lw	a5,-52(s0)
40001af0:	fa079ee3          	bnez	a5,40001aac <print16bit+0x20>
    if(i<8) {
40001af4:	fec42703          	lw	a4,-20(s0)
40001af8:	00700793          	li	a5,7
40001afc:	02e7ce63          	blt	a5,a4,40001b38 <print16bit+0xac>
    	for(int j=7;j>=i;j--){
40001b00:	00700793          	li	a5,7
40001b04:	fef42423          	sw	a5,-24(s0)
40001b08:	0240006f          	j	40001b2c <print16bit+0xa0>
    		outbuf_inv[j]="0"[0];
40001b0c:	03000713          	li	a4,48
40001b10:	fe842783          	lw	a5,-24(s0)
40001b14:	ff040693          	addi	a3,s0,-16
40001b18:	00f687b3          	add	a5,a3,a5
40001b1c:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40001b20:	fe842783          	lw	a5,-24(s0)
40001b24:	fff78793          	addi	a5,a5,-1
40001b28:	fef42423          	sw	a5,-24(s0)
40001b2c:	fe842703          	lw	a4,-24(s0)
40001b30:	fec42783          	lw	a5,-20(s0)
40001b34:	fcf75ce3          	bge	a4,a5,40001b0c <print16bit+0x80>
    	}
    }
    for(int j=3;j>=0;j--)
40001b38:	00300793          	li	a5,3
40001b3c:	fef42223          	sw	a5,-28(s0)
40001b40:	02c0006f          	j	40001b6c <print16bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40001b44:	fe442783          	lw	a5,-28(s0)
40001b48:	ff040713          	addi	a4,s0,-16
40001b4c:	00f707b3          	add	a5,a4,a5
40001b50:	fec7c783          	lbu	a5,-20(a5)
40001b54:	00078593          	mv	a1,a5
40001b58:	f0010537          	lui	a0,0xf0010
40001b5c:	d7dff0ef          	jal	ra,400018d8 <uart_write>
    for(int j=3;j>=0;j--)
40001b60:	fe442783          	lw	a5,-28(s0)
40001b64:	fff78793          	addi	a5,a5,-1
40001b68:	fef42223          	sw	a5,-28(s0)
40001b6c:	fe442783          	lw	a5,-28(s0)
40001b70:	fc07dae3          	bgez	a5,40001b44 <print16bit+0xb8>
    }
    print(" ");
40001b74:	400037b7          	lui	a5,0x40003
40001b78:	87c78513          	addi	a0,a5,-1924 # 4000287c <vga_simRes_h160_v120+0x20>
40001b7c:	eb9ff0ef          	jal	ra,40001a34 <print>
}
40001b80:	00000013          	nop
40001b84:	03c12083          	lw	ra,60(sp)
40001b88:	03812403          	lw	s0,56(sp)
40001b8c:	04010113          	addi	sp,sp,64
40001b90:	00008067          	ret

40001b94 <print32bit>:
void print32bit(uint32_t n)
{
40001b94:	fc010113          	addi	sp,sp,-64
40001b98:	02112e23          	sw	ra,60(sp)
40001b9c:	02812c23          	sw	s0,56(sp)
40001ba0:	04010413          	addi	s0,sp,64
40001ba4:	fca42623          	sw	a0,-52(s0)

    int i = 0;
40001ba8:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40001bac:	fc042e23          	sw	zero,-36(s0)
40001bb0:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40001bb4:	fcc42783          	lw	a5,-52(s0)
40001bb8:	00f7f793          	andi	a5,a5,15
40001bbc:	40003737          	lui	a4,0x40003
40001bc0:	88070713          	addi	a4,a4,-1920 # 40002880 <vga_simRes_h160_v120+0x24>
40001bc4:	00f707b3          	add	a5,a4,a5
40001bc8:	0007c703          	lbu	a4,0(a5)
40001bcc:	fec42783          	lw	a5,-20(s0)
40001bd0:	ff040693          	addi	a3,s0,-16
40001bd4:	00f687b3          	add	a5,a3,a5
40001bd8:	fee78623          	sb	a4,-20(a5)
        i++;
40001bdc:	fec42783          	lw	a5,-20(s0)
40001be0:	00178793          	addi	a5,a5,1
40001be4:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40001be8:	fcc42783          	lw	a5,-52(s0)
40001bec:	0047d793          	srli	a5,a5,0x4
40001bf0:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40001bf4:	fcc42783          	lw	a5,-52(s0)
40001bf8:	fa079ee3          	bnez	a5,40001bb4 <print32bit+0x20>
    if(i<8) {
40001bfc:	fec42703          	lw	a4,-20(s0)
40001c00:	00700793          	li	a5,7
40001c04:	02e7ce63          	blt	a5,a4,40001c40 <print32bit+0xac>
    	for(int j=7;j>=i;j--){
40001c08:	00700793          	li	a5,7
40001c0c:	fef42423          	sw	a5,-24(s0)
40001c10:	0240006f          	j	40001c34 <print32bit+0xa0>
    		outbuf_inv[j]="0"[0];
40001c14:	03000713          	li	a4,48
40001c18:	fe842783          	lw	a5,-24(s0)
40001c1c:	ff040693          	addi	a3,s0,-16
40001c20:	00f687b3          	add	a5,a3,a5
40001c24:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40001c28:	fe842783          	lw	a5,-24(s0)
40001c2c:	fff78793          	addi	a5,a5,-1
40001c30:	fef42423          	sw	a5,-24(s0)
40001c34:	fe842703          	lw	a4,-24(s0)
40001c38:	fec42783          	lw	a5,-20(s0)
40001c3c:	fcf75ce3          	bge	a4,a5,40001c14 <print32bit+0x80>
    	}
    }
    for(int j=7;j>=0;j--)
40001c40:	00700793          	li	a5,7
40001c44:	fef42223          	sw	a5,-28(s0)
40001c48:	02c0006f          	j	40001c74 <print32bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40001c4c:	fe442783          	lw	a5,-28(s0)
40001c50:	ff040713          	addi	a4,s0,-16
40001c54:	00f707b3          	add	a5,a4,a5
40001c58:	fec7c783          	lbu	a5,-20(a5)
40001c5c:	00078593          	mv	a1,a5
40001c60:	f0010537          	lui	a0,0xf0010
40001c64:	c75ff0ef          	jal	ra,400018d8 <uart_write>
    for(int j=7;j>=0;j--)
40001c68:	fe442783          	lw	a5,-28(s0)
40001c6c:	fff78793          	addi	a5,a5,-1
40001c70:	fef42223          	sw	a5,-28(s0)
40001c74:	fe442783          	lw	a5,-28(s0)
40001c78:	fc07dae3          	bgez	a5,40001c4c <print32bit+0xb8>
    }
    print(" ");
40001c7c:	400037b7          	lui	a5,0x40003
40001c80:	87c78513          	addi	a0,a5,-1924 # 4000287c <vga_simRes_h160_v120+0x20>
40001c84:	db1ff0ef          	jal	ra,40001a34 <print>
}
40001c88:	00000013          	nop
40001c8c:	03c12083          	lw	ra,60(sp)
40001c90:	03812403          	lw	s0,56(sp)
40001c94:	04010113          	addi	sp,sp,64
40001c98:	00008067          	ret

40001c9c <print64bit>:

void print64bit(char *message,uint32_t *num)
{
40001c9c:	fe010113          	addi	sp,sp,-32
40001ca0:	00112e23          	sw	ra,28(sp)
40001ca4:	00812c23          	sw	s0,24(sp)
40001ca8:	02010413          	addi	s0,sp,32
40001cac:	fea42623          	sw	a0,-20(s0)
40001cb0:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40001cb4:	400037b7          	lui	a5,0x40003
40001cb8:	89478513          	addi	a0,a5,-1900 # 40002894 <vga_simRes_h160_v120+0x38>
40001cbc:	d79ff0ef          	jal	ra,40001a34 <print>
	print(message);
40001cc0:	fec42503          	lw	a0,-20(s0)
40001cc4:	d71ff0ef          	jal	ra,40001a34 <print>
	print32bit(num[1]);
40001cc8:	fe842783          	lw	a5,-24(s0)
40001ccc:	00478793          	addi	a5,a5,4
40001cd0:	0007a783          	lw	a5,0(a5)
40001cd4:	00078513          	mv	a0,a5
40001cd8:	ebdff0ef          	jal	ra,40001b94 <print32bit>
	print32bit(num[0]);
40001cdc:	fe842783          	lw	a5,-24(s0)
40001ce0:	0007a783          	lw	a5,0(a5)
40001ce4:	00078513          	mv	a0,a5
40001ce8:	eadff0ef          	jal	ra,40001b94 <print32bit>
	print("\r\n");
40001cec:	400037b7          	lui	a5,0x40003
40001cf0:	89878513          	addi	a0,a5,-1896 # 40002898 <vga_simRes_h160_v120+0x3c>
40001cf4:	d41ff0ef          	jal	ra,40001a34 <print>
}
40001cf8:	00000013          	nop
40001cfc:	01c12083          	lw	ra,28(sp)
40001d00:	01812403          	lw	s0,24(sp)
40001d04:	02010113          	addi	sp,sp,32
40001d08:	00008067          	ret

40001d0c <print128bit>:
void print128bit(char *message, uint32_t *num)
{
40001d0c:	fe010113          	addi	sp,sp,-32
40001d10:	00112e23          	sw	ra,28(sp)
40001d14:	00812c23          	sw	s0,24(sp)
40001d18:	02010413          	addi	s0,sp,32
40001d1c:	fea42623          	sw	a0,-20(s0)
40001d20:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40001d24:	400037b7          	lui	a5,0x40003
40001d28:	89478513          	addi	a0,a5,-1900 # 40002894 <vga_simRes_h160_v120+0x38>
40001d2c:	d09ff0ef          	jal	ra,40001a34 <print>
	print(message);
40001d30:	fec42503          	lw	a0,-20(s0)
40001d34:	d01ff0ef          	jal	ra,40001a34 <print>
	print32bit(num[3]);
40001d38:	fe842783          	lw	a5,-24(s0)
40001d3c:	00c78793          	addi	a5,a5,12
40001d40:	0007a783          	lw	a5,0(a5)
40001d44:	00078513          	mv	a0,a5
40001d48:	e4dff0ef          	jal	ra,40001b94 <print32bit>
	print32bit(num[2]);
40001d4c:	fe842783          	lw	a5,-24(s0)
40001d50:	00878793          	addi	a5,a5,8
40001d54:	0007a783          	lw	a5,0(a5)
40001d58:	00078513          	mv	a0,a5
40001d5c:	e39ff0ef          	jal	ra,40001b94 <print32bit>
	print32bit(num[1]);
40001d60:	fe842783          	lw	a5,-24(s0)
40001d64:	00478793          	addi	a5,a5,4
40001d68:	0007a783          	lw	a5,0(a5)
40001d6c:	00078513          	mv	a0,a5
40001d70:	e25ff0ef          	jal	ra,40001b94 <print32bit>
	print32bit(num[0]);
40001d74:	fe842783          	lw	a5,-24(s0)
40001d78:	0007a783          	lw	a5,0(a5)
40001d7c:	00078513          	mv	a0,a5
40001d80:	e15ff0ef          	jal	ra,40001b94 <print32bit>
	print("\r\n");
40001d84:	400037b7          	lui	a5,0x40003
40001d88:	89878513          	addi	a0,a5,-1896 # 40002898 <vga_simRes_h160_v120+0x3c>
40001d8c:	ca9ff0ef          	jal	ra,40001a34 <print>
}
40001d90:	00000013          	nop
40001d94:	01c12083          	lw	ra,28(sp)
40001d98:	01812403          	lw	s0,24(sp)
40001d9c:	02010113          	addi	sp,sp,32
40001da0:	00008067          	ret

40001da4 <print80bit>:
void print80bit(char *message,uint32_t *num)
{
40001da4:	fe010113          	addi	sp,sp,-32
40001da8:	00112e23          	sw	ra,28(sp)
40001dac:	00812c23          	sw	s0,24(sp)
40001db0:	02010413          	addi	s0,sp,32
40001db4:	fea42623          	sw	a0,-20(s0)
40001db8:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40001dbc:	400037b7          	lui	a5,0x40003
40001dc0:	89478513          	addi	a0,a5,-1900 # 40002894 <vga_simRes_h160_v120+0x38>
40001dc4:	c71ff0ef          	jal	ra,40001a34 <print>
	print(message);
40001dc8:	fec42503          	lw	a0,-20(s0)
40001dcc:	c69ff0ef          	jal	ra,40001a34 <print>
	print32bit(num[2]);
40001dd0:	fe842783          	lw	a5,-24(s0)
40001dd4:	00878793          	addi	a5,a5,8
40001dd8:	0007a783          	lw	a5,0(a5)
40001ddc:	00078513          	mv	a0,a5
40001de0:	db5ff0ef          	jal	ra,40001b94 <print32bit>
	print32bit(num[1]);
40001de4:	fe842783          	lw	a5,-24(s0)
40001de8:	00478793          	addi	a5,a5,4
40001dec:	0007a783          	lw	a5,0(a5)
40001df0:	00078513          	mv	a0,a5
40001df4:	da1ff0ef          	jal	ra,40001b94 <print32bit>
	print16bit(num[0]);
40001df8:	fe842783          	lw	a5,-24(s0)
40001dfc:	0007a783          	lw	a5,0(a5)
40001e00:	00078513          	mv	a0,a5
40001e04:	c89ff0ef          	jal	ra,40001a8c <print16bit>
	print("\r\n");
40001e08:	400037b7          	lui	a5,0x40003
40001e0c:	89878513          	addi	a0,a5,-1896 # 40002898 <vga_simRes_h160_v120+0x3c>
40001e10:	c25ff0ef          	jal	ra,40001a34 <print>
}
40001e14:	00000013          	nop
40001e18:	01c12083          	lw	ra,28(sp)
40001e1c:	01812403          	lw	s0,24(sp)
40001e20:	02010113          	addi	sp,sp,32
40001e24:	00008067          	ret

40001e28 <print256bit>:
void print256bit(char *message, uint32_t *num)
{
40001e28:	fe010113          	addi	sp,sp,-32
40001e2c:	00112e23          	sw	ra,28(sp)
40001e30:	00812c23          	sw	s0,24(sp)
40001e34:	02010413          	addi	s0,sp,32
40001e38:	fea42623          	sw	a0,-20(s0)
40001e3c:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40001e40:	400037b7          	lui	a5,0x40003
40001e44:	89478513          	addi	a0,a5,-1900 # 40002894 <vga_simRes_h160_v120+0x38>
40001e48:	bedff0ef          	jal	ra,40001a34 <print>
	print(message);
40001e4c:	fec42503          	lw	a0,-20(s0)
40001e50:	be5ff0ef          	jal	ra,40001a34 <print>
	print32bit(num[7]);
40001e54:	fe842783          	lw	a5,-24(s0)
40001e58:	01c78793          	addi	a5,a5,28
40001e5c:	0007a783          	lw	a5,0(a5)
40001e60:	00078513          	mv	a0,a5
40001e64:	d31ff0ef          	jal	ra,40001b94 <print32bit>
	print32bit(num[6]);
40001e68:	fe842783          	lw	a5,-24(s0)
40001e6c:	01878793          	addi	a5,a5,24
40001e70:	0007a783          	lw	a5,0(a5)
40001e74:	00078513          	mv	a0,a5
40001e78:	d1dff0ef          	jal	ra,40001b94 <print32bit>
	print32bit(num[5]);
40001e7c:	fe842783          	lw	a5,-24(s0)
40001e80:	01478793          	addi	a5,a5,20
40001e84:	0007a783          	lw	a5,0(a5)
40001e88:	00078513          	mv	a0,a5
40001e8c:	d09ff0ef          	jal	ra,40001b94 <print32bit>
	print32bit(num[4]);
40001e90:	fe842783          	lw	a5,-24(s0)
40001e94:	01078793          	addi	a5,a5,16
40001e98:	0007a783          	lw	a5,0(a5)
40001e9c:	00078513          	mv	a0,a5
40001ea0:	cf5ff0ef          	jal	ra,40001b94 <print32bit>
	print32bit(num[3]);
40001ea4:	fe842783          	lw	a5,-24(s0)
40001ea8:	00c78793          	addi	a5,a5,12
40001eac:	0007a783          	lw	a5,0(a5)
40001eb0:	00078513          	mv	a0,a5
40001eb4:	ce1ff0ef          	jal	ra,40001b94 <print32bit>
	print32bit(num[2]);
40001eb8:	fe842783          	lw	a5,-24(s0)
40001ebc:	00878793          	addi	a5,a5,8
40001ec0:	0007a783          	lw	a5,0(a5)
40001ec4:	00078513          	mv	a0,a5
40001ec8:	ccdff0ef          	jal	ra,40001b94 <print32bit>
	print32bit(num[1]);
40001ecc:	fe842783          	lw	a5,-24(s0)
40001ed0:	00478793          	addi	a5,a5,4
40001ed4:	0007a783          	lw	a5,0(a5)
40001ed8:	00078513          	mv	a0,a5
40001edc:	cb9ff0ef          	jal	ra,40001b94 <print32bit>
	print32bit(num[0]);
40001ee0:	fe842783          	lw	a5,-24(s0)
40001ee4:	0007a783          	lw	a5,0(a5)
40001ee8:	00078513          	mv	a0,a5
40001eec:	ca9ff0ef          	jal	ra,40001b94 <print32bit>
	print("\r\n");
40001ef0:	400037b7          	lui	a5,0x40003
40001ef4:	89878513          	addi	a0,a5,-1896 # 40002898 <vga_simRes_h160_v120+0x3c>
40001ef8:	b3dff0ef          	jal	ra,40001a34 <print>
}
40001efc:	00000013          	nop
40001f00:	01c12083          	lw	ra,28(sp)
40001f04:	01812403          	lw	s0,24(sp)
40001f08:	02010113          	addi	sp,sp,32
40001f0c:	00008067          	ret
