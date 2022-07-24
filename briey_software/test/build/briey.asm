
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
80000068:	bb0080e7          	jalr	-1104(ra) # 40000c14 <irqCallback>
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
800000b8:	b3c18193          	addi	gp,gp,-1220 # 40002bf0 <__global_pointer$>
  .option pop
  la sp, _stack_start
800000bc:	00001117          	auipc	sp,0x1
800000c0:	88410113          	addi	sp,sp,-1916 # 80000940 <_stack_start>

800000c4 <bss_init>:

bss_init:
  la a0, _bss_start
800000c4:	c0002517          	auipc	a0,0xc0002
800000c8:	32c50513          	addi	a0,a0,812 # 400023f0 <_bss_end>
  la a1, _bss_end
800000cc:	c0002597          	auipc	a1,0xc0002
800000d0:	32458593          	addi	a1,a1,804 # 400023f0 <_bss_end>

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
800000e8:	30850513          	addi	a0,a0,776 # 400023ec <_ctors_end>
  addi sp,sp,-4
800000ec:	ffc10113          	addi	sp,sp,-4

800000f0 <ctors_loop>:
ctors_loop:
  la a1, _ctors_end
800000f0:	c0002597          	auipc	a1,0xc0002
800000f4:	2fc58593          	addi	a1,a1,764 # 400023ec <_ctors_end>
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
40000404:	bbc78513          	addi	a0,a5,-1092 # 40001bbc <vga_simRes_h160_v120+0x20>
40000408:	278010ef          	jal	ra,40001680 <print>
4000040c:	0100006f          	j	4000041c <prince_cipher+0x12c>
		else
			print("\r\t=============================PRINCE DECRYPTTION=============================\r\n");
40000410:	400027b7          	lui	a5,0x40002
40000414:	c1078513          	addi	a0,a5,-1008 # 40001c10 <vga_simRes_h160_v120+0x74>
40000418:	268010ef          	jal	ra,40001680 <print>
		print("\r\n");
4000041c:	400027b7          	lui	a5,0x40002
40000420:	c6478513          	addi	a0,a5,-924 # 40001c64 <vga_simRes_h160_v120+0xc8>
40000424:	25c010ef          	jal	ra,40001680 <print>
		print64bit("PLAIN_TEXT (64-bit) : ", block);
40000428:	fe442583          	lw	a1,-28(s0)
4000042c:	400027b7          	lui	a5,0x40002
40000430:	c6878513          	addi	a0,a5,-920 # 40001c68 <vga_simRes_h160_v120+0xcc>
40000434:	4b4010ef          	jal	ra,400018e8 <print64bit>
		print128bit("KEY (128-bit) : ", key);
40000438:	fe842583          	lw	a1,-24(s0)
4000043c:	400027b7          	lui	a5,0x40002
40000440:	c8078513          	addi	a0,a5,-896 # 40001c80 <vga_simRes_h160_v120+0xe4>
40000444:	514010ef          	jal	ra,40001958 <print128bit>
		print64bit("RESULT (64-bit) : ", res);
40000448:	fe042583          	lw	a1,-32(s0)
4000044c:	400027b7          	lui	a5,0x40002
40000450:	c9478513          	addi	a0,a5,-876 # 40001c94 <vga_simRes_h160_v120+0xf8>
40000454:	494010ef          	jal	ra,400018e8 <print64bit>
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
400006ac:	f7010113          	addi	sp,sp,-144
400006b0:	08112623          	sw	ra,140(sp)
400006b4:	08812423          	sw	s0,136(sp)
400006b8:	09010413          	addi	s0,sp,144
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
400006e8:	d0878513          	addi	a0,a5,-760 # 40001d08 <vga_simRes_h160_v120+0x20>
400006ec:	795000ef          	jal	ra,40001680 <print>
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
40000714:	d5c78513          	addi	a0,a5,-676 # 40001d5c <vga_simRes_h160_v120+0x74>
40000718:	769000ef          	jal	ra,40001680 <print>

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
40000744:	67778793          	addi	a5,a5,1655 # 44556677 <__global_pointer$+0x4553a87>
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
40000784:	db078513          	addi	a0,a5,-592 # 40001db0 <vga_simRes_h160_v120+0xc8>
40000788:	6f9000ef          	jal	ra,40001680 <print>

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
400007c4:	e0478513          	addi	a0,a5,-508 # 40001e04 <vga_simRes_h160_v120+0x11c>
400007c8:	6b9000ef          	jal	ra,40001680 <print>

	prince_block[1] 	= 0x69c4e0d8;
400007cc:	69c4e7b7          	lui	a5,0x69c4e
400007d0:	0d878793          	addi	a5,a5,216 # 69c4e0d8 <__global_pointer$+0x29c4b4e8>
400007d4:	fcf42623          	sw	a5,-52(s0)
	prince_block[0] 	= 0x6a7b0430;
400007d8:	6a7b07b7          	lui	a5,0x6a7b0
400007dc:	43078793          	addi	a5,a5,1072 # 6a7b0430 <__global_pointer$+0x2a7ad840>
400007e0:	fcf42423          	sw	a5,-56(s0)

	prince_key[3]		= 0xd8cdb780;
400007e4:	d8cdb7b7          	lui	a5,0xd8cdb
400007e8:	78078793          	addi	a5,a5,1920 # d8cdb780 <_stack_start+0x58cdae40>
400007ec:	fcf42e23          	sw	a5,-36(s0)
	prince_key[2]		= 0x70b4c55a;
400007f0:	70b4c7b7          	lui	a5,0x70b4c
400007f4:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b4996a>
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
40000834:	e5878513          	addi	a0,a5,-424 # 40001e58 <vga_simRes_h160_v120+0x170>
40000838:	649000ef          	jal	ra,40001680 <print>

	prince_block[1] 	= 0x43c6b256;
4000083c:	43c6b7b7          	lui	a5,0x43c6b
40000840:	25678793          	addi	a5,a5,598 # 43c6b256 <__global_pointer$+0x3c68666>
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

	print("\r\t*********************************AES TEST***********************************\r\n");
40000870:	400027b7          	lui	a5,0x40002
40000874:	eac78513          	addi	a0,a5,-340 # 40001eac <vga_simRes_h160_v120+0x1c4>
40000878:	609000ef          	jal	ra,40001680 <print>
    unsigned int aes_key_128[4] = {0x0, 0x0, 0x0, 0x0};
4000087c:	fa042823          	sw	zero,-80(s0)
40000880:	fa042a23          	sw	zero,-76(s0)
40000884:	fa042c23          	sw	zero,-72(s0)
40000888:	fa042e23          	sw	zero,-68(s0)
    unsigned int aes_block[4] 	= {0x0, 0x0, 0x0, 0x0};
4000088c:	fa042023          	sw	zero,-96(s0)
40000890:	fa042223          	sw	zero,-92(s0)
40000894:	fa042423          	sw	zero,-88(s0)
40000898:	fa042623          	sw	zero,-84(s0)

    unsigned int aes_res[4] 	= {0x0, 0x0, 0x0, 0x0};
4000089c:	f8042823          	sw	zero,-112(s0)
400008a0:	f8042a23          	sw	zero,-108(s0)
400008a4:	f8042c23          	sw	zero,-104(s0)
400008a8:	f8042e23          	sw	zero,-100(s0)

    print("\r\n\t=================================TEST 1=====================================\r\n");
400008ac:	400027b7          	lui	a5,0x40002
400008b0:	f0078513          	addi	a0,a5,-256 # 40001f00 <vga_simRes_h160_v120+0x218>
400008b4:	5cd000ef          	jal	ra,40001680 <print>

    aes_block[3] 	= 0x33343536;
400008b8:	333437b7          	lui	a5,0x33343
400008bc:	53678793          	addi	a5,a5,1334 # 33343536 <_stack_size+0x33342d36>
400008c0:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0x39303132;
400008c4:	393037b7          	lui	a5,0x39303
400008c8:	13278793          	addi	a5,a5,306 # 39303132 <_stack_size+0x39302932>
400008cc:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x35363738;
400008d0:	353637b7          	lui	a5,0x35363
400008d4:	73878793          	addi	a5,a5,1848 # 35363738 <_stack_size+0x35362f38>
400008d8:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x31323334;
400008dc:	313237b7          	lui	a5,0x31323
400008e0:	33478793          	addi	a5,a5,820 # 31323334 <_stack_size+0x31322b34>
400008e4:	faf42023          	sw	a5,-96(s0)

	aes_key_128[3] 	= 0x37363534;
400008e8:	373637b7          	lui	a5,0x37363
400008ec:	53478793          	addi	a5,a5,1332 # 37363534 <_stack_size+0x37362d34>
400008f0:	faf42e23          	sw	a5,-68(s0)
    aes_key_128[2] 	= 0x31303938;
400008f4:	313047b7          	lui	a5,0x31304
400008f8:	93878793          	addi	a5,a5,-1736 # 31303938 <_stack_size+0x31303138>
400008fc:	faf42c23          	sw	a5,-72(s0)
    aes_key_128[1] 	= 0x35343332;
40000900:	353437b7          	lui	a5,0x35343
40000904:	33278793          	addi	a5,a5,818 # 35343332 <_stack_size+0x35342b32>
40000908:	faf42a23          	sw	a5,-76(s0)
    aes_key_128[0]	= 0x39383736;
4000090c:	393837b7          	lui	a5,0x39383
40000910:	73678793          	addi	a5,a5,1846 # 39383736 <_stack_size+0x39382f36>
40000914:	faf42823          	sw	a5,-80(s0)

   	aes_128_cipher(AES_OP_EN, aes_key_128, aes_block, aes_res);
40000918:	f9040693          	addi	a3,s0,-112
4000091c:	fa040713          	addi	a4,s0,-96
40000920:	fb040793          	addi	a5,s0,-80
40000924:	00070613          	mv	a2,a4
40000928:	00078593          	mv	a1,a5
4000092c:	00100513          	li	a0,1
40000930:	618000ef          	jal	ra,40000f48 <aes_128_cipher>
   	print("\r\n\t=================================TEST 2=====================================\r\n");
40000934:	400027b7          	lui	a5,0x40002
40000938:	f5478513          	addi	a0,a5,-172 # 40001f54 <vga_simRes_h160_v120+0x26c>
4000093c:	545000ef          	jal	ra,40001680 <print>

    aes_block[3] 	= 0xa1e33d0b;
40000940:	a1e347b7          	lui	a5,0xa1e34
40000944:	d0b78793          	addi	a5,a5,-757 # a1e33d0b <_stack_start+0x21e333cb>
40000948:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0xd07781b2;
4000094c:	d07787b7          	lui	a5,0xd0778
40000950:	1b278793          	addi	a5,a5,434 # d07781b2 <_stack_start+0x50777872>
40000954:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x53e5f4da;
40000958:	53e5f7b7          	lui	a5,0x53e5f
4000095c:	4da78793          	addi	a5,a5,1242 # 53e5f4da <__global_pointer$+0x13e5c8ea>
40000960:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x6f2f5312;
40000964:	6f2f57b7          	lui	a5,0x6f2f5
40000968:	31278793          	addi	a5,a5,786 # 6f2f5312 <__global_pointer$+0x2f2f2722>
4000096c:	faf42023          	sw	a5,-96(s0)

    //USE THE SAME KEY

   	aes_128_cipher(AES_OP_DE, aes_key_128, aes_block, aes_res);
