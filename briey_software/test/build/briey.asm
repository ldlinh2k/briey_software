
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
80000068:	d64080e7          	jalr	-668(ra) # 40000dc8 <irqCallback>
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
800000b8:	49418193          	addi	gp,gp,1172 # 40003548 <__global_pointer$>
  .option pop
  la sp, _stack_start
800000bc:	00001117          	auipc	sp,0x1
800000c0:	88410113          	addi	sp,sp,-1916 # 80000940 <_stack_start>

800000c4 <bss_init>:

bss_init:
  la a0, _bss_start
800000c4:	c0003517          	auipc	a0,0xc0003
800000c8:	c8450513          	addi	a0,a0,-892 # 40002d48 <_bss_end>
  la a1, _bss_end
800000cc:	c0003597          	auipc	a1,0xc0003
800000d0:	c7c58593          	addi	a1,a1,-900 # 40002d48 <_bss_end>

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
800000e4:	c0003517          	auipc	a0,0xc0003
800000e8:	c6450513          	addi	a0,a0,-924 # 40002d48 <_bss_end>
  addi sp,sp,-4
800000ec:	ffc10113          	addi	sp,sp,-4

800000f0 <ctors_loop>:
ctors_loop:
  la a1, _ctors_end
800000f0:	c0003597          	auipc	a1,0xc0003
800000f4:	c5858593          	addi	a1,a1,-936 # 40002d48 <_bss_end>
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
40000404:	22478513          	addi	a0,a5,548 # 40002224 <vga_simRes_h160_v120+0x20>
40000408:	0e1010ef          	jal	ra,40001ce8 <print>
4000040c:	0100006f          	j	4000041c <prince_cipher+0x12c>
		else
			print("\r\t=============================PRINCE DECRYPTTION=============================\r\n");
40000410:	400027b7          	lui	a5,0x40002
40000414:	27878513          	addi	a0,a5,632 # 40002278 <vga_simRes_h160_v120+0x74>
40000418:	0d1010ef          	jal	ra,40001ce8 <print>
		print("\r\n");
4000041c:	400027b7          	lui	a5,0x40002
40000420:	2cc78513          	addi	a0,a5,716 # 400022cc <vga_simRes_h160_v120+0xc8>
40000424:	0c5010ef          	jal	ra,40001ce8 <print>
		print64bit("PLAIN_TEXT (64-bit) : ", block);
40000428:	fe442583          	lw	a1,-28(s0)
4000042c:	400027b7          	lui	a5,0x40002
40000430:	2d078513          	addi	a0,a5,720 # 400022d0 <vga_simRes_h160_v120+0xcc>
40000434:	31d010ef          	jal	ra,40001f50 <print64bit>
		print128bit("KEY (128-bit) : ", key);
40000438:	fe842583          	lw	a1,-24(s0)
4000043c:	400027b7          	lui	a5,0x40002
40000440:	2e878513          	addi	a0,a5,744 # 400022e8 <vga_simRes_h160_v120+0xe4>
40000444:	37d010ef          	jal	ra,40001fc0 <print128bit>
		print64bit("RESULT (64-bit) : ", res);
40000448:	fe042583          	lw	a1,-32(s0)
4000044c:	400027b7          	lui	a5,0x40002
40000450:	2fc78513          	addi	a0,a5,764 # 400022fc <vga_simRes_h160_v120+0xf8>
40000454:	2fd010ef          	jal	ra,40001f50 <print64bit>
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
400006e8:	37078513          	addi	a0,a5,880 # 40002370 <vga_simRes_h160_v120+0x20>
400006ec:	5fc010ef          	jal	ra,40001ce8 <print>
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
40000714:	3c478513          	addi	a0,a5,964 # 400023c4 <vga_simRes_h160_v120+0x74>
40000718:	5d0010ef          	jal	ra,40001ce8 <print>

	prince_block[1] 	= 0x01234567;
4000071c:	012347b7          	lui	a5,0x1234
40000720:	56778793          	addi	a5,a5,1383 # 1234567 <_stack_size+0x1233d67>
40000724:	fcf42623          	sw	a5,-52(s0)
	prince_block[0] 	= 0x89abcdef;
40000728:	89abd7b7          	lui	a5,0x89abd
4000072c:	def78793          	addi	a5,a5,-529 # 89abcdef <_stack_start+0x9abc4af>
40000730:	fcf42423          	sw	a5,-56(s0)

	prince_key[3]		= 0x00112233;
40000734:	001127b7          	lui	a5,0x112
40000738:	23378793          	addi	a5,a5,563 # 112233 <_stack_size+0x111a33>
4000073c:	fcf42e23          	sw	a5,-36(s0)
	prince_key[2]		= 0x44556677;
40000740:	445567b7          	lui	a5,0x44556
40000744:	67778793          	addi	a5,a5,1655 # 44556677 <__global_pointer$+0x455312f>
40000748:	fcf42c23          	sw	a5,-40(s0)
	prince_key[1]		= 0x8899aabb;
4000074c:	8899b7b7          	lui	a5,0x8899b
40000750:	abb78793          	addi	a5,a5,-1349 # 8899aabb <_stack_start+0x899a17b>
40000754:	fcf42a23          	sw	a5,-44(s0)
	prince_key[0]		= 0xccddeeff;
40000758:	ccddf7b7          	lui	a5,0xccddf
4000075c:	eff78793          	addi	a5,a5,-257 # ccddeeff <_stack_start+0x4cdde5bf>
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
40000784:	41878513          	addi	a0,a5,1048 # 40002418 <vga_simRes_h160_v120+0xc8>
40000788:	560010ef          	jal	ra,40001ce8 <print>

	prince_block[1] 	= 0xd6dcb597;
4000078c:	d6dcb7b7          	lui	a5,0xd6dcb
40000790:	59778793          	addi	a5,a5,1431 # d6dcb597 <_stack_start+0x56dcac57>
40000794:	fcf42623          	sw	a5,-52(s0)
	prince_block[0] 	= 0x8de756ee;
40000798:	8de757b7          	lui	a5,0x8de75
4000079c:	6ee78793          	addi	a5,a5,1774 # 8de756ee <_stack_start+0xde74dae>
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
	print("\r\n\t===================================TEST 3===================================\r\n");
400007c0:	400027b7          	lui	a5,0x40002
400007c4:	46c78513          	addi	a0,a5,1132 # 4000246c <vga_simRes_h160_v120+0x11c>
400007c8:	520010ef          	jal	ra,40001ce8 <print>

	prince_block[1] 	= 0x69c4e0d8;
400007cc:	69c4e7b7          	lui	a5,0x69c4e
400007d0:	0d878793          	addi	a5,a5,216 # 69c4e0d8 <__global_pointer$+0x29c4ab90>
400007d4:	fcf42623          	sw	a5,-52(s0)
	prince_block[0] 	= 0x6a7b0430;
400007d8:	6a7b07b7          	lui	a5,0x6a7b0
400007dc:	43078793          	addi	a5,a5,1072 # 6a7b0430 <__global_pointer$+0x2a7acee8>
400007e0:	fcf42423          	sw	a5,-56(s0)

	prince_key[3]		= 0xd8cdb780;
400007e4:	d8cdb7b7          	lui	a5,0xd8cdb
400007e8:	78078793          	addi	a5,a5,1920 # d8cdb780 <_stack_start+0x58cdae40>
400007ec:	fcf42e23          	sw	a5,-36(s0)
	prince_key[2]		= 0x70b4c55a;
400007f0:	70b4c7b7          	lui	a5,0x70b4c
400007f4:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b49012>
400007f8:	fcf42c23          	sw	a5,-40(s0)
	prince_key[1]		= 0x818665aa;
400007fc:	818667b7          	lui	a5,0x81866
40000800:	5aa78793          	addi	a5,a5,1450 # 818665aa <_stack_start+0x1865c6a>
40000804:	fcf42a23          	sw	a5,-44(s0)
	prince_key[0]		= 0x0d02dfda;
40000808:	0d02e7b7          	lui	a5,0xd02e
4000080c:	fda78793          	addi	a5,a5,-38 # d02dfda <_stack_size+0xd02d7da>
40000810:	fcf42823          	sw	a5,-48(s0)

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
40000814:	fc040693          	addi	a3,s0,-64
40000818:	fc840713          	addi	a4,s0,-56
4000081c:	fd040793          	addi	a5,s0,-48
40000820:	00070613          	mv	a2,a4
40000824:	00078593          	mv	a1,a5
40000828:	00100513          	li	a0,1
4000082c:	ac5ff0ef          	jal	ra,400002f0 <prince_cipher>
	print("\r\n\t===================================TEST 4===================================\r\n");
40000830:	400027b7          	lui	a5,0x40002
40000834:	4c078513          	addi	a0,a5,1216 # 400024c0 <vga_simRes_h160_v120+0x170>
40000838:	4b0010ef          	jal	ra,40001ce8 <print>

	prince_block[1] 	= 0x43c6b256;
4000083c:	43c6b7b7          	lui	a5,0x43c6b
40000840:	25678793          	addi	a5,a5,598 # 43c6b256 <__global_pointer$+0x3c67d0e>
40000844:	fcf42623          	sw	a5,-52(s0)
	prince_block[0] 	= 0xd79de7e8;
40000848:	d79de7b7          	lui	a5,0xd79de
4000084c:	7e878793          	addi	a5,a5,2024 # d79de7e8 <_stack_start+0x579ddea8>
40000850:	fcf42423          	sw	a5,-56(s0)

	//USE THE SAME KEY

	prince_cipher(PRINCE_OP_DE,prince_key,prince_block,prince_res);
40000854:	fc040693          	addi	a3,s0,-64
40000858:	fc840713          	addi	a4,s0,-56
4000085c:	fd040793          	addi	a5,s0,-48
40000860:	00070613          	mv	a2,a4
40000864:	00078593          	mv	a1,a5
40000868:	00000513          	li	a0,0
4000086c:	a85ff0ef          	jal	ra,400002f0 <prince_cipher>

	print("\r\n");
40000870:	400027b7          	lui	a5,0x40002
40000874:	51478513          	addi	a0,a5,1300 # 40002514 <vga_simRes_h160_v120+0x1c4>
40000878:	470010ef          	jal	ra,40001ce8 <print>
	print("\r\t*********************************AES TEST***********************************\r\n");
4000087c:	400027b7          	lui	a5,0x40002
40000880:	51878513          	addi	a0,a5,1304 # 40002518 <vga_simRes_h160_v120+0x1c8>
40000884:	464010ef          	jal	ra,40001ce8 <print>
    unsigned int aes_key_128[4] = {0x0, 0x0, 0x0, 0x0};
40000888:	fa042823          	sw	zero,-80(s0)
4000088c:	fa042a23          	sw	zero,-76(s0)
40000890:	fa042c23          	sw	zero,-72(s0)
40000894:	fa042e23          	sw	zero,-68(s0)
    unsigned int aes_block[4] 	= {0x0, 0x0, 0x0, 0x0};
40000898:	fa042023          	sw	zero,-96(s0)
4000089c:	fa042223          	sw	zero,-92(s0)
400008a0:	fa042423          	sw	zero,-88(s0)
400008a4:	fa042623          	sw	zero,-84(s0)

    unsigned int aes_res[4] 	= {0x0, 0x0, 0x0, 0x0};
400008a8:	f8042823          	sw	zero,-112(s0)
400008ac:	f8042a23          	sw	zero,-108(s0)
400008b0:	f8042c23          	sw	zero,-104(s0)
400008b4:	f8042e23          	sw	zero,-100(s0)

    print("\r\n\t=================================TEST 1=====================================\r\n");
400008b8:	400027b7          	lui	a5,0x40002
400008bc:	56c78513          	addi	a0,a5,1388 # 4000256c <vga_simRes_h160_v120+0x21c>
400008c0:	428010ef          	jal	ra,40001ce8 <print>

    aes_block[3] 	= 0x33343536;
400008c4:	333437b7          	lui	a5,0x33343
400008c8:	53678793          	addi	a5,a5,1334 # 33343536 <_stack_size+0x33342d36>
400008cc:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0x39303132;
400008d0:	393037b7          	lui	a5,0x39303
400008d4:	13278793          	addi	a5,a5,306 # 39303132 <_stack_size+0x39302932>
400008d8:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x35363738;
400008dc:	353637b7          	lui	a5,0x35363
400008e0:	73878793          	addi	a5,a5,1848 # 35363738 <_stack_size+0x35362f38>
400008e4:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x31323334;
400008e8:	313237b7          	lui	a5,0x31323
400008ec:	33478793          	addi	a5,a5,820 # 31323334 <_stack_size+0x31322b34>
400008f0:	faf42023          	sw	a5,-96(s0)

	aes_key_128[3] 	= 0x37363534;
400008f4:	373637b7          	lui	a5,0x37363
400008f8:	53478793          	addi	a5,a5,1332 # 37363534 <_stack_size+0x37362d34>
400008fc:	faf42e23          	sw	a5,-68(s0)
    aes_key_128[2] 	= 0x31303938;
40000900:	313047b7          	lui	a5,0x31304
40000904:	93878793          	addi	a5,a5,-1736 # 31303938 <_stack_size+0x31303138>
40000908:	faf42c23          	sw	a5,-72(s0)
    aes_key_128[1] 	= 0x35343332;
4000090c:	353437b7          	lui	a5,0x35343
40000910:	33278793          	addi	a5,a5,818 # 35343332 <_stack_size+0x35342b32>
40000914:	faf42a23          	sw	a5,-76(s0)
    aes_key_128[0]	= 0x39383736;
40000918:	393837b7          	lui	a5,0x39383
4000091c:	73678793          	addi	a5,a5,1846 # 39383736 <_stack_size+0x39382f36>
40000920:	faf42823          	sw	a5,-80(s0)

   	aes_128_cipher(AES_OP_EN, aes_key_128, aes_block, aes_res);
40000924:	f9040693          	addi	a3,s0,-112
40000928:	fa040713          	addi	a4,s0,-96
4000092c:	fb040793          	addi	a5,s0,-80
40000930:	00070613          	mv	a2,a4
40000934:	00078593          	mv	a1,a5
40000938:	00100513          	li	a0,1
4000093c:	475000ef          	jal	ra,400015b0 <aes_128_cipher>
   	print("\r\n\t=================================TEST 2=====================================\r\n");
40000940:	400027b7          	lui	a5,0x40002
40000944:	5c078513          	addi	a0,a5,1472 # 400025c0 <vga_simRes_h160_v120+0x270>
40000948:	3a0010ef          	jal	ra,40001ce8 <print>

    aes_block[3] 	= 0xa1e33d0b;
4000094c:	a1e347b7          	lui	a5,0xa1e34
40000950:	d0b78793          	addi	a5,a5,-757 # a1e33d0b <_stack_start+0x21e333cb>
40000954:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0xd07781b2;
40000958:	d07787b7          	lui	a5,0xd0778
4000095c:	1b278793          	addi	a5,a5,434 # d07781b2 <_stack_start+0x50777872>
40000960:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x53e5f4da;
40000964:	53e5f7b7          	lui	a5,0x53e5f
40000968:	4da78793          	addi	a5,a5,1242 # 53e5f4da <__global_pointer$+0x13e5bf92>
4000096c:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x6f2f5312;
40000970:	6f2f57b7          	lui	a5,0x6f2f5
40000974:	31278793          	addi	a5,a5,786 # 6f2f5312 <__global_pointer$+0x2f2f1dca>
40000978:	faf42023          	sw	a5,-96(s0)

    //USE THE SAME KEY

   	aes_128_cipher(AES_OP_DE, aes_key_128, aes_block, aes_res);
