
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
80000068:	8a8080e7          	jalr	-1880(ra) # 4000090c <irqCallback>
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
800000b4:	c0001197          	auipc	gp,0xc0001
800000b8:	58c18193          	addi	gp,gp,1420 # 40001640 <__global_pointer$>
  .option pop
  la sp, _stack_start
800000bc:	00001117          	auipc	sp,0x1
800000c0:	88410113          	addi	sp,sp,-1916 # 80000940 <_stack_start>

800000c4 <bss_init>:

bss_init:
  la a0, _bss_start
800000c4:	c0001517          	auipc	a0,0xc0001
800000c8:	d7c50513          	addi	a0,a0,-644 # 40000e40 <data>
  la a1, _bss_end
800000cc:	80818593          	addi	a1,gp,-2040 # 40000e48 <_bss_end>

800000d0 <bss_loop>:
bss_loop:
  beq a0,a1,bss_done
800000d0:	00b50863          	beq	a0,a1,800000e0 <bss_done>
  sw zero,0(a0)
800000d4:	00052023          	sw	zero,0(a0)
  add a0,a0,4
800000d8:	00450513          	addi	a0,a0,4
  j bss_loop
800000dc:	ff5ff06f          	j	800000d0 <bss_loop>

800000e0 <bss_done>:
bss_done:

ctors_init:
  la a0, _ctors_start
800000e0:	c0001517          	auipc	a0,0xc0001
800000e4:	d6050513          	addi	a0,a0,-672 # 40000e40 <data>
  addi sp,sp,-4
800000e8:	ffc10113          	addi	sp,sp,-4

800000ec <ctors_loop>:
ctors_loop:
  la a1, _ctors_end
800000ec:	c0001597          	auipc	a1,0xc0001
800000f0:	d5458593          	addi	a1,a1,-684 # 40000e40 <data>
  beq a0,a1,ctors_done
800000f4:	00b50e63          	beq	a0,a1,80000110 <ctors_done>
  lw a3,0(a0)
800000f8:	00052683          	lw	a3,0(a0)
  add a0,a0,4
800000fc:	00450513          	addi	a0,a0,4
  sw a0,0(sp)
80000100:	00a12023          	sw	a0,0(sp)
  jalr  a3
80000104:	000680e7          	jalr	a3
  lw a0,0(sp)
80000108:	00012503          	lw	a0,0(sp)
  j ctors_loop
8000010c:	fe1ff06f          	j	800000ec <ctors_loop>

80000110 <ctors_done>:
ctors_done:
  addi sp,sp,4
80000110:	00410113          	addi	sp,sp,4


  li a0, 0x880     //880 enable timer + external interrupts
80000114:	00001537          	lui	a0,0x1
80000118:	88050513          	addi	a0,a0,-1920 # 880 <_stack_size+0x80>
  csrw mie,a0
8000011c:	30451073          	csrw	mie,a0
  li a0, 0x1808     //1808 enable interrupts
80000120:	00002537          	lui	a0,0x2
80000124:	80850513          	addi	a0,a0,-2040 # 1808 <_stack_size+0x1008>
  csrw mstatus,a0
80000128:	30051073          	csrw	mstatus,a0

  call main
8000012c:	c0000097          	auipc	ra,0xc0000
80000130:	574080e7          	jalr	1396(ra) # 400006a0 <main>

80000134 <infinitLoop>:
infinitLoop:
  j infinitLoop
80000134:	0000006f          	j	80000134 <infinitLoop>

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
		//KEY----

		prince_write(key[3],PRINCE_ADDR_KEY3);
40000314:	fe842783          	lw	a5,-24(s0)
40000318:	00c78793          	addi	a5,a5,12
4000031c:	0007a783          	lw	a5,0(a5)
40000320:	01300593          	li	a1,19
40000324:	00078513          	mv	a0,a5
40000328:	f15ff0ef          	jal	ra,4000023c <prince_write>
		prince_write(key[2],PRINCE_ADDR_KEY2);
4000032c:	fe842783          	lw	a5,-24(s0)
40000330:	00878793          	addi	a5,a5,8
40000334:	0007a783          	lw	a5,0(a5)
40000338:	01200593          	li	a1,18
4000033c:	00078513          	mv	a0,a5
40000340:	efdff0ef          	jal	ra,4000023c <prince_write>
		prince_write(key[1],PRINCE_ADDR_KEY1);
40000344:	fe842783          	lw	a5,-24(s0)
40000348:	00478793          	addi	a5,a5,4
4000034c:	0007a783          	lw	a5,0(a5)
40000350:	01100593          	li	a1,17
40000354:	00078513          	mv	a0,a5
40000358:	ee5ff0ef          	jal	ra,4000023c <prince_write>
		prince_write(key[0],PRINCE_ADDR_KEY0);
4000035c:	fe842783          	lw	a5,-24(s0)
40000360:	0007a783          	lw	a5,0(a5)
40000364:	01000593          	li	a1,16
40000368:	00078513          	mv	a0,a5
4000036c:	ed1ff0ef          	jal	ra,4000023c <prince_write>



		//EN-OR-DE---
		prince_write(mode,PRINCE_ADDR_CONFIG);