40000970:	f9040693          	addi	a3,s0,-112
40000974:	fa040713          	addi	a4,s0,-96
40000978:	fb040793          	addi	a5,s0,-80
4000097c:	00070613          	mv	a2,a4
40000980:	00078593          	mv	a1,a5
40000984:	00000513          	li	a0,0
40000988:	5c0000ef          	jal	ra,40000f48 <aes_128_cipher>
   	print("\r\n\t=================================TEST 3=====================================\r\n");
4000098c:	400027b7          	lui	a5,0x40002
40000990:	fa878513          	addi	a0,a5,-88 # 40001fa8 <vga_simRes_h160_v120+0x2c0>
40000994:	4ed000ef          	jal	ra,40001680 <print>

    aes_block[3] 	= 0x7393172a;
40000998:	739317b7          	lui	a5,0x73931
4000099c:	72a78793          	addi	a5,a5,1834 # 7393172a <__global_pointer$+0x3392eb3a>
400009a0:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0xe93d7e11;
400009a4:	e93d87b7          	lui	a5,0xe93d8
400009a8:	e1178793          	addi	a5,a5,-495 # e93d7e11 <_stack_start+0x693d74d1>
400009ac:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x2e409f96;
400009b0:	2e40a7b7          	lui	a5,0x2e40a
400009b4:	f9678793          	addi	a5,a5,-106 # 2e409f96 <_stack_size+0x2e409796>
400009b8:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x6bc1bee2;
400009bc:	6bc1c7b7          	lui	a5,0x6bc1c
400009c0:	ee278793          	addi	a5,a5,-286 # 6bc1bee2 <__global_pointer$+0x2bc192f2>
400009c4:	faf42023          	sw	a5,-96(s0)

	aes_key_128[3] 	= 0x09cf4f3c;
400009c8:	09cf57b7          	lui	a5,0x9cf5
400009cc:	f3c78793          	addi	a5,a5,-196 # 9cf4f3c <_stack_size+0x9cf473c>
400009d0:	faf42e23          	sw	a5,-68(s0)
    aes_key_128[2] 	= 0xabf71588;
400009d4:	abf717b7          	lui	a5,0xabf71
400009d8:	58878793          	addi	a5,a5,1416 # abf71588 <_stack_start+0x2bf70c48>
400009dc:	faf42c23          	sw	a5,-72(s0)
    aes_key_128[1] 	= 0x28aed2a6;
400009e0:	28aed7b7          	lui	a5,0x28aed
400009e4:	2a678793          	addi	a5,a5,678 # 28aed2a6 <_stack_size+0x28aecaa6>
400009e8:	faf42a23          	sw	a5,-76(s0)
    aes_key_128[0]	= 0x2b7e1516;
400009ec:	2b7e17b7          	lui	a5,0x2b7e1
400009f0:	51678793          	addi	a5,a5,1302 # 2b7e1516 <_stack_size+0x2b7e0d16>
400009f4:	faf42823          	sw	a5,-80(s0)
   	aes_128_cipher(AES_OP_EN, aes_key_128, aes_block, aes_res);
400009f8:	f9040693          	addi	a3,s0,-112
400009fc:	fa040713          	addi	a4,s0,-96
40000a00:	fb040793          	addi	a5,s0,-80
40000a04:	00070613          	mv	a2,a4
40000a08:	00078593          	mv	a1,a5
40000a0c:	00100513          	li	a0,1
40000a10:	538000ef          	jal	ra,40000f48 <aes_128_cipher>
   	print("\r\n\t=================================TEST 4=====================================\r\n");
40000a14:	400027b7          	lui	a5,0x40002
40000a18:	ffc78513          	addi	a0,a5,-4 # 40001ffc <vga_simRes_h160_v120+0x314>
40000a1c:	465000ef          	jal	ra,40001680 <print>

    aes_block[3] 	= 0x2466ef97;
40000a20:	2466f7b7          	lui	a5,0x2466f
40000a24:	f9778793          	addi	a5,a5,-105 # 2466ef97 <_stack_size+0x2466e797>
40000a28:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0xa89ecaf3;
40000a2c:	a89ed7b7          	lui	a5,0xa89ed
40000a30:	af378793          	addi	a5,a5,-1293 # a89ecaf3 <_stack_start+0x289ec1b3>
40000a34:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x0d7a3660;
40000a38:	0d7a37b7          	lui	a5,0xd7a3
40000a3c:	66078793          	addi	a5,a5,1632 # d7a3660 <_stack_size+0xd7a2e60>
40000a40:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x3ad77bb4;
40000a44:	3ad787b7          	lui	a5,0x3ad78
40000a48:	bb478793          	addi	a5,a5,-1100 # 3ad77bb4 <_stack_size+0x3ad773b4>
40000a4c:	faf42023          	sw	a5,-96(s0)

    //USE THE SAME KEY

   	aes_128_cipher(AES_OP_DE, aes_key_128, aes_block, aes_res);
40000a50:	f9040693          	addi	a3,s0,-112
40000a54:	fa040713          	addi	a4,s0,-96
40000a58:	fb040793          	addi	a5,s0,-80
40000a5c:	00070613          	mv	a2,a4
40000a60:	00078593          	mv	a1,a5
40000a64:	00000513          	li	a0,0
40000a68:	4e0000ef          	jal	ra,40000f48 <aes_128_cipher>


   	print("\r\n\t========================================TEST 5(AES256)==========================================\r\n");
40000a6c:	400027b7          	lui	a5,0x40002
40000a70:	05078513          	addi	a0,a5,80 # 40002050 <vga_simRes_h160_v120+0x368>
40000a74:	40d000ef          	jal	ra,40001680 <print>
    unsigned int aes_key_256[8] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
40000a78:	f6042823          	sw	zero,-144(s0)
40000a7c:	f6042a23          	sw	zero,-140(s0)
40000a80:	f6042c23          	sw	zero,-136(s0)
40000a84:	f6042e23          	sw	zero,-132(s0)
40000a88:	f8042023          	sw	zero,-128(s0)
40000a8c:	f8042223          	sw	zero,-124(s0)
40000a90:	f8042423          	sw	zero,-120(s0)
40000a94:	f8042623          	sw	zero,-116(s0)

    aes_block[3] 	= 0x7393172a;
40000a98:	739317b7          	lui	a5,0x73931
40000a9c:	72a78793          	addi	a5,a5,1834 # 7393172a <__global_pointer$+0x3392eb3a>
40000aa0:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0xe93d7e11;
40000aa4:	e93d87b7          	lui	a5,0xe93d8
40000aa8:	e1178793          	addi	a5,a5,-495 # e93d7e11 <_stack_start+0x693d74d1>
40000aac:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0x2e409f96;
40000ab0:	2e40a7b7          	lui	a5,0x2e40a
40000ab4:	f9678793          	addi	a5,a5,-106 # 2e409f96 <_stack_size+0x2e409796>
40000ab8:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0x6bc1bee2;
40000abc:	6bc1c7b7          	lui	a5,0x6bc1c
40000ac0:	ee278793          	addi	a5,a5,-286 # 6bc1bee2 <__global_pointer$+0x2bc192f2>
40000ac4:	faf42023          	sw	a5,-96(s0)

    aes_key_256[7] 	= 0x0914dff4;
40000ac8:	0914e7b7          	lui	a5,0x914e
40000acc:	ff478793          	addi	a5,a5,-12 # 914dff4 <_stack_size+0x914d7f4>
40000ad0:	f8f42623          	sw	a5,-116(s0)
    aes_key_256[6] 	= 0x2d9810a3;
40000ad4:	2d9817b7          	lui	a5,0x2d981
40000ad8:	0a378793          	addi	a5,a5,163 # 2d9810a3 <_stack_size+0x2d9808a3>
40000adc:	f8f42423          	sw	a5,-120(s0)
    aes_key_256[5] 	= 0x3b6108d7;
40000ae0:	3b6117b7          	lui	a5,0x3b611
40000ae4:	8d778793          	addi	a5,a5,-1833 # 3b6108d7 <_stack_size+0x3b6100d7>
40000ae8:	f8f42223          	sw	a5,-124(s0)
    aes_key_256[4]	= 0x1f352c07;
40000aec:	1f3537b7          	lui	a5,0x1f353
40000af0:	c0778793          	addi	a5,a5,-1017 # 1f352c07 <_stack_size+0x1f352407>
40000af4:	f8f42023          	sw	a5,-128(s0)
    aes_key_256[3] 	= 0x857d7781;
40000af8:	857d77b7          	lui	a5,0x857d7
40000afc:	78178793          	addi	a5,a5,1921 # 857d7781 <_stack_start+0x57d6e41>
40000b00:	f6f42e23          	sw	a5,-132(s0)
    aes_key_256[2] 	= 0x2b73aef0;
40000b04:	2b73b7b7          	lui	a5,0x2b73b
40000b08:	ef078793          	addi	a5,a5,-272 # 2b73aef0 <_stack_size+0x2b73a6f0>
40000b0c:	f6f42c23          	sw	a5,-136(s0)
    aes_key_256[1] 	= 0x15ca71be;
40000b10:	15ca77b7          	lui	a5,0x15ca7
40000b14:	1be78793          	addi	a5,a5,446 # 15ca71be <_stack_size+0x15ca69be>
40000b18:	f6f42a23          	sw	a5,-140(s0)
    aes_key_256[0]	= 0x603deb10;
40000b1c:	603df7b7          	lui	a5,0x603df
40000b20:	b1078793          	addi	a5,a5,-1264 # 603deb10 <__global_pointer$+0x203dbf20>
40000b24:	f6f42823          	sw	a5,-144(s0)

    aes_256_cipher(AES_OP_EN, aes_key_256, aes_block, aes_res);
40000b28:	f9040693          	addi	a3,s0,-112
40000b2c:	fa040713          	addi	a4,s0,-96
40000b30:	f7040793          	addi	a5,s0,-144
40000b34:	00070613          	mv	a2,a4
40000b38:	00078593          	mv	a1,a5
40000b3c:	00100513          	li	a0,1
40000b40:	66c000ef          	jal	ra,400011ac <aes_256_cipher>


   	print("\r\n\t========================================TEST 6(AES256)==========================================\r\n");
40000b44:	400027b7          	lui	a5,0x40002
40000b48:	0b878513          	addi	a0,a5,184 # 400020b8 <vga_simRes_h160_v120+0x3d0>
40000b4c:	335000ef          	jal	ra,40001680 <print>
    aes_block[3] 	= 0x3db181f8 ;
40000b50:	3db187b7          	lui	a5,0x3db18
40000b54:	1f878793          	addi	a5,a5,504 # 3db181f8 <_stack_size+0x3db179f8>
40000b58:	faf42623          	sw	a5,-84(s0)
    aes_block[2] 	= 0x064b5a7e ;
40000b5c:	064b67b7          	lui	a5,0x64b6
40000b60:	a7e78793          	addi	a5,a5,-1410 # 64b5a7e <_stack_size+0x64b527e>
40000b64:	faf42423          	sw	a5,-88(s0)
    aes_block[1] 	= 0xb5d2a03c;