4000097c:	f9040693          	addi	a3,s0,-112
40000980:	fa040713          	addi	a4,s0,-96
40000984:	fb040793          	addi	a5,s0,-80
40000988:	00070613          	mv	a2,a4
4000098c:	00078593          	mv	a1,a5
40000990:	00000513          	li	a0,0
40000994:	41d000ef          	jal	ra,400015b0 <aes_128_cipher>
   	print("\r\n\t=================================TEST 3=====================================\r\n");
40000998:	400027b7          	lui	a5,0x40002
4000099c:	61478513          	addi	a0,a5,1556 # 40002614 <vga_simRes_h160_v120+0x2c4>
400009a0:	348010ef          	jal	ra,40001ce8 <print>

    aes_block[3] 	= 0x7393172a;
400009a4:	739317b7          	lui	a5,0x73931
400009a8:	72a78793          	addi	a5,a5,1834 # 7393172a <__global_pointer$+0x3392e1e2>
400009ac:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0xe93d7e11;
400009b0:	e93d87b7          	lui	a5,0xe93d8
400009b4:	e1178793          	addi	a5,a5,-495 # e93d7e11 <_stack_start+0x693d74d1>
400009b8:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x2e409f96;
400009bc:	2e40a7b7          	lui	a5,0x2e40a
400009c0:	f9678793          	addi	a5,a5,-106 # 2e409f96 <_stack_size+0x2e409796>
400009c4:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x6bc1bee2;
400009c8:	6bc1c7b7          	lui	a5,0x6bc1c
400009cc:	ee278793          	addi	a5,a5,-286 # 6bc1bee2 <__global_pointer$+0x2bc1899a>
400009d0:	faf42023          	sw	a5,-96(s0)

	aes_key_128[3] 	= 0x09cf4f3c;
400009d4:	09cf57b7          	lui	a5,0x9cf5
400009d8:	f3c78793          	addi	a5,a5,-196 # 9cf4f3c <_stack_size+0x9cf473c>
400009dc:	faf42e23          	sw	a5,-68(s0)
    aes_key_128[2] 	= 0xabf71588;
400009e0:	abf717b7          	lui	a5,0xabf71
400009e4:	58878793          	addi	a5,a5,1416 # abf71588 <_stack_start+0x2bf70c48>
400009e8:	faf42c23          	sw	a5,-72(s0)
    aes_key_128[1] 	= 0x28aed2a6;
400009ec:	28aed7b7          	lui	a5,0x28aed
400009f0:	2a678793          	addi	a5,a5,678 # 28aed2a6 <_stack_size+0x28aecaa6>
400009f4:	faf42a23          	sw	a5,-76(s0)
    aes_key_128[0]	= 0x2b7e1516;
400009f8:	2b7e17b7          	lui	a5,0x2b7e1
400009fc:	51678793          	addi	a5,a5,1302 # 2b7e1516 <_stack_size+0x2b7e0d16>
40000a00:	faf42823          	sw	a5,-80(s0)
   	aes_128_cipher(AES_OP_EN, aes_key_128, aes_block, aes_res);
40000a04:	f9040693          	addi	a3,s0,-112
40000a08:	fa040713          	addi	a4,s0,-96
40000a0c:	fb040793          	addi	a5,s0,-80
40000a10:	00070613          	mv	a2,a4
40000a14:	00078593          	mv	a1,a5
40000a18:	00100513          	li	a0,1
40000a1c:	395000ef          	jal	ra,400015b0 <aes_128_cipher>
   	print("\r\n\t=================================TEST 4=====================================\r\n");
40000a20:	400027b7          	lui	a5,0x40002
40000a24:	66878513          	addi	a0,a5,1640 # 40002668 <vga_simRes_h160_v120+0x318>
40000a28:	2c0010ef          	jal	ra,40001ce8 <print>

    aes_block[3] 	= 0x2466ef97;
40000a2c:	2466f7b7          	lui	a5,0x2466f
40000a30:	f9778793          	addi	a5,a5,-105 # 2466ef97 <_stack_size+0x2466e797>
40000a34:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0xa89ecaf3;
40000a38:	a89ed7b7          	lui	a5,0xa89ed
40000a3c:	af378793          	addi	a5,a5,-1293 # a89ecaf3 <_stack_start+0x289ec1b3>
40000a40:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x0d7a3660;
40000a44:	0d7a37b7          	lui	a5,0xd7a3
40000a48:	66078793          	addi	a5,a5,1632 # d7a3660 <_stack_size+0xd7a2e60>
40000a4c:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x3ad77bb4;
40000a50:	3ad787b7          	lui	a5,0x3ad78
40000a54:	bb478793          	addi	a5,a5,-1100 # 3ad77bb4 <_stack_size+0x3ad773b4>
40000a58:	faf42023          	sw	a5,-96(s0)

    //USE THE SAME KEY

   	aes_128_cipher(AES_OP_DE, aes_key_128, aes_block, aes_res);
40000a5c:	f9040693          	addi	a3,s0,-112
40000a60:	fa040713          	addi	a4,s0,-96
40000a64:	fb040793          	addi	a5,s0,-80
40000a68:	00070613          	mv	a2,a4
40000a6c:	00078593          	mv	a1,a5
40000a70:	00000513          	li	a0,0
40000a74:	33d000ef          	jal	ra,400015b0 <aes_128_cipher>


   	print("\r\n\t========================================TEST 5(AES256)==========================================\r\n");
40000a78:	400027b7          	lui	a5,0x40002
40000a7c:	6bc78513          	addi	a0,a5,1724 # 400026bc <vga_simRes_h160_v120+0x36c>
40000a80:	268010ef          	jal	ra,40001ce8 <print>
    unsigned int aes_key_256[8] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
40000a84:	f6042823          	sw	zero,-144(s0)
40000a88:	f6042a23          	sw	zero,-140(s0)
40000a8c:	f6042c23          	sw	zero,-136(s0)
40000a90:	f6042e23          	sw	zero,-132(s0)
40000a94:	f8042023          	sw	zero,-128(s0)
40000a98:	f8042223          	sw	zero,-124(s0)
40000a9c:	f8042423          	sw	zero,-120(s0)
40000aa0:	f8042623          	sw	zero,-116(s0)

    aes_block[3] 	= 0x7393172a;
40000aa4:	739317b7          	lui	a5,0x73931
40000aa8:	72a78793          	addi	a5,a5,1834 # 7393172a <__global_pointer$+0x3392e1e2>
40000aac:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0xe93d7e11;
40000ab0:	e93d87b7          	lui	a5,0xe93d8
40000ab4:	e1178793          	addi	a5,a5,-495 # e93d7e11 <_stack_start+0x693d74d1>
40000ab8:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x2e409f96;
40000abc:	2e40a7b7          	lui	a5,0x2e40a
40000ac0:	f9678793          	addi	a5,a5,-106 # 2e409f96 <_stack_size+0x2e409796>
40000ac4:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x6bc1bee2;
40000ac8:	6bc1c7b7          	lui	a5,0x6bc1c
40000acc:	ee278793          	addi	a5,a5,-286 # 6bc1bee2 <__global_pointer$+0x2bc1899a>
40000ad0:	faf42023          	sw	a5,-96(s0)

    aes_key_256[7] 	= 0x0914dff4;
40000ad4:	0914e7b7          	lui	a5,0x914e
40000ad8:	ff478793          	addi	a5,a5,-12 # 914dff4 <_stack_size+0x914d7f4>
40000adc:	f8f42623          	sw	a5,-116(s0)
    aes_key_256[6] 	= 0x2d9810a3;
40000ae0:	2d9817b7          	lui	a5,0x2d981
40000ae4:	0a378793          	addi	a5,a5,163 # 2d9810a3 <_stack_size+0x2d9808a3>
40000ae8:	f8f42423          	sw	a5,-120(s0)
    aes_key_256[5] 	= 0x3b6108d7;
40000aec:	3b6117b7          	lui	a5,0x3b611
40000af0:	8d778793          	addi	a5,a5,-1833 # 3b6108d7 <_stack_size+0x3b6100d7>
40000af4:	f8f42223          	sw	a5,-124(s0)
    aes_key_256[4]	= 0x1f352c07;
40000af8:	1f3537b7          	lui	a5,0x1f353
40000afc:	c0778793          	addi	a5,a5,-1017 # 1f352c07 <_stack_size+0x1f352407>
40000b00:	f8f42023          	sw	a5,-128(s0)
    aes_key_256[3] 	= 0x857d7781;
40000b04:	857d77b7          	lui	a5,0x857d7
40000b08:	78178793          	addi	a5,a5,1921 # 857d7781 <_stack_start+0x57d6e41>
40000b0c:	f6f42e23          	sw	a5,-132(s0)
    aes_key_256[2] 	= 0x2b73aef0;
40000b10:	2b73b7b7          	lui	a5,0x2b73b
40000b14:	ef078793          	addi	a5,a5,-272 # 2b73aef0 <_stack_size+0x2b73a6f0>
40000b18:	f6f42c23          	sw	a5,-136(s0)
    aes_key_256[1] 	= 0x15ca71be;
40000b1c:	15ca77b7          	lui	a5,0x15ca7
40000b20:	1be78793          	addi	a5,a5,446 # 15ca71be <_stack_size+0x15ca69be>
40000b24:	f6f42a23          	sw	a5,-140(s0)
    aes_key_256[0]	= 0x603deb10;
40000b28:	603df7b7          	lui	a5,0x603df
40000b2c:	b1078793          	addi	a5,a5,-1264 # 603deb10 <__global_pointer$+0x203db5c8>
40000b30:	f6f42823          	sw	a5,-144(s0)

    aes_256_cipher(AES_OP_EN, aes_key_256, aes_block, aes_res);
40000b34:	f9040693          	addi	a3,s0,-112
40000b38:	fa040713          	addi	a4,s0,-96
40000b3c:	f7040793          	addi	a5,s0,-144
40000b40:	00070613          	mv	a2,a4
40000b44:	00078593          	mv	a1,a5
40000b48:	00100513          	li	a0,1
40000b4c:	4c9000ef          	jal	ra,40001814 <aes_256_cipher>


   	print("\r\n\t========================================TEST 6(AES256)==========================================\r\n");
40000b50:	400027b7          	lui	a5,0x40002
40000b54:	72478513          	addi	a0,a5,1828 # 40002724 <vga_simRes_h160_v120+0x3d4>
40000b58:	190010ef          	jal	ra,40001ce8 <print>
    aes_block[3] 	= 0x3db181f8 ;
40000b5c:	3db187b7          	lui	a5,0x3db18
40000b60:	1f878793          	addi	a5,a5,504 # 3db181f8 <_stack_size+0x3db179f8>
40000b64:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0x064b5a7e ;
40000b68:	064b67b7          	lui	a5,0x64b6
40000b6c:	a7e78793          	addi	a5,a5,-1410 # 64b5a7e <_stack_size+0x64b527e>
40000b70:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0xb5d2a03c;
40000b74:	b5d2a7b7          	lui	a5,0xb5d2a
40000b78:	03c78793          	addi	a5,a5,60 # b5d2a03c <_stack_start+0x35d296fc>
40000b7c:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0xf3eed1bd;
40000b80:	f3eed7b7          	lui	a5,0xf3eed
40000b84:	1bd78793          	addi	a5,a5,445 # f3eed1bd <_stack_start+0x73eec87d>
40000b88:	faf42023          	sw	a5,-96(s0)

    aes_key_256[7] 	= 0x0914dff4;
40000b8c:	0914e7b7          	lui	a5,0x914e
40000b90:	ff478793          	addi	a5,a5,-12 # 914dff4 <_stack_size+0x914d7f4>
40000b94:	f8f42623          	sw	a5,-116(s0)
    aes_key_256[6] 	= 0x2d9810a3;
40000b98:	2d9817b7          	lui	a5,0x2d981
40000b9c:	0a378793          	addi	a5,a5,163 # 2d9810a3 <_stack_size+0x2d9808a3>
40000ba0:	f8f42423          	sw	a5,-120(s0)
    aes_key_256[5] 	= 0x3b6108d7;
40000ba4:	3b6117b7          	lui	a5,0x3b611
40000ba8:	8d778793          	addi	a5,a5,-1833 # 3b6108d7 <_stack_size+0x3b6100d7>
40000bac:	f8f42223          	sw	a5,-124(s0)
    aes_key_256[4]	= 0x1f352c07;
40000bb0:	1f3537b7          	lui	a5,0x1f353
40000bb4:	c0778793          	addi	a5,a5,-1017 # 1f352c07 <_stack_size+0x1f352407>
40000bb8:	f8f42023          	sw	a5,-128(s0)
    aes_key_256[3] 	= 0x857d7781;
40000bbc:	857d77b7          	lui	a5,0x857d7
40000bc0:	78178793          	addi	a5,a5,1921 # 857d7781 <_stack_start+0x57d6e41>
40000bc4:	f6f42e23          	sw	a5,-132(s0)
    aes_key_256[2] 	= 0x2b73aef0;
40000bc8:	2b73b7b7          	lui	a5,0x2b73b
40000bcc:	ef078793          	addi	a5,a5,-272 # 2b73aef0 <_stack_size+0x2b73a6f0>
40000bd0:	f6f42c23          	sw	a5,-136(s0)
    aes_key_256[1] 	= 0x15ca71be;
40000bd4:	15ca77b7          	lui	a5,0x15ca7
40000bd8:	1be78793          	addi	a5,a5,446 # 15ca71be <_stack_size+0x15ca69be>
40000bdc:	f6f42a23          	sw	a5,-140(s0)
    aes_key_256[0]	= 0x603deb10;
40000be0:	603df7b7          	lui	a5,0x603df
40000be4:	b1078793          	addi	a5,a5,-1264 # 603deb10 <__global_pointer$+0x203db5c8>
40000be8:	f6f42823          	sw	a5,-144(s0)

    aes_256_cipher(AES_OP_DE, aes_key_256, aes_block, aes_res);
40000bec:	f9040693          	addi	a3,s0,-112
40000bf0:	fa040713          	addi	a4,s0,-96
40000bf4:	f7040793          	addi	a5,s0,-144
40000bf8:	00070613          	mv	a2,a4
40000bfc:	00078593          	mv	a1,a5
40000c00:	00000513          	li	a0,0
40000c04:	411000ef          	jal	ra,40001814 <aes_256_cipher>

	print("\r\n");
40000c08:	400027b7          	lui	a5,0x40002
40000c0c:	51478513          	addi	a0,a5,1300 # 40002514 <vga_simRes_h160_v120+0x1c4>
40000c10:	0d8010ef          	jal	ra,40001ce8 <print>
		print("\r\t******************************PRESENT TEST**********************************\r\n");