40000370:	00a00593          	li	a1,10
40000374:	fec42503          	lw	a0,-20(s0)
40000378:	ec5ff0ef          	jal	ra,4000023c <prince_write>

		//BLOCK----
		prince_write(block[1],PRINCE_ADDR_BLOCK1);
4000037c:	fe442783          	lw	a5,-28(s0)
40000380:	00478793          	addi	a5,a5,4
40000384:	0007a783          	lw	a5,0(a5)
40000388:	02100593          	li	a1,33
4000038c:	00078513          	mv	a0,a5
40000390:	eadff0ef          	jal	ra,4000023c <prince_write>
		prince_write(block[0],PRINCE_ADDR_BLOCK0);
40000394:	fe442783          	lw	a5,-28(s0)
40000398:	0007a783          	lw	a5,0(a5)
4000039c:	02000593          	li	a1,32
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
		res[1] = prince_read(PRINCE_ADDR_RESULT1);
400003c8:	fe042783          	lw	a5,-32(s0)
400003cc:	00478493          	addi	s1,a5,4
400003d0:	03100513          	li	a0,49
400003d4:	ec5ff0ef          	jal	ra,40000298 <prince_read>
400003d8:	00050793          	mv	a5,a0
400003dc:	00f4a023          	sw	a5,0(s1)
		res[0] = prince_read(PRINCE_ADDR_RESULT0);
400003e0:	03000513          	li	a0,48
400003e4:	eb5ff0ef          	jal	ra,40000298 <prince_read>
400003e8:	00050713          	mv	a4,a0
400003ec:	fe042783          	lw	a5,-32(s0)
400003f0:	00e7a023          	sw	a4,0(a5)
}
400003f4:	00000013          	nop
400003f8:	01c12083          	lw	ra,28(sp)
400003fc:	01812403          	lw	s0,24(sp)
40000400:	01412483          	lw	s1,20(sp)
40000404:	02010113          	addi	sp,sp,32
40000408:	00008067          	ret

4000040c <timer_init>:
static void timer_init(Timer_Reg *reg){
4000040c:	fe010113          	addi	sp,sp,-32
40000410:	00812e23          	sw	s0,28(sp)
40000414:	02010413          	addi	s0,sp,32
40000418:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
4000041c:	fec42783          	lw	a5,-20(s0)
40000420:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000424:	fec42783          	lw	a5,-20(s0)
40000428:	0007a423          	sw	zero,8(a5)
}
4000042c:	00000013          	nop
40000430:	01c12403          	lw	s0,28(sp)
40000434:	02010113          	addi	sp,sp,32
40000438:	00008067          	ret

4000043c <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
4000043c:	fe010113          	addi	sp,sp,-32
40000440:	00812e23          	sw	s0,28(sp)
40000444:	02010413          	addi	s0,sp,32
40000448:	fea42623          	sw	a0,-20(s0)
}
4000044c:	00000013          	nop
40000450:	01c12403          	lw	s0,28(sp)
40000454:	02010113          	addi	sp,sp,32
40000458:	00008067          	ret

4000045c <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
4000045c:	fe010113          	addi	sp,sp,-32
40000460:	00812e23          	sw	s0,28(sp)
40000464:	02010413          	addi	s0,sp,32
40000468:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
4000046c:	fec42783          	lw	a5,-20(s0)
40000470:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40000474:	fec42783          	lw	a5,-20(s0)
40000478:	fff00713          	li	a4,-1
4000047c:	00e7a023          	sw	a4,0(a5)
}
40000480:	00000013          	nop
40000484:	01c12403          	lw	s0,28(sp)
40000488:	02010113          	addi	sp,sp,32
4000048c:	00008067          	ret

40000490 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40000490:	fe010113          	addi	sp,sp,-32
40000494:	00812e23          	sw	s0,28(sp)
40000498:	02010413          	addi	s0,sp,32
4000049c:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
400004a0:	fec42783          	lw	a5,-20(s0)
400004a4:	0047a783          	lw	a5,4(a5)
400004a8:	0107d793          	srli	a5,a5,0x10
400004ac:	0ff7f793          	zext.b	a5,a5
}
400004b0:	00078513          	mv	a0,a5
400004b4:	01c12403          	lw	s0,28(sp)
400004b8:	02010113          	addi	sp,sp,32
400004bc:	00008067          	ret

400004c0 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
400004c0:	fe010113          	addi	sp,sp,-32
400004c4:	00812e23          	sw	s0,28(sp)
400004c8:	02010413          	addi	s0,sp,32
400004cc:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
400004d0:	fec42783          	lw	a5,-20(s0)
400004d4:	0047a783          	lw	a5,4(a5)
400004d8:	0187d793          	srli	a5,a5,0x18
}
400004dc:	00078513          	mv	a0,a5
400004e0:	01c12403          	lw	s0,28(sp)
400004e4:	02010113          	addi	sp,sp,32
400004e8:	00008067          	ret

400004ec <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
400004ec:	fe010113          	addi	sp,sp,-32
400004f0:	00112e23          	sw	ra,28(sp)
400004f4:	00812c23          	sw	s0,24(sp)
400004f8:	02010413          	addi	s0,sp,32
400004fc:	fea42623          	sw	a0,-20(s0)
40000500:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40000504:	00000013          	nop
40000508:	fec42503          	lw	a0,-20(s0)
4000050c:	f85ff0ef          	jal	ra,40000490 <uart_writeAvailability>
40000510:	00050793          	mv	a5,a0
40000514:	fe078ae3          	beqz	a5,40000508 <uart_write+0x1c>
	reg->DATA = data;