40000b68:	b5d2a7b7          	lui	a5,0xb5d2a
40000b6c:	03c78793          	addi	a5,a5,60 # b5d2a03c <_stack_start+0x35d296fc>
40000b70:	faf42223          	sw	a5,-92(s0)
    aes_block[0] 	= 0xf3eed1bd;
40000b74:	f3eed7b7          	lui	a5,0xf3eed
40000b78:	1bd78793          	addi	a5,a5,445 # f3eed1bd <_stack_start+0x73eec87d>
40000b7c:	faf42023          	sw	a5,-96(s0)

    aes_key_256[7] 	= 0x0914dff4;
40000b80:	0914e7b7          	lui	a5,0x914e
40000b84:	ff478793          	addi	a5,a5,-12 # 914dff4 <_stack_size+0x914d7f4>
40000b88:	f8f42623          	sw	a5,-116(s0)
    aes_key_256[6] 	= 0x2d9810a3;
40000b8c:	2d9817b7          	lui	a5,0x2d981
40000b90:	0a378793          	addi	a5,a5,163 # 2d9810a3 <_stack_size+0x2d9808a3>
40000b94:	f8f42423          	sw	a5,-120(s0)
    aes_key_256[5] 	= 0x3b6108d7;
40000b98:	3b6117b7          	lui	a5,0x3b611
40000b9c:	8d778793          	addi	a5,a5,-1833 # 3b6108d7 <_stack_size+0x3b6100d7>
40000ba0:	f8f42223          	sw	a5,-124(s0)
    aes_key_256[4]	= 0x1f352c07;
40000ba4:	1f3537b7          	lui	a5,0x1f353
40000ba8:	c0778793          	addi	a5,a5,-1017 # 1f352c07 <_stack_size+0x1f352407>
40000bac:	f8f42023          	sw	a5,-128(s0)
    aes_key_256[3] 	= 0x857d7781;
40000bb0:	857d77b7          	lui	a5,0x857d7
40000bb4:	78178793          	addi	a5,a5,1921 # 857d7781 <_stack_start+0x57d6e41>
40000bb8:	f6f42e23          	sw	a5,-132(s0)
    aes_key_256[2] 	= 0x2b73aef0;
40000bbc:	2b73b7b7          	lui	a5,0x2b73b
40000bc0:	ef078793          	addi	a5,a5,-272 # 2b73aef0 <_stack_size+0x2b73a6f0>
40000bc4:	f6f42c23          	sw	a5,-136(s0)
    aes_key_256[1] 	= 0x15ca71be;
40000bc8:	15ca77b7          	lui	a5,0x15ca7
40000bcc:	1be78793          	addi	a5,a5,446 # 15ca71be <_stack_size+0x15ca69be>
40000bd0:	f6f42a23          	sw	a5,-140(s0)
    aes_key_256[0]	= 0x603deb10;
40000bd4:	603df7b7          	lui	a5,0x603df
40000bd8:	b1078793          	addi	a5,a5,-1264 # 603deb10 <__global_pointer$+0x203dbf20>
40000bdc:	f6f42823          	sw	a5,-144(s0)

    aes_256_cipher(AES_OP_DE, aes_key_256, aes_block, aes_res);
40000be0:	f9040693          	addi	a3,s0,-112
40000be4:	fa040713          	addi	a4,s0,-96
40000be8:	f7040793          	addi	a5,s0,-144
40000bec:	00070613          	mv	a2,a4
40000bf0:	00078593          	mv	a1,a5
40000bf4:	00000513          	li	a0,0
40000bf8:	5b4000ef          	jal	ra,400011ac <aes_256_cipher>
	return 0;	
40000bfc:	00000793          	li	a5,0
}
40000c00:	00078513          	mv	a0,a5
40000c04:	08c12083          	lw	ra,140(sp)
40000c08:	08812403          	lw	s0,136(sp)
40000c0c:	09010113          	addi	sp,sp,144
40000c10:	00008067          	ret

40000c14 <irqCallback>:
void irqCallback(){
40000c14:	ff010113          	addi	sp,sp,-16
40000c18:	00812623          	sw	s0,12(sp)
40000c1c:	01010413          	addi	s0,sp,16

}
40000c20:	00000013          	nop
40000c24:	00c12403          	lw	s0,12(sp)
40000c28:	01010113          	addi	sp,sp,16
40000c2c:	00008067          	ret

40000c30 <timer_init>:
static void timer_init(Timer_Reg *reg){
40000c30:	fe010113          	addi	sp,sp,-32
40000c34:	00812e23          	sw	s0,28(sp)
40000c38:	02010413          	addi	s0,sp,32
40000c3c:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000c40:	fec42783          	lw	a5,-20(s0)
40000c44:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000c48:	fec42783          	lw	a5,-20(s0)
40000c4c:	0007a423          	sw	zero,8(a5)
}
40000c50:	00000013          	nop
40000c54:	01c12403          	lw	s0,28(sp)
40000c58:	02010113          	addi	sp,sp,32
40000c5c:	00008067          	ret

40000c60 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40000c60:	fe010113          	addi	sp,sp,-32
40000c64:	00812e23          	sw	s0,28(sp)
40000c68:	02010413          	addi	s0,sp,32
40000c6c:	fea42623          	sw	a0,-20(s0)
}
40000c70:	00000013          	nop
40000c74:	01c12403          	lw	s0,28(sp)
40000c78:	02010113          	addi	sp,sp,32
40000c7c:	00008067          	ret

40000c80 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40000c80:	fe010113          	addi	sp,sp,-32
40000c84:	00812e23          	sw	s0,28(sp)
40000c88:	02010413          	addi	s0,sp,32
40000c8c:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40000c90:	fec42783          	lw	a5,-20(s0)
40000c94:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40000c98:	fec42783          	lw	a5,-20(s0)
40000c9c:	fff00713          	li	a4,-1
40000ca0:	00e7a023          	sw	a4,0(a5)
}
40000ca4:	00000013          	nop
40000ca8:	01c12403          	lw	s0,28(sp)
40000cac:	02010113          	addi	sp,sp,32
40000cb0:	00008067          	ret

40000cb4 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40000cb4:	fe010113          	addi	sp,sp,-32
40000cb8:	00812e23          	sw	s0,28(sp)
40000cbc:	02010413          	addi	s0,sp,32
40000cc0:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000cc4:	fec42783          	lw	a5,-20(s0)
40000cc8:	0047a783          	lw	a5,4(a5)
40000ccc:	0107d793          	srli	a5,a5,0x10
40000cd0:	0ff7f793          	zext.b	a5,a5
}
40000cd4:	00078513          	mv	a0,a5
40000cd8:	01c12403          	lw	s0,28(sp)
40000cdc:	02010113          	addi	sp,sp,32
40000ce0:	00008067          	ret

40000ce4 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40000ce4:	fe010113          	addi	sp,sp,-32
40000ce8:	00812e23          	sw	s0,28(sp)
40000cec:	02010413          	addi	s0,sp,32
40000cf0:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40000cf4:	fec42783          	lw	a5,-20(s0)
40000cf8:	0047a783          	lw	a5,4(a5)
40000cfc:	0187d793          	srli	a5,a5,0x18
}
40000d00:	00078513          	mv	a0,a5
40000d04:	01c12403          	lw	s0,28(sp)
40000d08:	02010113          	addi	sp,sp,32
40000d0c:	00008067          	ret

40000d10 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40000d10:	fe010113          	addi	sp,sp,-32
40000d14:	00112e23          	sw	ra,28(sp)
40000d18:	00812c23          	sw	s0,24(sp)
40000d1c:	02010413          	addi	s0,sp,32
40000d20:	fea42623          	sw	a0,-20(s0)
40000d24:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40000d28:	00000013          	nop
40000d2c:	fec42503          	lw	a0,-20(s0)
40000d30:	f85ff0ef          	jal	ra,40000cb4 <uart_writeAvailability>
40000d34:	00050793          	mv	a5,a0
40000d38:	fe078ae3          	beqz	a5,40000d2c <uart_write+0x1c>
	reg->DATA = data;
40000d3c:	fec42783          	lw	a5,-20(s0)
40000d40:	fe842703          	lw	a4,-24(s0)
40000d44:	00e7a023          	sw	a4,0(a5)
}
40000d48:	00000013          	nop
40000d4c:	01c12083          	lw	ra,28(sp)
40000d50:	01812403          	lw	s0,24(sp)
40000d54:	02010113          	addi	sp,sp,32
40000d58:	00008067          	ret

40000d5c <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40000d5c:	fe010113          	addi	sp,sp,-32
40000d60:	00812e23          	sw	s0,28(sp)
40000d64:	02010413          	addi	s0,sp,32
40000d68:	fea42623          	sw	a0,-20(s0)
40000d6c:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40000d70:	fe842783          	lw	a5,-24(s0)
40000d74:	00c7a703          	lw	a4,12(a5)
40000d78:	fec42783          	lw	a5,-20(s0)
40000d7c:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40000d80:	fe842783          	lw	a5,-24(s0)
40000d84:	0007a783          	lw	a5,0(a5)
40000d88:	fff78713          	addi	a4,a5,-1
40000d8c:	fe842783          	lw	a5,-24(s0)
40000d90:	0047a783          	lw	a5,4(a5)
40000d94:	00879793          	slli	a5,a5,0x8
40000d98:	00f76733          	or	a4,a4,a5
40000d9c:	fe842783          	lw	a5,-24(s0)
40000da0:	0087a783          	lw	a5,8(a5)
40000da4:	01079793          	slli	a5,a5,0x10
40000da8:	00f76733          	or	a4,a4,a5
40000dac:	fec42783          	lw	a5,-20(s0)
40000db0:	00e7a623          	sw	a4,12(a5)
}
40000db4:	00000013          	nop
40000db8:	01c12403          	lw	s0,28(sp)
40000dbc:	02010113          	addi	sp,sp,32
40000dc0:	00008067          	ret

40000dc4 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40000dc4:	fe010113          	addi	sp,sp,-32
40000dc8:	00812e23          	sw	s0,28(sp)
40000dcc:	02010413          	addi	s0,sp,32
40000dd0:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40000dd4:	fec42783          	lw	a5,-20(s0)
40000dd8:	0007a783          	lw	a5,0(a5)
40000ddc:	0027f793          	andi	a5,a5,2
40000de0:	00f037b3          	snez	a5,a5
40000de4:	0ff7f793          	zext.b	a5,a5
}
40000de8:	00078513          	mv	a0,a5
40000dec:	01c12403          	lw	s0,28(sp)
40000df0:	02010113          	addi	sp,sp,32
40000df4:	00008067          	ret

40000df8 <vga_run>:
static void vga_run(Vga_Reg *reg){
40000df8:	fe010113          	addi	sp,sp,-32
40000dfc:	00812e23          	sw	s0,28(sp)
40000e00:	02010413          	addi	s0,sp,32
40000e04:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40000e08:	fec42783          	lw	a5,-20(s0)
40000e0c:	00100713          	li	a4,1
40000e10:	00e7a023          	sw	a4,0(a5)
}
40000e14:	00000013          	nop
40000e18:	01c12403          	lw	s0,28(sp)
40000e1c:	02010113          	addi	sp,sp,32
40000e20:	00008067          	ret