40000c14:	400027b7          	lui	a5,0x40002
40000c18:	78c78513          	addi	a0,a5,1932 # 4000278c <vga_simRes_h160_v120+0x43c>
40000c1c:	0cc010ef          	jal	ra,40001ce8 <print>
		unsigned int present_key[3] = {0x0, 0x0, 0x0};
40000c20:	f6042223          	sw	zero,-156(s0)
40000c24:	f6042423          	sw	zero,-152(s0)
40000c28:	f6042623          	sw	zero,-148(s0)
		unsigned int present_block[2] 	= {0x0, 0x0};
40000c2c:	f4042e23          	sw	zero,-164(s0)
40000c30:	f6042023          	sw	zero,-160(s0)
		unsigned int present_res[2] 	= {0x0, 0x0};
40000c34:	f4042a23          	sw	zero,-172(s0)
40000c38:	f4042c23          	sw	zero,-168(s0)

		print("\r\n\t==================================TEST 1====================================\r\n");
40000c3c:	400027b7          	lui	a5,0x40002
40000c40:	7e078513          	addi	a0,a5,2016 # 400027e0 <vga_simRes_h160_v120+0x490>
40000c44:	0a4010ef          	jal	ra,40001ce8 <print>

		present_block[1]=0x4c746e67;
40000c48:	4c7477b7          	lui	a5,0x4c747
40000c4c:	e6778793          	addi	a5,a5,-409 # 4c746e67 <__global_pointer$+0xc74391f>
40000c50:	f6f42023          	sw	a5,-160(s0)
		present_block[0]=0x7579656e;
40000c54:	757967b7          	lui	a5,0x75796
40000c58:	56e78793          	addi	a5,a5,1390 # 7579656e <__global_pointer$+0x35793026>
40000c5c:	f4f42e23          	sw	a5,-164(s0)

		present_key[2] = 0x46657465;
40000c60:	466577b7          	lui	a5,0x46657
40000c64:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6653f1d>
40000c68:	f6f42623          	sw	a5,-148(s0)
		present_key[1] = 0x6c48636d;
40000c6c:	6c4867b7          	lui	a5,0x6c486
40000c70:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c482e25>
40000c74:	f6f42423          	sw	a5,-152(s0)
		present_key[0] = 0x7573;
40000c78:	000077b7          	lui	a5,0x7
40000c7c:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
40000c80:	f6f42223          	sw	a5,-156(s0)

		present_cipher(PRESENT_OP_EN,present_key,present_block,present_res);
40000c84:	f5440693          	addi	a3,s0,-172
40000c88:	f5c40713          	addi	a4,s0,-164
40000c8c:	f6440793          	addi	a5,s0,-156
40000c90:	00070613          	mv	a2,a4
40000c94:	00078593          	mv	a1,a5
40000c98:	00000513          	li	a0,0
40000c9c:	47c000ef          	jal	ra,40001118 <present_cipher>

		print("\r\n\t==================================TEST 2====================================\r\n");
40000ca0:	400037b7          	lui	a5,0x40003
40000ca4:	83478513          	addi	a0,a5,-1996 # 40002834 <vga_simRes_h160_v120+0x4e4>
40000ca8:	040010ef          	jal	ra,40001ce8 <print>

		present_block[1]=0x0e1d00d4;
40000cac:	0e1d07b7          	lui	a5,0xe1d0
40000cb0:	0d478793          	addi	a5,a5,212 # e1d00d4 <_stack_size+0xe1cf8d4>
40000cb4:	f6f42023          	sw	a5,-160(s0)
		present_block[0]=0xe46ba99c;
40000cb8:	e46bb7b7          	lui	a5,0xe46bb
40000cbc:	99c78793          	addi	a5,a5,-1636 # e46ba99c <_stack_start+0x646ba05c>
40000cc0:	f4f42e23          	sw	a5,-164(s0)

		present_key[2] = 0x46657465;
40000cc4:	466577b7          	lui	a5,0x46657
40000cc8:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6653f1d>
40000ccc:	f6f42623          	sw	a5,-148(s0)
		present_key[1] = 0x6c48636d;
40000cd0:	6c4867b7          	lui	a5,0x6c486
40000cd4:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c482e25>
40000cd8:	f6f42423          	sw	a5,-152(s0)
		present_key[0] = 0x7573;
40000cdc:	000077b7          	lui	a5,0x7
40000ce0:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
40000ce4:	f6f42223          	sw	a5,-156(s0)

		present_cipher(PRESENT_OP_DE,present_key,present_block,present_res);
40000ce8:	f5440693          	addi	a3,s0,-172
40000cec:	f5c40713          	addi	a4,s0,-164
40000cf0:	f6440793          	addi	a5,s0,-156
40000cf4:	00070613          	mv	a2,a4
40000cf8:	00078593          	mv	a1,a5
40000cfc:	00100513          	li	a0,1
40000d00:	418000ef          	jal	ra,40001118 <present_cipher>

		print("\r\n\t==================================TEST 3====================================\r\n");
40000d04:	400037b7          	lui	a5,0x40003
40000d08:	88878513          	addi	a0,a5,-1912 # 40002888 <vga_simRes_h160_v120+0x538>
40000d0c:	7dd000ef          	jal	ra,40001ce8 <print>

		present_block[1]=0x46657465;
40000d10:	466577b7          	lui	a5,0x46657
40000d14:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6653f1d>
40000d18:	f6f42023          	sw	a5,-160(s0)
		present_block[0]=0x6c5f5553;
40000d1c:	6c5f57b7          	lui	a5,0x6c5f5
40000d20:	55378793          	addi	a5,a5,1363 # 6c5f5553 <__global_pointer$+0x2c5f200b>
40000d24:	f4f42e23          	sw	a5,-164(s0)

		present_key[2] = 0x00000000;
40000d28:	f6042623          	sw	zero,-148(s0)
		present_key[1] = 0x00000000;
40000d2c:	f6042423          	sw	zero,-152(s0)
		present_key[0] = 0x0001;
40000d30:	00100793          	li	a5,1
40000d34:	f6f42223          	sw	a5,-156(s0)
		present_cipher(PRESENT_OP_EN,present_key,present_block,present_res);
40000d38:	f5440693          	addi	a3,s0,-172
40000d3c:	f5c40713          	addi	a4,s0,-164
40000d40:	f6440793          	addi	a5,s0,-156
40000d44:	00070613          	mv	a2,a4
40000d48:	00078593          	mv	a1,a5
40000d4c:	00000513          	li	a0,0
40000d50:	3c8000ef          	jal	ra,40001118 <present_cipher>

		print("\r\n\t==================================TEST 4====================================\r\n");
40000d54:	400037b7          	lui	a5,0x40003
40000d58:	8dc78513          	addi	a0,a5,-1828 # 400028dc <vga_simRes_h160_v120+0x58c>
40000d5c:	78d000ef          	jal	ra,40001ce8 <print>

		present_block[1]=0x9346f086;
40000d60:	9346f7b7          	lui	a5,0x9346f
40000d64:	08678793          	addi	a5,a5,134 # 9346f086 <_stack_start+0x1346e746>
40000d68:	f6f42023          	sw	a5,-160(s0)
		present_block[0]=0xb0b1c9b4;
40000d6c:	b0b1d7b7          	lui	a5,0xb0b1d
40000d70:	9b478793          	addi	a5,a5,-1612 # b0b1c9b4 <_stack_start+0x30b1c074>
40000d74:	f4f42e23          	sw	a5,-164(s0)

		present_key[2] = 0x00000000;
40000d78:	f6042623          	sw	zero,-148(s0)
		present_key[1] = 0x00000000;
40000d7c:	f6042423          	sw	zero,-152(s0)
		present_key[0] = 0x0001;
40000d80:	00100793          	li	a5,1
40000d84:	f6f42223          	sw	a5,-156(s0)

		present_cipher(PRESENT_OP_DE,present_key,present_block,present_res);
40000d88:	f5440693          	addi	a3,s0,-172
40000d8c:	f5c40713          	addi	a4,s0,-164
40000d90:	f6440793          	addi	a5,s0,-156
40000d94:	00070613          	mv	a2,a4
40000d98:	00078593          	mv	a1,a5
40000d9c:	00100513          	li	a0,1
40000da0:	378000ef          	jal	ra,40001118 <present_cipher>
		print("\r\n");
40000da4:	400027b7          	lui	a5,0x40002
40000da8:	51478513          	addi	a0,a5,1300 # 40002514 <vga_simRes_h160_v120+0x1c4>
40000dac:	73d000ef          	jal	ra,40001ce8 <print>
	return 0;	
40000db0:	00000793          	li	a5,0
}
40000db4:	00078513          	mv	a0,a5
40000db8:	0ac12083          	lw	ra,172(sp)
40000dbc:	0a812403          	lw	s0,168(sp)
40000dc0:	0b010113          	addi	sp,sp,176
40000dc4:	00008067          	ret

40000dc8 <irqCallback>:
void irqCallback(){
40000dc8:	ff010113          	addi	sp,sp,-16
40000dcc:	00812623          	sw	s0,12(sp)
40000dd0:	01010413          	addi	s0,sp,16

}
40000dd4:	00000013          	nop
40000dd8:	00c12403          	lw	s0,12(sp)
40000ddc:	01010113          	addi	sp,sp,16
40000de0:	00008067          	ret

40000de4 <timer_init>:
static void timer_init(Timer_Reg *reg){
40000de4:	fe010113          	addi	sp,sp,-32
40000de8:	00812e23          	sw	s0,28(sp)
40000dec:	02010413          	addi	s0,sp,32
40000df0:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000df4:	fec42783          	lw	a5,-20(s0)
40000df8:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000dfc:	fec42783          	lw	a5,-20(s0)
40000e00:	0007a423          	sw	zero,8(a5)
}
40000e04:	00000013          	nop
40000e08:	01c12403          	lw	s0,28(sp)
40000e0c:	02010113          	addi	sp,sp,32
40000e10:	00008067          	ret

40000e14 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40000e14:	fe010113          	addi	sp,sp,-32
40000e18:	00812e23          	sw	s0,28(sp)
40000e1c:	02010413          	addi	s0,sp,32
40000e20:	fea42623          	sw	a0,-20(s0)
}
40000e24:	00000013          	nop
40000e28:	01c12403          	lw	s0,28(sp)
40000e2c:	02010113          	addi	sp,sp,32
40000e30:	00008067          	ret

40000e34 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40000e34:	fe010113          	addi	sp,sp,-32
40000e38:	00812e23          	sw	s0,28(sp)
40000e3c:	02010413          	addi	s0,sp,32
40000e40:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40000e44:	fec42783          	lw	a5,-20(s0)
40000e48:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40000e4c:	fec42783          	lw	a5,-20(s0)
40000e50:	fff00713          	li	a4,-1
40000e54:	00e7a023          	sw	a4,0(a5)
}
40000e58:	00000013          	nop
40000e5c:	01c12403          	lw	s0,28(sp)
40000e60:	02010113          	addi	sp,sp,32
40000e64:	00008067          	ret

40000e68 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40000e68:	fe010113          	addi	sp,sp,-32
40000e6c:	00812e23          	sw	s0,28(sp)
40000e70:	02010413          	addi	s0,sp,32
40000e74:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000e78:	fec42783          	lw	a5,-20(s0)
40000e7c:	0047a783          	lw	a5,4(a5)
40000e80:	0107d793          	srli	a5,a5,0x10
40000e84:	0ff7f793          	zext.b	a5,a5
}
40000e88:	00078513          	mv	a0,a5
40000e8c:	01c12403          	lw	s0,28(sp)
40000e90:	02010113          	addi	sp,sp,32
40000e94:	00008067          	ret

40000e98 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40000e98:	fe010113          	addi	sp,sp,-32
40000e9c:	00812e23          	sw	s0,28(sp)
40000ea0:	02010413          	addi	s0,sp,32
40000ea4:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40000ea8:	fec42783          	lw	a5,-20(s0)
40000eac:	0047a783          	lw	a5,4(a5)
40000eb0:	0187d793          	srli	a5,a5,0x18
}
40000eb4:	00078513          	mv	a0,a5
40000eb8:	01c12403          	lw	s0,28(sp)
40000ebc:	02010113          	addi	sp,sp,32
40000ec0:	00008067          	ret

40000ec4 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40000ec4:	fe010113          	addi	sp,sp,-32
40000ec8:	00112e23          	sw	ra,28(sp)
40000ecc:	00812c23          	sw	s0,24(sp)
40000ed0:	02010413          	addi	s0,sp,32
40000ed4:	fea42623          	sw	a0,-20(s0)
40000ed8:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40000edc:	00000013          	nop
40000ee0:	fec42503          	lw	a0,-20(s0)
40000ee4:	f85ff0ef          	jal	ra,40000e68 <uart_writeAvailability>
40000ee8:	00050793          	mv	a5,a0
40000eec:	fe078ae3          	beqz	a5,40000ee0 <uart_write+0x1c>
	reg->DATA = data;
40000ef0:	fec42783          	lw	a5,-20(s0)
40000ef4:	fe842703          	lw	a4,-24(s0)
40000ef8:	00e7a023          	sw	a4,0(a5)
}
40000efc:	00000013          	nop
40000f00:	01c12083          	lw	ra,28(sp)
40000f04:	01812403          	lw	s0,24(sp)
40000f08:	02010113          	addi	sp,sp,32
40000f0c:	00008067          	ret

40000f10 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40000f10:	fe010113          	addi	sp,sp,-32
40000f14:	00812e23          	sw	s0,28(sp)
40000f18:	02010413          	addi	s0,sp,32
40000f1c:	fea42623          	sw	a0,-20(s0)
40000f20:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40000f24:	fe842783          	lw	a5,-24(s0)
40000f28:	00c7a703          	lw	a4,12(a5)
40000f2c:	fec42783          	lw	a5,-20(s0)
40000f30:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40000f34:	fe842783          	lw	a5,-24(s0)
40000f38:	0007a783          	lw	a5,0(a5)
40000f3c:	fff78713          	addi	a4,a5,-1
40000f40:	fe842783          	lw	a5,-24(s0)
40000f44:	0047a783          	lw	a5,4(a5)
40000f48:	00879793          	slli	a5,a5,0x8
40000f4c:	00f76733          	or	a4,a4,a5
40000f50:	fe842783          	lw	a5,-24(s0)
40000f54:	0087a783          	lw	a5,8(a5)
40000f58:	01079793          	slli	a5,a5,0x10
40000f5c:	00f76733          	or	a4,a4,a5
40000f60:	fec42783          	lw	a5,-20(s0)
40000f64:	00e7a623          	sw	a4,12(a5)
}
40000f68:	00000013          	nop
40000f6c:	01c12403          	lw	s0,28(sp)
40000f70:	02010113          	addi	sp,sp,32
40000f74:	00008067          	ret

40000f78 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40000f78:	fe010113          	addi	sp,sp,-32
40000f7c:	00812e23          	sw	s0,28(sp)
40000f80:	02010413          	addi	s0,sp,32
40000f84:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40000f88:	fec42783          	lw	a5,-20(s0)
40000f8c:	0007a783          	lw	a5,0(a5)
40000f90:	0027f793          	andi	a5,a5,2
40000f94:	00f037b3          	snez	a5,a5
40000f98:	0ff7f793          	zext.b	a5,a5
}
40000f9c:	00078513          	mv	a0,a5
40000fa0:	01c12403          	lw	s0,28(sp)
40000fa4:	02010113          	addi	sp,sp,32
40000fa8:	00008067          	ret