40000518:	fec42783          	lw	a5,-20(s0)
4000051c:	fe842703          	lw	a4,-24(s0)
40000520:	00e7a023          	sw	a4,0(a5)
}
40000524:	00000013          	nop
40000528:	01c12083          	lw	ra,28(sp)
4000052c:	01812403          	lw	s0,24(sp)
40000530:	02010113          	addi	sp,sp,32
40000534:	00008067          	ret

40000538 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40000538:	fe010113          	addi	sp,sp,-32
4000053c:	00812e23          	sw	s0,28(sp)
40000540:	02010413          	addi	s0,sp,32
40000544:	fea42623          	sw	a0,-20(s0)
40000548:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
4000054c:	fe842783          	lw	a5,-24(s0)
40000550:	00c7a703          	lw	a4,12(a5)
40000554:	fec42783          	lw	a5,-20(s0)
40000558:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
4000055c:	fe842783          	lw	a5,-24(s0)
40000560:	0007a783          	lw	a5,0(a5)
40000564:	fff78713          	addi	a4,a5,-1
40000568:	fe842783          	lw	a5,-24(s0)
4000056c:	0047a783          	lw	a5,4(a5)
40000570:	00879793          	slli	a5,a5,0x8
40000574:	00f76733          	or	a4,a4,a5
40000578:	fe842783          	lw	a5,-24(s0)
4000057c:	0087a783          	lw	a5,8(a5)
40000580:	01079793          	slli	a5,a5,0x10
40000584:	00f76733          	or	a4,a4,a5
40000588:	fec42783          	lw	a5,-20(s0)
4000058c:	00e7a623          	sw	a4,12(a5)
}
40000590:	00000013          	nop
40000594:	01c12403          	lw	s0,28(sp)
40000598:	02010113          	addi	sp,sp,32
4000059c:	00008067          	ret

400005a0 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
400005a0:	fe010113          	addi	sp,sp,-32
400005a4:	00812e23          	sw	s0,28(sp)
400005a8:	02010413          	addi	s0,sp,32
400005ac:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
400005b0:	fec42783          	lw	a5,-20(s0)
400005b4:	0007a783          	lw	a5,0(a5)
400005b8:	0027f793          	andi	a5,a5,2
400005bc:	00f037b3          	snez	a5,a5
400005c0:	0ff7f793          	zext.b	a5,a5
}
400005c4:	00078513          	mv	a0,a5
400005c8:	01c12403          	lw	s0,28(sp)
400005cc:	02010113          	addi	sp,sp,32
400005d0:	00008067          	ret

400005d4 <vga_run>:
static void vga_run(Vga_Reg *reg){
400005d4:	fe010113          	addi	sp,sp,-32
400005d8:	00812e23          	sw	s0,28(sp)
400005dc:	02010413          	addi	s0,sp,32
400005e0:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
400005e4:	fec42783          	lw	a5,-20(s0)
400005e8:	00100713          	li	a4,1
400005ec:	00e7a023          	sw	a4,0(a5)
}
400005f0:	00000013          	nop
400005f4:	01c12403          	lw	s0,28(sp)
400005f8:	02010113          	addi	sp,sp,32
400005fc:	00008067          	ret

40000600 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40000600:	fe010113          	addi	sp,sp,-32
40000604:	00112e23          	sw	ra,28(sp)
40000608:	00812c23          	sw	s0,24(sp)
4000060c:	02010413          	addi	s0,sp,32
40000610:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40000614:	fec42783          	lw	a5,-20(s0)
40000618:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
4000061c:	00000013          	nop
40000620:	fec42503          	lw	a0,-20(s0)
40000624:	f7dff0ef          	jal	ra,400005a0 <vga_isBusy>
40000628:	00050793          	mv	a5,a0
4000062c:	fe079ae3          	bnez	a5,40000620 <vga_stop+0x20>
}
40000630:	00000013          	nop
40000634:	00000013          	nop
40000638:	01c12083          	lw	ra,28(sp)
4000063c:	01812403          	lw	s0,24(sp)
40000640:	02010113          	addi	sp,sp,32
40000644:	00008067          	ret

40000648 <print>:
#include <stdint.h>
#include <stdlib.h>
#include <briey.h>
//function----