40000e24 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40000e24:	fe010113          	addi	sp,sp,-32
40000e28:	00112e23          	sw	ra,28(sp)
40000e2c:	00812c23          	sw	s0,24(sp)
40000e30:	02010413          	addi	s0,sp,32
40000e34:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40000e38:	fec42783          	lw	a5,-20(s0)
40000e3c:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40000e40:	00000013          	nop
40000e44:	fec42503          	lw	a0,-20(s0)
40000e48:	f7dff0ef          	jal	ra,40000dc4 <vga_isBusy>
40000e4c:	00050793          	mv	a5,a0
40000e50:	fe079ae3          	bnez	a5,40000e44 <vga_stop+0x20>
}
40000e54:	00000013          	nop
40000e58:	00000013          	nop
40000e5c:	01c12083          	lw	ra,28(sp)
40000e60:	01812403          	lw	s0,24(sp)
40000e64:	02010113          	addi	sp,sp,32
40000e68:	00008067          	ret

40000e6c <aes_write>:
#include "briey.h"
void aes_write(uint32_t iData, uint32_t iAddress)
{
40000e6c:	fe010113          	addi	sp,sp,-32
40000e70:	00812e23          	sw	s0,28(sp)
40000e74:	02010413          	addi	s0,sp,32
40000e78:	fea42623          	sw	a0,-20(s0)
40000e7c:	feb42423          	sw	a1,-24(s0)
	AES_BASE->ADDRESS		= iAddress;
40000e80:	f00027b7          	lui	a5,0xf0002
40000e84:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000e88:	fe842703          	lw	a4,-24(s0)
40000e8c:	00e7a423          	sw	a4,8(a5)
	AES_BASE->WRITE_ENABLE 	= 1;
40000e90:	f00027b7          	lui	a5,0xf0002
40000e94:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000e98:	00100713          	li	a4,1
40000e9c:	00e7a223          	sw	a4,4(a5)
	AES_BASE->IDATA			= iData;
40000ea0:	f00027b7          	lui	a5,0xf0002
40000ea4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000ea8:	fec42703          	lw	a4,-20(s0)
40000eac:	00e7a623          	sw	a4,12(a5)
	AES_BASE->CHIP_SELECT	= 1;
40000eb0:	f00027b7          	lui	a5,0xf0002
40000eb4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000eb8:	00100713          	li	a4,1
40000ebc:	00e7a023          	sw	a4,0(a5)
	AES_BASE->CHIP_SELECT	= 0;
40000ec0:	f00027b7          	lui	a5,0xf0002
40000ec4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000ec8:	0007a023          	sw	zero,0(a5)
}
40000ecc:	00000013          	nop
40000ed0:	01c12403          	lw	s0,28(sp)
40000ed4:	02010113          	addi	sp,sp,32
40000ed8:	00008067          	ret

40000edc <aes_read>:
uint32_t aes_read(uint32_t iAddress)
{
40000edc:	fd010113          	addi	sp,sp,-48
40000ee0:	02812623          	sw	s0,44(sp)
40000ee4:	03010413          	addi	s0,sp,48
40000ee8:	fca42e23          	sw	a0,-36(s0)
	AES_BASE->ADDRESS		= iAddress;
40000eec:	f00027b7          	lui	a5,0xf0002
40000ef0:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000ef4:	fdc42703          	lw	a4,-36(s0)
40000ef8:	00e7a423          	sw	a4,8(a5)
	AES_BASE->WRITE_ENABLE	= 0;
40000efc:	f00027b7          	lui	a5,0xf0002
40000f00:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000f04:	0007a223          	sw	zero,4(a5)
	AES_BASE->CHIP_SELECT	= 1;
40000f08:	f00027b7          	lui	a5,0xf0002
40000f0c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000f10:	00100713          	li	a4,1
40000f14:	00e7a023          	sw	a4,0(a5)
	uint32_t res 				= AES_BASE->ODATA;
40000f18:	f00027b7          	lui	a5,0xf0002
40000f1c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000f20:	0107a783          	lw	a5,16(a5)
40000f24:	fef42623          	sw	a5,-20(s0)
	AES_BASE->CHIP_SELECT	= 0;
40000f28:	f00027b7          	lui	a5,0xf0002
40000f2c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000f30:	0007a023          	sw	zero,0(a5)
	return res;
40000f34:	fec42783          	lw	a5,-20(s0)
}
40000f38:	00078513          	mv	a0,a5
40000f3c:	02c12403          	lw	s0,44(sp)
40000f40:	03010113          	addi	sp,sp,48
40000f44:	00008067          	ret

40000f48 <aes_128_cipher>:
void aes_128_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
40000f48:	fd010113          	addi	sp,sp,-48
40000f4c:	02112623          	sw	ra,44(sp)
40000f50:	02812423          	sw	s0,40(sp)
40000f54:	02912223          	sw	s1,36(sp)
40000f58:	03010413          	addi	s0,sp,48
40000f5c:	00050793          	mv	a5,a0
40000f60:	fcb42c23          	sw	a1,-40(s0)
40000f64:	fcc42a23          	sw	a2,-44(s0)
40000f68:	fcd42823          	sw	a3,-48(s0)
40000f6c:	fcf40fa3          	sb	a5,-33(s0)
	aes_write(0x0,AES_ADDR_KEY_BASE +7);
40000f70:	01700593          	li	a1,23
40000f74:	00000513          	li	a0,0
40000f78:	ef5ff0ef          	jal	ra,40000e6c <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +6);
40000f7c:	01600593          	li	a1,22
40000f80:	00000513          	li	a0,0
40000f84:	ee9ff0ef          	jal	ra,40000e6c <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +5);
40000f88:	01500593          	li	a1,21
40000f8c:	00000513          	li	a0,0
40000f90:	eddff0ef          	jal	ra,40000e6c <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +4);
40000f94:	01400593          	li	a1,20
40000f98:	00000513          	li	a0,0
40000f9c:	ed1ff0ef          	jal	ra,40000e6c <aes_write>
	aes_write(key[3],AES_ADDR_KEY_BASE +3);
40000fa0:	fd842783          	lw	a5,-40(s0)
40000fa4:	00c78793          	addi	a5,a5,12
40000fa8:	0007a783          	lw	a5,0(a5)
40000fac:	01300593          	li	a1,19
40000fb0:	00078513          	mv	a0,a5
40000fb4:	eb9ff0ef          	jal	ra,40000e6c <aes_write>
	aes_write(key[2],AES_ADDR_KEY_BASE +2);
40000fb8:	fd842783          	lw	a5,-40(s0)
40000fbc:	00878793          	addi	a5,a5,8
40000fc0:	0007a783          	lw	a5,0(a5)
40000fc4:	01200593          	li	a1,18
40000fc8:	00078513          	mv	a0,a5
40000fcc:	ea1ff0ef          	jal	ra,40000e6c <aes_write>
	aes_write(key[1],AES_ADDR_KEY_BASE +1);
40000fd0:	fd842783          	lw	a5,-40(s0)
40000fd4:	00478793          	addi	a5,a5,4
40000fd8:	0007a783          	lw	a5,0(a5)
40000fdc:	01100593          	li	a1,17
40000fe0:	00078513          	mv	a0,a5
40000fe4:	e89ff0ef          	jal	ra,40000e6c <aes_write>
	aes_write(key[0],AES_ADDR_KEY_BASE);
40000fe8:	fd842783          	lw	a5,-40(s0)
40000fec:	0007a783          	lw	a5,0(a5)
40000ff0:	01000593          	li	a1,16
40000ff4:	00078513          	mv	a0,a5
40000ff8:	e75ff0ef          	jal	ra,40000e6c <aes_write>

	aes_write(AES_CONFIG_128_KEY,AES_ADDR_CONFIG);
40000ffc:	00a00593          	li	a1,10
40001000:	00000513          	li	a0,0
40001004:	e69ff0ef          	jal	ra,40000e6c <aes_write>
	aes_write(AES_CTRL_INIT_KEY,AES_ADDR_CTRL);
40001008:	00800593          	li	a1,8
4000100c:	00100513          	li	a0,1
40001010:	e5dff0ef          	jal	ra,40000e6c <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
40001014:	00000013          	nop
40001018:	00900513          	li	a0,9
4000101c:	ec1ff0ef          	jal	ra,40000edc <aes_read>
40001020:	00050793          	mv	a5,a0
40001024:	fe078ae3          	beqz	a5,40001018 <aes_128_cipher+0xd0>

    aes_write(block[3],AES_ADDR_BLOCK_BASE + 3);
40001028:	fd442783          	lw	a5,-44(s0)
4000102c:	00c78793          	addi	a5,a5,12
40001030:	0007a783          	lw	a5,0(a5)
40001034:	02300593          	li	a1,35
40001038:	00078513          	mv	a0,a5
4000103c:	e31ff0ef          	jal	ra,40000e6c <aes_write>
    aes_write(block[2],AES_ADDR_BLOCK_BASE + 2);
40001040:	fd442783          	lw	a5,-44(s0)
40001044:	00878793          	addi	a5,a5,8
40001048:	0007a783          	lw	a5,0(a5)
4000104c:	02200593          	li	a1,34
40001050:	00078513          	mv	a0,a5
40001054:	e19ff0ef          	jal	ra,40000e6c <aes_write>
    aes_write(block[1],AES_ADDR_BLOCK_BASE + 1);
40001058:	fd442783          	lw	a5,-44(s0)
4000105c:	00478793          	addi	a5,a5,4
40001060:	0007a783          	lw	a5,0(a5)
40001064:	02100593          	li	a1,33
40001068:	00078513          	mv	a0,a5
4000106c:	e01ff0ef          	jal	ra,40000e6c <aes_write>
    aes_write(block[0],AES_ADDR_BLOCK_BASE + 0);
40001070:	fd442783          	lw	a5,-44(s0)
40001074:	0007a783          	lw	a5,0(a5)
40001078:	02000593          	li	a1,32
4000107c:	00078513          	mv	a0,a5
40001080:	dedff0ef          	jal	ra,40000e6c <aes_write>


    unsigned char AES_CONFIG = 0x00;
40001084:	fe0407a3          	sb	zero,-17(s0)
	if (operation == 0x01)
40001088:	fdf44703          	lbu	a4,-33(s0)
4000108c:	00100793          	li	a5,1
40001090:	00f71863          	bne	a4,a5,400010a0 <aes_128_cipher+0x158>
		AES_CONFIG = AES_CONFIG_128_EN;
40001094:	00100793          	li	a5,1
40001098:	fef407a3          	sb	a5,-17(s0)
4000109c:	0080006f          	j	400010a4 <aes_128_cipher+0x15c>
	else
		AES_CONFIG = AES_CONFIG_128_DE;
400010a0:	fe0407a3          	sb	zero,-17(s0)

	aes_write(AES_CONFIG,AES_ADDR_CONFIG);
400010a4:	fef44783          	lbu	a5,-17(s0)
400010a8:	00a00593          	li	a1,10
400010ac:	00078513          	mv	a0,a5
400010b0:	dbdff0ef          	jal	ra,40000e6c <aes_write>
    aes_write(AES_CTRL_START, AES_ADDR_CTRL);