40000fac <vga_run>:
static void vga_run(Vga_Reg *reg){
40000fac:	fe010113          	addi	sp,sp,-32
40000fb0:	00812e23          	sw	s0,28(sp)
40000fb4:	02010413          	addi	s0,sp,32
40000fb8:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40000fbc:	fec42783          	lw	a5,-20(s0)
40000fc0:	00100713          	li	a4,1
40000fc4:	00e7a023          	sw	a4,0(a5)
}
40000fc8:	00000013          	nop
40000fcc:	01c12403          	lw	s0,28(sp)
40000fd0:	02010113          	addi	sp,sp,32
40000fd4:	00008067          	ret

40000fd8 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40000fd8:	fe010113          	addi	sp,sp,-32
40000fdc:	00112e23          	sw	ra,28(sp)
40000fe0:	00812c23          	sw	s0,24(sp)
40000fe4:	02010413          	addi	s0,sp,32
40000fe8:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40000fec:	fec42783          	lw	a5,-20(s0)
40000ff0:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40000ff4:	00000013          	nop
40000ff8:	fec42503          	lw	a0,-20(s0)
40000ffc:	f7dff0ef          	jal	ra,40000f78 <vga_isBusy>
40001000:	00050793          	mv	a5,a0
40001004:	fe079ae3          	bnez	a5,40000ff8 <vga_stop+0x20>
}
40001008:	00000013          	nop
4000100c:	00000013          	nop
40001010:	01c12083          	lw	ra,28(sp)
40001014:	01812403          	lw	s0,24(sp)
40001018:	02010113          	addi	sp,sp,32
4000101c:	00008067          	ret

40001020 <present_write>:
#include "briey.h"
void present_write(uint32_t iData, uint32_t iAddress)
{
40001020:	fe010113          	addi	sp,sp,-32
40001024:	00812e23          	sw	s0,28(sp)
40001028:	02010413          	addi	s0,sp,32
4000102c:	fea42623          	sw	a0,-20(s0)
40001030:	feb42423          	sw	a1,-24(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
40001034:	f00037b7          	lui	a5,0xf0003
40001038:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
4000103c:	fe842703          	lw	a4,-24(s0)
40001040:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->WRITE_N 		= 0;
40001044:	f00037b7          	lui	a5,0xf0003
40001048:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
4000104c:	0007a223          	sw	zero,4(a5)
	PRESENT_BASE->READ_N 		= 1;
40001050:	f00037b7          	lui	a5,0xf0003
40001054:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001058:	00100713          	li	a4,1
4000105c:	00e7a423          	sw	a4,8(a5)
	PRESENT_BASE->IDATA			= iData;
40001060:	f00037b7          	lui	a5,0xf0003
40001064:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001068:	fec42703          	lw	a4,-20(s0)
4000106c:	00e7a823          	sw	a4,16(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
40001070:	f00037b7          	lui	a5,0xf0003
40001074:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001078:	0007a023          	sw	zero,0(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
4000107c:	f00037b7          	lui	a5,0xf0003
40001080:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001084:	00100713          	li	a4,1
40001088:	00e7a023          	sw	a4,0(a5)
}
4000108c:	00000013          	nop
40001090:	01c12403          	lw	s0,28(sp)
40001094:	02010113          	addi	sp,sp,32
40001098:	00008067          	ret

4000109c <present_read>:
uint32_t present_read(uint32_t iAddress)
{
4000109c:	fd010113          	addi	sp,sp,-48
400010a0:	02812623          	sw	s0,44(sp)
400010a4:	03010413          	addi	s0,sp,48
400010a8:	fca42e23          	sw	a0,-36(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
400010ac:	f00037b7          	lui	a5,0xf0003
400010b0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400010b4:	fdc42703          	lw	a4,-36(s0)
400010b8:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->READ_N		= 0;
400010bc:	f00037b7          	lui	a5,0xf0003
400010c0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400010c4:	0007a423          	sw	zero,8(a5)
	PRESENT_BASE->WRITE_N		= 1;
400010c8:	f00037b7          	lui	a5,0xf0003
400010cc:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400010d0:	00100713          	li	a4,1
400010d4:	00e7a223          	sw	a4,4(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
400010d8:	f00037b7          	lui	a5,0xf0003
400010dc:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400010e0:	0007a023          	sw	zero,0(a5)
	uint32_t res 				= PRESENT_BASE->ODATA;
400010e4:	f00037b7          	lui	a5,0xf0003
400010e8:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400010ec:	0147a783          	lw	a5,20(a5)
400010f0:	fef42623          	sw	a5,-20(s0)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
400010f4:	f00037b7          	lui	a5,0xf0003
400010f8:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400010fc:	00100713          	li	a4,1
40001100:	00e7a023          	sw	a4,0(a5)
	return res;
40001104:	fec42783          	lw	a5,-20(s0)
}
40001108:	00078513          	mv	a0,a5
4000110c:	02c12403          	lw	s0,44(sp)
40001110:	03010113          	addi	sp,sp,48
40001114:	00008067          	ret

40001118 <present_cipher>:
void present_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
40001118:	fe010113          	addi	sp,sp,-32
4000111c:	00112e23          	sw	ra,28(sp)
40001120:	00812c23          	sw	s0,24(sp)
40001124:	00912a23          	sw	s1,20(sp)
40001128:	02010413          	addi	s0,sp,32
4000112c:	00050793          	mv	a5,a0
40001130:	feb42423          	sw	a1,-24(s0)
40001134:	fec42223          	sw	a2,-28(s0)
40001138:	fed42023          	sw	a3,-32(s0)
4000113c:	fef407a3          	sb	a5,-17(s0)

	//EN_OR_DE
	if(operation == PRESENT_OP_EN) present_write(PRESENT_OP_EN,PRESENT_ADDR_EN_OR_DE);
40001140:	fef44783          	lbu	a5,-17(s0)
40001144:	00079a63          	bnez	a5,40001158 <present_cipher+0x40>
40001148:	00800593          	li	a1,8
4000114c:	00000513          	li	a0,0
40001150:	ed1ff0ef          	jal	ra,40001020 <present_write>
40001154:	0100006f          	j	40001164 <present_cipher+0x4c>
	else present_write(PRESENT_OP_DE,PRESENT_ADDR_EN_OR_DE);
40001158:	00800593          	li	a1,8
4000115c:	00100513          	li	a0,1
40001160:	ec1ff0ef          	jal	ra,40001020 <present_write>

	//PLAIN_TEXT
	present_write(block[1],PRESENT_ADDR_BLOCK_BASE +1);
40001164:	fe442783          	lw	a5,-28(s0)
40001168:	00478793          	addi	a5,a5,4
4000116c:	0007a783          	lw	a5,0(a5)
40001170:	00500593          	li	a1,5
40001174:	00078513          	mv	a0,a5
40001178:	ea9ff0ef          	jal	ra,40001020 <present_write>
	present_write(block[0],PRESENT_ADDR_BLOCK_BASE);
4000117c:	fe442783          	lw	a5,-28(s0)
40001180:	0007a783          	lw	a5,0(a5)
40001184:	00400593          	li	a1,4
40001188:	00078513          	mv	a0,a5
4000118c:	e95ff0ef          	jal	ra,40001020 <present_write>

	//KEY
	present_write(key[2],PRESENT_ADDR_KEY_BASE +2);
40001190:	fe842783          	lw	a5,-24(s0)
40001194:	00878793          	addi	a5,a5,8
40001198:	0007a783          	lw	a5,0(a5)
4000119c:	00300593          	li	a1,3
400011a0:	00078513          	mv	a0,a5
400011a4:	e7dff0ef          	jal	ra,40001020 <present_write>
	present_write(key[1],PRESENT_ADDR_KEY_BASE +1);
400011a8:	fe842783          	lw	a5,-24(s0)
400011ac:	00478793          	addi	a5,a5,4
400011b0:	0007a783          	lw	a5,0(a5)
400011b4:	00200593          	li	a1,2
400011b8:	00078513          	mv	a0,a5
400011bc:	e65ff0ef          	jal	ra,40001020 <present_write>
	present_write(key[0],PRESENT_ADDR_KEY_BASE);
400011c0:	fe842783          	lw	a5,-24(s0)
400011c4:	0007a783          	lw	a5,0(a5)
400011c8:	00100593          	li	a1,1
400011cc:	00078513          	mv	a0,a5
400011d0:	e51ff0ef          	jal	ra,40001020 <present_write>

	//START
	present_write(0x1,PRESENT_ADDR_START);
400011d4:	00000593          	li	a1,0
400011d8:	00100513          	li	a0,1
400011dc:	e45ff0ef          	jal	ra,40001020 <present_write>
    while(present_read(PRESENT_ADDR_RESULT_BASE) == 0);
400011e0:	00000013          	nop
400011e4:	00600513          	li	a0,6
400011e8:	eb5ff0ef          	jal	ra,4000109c <present_read>
400011ec:	00050793          	mv	a5,a0
400011f0:	fe078ae3          	beqz	a5,400011e4 <present_cipher+0xcc>

    res[1] = present_read(PRESENT_ADDR_RESULT_BASE +1);
400011f4:	fe042783          	lw	a5,-32(s0)
400011f8:	00478493          	addi	s1,a5,4
400011fc:	00700513          	li	a0,7
40001200:	e9dff0ef          	jal	ra,4000109c <present_read>
40001204:	00050793          	mv	a5,a0
40001208:	00f4a023          	sw	a5,0(s1)
    res[0] =present_read(PRESENT_ADDR_RESULT_BASE);
4000120c:	00600513          	li	a0,6
40001210:	e8dff0ef          	jal	ra,4000109c <present_read>
40001214:	00050713          	mv	a4,a0
40001218:	fe042783          	lw	a5,-32(s0)
4000121c:	00e7a023          	sw	a4,0(a5)


    //print result to terminal
	if(operation == PRESENT_OP_EN)
40001220:	fef44783          	lbu	a5,-17(s0)
40001224:	00079a63          	bnez	a5,40001238 <present_cipher+0x120>
		print("\r\t===========================PRESENT ENCRYPTTION==============================\r\n");
40001228:	400037b7          	lui	a5,0x40003
4000122c:	99078513          	addi	a0,a5,-1648 # 40002990 <vga_simRes_h160_v120+0x20>
40001230:	2b9000ef          	jal	ra,40001ce8 <print>
40001234:	0100006f          	j	40001244 <present_cipher+0x12c>
	else
		print("\r\t===========================PRESENT DECRYPTTION==============================\r\n");
40001238:	400037b7          	lui	a5,0x40003
4000123c:	9e478513          	addi	a0,a5,-1564 # 400029e4 <vga_simRes_h160_v120+0x74>
40001240:	2a9000ef          	jal	ra,40001ce8 <print>
	print("\r\n");
40001244:	400037b7          	lui	a5,0x40003
40001248:	a3878513          	addi	a0,a5,-1480 # 40002a38 <vga_simRes_h160_v120+0xc8>
4000124c:	29d000ef          	jal	ra,40001ce8 <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
40001250:	fe442583          	lw	a1,-28(s0)
40001254:	400037b7          	lui	a5,0x40003
40001258:	a3c78513          	addi	a0,a5,-1476 # 40002a3c <vga_simRes_h160_v120+0xcc>
4000125c:	4f5000ef          	jal	ra,40001f50 <print64bit>
	print80bit("KEY (80-bit) : ", key);
40001260:	fe842583          	lw	a1,-24(s0)
40001264:	400037b7          	lui	a5,0x40003
40001268:	a5878513          	addi	a0,a5,-1448 # 40002a58 <vga_simRes_h160_v120+0xe8>
4000126c:	5ed000ef          	jal	ra,40002058 <print80bit>
	print64bit("RESULT (64-bit) : ", res);
40001270:	fe042583          	lw	a1,-32(s0)
40001274:	400037b7          	lui	a5,0x40003
40001278:	a6878513          	addi	a0,a5,-1432 # 40002a68 <vga_simRes_h160_v120+0xf8>
4000127c:	4d5000ef          	jal	ra,40001f50 <print64bit>
	//print("\r\n============================================================================\r\n");
}
40001280:	00000013          	nop
40001284:	01c12083          	lw	ra,28(sp)
40001288:	01812403          	lw	s0,24(sp)
4000128c:	01412483          	lw	s1,20(sp)
40001290:	02010113          	addi	sp,sp,32
40001294:	00008067          	ret

40001298 <timer_init>:
static void timer_init(Timer_Reg *reg){
40001298:	fe010113          	addi	sp,sp,-32
4000129c:	00812e23          	sw	s0,28(sp)
400012a0:	02010413          	addi	s0,sp,32
400012a4:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
400012a8:	fec42783          	lw	a5,-20(s0)
400012ac:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
400012b0:	fec42783          	lw	a5,-20(s0)
400012b4:	0007a423          	sw	zero,8(a5)
}
400012b8:	00000013          	nop
400012bc:	01c12403          	lw	s0,28(sp)
400012c0:	02010113          	addi	sp,sp,32
400012c4:	00008067          	ret

400012c8 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
400012c8:	fe010113          	addi	sp,sp,-32
400012cc:	00812e23          	sw	s0,28(sp)
400012d0:	02010413          	addi	s0,sp,32
400012d4:	fea42623          	sw	a0,-20(s0)
}
400012d8:	00000013          	nop
400012dc:	01c12403          	lw	s0,28(sp)
400012e0:	02010113          	addi	sp,sp,32
400012e4:	00008067          	ret

400012e8 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
400012e8:	fe010113          	addi	sp,sp,-32
400012ec:	00812e23          	sw	s0,28(sp)
400012f0:	02010413          	addi	s0,sp,32
400012f4:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
400012f8:	fec42783          	lw	a5,-20(s0)
400012fc:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001300:	fec42783          	lw	a5,-20(s0)
40001304:	fff00713          	li	a4,-1
40001308:	00e7a023          	sw	a4,0(a5)
}
4000130c:	00000013          	nop
40001310:	01c12403          	lw	s0,28(sp)
40001314:	02010113          	addi	sp,sp,32
40001318:	00008067          	ret

4000131c <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
4000131c:	fe010113          	addi	sp,sp,-32
40001320:	00812e23          	sw	s0,28(sp)
40001324:	02010413          	addi	s0,sp,32
40001328:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
4000132c:	fec42783          	lw	a5,-20(s0)
40001330:	0047a783          	lw	a5,4(a5)
40001334:	0107d793          	srli	a5,a5,0x10
40001338:	0ff7f793          	zext.b	a5,a5
}
4000133c:	00078513          	mv	a0,a5
40001340:	01c12403          	lw	s0,28(sp)
40001344:	02010113          	addi	sp,sp,32
40001348:	00008067          	ret

4000134c <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
4000134c:	fe010113          	addi	sp,sp,-32
40001350:	00812e23          	sw	s0,28(sp)
40001354:	02010413          	addi	s0,sp,32
40001358:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
4000135c:	fec42783          	lw	a5,-20(s0)
40001360:	0047a783          	lw	a5,4(a5)
40001364:	0187d793          	srli	a5,a5,0x18
}
40001368:	00078513          	mv	a0,a5
4000136c:	01c12403          	lw	s0,28(sp)
40001370:	02010113          	addi	sp,sp,32
40001374:	00008067          	ret