void print(char *str){
40000648:	fe010113          	addi	sp,sp,-32
4000064c:	00112e23          	sw	ra,28(sp)
40000650:	00812c23          	sw	s0,24(sp)
40000654:	02010413          	addi	s0,sp,32
40000658:	fea42623          	sw	a0,-20(s0)
	while(*str){
4000065c:	0200006f          	j	4000067c <print+0x34>
		uart_write(UART,*(str++));
40000660:	fec42783          	lw	a5,-20(s0)
40000664:	00178713          	addi	a4,a5,1
40000668:	fee42623          	sw	a4,-20(s0)
4000066c:	0007c783          	lbu	a5,0(a5)
40000670:	00078593          	mv	a1,a5
40000674:	f0010537          	lui	a0,0xf0010
40000678:	e75ff0ef          	jal	ra,400004ec <uart_write>
	while(*str){
4000067c:	fec42783          	lw	a5,-20(s0)
40000680:	0007c783          	lbu	a5,0(a5)
40000684:	fc079ee3          	bnez	a5,40000660 <print+0x18>
	}
}
40000688:	00000013          	nop
4000068c:	00000013          	nop
40000690:	01c12083          	lw	ra,28(sp)
40000694:	01812403          	lw	s0,24(sp)
40000698:	02010113          	addi	sp,sp,32
4000069c:	00008067          	ret

400006a0 <main>:

unsigned int data;
unsigned int address;
int main() {
400006a0:	fc010113          	addi	sp,sp,-64
400006a4:	02112e23          	sw	ra,60(sp)
400006a8:	02812c23          	sw	s0,56(sp)
400006ac:	04010413          	addi	s0,sp,64
	Uart_Config uartConfig;
	uartConfig.dataLength = 8;
400006b0:	00800793          	li	a5,8
400006b4:	fef42023          	sw	a5,-32(s0)
	uartConfig.parity = NONE;
400006b8:	fe042223          	sw	zero,-28(s0)
	uartConfig.stop = ONE;
400006bc:	fe042423          	sw	zero,-24(s0)
	uartConfig.clockDivider = (CORE_HZ / 8 / 115200) - 1;
400006c0:	03500793          	li	a5,53
400006c4:	fef42623          	sw	a5,-20(s0)
	uart_applyConfig(UART,&uartConfig);
400006c8:	fe040793          	addi	a5,s0,-32
400006cc:	00078593          	mv	a1,a5
400006d0:	f0010537          	lui	a0,0xf0010
400006d4:	e65ff0ef          	jal	ra,40000538 <uart_applyConfig>

	print("====================================================\r\n");
400006d8:	400017b7          	lui	a5,0x40001
400006dc:	d0078513          	addi	a0,a5,-768 # 40000d00 <vga_simRes_h160_v120+0x20>
400006e0:	f69ff0ef          	jal	ra,40000648 <print>
	print("==========Add Prince Peripheral to Briey-SoC========\r\n");
400006e4:	400017b7          	lui	a5,0x40001
400006e8:	d3878513          	addi	a0,a5,-712 # 40000d38 <vga_simRes_h160_v120+0x58>
400006ec:	f5dff0ef          	jal	ra,40000648 <print>
	print("==========K18 FETEL - EMBEDDED SYSTEM -=============\r\n");
400006f0:	400017b7          	lui	a5,0x40001
400006f4:	d7078513          	addi	a0,a5,-656 # 40000d70 <vga_simRes_h160_v120+0x90>
400006f8:	f51ff0ef          	jal	ra,40000648 <print>
	print("=============LE DUY LINH - 18200157-================\r\n");
400006fc:	400017b7          	lui	a5,0x40001
40000700:	da878513          	addi	a0,a5,-600 # 40000da8 <vga_simRes_h160_v120+0xc8>
40000704:	f45ff0ef          	jal	ra,40000648 <print>
	print("====================================================\r\n");
40000708:	400017b7          	lui	a5,0x40001
4000070c:	d0078513          	addi	a0,a5,-768 # 40000d00 <vga_simRes_h160_v120+0x20>
40000710:	f39ff0ef          	jal	ra,40000648 <print>
	//******************************************************************
	//******************************PRINCE******************************
	//******************************************************************
	uint32_t key[4] 		= {0x0, 0x0, 0x0, 0x0};
40000714:	fc042823          	sw	zero,-48(s0)
40000718:	fc042a23          	sw	zero,-44(s0)
4000071c:	fc042c23          	sw	zero,-40(s0)
40000720:	fc042e23          	sw	zero,-36(s0)
	uint32_t block[2] 		= {0x0, 0x0};
40000724:	fc042423          	sw	zero,-56(s0)
40000728:	fc042623          	sw	zero,-52(s0)
	uint32_t real_res[2] 	= {0x0,0x0};
4000072c:	fc042023          	sw	zero,-64(s0)
40000730:	fc042223          	sw	zero,-60(s0)
	//************************TEST 1 (ENCRYPT)**************************

	key[3]		= 0x00112233;
40000734:	001127b7          	lui	a5,0x112
40000738:	23378793          	addi	a5,a5,563 # 112233 <_stack_size+0x111a33>
4000073c:	fcf42e23          	sw	a5,-36(s0)
	key[2]		= 0x44556677;
40000740:	445567b7          	lui	a5,0x44556
40000744:	67778793          	addi	a5,a5,1655 # 44556677 <__global_pointer$+0x4555037>
40000748:	fcf42c23          	sw	a5,-40(s0)
	key[1]		= 0x8899aabb;
4000074c:	8899b7b7          	lui	a5,0x8899b
40000750:	abb78793          	addi	a5,a5,-1349 # 8899aabb <_stack_start+0x899a17b>
40000754:	fcf42a23          	sw	a5,-44(s0)
	key[0]		= 0xccddeeff;
40000758:	ccddf7b7          	lui	a5,0xccddf
4000075c:	eff78793          	addi	a5,a5,-257 # ccddeeff <_stack_start+0x4cdde5bf>
40000760:	fcf42823          	sw	a5,-48(s0)

	block[1] 	= 0x01234567;
40000764:	012347b7          	lui	a5,0x1234
40000768:	56778793          	addi	a5,a5,1383 # 1234567 <_stack_size+0x1233d67>
4000076c:	fcf42623          	sw	a5,-52(s0)
	block[0] 	= 0x89abcdef;
40000770:	89abd7b7          	lui	a5,0x89abd
40000774:	def78793          	addi	a5,a5,-529 # 89abcdef <_stack_start+0x9abc4af>
40000778:	fcf42423          	sw	a5,-56(s0)

	prince_cipher(PRINCE_OP_EN,key,block,real_res);
4000077c:	fc040693          	addi	a3,s0,-64
40000780:	fc840713          	addi	a4,s0,-56
40000784:	fd040793          	addi	a5,s0,-48
40000788:	00070613          	mv	a2,a4
4000078c:	00078593          	mv	a1,a5
40000790:	00100513          	li	a0,1
40000794:	b5dff0ef          	jal	ra,400002f0 <prince_cipher>
	GPIO_A_BASE->OUTPUT = real_res[1];
40000798:	f00007b7          	lui	a5,0xf0000
4000079c:	fc442703          	lw	a4,-60(s0)
400007a0:	00e7a223          	sw	a4,4(a5) # f0000004 <_stack_start+0x6ffff6c4>
	GPIO_A_BASE->OUTPUT = real_res[0];
400007a4:	f00007b7          	lui	a5,0xf0000
400007a8:	fc042703          	lw	a4,-64(s0)
400007ac:	00e7a223          	sw	a4,4(a5) # f0000004 <_stack_start+0x6ffff6c4>


	//************************TEST 2 (ENCRYPT)*************************
	key[3]		= 0x00000000;
400007b0:	fc042e23          	sw	zero,-36(s0)
	key[2]		= 0x00000000;
400007b4:	fc042c23          	sw	zero,-40(s0)
	key[1]		= 0x00000000;
400007b8:	fc042a23          	sw	zero,-44(s0)
	key[0]		= 0x00000000;
400007bc:	fc042823          	sw	zero,-48(s0)

	block[1] 	= 0x00000000;
400007c0:	fc042623          	sw	zero,-52(s0)
	block[0] 	= 0x00000000;
400007c4:	fc042423          	sw	zero,-56(s0)

	prince_cipher(PRINCE_OP_EN,key,block,real_res);
400007c8:	fc040693          	addi	a3,s0,-64
400007cc:	fc840713          	addi	a4,s0,-56
400007d0:	fd040793          	addi	a5,s0,-48
400007d4:	00070613          	mv	a2,a4
400007d8:	00078593          	mv	a1,a5
400007dc:	00100513          	li	a0,1
400007e0:	b11ff0ef          	jal	ra,400002f0 <prince_cipher>
	GPIO_A_BASE->OUTPUT = real_res[1];
400007e4:	f00007b7          	lui	a5,0xf0000
400007e8:	fc442703          	lw	a4,-60(s0)
400007ec:	00e7a223          	sw	a4,4(a5) # f0000004 <_stack_start+0x6ffff6c4>
	GPIO_A_BASE->OUTPUT = real_res[0];
400007f0:	f00007b7          	lui	a5,0xf0000
400007f4:	fc042703          	lw	a4,-64(s0)
400007f8:	00e7a223          	sw	a4,4(a5) # f0000004 <_stack_start+0x6ffff6c4>


	//************************TEST 3 (ENCRYPT)*************************

	key[3]		= 0xd8cdb780;
400007fc:	d8cdb7b7          	lui	a5,0xd8cdb
40000800:	78078793          	addi	a5,a5,1920 # d8cdb780 <_stack_start+0x58cdae40>
40000804:	fcf42e23          	sw	a5,-36(s0)
	key[2]		= 0x70b4c55a;
40000808:	70b4c7b7          	lui	a5,0x70b4c
4000080c:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b4af1a>
40000810:	fcf42c23          	sw	a5,-40(s0)
	key[1]		= 0x818665aa;
40000814:	818667b7          	lui	a5,0x81866
40000818:	5aa78793          	addi	a5,a5,1450 # 818665aa <_stack_start+0x1865c6a>
4000081c:	fcf42a23          	sw	a5,-44(s0)
	key[0]		= 0x0d02dfda;
40000820:	0d02e7b7          	lui	a5,0xd02e
40000824:	fda78793          	addi	a5,a5,-38 # d02dfda <_stack_size+0xd02d7da>
40000828:	fcf42823          	sw	a5,-48(s0)

	block[1] = 0x69c4e0d8;
4000082c:	69c4e7b7          	lui	a5,0x69c4e
40000830:	0d878793          	addi	a5,a5,216 # 69c4e0d8 <__global_pointer$+0x29c4ca98>
40000834:	fcf42623          	sw	a5,-52(s0)
	block[0] = 0x6a7b0430;
40000838:	6a7b07b7          	lui	a5,0x6a7b0
4000083c:	43078793          	addi	a5,a5,1072 # 6a7b0430 <__global_pointer$+0x2a7aedf0>
40000840:	fcf42423          	sw	a5,-56(s0)

	prince_cipher(PRINCE_OP_EN,key,block,real_res);
40000844:	fc040693          	addi	a3,s0,-64
40000848:	fc840713          	addi	a4,s0,-56
4000084c:	fd040793          	addi	a5,s0,-48
40000850:	00070613          	mv	a2,a4
40000854:	00078593          	mv	a1,a5
40000858:	00100513          	li	a0,1
4000085c:	a95ff0ef          	jal	ra,400002f0 <prince_cipher>
	GPIO_A_BASE->OUTPUT = real_res[1];
40000860:	f00007b7          	lui	a5,0xf0000
40000864:	fc442703          	lw	a4,-60(s0)
40000868:	00e7a223          	sw	a4,4(a5) # f0000004 <_stack_start+0x6ffff6c4>
	GPIO_A_BASE->OUTPUT = real_res[0];
4000086c:	f00007b7          	lui	a5,0xf0000
40000870:	fc042703          	lw	a4,-64(s0)
40000874:	00e7a223          	sw	a4,4(a5) # f0000004 <_stack_start+0x6ffff6c4>

	//************************TEST 4 (DECRYPT)*************************
	key[3]		= 0xd8cdb780;
40000878:	d8cdb7b7          	lui	a5,0xd8cdb
4000087c:	78078793          	addi	a5,a5,1920 # d8cdb780 <_stack_start+0x58cdae40>
40000880:	fcf42e23          	sw	a5,-36(s0)
	key[2]		= 0x70b4c55a;
40000884:	70b4c7b7          	lui	a5,0x70b4c
40000888:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b4af1a>
4000088c:	fcf42c23          	sw	a5,-40(s0)
	key[1]		= 0x818665aa;
40000890:	818667b7          	lui	a5,0x81866
40000894:	5aa78793          	addi	a5,a5,1450 # 818665aa <_stack_start+0x1865c6a>
40000898:	fcf42a23          	sw	a5,-44(s0)
	key[0]		= 0x0d02dfda;
4000089c:	0d02e7b7          	lui	a5,0xd02e
400008a0:	fda78793          	addi	a5,a5,-38 # d02dfda <_stack_size+0xd02d7da>
400008a4:	fcf42823          	sw	a5,-48(s0)

	block[1] 	= 0x43c6b256;
400008a8:	43c6b7b7          	lui	a5,0x43c6b
400008ac:	25678793          	addi	a5,a5,598 # 43c6b256 <__global_pointer$+0x3c69c16>
400008b0:	fcf42623          	sw	a5,-52(s0)
	block[0] 	= 0xd79de7e8;
400008b4:	d79de7b7          	lui	a5,0xd79de
400008b8:	7e878793          	addi	a5,a5,2024 # d79de7e8 <_stack_start+0x579ddea8>
400008bc:	fcf42423          	sw	a5,-56(s0)

	prince_cipher(PRINCE_OP_DE,key,block,real_res);
400008c0:	fc040693          	addi	a3,s0,-64
400008c4:	fc840713          	addi	a4,s0,-56
400008c8:	fd040793          	addi	a5,s0,-48
400008cc:	00070613          	mv	a2,a4
400008d0:	00078593          	mv	a1,a5
400008d4:	00000513          	li	a0,0
400008d8:	a19ff0ef          	jal	ra,400002f0 <prince_cipher>
	GPIO_A_BASE->OUTPUT = real_res[1];
400008dc:	f00007b7          	lui	a5,0xf0000
400008e0:	fc442703          	lw	a4,-60(s0)
400008e4:	00e7a223          	sw	a4,4(a5) # f0000004 <_stack_start+0x6ffff6c4>
	GPIO_A_BASE->OUTPUT = real_res[0];
400008e8:	f00007b7          	lui	a5,0xf0000
400008ec:	fc042703          	lw	a4,-64(s0)
400008f0:	00e7a223          	sw	a4,4(a5) # f0000004 <_stack_start+0x6ffff6c4>
	return 0;	
400008f4:	00000793          	li	a5,0
}
400008f8:	00078513          	mv	a0,a5
400008fc:	03c12083          	lw	ra,60(sp)
40000900:	03812403          	lw	s0,56(sp)
40000904:	04010113          	addi	sp,sp,64
40000908:	00008067          	ret

4000090c <irqCallback>:
void irqCallback(){
4000090c:	ff010113          	addi	sp,sp,-16
40000910:	00812623          	sw	s0,12(sp)
40000914:	01010413          	addi	s0,sp,16

}
40000918:	00000013          	nop
4000091c:	00c12403          	lw	s0,12(sp)
40000920:	01010113          	addi	sp,sp,16
40000924:	00008067          	ret

40000928 <timer_init>:
static void timer_init(Timer_Reg *reg){
40000928:	fe010113          	addi	sp,sp,-32
4000092c:	00812e23          	sw	s0,28(sp)
40000930:	02010413          	addi	s0,sp,32
40000934:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000938:	fec42783          	lw	a5,-20(s0)
4000093c:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000940:	fec42783          	lw	a5,-20(s0)
40000944:	0007a423          	sw	zero,8(a5)
}
40000948:	00000013          	nop
4000094c:	01c12403          	lw	s0,28(sp)
40000950:	02010113          	addi	sp,sp,32
40000954:	00008067          	ret

40000958 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40000958:	fe010113          	addi	sp,sp,-32
4000095c:	00812e23          	sw	s0,28(sp)
40000960:	02010413          	addi	s0,sp,32
40000964:	fea42623          	sw	a0,-20(s0)
}
40000968:	00000013          	nop
4000096c:	01c12403          	lw	s0,28(sp)
40000970:	02010113          	addi	sp,sp,32
40000974:	00008067          	ret