400010b4:	00800593          	li	a1,8
400010b8:	00200513          	li	a0,2
400010bc:	db1ff0ef          	jal	ra,40000e6c <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
400010c0:	00000013          	nop
400010c4:	00900513          	li	a0,9
400010c8:	e15ff0ef          	jal	ra,40000edc <aes_read>
400010cc:	00050793          	mv	a5,a0
400010d0:	fe078ae3          	beqz	a5,400010c4 <aes_128_cipher+0x17c>

    res[3] = aes_read(AES_ADDR_RESULT_BASE + 3);
400010d4:	fd042783          	lw	a5,-48(s0)
400010d8:	00c78493          	addi	s1,a5,12
400010dc:	03300513          	li	a0,51
400010e0:	dfdff0ef          	jal	ra,40000edc <aes_read>
400010e4:	00050793          	mv	a5,a0
400010e8:	00f4a023          	sw	a5,0(s1)
    res[2] = aes_read(AES_ADDR_RESULT_BASE + 2);
400010ec:	fd042783          	lw	a5,-48(s0)
400010f0:	00878493          	addi	s1,a5,8
400010f4:	03200513          	li	a0,50
400010f8:	de5ff0ef          	jal	ra,40000edc <aes_read>
400010fc:	00050793          	mv	a5,a0
40001100:	00f4a023          	sw	a5,0(s1)
    res[1] = aes_read(AES_ADDR_RESULT_BASE + 1);
40001104:	fd042783          	lw	a5,-48(s0)
40001108:	00478493          	addi	s1,a5,4
4000110c:	03100513          	li	a0,49
40001110:	dcdff0ef          	jal	ra,40000edc <aes_read>
40001114:	00050793          	mv	a5,a0
40001118:	00f4a023          	sw	a5,0(s1)
    res[0] = aes_read(AES_ADDR_RESULT_BASE + 0);
4000111c:	03000513          	li	a0,48
40001120:	dbdff0ef          	jal	ra,40000edc <aes_read>
40001124:	00050713          	mv	a4,a0
40001128:	fd042783          	lw	a5,-48(s0)
4000112c:	00e7a023          	sw	a4,0(a5)

    //print result to terminal
	if(operation == 0x1)
40001130:	fdf44703          	lbu	a4,-33(s0)
40001134:	00100793          	li	a5,1
40001138:	00f71a63          	bne	a4,a5,4000114c <aes_128_cipher+0x204>
		print("\r\t============================AES128 ENCRYPTTION==============================\r\n");
4000113c:	400027b7          	lui	a5,0x40002
40001140:	18078513          	addi	a0,a5,384 # 40002180 <vga_simRes_h160_v120+0x20>
40001144:	53c000ef          	jal	ra,40001680 <print>
40001148:	0100006f          	j	40001158 <aes_128_cipher+0x210>
	else
		print("\r\t============================AES128 DECRYPTTION==============================\r\n");
4000114c:	400027b7          	lui	a5,0x40002
40001150:	1d478513          	addi	a0,a5,468 # 400021d4 <vga_simRes_h160_v120+0x74>
40001154:	52c000ef          	jal	ra,40001680 <print>
	print("\r\n");
40001158:	400027b7          	lui	a5,0x40002
4000115c:	22878513          	addi	a0,a5,552 # 40002228 <vga_simRes_h160_v120+0xc8>
40001160:	520000ef          	jal	ra,40001680 <print>
	print128bit("\r\tPLAIN_TEXT (128-bit) : ", block);
40001164:	fd442583          	lw	a1,-44(s0)
40001168:	400027b7          	lui	a5,0x40002
4000116c:	22c78513          	addi	a0,a5,556 # 4000222c <vga_simRes_h160_v120+0xcc>
40001170:	7e8000ef          	jal	ra,40001958 <print128bit>
	print128bit("KEY (128-bit) : ", key);
40001174:	fd842583          	lw	a1,-40(s0)
40001178:	400027b7          	lui	a5,0x40002
4000117c:	24878513          	addi	a0,a5,584 # 40002248 <vga_simRes_h160_v120+0xe8>
40001180:	7d8000ef          	jal	ra,40001958 <print128bit>
	print128bit("RESULT (128-bit) : ", res);
40001184:	fd042583          	lw	a1,-48(s0)
40001188:	400027b7          	lui	a5,0x40002
4000118c:	25c78513          	addi	a0,a5,604 # 4000225c <vga_simRes_h160_v120+0xfc>
40001190:	7c8000ef          	jal	ra,40001958 <print128bit>
}
40001194:	00000013          	nop
40001198:	02c12083          	lw	ra,44(sp)
4000119c:	02812403          	lw	s0,40(sp)
400011a0:	02412483          	lw	s1,36(sp)
400011a4:	03010113          	addi	sp,sp,48
400011a8:	00008067          	ret

400011ac <aes_256_cipher>:

void aes_256_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
400011ac:	fd010113          	addi	sp,sp,-48
400011b0:	02112623          	sw	ra,44(sp)
400011b4:	02812423          	sw	s0,40(sp)
400011b8:	02912223          	sw	s1,36(sp)
400011bc:	03010413          	addi	s0,sp,48
400011c0:	00050793          	mv	a5,a0
400011c4:	fcb42c23          	sw	a1,-40(s0)
400011c8:	fcc42a23          	sw	a2,-44(s0)
400011cc:	fcd42823          	sw	a3,-48(s0)
400011d0:	fcf40fa3          	sb	a5,-33(s0)
	aes_write(key[7],AES_ADDR_KEY_BASE +7);
400011d4:	fd842783          	lw	a5,-40(s0)
400011d8:	01c78793          	addi	a5,a5,28
400011dc:	0007a783          	lw	a5,0(a5)
400011e0:	01700593          	li	a1,23
400011e4:	00078513          	mv	a0,a5
400011e8:	c85ff0ef          	jal	ra,40000e6c <aes_write>
	aes_write(key[6],AES_ADDR_KEY_BASE +6);
400011ec:	fd842783          	lw	a5,-40(s0)
400011f0:	01878793          	addi	a5,a5,24
400011f4:	0007a783          	lw	a5,0(a5)
400011f8:	01600593          	li	a1,22
400011fc:	00078513          	mv	a0,a5
40001200:	c6dff0ef          	jal	ra,40000e6c <aes_write>
	aes_write(key[5],AES_ADDR_KEY_BASE +5);
40001204:	fd842783          	lw	a5,-40(s0)
40001208:	01478793          	addi	a5,a5,20
4000120c:	0007a783          	lw	a5,0(a5)
40001210:	01500593          	li	a1,21
40001214:	00078513          	mv	a0,a5
40001218:	c55ff0ef          	jal	ra,40000e6c <aes_write>
	aes_write(key[4],AES_ADDR_KEY_BASE +4);
4000121c:	fd842783          	lw	a5,-40(s0)
40001220:	01078793          	addi	a5,a5,16
40001224:	0007a783          	lw	a5,0(a5)
40001228:	01400593          	li	a1,20
4000122c:	00078513          	mv	a0,a5
40001230:	c3dff0ef          	jal	ra,40000e6c <aes_write>
	aes_write(key[3],AES_ADDR_KEY_BASE +3);
40001234:	fd842783          	lw	a5,-40(s0)
40001238:	00c78793          	addi	a5,a5,12
4000123c:	0007a783          	lw	a5,0(a5)
40001240:	01300593          	li	a1,19
40001244:	00078513          	mv	a0,a5
40001248:	c25ff0ef          	jal	ra,40000e6c <aes_write>
	aes_write(key[2],AES_ADDR_KEY_BASE +2);
4000124c:	fd842783          	lw	a5,-40(s0)
40001250:	00878793          	addi	a5,a5,8
40001254:	0007a783          	lw	a5,0(a5)
40001258:	01200593          	li	a1,18
4000125c:	00078513          	mv	a0,a5
40001260:	c0dff0ef          	jal	ra,40000e6c <aes_write>
	aes_write(key[1],AES_ADDR_KEY_BASE +1);
40001264:	fd842783          	lw	a5,-40(s0)
40001268:	00478793          	addi	a5,a5,4
4000126c:	0007a783          	lw	a5,0(a5)
40001270:	01100593          	li	a1,17
40001274:	00078513          	mv	a0,a5
40001278:	bf5ff0ef          	jal	ra,40000e6c <aes_write>
	aes_write(key[0],AES_ADDR_KEY_BASE);
4000127c:	fd842783          	lw	a5,-40(s0)
40001280:	0007a783          	lw	a5,0(a5)
40001284:	01000593          	li	a1,16
40001288:	00078513          	mv	a0,a5
4000128c:	be1ff0ef          	jal	ra,40000e6c <aes_write>

	aes_write(AES_CONFIG_256_KEY,AES_ADDR_CONFIG);
40001290:	00a00593          	li	a1,10
40001294:	00200513          	li	a0,2
40001298:	bd5ff0ef          	jal	ra,40000e6c <aes_write>
	aes_write(AES_CTRL_INIT_KEY,AES_ADDR_CTRL);
4000129c:	00800593          	li	a1,8
400012a0:	00100513          	li	a0,1
400012a4:	bc9ff0ef          	jal	ra,40000e6c <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
400012a8:	00000013          	nop
400012ac:	00900513          	li	a0,9
400012b0:	c2dff0ef          	jal	ra,40000edc <aes_read>
400012b4:	00050793          	mv	a5,a0
400012b8:	fe078ae3          	beqz	a5,400012ac <aes_256_cipher+0x100>

    aes_write(block[3],AES_ADDR_BLOCK_BASE + 3);
400012bc:	fd442783          	lw	a5,-44(s0)
400012c0:	00c78793          	addi	a5,a5,12
400012c4:	0007a783          	lw	a5,0(a5)
400012c8:	02300593          	li	a1,35
400012cc:	00078513          	mv	a0,a5
400012d0:	b9dff0ef          	jal	ra,40000e6c <aes_write>
    aes_write(block[2],AES_ADDR_BLOCK_BASE + 2);
400012d4:	fd442783          	lw	a5,-44(s0)
400012d8:	00878793          	addi	a5,a5,8
400012dc:	0007a783          	lw	a5,0(a5)
400012e0:	02200593          	li	a1,34
400012e4:	00078513          	mv	a0,a5
400012e8:	b85ff0ef          	jal	ra,40000e6c <aes_write>
    aes_write(block[1],AES_ADDR_BLOCK_BASE + 1);
400012ec:	fd442783          	lw	a5,-44(s0)
400012f0:	00478793          	addi	a5,a5,4
400012f4:	0007a783          	lw	a5,0(a5)
400012f8:	02100593          	li	a1,33
400012fc:	00078513          	mv	a0,a5
40001300:	b6dff0ef          	jal	ra,40000e6c <aes_write>
    aes_write(block[0],AES_ADDR_BLOCK_BASE + 0);
40001304:	fd442783          	lw	a5,-44(s0)
40001308:	0007a783          	lw	a5,0(a5)
4000130c:	02000593          	li	a1,32
40001310:	00078513          	mv	a0,a5
40001314:	b59ff0ef          	jal	ra,40000e6c <aes_write>


    unsigned char AES_CONFIG = 0x00;
40001318:	fe0407a3          	sb	zero,-17(s0)
	if (operation == 0x01)
4000131c:	fdf44703          	lbu	a4,-33(s0)
40001320:	00100793          	li	a5,1
40001324:	00f71863          	bne	a4,a5,40001334 <aes_256_cipher+0x188>
		AES_CONFIG = AES_CONFIG_256_EN;