40001378 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40001378:	fe010113          	addi	sp,sp,-32
4000137c:	00112e23          	sw	ra,28(sp)
40001380:	00812c23          	sw	s0,24(sp)
40001384:	02010413          	addi	s0,sp,32
40001388:	fea42623          	sw	a0,-20(s0)
4000138c:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40001390:	00000013          	nop
40001394:	fec42503          	lw	a0,-20(s0)
40001398:	f85ff0ef          	jal	ra,4000131c <uart_writeAvailability>
4000139c:	00050793          	mv	a5,a0
400013a0:	fe078ae3          	beqz	a5,40001394 <uart_write+0x1c>
	reg->DATA = data;
400013a4:	fec42783          	lw	a5,-20(s0)
400013a8:	fe842703          	lw	a4,-24(s0)
400013ac:	00e7a023          	sw	a4,0(a5)
}
400013b0:	00000013          	nop
400013b4:	01c12083          	lw	ra,28(sp)
400013b8:	01812403          	lw	s0,24(sp)
400013bc:	02010113          	addi	sp,sp,32
400013c0:	00008067          	ret

400013c4 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
400013c4:	fe010113          	addi	sp,sp,-32
400013c8:	00812e23          	sw	s0,28(sp)
400013cc:	02010413          	addi	s0,sp,32
400013d0:	fea42623          	sw	a0,-20(s0)
400013d4:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
400013d8:	fe842783          	lw	a5,-24(s0)
400013dc:	00c7a703          	lw	a4,12(a5)
400013e0:	fec42783          	lw	a5,-20(s0)
400013e4:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
400013e8:	fe842783          	lw	a5,-24(s0)
400013ec:	0007a783          	lw	a5,0(a5)
400013f0:	fff78713          	addi	a4,a5,-1
400013f4:	fe842783          	lw	a5,-24(s0)
400013f8:	0047a783          	lw	a5,4(a5)
400013fc:	00879793          	slli	a5,a5,0x8
40001400:	00f76733          	or	a4,a4,a5
40001404:	fe842783          	lw	a5,-24(s0)
40001408:	0087a783          	lw	a5,8(a5)
4000140c:	01079793          	slli	a5,a5,0x10
40001410:	00f76733          	or	a4,a4,a5
40001414:	fec42783          	lw	a5,-20(s0)
40001418:	00e7a623          	sw	a4,12(a5)
}
4000141c:	00000013          	nop
40001420:	01c12403          	lw	s0,28(sp)
40001424:	02010113          	addi	sp,sp,32
40001428:	00008067          	ret

4000142c <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
4000142c:	fe010113          	addi	sp,sp,-32
40001430:	00812e23          	sw	s0,28(sp)
40001434:	02010413          	addi	s0,sp,32
40001438:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
4000143c:	fec42783          	lw	a5,-20(s0)
40001440:	0007a783          	lw	a5,0(a5)
40001444:	0027f793          	andi	a5,a5,2
40001448:	00f037b3          	snez	a5,a5
4000144c:	0ff7f793          	zext.b	a5,a5
}
40001450:	00078513          	mv	a0,a5
40001454:	01c12403          	lw	s0,28(sp)
40001458:	02010113          	addi	sp,sp,32
4000145c:	00008067          	ret

40001460 <vga_run>:
static void vga_run(Vga_Reg *reg){
40001460:	fe010113          	addi	sp,sp,-32
40001464:	00812e23          	sw	s0,28(sp)
40001468:	02010413          	addi	s0,sp,32
4000146c:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40001470:	fec42783          	lw	a5,-20(s0)
40001474:	00100713          	li	a4,1
40001478:	00e7a023          	sw	a4,0(a5)
}
4000147c:	00000013          	nop
40001480:	01c12403          	lw	s0,28(sp)
40001484:	02010113          	addi	sp,sp,32
40001488:	00008067          	ret

4000148c <vga_stop>:
static void vga_stop(Vga_Reg *reg){
4000148c:	fe010113          	addi	sp,sp,-32
40001490:	00112e23          	sw	ra,28(sp)
40001494:	00812c23          	sw	s0,24(sp)
40001498:	02010413          	addi	s0,sp,32
4000149c:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
400014a0:	fec42783          	lw	a5,-20(s0)
400014a4:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
400014a8:	00000013          	nop
400014ac:	fec42503          	lw	a0,-20(s0)
400014b0:	f7dff0ef          	jal	ra,4000142c <vga_isBusy>
400014b4:	00050793          	mv	a5,a0
400014b8:	fe079ae3          	bnez	a5,400014ac <vga_stop+0x20>
}
400014bc:	00000013          	nop
400014c0:	00000013          	nop
400014c4:	01c12083          	lw	ra,28(sp)
400014c8:	01812403          	lw	s0,24(sp)
400014cc:	02010113          	addi	sp,sp,32
400014d0:	00008067          	ret

400014d4 <aes_write>:
#include "briey.h"
void aes_write(uint32_t iData, uint32_t iAddress)
{
400014d4:	fe010113          	addi	sp,sp,-32
400014d8:	00812e23          	sw	s0,28(sp)
400014dc:	02010413          	addi	s0,sp,32
400014e0:	fea42623          	sw	a0,-20(s0)
400014e4:	feb42423          	sw	a1,-24(s0)
	AES_BASE->ADDRESS		= iAddress;
400014e8:	f00027b7          	lui	a5,0xf0002
400014ec:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400014f0:	fe842703          	lw	a4,-24(s0)
400014f4:	00e7a423          	sw	a4,8(a5)
	AES_BASE->WRITE_ENABLE 	= 1;
400014f8:	f00027b7          	lui	a5,0xf0002
400014fc:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001500:	00100713          	li	a4,1
40001504:	00e7a223          	sw	a4,4(a5)
	AES_BASE->IDATA			= iData;
40001508:	f00027b7          	lui	a5,0xf0002
4000150c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001510:	fec42703          	lw	a4,-20(s0)
40001514:	00e7a623          	sw	a4,12(a5)
	AES_BASE->CHIP_SELECT	= 1;
40001518:	f00027b7          	lui	a5,0xf0002
4000151c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001520:	00100713          	li	a4,1
40001524:	00e7a023          	sw	a4,0(a5)
	AES_BASE->CHIP_SELECT	= 0;
40001528:	f00027b7          	lui	a5,0xf0002
4000152c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001530:	0007a023          	sw	zero,0(a5)
}
40001534:	00000013          	nop
40001538:	01c12403          	lw	s0,28(sp)
4000153c:	02010113          	addi	sp,sp,32
40001540:	00008067          	ret

40001544 <aes_read>:
uint32_t aes_read(uint32_t iAddress)
{
40001544:	fd010113          	addi	sp,sp,-48
40001548:	02812623          	sw	s0,44(sp)
4000154c:	03010413          	addi	s0,sp,48
40001550:	fca42e23          	sw	a0,-36(s0)
	AES_BASE->ADDRESS		= iAddress;
40001554:	f00027b7          	lui	a5,0xf0002
40001558:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000155c:	fdc42703          	lw	a4,-36(s0)
40001560:	00e7a423          	sw	a4,8(a5)
	AES_BASE->WRITE_ENABLE	= 0;
40001564:	f00027b7          	lui	a5,0xf0002
40001568:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000156c:	0007a223          	sw	zero,4(a5)
	AES_BASE->CHIP_SELECT	= 1;
40001570:	f00027b7          	lui	a5,0xf0002
40001574:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001578:	00100713          	li	a4,1
4000157c:	00e7a023          	sw	a4,0(a5)
	uint32_t res 				= AES_BASE->ODATA;
40001580:	f00027b7          	lui	a5,0xf0002
40001584:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001588:	0107a783          	lw	a5,16(a5)
4000158c:	fef42623          	sw	a5,-20(s0)
	AES_BASE->CHIP_SELECT	= 0;
40001590:	f00027b7          	lui	a5,0xf0002
40001594:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001598:	0007a023          	sw	zero,0(a5)
	return res;
4000159c:	fec42783          	lw	a5,-20(s0)
}
400015a0:	00078513          	mv	a0,a5
400015a4:	02c12403          	lw	s0,44(sp)
400015a8:	03010113          	addi	sp,sp,48
400015ac:	00008067          	ret

400015b0 <aes_128_cipher>:
void aes_128_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
400015b0:	fd010113          	addi	sp,sp,-48
400015b4:	02112623          	sw	ra,44(sp)
400015b8:	02812423          	sw	s0,40(sp)
400015bc:	02912223          	sw	s1,36(sp)
400015c0:	03010413          	addi	s0,sp,48
400015c4:	00050793          	mv	a5,a0
400015c8:	fcb42c23          	sw	a1,-40(s0)
400015cc:	fcc42a23          	sw	a2,-44(s0)
400015d0:	fcd42823          	sw	a3,-48(s0)
400015d4:	fcf40fa3          	sb	a5,-33(s0)
	aes_write(0x0,AES_ADDR_KEY_BASE +7);
400015d8:	01700593          	li	a1,23
400015dc:	00000513          	li	a0,0
400015e0:	ef5ff0ef          	jal	ra,400014d4 <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +6);
400015e4:	01600593          	li	a1,22
400015e8:	00000513          	li	a0,0
400015ec:	ee9ff0ef          	jal	ra,400014d4 <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +5);
400015f0:	01500593          	li	a1,21
400015f4:	00000513          	li	a0,0
400015f8:	eddff0ef          	jal	ra,400014d4 <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +4);
400015fc:	01400593          	li	a1,20
40001600:	00000513          	li	a0,0
40001604:	ed1ff0ef          	jal	ra,400014d4 <aes_write>
	aes_write(key[3],AES_ADDR_KEY_BASE +3);
40001608:	fd842783          	lw	a5,-40(s0)
4000160c:	00c78793          	addi	a5,a5,12
40001610:	0007a783          	lw	a5,0(a5)
40001614:	01300593          	li	a1,19
40001618:	00078513          	mv	a0,a5
4000161c:	eb9ff0ef          	jal	ra,400014d4 <aes_write>
	aes_write(key[2],AES_ADDR_KEY_BASE +2);
40001620:	fd842783          	lw	a5,-40(s0)
40001624:	00878793          	addi	a5,a5,8
40001628:	0007a783          	lw	a5,0(a5)
4000162c:	01200593          	li	a1,18
40001630:	00078513          	mv	a0,a5
40001634:	ea1ff0ef          	jal	ra,400014d4 <aes_write>
	aes_write(key[1],AES_ADDR_KEY_BASE +1);
40001638:	fd842783          	lw	a5,-40(s0)
4000163c:	00478793          	addi	a5,a5,4
40001640:	0007a783          	lw	a5,0(a5)
40001644:	01100593          	li	a1,17
40001648:	00078513          	mv	a0,a5
4000164c:	e89ff0ef          	jal	ra,400014d4 <aes_write>
	aes_write(key[0],AES_ADDR_KEY_BASE);
40001650:	fd842783          	lw	a5,-40(s0)
40001654:	0007a783          	lw	a5,0(a5)
40001658:	01000593          	li	a1,16
4000165c:	00078513          	mv	a0,a5
40001660:	e75ff0ef          	jal	ra,400014d4 <aes_write>

	aes_write(AES_CONFIG_128_KEY,AES_ADDR_CONFIG);
40001664:	00a00593          	li	a1,10
40001668:	00000513          	li	a0,0
4000166c:	e69ff0ef          	jal	ra,400014d4 <aes_write>
	aes_write(AES_CTRL_INIT_KEY,AES_ADDR_CTRL);
40001670:	00800593          	li	a1,8
40001674:	00100513          	li	a0,1
40001678:	e5dff0ef          	jal	ra,400014d4 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
4000167c:	00000013          	nop
40001680:	00900513          	li	a0,9
40001684:	ec1ff0ef          	jal	ra,40001544 <aes_read>
40001688:	00050793          	mv	a5,a0
4000168c:	fe078ae3          	beqz	a5,40001680 <aes_128_cipher+0xd0>

    aes_write(block[3],AES_ADDR_BLOCK_BASE + 3);
40001690:	fd442783          	lw	a5,-44(s0)
40001694:	00c78793          	addi	a5,a5,12
40001698:	0007a783          	lw	a5,0(a5)
4000169c:	02300593          	li	a1,35
400016a0:	00078513          	mv	a0,a5
400016a4:	e31ff0ef          	jal	ra,400014d4 <aes_write>
    aes_write(block[2],AES_ADDR_BLOCK_BASE + 2);
400016a8:	fd442783          	lw	a5,-44(s0)
400016ac:	00878793          	addi	a5,a5,8
400016b0:	0007a783          	lw	a5,0(a5)
400016b4:	02200593          	li	a1,34
400016b8:	00078513          	mv	a0,a5
400016bc:	e19ff0ef          	jal	ra,400014d4 <aes_write>
    aes_write(block[1],AES_ADDR_BLOCK_BASE + 1);
400016c0:	fd442783          	lw	a5,-44(s0)
400016c4:	00478793          	addi	a5,a5,4
400016c8:	0007a783          	lw	a5,0(a5)
400016cc:	02100593          	li	a1,33
400016d0:	00078513          	mv	a0,a5
400016d4:	e01ff0ef          	jal	ra,400014d4 <aes_write>
    aes_write(block[0],AES_ADDR_BLOCK_BASE + 0);
400016d8:	fd442783          	lw	a5,-44(s0)
400016dc:	0007a783          	lw	a5,0(a5)
400016e0:	02000593          	li	a1,32
400016e4:	00078513          	mv	a0,a5
400016e8:	dedff0ef          	jal	ra,400014d4 <aes_write>


    unsigned char AES_CONFIG = 0x00;
400016ec:	fe0407a3          	sb	zero,-17(s0)
	if (operation == 0x01)
400016f0:	fdf44703          	lbu	a4,-33(s0)
400016f4:	00100793          	li	a5,1
400016f8:	00f71863          	bne	a4,a5,40001708 <aes_128_cipher+0x158>
		AES_CONFIG = AES_CONFIG_128_EN;
400016fc:	00100793          	li	a5,1
40001700:	fef407a3          	sb	a5,-17(s0)
40001704:	0080006f          	j	4000170c <aes_128_cipher+0x15c>
	else
		AES_CONFIG = AES_CONFIG_128_DE;
40001708:	fe0407a3          	sb	zero,-17(s0)

	aes_write(AES_CONFIG,AES_ADDR_CONFIG);
4000170c:	fef44783          	lbu	a5,-17(s0)
40001710:	00a00593          	li	a1,10
40001714:	00078513          	mv	a0,a5
40001718:	dbdff0ef          	jal	ra,400014d4 <aes_write>
    aes_write(AES_CTRL_START, AES_ADDR_CTRL);