40000978 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40000978:	fe010113          	addi	sp,sp,-32
4000097c:	00812e23          	sw	s0,28(sp)
40000980:	02010413          	addi	s0,sp,32
40000984:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40000988:	fec42783          	lw	a5,-20(s0)
4000098c:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40000990:	fec42783          	lw	a5,-20(s0)
40000994:	fff00713          	li	a4,-1
40000998:	00e7a023          	sw	a4,0(a5)
}
4000099c:	00000013          	nop
400009a0:	01c12403          	lw	s0,28(sp)
400009a4:	02010113          	addi	sp,sp,32
400009a8:	00008067          	ret

400009ac <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
400009ac:	fe010113          	addi	sp,sp,-32
400009b0:	00812e23          	sw	s0,28(sp)
400009b4:	02010413          	addi	s0,sp,32
400009b8:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
400009bc:	fec42783          	lw	a5,-20(s0)
400009c0:	0047a783          	lw	a5,4(a5)
400009c4:	0107d793          	srli	a5,a5,0x10
400009c8:	0ff7f793          	zext.b	a5,a5
}
400009cc:	00078513          	mv	a0,a5
400009d0:	01c12403          	lw	s0,28(sp)
400009d4:	02010113          	addi	sp,sp,32
400009d8:	00008067          	ret