40001328:	00300793          	li	a5,3
4000132c:	fef407a3          	sb	a5,-17(s0)
40001330:	00c0006f          	j	4000133c <aes_256_cipher+0x190>
	else
		AES_CONFIG = AES_CONFIG_256_DE;
40001334:	00200793          	li	a5,2
40001338:	fef407a3          	sb	a5,-17(s0)

	aes_write(AES_CONFIG, AES_ADDR_CONFIG);
4000133c:	fef44783          	lbu	a5,-17(s0)
40001340:	00a00593          	li	a1,10
40001344:	00078513          	mv	a0,a5
40001348:	b25ff0ef          	jal	ra,40000e6c <aes_write>
    aes_write(AES_CTRL_START, AES_ADDR_CTRL);
4000134c:	00800593          	li	a1,8
40001350:	00200513          	li	a0,2
40001354:	b19ff0ef          	jal	ra,40000e6c <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
40001358:	00000013          	nop
4000135c:	00900513          	li	a0,9
40001360:	b7dff0ef          	jal	ra,40000edc <aes_read>
40001364:	00050793          	mv	a5,a0
40001368:	fe078ae3          	beqz	a5,4000135c <aes_256_cipher+0x1b0>

    res[3] = aes_read(AES_ADDR_RESULT_BASE + 3);
4000136c:	fd042783          	lw	a5,-48(s0)
40001370:	00c78493          	addi	s1,a5,12
40001374:	03300513          	li	a0,51
40001378:	b65ff0ef          	jal	ra,40000edc <aes_read>
4000137c:	00050793          	mv	a5,a0
40001380:	00f4a023          	sw	a5,0(s1)
    res[2] = aes_read(AES_ADDR_RESULT_BASE + 2);
40001384:	fd042783          	lw	a5,-48(s0)
40001388:	00878493          	addi	s1,a5,8
4000138c:	03200513          	li	a0,50
40001390:	b4dff0ef          	jal	ra,40000edc <aes_read>
40001394:	00050793          	mv	a5,a0
40001398:	00f4a023          	sw	a5,0(s1)
    res[1] = aes_read(AES_ADDR_RESULT_BASE + 1);
4000139c:	fd042783          	lw	a5,-48(s0)
400013a0:	00478493          	addi	s1,a5,4
400013a4:	03100513          	li	a0,49
400013a8:	b35ff0ef          	jal	ra,40000edc <aes_read>
400013ac:	00050793          	mv	a5,a0
400013b0:	00f4a023          	sw	a5,0(s1)
    res[0] = aes_read(AES_ADDR_RESULT_BASE + 0);
400013b4:	03000513          	li	a0,48
400013b8:	b25ff0ef          	jal	ra,40000edc <aes_read>
400013bc:	00050713          	mv	a4,a0
400013c0:	fd042783          	lw	a5,-48(s0)
400013c4:	00e7a023          	sw	a4,0(a5)

    //print result to terminal
	if(operation == 0x1)
400013c8:	fdf44703          	lbu	a4,-33(s0)
400013cc:	00100793          	li	a5,1
400013d0:	00f71a63          	bne	a4,a5,400013e4 <aes_256_cipher+0x238>
		print("\r\t======================================AES256 ENCRYPTTION========================================\r\n");
400013d4:	400027b7          	lui	a5,0x40002
400013d8:	27078513          	addi	a0,a5,624 # 40002270 <vga_simRes_h160_v120+0x110>
400013dc:	2a4000ef          	jal	ra,40001680 <print>
400013e0:	0100006f          	j	400013f0 <aes_256_cipher+0x244>
	else
		print("\r\t======================================AES256 DECRYPTTION========================================\r\n");
400013e4:	400027b7          	lui	a5,0x40002
400013e8:	2d878513          	addi	a0,a5,728 # 400022d8 <vga_simRes_h160_v120+0x178>
400013ec:	294000ef          	jal	ra,40001680 <print>
	print("\r\n");
400013f0:	400027b7          	lui	a5,0x40002
400013f4:	22878513          	addi	a0,a5,552 # 40002228 <vga_simRes_h160_v120+0xc8>
400013f8:	288000ef          	jal	ra,40001680 <print>
	print128bit("PLAIN_TEXT (128-bit) : ", block);
400013fc:	fd442583          	lw	a1,-44(s0)
40001400:	400027b7          	lui	a5,0x40002
40001404:	34078513          	addi	a0,a5,832 # 40002340 <vga_simRes_h160_v120+0x1e0>
40001408:	550000ef          	jal	ra,40001958 <print128bit>
	print256bit("KEY (256-bit) : ", key);
4000140c:	fd842583          	lw	a1,-40(s0)
40001410:	400027b7          	lui	a5,0x40002
40001414:	35878513          	addi	a0,a5,856 # 40002358 <vga_simRes_h160_v120+0x1f8>
40001418:	65c000ef          	jal	ra,40001a74 <print256bit>
	print128bit("RESULT (128-bit) : ", res);
4000141c:	fd042583          	lw	a1,-48(s0)
40001420:	400027b7          	lui	a5,0x40002
40001424:	25c78513          	addi	a0,a5,604 # 4000225c <vga_simRes_h160_v120+0xfc>
40001428:	530000ef          	jal	ra,40001958 <print128bit>
	//print("\r\n================================================================================================\r\n");

}
4000142c:	00000013          	nop
40001430:	02c12083          	lw	ra,44(sp)
40001434:	02812403          	lw	s0,40(sp)
40001438:	02412483          	lw	s1,36(sp)
4000143c:	03010113          	addi	sp,sp,48
40001440:	00008067          	ret

40001444 <timer_init>:
static void timer_init(Timer_Reg *reg){
40001444:	fe010113          	addi	sp,sp,-32
40001448:	00812e23          	sw	s0,28(sp)
4000144c:	02010413          	addi	s0,sp,32
40001450:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40001454:	fec42783          	lw	a5,-20(s0)
40001458:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
4000145c:	fec42783          	lw	a5,-20(s0)
40001460:	0007a423          	sw	zero,8(a5)
}
40001464:	00000013          	nop
40001468:	01c12403          	lw	s0,28(sp)
4000146c:	02010113          	addi	sp,sp,32
40001470:	00008067          	ret

40001474 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001474:	fe010113          	addi	sp,sp,-32
40001478:	00812e23          	sw	s0,28(sp)
4000147c:	02010413          	addi	s0,sp,32
40001480:	fea42623          	sw	a0,-20(s0)
}
40001484:	00000013          	nop
40001488:	01c12403          	lw	s0,28(sp)
4000148c:	02010113          	addi	sp,sp,32
40001490:	00008067          	ret

40001494 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001494:	fe010113          	addi	sp,sp,-32
40001498:	00812e23          	sw	s0,28(sp)
4000149c:	02010413          	addi	s0,sp,32
400014a0:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
400014a4:	fec42783          	lw	a5,-20(s0)
400014a8:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
400014ac:	fec42783          	lw	a5,-20(s0)
400014b0:	fff00713          	li	a4,-1
400014b4:	00e7a023          	sw	a4,0(a5)
}
400014b8:	00000013          	nop
400014bc:	01c12403          	lw	s0,28(sp)
400014c0:	02010113          	addi	sp,sp,32
400014c4:	00008067          	ret

400014c8 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
400014c8:	fe010113          	addi	sp,sp,-32
400014cc:	00812e23          	sw	s0,28(sp)
400014d0:	02010413          	addi	s0,sp,32
400014d4:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
400014d8:	fec42783          	lw	a5,-20(s0)
400014dc:	0047a783          	lw	a5,4(a5)
400014e0:	0107d793          	srli	a5,a5,0x10
400014e4:	0ff7f793          	zext.b	a5,a5
}
400014e8:	00078513          	mv	a0,a5
400014ec:	01c12403          	lw	s0,28(sp)
400014f0:	02010113          	addi	sp,sp,32
400014f4:	00008067          	ret

400014f8 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
400014f8:	fe010113          	addi	sp,sp,-32
400014fc:	00812e23          	sw	s0,28(sp)
40001500:	02010413          	addi	s0,sp,32
40001504:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40001508:	fec42783          	lw	a5,-20(s0)
4000150c:	0047a783          	lw	a5,4(a5)
40001510:	0187d793          	srli	a5,a5,0x18
}
40001514:	00078513          	mv	a0,a5
40001518:	01c12403          	lw	s0,28(sp)
4000151c:	02010113          	addi	sp,sp,32
40001520:	00008067          	ret

40001524 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40001524:	fe010113          	addi	sp,sp,-32
40001528:	00112e23          	sw	ra,28(sp)
4000152c:	00812c23          	sw	s0,24(sp)
40001530:	02010413          	addi	s0,sp,32
40001534:	fea42623          	sw	a0,-20(s0)
40001538:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
4000153c:	00000013          	nop
40001540:	fec42503          	lw	a0,-20(s0)
40001544:	f85ff0ef          	jal	ra,400014c8 <uart_writeAvailability>
40001548:	00050793          	mv	a5,a0
4000154c:	fe078ae3          	beqz	a5,40001540 <uart_write+0x1c>
	reg->DATA = data;
40001550:	fec42783          	lw	a5,-20(s0)
40001554:	fe842703          	lw	a4,-24(s0)
40001558:	00e7a023          	sw	a4,0(a5)
}
4000155c:	00000013          	nop
40001560:	01c12083          	lw	ra,28(sp)
40001564:	01812403          	lw	s0,24(sp)
40001568:	02010113          	addi	sp,sp,32
4000156c:	00008067          	ret

40001570 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001570:	fe010113          	addi	sp,sp,-32
40001574:	00812e23          	sw	s0,28(sp)
40001578:	02010413          	addi	s0,sp,32
4000157c:	fea42623          	sw	a0,-20(s0)
40001580:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001584:	fe842783          	lw	a5,-24(s0)
40001588:	00c7a703          	lw	a4,12(a5)
4000158c:	fec42783          	lw	a5,-20(s0)
40001590:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001594:	fe842783          	lw	a5,-24(s0)
40001598:	0007a783          	lw	a5,0(a5)
4000159c:	fff78713          	addi	a4,a5,-1
400015a0:	fe842783          	lw	a5,-24(s0)
400015a4:	0047a783          	lw	a5,4(a5)
400015a8:	00879793          	slli	a5,a5,0x8
400015ac:	00f76733          	or	a4,a4,a5
400015b0:	fe842783          	lw	a5,-24(s0)
400015b4:	0087a783          	lw	a5,8(a5)
400015b8:	01079793          	slli	a5,a5,0x10
400015bc:	00f76733          	or	a4,a4,a5
400015c0:	fec42783          	lw	a5,-20(s0)
400015c4:	00e7a623          	sw	a4,12(a5)
}
400015c8:	00000013          	nop
400015cc:	01c12403          	lw	s0,28(sp)
400015d0:	02010113          	addi	sp,sp,32
400015d4:	00008067          	ret