4000171c:	00800593          	li	a1,8
40001720:	00200513          	li	a0,2
40001724:	db1ff0ef          	jal	ra,400014d4 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
40001728:	00000013          	nop
4000172c:	00900513          	li	a0,9
40001730:	e15ff0ef          	jal	ra,40001544 <aes_read>
40001734:	00050793          	mv	a5,a0
40001738:	fe078ae3          	beqz	a5,4000172c <aes_128_cipher+0x17c>

    res[3] = aes_read(AES_ADDR_RESULT_BASE + 3);
4000173c:	fd042783          	lw	a5,-48(s0)
40001740:	00c78493          	addi	s1,a5,12
40001744:	03300513          	li	a0,51
40001748:	dfdff0ef          	jal	ra,40001544 <aes_read>
4000174c:	00050793          	mv	a5,a0
40001750:	00f4a023          	sw	a5,0(s1)
    res[2] = aes_read(AES_ADDR_RESULT_BASE + 2);
40001754:	fd042783          	lw	a5,-48(s0)
40001758:	00878493          	addi	s1,a5,8
4000175c:	03200513          	li	a0,50
40001760:	de5ff0ef          	jal	ra,40001544 <aes_read>
40001764:	00050793          	mv	a5,a0
40001768:	00f4a023          	sw	a5,0(s1)
    res[1] = aes_read(AES_ADDR_RESULT_BASE + 1);
4000176c:	fd042783          	lw	a5,-48(s0)
40001770:	00478493          	addi	s1,a5,4
40001774:	03100513          	li	a0,49
40001778:	dcdff0ef          	jal	ra,40001544 <aes_read>
4000177c:	00050793          	mv	a5,a0
40001780:	00f4a023          	sw	a5,0(s1)
    res[0] = aes_read(AES_ADDR_RESULT_BASE + 0);
40001784:	03000513          	li	a0,48
40001788:	dbdff0ef          	jal	ra,40001544 <aes_read>
4000178c:	00050713          	mv	a4,a0
40001790:	fd042783          	lw	a5,-48(s0)
40001794:	00e7a023          	sw	a4,0(a5)

    //print result to terminal
	if(operation == 0x1)
40001798:	fdf44703          	lbu	a4,-33(s0)
4000179c:	00100793          	li	a5,1
400017a0:	00f71a63          	bne	a4,a5,400017b4 <aes_128_cipher+0x204>
		print("\r\t============================AES128 ENCRYPTTION==============================\r\n");
400017a4:	400037b7          	lui	a5,0x40003
400017a8:	adc78513          	addi	a0,a5,-1316 # 40002adc <vga_simRes_h160_v120+0x20>
400017ac:	53c000ef          	jal	ra,40001ce8 <print>
400017b0:	0100006f          	j	400017c0 <aes_128_cipher+0x210>
	else
		print("\r\t============================AES128 DECRYPTTION==============================\r\n");
400017b4:	400037b7          	lui	a5,0x40003
400017b8:	b3078513          	addi	a0,a5,-1232 # 40002b30 <vga_simRes_h160_v120+0x74>
400017bc:	52c000ef          	jal	ra,40001ce8 <print>
	print("\r\n");
400017c0:	400037b7          	lui	a5,0x40003
400017c4:	b8478513          	addi	a0,a5,-1148 # 40002b84 <vga_simRes_h160_v120+0xc8>
400017c8:	520000ef          	jal	ra,40001ce8 <print>
	print128bit("\r\tPLAIN_TEXT (128-bit) : ", block);
400017cc:	fd442583          	lw	a1,-44(s0)
400017d0:	400037b7          	lui	a5,0x40003
400017d4:	b8878513          	addi	a0,a5,-1144 # 40002b88 <vga_simRes_h160_v120+0xcc>
400017d8:	7e8000ef          	jal	ra,40001fc0 <print128bit>
	print128bit("KEY (128-bit) : ", key);
400017dc:	fd842583          	lw	a1,-40(s0)
400017e0:	400037b7          	lui	a5,0x40003
400017e4:	ba478513          	addi	a0,a5,-1116 # 40002ba4 <vga_simRes_h160_v120+0xe8>
400017e8:	7d8000ef          	jal	ra,40001fc0 <print128bit>
	print128bit("RESULT (128-bit) : ", res);
400017ec:	fd042583          	lw	a1,-48(s0)
400017f0:	400037b7          	lui	a5,0x40003
400017f4:	bb878513          	addi	a0,a5,-1096 # 40002bb8 <vga_simRes_h160_v120+0xfc>
400017f8:	7c8000ef          	jal	ra,40001fc0 <print128bit>
}
400017fc:	00000013          	nop
40001800:	02c12083          	lw	ra,44(sp)
40001804:	02812403          	lw	s0,40(sp)
40001808:	02412483          	lw	s1,36(sp)
4000180c:	03010113          	addi	sp,sp,48
40001810:	00008067          	ret

40001814 <aes_256_cipher>:

void aes_256_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
40001814:	fd010113          	addi	sp,sp,-48
40001818:	02112623          	sw	ra,44(sp)
4000181c:	02812423          	sw	s0,40(sp)
40001820:	02912223          	sw	s1,36(sp)
40001824:	03010413          	addi	s0,sp,48
40001828:	00050793          	mv	a5,a0
4000182c:	fcb42c23          	sw	a1,-40(s0)
40001830:	fcc42a23          	sw	a2,-44(s0)
40001834:	fcd42823          	sw	a3,-48(s0)
40001838:	fcf40fa3          	sb	a5,-33(s0)
	aes_write(key[7],AES_ADDR_KEY_BASE +7);
4000183c:	fd842783          	lw	a5,-40(s0)
40001840:	01c78793          	addi	a5,a5,28
40001844:	0007a783          	lw	a5,0(a5)
40001848:	01700593          	li	a1,23
4000184c:	00078513          	mv	a0,a5
40001850:	c85ff0ef          	jal	ra,400014d4 <aes_write>
	aes_write(key[6],AES_ADDR_KEY_BASE +6);
40001854:	fd842783          	lw	a5,-40(s0)
40001858:	01878793          	addi	a5,a5,24
4000185c:	0007a783          	lw	a5,0(a5)
40001860:	01600593          	li	a1,22
40001864:	00078513          	mv	a0,a5
40001868:	c6dff0ef          	jal	ra,400014d4 <aes_write>
	aes_write(key[5],AES_ADDR_KEY_BASE +5);
4000186c:	fd842783          	lw	a5,-40(s0)
40001870:	01478793          	addi	a5,a5,20
40001874:	0007a783          	lw	a5,0(a5)
40001878:	01500593          	li	a1,21
4000187c:	00078513          	mv	a0,a5
40001880:	c55ff0ef          	jal	ra,400014d4 <aes_write>
	aes_write(key[4],AES_ADDR_KEY_BASE +4);
40001884:	fd842783          	lw	a5,-40(s0)
40001888:	01078793          	addi	a5,a5,16
4000188c:	0007a783          	lw	a5,0(a5)
40001890:	01400593          	li	a1,20
40001894:	00078513          	mv	a0,a5
40001898:	c3dff0ef          	jal	ra,400014d4 <aes_write>
	aes_write(key[3],AES_ADDR_KEY_BASE +3);
4000189c:	fd842783          	lw	a5,-40(s0)
400018a0:	00c78793          	addi	a5,a5,12
400018a4:	0007a783          	lw	a5,0(a5)
400018a8:	01300593          	li	a1,19
400018ac:	00078513          	mv	a0,a5
400018b0:	c25ff0ef          	jal	ra,400014d4 <aes_write>
	aes_write(key[2],AES_ADDR_KEY_BASE +2);
400018b4:	fd842783          	lw	a5,-40(s0)
400018b8:	00878793          	addi	a5,a5,8
400018bc:	0007a783          	lw	a5,0(a5)
400018c0:	01200593          	li	a1,18
400018c4:	00078513          	mv	a0,a5
400018c8:	c0dff0ef          	jal	ra,400014d4 <aes_write>
	aes_write(key[1],AES_ADDR_KEY_BASE +1);
400018cc:	fd842783          	lw	a5,-40(s0)
400018d0:	00478793          	addi	a5,a5,4
400018d4:	0007a783          	lw	a5,0(a5)
400018d8:	01100593          	li	a1,17
400018dc:	00078513          	mv	a0,a5
400018e0:	bf5ff0ef          	jal	ra,400014d4 <aes_write>
	aes_write(key[0],AES_ADDR_KEY_BASE);
400018e4:	fd842783          	lw	a5,-40(s0)
400018e8:	0007a783          	lw	a5,0(a5)
400018ec:	01000593          	li	a1,16
400018f0:	00078513          	mv	a0,a5
400018f4:	be1ff0ef          	jal	ra,400014d4 <aes_write>

	aes_write(AES_CONFIG_256_KEY,AES_ADDR_CONFIG);
400018f8:	00a00593          	li	a1,10
400018fc:	00200513          	li	a0,2
40001900:	bd5ff0ef          	jal	ra,400014d4 <aes_write>
	aes_write(AES_CTRL_INIT_KEY,AES_ADDR_CTRL);
40001904:	00800593          	li	a1,8
40001908:	00100513          	li	a0,1
4000190c:	bc9ff0ef          	jal	ra,400014d4 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
40001910:	00000013          	nop
40001914:	00900513          	li	a0,9
40001918:	c2dff0ef          	jal	ra,40001544 <aes_read>
4000191c:	00050793          	mv	a5,a0
40001920:	fe078ae3          	beqz	a5,40001914 <aes_256_cipher+0x100>

    aes_write(block[3],AES_ADDR_BLOCK_BASE + 3);
40001924:	fd442783          	lw	a5,-44(s0)
40001928:	00c78793          	addi	a5,a5,12
4000192c:	0007a783          	lw	a5,0(a5)
40001930:	02300593          	li	a1,35
40001934:	00078513          	mv	a0,a5
40001938:	b9dff0ef          	jal	ra,400014d4 <aes_write>
    aes_write(block[2],AES_ADDR_BLOCK_BASE + 2);
4000193c:	fd442783          	lw	a5,-44(s0)
40001940:	00878793          	addi	a5,a5,8
40001944:	0007a783          	lw	a5,0(a5)
40001948:	02200593          	li	a1,34
4000194c:	00078513          	mv	a0,a5
40001950:	b85ff0ef          	jal	ra,400014d4 <aes_write>
    aes_write(block[1],AES_ADDR_BLOCK_BASE + 1);
40001954:	fd442783          	lw	a5,-44(s0)
40001958:	00478793          	addi	a5,a5,4
4000195c:	0007a783          	lw	a5,0(a5)
40001960:	02100593          	li	a1,33
40001964:	00078513          	mv	a0,a5
40001968:	b6dff0ef          	jal	ra,400014d4 <aes_write>
    aes_write(block[0],AES_ADDR_BLOCK_BASE + 0);
4000196c:	fd442783          	lw	a5,-44(s0)
40001970:	0007a783          	lw	a5,0(a5)
40001974:	02000593          	li	a1,32
40001978:	00078513          	mv	a0,a5
4000197c:	b59ff0ef          	jal	ra,400014d4 <aes_write>


    unsigned char AES_CONFIG = 0x00;
40001980:	fe0407a3          	sb	zero,-17(s0)
	if (operation == 0x01)
40001984:	fdf44703          	lbu	a4,-33(s0)
40001988:	00100793          	li	a5,1
4000198c:	00f71863          	bne	a4,a5,4000199c <aes_256_cipher+0x188>
		AES_CONFIG = AES_CONFIG_256_EN;
40001990:	00300793          	li	a5,3
40001994:	fef407a3          	sb	a5,-17(s0)
40001998:	00c0006f          	j	400019a4 <aes_256_cipher+0x190>
	else
		AES_CONFIG = AES_CONFIG_256_DE;
4000199c:	00200793          	li	a5,2
400019a0:	fef407a3          	sb	a5,-17(s0)

	aes_write(AES_CONFIG, AES_ADDR_CONFIG);
400019a4:	fef44783          	lbu	a5,-17(s0)
400019a8:	00a00593          	li	a1,10
400019ac:	00078513          	mv	a0,a5
400019b0:	b25ff0ef          	jal	ra,400014d4 <aes_write>
    aes_write(AES_CTRL_START, AES_ADDR_CTRL);
400019b4:	00800593          	li	a1,8
400019b8:	00200513          	li	a0,2
400019bc:	b19ff0ef          	jal	ra,400014d4 <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
400019c0:	00000013          	nop
400019c4:	00900513          	li	a0,9
400019c8:	b7dff0ef          	jal	ra,40001544 <aes_read>
400019cc:	00050793          	mv	a5,a0
400019d0:	fe078ae3          	beqz	a5,400019c4 <aes_256_cipher+0x1b0>

    res[3] = aes_read(AES_ADDR_RESULT_BASE + 3);
400019d4:	fd042783          	lw	a5,-48(s0)
400019d8:	00c78493          	addi	s1,a5,12
400019dc:	03300513          	li	a0,51
400019e0:	b65ff0ef          	jal	ra,40001544 <aes_read>
400019e4:	00050793          	mv	a5,a0
400019e8:	00f4a023          	sw	a5,0(s1)
    res[2] = aes_read(AES_ADDR_RESULT_BASE + 2);
400019ec:	fd042783          	lw	a5,-48(s0)
400019f0:	00878493          	addi	s1,a5,8
400019f4:	03200513          	li	a0,50
400019f8:	b4dff0ef          	jal	ra,40001544 <aes_read>
400019fc:	00050793          	mv	a5,a0
40001a00:	00f4a023          	sw	a5,0(s1)
    res[1] = aes_read(AES_ADDR_RESULT_BASE + 1);
40001a04:	fd042783          	lw	a5,-48(s0)
40001a08:	00478493          	addi	s1,a5,4
40001a0c:	03100513          	li	a0,49
40001a10:	b35ff0ef          	jal	ra,40001544 <aes_read>
40001a14:	00050793          	mv	a5,a0
40001a18:	00f4a023          	sw	a5,0(s1)
    res[0] = aes_read(AES_ADDR_RESULT_BASE + 0);
40001a1c:	03000513          	li	a0,48
40001a20:	b25ff0ef          	jal	ra,40001544 <aes_read>
40001a24:	00050713          	mv	a4,a0
40001a28:	fd042783          	lw	a5,-48(s0)
40001a2c:	00e7a023          	sw	a4,0(a5)

    //print result to terminal
	if(operation == 0x1)
40001a30:	fdf44703          	lbu	a4,-33(s0)
40001a34:	00100793          	li	a5,1
40001a38:	00f71a63          	bne	a4,a5,40001a4c <aes_256_cipher+0x238>
		print("\r\t======================================AES256 ENCRYPTTION========================================\r\n");
40001a3c:	400037b7          	lui	a5,0x40003
40001a40:	bcc78513          	addi	a0,a5,-1076 # 40002bcc <vga_simRes_h160_v120+0x110>
40001a44:	2a4000ef          	jal	ra,40001ce8 <print>
40001a48:	0100006f          	j	40001a58 <aes_256_cipher+0x244>
	else
		print("\r\t======================================AES256 DECRYPTTION========================================\r\n");
40001a4c:	400037b7          	lui	a5,0x40003
40001a50:	c3478513          	addi	a0,a5,-972 # 40002c34 <vga_simRes_h160_v120+0x178>
40001a54:	294000ef          	jal	ra,40001ce8 <print>
	print("\r\n");