400009dc <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
400009dc:	fe010113          	addi	sp,sp,-32
400009e0:	00812e23          	sw	s0,28(sp)
400009e4:	02010413          	addi	s0,sp,32
400009e8:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
400009ec:	fec42783          	lw	a5,-20(s0)
400009f0:	0047a783          	lw	a5,4(a5)
400009f4:	0187d793          	srli	a5,a5,0x18
}
400009f8:	00078513          	mv	a0,a5
400009fc:	01c12403          	lw	s0,28(sp)
40000a00:	02010113          	addi	sp,sp,32
40000a04:	00008067          	ret

40000a08 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40000a08:	fe010113          	addi	sp,sp,-32
40000a0c:	00112e23          	sw	ra,28(sp)
40000a10:	00812c23          	sw	s0,24(sp)
40000a14:	02010413          	addi	s0,sp,32
40000a18:	fea42623          	sw	a0,-20(s0)
40000a1c:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40000a20:	00000013          	nop
40000a24:	fec42503          	lw	a0,-20(s0)
40000a28:	f85ff0ef          	jal	ra,400009ac <uart_writeAvailability>
40000a2c:	00050793          	mv	a5,a0
40000a30:	fe078ae3          	beqz	a5,40000a24 <uart_write+0x1c>
	reg->DATA = data;