400015d8 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
400015d8:	fe010113          	addi	sp,sp,-32
400015dc:	00812e23          	sw	s0,28(sp)
400015e0:	02010413          	addi	s0,sp,32
400015e4:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
400015e8:	fec42783          	lw	a5,-20(s0)
400015ec:	0007a783          	lw	a5,0(a5)
400015f0:	0027f793          	andi	a5,a5,2
400015f4:	00f037b3          	snez	a5,a5
400015f8:	0ff7f793          	zext.b	a5,a5
}
400015fc:	00078513          	mv	a0,a5
40001600:	01c12403          	lw	s0,28(sp)
40001604:	02010113          	addi	sp,sp,32
40001608:	00008067          	ret

4000160c <vga_run>:
static void vga_run(Vga_Reg *reg){
4000160c:	fe010113          	addi	sp,sp,-32
40001610:	00812e23          	sw	s0,28(sp)
40001614:	02010413          	addi	s0,sp,32
40001618:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
4000161c:	fec42783          	lw	a5,-20(s0)
40001620:	00100713          	li	a4,1
40001624:	00e7a023          	sw	a4,0(a5)
}
40001628:	00000013          	nop
4000162c:	01c12403          	lw	s0,28(sp)
40001630:	02010113          	addi	sp,sp,32
40001634:	00008067          	ret

40001638 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40001638:	fe010113          	addi	sp,sp,-32
4000163c:	00112e23          	sw	ra,28(sp)
40001640:	00812c23          	sw	s0,24(sp)
40001644:	02010413          	addi	s0,sp,32
40001648:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
4000164c:	fec42783          	lw	a5,-20(s0)
40001650:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001654:	00000013          	nop
40001658:	fec42503          	lw	a0,-20(s0)
4000165c:	f7dff0ef          	jal	ra,400015d8 <vga_isBusy>
40001660:	00050793          	mv	a5,a0
40001664:	fe079ae3          	bnez	a5,40001658 <vga_stop+0x20>
}
40001668:	00000013          	nop
4000166c:	00000013          	nop
40001670:	01c12083          	lw	ra,28(sp)
40001674:	01812403          	lw	s0,24(sp)
40001678:	02010113          	addi	sp,sp,32
4000167c:	00008067          	ret

40001680 <print>:
#include <briey.h>

void print(char *str){
40001680:	fe010113          	addi	sp,sp,-32
40001684:	00112e23          	sw	ra,28(sp)
40001688:	00812c23          	sw	s0,24(sp)
4000168c:	02010413          	addi	s0,sp,32
40001690:	fea42623          	sw	a0,-20(s0)
	while(*str){
40001694:	0200006f          	j	400016b4 <print+0x34>
		uart_write(UART,*(str++));
40001698:	fec42783          	lw	a5,-20(s0)
4000169c:	00178713          	addi	a4,a5,1
400016a0:	fee42623          	sw	a4,-20(s0)
400016a4:	0007c783          	lbu	a5,0(a5)
400016a8:	00078593          	mv	a1,a5
400016ac:	f0010537          	lui	a0,0xf0010
400016b0:	e75ff0ef          	jal	ra,40001524 <uart_write>
	while(*str){
400016b4:	fec42783          	lw	a5,-20(s0)
400016b8:	0007c783          	lbu	a5,0(a5)
400016bc:	fc079ee3          	bnez	a5,40001698 <print+0x18>
	}
}
400016c0:	00000013          	nop
400016c4:	00000013          	nop
400016c8:	01c12083          	lw	ra,28(sp)
400016cc:	01812403          	lw	s0,24(sp)
400016d0:	02010113          	addi	sp,sp,32
400016d4:	00008067          	ret

400016d8 <print16bit>:

void print16bit(uint32_t n)
{
400016d8:	fc010113          	addi	sp,sp,-64
400016dc:	02112e23          	sw	ra,60(sp)
400016e0:	02812c23          	sw	s0,56(sp)
400016e4:	04010413          	addi	s0,sp,64
400016e8:	fca42623          	sw	a0,-52(s0)

    int i = 0;
400016ec:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
400016f0:	fc042e23          	sw	zero,-36(s0)
400016f4:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
400016f8:	fcc42783          	lw	a5,-52(s0)
400016fc:	00f7f793          	andi	a5,a5,15
40001700:	40002737          	lui	a4,0x40002
40001704:	3d070713          	addi	a4,a4,976 # 400023d0 <vga_simRes_h160_v120+0x24>
40001708:	00f707b3          	add	a5,a4,a5
4000170c:	0007c703          	lbu	a4,0(a5)
40001710:	fec42783          	lw	a5,-20(s0)
40001714:	ff040693          	addi	a3,s0,-16
40001718:	00f687b3          	add	a5,a3,a5
4000171c:	fee78623          	sb	a4,-20(a5)
        i++;
40001720:	fec42783          	lw	a5,-20(s0)
40001724:	00178793          	addi	a5,a5,1
40001728:	fef42623          	sw	a5,-20(s0)
        n = n/16;
4000172c:	fcc42783          	lw	a5,-52(s0)
40001730:	0047d793          	srli	a5,a5,0x4
40001734:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40001738:	fcc42783          	lw	a5,-52(s0)
4000173c:	fa079ee3          	bnez	a5,400016f8 <print16bit+0x20>
    if(i<8) {
40001740:	fec42703          	lw	a4,-20(s0)
40001744:	00700793          	li	a5,7
40001748:	02e7ce63          	blt	a5,a4,40001784 <print16bit+0xac>
    	for(int j=7;j>=i;j--){
4000174c:	00700793          	li	a5,7
40001750:	fef42423          	sw	a5,-24(s0)
40001754:	0240006f          	j	40001778 <print16bit+0xa0>
    		outbuf_inv[j]="0"[0];
40001758:	03000713          	li	a4,48
4000175c:	fe842783          	lw	a5,-24(s0)
40001760:	ff040693          	addi	a3,s0,-16
40001764:	00f687b3          	add	a5,a3,a5
40001768:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
4000176c:	fe842783          	lw	a5,-24(s0)
40001770:	fff78793          	addi	a5,a5,-1
40001774:	fef42423          	sw	a5,-24(s0)
40001778:	fe842703          	lw	a4,-24(s0)
4000177c:	fec42783          	lw	a5,-20(s0)
40001780:	fcf75ce3          	bge	a4,a5,40001758 <print16bit+0x80>
    	}
    }
    for(int j=3;j>=0;j--)
40001784:	00300793          	li	a5,3
40001788:	fef42223          	sw	a5,-28(s0)
4000178c:	02c0006f          	j	400017b8 <print16bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40001790:	fe442783          	lw	a5,-28(s0)
40001794:	ff040713          	addi	a4,s0,-16
40001798:	00f707b3          	add	a5,a4,a5
4000179c:	fec7c783          	lbu	a5,-20(a5)
400017a0:	00078593          	mv	a1,a5
400017a4:	f0010537          	lui	a0,0xf0010
400017a8:	d7dff0ef          	jal	ra,40001524 <uart_write>
    for(int j=3;j>=0;j--)
400017ac:	fe442783          	lw	a5,-28(s0)
400017b0:	fff78793          	addi	a5,a5,-1
400017b4:	fef42223          	sw	a5,-28(s0)
400017b8:	fe442783          	lw	a5,-28(s0)
400017bc:	fc07dae3          	bgez	a5,40001790 <print16bit+0xb8>
    }
    print(" ");
400017c0:	400027b7          	lui	a5,0x40002
400017c4:	3cc78513          	addi	a0,a5,972 # 400023cc <vga_simRes_h160_v120+0x20>
400017c8:	eb9ff0ef          	jal	ra,40001680 <print>
}
400017cc:	00000013          	nop
400017d0:	03c12083          	lw	ra,60(sp)
400017d4:	03812403          	lw	s0,56(sp)
400017d8:	04010113          	addi	sp,sp,64
400017dc:	00008067          	ret

400017e0 <print32bit>:
void print32bit(uint32_t n)
{
400017e0:	fc010113          	addi	sp,sp,-64
400017e4:	02112e23          	sw	ra,60(sp)
400017e8:	02812c23          	sw	s0,56(sp)
400017ec:	04010413          	addi	s0,sp,64
400017f0:	fca42623          	sw	a0,-52(s0)

    int i = 0;
400017f4:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
400017f8:	fc042e23          	sw	zero,-36(s0)
400017fc:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40001800:	fcc42783          	lw	a5,-52(s0)
40001804:	00f7f793          	andi	a5,a5,15
40001808:	40002737          	lui	a4,0x40002
4000180c:	3d070713          	addi	a4,a4,976 # 400023d0 <vga_simRes_h160_v120+0x24>
40001810:	00f707b3          	add	a5,a4,a5
40001814:	0007c703          	lbu	a4,0(a5)
40001818:	fec42783          	lw	a5,-20(s0)
4000181c:	ff040693          	addi	a3,s0,-16
40001820:	00f687b3          	add	a5,a3,a5
40001824:	fee78623          	sb	a4,-20(a5)
        i++;
40001828:	fec42783          	lw	a5,-20(s0)
4000182c:	00178793          	addi	a5,a5,1
40001830:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40001834:	fcc42783          	lw	a5,-52(s0)
40001838:	0047d793          	srli	a5,a5,0x4
4000183c:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40001840:	fcc42783          	lw	a5,-52(s0)
40001844:	fa079ee3          	bnez	a5,40001800 <print32bit+0x20>
    if(i<8) {
40001848:	fec42703          	lw	a4,-20(s0)
4000184c:	00700793          	li	a5,7
40001850:	02e7ce63          	blt	a5,a4,4000188c <print32bit+0xac>
    	for(int j=7;j>=i;j--){
40001854:	00700793          	li	a5,7
40001858:	fef42423          	sw	a5,-24(s0)
4000185c:	0240006f          	j	40001880 <print32bit+0xa0>
    		outbuf_inv[j]="0"[0];
40001860:	03000713          	li	a4,48
40001864:	fe842783          	lw	a5,-24(s0)
40001868:	ff040693          	addi	a3,s0,-16
4000186c:	00f687b3          	add	a5,a3,a5
40001870:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40001874:	fe842783          	lw	a5,-24(s0)
40001878:	fff78793          	addi	a5,a5,-1
4000187c:	fef42423          	sw	a5,-24(s0)
40001880:	fe842703          	lw	a4,-24(s0)
40001884:	fec42783          	lw	a5,-20(s0)
40001888:	fcf75ce3          	bge	a4,a5,40001860 <print32bit+0x80>
    	}
    }
    for(int j=7;j>=0;j--)
4000188c:	00700793          	li	a5,7
40001890:	fef42223          	sw	a5,-28(s0)
40001894:	02c0006f          	j	400018c0 <print32bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40001898:	fe442783          	lw	a5,-28(s0)
4000189c:	ff040713          	addi	a4,s0,-16
400018a0:	00f707b3          	add	a5,a4,a5
400018a4:	fec7c783          	lbu	a5,-20(a5)
400018a8:	00078593          	mv	a1,a5
400018ac:	f0010537          	lui	a0,0xf0010
400018b0:	c75ff0ef          	jal	ra,40001524 <uart_write>
    for(int j=7;j>=0;j--)
400018b4:	fe442783          	lw	a5,-28(s0)
400018b8:	fff78793          	addi	a5,a5,-1
400018bc:	fef42223          	sw	a5,-28(s0)
400018c0:	fe442783          	lw	a5,-28(s0)
400018c4:	fc07dae3          	bgez	a5,40001898 <print32bit+0xb8>
    }
    print(" ");