40001a58:	400037b7          	lui	a5,0x40003
40001a5c:	b8478513          	addi	a0,a5,-1148 # 40002b84 <vga_simRes_h160_v120+0xc8>
40001a60:	288000ef          	jal	ra,40001ce8 <print>
	print128bit("PLAIN_TEXT (128-bit) : ", block);
40001a64:	fd442583          	lw	a1,-44(s0)
40001a68:	400037b7          	lui	a5,0x40003
40001a6c:	c9c78513          	addi	a0,a5,-868 # 40002c9c <vga_simRes_h160_v120+0x1e0>
40001a70:	550000ef          	jal	ra,40001fc0 <print128bit>
	print256bit("KEY (256-bit) : ", key);
40001a74:	fd842583          	lw	a1,-40(s0)
40001a78:	400037b7          	lui	a5,0x40003
40001a7c:	cb478513          	addi	a0,a5,-844 # 40002cb4 <vga_simRes_h160_v120+0x1f8>
40001a80:	65c000ef          	jal	ra,400020dc <print256bit>
	print128bit("RESULT (128-bit) : ", res);
40001a84:	fd042583          	lw	a1,-48(s0)
40001a88:	400037b7          	lui	a5,0x40003
40001a8c:	bb878513          	addi	a0,a5,-1096 # 40002bb8 <vga_simRes_h160_v120+0xfc>
40001a90:	530000ef          	jal	ra,40001fc0 <print128bit>
	//print("\r\n================================================================================================\r\n");

}
40001a94:	00000013          	nop
40001a98:	02c12083          	lw	ra,44(sp)
40001a9c:	02812403          	lw	s0,40(sp)
40001aa0:	02412483          	lw	s1,36(sp)
40001aa4:	03010113          	addi	sp,sp,48
40001aa8:	00008067          	ret

40001aac <timer_init>:
static void timer_init(Timer_Reg *reg){
40001aac:	fe010113          	addi	sp,sp,-32
40001ab0:	00812e23          	sw	s0,28(sp)
40001ab4:	02010413          	addi	s0,sp,32
40001ab8:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40001abc:	fec42783          	lw	a5,-20(s0)
40001ac0:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40001ac4:	fec42783          	lw	a5,-20(s0)
40001ac8:	0007a423          	sw	zero,8(a5)
}
40001acc:	00000013          	nop
40001ad0:	01c12403          	lw	s0,28(sp)
40001ad4:	02010113          	addi	sp,sp,32
40001ad8:	00008067          	ret

40001adc <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001adc:	fe010113          	addi	sp,sp,-32
40001ae0:	00812e23          	sw	s0,28(sp)
40001ae4:	02010413          	addi	s0,sp,32
40001ae8:	fea42623          	sw	a0,-20(s0)
}
40001aec:	00000013          	nop
40001af0:	01c12403          	lw	s0,28(sp)
40001af4:	02010113          	addi	sp,sp,32
40001af8:	00008067          	ret

40001afc <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001afc:	fe010113          	addi	sp,sp,-32
40001b00:	00812e23          	sw	s0,28(sp)
40001b04:	02010413          	addi	s0,sp,32
40001b08:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001b0c:	fec42783          	lw	a5,-20(s0)
40001b10:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001b14:	fec42783          	lw	a5,-20(s0)
40001b18:	fff00713          	li	a4,-1
40001b1c:	00e7a023          	sw	a4,0(a5)
}
40001b20:	00000013          	nop
40001b24:	01c12403          	lw	s0,28(sp)
40001b28:	02010113          	addi	sp,sp,32
40001b2c:	00008067          	ret

40001b30 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40001b30:	fe010113          	addi	sp,sp,-32
40001b34:	00812e23          	sw	s0,28(sp)
40001b38:	02010413          	addi	s0,sp,32
40001b3c:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40001b40:	fec42783          	lw	a5,-20(s0)
40001b44:	0047a783          	lw	a5,4(a5)
40001b48:	0107d793          	srli	a5,a5,0x10
40001b4c:	0ff7f793          	zext.b	a5,a5
}
40001b50:	00078513          	mv	a0,a5
40001b54:	01c12403          	lw	s0,28(sp)
40001b58:	02010113          	addi	sp,sp,32
40001b5c:	00008067          	ret

40001b60 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40001b60:	fe010113          	addi	sp,sp,-32
40001b64:	00812e23          	sw	s0,28(sp)
40001b68:	02010413          	addi	s0,sp,32
40001b6c:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40001b70:	fec42783          	lw	a5,-20(s0)
40001b74:	0047a783          	lw	a5,4(a5)
40001b78:	0187d793          	srli	a5,a5,0x18
}
40001b7c:	00078513          	mv	a0,a5
40001b80:	01c12403          	lw	s0,28(sp)
40001b84:	02010113          	addi	sp,sp,32
40001b88:	00008067          	ret

40001b8c <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40001b8c:	fe010113          	addi	sp,sp,-32
40001b90:	00112e23          	sw	ra,28(sp)
40001b94:	00812c23          	sw	s0,24(sp)
40001b98:	02010413          	addi	s0,sp,32
40001b9c:	fea42623          	sw	a0,-20(s0)
40001ba0:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40001ba4:	00000013          	nop
40001ba8:	fec42503          	lw	a0,-20(s0)
40001bac:	f85ff0ef          	jal	ra,40001b30 <uart_writeAvailability>
40001bb0:	00050793          	mv	a5,a0
40001bb4:	fe078ae3          	beqz	a5,40001ba8 <uart_write+0x1c>
	reg->DATA = data;
40001bb8:	fec42783          	lw	a5,-20(s0)
40001bbc:	fe842703          	lw	a4,-24(s0)
40001bc0:	00e7a023          	sw	a4,0(a5)
}
40001bc4:	00000013          	nop
40001bc8:	01c12083          	lw	ra,28(sp)
40001bcc:	01812403          	lw	s0,24(sp)
40001bd0:	02010113          	addi	sp,sp,32
40001bd4:	00008067          	ret

40001bd8 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001bd8:	fe010113          	addi	sp,sp,-32
40001bdc:	00812e23          	sw	s0,28(sp)
40001be0:	02010413          	addi	s0,sp,32
40001be4:	fea42623          	sw	a0,-20(s0)
40001be8:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001bec:	fe842783          	lw	a5,-24(s0)
40001bf0:	00c7a703          	lw	a4,12(a5)
40001bf4:	fec42783          	lw	a5,-20(s0)
40001bf8:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001bfc:	fe842783          	lw	a5,-24(s0)
40001c00:	0007a783          	lw	a5,0(a5)
40001c04:	fff78713          	addi	a4,a5,-1
40001c08:	fe842783          	lw	a5,-24(s0)
40001c0c:	0047a783          	lw	a5,4(a5)
40001c10:	00879793          	slli	a5,a5,0x8
40001c14:	00f76733          	or	a4,a4,a5
40001c18:	fe842783          	lw	a5,-24(s0)
40001c1c:	0087a783          	lw	a5,8(a5)
40001c20:	01079793          	slli	a5,a5,0x10
40001c24:	00f76733          	or	a4,a4,a5
40001c28:	fec42783          	lw	a5,-20(s0)
40001c2c:	00e7a623          	sw	a4,12(a5)
}
40001c30:	00000013          	nop
40001c34:	01c12403          	lw	s0,28(sp)
40001c38:	02010113          	addi	sp,sp,32
40001c3c:	00008067          	ret

40001c40 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001c40:	fe010113          	addi	sp,sp,-32
40001c44:	00812e23          	sw	s0,28(sp)
40001c48:	02010413          	addi	s0,sp,32
40001c4c:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001c50:	fec42783          	lw	a5,-20(s0)
40001c54:	0007a783          	lw	a5,0(a5)
40001c58:	0027f793          	andi	a5,a5,2
40001c5c:	00f037b3          	snez	a5,a5
40001c60:	0ff7f793          	zext.b	a5,a5
}
40001c64:	00078513          	mv	a0,a5
40001c68:	01c12403          	lw	s0,28(sp)
40001c6c:	02010113          	addi	sp,sp,32
40001c70:	00008067          	ret

40001c74 <vga_run>:
static void vga_run(Vga_Reg *reg){
40001c74:	fe010113          	addi	sp,sp,-32
40001c78:	00812e23          	sw	s0,28(sp)
40001c7c:	02010413          	addi	s0,sp,32
40001c80:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40001c84:	fec42783          	lw	a5,-20(s0)
40001c88:	00100713          	li	a4,1
40001c8c:	00e7a023          	sw	a4,0(a5)
}
40001c90:	00000013          	nop
40001c94:	01c12403          	lw	s0,28(sp)
40001c98:	02010113          	addi	sp,sp,32
40001c9c:	00008067          	ret

40001ca0 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40001ca0:	fe010113          	addi	sp,sp,-32
40001ca4:	00112e23          	sw	ra,28(sp)
40001ca8:	00812c23          	sw	s0,24(sp)
40001cac:	02010413          	addi	s0,sp,32
40001cb0:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40001cb4:	fec42783          	lw	a5,-20(s0)
40001cb8:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001cbc:	00000013          	nop
40001cc0:	fec42503          	lw	a0,-20(s0)
40001cc4:	f7dff0ef          	jal	ra,40001c40 <vga_isBusy>
40001cc8:	00050793          	mv	a5,a0
40001ccc:	fe079ae3          	bnez	a5,40001cc0 <vga_stop+0x20>
}
40001cd0:	00000013          	nop
40001cd4:	00000013          	nop
40001cd8:	01c12083          	lw	ra,28(sp)
40001cdc:	01812403          	lw	s0,24(sp)
40001ce0:	02010113          	addi	sp,sp,32
40001ce4:	00008067          	ret

40001ce8 <print>:
#include <briey.h>

void print(char *str){
40001ce8:	fe010113          	addi	sp,sp,-32
40001cec:	00112e23          	sw	ra,28(sp)
40001cf0:	00812c23          	sw	s0,24(sp)
40001cf4:	02010413          	addi	s0,sp,32
40001cf8:	fea42623          	sw	a0,-20(s0)
	while(*str){
40001cfc:	0200006f          	j	40001d1c <print+0x34>
		uart_write(UART,*(str++));
40001d00:	fec42783          	lw	a5,-20(s0)
40001d04:	00178713          	addi	a4,a5,1
40001d08:	fee42623          	sw	a4,-20(s0)
40001d0c:	0007c783          	lbu	a5,0(a5)
40001d10:	00078593          	mv	a1,a5
40001d14:	f0010537          	lui	a0,0xf0010
40001d18:	e75ff0ef          	jal	ra,40001b8c <uart_write>
	while(*str){
40001d1c:	fec42783          	lw	a5,-20(s0)
40001d20:	0007c783          	lbu	a5,0(a5)
40001d24:	fc079ee3          	bnez	a5,40001d00 <print+0x18>
	}
}
40001d28:	00000013          	nop
40001d2c:	00000013          	nop
40001d30:	01c12083          	lw	ra,28(sp)
40001d34:	01812403          	lw	s0,24(sp)
40001d38:	02010113          	addi	sp,sp,32
40001d3c:	00008067          	ret

40001d40 <print16bit>:

void print16bit(uint32_t n)
{
40001d40:	fc010113          	addi	sp,sp,-64
40001d44:	02112e23          	sw	ra,60(sp)
40001d48:	02812c23          	sw	s0,56(sp)
40001d4c:	04010413          	addi	s0,sp,64
40001d50:	fca42623          	sw	a0,-52(s0)

    int i = 0;
40001d54:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40001d58:	fc042e23          	sw	zero,-36(s0)
40001d5c:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40001d60:	fcc42783          	lw	a5,-52(s0)
40001d64:	00f7f793          	andi	a5,a5,15
40001d68:	40003737          	lui	a4,0x40003
40001d6c:	d2c70713          	addi	a4,a4,-724 # 40002d2c <vga_simRes_h160_v120+0x24>
40001d70:	00f707b3          	add	a5,a4,a5
40001d74:	0007c703          	lbu	a4,0(a5)
40001d78:	fec42783          	lw	a5,-20(s0)
40001d7c:	ff040693          	addi	a3,s0,-16
40001d80:	00f687b3          	add	a5,a3,a5
40001d84:	fee78623          	sb	a4,-20(a5)
        i++;
40001d88:	fec42783          	lw	a5,-20(s0)
40001d8c:	00178793          	addi	a5,a5,1
40001d90:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40001d94:	fcc42783          	lw	a5,-52(s0)
40001d98:	0047d793          	srli	a5,a5,0x4
40001d9c:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40001da0:	fcc42783          	lw	a5,-52(s0)
40001da4:	fa079ee3          	bnez	a5,40001d60 <print16bit+0x20>
    if(i<8) {
40001da8:	fec42703          	lw	a4,-20(s0)
40001dac:	00700793          	li	a5,7
40001db0:	02e7ce63          	blt	a5,a4,40001dec <print16bit+0xac>
    	for(int j=7;j>=i;j--){
40001db4:	00700793          	li	a5,7
40001db8:	fef42423          	sw	a5,-24(s0)
40001dbc:	0240006f          	j	40001de0 <print16bit+0xa0>
    		outbuf_inv[j]="0"[0];
40001dc0:	03000713          	li	a4,48
40001dc4:	fe842783          	lw	a5,-24(s0)
40001dc8:	ff040693          	addi	a3,s0,-16
40001dcc:	00f687b3          	add	a5,a3,a5
40001dd0:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40001dd4:	fe842783          	lw	a5,-24(s0)
40001dd8:	fff78793          	addi	a5,a5,-1
40001ddc:	fef42423          	sw	a5,-24(s0)
40001de0:	fe842703          	lw	a4,-24(s0)
40001de4:	fec42783          	lw	a5,-20(s0)
40001de8:	fcf75ce3          	bge	a4,a5,40001dc0 <print16bit+0x80>
    	}
    }
    for(int j=3;j>=0;j--)
40001dec:	00300793          	li	a5,3
40001df0:	fef42223          	sw	a5,-28(s0)
40001df4:	02c0006f          	j	40001e20 <print16bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40001df8:	fe442783          	lw	a5,-28(s0)
40001dfc:	ff040713          	addi	a4,s0,-16
40001e00:	00f707b3          	add	a5,a4,a5
40001e04:	fec7c783          	lbu	a5,-20(a5)
40001e08:	00078593          	mv	a1,a5
40001e0c:	f0010537          	lui	a0,0xf0010
40001e10:	d7dff0ef          	jal	ra,40001b8c <uart_write>
    for(int j=3;j>=0;j--)
40001e14:	fe442783          	lw	a5,-28(s0)
40001e18:	fff78793          	addi	a5,a5,-1
40001e1c:	fef42223          	sw	a5,-28(s0)
40001e20:	fe442783          	lw	a5,-28(s0)
40001e24:	fc07dae3          	bgez	a5,40001df8 <print16bit+0xb8>
    }
    print(" ");
40001e28:	400037b7          	lui	a5,0x40003
40001e2c:	d2878513          	addi	a0,a5,-728 # 40002d28 <vga_simRes_h160_v120+0x20>
40001e30:	eb9ff0ef          	jal	ra,40001ce8 <print>
}
40001e34:	00000013          	nop
40001e38:	03c12083          	lw	ra,60(sp)
40001e3c:	03812403          	lw	s0,56(sp)
40001e40:	04010113          	addi	sp,sp,64
40001e44:	00008067          	ret