40000a34:	fec42783          	lw	a5,-20(s0)
40000a38:	fe842703          	lw	a4,-24(s0)
40000a3c:	00e7a023          	sw	a4,0(a5)
}
40000a40:	00000013          	nop
40000a44:	01c12083          	lw	ra,28(sp)
40000a48:	01812403          	lw	s0,24(sp)
40000a4c:	02010113          	addi	sp,sp,32
40000a50:	00008067          	ret

40000a54 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40000a54:	fe010113          	addi	sp,sp,-32
40000a58:	00812e23          	sw	s0,28(sp)
40000a5c:	02010413          	addi	s0,sp,32
40000a60:	fea42623          	sw	a0,-20(s0)
40000a64:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40000a68:	fe842783          	lw	a5,-24(s0)
40000a6c:	00c7a703          	lw	a4,12(a5)
40000a70:	fec42783          	lw	a5,-20(s0)
40000a74:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40000a78:	fe842783          	lw	a5,-24(s0)
40000a7c:	0007a783          	lw	a5,0(a5)
40000a80:	fff78713          	addi	a4,a5,-1
40000a84:	fe842783          	lw	a5,-24(s0)
40000a88:	0047a783          	lw	a5,4(a5)
40000a8c:	00879793          	slli	a5,a5,0x8
40000a90:	00f76733          	or	a4,a4,a5
40000a94:	fe842783          	lw	a5,-24(s0)
40000a98:	0087a783          	lw	a5,8(a5)
40000a9c:	01079793          	slli	a5,a5,0x10
40000aa0:	00f76733          	or	a4,a4,a5
40000aa4:	fec42783          	lw	a5,-20(s0)
40000aa8:	00e7a623          	sw	a4,12(a5)
}
40000aac:	00000013          	nop
40000ab0:	01c12403          	lw	s0,28(sp)
40000ab4:	02010113          	addi	sp,sp,32
40000ab8:	00008067          	ret

40000abc <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40000abc:	fe010113          	addi	sp,sp,-32
40000ac0:	00812e23          	sw	s0,28(sp)
40000ac4:	02010413          	addi	s0,sp,32
40000ac8:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40000acc:	fec42783          	lw	a5,-20(s0)
40000ad0:	0007a783          	lw	a5,0(a5)
40000ad4:	0027f793          	andi	a5,a5,2
40000ad8:	00f037b3          	snez	a5,a5
40000adc:	0ff7f793          	zext.b	a5,a5
}
40000ae0:	00078513          	mv	a0,a5
40000ae4:	01c12403          	lw	s0,28(sp)
40000ae8:	02010113          	addi	sp,sp,32
40000aec:	00008067          	ret