400018c8:	400027b7          	lui	a5,0x40002
400018cc:	3cc78513          	addi	a0,a5,972 # 400023cc <vga_simRes_h160_v120+0x20>
400018d0:	db1ff0ef          	jal	ra,40001680 <print>
}
400018d4:	00000013          	nop
400018d8:	03c12083          	lw	ra,60(sp)
400018dc:	03812403          	lw	s0,56(sp)
400018e0:	04010113          	addi	sp,sp,64
400018e4:	00008067          	ret

400018e8 <print64bit>:

void print64bit(char *message,uint32_t *num)
{
400018e8:	fe010113          	addi	sp,sp,-32
400018ec:	00112e23          	sw	ra,28(sp)
400018f0:	00812c23          	sw	s0,24(sp)
400018f4:	02010413          	addi	s0,sp,32
400018f8:	fea42623          	sw	a0,-20(s0)
400018fc:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40001900:	400027b7          	lui	a5,0x40002
40001904:	3e478513          	addi	a0,a5,996 # 400023e4 <vga_simRes_h160_v120+0x38>
40001908:	d79ff0ef          	jal	ra,40001680 <print>
	print(message);
4000190c:	fec42503          	lw	a0,-20(s0)
40001910:	d71ff0ef          	jal	ra,40001680 <print>
	print32bit(num[1]);
40001914:	fe842783          	lw	a5,-24(s0)
40001918:	00478793          	addi	a5,a5,4
4000191c:	0007a783          	lw	a5,0(a5)
40001920:	00078513          	mv	a0,a5
40001924:	ebdff0ef          	jal	ra,400017e0 <print32bit>
	print32bit(num[0]);
40001928:	fe842783          	lw	a5,-24(s0)
4000192c:	0007a783          	lw	a5,0(a5)
40001930:	00078513          	mv	a0,a5
40001934:	eadff0ef          	jal	ra,400017e0 <print32bit>
	print("\r\n");
40001938:	400027b7          	lui	a5,0x40002
4000193c:	3e878513          	addi	a0,a5,1000 # 400023e8 <vga_simRes_h160_v120+0x3c>
40001940:	d41ff0ef          	jal	ra,40001680 <print>
}
40001944:	00000013          	nop
40001948:	01c12083          	lw	ra,28(sp)
4000194c:	01812403          	lw	s0,24(sp)
40001950:	02010113          	addi	sp,sp,32
40001954:	00008067          	ret

40001958 <print128bit>:
void print128bit(char *message, uint32_t *num)
{
40001958:	fe010113          	addi	sp,sp,-32
4000195c:	00112e23          	sw	ra,28(sp)
40001960:	00812c23          	sw	s0,24(sp)
40001964:	02010413          	addi	s0,sp,32
40001968:	fea42623          	sw	a0,-20(s0)
4000196c:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40001970:	400027b7          	lui	a5,0x40002
40001974:	3e478513          	addi	a0,a5,996 # 400023e4 <vga_simRes_h160_v120+0x38>
40001978:	d09ff0ef          	jal	ra,40001680 <print>
	print(message);
4000197c:	fec42503          	lw	a0,-20(s0)
40001980:	d01ff0ef          	jal	ra,40001680 <print>
	print32bit(num[3]);
40001984:	fe842783          	lw	a5,-24(s0)
40001988:	00c78793          	addi	a5,a5,12
4000198c:	0007a783          	lw	a5,0(a5)
40001990:	00078513          	mv	a0,a5
40001994:	e4dff0ef          	jal	ra,400017e0 <print32bit>
	print32bit(num[2]);
40001998:	fe842783          	lw	a5,-24(s0)
4000199c:	00878793          	addi	a5,a5,8
400019a0:	0007a783          	lw	a5,0(a5)
400019a4:	00078513          	mv	a0,a5
400019a8:	e39ff0ef          	jal	ra,400017e0 <print32bit>
	print32bit(num[1]);
400019ac:	fe842783          	lw	a5,-24(s0)
400019b0:	00478793          	addi	a5,a5,4
400019b4:	0007a783          	lw	a5,0(a5)
400019b8:	00078513          	mv	a0,a5
400019bc:	e25ff0ef          	jal	ra,400017e0 <print32bit>
	print32bit(num[0]);
400019c0:	fe842783          	lw	a5,-24(s0)
400019c4:	0007a783          	lw	a5,0(a5)
400019c8:	00078513          	mv	a0,a5
400019cc:	e15ff0ef          	jal	ra,400017e0 <print32bit>
	print("\r\n");
400019d0:	400027b7          	lui	a5,0x40002
400019d4:	3e878513          	addi	a0,a5,1000 # 400023e8 <vga_simRes_h160_v120+0x3c>
400019d8:	ca9ff0ef          	jal	ra,40001680 <print>
}
400019dc:	00000013          	nop
400019e0:	01c12083          	lw	ra,28(sp)
400019e4:	01812403          	lw	s0,24(sp)
400019e8:	02010113          	addi	sp,sp,32
400019ec:	00008067          	ret

400019f0 <print80bit>:
void print80bit(char *message,uint32_t *num)
{
400019f0:	fe010113          	addi	sp,sp,-32
400019f4:	00112e23          	sw	ra,28(sp)
400019f8:	00812c23          	sw	s0,24(sp)
400019fc:	02010413          	addi	s0,sp,32
40001a00:	fea42623          	sw	a0,-20(s0)
40001a04:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40001a08:	400027b7          	lui	a5,0x40002
40001a0c:	3e478513          	addi	a0,a5,996 # 400023e4 <vga_simRes_h160_v120+0x38>
40001a10:	c71ff0ef          	jal	ra,40001680 <print>
	print(message);
40001a14:	fec42503          	lw	a0,-20(s0)
40001a18:	c69ff0ef          	jal	ra,40001680 <print>
	print32bit(num[2]);
40001a1c:	fe842783          	lw	a5,-24(s0)
40001a20:	00878793          	addi	a5,a5,8
40001a24:	0007a783          	lw	a5,0(a5)
40001a28:	00078513          	mv	a0,a5
40001a2c:	db5ff0ef          	jal	ra,400017e0 <print32bit>
	print32bit(num[1]);
40001a30:	fe842783          	lw	a5,-24(s0)
40001a34:	00478793          	addi	a5,a5,4
40001a38:	0007a783          	lw	a5,0(a5)
40001a3c:	00078513          	mv	a0,a5
40001a40:	da1ff0ef          	jal	ra,400017e0 <print32bit>
	print16bit(num[0]);
40001a44:	fe842783          	lw	a5,-24(s0)
40001a48:	0007a783          	lw	a5,0(a5)
40001a4c:	00078513          	mv	a0,a5
40001a50:	c89ff0ef          	jal	ra,400016d8 <print16bit>
	print("\r\n");
40001a54:	400027b7          	lui	a5,0x40002
40001a58:	3e878513          	addi	a0,a5,1000 # 400023e8 <vga_simRes_h160_v120+0x3c>
40001a5c:	c25ff0ef          	jal	ra,40001680 <print>
}
40001a60:	00000013          	nop
40001a64:	01c12083          	lw	ra,28(sp)
40001a68:	01812403          	lw	s0,24(sp)
40001a6c:	02010113          	addi	sp,sp,32
40001a70:	00008067          	ret

40001a74 <print256bit>:
void print256bit(char *message, uint32_t *num)
{
40001a74:	fe010113          	addi	sp,sp,-32
40001a78:	00112e23          	sw	ra,28(sp)
40001a7c:	00812c23          	sw	s0,24(sp)
40001a80:	02010413          	addi	s0,sp,32
40001a84:	fea42623          	sw	a0,-20(s0)
40001a88:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40001a8c:	400027b7          	lui	a5,0x40002
40001a90:	3e478513          	addi	a0,a5,996 # 400023e4 <vga_simRes_h160_v120+0x38>
40001a94:	bedff0ef          	jal	ra,40001680 <print>
	print(message);
40001a98:	fec42503          	lw	a0,-20(s0)
40001a9c:	be5ff0ef          	jal	ra,40001680 <print>
	print32bit(num[7]);
40001aa0:	fe842783          	lw	a5,-24(s0)
40001aa4:	01c78793          	addi	a5,a5,28
40001aa8:	0007a783          	lw	a5,0(a5)
40001aac:	00078513          	mv	a0,a5
40001ab0:	d31ff0ef          	jal	ra,400017e0 <print32bit>
	print32bit(num[6]);
40001ab4:	fe842783          	lw	a5,-24(s0)
40001ab8:	01878793          	addi	a5,a5,24
40001abc:	0007a783          	lw	a5,0(a5)
40001ac0:	00078513          	mv	a0,a5
40001ac4:	d1dff0ef          	jal	ra,400017e0 <print32bit>
	print32bit(num[5]);
40001ac8:	fe842783          	lw	a5,-24(s0)
40001acc:	01478793          	addi	a5,a5,20
40001ad0:	0007a783          	lw	a5,0(a5)
40001ad4:	00078513          	mv	a0,a5
40001ad8:	d09ff0ef          	jal	ra,400017e0 <print32bit>
	print32bit(num[4]);
40001adc:	fe842783          	lw	a5,-24(s0)
40001ae0:	01078793          	addi	a5,a5,16
40001ae4:	0007a783          	lw	a5,0(a5)
40001ae8:	00078513          	mv	a0,a5
40001aec:	cf5ff0ef          	jal	ra,400017e0 <print32bit>
	print32bit(num[3]);
40001af0:	fe842783          	lw	a5,-24(s0)
40001af4:	00c78793          	addi	a5,a5,12
40001af8:	0007a783          	lw	a5,0(a5)
40001afc:	00078513          	mv	a0,a5
40001b00:	ce1ff0ef          	jal	ra,400017e0 <print32bit>
	print32bit(num[2]);
40001b04:	fe842783          	lw	a5,-24(s0)
40001b08:	00878793          	addi	a5,a5,8
40001b0c:	0007a783          	lw	a5,0(a5)
40001b10:	00078513          	mv	a0,a5
40001b14:	ccdff0ef          	jal	ra,400017e0 <print32bit>
	print32bit(num[1]);
40001b18:	fe842783          	lw	a5,-24(s0)
40001b1c:	00478793          	addi	a5,a5,4
40001b20:	0007a783          	lw	a5,0(a5)
40001b24:	00078513          	mv	a0,a5
40001b28:	cb9ff0ef          	jal	ra,400017e0 <print32bit>
	print32bit(num[0]);
40001b2c:	fe842783          	lw	a5,-24(s0)
40001b30:	0007a783          	lw	a5,0(a5)
40001b34:	00078513          	mv	a0,a5
40001b38:	ca9ff0ef          	jal	ra,400017e0 <print32bit>
	print("\r\n");
40001b3c:	400027b7          	lui	a5,0x40002
40001b40:	3e878513          	addi	a0,a5,1000 # 400023e8 <vga_simRes_h160_v120+0x3c>
40001b44:	b3dff0ef          	jal	ra,40001680 <print>
}
40001b48:	00000013          	nop
40001b4c:	01c12083          	lw	ra,28(sp)
40001b50:	01812403          	lw	s0,24(sp)
40001b54:	02010113          	addi	sp,sp,32
40001b58:	00008067          	ret