40001e48 <print32bit>:
void print32bit(uint32_t n)
{
40001e48:	fc010113          	addi	sp,sp,-64
40001e4c:	02112e23          	sw	ra,60(sp)
40001e50:	02812c23          	sw	s0,56(sp)
40001e54:	04010413          	addi	s0,sp,64
40001e58:	fca42623          	sw	a0,-52(s0)

    int i = 0;
40001e5c:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40001e60:	fc042e23          	sw	zero,-36(s0)
40001e64:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40001e68:	fcc42783          	lw	a5,-52(s0)
40001e6c:	00f7f793          	andi	a5,a5,15
40001e70:	40003737          	lui	a4,0x40003
40001e74:	d2c70713          	addi	a4,a4,-724 # 40002d2c <vga_simRes_h160_v120+0x24>
40001e78:	00f707b3          	add	a5,a4,a5
40001e7c:	0007c703          	lbu	a4,0(a5)
40001e80:	fec42783          	lw	a5,-20(s0)
40001e84:	ff040693          	addi	a3,s0,-16
40001e88:	00f687b3          	add	a5,a3,a5
40001e8c:	fee78623          	sb	a4,-20(a5)
        i++;
40001e90:	fec42783          	lw	a5,-20(s0)
40001e94:	00178793          	addi	a5,a5,1
40001e98:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40001e9c:	fcc42783          	lw	a5,-52(s0)
40001ea0:	0047d793          	srli	a5,a5,0x4
40001ea4:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40001ea8:	fcc42783          	lw	a5,-52(s0)
40001eac:	fa079ee3          	bnez	a5,40001e68 <print32bit+0x20>
    if(i<8) {
40001eb0:	fec42703          	lw	a4,-20(s0)
40001eb4:	00700793          	li	a5,7
40001eb8:	02e7ce63          	blt	a5,a4,40001ef4 <print32bit+0xac>
    	for(int j=7;j>=i;j--){
40001ebc:	00700793          	li	a5,7
40001ec0:	fef42423          	sw	a5,-24(s0)
40001ec4:	0240006f          	j	40001ee8 <print32bit+0xa0>
    		outbuf_inv[j]="0"[0];
40001ec8:	03000713          	li	a4,48
40001ecc:	fe842783          	lw	a5,-24(s0)
40001ed0:	ff040693          	addi	a3,s0,-16
40001ed4:	00f687b3          	add	a5,a3,a5
40001ed8:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40001edc:	fe842783          	lw	a5,-24(s0)
40001ee0:	fff78793          	addi	a5,a5,-1
40001ee4:	fef42423          	sw	a5,-24(s0)
40001ee8:	fe842703          	lw	a4,-24(s0)
40001eec:	fec42783          	lw	a5,-20(s0)
40001ef0:	fcf75ce3          	bge	a4,a5,40001ec8 <print32bit+0x80>
    	}
    }
    for(int j=7;j>=0;j--)
40001ef4:	00700793          	li	a5,7
40001ef8:	fef42223          	sw	a5,-28(s0)
40001efc:	02c0006f          	j	40001f28 <print32bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40001f00:	fe442783          	lw	a5,-28(s0)
40001f04:	ff040713          	addi	a4,s0,-16
40001f08:	00f707b3          	add	a5,a4,a5
40001f0c:	fec7c783          	lbu	a5,-20(a5)
40001f10:	00078593          	mv	a1,a5
40001f14:	f0010537          	lui	a0,0xf0010
40001f18:	c75ff0ef          	jal	ra,40001b8c <uart_write>
    for(int j=7;j>=0;j--)
40001f1c:	fe442783          	lw	a5,-28(s0)
40001f20:	fff78793          	addi	a5,a5,-1
40001f24:	fef42223          	sw	a5,-28(s0)
40001f28:	fe442783          	lw	a5,-28(s0)
40001f2c:	fc07dae3          	bgez	a5,40001f00 <print32bit+0xb8>
    }
    print(" ");
40001f30:	400037b7          	lui	a5,0x40003
40001f34:	d2878513          	addi	a0,a5,-728 # 40002d28 <vga_simRes_h160_v120+0x20>
40001f38:	db1ff0ef          	jal	ra,40001ce8 <print>
}
40001f3c:	00000013          	nop
40001f40:	03c12083          	lw	ra,60(sp)
40001f44:	03812403          	lw	s0,56(sp)
40001f48:	04010113          	addi	sp,sp,64
40001f4c:	00008067          	ret

40001f50 <print64bit>:

void print64bit(char *message,uint32_t *num)
{
40001f50:	fe010113          	addi	sp,sp,-32
40001f54:	00112e23          	sw	ra,28(sp)
40001f58:	00812c23          	sw	s0,24(sp)
40001f5c:	02010413          	addi	s0,sp,32
40001f60:	fea42623          	sw	a0,-20(s0)
40001f64:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40001f68:	400037b7          	lui	a5,0x40003
40001f6c:	d4078513          	addi	a0,a5,-704 # 40002d40 <vga_simRes_h160_v120+0x38>
40001f70:	d79ff0ef          	jal	ra,40001ce8 <print>
	print(message);
40001f74:	fec42503          	lw	a0,-20(s0)
40001f78:	d71ff0ef          	jal	ra,40001ce8 <print>
	print32bit(num[1]);
40001f7c:	fe842783          	lw	a5,-24(s0)
40001f80:	00478793          	addi	a5,a5,4
40001f84:	0007a783          	lw	a5,0(a5)
40001f88:	00078513          	mv	a0,a5
40001f8c:	ebdff0ef          	jal	ra,40001e48 <print32bit>
	print32bit(num[0]);
40001f90:	fe842783          	lw	a5,-24(s0)
40001f94:	0007a783          	lw	a5,0(a5)
40001f98:	00078513          	mv	a0,a5
40001f9c:	eadff0ef          	jal	ra,40001e48 <print32bit>
	print("\r\n");
40001fa0:	400037b7          	lui	a5,0x40003
40001fa4:	d4478513          	addi	a0,a5,-700 # 40002d44 <vga_simRes_h160_v120+0x3c>
40001fa8:	d41ff0ef          	jal	ra,40001ce8 <print>
}
40001fac:	00000013          	nop
40001fb0:	01c12083          	lw	ra,28(sp)
40001fb4:	01812403          	lw	s0,24(sp)
40001fb8:	02010113          	addi	sp,sp,32
40001fbc:	00008067          	ret

40001fc0 <print128bit>:
void print128bit(char *message, uint32_t *num)
{
40001fc0:	fe010113          	addi	sp,sp,-32
40001fc4:	00112e23          	sw	ra,28(sp)
40001fc8:	00812c23          	sw	s0,24(sp)
40001fcc:	02010413          	addi	s0,sp,32
40001fd0:	fea42623          	sw	a0,-20(s0)
40001fd4:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40001fd8:	400037b7          	lui	a5,0x40003
40001fdc:	d4078513          	addi	a0,a5,-704 # 40002d40 <vga_simRes_h160_v120+0x38>
40001fe0:	d09ff0ef          	jal	ra,40001ce8 <print>
	print(message);
40001fe4:	fec42503          	lw	a0,-20(s0)
40001fe8:	d01ff0ef          	jal	ra,40001ce8 <print>
	print32bit(num[3]);
40001fec:	fe842783          	lw	a5,-24(s0)
40001ff0:	00c78793          	addi	a5,a5,12
40001ff4:	0007a783          	lw	a5,0(a5)
40001ff8:	00078513          	mv	a0,a5
40001ffc:	e4dff0ef          	jal	ra,40001e48 <print32bit>
	print32bit(num[2]);
40002000:	fe842783          	lw	a5,-24(s0)
40002004:	00878793          	addi	a5,a5,8
40002008:	0007a783          	lw	a5,0(a5)
4000200c:	00078513          	mv	a0,a5
40002010:	e39ff0ef          	jal	ra,40001e48 <print32bit>
	print32bit(num[1]);
40002014:	fe842783          	lw	a5,-24(s0)
40002018:	00478793          	addi	a5,a5,4
4000201c:	0007a783          	lw	a5,0(a5)
40002020:	00078513          	mv	a0,a5
40002024:	e25ff0ef          	jal	ra,40001e48 <print32bit>
	print32bit(num[0]);
40002028:	fe842783          	lw	a5,-24(s0)
4000202c:	0007a783          	lw	a5,0(a5)
40002030:	00078513          	mv	a0,a5
40002034:	e15ff0ef          	jal	ra,40001e48 <print32bit>
	print("\r\n");
40002038:	400037b7          	lui	a5,0x40003
4000203c:	d4478513          	addi	a0,a5,-700 # 40002d44 <vga_simRes_h160_v120+0x3c>
40002040:	ca9ff0ef          	jal	ra,40001ce8 <print>
}
40002044:	00000013          	nop
40002048:	01c12083          	lw	ra,28(sp)
4000204c:	01812403          	lw	s0,24(sp)
40002050:	02010113          	addi	sp,sp,32
40002054:	00008067          	ret

40002058 <print80bit>:
void print80bit(char *message,uint32_t *num)
{
40002058:	fe010113          	addi	sp,sp,-32
4000205c:	00112e23          	sw	ra,28(sp)
40002060:	00812c23          	sw	s0,24(sp)
40002064:	02010413          	addi	s0,sp,32
40002068:	fea42623          	sw	a0,-20(s0)
4000206c:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002070:	400037b7          	lui	a5,0x40003
40002074:	d4078513          	addi	a0,a5,-704 # 40002d40 <vga_simRes_h160_v120+0x38>
40002078:	c71ff0ef          	jal	ra,40001ce8 <print>
	print(message);
4000207c:	fec42503          	lw	a0,-20(s0)
40002080:	c69ff0ef          	jal	ra,40001ce8 <print>
	print32bit(num[2]);
40002084:	fe842783          	lw	a5,-24(s0)
40002088:	00878793          	addi	a5,a5,8
4000208c:	0007a783          	lw	a5,0(a5)
40002090:	00078513          	mv	a0,a5
40002094:	db5ff0ef          	jal	ra,40001e48 <print32bit>
	print32bit(num[1]);
40002098:	fe842783          	lw	a5,-24(s0)
4000209c:	00478793          	addi	a5,a5,4
400020a0:	0007a783          	lw	a5,0(a5)
400020a4:	00078513          	mv	a0,a5
400020a8:	da1ff0ef          	jal	ra,40001e48 <print32bit>
	print16bit(num[0]);
400020ac:	fe842783          	lw	a5,-24(s0)
400020b0:	0007a783          	lw	a5,0(a5)
400020b4:	00078513          	mv	a0,a5
400020b8:	c89ff0ef          	jal	ra,40001d40 <print16bit>
	print("\r\n");
400020bc:	400037b7          	lui	a5,0x40003
400020c0:	d4478513          	addi	a0,a5,-700 # 40002d44 <vga_simRes_h160_v120+0x3c>
400020c4:	c25ff0ef          	jal	ra,40001ce8 <print>
}
400020c8:	00000013          	nop
400020cc:	01c12083          	lw	ra,28(sp)
400020d0:	01812403          	lw	s0,24(sp)
400020d4:	02010113          	addi	sp,sp,32
400020d8:	00008067          	ret

400020dc <print256bit>:
void print256bit(char *message, uint32_t *num)
{
400020dc:	fe010113          	addi	sp,sp,-32
400020e0:	00112e23          	sw	ra,28(sp)
400020e4:	00812c23          	sw	s0,24(sp)
400020e8:	02010413          	addi	s0,sp,32
400020ec:	fea42623          	sw	a0,-20(s0)
400020f0:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
400020f4:	400037b7          	lui	a5,0x40003
400020f8:	d4078513          	addi	a0,a5,-704 # 40002d40 <vga_simRes_h160_v120+0x38>
400020fc:	bedff0ef          	jal	ra,40001ce8 <print>
	print(message);
40002100:	fec42503          	lw	a0,-20(s0)
40002104:	be5ff0ef          	jal	ra,40001ce8 <print>
	print32bit(num[7]);
40002108:	fe842783          	lw	a5,-24(s0)
4000210c:	01c78793          	addi	a5,a5,28
40002110:	0007a783          	lw	a5,0(a5)
40002114:	00078513          	mv	a0,a5
40002118:	d31ff0ef          	jal	ra,40001e48 <print32bit>
	print32bit(num[6]);
4000211c:	fe842783          	lw	a5,-24(s0)
40002120:	01878793          	addi	a5,a5,24
40002124:	0007a783          	lw	a5,0(a5)
40002128:	00078513          	mv	a0,a5
4000212c:	d1dff0ef          	jal	ra,40001e48 <print32bit>
	print32bit(num[5]);
40002130:	fe842783          	lw	a5,-24(s0)
40002134:	01478793          	addi	a5,a5,20
40002138:	0007a783          	lw	a5,0(a5)
4000213c:	00078513          	mv	a0,a5
40002140:	d09ff0ef          	jal	ra,40001e48 <print32bit>
	print32bit(num[4]);
40002144:	fe842783          	lw	a5,-24(s0)
40002148:	01078793          	addi	a5,a5,16
4000214c:	0007a783          	lw	a5,0(a5)
40002150:	00078513          	mv	a0,a5
40002154:	cf5ff0ef          	jal	ra,40001e48 <print32bit>
	print32bit(num[3]);
40002158:	fe842783          	lw	a5,-24(s0)
4000215c:	00c78793          	addi	a5,a5,12
40002160:	0007a783          	lw	a5,0(a5)
40002164:	00078513          	mv	a0,a5
40002168:	ce1ff0ef          	jal	ra,40001e48 <print32bit>
	print32bit(num[2]);
4000216c:	fe842783          	lw	a5,-24(s0)
40002170:	00878793          	addi	a5,a5,8
40002174:	0007a783          	lw	a5,0(a5)
40002178:	00078513          	mv	a0,a5
4000217c:	ccdff0ef          	jal	ra,40001e48 <print32bit>
	print32bit(num[1]);
40002180:	fe842783          	lw	a5,-24(s0)
40002184:	00478793          	addi	a5,a5,4
40002188:	0007a783          	lw	a5,0(a5)
4000218c:	00078513          	mv	a0,a5
40002190:	cb9ff0ef          	jal	ra,40001e48 <print32bit>
	print32bit(num[0]);
40002194:	fe842783          	lw	a5,-24(s0)
40002198:	0007a783          	lw	a5,0(a5)
4000219c:	00078513          	mv	a0,a5
400021a0:	ca9ff0ef          	jal	ra,40001e48 <print32bit>
	print("\r\n");
400021a4:	400037b7          	lui	a5,0x40003
400021a8:	d4478513          	addi	a0,a5,-700 # 40002d44 <vga_simRes_h160_v120+0x3c>
400021ac:	b3dff0ef          	jal	ra,40001ce8 <print>
}
400021b0:	00000013          	nop
400021b4:	01c12083          	lw	ra,28(sp)
400021b8:	01812403          	lw	s0,24(sp)
400021bc:	02010113          	addi	sp,sp,32
400021c0:	00008067          	ret