40000af0 <vga_run>:
static void vga_run(Vga_Reg *reg){
40000af0:	fe010113          	addi	sp,sp,-32
40000af4:	00812e23          	sw	s0,28(sp)
40000af8:	02010413          	addi	s0,sp,32
40000afc:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40000b00:	fec42783          	lw	a5,-20(s0)
40000b04:	00100713          	li	a4,1
40000b08:	00e7a023          	sw	a4,0(a5)
}
40000b0c:	00000013          	nop
40000b10:	01c12403          	lw	s0,28(sp)
40000b14:	02010113          	addi	sp,sp,32
40000b18:	00008067          	ret

40000b1c <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40000b1c:	fe010113          	addi	sp,sp,-32
40000b20:	00112e23          	sw	ra,28(sp)
40000b24:	00812c23          	sw	s0,24(sp)
40000b28:	02010413          	addi	s0,sp,32
40000b2c:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40000b30:	fec42783          	lw	a5,-20(s0)
40000b34:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40000b38:	00000013          	nop
40000b3c:	fec42503          	lw	a0,-20(s0)
40000b40:	f7dff0ef          	jal	ra,40000abc <vga_isBusy>
40000b44:	00050793          	mv	a5,a0
40000b48:	fe079ae3          	bnez	a5,40000b3c <vga_stop+0x20>
}
40000b4c:	00000013          	nop
40000b50:	00000013          	nop
40000b54:	01c12083          	lw	ra,28(sp)
40000b58:	01812403          	lw	s0,24(sp)
40000b5c:	02010113          	addi	sp,sp,32
40000b60:	00008067          	ret

40000b64 <aes_write>:
#include "briey.h"
void aes_write(uint32_t iData, uint32_t iAddress)
{
40000b64:	fe010113          	addi	sp,sp,-32
40000b68:	00812e23          	sw	s0,28(sp)
40000b6c:	02010413          	addi	s0,sp,32
40000b70:	fea42623          	sw	a0,-20(s0)
40000b74:	feb42423          	sw	a1,-24(s0)
	AES_BASE->ADDRESS		= iAddress;
40000b78:	f00027b7          	lui	a5,0xf0002
40000b7c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000b80:	fe842703          	lw	a4,-24(s0)
40000b84:	00e7a423          	sw	a4,8(a5)
	AES_BASE->WRITE_ENABLE 	= 1;
40000b88:	f00027b7          	lui	a5,0xf0002
40000b8c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000b90:	00100713          	li	a4,1
40000b94:	00e7a223          	sw	a4,4(a5)
	AES_BASE->IDATA			= iData;
40000b98:	f00027b7          	lui	a5,0xf0002
40000b9c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000ba0:	fec42703          	lw	a4,-20(s0)
40000ba4:	00e7a623          	sw	a4,12(a5)
	AES_BASE->CHIP_SELECT	= 1;
40000ba8:	f00027b7          	lui	a5,0xf0002
40000bac:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000bb0:	00100713          	li	a4,1
40000bb4:	00e7a023          	sw	a4,0(a5)
	AES_BASE->CHIP_SELECT	= 0;
40000bb8:	f00027b7          	lui	a5,0xf0002
40000bbc:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000bc0:	0007a023          	sw	zero,0(a5)
}
40000bc4:	00000013          	nop
40000bc8:	01c12403          	lw	s0,28(sp)
40000bcc:	02010113          	addi	sp,sp,32
40000bd0:	00008067          	ret

40000bd4 <aes_read>:
uint32_t aes_read(uint32_t iAddress)
{
40000bd4:	fd010113          	addi	sp,sp,-48
40000bd8:	02812623          	sw	s0,44(sp)
40000bdc:	03010413          	addi	s0,sp,48
40000be0:	fca42e23          	sw	a0,-36(s0)
	AES_BASE->ADDRESS		= iAddress;
40000be4:	f00027b7          	lui	a5,0xf0002
40000be8:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000bec:	fdc42703          	lw	a4,-36(s0)
40000bf0:	00e7a423          	sw	a4,8(a5)
	AES_BASE->WRITE_ENABLE	= 0;
40000bf4:	f00027b7          	lui	a5,0xf0002
40000bf8:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000bfc:	0007a223          	sw	zero,4(a5)
	AES_BASE->CHIP_SELECT	= 1;
40000c00:	f00027b7          	lui	a5,0xf0002
40000c04:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000c08:	00100713          	li	a4,1
40000c0c:	00e7a023          	sw	a4,0(a5)
	uint32_t res 				= AES_BASE->ODATA;
40000c10:	f00027b7          	lui	a5,0xf0002
40000c14:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000c18:	0107a783          	lw	a5,16(a5)
40000c1c:	fef42623          	sw	a5,-20(s0)
	AES_BASE->CHIP_SELECT	= 0;
40000c20:	f00027b7          	lui	a5,0xf0002
40000c24:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000c28:	0007a023          	sw	zero,0(a5)
	return res;
40000c2c:	fec42783          	lw	a5,-20(s0)
}
40000c30:	00078513          	mv	a0,a5
40000c34:	02c12403          	lw	s0,44(sp)
40000c38:	03010113          	addi	sp,sp,48
40000c3c:	00008067          	ret
