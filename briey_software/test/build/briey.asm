
build/briey.elf:     file format elf32-littleriscv


Disassembly of section .vector:

80000000 <crtStart>:
80000000:	0b40006f          	j	800000b4 <crtInit>
80000004:	00000013          	nop
80000008:	00000013          	nop
8000000c:	00000013          	nop
80000010:	00000013          	nop
80000014:	00000013          	nop
80000018:	00000013          	nop
8000001c:	00000013          	nop

80000020 <trap_entry>:
80000020:	fe112e23          	sw	ra,-4(sp)
80000024:	fe512c23          	sw	t0,-8(sp)
80000028:	fe612a23          	sw	t1,-12(sp)
8000002c:	fe712823          	sw	t2,-16(sp)
80000030:	fea12623          	sw	a0,-20(sp)
80000034:	feb12423          	sw	a1,-24(sp)
80000038:	fec12223          	sw	a2,-28(sp)
8000003c:	fed12023          	sw	a3,-32(sp)
80000040:	fce12e23          	sw	a4,-36(sp)
80000044:	fcf12c23          	sw	a5,-40(sp)
80000048:	fd012a23          	sw	a6,-44(sp)
8000004c:	fd112823          	sw	a7,-48(sp)
80000050:	fdc12623          	sw	t3,-52(sp)
80000054:	fdd12423          	sw	t4,-56(sp)
80000058:	fde12223          	sw	t5,-60(sp)
8000005c:	fdf12023          	sw	t6,-64(sp)
80000060:	fc010113          	addi	sp,sp,-64
80000064:	c0001097          	auipc	ra,0xc0001
80000068:	1b8080e7          	jalr	440(ra) # 4000121c <irqCallback>
8000006c:	03c12083          	lw	ra,60(sp)
80000070:	03812283          	lw	t0,56(sp)
80000074:	03412303          	lw	t1,52(sp)
80000078:	03012383          	lw	t2,48(sp)
8000007c:	02c12503          	lw	a0,44(sp)
80000080:	02812583          	lw	a1,40(sp)
80000084:	02412603          	lw	a2,36(sp)
80000088:	02012683          	lw	a3,32(sp)
8000008c:	01c12703          	lw	a4,28(sp)
80000090:	01812783          	lw	a5,24(sp)
80000094:	01412803          	lw	a6,20(sp)
80000098:	01012883          	lw	a7,16(sp)
8000009c:	00c12e03          	lw	t3,12(sp)
800000a0:	00812e83          	lw	t4,8(sp)
800000a4:	00412f03          	lw	t5,4(sp)
800000a8:	00012f83          	lw	t6,0(sp)
800000ac:	04010113          	addi	sp,sp,64
800000b0:	30200073          	mret

800000b4 <crtInit>:
800000b4:	c0003197          	auipc	gp,0xc0003
800000b8:	3b418193          	addi	gp,gp,948 # 40003468 <__global_pointer$>
800000bc:	00001117          	auipc	sp,0x1
800000c0:	88410113          	addi	sp,sp,-1916 # 80000940 <_stack_start>

800000c4 <bss_init>:
800000c4:	c0003517          	auipc	a0,0xc0003
800000c8:	ba450513          	addi	a0,a0,-1116 # 40002c68 <_bss_end>
800000cc:	c0003597          	auipc	a1,0xc0003
800000d0:	b9c58593          	addi	a1,a1,-1124 # 40002c68 <_bss_end>

800000d4 <bss_loop>:
800000d4:	00b50863          	beq	a0,a1,800000e4 <bss_done>
800000d8:	00052023          	sw	zero,0(a0)
800000dc:	00450513          	addi	a0,a0,4
800000e0:	ff5ff06f          	j	800000d4 <bss_loop>

800000e4 <bss_done>:
800000e4:	c0003517          	auipc	a0,0xc0003
800000e8:	b8050513          	addi	a0,a0,-1152 # 40002c64 <_ctors_end>
800000ec:	ffc10113          	addi	sp,sp,-4

800000f0 <ctors_loop>:
800000f0:	c0003597          	auipc	a1,0xc0003
800000f4:	b7458593          	addi	a1,a1,-1164 # 40002c64 <_ctors_end>
800000f8:	00b50e63          	beq	a0,a1,80000114 <ctors_done>
800000fc:	00052683          	lw	a3,0(a0)
80000100:	00450513          	addi	a0,a0,4
80000104:	00a12023          	sw	a0,0(sp)
80000108:	000680e7          	jalr	a3
8000010c:	00012503          	lw	a0,0(sp)
80000110:	fe1ff06f          	j	800000f0 <ctors_loop>

80000114 <ctors_done>:
80000114:	00410113          	addi	sp,sp,4
80000118:	00001537          	lui	a0,0x1
8000011c:	88050513          	addi	a0,a0,-1920 # 880 <_stack_size+0x80>
80000120:	30451073          	csrw	mie,a0
80000124:	00002537          	lui	a0,0x2
80000128:	80850513          	addi	a0,a0,-2040 # 1808 <_stack_size+0x1008>
8000012c:	30051073          	csrw	mstatus,a0
80000130:	c0001097          	auipc	ra,0xc0001
80000134:	bc0080e7          	jalr	-1088(ra) # 40000cf0 <main>

80000138 <infinitLoop>:
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

4000023c <chacha_write>:
#include "briey.h"
void chacha_write(uint32_t iData, uint32_t iAddress)
{
4000023c:	fe010113          	addi	sp,sp,-32
40000240:	00812e23          	sw	s0,28(sp)
40000244:	02010413          	addi	s0,sp,32
40000248:	fea42623          	sw	a0,-20(s0)
4000024c:	feb42423          	sw	a1,-24(s0)
	CHACHA_BASE->ADDRESS		= iAddress;
40000250:	f00037b7          	lui	a5,0xf0003
40000254:	c0078793          	addi	a5,a5,-1024 # f0002c00 <_stack_start+0x700022c0>
40000258:	fe842703          	lw	a4,-24(s0)
4000025c:	00e7a423          	sw	a4,8(a5)
	CHACHA_BASE->WRITE_ENABLE 	= 1;
40000260:	f00037b7          	lui	a5,0xf0003
40000264:	c0078793          	addi	a5,a5,-1024 # f0002c00 <_stack_start+0x700022c0>
40000268:	00100713          	li	a4,1
4000026c:	00e7a223          	sw	a4,4(a5)
	CHACHA_BASE->IDATA			= iData;
40000270:	f00037b7          	lui	a5,0xf0003
40000274:	c0078793          	addi	a5,a5,-1024 # f0002c00 <_stack_start+0x700022c0>
40000278:	fec42703          	lw	a4,-20(s0)
4000027c:	00e7a623          	sw	a4,12(a5)
	CHACHA_BASE->CHIP_SELECT	= 1;
40000280:	f00037b7          	lui	a5,0xf0003
40000284:	c0078793          	addi	a5,a5,-1024 # f0002c00 <_stack_start+0x700022c0>
40000288:	00100713          	li	a4,1
4000028c:	00e7a023          	sw	a4,0(a5)
	CHACHA_BASE->CHIP_SELECT	= 0;
40000290:	f00037b7          	lui	a5,0xf0003
40000294:	c0078793          	addi	a5,a5,-1024 # f0002c00 <_stack_start+0x700022c0>
40000298:	0007a023          	sw	zero,0(a5)
}
4000029c:	00000013          	nop
400002a0:	01c12403          	lw	s0,28(sp)
400002a4:	02010113          	addi	sp,sp,32
400002a8:	00008067          	ret

400002ac <chacha_read>:
uint32_t chacha_read(uint32_t iAddress)
{
400002ac:	fd010113          	addi	sp,sp,-48
400002b0:	02812623          	sw	s0,44(sp)
400002b4:	03010413          	addi	s0,sp,48
400002b8:	fca42e23          	sw	a0,-36(s0)
	CHACHA_BASE->ADDRESS		= iAddress;
400002bc:	f00037b7          	lui	a5,0xf0003
400002c0:	c0078793          	addi	a5,a5,-1024 # f0002c00 <_stack_start+0x700022c0>
400002c4:	fdc42703          	lw	a4,-36(s0)
400002c8:	00e7a423          	sw	a4,8(a5)
	CHACHA_BASE->WRITE_ENABLE	= 0;
400002cc:	f00037b7          	lui	a5,0xf0003
400002d0:	c0078793          	addi	a5,a5,-1024 # f0002c00 <_stack_start+0x700022c0>
400002d4:	0007a223          	sw	zero,4(a5)
	CHACHA_BASE->CHIP_SELECT	= 1;
400002d8:	f00037b7          	lui	a5,0xf0003
400002dc:	c0078793          	addi	a5,a5,-1024 # f0002c00 <_stack_start+0x700022c0>
400002e0:	00100713          	li	a4,1
400002e4:	00e7a023          	sw	a4,0(a5)
	uint32_t res 				= CHACHA_BASE->ODATA;
400002e8:	f00037b7          	lui	a5,0xf0003
400002ec:	c0078793          	addi	a5,a5,-1024 # f0002c00 <_stack_start+0x700022c0>
400002f0:	0107a783          	lw	a5,16(a5)
400002f4:	fef42623          	sw	a5,-20(s0)
	CHACHA_BASE->CHIP_SELECT	= 0;
400002f8:	f00037b7          	lui	a5,0xf0003
400002fc:	c0078793          	addi	a5,a5,-1024 # f0002c00 <_stack_start+0x700022c0>
40000300:	0007a023          	sw	zero,0(a5)
	return res;
40000304:	fec42783          	lw	a5,-20(s0)
}
40000308:	00078513          	mv	a0,a5
4000030c:	02c12403          	lw	s0,44(sp)
40000310:	03010113          	addi	sp,sp,48
40000314:	00008067          	ret

40000318 <chacha_cipher>:
void chacha_cipher(unsigned char key_length, uint32_t *key, uint32_t *block, uint32_t rounds,uint32_t *res)
{
40000318:	fd010113          	addi	sp,sp,-48
4000031c:	02112623          	sw	ra,44(sp)
40000320:	02812423          	sw	s0,40(sp)
40000324:	02912223          	sw	s1,36(sp)
40000328:	03010413          	addi	s0,sp,48
4000032c:	00050793          	mv	a5,a0
40000330:	feb42423          	sw	a1,-24(s0)
40000334:	fec42223          	sw	a2,-28(s0)
40000338:	fed42023          	sw	a3,-32(s0)
4000033c:	fce42e23          	sw	a4,-36(s0)
40000340:	fef407a3          	sb	a5,-17(s0)
	chacha_write(key[7],CHACHA_ADDR_KEY_BASE);
40000344:	fe842783          	lw	a5,-24(s0)
40000348:	01c78793          	addi	a5,a5,28
4000034c:	0007a783          	lw	a5,0(a5)
40000350:	01000593          	li	a1,16
40000354:	00078513          	mv	a0,a5
40000358:	ee5ff0ef          	jal	ra,4000023c <chacha_write>
	chacha_write(key[6],CHACHA_ADDR_KEY_BASE+1);
4000035c:	fe842783          	lw	a5,-24(s0)
40000360:	01878793          	addi	a5,a5,24
40000364:	0007a783          	lw	a5,0(a5)
40000368:	01100593          	li	a1,17
4000036c:	00078513          	mv	a0,a5
40000370:	ecdff0ef          	jal	ra,4000023c <chacha_write>
	chacha_write(key[5],CHACHA_ADDR_KEY_BASE+2);
40000374:	fe842783          	lw	a5,-24(s0)
40000378:	01478793          	addi	a5,a5,20
4000037c:	0007a783          	lw	a5,0(a5)
40000380:	01200593          	li	a1,18
40000384:	00078513          	mv	a0,a5
40000388:	eb5ff0ef          	jal	ra,4000023c <chacha_write>
	chacha_write(key[4],CHACHA_ADDR_KEY_BASE+3);
4000038c:	fe842783          	lw	a5,-24(s0)
40000390:	01078793          	addi	a5,a5,16
40000394:	0007a783          	lw	a5,0(a5)
40000398:	01300593          	li	a1,19
4000039c:	00078513          	mv	a0,a5
400003a0:	e9dff0ef          	jal	ra,4000023c <chacha_write>
	chacha_write(key[3],CHACHA_ADDR_KEY_BASE+4);
400003a4:	fe842783          	lw	a5,-24(s0)
400003a8:	00c78793          	addi	a5,a5,12
400003ac:	0007a783          	lw	a5,0(a5)
400003b0:	01400593          	li	a1,20
400003b4:	00078513          	mv	a0,a5
400003b8:	e85ff0ef          	jal	ra,4000023c <chacha_write>
	chacha_write(key[2],CHACHA_ADDR_KEY_BASE+5);
400003bc:	fe842783          	lw	a5,-24(s0)
400003c0:	00878793          	addi	a5,a5,8
400003c4:	0007a783          	lw	a5,0(a5)
400003c8:	01500593          	li	a1,21
400003cc:	00078513          	mv	a0,a5
400003d0:	e6dff0ef          	jal	ra,4000023c <chacha_write>
	chacha_write(key[1],CHACHA_ADDR_KEY_BASE+6);
400003d4:	fe842783          	lw	a5,-24(s0)
400003d8:	00478793          	addi	a5,a5,4
400003dc:	0007a783          	lw	a5,0(a5)
400003e0:	01600593          	li	a1,22
400003e4:	00078513          	mv	a0,a5
400003e8:	e55ff0ef          	jal	ra,4000023c <chacha_write>
	chacha_write(key[0],CHACHA_ADDR_KEY_BASE+7);
400003ec:	fe842783          	lw	a5,-24(s0)
400003f0:	0007a783          	lw	a5,0(a5)
400003f4:	01700593          	li	a1,23
400003f8:	00078513          	mv	a0,a5
400003fc:	e41ff0ef          	jal	ra,4000023c <chacha_write>

	chacha_write(block[1],CHACHA_ADDR_BLOCK_BASE);
40000400:	fe442783          	lw	a5,-28(s0)
40000404:	00478793          	addi	a5,a5,4
40000408:	0007a783          	lw	a5,0(a5)
4000040c:	02000593          	li	a1,32
40000410:	00078513          	mv	a0,a5
40000414:	e29ff0ef          	jal	ra,4000023c <chacha_write>
	chacha_write(block[0],CHACHA_ADDR_BLOCK_BASE+1);
40000418:	fe442783          	lw	a5,-28(s0)
4000041c:	0007a783          	lw	a5,0(a5)
40000420:	02100593          	li	a1,33
40000424:	00078513          	mv	a0,a5
40000428:	e15ff0ef          	jal	ra,4000023c <chacha_write>

	chacha_write(key_length,CHACHA_ADDR_KEYLEN);
4000042c:	fef44783          	lbu	a5,-17(s0)
40000430:	00a00593          	li	a1,10
40000434:	00078513          	mv	a0,a5
40000438:	e05ff0ef          	jal	ra,4000023c <chacha_write>


	chacha_write(rounds,CHACHA_ADDR_ROUNDS);
4000043c:	00b00593          	li	a1,11
40000440:	fe042503          	lw	a0,-32(s0)
40000444:	df9ff0ef          	jal	ra,4000023c <chacha_write>

	chacha_write(0x1,CHACHA_ADDR_CTRL);
40000448:	00800593          	li	a1,8
4000044c:	00100513          	li	a0,1
40000450:	dedff0ef          	jal	ra,4000023c <chacha_write>

	while (chacha_read(CHACHA_ADDR_STATUS)==0);
40000454:	00000013          	nop
40000458:	00900513          	li	a0,9
4000045c:	e51ff0ef          	jal	ra,400002ac <chacha_read>
40000460:	00050793          	mv	a5,a0
40000464:	fe078ae3          	beqz	a5,40000458 <chacha_cipher+0x140>

	res[15] = chacha_read(CHACHA_ADDR_RESULT_BASE);
40000468:	fdc42783          	lw	a5,-36(s0)
4000046c:	03c78493          	addi	s1,a5,60
40000470:	08000513          	li	a0,128
40000474:	e39ff0ef          	jal	ra,400002ac <chacha_read>
40000478:	00050793          	mv	a5,a0
4000047c:	00f4a023          	sw	a5,0(s1)
	res[14] = chacha_read(CHACHA_ADDR_RESULT_BASE + 1);
40000480:	fdc42783          	lw	a5,-36(s0)
40000484:	03878493          	addi	s1,a5,56
40000488:	08100513          	li	a0,129
4000048c:	e21ff0ef          	jal	ra,400002ac <chacha_read>
40000490:	00050793          	mv	a5,a0
40000494:	00f4a023          	sw	a5,0(s1)
	res[13] = chacha_read(CHACHA_ADDR_RESULT_BASE + 2);
40000498:	fdc42783          	lw	a5,-36(s0)
4000049c:	03478493          	addi	s1,a5,52
400004a0:	08200513          	li	a0,130
400004a4:	e09ff0ef          	jal	ra,400002ac <chacha_read>
400004a8:	00050793          	mv	a5,a0
400004ac:	00f4a023          	sw	a5,0(s1)
	res[12] = chacha_read(CHACHA_ADDR_RESULT_BASE + 3);
400004b0:	fdc42783          	lw	a5,-36(s0)
400004b4:	03078493          	addi	s1,a5,48
400004b8:	08300513          	li	a0,131
400004bc:	df1ff0ef          	jal	ra,400002ac <chacha_read>
400004c0:	00050793          	mv	a5,a0
400004c4:	00f4a023          	sw	a5,0(s1)
	res[11] = chacha_read(CHACHA_ADDR_RESULT_BASE + 4);
400004c8:	fdc42783          	lw	a5,-36(s0)
400004cc:	02c78493          	addi	s1,a5,44
400004d0:	08400513          	li	a0,132
400004d4:	dd9ff0ef          	jal	ra,400002ac <chacha_read>
400004d8:	00050793          	mv	a5,a0
400004dc:	00f4a023          	sw	a5,0(s1)
	res[10] = chacha_read(CHACHA_ADDR_RESULT_BASE + 5);
400004e0:	fdc42783          	lw	a5,-36(s0)
400004e4:	02878493          	addi	s1,a5,40
400004e8:	08500513          	li	a0,133
400004ec:	dc1ff0ef          	jal	ra,400002ac <chacha_read>
400004f0:	00050793          	mv	a5,a0
400004f4:	00f4a023          	sw	a5,0(s1)
	res[9] = chacha_read(CHACHA_ADDR_RESULT_BASE + 6);
400004f8:	fdc42783          	lw	a5,-36(s0)
400004fc:	02478493          	addi	s1,a5,36
40000500:	08600513          	li	a0,134
40000504:	da9ff0ef          	jal	ra,400002ac <chacha_read>
40000508:	00050793          	mv	a5,a0
4000050c:	00f4a023          	sw	a5,0(s1)
	res[8] = chacha_read(CHACHA_ADDR_RESULT_BASE + 7);
40000510:	fdc42783          	lw	a5,-36(s0)
40000514:	02078493          	addi	s1,a5,32
40000518:	08700513          	li	a0,135
4000051c:	d91ff0ef          	jal	ra,400002ac <chacha_read>
40000520:	00050793          	mv	a5,a0
40000524:	00f4a023          	sw	a5,0(s1)
	res[7] = chacha_read(CHACHA_ADDR_RESULT_BASE + 8);
40000528:	fdc42783          	lw	a5,-36(s0)
4000052c:	01c78493          	addi	s1,a5,28
40000530:	08800513          	li	a0,136
40000534:	d79ff0ef          	jal	ra,400002ac <chacha_read>
40000538:	00050793          	mv	a5,a0
4000053c:	00f4a023          	sw	a5,0(s1)
	res[6] = chacha_read(CHACHA_ADDR_RESULT_BASE + 9);
40000540:	fdc42783          	lw	a5,-36(s0)
40000544:	01878493          	addi	s1,a5,24
40000548:	08900513          	li	a0,137
4000054c:	d61ff0ef          	jal	ra,400002ac <chacha_read>
40000550:	00050793          	mv	a5,a0
40000554:	00f4a023          	sw	a5,0(s1)
	res[5] = chacha_read(CHACHA_ADDR_RESULT_BASE + 10);
40000558:	fdc42783          	lw	a5,-36(s0)
4000055c:	01478493          	addi	s1,a5,20
40000560:	08a00513          	li	a0,138
40000564:	d49ff0ef          	jal	ra,400002ac <chacha_read>
40000568:	00050793          	mv	a5,a0
4000056c:	00f4a023          	sw	a5,0(s1)
	res[4] = chacha_read(CHACHA_ADDR_RESULT_BASE + 11);
40000570:	fdc42783          	lw	a5,-36(s0)
40000574:	01078493          	addi	s1,a5,16
40000578:	08b00513          	li	a0,139
4000057c:	d31ff0ef          	jal	ra,400002ac <chacha_read>
40000580:	00050793          	mv	a5,a0
40000584:	00f4a023          	sw	a5,0(s1)
	res[3] = chacha_read(CHACHA_ADDR_RESULT_BASE + 12);
40000588:	fdc42783          	lw	a5,-36(s0)
4000058c:	00c78493          	addi	s1,a5,12
40000590:	08c00513          	li	a0,140
40000594:	d19ff0ef          	jal	ra,400002ac <chacha_read>
40000598:	00050793          	mv	a5,a0
4000059c:	00f4a023          	sw	a5,0(s1)
	res[2] = chacha_read(CHACHA_ADDR_RESULT_BASE + 13);
400005a0:	fdc42783          	lw	a5,-36(s0)
400005a4:	00878493          	addi	s1,a5,8
400005a8:	08d00513          	li	a0,141
400005ac:	d01ff0ef          	jal	ra,400002ac <chacha_read>
400005b0:	00050793          	mv	a5,a0
400005b4:	00f4a023          	sw	a5,0(s1)
	res[1] = chacha_read(CHACHA_ADDR_RESULT_BASE + 14);
400005b8:	fdc42783          	lw	a5,-36(s0)
400005bc:	00478493          	addi	s1,a5,4
400005c0:	08e00513          	li	a0,142
400005c4:	ce9ff0ef          	jal	ra,400002ac <chacha_read>
400005c8:	00050793          	mv	a5,a0
400005cc:	00f4a023          	sw	a5,0(s1)
	res[0] = chacha_read(CHACHA_ADDR_RESULT_BASE + 15);
400005d0:	08f00513          	li	a0,143
400005d4:	cd9ff0ef          	jal	ra,400002ac <chacha_read>
400005d8:	00050713          	mv	a4,a0
400005dc:	fdc42783          	lw	a5,-36(s0)
400005e0:	00e7a023          	sw	a4,0(a5)

	print("\r\t===========================CHACHA20 CIPHER==================================\r\n");
400005e4:	400027b7          	lui	a5,0x40002
400005e8:	45c78513          	addi	a0,a5,1116 # 4000245c <vga_simRes_h160_v120+0x20>
400005ec:	7ac010ef          	jal	ra,40001d98 <print>
	print("\r\n");
400005f0:	400027b7          	lui	a5,0x40002
400005f4:	4b078513          	addi	a0,a5,1200 # 400024b0 <vga_simRes_h160_v120+0x74>
400005f8:	7a0010ef          	jal	ra,40001d98 <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
400005fc:	fe442583          	lw	a1,-28(s0)
40000600:	400027b7          	lui	a5,0x40002
40000604:	4b478513          	addi	a0,a5,1204 # 400024b4 <vga_simRes_h160_v120+0x78>
40000608:	1f9010ef          	jal	ra,40002000 <print64bit>
	print256bit("KEY (128/256-bit) : ", key);
4000060c:	fe842583          	lw	a1,-24(s0)
40000610:	400027b7          	lui	a5,0x40002
40000614:	4d078513          	addi	a0,a5,1232 # 400024d0 <vga_simRes_h160_v120+0x94>
40000618:	375010ef          	jal	ra,4000218c <print256bit>
	print512bit("RESULT (512-bit) : ", res);
4000061c:	fdc42583          	lw	a1,-36(s0)
40000620:	400027b7          	lui	a5,0x40002
40000624:	4e878513          	addi	a0,a5,1256 # 400024e8 <vga_simRes_h160_v120+0xac>
40000628:	44d010ef          	jal	ra,40002274 <print512bit>
	//print("\r\n============================================================================\r\n");

}
4000062c:	00000013          	nop
40000630:	02c12083          	lw	ra,44(sp)
40000634:	02812403          	lw	s0,40(sp)
40000638:	02412483          	lw	s1,36(sp)
4000063c:	03010113          	addi	sp,sp,48
40000640:	00008067          	ret

40000644 <timer_init>:
40000644:	fe010113          	addi	sp,sp,-32
40000648:	00812e23          	sw	s0,28(sp)
4000064c:	02010413          	addi	s0,sp,32
40000650:	fea42623          	sw	a0,-20(s0)
40000654:	fec42783          	lw	a5,-20(s0)
40000658:	0007a023          	sw	zero,0(a5)
4000065c:	fec42783          	lw	a5,-20(s0)
40000660:	0007a423          	sw	zero,8(a5)
40000664:	00000013          	nop
40000668:	01c12403          	lw	s0,28(sp)
4000066c:	02010113          	addi	sp,sp,32
40000670:	00008067          	ret

40000674 <prescaler_init>:
40000674:	fe010113          	addi	sp,sp,-32
40000678:	00812e23          	sw	s0,28(sp)
4000067c:	02010413          	addi	s0,sp,32
40000680:	fea42623          	sw	a0,-20(s0)
40000684:	00000013          	nop
40000688:	01c12403          	lw	s0,28(sp)
4000068c:	02010113          	addi	sp,sp,32
40000690:	00008067          	ret

40000694 <interruptCtrl_init>:
40000694:	fe010113          	addi	sp,sp,-32
40000698:	00812e23          	sw	s0,28(sp)
4000069c:	02010413          	addi	s0,sp,32
400006a0:	fea42623          	sw	a0,-20(s0)
400006a4:	fec42783          	lw	a5,-20(s0)
400006a8:	0007a223          	sw	zero,4(a5)
400006ac:	fec42783          	lw	a5,-20(s0)
400006b0:	fff00713          	li	a4,-1
400006b4:	00e7a023          	sw	a4,0(a5)
400006b8:	00000013          	nop
400006bc:	01c12403          	lw	s0,28(sp)
400006c0:	02010113          	addi	sp,sp,32
400006c4:	00008067          	ret

400006c8 <uart_writeAvailability>:
400006c8:	fe010113          	addi	sp,sp,-32
400006cc:	00812e23          	sw	s0,28(sp)
400006d0:	02010413          	addi	s0,sp,32
400006d4:	fea42623          	sw	a0,-20(s0)
400006d8:	fec42783          	lw	a5,-20(s0)
400006dc:	0047a783          	lw	a5,4(a5)
400006e0:	0107d793          	srli	a5,a5,0x10
400006e4:	0ff7f793          	zext.b	a5,a5
400006e8:	00078513          	mv	a0,a5
400006ec:	01c12403          	lw	s0,28(sp)
400006f0:	02010113          	addi	sp,sp,32
400006f4:	00008067          	ret

400006f8 <uart_readOccupancy>:
400006f8:	fe010113          	addi	sp,sp,-32
400006fc:	00812e23          	sw	s0,28(sp)
40000700:	02010413          	addi	s0,sp,32
40000704:	fea42623          	sw	a0,-20(s0)
40000708:	fec42783          	lw	a5,-20(s0)
4000070c:	0047a783          	lw	a5,4(a5)
40000710:	0187d793          	srli	a5,a5,0x18
40000714:	00078513          	mv	a0,a5
40000718:	01c12403          	lw	s0,28(sp)
4000071c:	02010113          	addi	sp,sp,32
40000720:	00008067          	ret

40000724 <uart_write>:
40000724:	fe010113          	addi	sp,sp,-32
40000728:	00112e23          	sw	ra,28(sp)
4000072c:	00812c23          	sw	s0,24(sp)
40000730:	02010413          	addi	s0,sp,32
40000734:	fea42623          	sw	a0,-20(s0)
40000738:	feb42423          	sw	a1,-24(s0)
4000073c:	00000013          	nop
40000740:	fec42503          	lw	a0,-20(s0)
40000744:	f85ff0ef          	jal	ra,400006c8 <uart_writeAvailability>
40000748:	00050793          	mv	a5,a0
4000074c:	fe078ae3          	beqz	a5,40000740 <uart_write+0x1c>
40000750:	fec42783          	lw	a5,-20(s0)
40000754:	fe842703          	lw	a4,-24(s0)
40000758:	00e7a023          	sw	a4,0(a5)
4000075c:	00000013          	nop
40000760:	01c12083          	lw	ra,28(sp)
40000764:	01812403          	lw	s0,24(sp)
40000768:	02010113          	addi	sp,sp,32
4000076c:	00008067          	ret

40000770 <uart_applyConfig>:
40000770:	fe010113          	addi	sp,sp,-32
40000774:	00812e23          	sw	s0,28(sp)
40000778:	02010413          	addi	s0,sp,32
4000077c:	fea42623          	sw	a0,-20(s0)
40000780:	feb42423          	sw	a1,-24(s0)
40000784:	fe842783          	lw	a5,-24(s0)
40000788:	00c7a703          	lw	a4,12(a5)
4000078c:	fec42783          	lw	a5,-20(s0)
40000790:	00e7a423          	sw	a4,8(a5)
40000794:	fe842783          	lw	a5,-24(s0)
40000798:	0007a783          	lw	a5,0(a5)
4000079c:	fff78713          	addi	a4,a5,-1
400007a0:	fe842783          	lw	a5,-24(s0)
400007a4:	0047a783          	lw	a5,4(a5)
400007a8:	00879793          	slli	a5,a5,0x8
400007ac:	00f76733          	or	a4,a4,a5
400007b0:	fe842783          	lw	a5,-24(s0)
400007b4:	0087a783          	lw	a5,8(a5)
400007b8:	01079793          	slli	a5,a5,0x10
400007bc:	00f76733          	or	a4,a4,a5
400007c0:	fec42783          	lw	a5,-20(s0)
400007c4:	00e7a623          	sw	a4,12(a5)
400007c8:	00000013          	nop
400007cc:	01c12403          	lw	s0,28(sp)
400007d0:	02010113          	addi	sp,sp,32
400007d4:	00008067          	ret

400007d8 <vga_isBusy>:
400007d8:	fe010113          	addi	sp,sp,-32
400007dc:	00812e23          	sw	s0,28(sp)
400007e0:	02010413          	addi	s0,sp,32
400007e4:	fea42623          	sw	a0,-20(s0)
400007e8:	fec42783          	lw	a5,-20(s0)
400007ec:	0007a783          	lw	a5,0(a5)
400007f0:	0027f793          	andi	a5,a5,2
400007f4:	00f037b3          	snez	a5,a5
400007f8:	0ff7f793          	zext.b	a5,a5
400007fc:	00078513          	mv	a0,a5
40000800:	01c12403          	lw	s0,28(sp)
40000804:	02010113          	addi	sp,sp,32
40000808:	00008067          	ret

4000080c <vga_run>:
4000080c:	fe010113          	addi	sp,sp,-32
40000810:	00812e23          	sw	s0,28(sp)
40000814:	02010413          	addi	s0,sp,32
40000818:	fea42623          	sw	a0,-20(s0)
4000081c:	fec42783          	lw	a5,-20(s0)
40000820:	00100713          	li	a4,1
40000824:	00e7a023          	sw	a4,0(a5)
40000828:	00000013          	nop
4000082c:	01c12403          	lw	s0,28(sp)
40000830:	02010113          	addi	sp,sp,32
40000834:	00008067          	ret

40000838 <vga_stop>:
40000838:	fe010113          	addi	sp,sp,-32
4000083c:	00112e23          	sw	ra,28(sp)
40000840:	00812c23          	sw	s0,24(sp)
40000844:	02010413          	addi	s0,sp,32
40000848:	fea42623          	sw	a0,-20(s0)
4000084c:	fec42783          	lw	a5,-20(s0)
40000850:	0007a023          	sw	zero,0(a5)
40000854:	00000013          	nop
40000858:	fec42503          	lw	a0,-20(s0)
4000085c:	f7dff0ef          	jal	ra,400007d8 <vga_isBusy>
40000860:	00050793          	mv	a5,a0
40000864:	fe079ae3          	bnez	a5,40000858 <vga_stop+0x20>
40000868:	00000013          	nop
4000086c:	00000013          	nop
40000870:	01c12083          	lw	ra,28(sp)
40000874:	01812403          	lw	s0,24(sp)
40000878:	02010113          	addi	sp,sp,32
4000087c:	00008067          	ret

40000880 <prince_write>:
40000880:	fe010113          	addi	sp,sp,-32
40000884:	00812e23          	sw	s0,28(sp)
40000888:	02010413          	addi	s0,sp,32
4000088c:	fea42623          	sw	a0,-20(s0)
40000890:	feb42423          	sw	a1,-24(s0)
40000894:	f00027b7          	lui	a5,0xf0002
40000898:	fe842703          	lw	a4,-24(s0)
4000089c:	00e7a423          	sw	a4,8(a5) # f0002008 <_stack_start+0x700016c8>
400008a0:	f00027b7          	lui	a5,0xf0002
400008a4:	00100713          	li	a4,1
400008a8:	00e7a223          	sw	a4,4(a5) # f0002004 <_stack_start+0x700016c4>
400008ac:	f00027b7          	lui	a5,0xf0002
400008b0:	fec42703          	lw	a4,-20(s0)
400008b4:	00e7a623          	sw	a4,12(a5) # f000200c <_stack_start+0x700016cc>
400008b8:	f00027b7          	lui	a5,0xf0002
400008bc:	00100713          	li	a4,1
400008c0:	00e7a023          	sw	a4,0(a5) # f0002000 <_stack_start+0x700016c0>
400008c4:	f00027b7          	lui	a5,0xf0002
400008c8:	0007a023          	sw	zero,0(a5) # f0002000 <_stack_start+0x700016c0>
400008cc:	00000013          	nop
400008d0:	01c12403          	lw	s0,28(sp)
400008d4:	02010113          	addi	sp,sp,32
400008d8:	00008067          	ret

400008dc <prince_read>:
400008dc:	fd010113          	addi	sp,sp,-48
400008e0:	02812623          	sw	s0,44(sp)
400008e4:	03010413          	addi	s0,sp,48
400008e8:	fca42e23          	sw	a0,-36(s0)
400008ec:	f00027b7          	lui	a5,0xf0002
400008f0:	fdc42703          	lw	a4,-36(s0)
400008f4:	00e7a423          	sw	a4,8(a5) # f0002008 <_stack_start+0x700016c8>
400008f8:	f00027b7          	lui	a5,0xf0002
400008fc:	0007a223          	sw	zero,4(a5) # f0002004 <_stack_start+0x700016c4>
40000900:	f00027b7          	lui	a5,0xf0002
40000904:	00100713          	li	a4,1
40000908:	00e7a023          	sw	a4,0(a5) # f0002000 <_stack_start+0x700016c0>
4000090c:	f00027b7          	lui	a5,0xf0002
40000910:	0107a783          	lw	a5,16(a5) # f0002010 <_stack_start+0x700016d0>
40000914:	fef42623          	sw	a5,-20(s0)
40000918:	f00027b7          	lui	a5,0xf0002
4000091c:	0007a023          	sw	zero,0(a5) # f0002000 <_stack_start+0x700016c0>
40000920:	fec42783          	lw	a5,-20(s0)
40000924:	00078513          	mv	a0,a5
40000928:	02c12403          	lw	s0,44(sp)
4000092c:	03010113          	addi	sp,sp,48
40000930:	00008067          	ret

40000934 <prince_cipher>:
40000934:	fe010113          	addi	sp,sp,-32
40000938:	00112e23          	sw	ra,28(sp)
4000093c:	00812c23          	sw	s0,24(sp)
40000940:	00912a23          	sw	s1,20(sp)
40000944:	02010413          	addi	s0,sp,32
40000948:	fea42623          	sw	a0,-20(s0)
4000094c:	feb42423          	sw	a1,-24(s0)
40000950:	fec42223          	sw	a2,-28(s0)
40000954:	fed42023          	sw	a3,-32(s0)
40000958:	00a00593          	li	a1,10
4000095c:	fec42503          	lw	a0,-20(s0)
40000960:	f21ff0ef          	jal	ra,40000880 <prince_write>
40000964:	fe442783          	lw	a5,-28(s0)
40000968:	00478793          	addi	a5,a5,4
4000096c:	0007a783          	lw	a5,0(a5)
40000970:	02100593          	li	a1,33
40000974:	00078513          	mv	a0,a5
40000978:	f09ff0ef          	jal	ra,40000880 <prince_write>
4000097c:	fe442783          	lw	a5,-28(s0)
40000980:	0007a783          	lw	a5,0(a5)
40000984:	02000593          	li	a1,32
40000988:	00078513          	mv	a0,a5
4000098c:	ef5ff0ef          	jal	ra,40000880 <prince_write>
40000990:	fe842783          	lw	a5,-24(s0)
40000994:	00c78793          	addi	a5,a5,12
40000998:	0007a783          	lw	a5,0(a5)
4000099c:	01300593          	li	a1,19
400009a0:	00078513          	mv	a0,a5
400009a4:	eddff0ef          	jal	ra,40000880 <prince_write>
400009a8:	fe842783          	lw	a5,-24(s0)
400009ac:	00878793          	addi	a5,a5,8
400009b0:	0007a783          	lw	a5,0(a5)
400009b4:	01200593          	li	a1,18
400009b8:	00078513          	mv	a0,a5
400009bc:	ec5ff0ef          	jal	ra,40000880 <prince_write>
400009c0:	fe842783          	lw	a5,-24(s0)
400009c4:	00478793          	addi	a5,a5,4
400009c8:	0007a783          	lw	a5,0(a5)
400009cc:	01100593          	li	a1,17
400009d0:	00078513          	mv	a0,a5
400009d4:	eadff0ef          	jal	ra,40000880 <prince_write>
400009d8:	fe842783          	lw	a5,-24(s0)
400009dc:	0007a783          	lw	a5,0(a5)
400009e0:	01000593          	li	a1,16
400009e4:	00078513          	mv	a0,a5
400009e8:	e99ff0ef          	jal	ra,40000880 <prince_write>
400009ec:	00800593          	li	a1,8
400009f0:	00100513          	li	a0,1
400009f4:	e8dff0ef          	jal	ra,40000880 <prince_write>
400009f8:	00000013          	nop
400009fc:	00900513          	li	a0,9
40000a00:	eddff0ef          	jal	ra,400008dc <prince_read>
40000a04:	00050793          	mv	a5,a0
40000a08:	fe078ae3          	beqz	a5,400009fc <prince_cipher+0xc8>
40000a0c:	fe042783          	lw	a5,-32(s0)
40000a10:	00478493          	addi	s1,a5,4
40000a14:	03100513          	li	a0,49
40000a18:	ec5ff0ef          	jal	ra,400008dc <prince_read>
40000a1c:	00050793          	mv	a5,a0
40000a20:	00f4a023          	sw	a5,0(s1)
40000a24:	03000513          	li	a0,48
40000a28:	eb5ff0ef          	jal	ra,400008dc <prince_read>
40000a2c:	00050713          	mv	a4,a0
40000a30:	fe042783          	lw	a5,-32(s0)
40000a34:	00e7a023          	sw	a4,0(a5)
40000a38:	fec42703          	lw	a4,-20(s0)
40000a3c:	00100793          	li	a5,1
40000a40:	00f71a63          	bne	a4,a5,40000a54 <prince_cipher+0x120>
40000a44:	400027b7          	lui	a5,0x40002
40000a48:	55c78513          	addi	a0,a5,1372 # 4000255c <vga_simRes_h160_v120+0x20>
40000a4c:	34c010ef          	jal	ra,40001d98 <print>
40000a50:	0100006f          	j	40000a60 <prince_cipher+0x12c>
40000a54:	400027b7          	lui	a5,0x40002
40000a58:	5b078513          	addi	a0,a5,1456 # 400025b0 <vga_simRes_h160_v120+0x74>
40000a5c:	33c010ef          	jal	ra,40001d98 <print>
40000a60:	400027b7          	lui	a5,0x40002
40000a64:	60478513          	addi	a0,a5,1540 # 40002604 <vga_simRes_h160_v120+0xc8>
40000a68:	330010ef          	jal	ra,40001d98 <print>
40000a6c:	fe442583          	lw	a1,-28(s0)
40000a70:	400027b7          	lui	a5,0x40002
40000a74:	60878513          	addi	a0,a5,1544 # 40002608 <vga_simRes_h160_v120+0xcc>
40000a78:	588010ef          	jal	ra,40002000 <print64bit>
40000a7c:	fe842583          	lw	a1,-24(s0)
40000a80:	400027b7          	lui	a5,0x40002
40000a84:	62078513          	addi	a0,a5,1568 # 40002620 <vga_simRes_h160_v120+0xe4>
40000a88:	5e8010ef          	jal	ra,40002070 <print128bit>
40000a8c:	fe042583          	lw	a1,-32(s0)
40000a90:	400027b7          	lui	a5,0x40002
40000a94:	63478513          	addi	a0,a5,1588 # 40002634 <vga_simRes_h160_v120+0xf8>
40000a98:	568010ef          	jal	ra,40002000 <print64bit>
40000a9c:	00000013          	nop
40000aa0:	01c12083          	lw	ra,28(sp)
40000aa4:	01812403          	lw	s0,24(sp)
40000aa8:	01412483          	lw	s1,20(sp)
40000aac:	02010113          	addi	sp,sp,32
40000ab0:	00008067          	ret

40000ab4 <timer_init>:
static void timer_init(Timer_Reg *reg){
40000ab4:	fe010113          	addi	sp,sp,-32
40000ab8:	00812e23          	sw	s0,28(sp)
40000abc:	02010413          	addi	s0,sp,32
40000ac0:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000ac4:	fec42783          	lw	a5,-20(s0)
40000ac8:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000acc:	fec42783          	lw	a5,-20(s0)
40000ad0:	0007a423          	sw	zero,8(a5)
}
40000ad4:	00000013          	nop
40000ad8:	01c12403          	lw	s0,28(sp)
40000adc:	02010113          	addi	sp,sp,32
40000ae0:	00008067          	ret

40000ae4 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40000ae4:	fe010113          	addi	sp,sp,-32
40000ae8:	00812e23          	sw	s0,28(sp)
40000aec:	02010413          	addi	s0,sp,32
40000af0:	fea42623          	sw	a0,-20(s0)
}
40000af4:	00000013          	nop
40000af8:	01c12403          	lw	s0,28(sp)
40000afc:	02010113          	addi	sp,sp,32
40000b00:	00008067          	ret

40000b04 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40000b04:	fe010113          	addi	sp,sp,-32
40000b08:	00812e23          	sw	s0,28(sp)
40000b0c:	02010413          	addi	s0,sp,32
40000b10:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40000b14:	fec42783          	lw	a5,-20(s0)
40000b18:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40000b1c:	fec42783          	lw	a5,-20(s0)
40000b20:	fff00713          	li	a4,-1
40000b24:	00e7a023          	sw	a4,0(a5)
}
40000b28:	00000013          	nop
40000b2c:	01c12403          	lw	s0,28(sp)
40000b30:	02010113          	addi	sp,sp,32
40000b34:	00008067          	ret

40000b38 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40000b38:	fe010113          	addi	sp,sp,-32
40000b3c:	00812e23          	sw	s0,28(sp)
40000b40:	02010413          	addi	s0,sp,32
40000b44:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000b48:	fec42783          	lw	a5,-20(s0)
40000b4c:	0047a783          	lw	a5,4(a5)
40000b50:	0107d793          	srli	a5,a5,0x10
40000b54:	0ff7f793          	zext.b	a5,a5
}
40000b58:	00078513          	mv	a0,a5
40000b5c:	01c12403          	lw	s0,28(sp)
40000b60:	02010113          	addi	sp,sp,32
40000b64:	00008067          	ret

40000b68 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40000b68:	fe010113          	addi	sp,sp,-32
40000b6c:	00812e23          	sw	s0,28(sp)
40000b70:	02010413          	addi	s0,sp,32
40000b74:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40000b78:	fec42783          	lw	a5,-20(s0)
40000b7c:	0047a783          	lw	a5,4(a5)
40000b80:	0187d793          	srli	a5,a5,0x18
}
40000b84:	00078513          	mv	a0,a5
40000b88:	01c12403          	lw	s0,28(sp)
40000b8c:	02010113          	addi	sp,sp,32
40000b90:	00008067          	ret

40000b94 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40000b94:	fe010113          	addi	sp,sp,-32
40000b98:	00112e23          	sw	ra,28(sp)
40000b9c:	00812c23          	sw	s0,24(sp)
40000ba0:	02010413          	addi	s0,sp,32
40000ba4:	fea42623          	sw	a0,-20(s0)
40000ba8:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40000bac:	00000013          	nop
40000bb0:	fec42503          	lw	a0,-20(s0)
40000bb4:	f85ff0ef          	jal	ra,40000b38 <uart_writeAvailability>
40000bb8:	00050793          	mv	a5,a0
40000bbc:	fe078ae3          	beqz	a5,40000bb0 <uart_write+0x1c>
	reg->DATA = data;
40000bc0:	fec42783          	lw	a5,-20(s0)
40000bc4:	fe842703          	lw	a4,-24(s0)
40000bc8:	00e7a023          	sw	a4,0(a5)
}
40000bcc:	00000013          	nop
40000bd0:	01c12083          	lw	ra,28(sp)
40000bd4:	01812403          	lw	s0,24(sp)
40000bd8:	02010113          	addi	sp,sp,32
40000bdc:	00008067          	ret

40000be0 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40000be0:	fe010113          	addi	sp,sp,-32
40000be4:	00812e23          	sw	s0,28(sp)
40000be8:	02010413          	addi	s0,sp,32
40000bec:	fea42623          	sw	a0,-20(s0)
40000bf0:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40000bf4:	fe842783          	lw	a5,-24(s0)
40000bf8:	00c7a703          	lw	a4,12(a5)
40000bfc:	fec42783          	lw	a5,-20(s0)
40000c00:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40000c04:	fe842783          	lw	a5,-24(s0)
40000c08:	0007a783          	lw	a5,0(a5)
40000c0c:	fff78713          	addi	a4,a5,-1
40000c10:	fe842783          	lw	a5,-24(s0)
40000c14:	0047a783          	lw	a5,4(a5)
40000c18:	00879793          	slli	a5,a5,0x8
40000c1c:	00f76733          	or	a4,a4,a5
40000c20:	fe842783          	lw	a5,-24(s0)
40000c24:	0087a783          	lw	a5,8(a5)
40000c28:	01079793          	slli	a5,a5,0x10
40000c2c:	00f76733          	or	a4,a4,a5
40000c30:	fec42783          	lw	a5,-20(s0)
40000c34:	00e7a623          	sw	a4,12(a5)
}
40000c38:	00000013          	nop
40000c3c:	01c12403          	lw	s0,28(sp)
40000c40:	02010113          	addi	sp,sp,32
40000c44:	00008067          	ret

40000c48 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40000c48:	fe010113          	addi	sp,sp,-32
40000c4c:	00812e23          	sw	s0,28(sp)
40000c50:	02010413          	addi	s0,sp,32
40000c54:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40000c58:	fec42783          	lw	a5,-20(s0)
40000c5c:	0007a783          	lw	a5,0(a5)
40000c60:	0027f793          	andi	a5,a5,2
40000c64:	00f037b3          	snez	a5,a5
40000c68:	0ff7f793          	zext.b	a5,a5
}
40000c6c:	00078513          	mv	a0,a5
40000c70:	01c12403          	lw	s0,28(sp)
40000c74:	02010113          	addi	sp,sp,32
40000c78:	00008067          	ret

40000c7c <vga_run>:
static void vga_run(Vga_Reg *reg){
40000c7c:	fe010113          	addi	sp,sp,-32
40000c80:	00812e23          	sw	s0,28(sp)
40000c84:	02010413          	addi	s0,sp,32
40000c88:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40000c8c:	fec42783          	lw	a5,-20(s0)
40000c90:	00100713          	li	a4,1
40000c94:	00e7a023          	sw	a4,0(a5)
}
40000c98:	00000013          	nop
40000c9c:	01c12403          	lw	s0,28(sp)
40000ca0:	02010113          	addi	sp,sp,32
40000ca4:	00008067          	ret

40000ca8 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40000ca8:	fe010113          	addi	sp,sp,-32
40000cac:	00112e23          	sw	ra,28(sp)
40000cb0:	00812c23          	sw	s0,24(sp)
40000cb4:	02010413          	addi	s0,sp,32
40000cb8:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40000cbc:	fec42783          	lw	a5,-20(s0)
40000cc0:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40000cc4:	00000013          	nop
40000cc8:	fec42503          	lw	a0,-20(s0)
40000ccc:	f7dff0ef          	jal	ra,40000c48 <vga_isBusy>
40000cd0:	00050793          	mv	a5,a0
40000cd4:	fe079ae3          	bnez	a5,40000cc8 <vga_stop+0x20>
}
40000cd8:	00000013          	nop
40000cdc:	00000013          	nop
40000ce0:	01c12083          	lw	ra,28(sp)
40000ce4:	01812403          	lw	s0,24(sp)
40000ce8:	02010113          	addi	sp,sp,32
40000cec:	00008067          	ret

40000cf0 <main>:
#include <stdint.h>
#include <stdlib.h>
#include <briey.h>


int main() {
40000cf0:	f2010113          	addi	sp,sp,-224
40000cf4:	0c112e23          	sw	ra,220(sp)
40000cf8:	0c812c23          	sw	s0,216(sp)
40000cfc:	0e010413          	addi	s0,sp,224
	Uart_Config uartConfig;
	uartConfig.dataLength = 8;
40000d00:	00800793          	li	a5,8
40000d04:	fcf42e23          	sw	a5,-36(s0)
	uartConfig.parity = NONE;
40000d08:	fe042023          	sw	zero,-32(s0)
	uartConfig.stop = ONE;
40000d0c:	fe042223          	sw	zero,-28(s0)
	uartConfig.clockDivider = (CORE_HZ / 8 / 115200) - 1;
40000d10:	03500793          	li	a5,53
40000d14:	fef42423          	sw	a5,-24(s0)
	uart_applyConfig(UART,&uartConfig);
40000d18:	fdc40793          	addi	a5,s0,-36
40000d1c:	00078593          	mv	a1,a5
40000d20:	f0010537          	lui	a0,0xf0010
40000d24:	ebdff0ef          	jal	ra,40000be0 <uart_applyConfig>
//CHACHA
	print("\r\t**********************************CHACHA TEST*******************************\r\n");
40000d28:	400027b7          	lui	a5,0x40002
40000d2c:	6a878513          	addi	a0,a5,1704 # 400026a8 <vga_simRes_h160_v120+0x20>
40000d30:	068010ef          	jal	ra,40001d98 <print>
	uint32_t chacha_key[8] 		= {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
40000d34:	fa042e23          	sw	zero,-68(s0)
40000d38:	fc042023          	sw	zero,-64(s0)
40000d3c:	fc042223          	sw	zero,-60(s0)
40000d40:	fc042423          	sw	zero,-56(s0)
40000d44:	fc042623          	sw	zero,-52(s0)
40000d48:	fc042823          	sw	zero,-48(s0)
40000d4c:	fc042a23          	sw	zero,-44(s0)
40000d50:	fc042c23          	sw	zero,-40(s0)
	uint32_t chacha_block[2] 	= {0x0, 0x0};
40000d54:	fa042a23          	sw	zero,-76(s0)
40000d58:	fa042c23          	sw	zero,-72(s0)
	uint32_t chacha_res[15] 	= {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
40000d5c:	f6042c23          	sw	zero,-136(s0)
40000d60:	f6042e23          	sw	zero,-132(s0)
40000d64:	f8042023          	sw	zero,-128(s0)
40000d68:	f8042223          	sw	zero,-124(s0)
40000d6c:	f8042423          	sw	zero,-120(s0)
40000d70:	f8042623          	sw	zero,-116(s0)
40000d74:	f8042823          	sw	zero,-112(s0)
40000d78:	f8042a23          	sw	zero,-108(s0)
40000d7c:	f8042c23          	sw	zero,-104(s0)
40000d80:	f8042e23          	sw	zero,-100(s0)
40000d84:	fa042023          	sw	zero,-96(s0)
40000d88:	fa042223          	sw	zero,-92(s0)
40000d8c:	fa042423          	sw	zero,-88(s0)
40000d90:	fa042623          	sw	zero,-84(s0)
40000d94:	fa042823          	sw	zero,-80(s0)
	uint32_t chacha_rounds = 8;
40000d98:	00800793          	li	a5,8
40000d9c:	fef42623          	sw	a5,-20(s0)
	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,chacha_rounds,chacha_res);
40000da0:	f7840713          	addi	a4,s0,-136
40000da4:	fb440613          	addi	a2,s0,-76
40000da8:	fbc40793          	addi	a5,s0,-68
40000dac:	fec42683          	lw	a3,-20(s0)
40000db0:	00078593          	mv	a1,a5
40000db4:	00000513          	li	a0,0
40000db8:	d60ff0ef          	jal	ra,40000318 <chacha_cipher>
	chacha_block[1] 	= 0x0;
40000dbc:	fa042c23          	sw	zero,-72(s0)
	chacha_block[0] 	= 0x0;
40000dc0:	fa042a23          	sw	zero,-76(s0)
	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,12,chacha_res);
40000dc4:	f7840713          	addi	a4,s0,-136
40000dc8:	fb440613          	addi	a2,s0,-76
40000dcc:	fbc40793          	addi	a5,s0,-68
40000dd0:	00c00693          	li	a3,12
40000dd4:	00078593          	mv	a1,a5
40000dd8:	00000513          	li	a0,0
40000ddc:	d3cff0ef          	jal	ra,40000318 <chacha_cipher>
	chacha_block[1] 	= 0x0;
40000de0:	fa042c23          	sw	zero,-72(s0)
	chacha_block[0] 	= 0x0;
40000de4:	fa042a23          	sw	zero,-76(s0)
	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,20,chacha_res);
40000de8:	f7840713          	addi	a4,s0,-136
40000dec:	fb440613          	addi	a2,s0,-76
40000df0:	fbc40793          	addi	a5,s0,-68
40000df4:	01400693          	li	a3,20
40000df8:	00078593          	mv	a1,a5
40000dfc:	00000513          	li	a0,0
40000e00:	d18ff0ef          	jal	ra,40000318 <chacha_cipher>
	chacha_block[1] 	= 0x0;
40000e04:	fa042c23          	sw	zero,-72(s0)
	chacha_block[0] 	= 0x0;
40000e08:	fa042a23          	sw	zero,-76(s0)
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,8,chacha_res);
40000e0c:	f7840713          	addi	a4,s0,-136
40000e10:	fb440613          	addi	a2,s0,-76
40000e14:	fbc40793          	addi	a5,s0,-68
40000e18:	00800693          	li	a3,8
40000e1c:	00078593          	mv	a1,a5
40000e20:	00100513          	li	a0,1
40000e24:	cf4ff0ef          	jal	ra,40000318 <chacha_cipher>
	chacha_block[1] 	= 0x0;
40000e28:	fa042c23          	sw	zero,-72(s0)
	chacha_block[0] 	= 0x0;
40000e2c:	fa042a23          	sw	zero,-76(s0)
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,12,chacha_res);
40000e30:	f7840713          	addi	a4,s0,-136
40000e34:	fb440613          	addi	a2,s0,-76
40000e38:	fbc40793          	addi	a5,s0,-68
40000e3c:	00c00693          	li	a3,12
40000e40:	00078593          	mv	a1,a5
40000e44:	00100513          	li	a0,1
40000e48:	cd0ff0ef          	jal	ra,40000318 <chacha_cipher>
	chacha_block[1] 	= 0x0;
40000e4c:	fa042c23          	sw	zero,-72(s0)
	chacha_block[0] 	= 0x0;
40000e50:	fa042a23          	sw	zero,-76(s0)
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,20,chacha_res);
40000e54:	f7840713          	addi	a4,s0,-136
40000e58:	fb440613          	addi	a2,s0,-76
40000e5c:	fbc40793          	addi	a5,s0,-68
40000e60:	01400693          	li	a3,20
40000e64:	00078593          	mv	a1,a5
40000e68:	00100513          	li	a0,1
40000e6c:	cacff0ef          	jal	ra,40000318 <chacha_cipher>
	//test 2
	chacha_block[1]=0x0f1e2d3c;
40000e70:	0f1e37b7          	lui	a5,0xf1e3
40000e74:	d3c78793          	addi	a5,a5,-708 # f1e2d3c <_stack_size+0xf1e253c>
40000e78:	faf42c23          	sw	a5,-72(s0)
	chacha_block[0]=0x4b596877;
40000e7c:	4b5977b7          	lui	a5,0x4b597
40000e80:	87778793          	addi	a5,a5,-1929 # 4b596877 <__global_pointer$+0xb59340f>
40000e84:	faf42a23          	sw	a5,-76(s0)

			chacha_key[7]=0x00112233;
40000e88:	001127b7          	lui	a5,0x112
40000e8c:	23378793          	addi	a5,a5,563 # 112233 <_stack_size+0x111a33>
40000e90:	fcf42c23          	sw	a5,-40(s0)
			chacha_key[6]=0x44556677;
40000e94:	445567b7          	lui	a5,0x44556
40000e98:	67778793          	addi	a5,a5,1655 # 44556677 <__global_pointer$+0x455320f>
40000e9c:	fcf42a23          	sw	a5,-44(s0)
			chacha_key[5]=0x8899aabb;
40000ea0:	8899b7b7          	lui	a5,0x8899b
40000ea4:	abb78793          	addi	a5,a5,-1349 # 8899aabb <_stack_start+0x899a17b>
40000ea8:	fcf42823          	sw	a5,-48(s0)
			chacha_key[4]=0xccddeeff;
40000eac:	ccddf7b7          	lui	a5,0xccddf
40000eb0:	eff78793          	addi	a5,a5,-257 # ccddeeff <_stack_start+0x4cdde5bf>
40000eb4:	fcf42623          	sw	a5,-52(s0)
			chacha_key[3]=0xffeeddcc;
40000eb8:	ffeee7b7          	lui	a5,0xffeee
40000ebc:	dcc78793          	addi	a5,a5,-564 # ffeeddcc <_stack_start+0x7feed48c>
40000ec0:	fcf42423          	sw	a5,-56(s0)
			chacha_key[2]=0xbbaa9988;
40000ec4:	bbaaa7b7          	lui	a5,0xbbaaa
40000ec8:	98878793          	addi	a5,a5,-1656 # bbaa9988 <_stack_start+0x3baa9048>
40000ecc:	fcf42223          	sw	a5,-60(s0)
			chacha_key[1]=0x77665544;
40000ed0:	776657b7          	lui	a5,0x77665
40000ed4:	54478793          	addi	a5,a5,1348 # 77665544 <__global_pointer$+0x376620dc>
40000ed8:	fcf42023          	sw	a5,-64(s0)
			chacha_key[0]= 0x33221100;
40000edc:	332217b7          	lui	a5,0x33221
40000ee0:	10078793          	addi	a5,a5,256 # 33221100 <_stack_size+0x33220900>
40000ee4:	faf42e23          	sw	a5,-68(s0)
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,chacha_rounds,chacha_res);
40000ee8:	f7840713          	addi	a4,s0,-136
40000eec:	fb440613          	addi	a2,s0,-76
40000ef0:	fbc40793          	addi	a5,s0,-68
40000ef4:	fec42683          	lw	a3,-20(s0)
40000ef8:	00078593          	mv	a1,a5
40000efc:	00100513          	li	a0,1
40000f00:	c18ff0ef          	jal	ra,40000318 <chacha_cipher>
//PRINCE
	print("\r\t**********************************PRINCE TEST*******************************\r\n");
40000f04:	400027b7          	lui	a5,0x40002
40000f08:	6fc78513          	addi	a0,a5,1788 # 400026fc <vga_simRes_h160_v120+0x74>
40000f0c:	68d000ef          	jal	ra,40001d98 <print>
	uint32_t prince_key[4] 		= {0x0, 0x0, 0x0, 0x0};
40000f10:	f6042423          	sw	zero,-152(s0)
40000f14:	f6042623          	sw	zero,-148(s0)
40000f18:	f6042823          	sw	zero,-144(s0)
40000f1c:	f6042a23          	sw	zero,-140(s0)
	uint32_t prince_block[2] 		= {0x0, 0x0};
40000f20:	f6042023          	sw	zero,-160(s0)
40000f24:	f6042223          	sw	zero,-156(s0)
	uint32_t prince_res[2] 	= {0x0,0x0};
40000f28:	f4042c23          	sw	zero,-168(s0)
40000f2c:	f4042e23          	sw	zero,-164(s0)
	print("\r\n\t===================================TEST 1===================================\r\n");
40000f30:	400027b7          	lui	a5,0x40002
40000f34:	75078513          	addi	a0,a5,1872 # 40002750 <vga_simRes_h160_v120+0xc8>
40000f38:	661000ef          	jal	ra,40001d98 <print>

	prince_block[1] 	= 0x69c4e0d8;
40000f3c:	69c4e7b7          	lui	a5,0x69c4e
40000f40:	0d878793          	addi	a5,a5,216 # 69c4e0d8 <__global_pointer$+0x29c4ac70>
40000f44:	f6f42223          	sw	a5,-156(s0)
	prince_block[0] 	= 0x6a7b0430;
40000f48:	6a7b07b7          	lui	a5,0x6a7b0
40000f4c:	43078793          	addi	a5,a5,1072 # 6a7b0430 <__global_pointer$+0x2a7acfc8>
40000f50:	f6f42023          	sw	a5,-160(s0)

	prince_key[3]		= 0xd8cdb780;
40000f54:	d8cdb7b7          	lui	a5,0xd8cdb
40000f58:	78078793          	addi	a5,a5,1920 # d8cdb780 <_stack_start+0x58cdae40>
40000f5c:	f6f42a23          	sw	a5,-140(s0)
	prince_key[2]		= 0x70b4c55a;
40000f60:	70b4c7b7          	lui	a5,0x70b4c
40000f64:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b490f2>
40000f68:	f6f42823          	sw	a5,-144(s0)
	prince_key[1]		= 0x818665aa;
40000f6c:	818667b7          	lui	a5,0x81866
40000f70:	5aa78793          	addi	a5,a5,1450 # 818665aa <_stack_start+0x1865c6a>
40000f74:	f6f42623          	sw	a5,-148(s0)
	prince_key[0]		= 0x0d02dfda;
40000f78:	0d02e7b7          	lui	a5,0xd02e
40000f7c:	fda78793          	addi	a5,a5,-38 # d02dfda <_stack_size+0xd02d7da>
40000f80:	f6f42423          	sw	a5,-152(s0)

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
40000f84:	f5840693          	addi	a3,s0,-168
40000f88:	f6040713          	addi	a4,s0,-160
40000f8c:	f6840793          	addi	a5,s0,-152
40000f90:	00070613          	mv	a2,a4
40000f94:	00078593          	mv	a1,a5
40000f98:	00100513          	li	a0,1
40000f9c:	999ff0ef          	jal	ra,40000934 <prince_cipher>

	print("\r\n\t===================================TEST 2===================================\r\n");
40000fa0:	400027b7          	lui	a5,0x40002
40000fa4:	7a478513          	addi	a0,a5,1956 # 400027a4 <vga_simRes_h160_v120+0x11c>
40000fa8:	5f1000ef          	jal	ra,40001d98 <print>

	prince_block[1] 	= 0x43c6b256;
40000fac:	43c6b7b7          	lui	a5,0x43c6b
40000fb0:	25678793          	addi	a5,a5,598 # 43c6b256 <__global_pointer$+0x3c67dee>
40000fb4:	f6f42223          	sw	a5,-156(s0)
	prince_block[0] 	= 0xd79de7e8;
40000fb8:	d79de7b7          	lui	a5,0xd79de
40000fbc:	7e878793          	addi	a5,a5,2024 # d79de7e8 <_stack_start+0x579ddea8>
40000fc0:	f6f42023          	sw	a5,-160(s0)

	//USE THE SAME KEY

	prince_cipher(PRINCE_OP_DE,prince_key,prince_block,prince_res);
40000fc4:	f5840693          	addi	a3,s0,-168
40000fc8:	f6040713          	addi	a4,s0,-160
40000fcc:	f6840793          	addi	a5,s0,-152
40000fd0:	00070613          	mv	a2,a4
40000fd4:	00078593          	mv	a1,a5
40000fd8:	00000513          	li	a0,0
40000fdc:	959ff0ef          	jal	ra,40000934 <prince_cipher>
//PRESENT
	print("\r\n");
40000fe0:	400027b7          	lui	a5,0x40002
40000fe4:	7f878513          	addi	a0,a5,2040 # 400027f8 <vga_simRes_h160_v120+0x170>
40000fe8:	5b1000ef          	jal	ra,40001d98 <print>
	print("\r\t******************************PRESENT TEST**********************************\r\n");
40000fec:	400027b7          	lui	a5,0x40002
40000ff0:	7fc78513          	addi	a0,a5,2044 # 400027fc <vga_simRes_h160_v120+0x174>
40000ff4:	5a5000ef          	jal	ra,40001d98 <print>
	unsigned int present_key[3] = {0x0, 0x0, 0x0};
40000ff8:	f4042623          	sw	zero,-180(s0)
40000ffc:	f4042823          	sw	zero,-176(s0)
40001000:	f4042a23          	sw	zero,-172(s0)
	unsigned int present_block[2] 	= {0x0, 0x0};
40001004:	f4042223          	sw	zero,-188(s0)
40001008:	f4042423          	sw	zero,-184(s0)
	unsigned int present_res[2] 	= {0x0, 0x0};
4000100c:	f2042e23          	sw	zero,-196(s0)
40001010:	f4042023          	sw	zero,-192(s0)

	print("\r\n\t==================================TEST 1====================================\r\n");
40001014:	400037b7          	lui	a5,0x40003
40001018:	85078513          	addi	a0,a5,-1968 # 40002850 <vga_simRes_h160_v120+0x1c8>
4000101c:	57d000ef          	jal	ra,40001d98 <print>

	present_block[1]=0x4c746e67;
40001020:	4c7477b7          	lui	a5,0x4c747
40001024:	e6778793          	addi	a5,a5,-409 # 4c746e67 <__global_pointer$+0xc7439ff>
40001028:	f4f42423          	sw	a5,-184(s0)
	present_block[0]=0x7579656e;
4000102c:	757967b7          	lui	a5,0x75796
40001030:	56e78793          	addi	a5,a5,1390 # 7579656e <__global_pointer$+0x35793106>
40001034:	f4f42223          	sw	a5,-188(s0)

	present_key[2] = 0x46657465;
40001038:	466577b7          	lui	a5,0x46657
4000103c:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6653ffd>
40001040:	f4f42a23          	sw	a5,-172(s0)
	present_key[1] = 0x6c48636d;
40001044:	6c4867b7          	lui	a5,0x6c486
40001048:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c482f05>
4000104c:	f4f42823          	sw	a5,-176(s0)
	present_key[0] = 0x7573;
40001050:	000077b7          	lui	a5,0x7
40001054:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
40001058:	f4f42623          	sw	a5,-180(s0)

	present_cipher(PRESENT_OP_EN,present_key,present_block,present_res);
4000105c:	f3c40693          	addi	a3,s0,-196
40001060:	f4440713          	addi	a4,s0,-188
40001064:	f4c40793          	addi	a5,s0,-180
40001068:	00070613          	mv	a2,a4
4000106c:	00078593          	mv	a1,a5
40001070:	00000513          	li	a0,0
40001074:	4f8000ef          	jal	ra,4000156c <present_cipher>

	print("\r\n\t==================================TEST 2====================================\r\n");
40001078:	400037b7          	lui	a5,0x40003
4000107c:	8a478513          	addi	a0,a5,-1884 # 400028a4 <vga_simRes_h160_v120+0x21c>
40001080:	519000ef          	jal	ra,40001d98 <print>

	present_block[1]=0x0e1d00d4;
40001084:	0e1d07b7          	lui	a5,0xe1d0
40001088:	0d478793          	addi	a5,a5,212 # e1d00d4 <_stack_size+0xe1cf8d4>
4000108c:	f4f42423          	sw	a5,-184(s0)
	present_block[0]=0xe46ba99c;
40001090:	e46bb7b7          	lui	a5,0xe46bb
40001094:	99c78793          	addi	a5,a5,-1636 # e46ba99c <_stack_start+0x646ba05c>
40001098:	f4f42223          	sw	a5,-188(s0)

	//USE THE SAME KEY

	present_cipher(PRESENT_OP_DE,present_key,present_block,present_res);
4000109c:	f3c40693          	addi	a3,s0,-196
400010a0:	f4440713          	addi	a4,s0,-188
400010a4:	f4c40793          	addi	a5,s0,-180
400010a8:	00070613          	mv	a2,a4
400010ac:	00078593          	mv	a1,a5
400010b0:	00100513          	li	a0,1
400010b4:	4b8000ef          	jal	ra,4000156c <present_cipher>
	//DM_PRESENT
	print("\r\n");
400010b8:	400027b7          	lui	a5,0x40002
400010bc:	7f878513          	addi	a0,a5,2040 # 400027f8 <vga_simRes_h160_v120+0x170>
400010c0:	4d9000ef          	jal	ra,40001d98 <print>
	print("\r\t***************************DM_PRESENT TEST**********************************\r\n");
400010c4:	400037b7          	lui	a5,0x40003
400010c8:	8f878513          	addi	a0,a5,-1800 # 400028f8 <vga_simRes_h160_v120+0x270>
400010cc:	4cd000ef          	jal	ra,40001d98 <print>
	unsigned int dm_present_key[3] 		= {0x0, 0x0, 0x0};
400010d0:	f2042823          	sw	zero,-208(s0)
400010d4:	f2042a23          	sw	zero,-204(s0)
400010d8:	f2042c23          	sw	zero,-200(s0)
	unsigned int dm_present_block[2] 	= {0x0, 0x0};
400010dc:	f2042423          	sw	zero,-216(s0)
400010e0:	f2042623          	sw	zero,-212(s0)
	unsigned int dm_present_res[2] 		= {0x0, 0x0};
400010e4:	f2042023          	sw	zero,-224(s0)
400010e8:	f2042223          	sw	zero,-220(s0)

	print("\r\n\t==================================TEST 1====================================\r\n");
400010ec:	400037b7          	lui	a5,0x40003
400010f0:	85078513          	addi	a0,a5,-1968 # 40002850 <vga_simRes_h160_v120+0x1c8>
400010f4:	4a5000ef          	jal	ra,40001d98 <print>

	dm_present_block[1]=0x4c746e67;
400010f8:	4c7477b7          	lui	a5,0x4c747
400010fc:	e6778793          	addi	a5,a5,-409 # 4c746e67 <__global_pointer$+0xc7439ff>
40001100:	f2f42623          	sw	a5,-212(s0)
	dm_present_block[0]=0x7579656e;
40001104:	757967b7          	lui	a5,0x75796
40001108:	56e78793          	addi	a5,a5,1390 # 7579656e <__global_pointer$+0x35793106>
4000110c:	f2f42423          	sw	a5,-216(s0)

	dm_present_key[2] = 0x46657465;
40001110:	466577b7          	lui	a5,0x46657
40001114:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6653ffd>
40001118:	f2f42c23          	sw	a5,-200(s0)
	dm_present_key[1] = 0x6c48636d;
4000111c:	6c4867b7          	lui	a5,0x6c486
40001120:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c482f05>
40001124:	f2f42a23          	sw	a5,-204(s0)
	dm_present_key[0] = 0x7573;
40001128:	000077b7          	lui	a5,0x7
4000112c:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
40001130:	f2f42823          	sw	a5,-208(s0)

	//expec: 42696eb3 9112ccf2

	dm_present_hash(dm_present_key,dm_present_block,dm_present_res);
40001134:	f2040693          	addi	a3,s0,-224
40001138:	f2840713          	addi	a4,s0,-216
4000113c:	f3040793          	addi	a5,s0,-208
40001140:	00068613          	mv	a2,a3
40001144:	00070593          	mv	a1,a4
40001148:	00078513          	mv	a0,a5
4000114c:	0d5000ef          	jal	ra,40001a20 <dm_present_hash>

	print("\r\n\t==================================TEST 2====================================\r\n");
40001150:	400037b7          	lui	a5,0x40003
40001154:	8a478513          	addi	a0,a5,-1884 # 400028a4 <vga_simRes_h160_v120+0x21c>
40001158:	441000ef          	jal	ra,40001d98 <print>

	dm_present_block[1]=0x46657465;
4000115c:	466577b7          	lui	a5,0x46657
40001160:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6653ffd>
40001164:	f2f42623          	sw	a5,-212(s0)
	dm_present_block[0]=0x6c5f5553;
40001168:	6c5f57b7          	lui	a5,0x6c5f5
4000116c:	55378793          	addi	a5,a5,1363 # 6c5f5553 <__global_pointer$+0x2c5f20eb>
40001170:	f2f42423          	sw	a5,-216(s0)

	dm_present_key[2] = 0x00000000;
40001174:	f2042c23          	sw	zero,-200(s0)
	dm_present_key[1] = 0x00000000;
40001178:	f2042a23          	sw	zero,-204(s0)
	dm_present_key[0] = 0x0001;
4000117c:	00100793          	li	a5,1
40001180:	f2f42823          	sw	a5,-208(s0)
	//expec:d52384e3 dcee9ce7

	dm_present_hash(dm_present_key,dm_present_block,dm_present_res);
40001184:	f2040693          	addi	a3,s0,-224
40001188:	f2840713          	addi	a4,s0,-216
4000118c:	f3040793          	addi	a5,s0,-208
40001190:	00068613          	mv	a2,a3
40001194:	00070593          	mv	a1,a4
40001198:	00078513          	mv	a0,a5
4000119c:	085000ef          	jal	ra,40001a20 <dm_present_hash>
	print("\r\n\t==================================TEST 3====================================\r\n");
400011a0:	400037b7          	lui	a5,0x40003
400011a4:	94c78513          	addi	a0,a5,-1716 # 4000294c <vga_simRes_h160_v120+0x2c4>
400011a8:	3f1000ef          	jal	ra,40001d98 <print>

	dm_present_block[1]=0x31383230;
400011ac:	313837b7          	lui	a5,0x31383
400011b0:	23078793          	addi	a5,a5,560 # 31383230 <_stack_size+0x31382a30>
400011b4:	f2f42623          	sw	a5,-212(s0)
	dm_present_block[0]=0x30313833;
400011b8:	303147b7          	lui	a5,0x30314
400011bc:	83378793          	addi	a5,a5,-1997 # 30313833 <_stack_size+0x30313033>
400011c0:	f2f42423          	sw	a5,-216(s0)

	dm_present_key[2] = 0x31383230;
400011c4:	313837b7          	lui	a5,0x31383
400011c8:	23078793          	addi	a5,a5,560 # 31383230 <_stack_size+0x31382a30>
400011cc:	f2f42c23          	sw	a5,-200(s0)
	dm_present_key[1] = 0x30313833;
400011d0:	303147b7          	lui	a5,0x30314
400011d4:	83378793          	addi	a5,a5,-1997 # 30313833 <_stack_size+0x30313033>
400011d8:	f2f42a23          	sw	a5,-204(s0)
	dm_present_key[0] = 0x5553;
400011dc:	000057b7          	lui	a5,0x5
400011e0:	55378793          	addi	a5,a5,1363 # 5553 <_stack_size+0x4d53>
400011e4:	f2f42823          	sw	a5,-208(s0)
	//expec: 08e11c56 b6d5a592
	dm_present_hash(dm_present_key,dm_present_block,dm_present_res);
400011e8:	f2040693          	addi	a3,s0,-224
400011ec:	f2840713          	addi	a4,s0,-216
400011f0:	f3040793          	addi	a5,s0,-208
400011f4:	00068613          	mv	a2,a3
400011f8:	00070593          	mv	a1,a4
400011fc:	00078513          	mv	a0,a5
40001200:	021000ef          	jal	ra,40001a20 <dm_present_hash>

	return 0;	
40001204:	00000793          	li	a5,0
}
40001208:	00078513          	mv	a0,a5
4000120c:	0dc12083          	lw	ra,220(sp)
40001210:	0d812403          	lw	s0,216(sp)
40001214:	0e010113          	addi	sp,sp,224
40001218:	00008067          	ret

4000121c <irqCallback>:
void irqCallback(){
4000121c:	ff010113          	addi	sp,sp,-16
40001220:	00812623          	sw	s0,12(sp)
40001224:	01010413          	addi	s0,sp,16

}
40001228:	00000013          	nop
4000122c:	00c12403          	lw	s0,12(sp)
40001230:	01010113          	addi	sp,sp,16
40001234:	00008067          	ret

40001238 <timer_init>:
static void timer_init(Timer_Reg *reg){
40001238:	fe010113          	addi	sp,sp,-32
4000123c:	00812e23          	sw	s0,28(sp)
40001240:	02010413          	addi	s0,sp,32
40001244:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40001248:	fec42783          	lw	a5,-20(s0)
4000124c:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40001250:	fec42783          	lw	a5,-20(s0)
40001254:	0007a423          	sw	zero,8(a5)
}
40001258:	00000013          	nop
4000125c:	01c12403          	lw	s0,28(sp)
40001260:	02010113          	addi	sp,sp,32
40001264:	00008067          	ret

40001268 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001268:	fe010113          	addi	sp,sp,-32
4000126c:	00812e23          	sw	s0,28(sp)
40001270:	02010413          	addi	s0,sp,32
40001274:	fea42623          	sw	a0,-20(s0)
}
40001278:	00000013          	nop
4000127c:	01c12403          	lw	s0,28(sp)
40001280:	02010113          	addi	sp,sp,32
40001284:	00008067          	ret

40001288 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001288:	fe010113          	addi	sp,sp,-32
4000128c:	00812e23          	sw	s0,28(sp)
40001290:	02010413          	addi	s0,sp,32
40001294:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001298:	fec42783          	lw	a5,-20(s0)
4000129c:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
400012a0:	fec42783          	lw	a5,-20(s0)
400012a4:	fff00713          	li	a4,-1
400012a8:	00e7a023          	sw	a4,0(a5)
}
400012ac:	00000013          	nop
400012b0:	01c12403          	lw	s0,28(sp)
400012b4:	02010113          	addi	sp,sp,32
400012b8:	00008067          	ret

400012bc <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
400012bc:	fe010113          	addi	sp,sp,-32
400012c0:	00812e23          	sw	s0,28(sp)
400012c4:	02010413          	addi	s0,sp,32
400012c8:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
400012cc:	fec42783          	lw	a5,-20(s0)
400012d0:	0047a783          	lw	a5,4(a5)
400012d4:	0107d793          	srli	a5,a5,0x10
400012d8:	0ff7f793          	zext.b	a5,a5
}
400012dc:	00078513          	mv	a0,a5
400012e0:	01c12403          	lw	s0,28(sp)
400012e4:	02010113          	addi	sp,sp,32
400012e8:	00008067          	ret

400012ec <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
400012ec:	fe010113          	addi	sp,sp,-32
400012f0:	00812e23          	sw	s0,28(sp)
400012f4:	02010413          	addi	s0,sp,32
400012f8:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
400012fc:	fec42783          	lw	a5,-20(s0)
40001300:	0047a783          	lw	a5,4(a5)
40001304:	0187d793          	srli	a5,a5,0x18
}
40001308:	00078513          	mv	a0,a5
4000130c:	01c12403          	lw	s0,28(sp)
40001310:	02010113          	addi	sp,sp,32
40001314:	00008067          	ret

40001318 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40001318:	fe010113          	addi	sp,sp,-32
4000131c:	00112e23          	sw	ra,28(sp)
40001320:	00812c23          	sw	s0,24(sp)
40001324:	02010413          	addi	s0,sp,32
40001328:	fea42623          	sw	a0,-20(s0)
4000132c:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40001330:	00000013          	nop
40001334:	fec42503          	lw	a0,-20(s0)
40001338:	f85ff0ef          	jal	ra,400012bc <uart_writeAvailability>
4000133c:	00050793          	mv	a5,a0
40001340:	fe078ae3          	beqz	a5,40001334 <uart_write+0x1c>
	reg->DATA = data;
40001344:	fec42783          	lw	a5,-20(s0)
40001348:	fe842703          	lw	a4,-24(s0)
4000134c:	00e7a023          	sw	a4,0(a5)
}
40001350:	00000013          	nop
40001354:	01c12083          	lw	ra,28(sp)
40001358:	01812403          	lw	s0,24(sp)
4000135c:	02010113          	addi	sp,sp,32
40001360:	00008067          	ret

40001364 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001364:	fe010113          	addi	sp,sp,-32
40001368:	00812e23          	sw	s0,28(sp)
4000136c:	02010413          	addi	s0,sp,32
40001370:	fea42623          	sw	a0,-20(s0)
40001374:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001378:	fe842783          	lw	a5,-24(s0)
4000137c:	00c7a703          	lw	a4,12(a5)
40001380:	fec42783          	lw	a5,-20(s0)
40001384:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001388:	fe842783          	lw	a5,-24(s0)
4000138c:	0007a783          	lw	a5,0(a5)
40001390:	fff78713          	addi	a4,a5,-1
40001394:	fe842783          	lw	a5,-24(s0)
40001398:	0047a783          	lw	a5,4(a5)
4000139c:	00879793          	slli	a5,a5,0x8
400013a0:	00f76733          	or	a4,a4,a5
400013a4:	fe842783          	lw	a5,-24(s0)
400013a8:	0087a783          	lw	a5,8(a5)
400013ac:	01079793          	slli	a5,a5,0x10
400013b0:	00f76733          	or	a4,a4,a5
400013b4:	fec42783          	lw	a5,-20(s0)
400013b8:	00e7a623          	sw	a4,12(a5)
}
400013bc:	00000013          	nop
400013c0:	01c12403          	lw	s0,28(sp)
400013c4:	02010113          	addi	sp,sp,32
400013c8:	00008067          	ret

400013cc <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
400013cc:	fe010113          	addi	sp,sp,-32
400013d0:	00812e23          	sw	s0,28(sp)
400013d4:	02010413          	addi	s0,sp,32
400013d8:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
400013dc:	fec42783          	lw	a5,-20(s0)
400013e0:	0007a783          	lw	a5,0(a5)
400013e4:	0027f793          	andi	a5,a5,2
400013e8:	00f037b3          	snez	a5,a5
400013ec:	0ff7f793          	zext.b	a5,a5
}
400013f0:	00078513          	mv	a0,a5
400013f4:	01c12403          	lw	s0,28(sp)
400013f8:	02010113          	addi	sp,sp,32
400013fc:	00008067          	ret

40001400 <vga_run>:
static void vga_run(Vga_Reg *reg){
40001400:	fe010113          	addi	sp,sp,-32
40001404:	00812e23          	sw	s0,28(sp)
40001408:	02010413          	addi	s0,sp,32
4000140c:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40001410:	fec42783          	lw	a5,-20(s0)
40001414:	00100713          	li	a4,1
40001418:	00e7a023          	sw	a4,0(a5)
}
4000141c:	00000013          	nop
40001420:	01c12403          	lw	s0,28(sp)
40001424:	02010113          	addi	sp,sp,32
40001428:	00008067          	ret

4000142c <vga_stop>:
static void vga_stop(Vga_Reg *reg){
4000142c:	fe010113          	addi	sp,sp,-32
40001430:	00112e23          	sw	ra,28(sp)
40001434:	00812c23          	sw	s0,24(sp)
40001438:	02010413          	addi	s0,sp,32
4000143c:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40001440:	fec42783          	lw	a5,-20(s0)
40001444:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001448:	00000013          	nop
4000144c:	fec42503          	lw	a0,-20(s0)
40001450:	f7dff0ef          	jal	ra,400013cc <vga_isBusy>
40001454:	00050793          	mv	a5,a0
40001458:	fe079ae3          	bnez	a5,4000144c <vga_stop+0x20>
}
4000145c:	00000013          	nop
40001460:	00000013          	nop
40001464:	01c12083          	lw	ra,28(sp)
40001468:	01812403          	lw	s0,24(sp)
4000146c:	02010113          	addi	sp,sp,32
40001470:	00008067          	ret

40001474 <present_write>:
#include "briey.h"
void present_write(uint32_t iData, uint32_t iAddress)
{
40001474:	fe010113          	addi	sp,sp,-32
40001478:	00812e23          	sw	s0,28(sp)
4000147c:	02010413          	addi	s0,sp,32
40001480:	fea42623          	sw	a0,-20(s0)
40001484:	feb42423          	sw	a1,-24(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
40001488:	f00027b7          	lui	a5,0xf0002
4000148c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001490:	fe842703          	lw	a4,-24(s0)
40001494:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->WRITE_N 		= 0;
40001498:	f00027b7          	lui	a5,0xf0002
4000149c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400014a0:	0007a223          	sw	zero,4(a5)
	PRESENT_BASE->READ_N 		= 1;
400014a4:	f00027b7          	lui	a5,0xf0002
400014a8:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400014ac:	00100713          	li	a4,1
400014b0:	00e7a423          	sw	a4,8(a5)
	PRESENT_BASE->IDATA			= iData;
400014b4:	f00027b7          	lui	a5,0xf0002
400014b8:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400014bc:	fec42703          	lw	a4,-20(s0)
400014c0:	00e7a823          	sw	a4,16(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
400014c4:	f00027b7          	lui	a5,0xf0002
400014c8:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400014cc:	0007a023          	sw	zero,0(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
400014d0:	f00027b7          	lui	a5,0xf0002
400014d4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400014d8:	00100713          	li	a4,1
400014dc:	00e7a023          	sw	a4,0(a5)
}
400014e0:	00000013          	nop
400014e4:	01c12403          	lw	s0,28(sp)
400014e8:	02010113          	addi	sp,sp,32
400014ec:	00008067          	ret

400014f0 <present_read>:
uint32_t present_read(uint32_t iAddress)
{
400014f0:	fd010113          	addi	sp,sp,-48
400014f4:	02812623          	sw	s0,44(sp)
400014f8:	03010413          	addi	s0,sp,48
400014fc:	fca42e23          	sw	a0,-36(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
40001500:	f00027b7          	lui	a5,0xf0002
40001504:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001508:	fdc42703          	lw	a4,-36(s0)
4000150c:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->READ_N		= 0;
40001510:	f00027b7          	lui	a5,0xf0002
40001514:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001518:	0007a423          	sw	zero,8(a5)
	PRESENT_BASE->WRITE_N		= 1;
4000151c:	f00027b7          	lui	a5,0xf0002
40001520:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001524:	00100713          	li	a4,1
40001528:	00e7a223          	sw	a4,4(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
4000152c:	f00027b7          	lui	a5,0xf0002
40001530:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001534:	0007a023          	sw	zero,0(a5)
	uint32_t res 				= PRESENT_BASE->ODATA;
40001538:	f00027b7          	lui	a5,0xf0002
4000153c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001540:	0147a783          	lw	a5,20(a5)
40001544:	fef42623          	sw	a5,-20(s0)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
40001548:	f00027b7          	lui	a5,0xf0002
4000154c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001550:	00100713          	li	a4,1
40001554:	00e7a023          	sw	a4,0(a5)
	return res;
40001558:	fec42783          	lw	a5,-20(s0)
}
4000155c:	00078513          	mv	a0,a5
40001560:	02c12403          	lw	s0,44(sp)
40001564:	03010113          	addi	sp,sp,48
40001568:	00008067          	ret

4000156c <present_cipher>:
void present_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
4000156c:	fe010113          	addi	sp,sp,-32
40001570:	00112e23          	sw	ra,28(sp)
40001574:	00812c23          	sw	s0,24(sp)
40001578:	00912a23          	sw	s1,20(sp)
4000157c:	02010413          	addi	s0,sp,32
40001580:	00050793          	mv	a5,a0
40001584:	feb42423          	sw	a1,-24(s0)
40001588:	fec42223          	sw	a2,-28(s0)
4000158c:	fed42023          	sw	a3,-32(s0)
40001590:	fef407a3          	sb	a5,-17(s0)

	//EN_OR_DE
	if(operation == PRESENT_OP_EN) present_write(PRESENT_OP_EN,PRESENT_ADDR_EN_OR_DE);
40001594:	fef44783          	lbu	a5,-17(s0)
40001598:	00079a63          	bnez	a5,400015ac <present_cipher+0x40>
4000159c:	00800593          	li	a1,8
400015a0:	00000513          	li	a0,0
400015a4:	ed1ff0ef          	jal	ra,40001474 <present_write>
400015a8:	0100006f          	j	400015b8 <present_cipher+0x4c>
	else present_write(PRESENT_OP_DE,PRESENT_ADDR_EN_OR_DE);
400015ac:	00800593          	li	a1,8
400015b0:	00100513          	li	a0,1
400015b4:	ec1ff0ef          	jal	ra,40001474 <present_write>

	//PLAIN_TEXT
	present_write(block[1],PRESENT_ADDR_BLOCK_BASE +1);
400015b8:	fe442783          	lw	a5,-28(s0)
400015bc:	00478793          	addi	a5,a5,4
400015c0:	0007a783          	lw	a5,0(a5)
400015c4:	00500593          	li	a1,5
400015c8:	00078513          	mv	a0,a5
400015cc:	ea9ff0ef          	jal	ra,40001474 <present_write>
	present_write(block[0],PRESENT_ADDR_BLOCK_BASE);
400015d0:	fe442783          	lw	a5,-28(s0)
400015d4:	0007a783          	lw	a5,0(a5)
400015d8:	00400593          	li	a1,4
400015dc:	00078513          	mv	a0,a5
400015e0:	e95ff0ef          	jal	ra,40001474 <present_write>

	//KEY
	present_write(key[2],PRESENT_ADDR_KEY_BASE +2);
400015e4:	fe842783          	lw	a5,-24(s0)
400015e8:	00878793          	addi	a5,a5,8
400015ec:	0007a783          	lw	a5,0(a5)
400015f0:	00300593          	li	a1,3
400015f4:	00078513          	mv	a0,a5
400015f8:	e7dff0ef          	jal	ra,40001474 <present_write>
	present_write(key[1],PRESENT_ADDR_KEY_BASE +1);
400015fc:	fe842783          	lw	a5,-24(s0)
40001600:	00478793          	addi	a5,a5,4
40001604:	0007a783          	lw	a5,0(a5)
40001608:	00200593          	li	a1,2
4000160c:	00078513          	mv	a0,a5
40001610:	e65ff0ef          	jal	ra,40001474 <present_write>
	present_write(key[0],PRESENT_ADDR_KEY_BASE);
40001614:	fe842783          	lw	a5,-24(s0)
40001618:	0007a783          	lw	a5,0(a5)
4000161c:	00100593          	li	a1,1
40001620:	00078513          	mv	a0,a5
40001624:	e51ff0ef          	jal	ra,40001474 <present_write>

	//START
	present_write(0x1,PRESENT_ADDR_START);
40001628:	00000593          	li	a1,0
4000162c:	00100513          	li	a0,1
40001630:	e45ff0ef          	jal	ra,40001474 <present_write>
    while(present_read(PRESENT_ADDR_RESULT_BASE) == 0);
40001634:	00000013          	nop
40001638:	00600513          	li	a0,6
4000163c:	eb5ff0ef          	jal	ra,400014f0 <present_read>
40001640:	00050793          	mv	a5,a0
40001644:	fe078ae3          	beqz	a5,40001638 <present_cipher+0xcc>

    res[1] = present_read(PRESENT_ADDR_RESULT_BASE +1);
40001648:	fe042783          	lw	a5,-32(s0)
4000164c:	00478493          	addi	s1,a5,4
40001650:	00700513          	li	a0,7
40001654:	e9dff0ef          	jal	ra,400014f0 <present_read>
40001658:	00050793          	mv	a5,a0
4000165c:	00f4a023          	sw	a5,0(s1)
    res[0] =present_read(PRESENT_ADDR_RESULT_BASE);
40001660:	00600513          	li	a0,6
40001664:	e8dff0ef          	jal	ra,400014f0 <present_read>
40001668:	00050713          	mv	a4,a0
4000166c:	fe042783          	lw	a5,-32(s0)
40001670:	00e7a023          	sw	a4,0(a5)


    //print result to terminal
	if(operation == PRESENT_OP_EN)
40001674:	fef44783          	lbu	a5,-17(s0)
40001678:	00079a63          	bnez	a5,4000168c <present_cipher+0x120>
		print("\r\t===========================PRESENT ENCRYPTTION==============================\r\n");
4000167c:	400037b7          	lui	a5,0x40003
40001680:	a0078513          	addi	a0,a5,-1536 # 40002a00 <vga_simRes_h160_v120+0x20>
40001684:	714000ef          	jal	ra,40001d98 <print>
40001688:	0100006f          	j	40001698 <present_cipher+0x12c>
	else
		print("\r\t===========================PRESENT DECRYPTTION==============================\r\n");
4000168c:	400037b7          	lui	a5,0x40003
40001690:	a5478513          	addi	a0,a5,-1452 # 40002a54 <vga_simRes_h160_v120+0x74>
40001694:	704000ef          	jal	ra,40001d98 <print>
	print("\r\n");
40001698:	400037b7          	lui	a5,0x40003
4000169c:	aa878513          	addi	a0,a5,-1368 # 40002aa8 <vga_simRes_h160_v120+0xc8>
400016a0:	6f8000ef          	jal	ra,40001d98 <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
400016a4:	fe442583          	lw	a1,-28(s0)
400016a8:	400037b7          	lui	a5,0x40003
400016ac:	aac78513          	addi	a0,a5,-1364 # 40002aac <vga_simRes_h160_v120+0xcc>
400016b0:	151000ef          	jal	ra,40002000 <print64bit>
	print80bit("KEY (80-bit) : ", key);
400016b4:	fe842583          	lw	a1,-24(s0)
400016b8:	400037b7          	lui	a5,0x40003
400016bc:	ac878513          	addi	a0,a5,-1336 # 40002ac8 <vga_simRes_h160_v120+0xe8>
400016c0:	249000ef          	jal	ra,40002108 <print80bit>
	print64bit("RESULT (64-bit) : ", res);
400016c4:	fe042583          	lw	a1,-32(s0)
400016c8:	400037b7          	lui	a5,0x40003
400016cc:	ad878513          	addi	a0,a5,-1320 # 40002ad8 <vga_simRes_h160_v120+0xf8>
400016d0:	131000ef          	jal	ra,40002000 <print64bit>
	//print("\r\n============================================================================\r\n");
}
400016d4:	00000013          	nop
400016d8:	01c12083          	lw	ra,28(sp)
400016dc:	01812403          	lw	s0,24(sp)
400016e0:	01412483          	lw	s1,20(sp)
400016e4:	02010113          	addi	sp,sp,32
400016e8:	00008067          	ret

400016ec <timer_init>:
static void timer_init(Timer_Reg *reg){
400016ec:	fe010113          	addi	sp,sp,-32
400016f0:	00812e23          	sw	s0,28(sp)
400016f4:	02010413          	addi	s0,sp,32
400016f8:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
400016fc:	fec42783          	lw	a5,-20(s0)
40001700:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40001704:	fec42783          	lw	a5,-20(s0)
40001708:	0007a423          	sw	zero,8(a5)
}
4000170c:	00000013          	nop
40001710:	01c12403          	lw	s0,28(sp)
40001714:	02010113          	addi	sp,sp,32
40001718:	00008067          	ret

4000171c <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
4000171c:	fe010113          	addi	sp,sp,-32
40001720:	00812e23          	sw	s0,28(sp)
40001724:	02010413          	addi	s0,sp,32
40001728:	fea42623          	sw	a0,-20(s0)
}
4000172c:	00000013          	nop
40001730:	01c12403          	lw	s0,28(sp)
40001734:	02010113          	addi	sp,sp,32
40001738:	00008067          	ret

4000173c <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
4000173c:	fe010113          	addi	sp,sp,-32
40001740:	00812e23          	sw	s0,28(sp)
40001744:	02010413          	addi	s0,sp,32
40001748:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
4000174c:	fec42783          	lw	a5,-20(s0)
40001750:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001754:	fec42783          	lw	a5,-20(s0)
40001758:	fff00713          	li	a4,-1
4000175c:	00e7a023          	sw	a4,0(a5)
}
40001760:	00000013          	nop
40001764:	01c12403          	lw	s0,28(sp)
40001768:	02010113          	addi	sp,sp,32
4000176c:	00008067          	ret

40001770 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40001770:	fe010113          	addi	sp,sp,-32
40001774:	00812e23          	sw	s0,28(sp)
40001778:	02010413          	addi	s0,sp,32
4000177c:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40001780:	fec42783          	lw	a5,-20(s0)
40001784:	0047a783          	lw	a5,4(a5)
40001788:	0107d793          	srli	a5,a5,0x10
4000178c:	0ff7f793          	zext.b	a5,a5
}
40001790:	00078513          	mv	a0,a5
40001794:	01c12403          	lw	s0,28(sp)
40001798:	02010113          	addi	sp,sp,32
4000179c:	00008067          	ret

400017a0 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
400017a0:	fe010113          	addi	sp,sp,-32
400017a4:	00812e23          	sw	s0,28(sp)
400017a8:	02010413          	addi	s0,sp,32
400017ac:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
400017b0:	fec42783          	lw	a5,-20(s0)
400017b4:	0047a783          	lw	a5,4(a5)
400017b8:	0187d793          	srli	a5,a5,0x18
}
400017bc:	00078513          	mv	a0,a5
400017c0:	01c12403          	lw	s0,28(sp)
400017c4:	02010113          	addi	sp,sp,32
400017c8:	00008067          	ret

400017cc <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
400017cc:	fe010113          	addi	sp,sp,-32
400017d0:	00112e23          	sw	ra,28(sp)
400017d4:	00812c23          	sw	s0,24(sp)
400017d8:	02010413          	addi	s0,sp,32
400017dc:	fea42623          	sw	a0,-20(s0)
400017e0:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
400017e4:	00000013          	nop
400017e8:	fec42503          	lw	a0,-20(s0)
400017ec:	f85ff0ef          	jal	ra,40001770 <uart_writeAvailability>
400017f0:	00050793          	mv	a5,a0
400017f4:	fe078ae3          	beqz	a5,400017e8 <uart_write+0x1c>
	reg->DATA = data;
400017f8:	fec42783          	lw	a5,-20(s0)
400017fc:	fe842703          	lw	a4,-24(s0)
40001800:	00e7a023          	sw	a4,0(a5)
}
40001804:	00000013          	nop
40001808:	01c12083          	lw	ra,28(sp)
4000180c:	01812403          	lw	s0,24(sp)
40001810:	02010113          	addi	sp,sp,32
40001814:	00008067          	ret

40001818 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001818:	fe010113          	addi	sp,sp,-32
4000181c:	00812e23          	sw	s0,28(sp)
40001820:	02010413          	addi	s0,sp,32
40001824:	fea42623          	sw	a0,-20(s0)
40001828:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
4000182c:	fe842783          	lw	a5,-24(s0)
40001830:	00c7a703          	lw	a4,12(a5)
40001834:	fec42783          	lw	a5,-20(s0)
40001838:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
4000183c:	fe842783          	lw	a5,-24(s0)
40001840:	0007a783          	lw	a5,0(a5)
40001844:	fff78713          	addi	a4,a5,-1
40001848:	fe842783          	lw	a5,-24(s0)
4000184c:	0047a783          	lw	a5,4(a5)
40001850:	00879793          	slli	a5,a5,0x8
40001854:	00f76733          	or	a4,a4,a5
40001858:	fe842783          	lw	a5,-24(s0)
4000185c:	0087a783          	lw	a5,8(a5)
40001860:	01079793          	slli	a5,a5,0x10
40001864:	00f76733          	or	a4,a4,a5
40001868:	fec42783          	lw	a5,-20(s0)
4000186c:	00e7a623          	sw	a4,12(a5)
}
40001870:	00000013          	nop
40001874:	01c12403          	lw	s0,28(sp)
40001878:	02010113          	addi	sp,sp,32
4000187c:	00008067          	ret

40001880 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001880:	fe010113          	addi	sp,sp,-32
40001884:	00812e23          	sw	s0,28(sp)
40001888:	02010413          	addi	s0,sp,32
4000188c:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001890:	fec42783          	lw	a5,-20(s0)
40001894:	0007a783          	lw	a5,0(a5)
40001898:	0027f793          	andi	a5,a5,2
4000189c:	00f037b3          	snez	a5,a5
400018a0:	0ff7f793          	zext.b	a5,a5
}
400018a4:	00078513          	mv	a0,a5
400018a8:	01c12403          	lw	s0,28(sp)
400018ac:	02010113          	addi	sp,sp,32
400018b0:	00008067          	ret

400018b4 <vga_run>:
static void vga_run(Vga_Reg *reg){
400018b4:	fe010113          	addi	sp,sp,-32
400018b8:	00812e23          	sw	s0,28(sp)
400018bc:	02010413          	addi	s0,sp,32
400018c0:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
400018c4:	fec42783          	lw	a5,-20(s0)
400018c8:	00100713          	li	a4,1
400018cc:	00e7a023          	sw	a4,0(a5)
}
400018d0:	00000013          	nop
400018d4:	01c12403          	lw	s0,28(sp)
400018d8:	02010113          	addi	sp,sp,32
400018dc:	00008067          	ret

400018e0 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
400018e0:	fe010113          	addi	sp,sp,-32
400018e4:	00112e23          	sw	ra,28(sp)
400018e8:	00812c23          	sw	s0,24(sp)
400018ec:	02010413          	addi	s0,sp,32
400018f0:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
400018f4:	fec42783          	lw	a5,-20(s0)
400018f8:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
400018fc:	00000013          	nop
40001900:	fec42503          	lw	a0,-20(s0)
40001904:	f7dff0ef          	jal	ra,40001880 <vga_isBusy>
40001908:	00050793          	mv	a5,a0
4000190c:	fe079ae3          	bnez	a5,40001900 <vga_stop+0x20>
}
40001910:	00000013          	nop
40001914:	00000013          	nop
40001918:	01c12083          	lw	ra,28(sp)
4000191c:	01812403          	lw	s0,24(sp)
40001920:	02010113          	addi	sp,sp,32
40001924:	00008067          	ret

40001928 <dm_present_write>:
#include "briey.h"
void dm_present_write(uint32_t iData, uint32_t iAddress)
{
40001928:	fe010113          	addi	sp,sp,-32
4000192c:	00812e23          	sw	s0,28(sp)
40001930:	02010413          	addi	s0,sp,32
40001934:	fea42623          	sw	a0,-20(s0)
40001938:	feb42423          	sw	a1,-24(s0)
	DMPRESENT_BASE->ADDRESS			= iAddress;
4000193c:	f00037b7          	lui	a5,0xf0003
40001940:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001944:	fe842703          	lw	a4,-24(s0)
40001948:	00e7a623          	sw	a4,12(a5)
	DMPRESENT_BASE->WRITE_N 		= 0;
4000194c:	f00037b7          	lui	a5,0xf0003
40001950:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001954:	0007a223          	sw	zero,4(a5)
	DMPRESENT_BASE->READ_N 			= 1;
40001958:	f00037b7          	lui	a5,0xf0003
4000195c:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001960:	00100713          	li	a4,1
40001964:	00e7a423          	sw	a4,8(a5)
	DMPRESENT_BASE->IDATA			= iData;
40001968:	f00037b7          	lui	a5,0xf0003
4000196c:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001970:	fec42703          	lw	a4,-20(s0)
40001974:	00e7a823          	sw	a4,16(a5)
	DMPRESENT_BASE->CHIP_SELECT_N	= 0;
40001978:	f00037b7          	lui	a5,0xf0003
4000197c:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001980:	0007a023          	sw	zero,0(a5)
	DMPRESENT_BASE->CHIP_SELECT_N	= 1;
40001984:	f00037b7          	lui	a5,0xf0003
40001988:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
4000198c:	00100713          	li	a4,1
40001990:	00e7a023          	sw	a4,0(a5)
}
40001994:	00000013          	nop
40001998:	01c12403          	lw	s0,28(sp)
4000199c:	02010113          	addi	sp,sp,32
400019a0:	00008067          	ret

400019a4 <dm_present_read>:
uint32_t dm_present_read(uint32_t iAddress)
{
400019a4:	fd010113          	addi	sp,sp,-48
400019a8:	02812623          	sw	s0,44(sp)
400019ac:	03010413          	addi	s0,sp,48
400019b0:	fca42e23          	sw	a0,-36(s0)
	DMPRESENT_BASE->ADDRESS			= iAddress;
400019b4:	f00037b7          	lui	a5,0xf0003
400019b8:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400019bc:	fdc42703          	lw	a4,-36(s0)
400019c0:	00e7a623          	sw	a4,12(a5)
	DMPRESENT_BASE->READ_N			= 0;
400019c4:	f00037b7          	lui	a5,0xf0003
400019c8:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400019cc:	0007a423          	sw	zero,8(a5)
	DMPRESENT_BASE->WRITE_N			= 1;
400019d0:	f00037b7          	lui	a5,0xf0003
400019d4:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400019d8:	00100713          	li	a4,1
400019dc:	00e7a223          	sw	a4,4(a5)
	DMPRESENT_BASE->CHIP_SELECT_N	= 0;
400019e0:	f00037b7          	lui	a5,0xf0003
400019e4:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400019e8:	0007a023          	sw	zero,0(a5)
	uint32_t res 					= DMPRESENT_BASE->ODATA;
400019ec:	f00037b7          	lui	a5,0xf0003
400019f0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400019f4:	0147a783          	lw	a5,20(a5)
400019f8:	fef42623          	sw	a5,-20(s0)
	DMPRESENT_BASE->CHIP_SELECT_N	= 1;
400019fc:	f00037b7          	lui	a5,0xf0003
40001a00:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001a04:	00100713          	li	a4,1
40001a08:	00e7a023          	sw	a4,0(a5)
	return res;
40001a0c:	fec42783          	lw	a5,-20(s0)
}
40001a10:	00078513          	mv	a0,a5
40001a14:	02c12403          	lw	s0,44(sp)
40001a18:	03010113          	addi	sp,sp,48
40001a1c:	00008067          	ret

40001a20 <dm_present_hash>:
void dm_present_hash(uint32_t *key, uint32_t *block, uint32_t *res) {
40001a20:	fe010113          	addi	sp,sp,-32
40001a24:	00112e23          	sw	ra,28(sp)
40001a28:	00812c23          	sw	s0,24(sp)
40001a2c:	00912a23          	sw	s1,20(sp)
40001a30:	02010413          	addi	s0,sp,32
40001a34:	fea42623          	sw	a0,-20(s0)
40001a38:	feb42423          	sw	a1,-24(s0)
40001a3c:	fec42223          	sw	a2,-28(s0)

	//PLAIN_TEXT
	dm_present_write(block[1],DMPRESENT_ADDR_BLOCK_BASE +1);
40001a40:	fe842783          	lw	a5,-24(s0)
40001a44:	00478793          	addi	a5,a5,4
40001a48:	0007a783          	lw	a5,0(a5)
40001a4c:	00500593          	li	a1,5
40001a50:	00078513          	mv	a0,a5
40001a54:	ed5ff0ef          	jal	ra,40001928 <dm_present_write>
	dm_present_write(block[0],DMPRESENT_ADDR_BLOCK_BASE);
40001a58:	fe842783          	lw	a5,-24(s0)
40001a5c:	0007a783          	lw	a5,0(a5)
40001a60:	00400593          	li	a1,4
40001a64:	00078513          	mv	a0,a5
40001a68:	ec1ff0ef          	jal	ra,40001928 <dm_present_write>

	//KEY
	dm_present_write(key[2],DMPRESENT_ADDR_KEY_BASE +2);
40001a6c:	fec42783          	lw	a5,-20(s0)
40001a70:	00878793          	addi	a5,a5,8
40001a74:	0007a783          	lw	a5,0(a5)
40001a78:	00300593          	li	a1,3
40001a7c:	00078513          	mv	a0,a5
40001a80:	ea9ff0ef          	jal	ra,40001928 <dm_present_write>
	dm_present_write(key[1],DMPRESENT_ADDR_KEY_BASE +1);
40001a84:	fec42783          	lw	a5,-20(s0)
40001a88:	00478793          	addi	a5,a5,4
40001a8c:	0007a783          	lw	a5,0(a5)
40001a90:	00200593          	li	a1,2
40001a94:	00078513          	mv	a0,a5
40001a98:	e91ff0ef          	jal	ra,40001928 <dm_present_write>
	dm_present_write(key[0],DMPRESENT_ADDR_KEY_BASE);
40001a9c:	fec42783          	lw	a5,-20(s0)
40001aa0:	0007a783          	lw	a5,0(a5)
40001aa4:	00100593          	li	a1,1
40001aa8:	00078513          	mv	a0,a5
40001aac:	e7dff0ef          	jal	ra,40001928 <dm_present_write>

	//START
	dm_present_write(0x1,DMPRESENT_ADDR_START);
40001ab0:	00000593          	li	a1,0
40001ab4:	00100513          	li	a0,1
40001ab8:	e71ff0ef          	jal	ra,40001928 <dm_present_write>
    while(dm_present_read(DMPRESENT_ADDR_RESULT_BASE) == 0);
40001abc:	00000013          	nop
40001ac0:	00600513          	li	a0,6
40001ac4:	ee1ff0ef          	jal	ra,400019a4 <dm_present_read>
40001ac8:	00050793          	mv	a5,a0
40001acc:	fe078ae3          	beqz	a5,40001ac0 <dm_present_hash+0xa0>

    res[1] = dm_present_read(DMPRESENT_ADDR_RESULT_BASE +1);
40001ad0:	fe442783          	lw	a5,-28(s0)
40001ad4:	00478493          	addi	s1,a5,4
40001ad8:	00700513          	li	a0,7
40001adc:	ec9ff0ef          	jal	ra,400019a4 <dm_present_read>
40001ae0:	00050793          	mv	a5,a0
40001ae4:	00f4a023          	sw	a5,0(s1)
    res[0] = dm_present_read(DMPRESENT_ADDR_RESULT_BASE);
40001ae8:	00600513          	li	a0,6
40001aec:	eb9ff0ef          	jal	ra,400019a4 <dm_present_read>
40001af0:	00050713          	mv	a4,a0
40001af4:	fe442783          	lw	a5,-28(s0)
40001af8:	00e7a023          	sw	a4,0(a5)


    //print result to terminal
	print("\r\t===========================DM_PRESENT HASH==================================\r\n");
40001afc:	400037b7          	lui	a5,0x40003
40001b00:	b4c78513          	addi	a0,a5,-1204 # 40002b4c <vga_simRes_h160_v120+0x20>
40001b04:	294000ef          	jal	ra,40001d98 <print>
	print("\r\n");
40001b08:	400037b7          	lui	a5,0x40003
40001b0c:	ba078513          	addi	a0,a5,-1120 # 40002ba0 <vga_simRes_h160_v120+0x74>
40001b10:	288000ef          	jal	ra,40001d98 <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
40001b14:	fe842583          	lw	a1,-24(s0)
40001b18:	400037b7          	lui	a5,0x40003
40001b1c:	ba478513          	addi	a0,a5,-1116 # 40002ba4 <vga_simRes_h160_v120+0x78>
40001b20:	4e0000ef          	jal	ra,40002000 <print64bit>
	print80bit("KEY (80-bit) : ", key);
40001b24:	fec42583          	lw	a1,-20(s0)
40001b28:	400037b7          	lui	a5,0x40003
40001b2c:	bc078513          	addi	a0,a5,-1088 # 40002bc0 <vga_simRes_h160_v120+0x94>
40001b30:	5d8000ef          	jal	ra,40002108 <print80bit>
	print64bit("RESULT (64-bit) : ", res);
40001b34:	fe442583          	lw	a1,-28(s0)
40001b38:	400037b7          	lui	a5,0x40003
40001b3c:	bd078513          	addi	a0,a5,-1072 # 40002bd0 <vga_simRes_h160_v120+0xa4>
40001b40:	4c0000ef          	jal	ra,40002000 <print64bit>
	//print("\r\n============================================================================\r\n");
}
40001b44:	00000013          	nop
40001b48:	01c12083          	lw	ra,28(sp)
40001b4c:	01812403          	lw	s0,24(sp)
40001b50:	01412483          	lw	s1,20(sp)
40001b54:	02010113          	addi	sp,sp,32
40001b58:	00008067          	ret

40001b5c <timer_init>:
static void timer_init(Timer_Reg *reg){
40001b5c:	fe010113          	addi	sp,sp,-32
40001b60:	00812e23          	sw	s0,28(sp)
40001b64:	02010413          	addi	s0,sp,32
40001b68:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40001b6c:	fec42783          	lw	a5,-20(s0)
40001b70:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40001b74:	fec42783          	lw	a5,-20(s0)
40001b78:	0007a423          	sw	zero,8(a5)
}
40001b7c:	00000013          	nop
40001b80:	01c12403          	lw	s0,28(sp)
40001b84:	02010113          	addi	sp,sp,32
40001b88:	00008067          	ret

40001b8c <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001b8c:	fe010113          	addi	sp,sp,-32
40001b90:	00812e23          	sw	s0,28(sp)
40001b94:	02010413          	addi	s0,sp,32
40001b98:	fea42623          	sw	a0,-20(s0)
}
40001b9c:	00000013          	nop
40001ba0:	01c12403          	lw	s0,28(sp)
40001ba4:	02010113          	addi	sp,sp,32
40001ba8:	00008067          	ret

40001bac <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001bac:	fe010113          	addi	sp,sp,-32
40001bb0:	00812e23          	sw	s0,28(sp)
40001bb4:	02010413          	addi	s0,sp,32
40001bb8:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001bbc:	fec42783          	lw	a5,-20(s0)
40001bc0:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001bc4:	fec42783          	lw	a5,-20(s0)
40001bc8:	fff00713          	li	a4,-1
40001bcc:	00e7a023          	sw	a4,0(a5)
}
40001bd0:	00000013          	nop
40001bd4:	01c12403          	lw	s0,28(sp)
40001bd8:	02010113          	addi	sp,sp,32
40001bdc:	00008067          	ret

40001be0 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40001be0:	fe010113          	addi	sp,sp,-32
40001be4:	00812e23          	sw	s0,28(sp)
40001be8:	02010413          	addi	s0,sp,32
40001bec:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40001bf0:	fec42783          	lw	a5,-20(s0)
40001bf4:	0047a783          	lw	a5,4(a5)
40001bf8:	0107d793          	srli	a5,a5,0x10
40001bfc:	0ff7f793          	zext.b	a5,a5
}
40001c00:	00078513          	mv	a0,a5
40001c04:	01c12403          	lw	s0,28(sp)
40001c08:	02010113          	addi	sp,sp,32
40001c0c:	00008067          	ret

40001c10 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40001c10:	fe010113          	addi	sp,sp,-32
40001c14:	00812e23          	sw	s0,28(sp)
40001c18:	02010413          	addi	s0,sp,32
40001c1c:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40001c20:	fec42783          	lw	a5,-20(s0)
40001c24:	0047a783          	lw	a5,4(a5)
40001c28:	0187d793          	srli	a5,a5,0x18
}
40001c2c:	00078513          	mv	a0,a5
40001c30:	01c12403          	lw	s0,28(sp)
40001c34:	02010113          	addi	sp,sp,32
40001c38:	00008067          	ret

40001c3c <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40001c3c:	fe010113          	addi	sp,sp,-32
40001c40:	00112e23          	sw	ra,28(sp)
40001c44:	00812c23          	sw	s0,24(sp)
40001c48:	02010413          	addi	s0,sp,32
40001c4c:	fea42623          	sw	a0,-20(s0)
40001c50:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40001c54:	00000013          	nop
40001c58:	fec42503          	lw	a0,-20(s0)
40001c5c:	f85ff0ef          	jal	ra,40001be0 <uart_writeAvailability>
40001c60:	00050793          	mv	a5,a0
40001c64:	fe078ae3          	beqz	a5,40001c58 <uart_write+0x1c>
	reg->DATA = data;
40001c68:	fec42783          	lw	a5,-20(s0)
40001c6c:	fe842703          	lw	a4,-24(s0)
40001c70:	00e7a023          	sw	a4,0(a5)
}
40001c74:	00000013          	nop
40001c78:	01c12083          	lw	ra,28(sp)
40001c7c:	01812403          	lw	s0,24(sp)
40001c80:	02010113          	addi	sp,sp,32
40001c84:	00008067          	ret

40001c88 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001c88:	fe010113          	addi	sp,sp,-32
40001c8c:	00812e23          	sw	s0,28(sp)
40001c90:	02010413          	addi	s0,sp,32
40001c94:	fea42623          	sw	a0,-20(s0)
40001c98:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001c9c:	fe842783          	lw	a5,-24(s0)
40001ca0:	00c7a703          	lw	a4,12(a5)
40001ca4:	fec42783          	lw	a5,-20(s0)
40001ca8:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001cac:	fe842783          	lw	a5,-24(s0)
40001cb0:	0007a783          	lw	a5,0(a5)
40001cb4:	fff78713          	addi	a4,a5,-1
40001cb8:	fe842783          	lw	a5,-24(s0)
40001cbc:	0047a783          	lw	a5,4(a5)
40001cc0:	00879793          	slli	a5,a5,0x8
40001cc4:	00f76733          	or	a4,a4,a5
40001cc8:	fe842783          	lw	a5,-24(s0)
40001ccc:	0087a783          	lw	a5,8(a5)
40001cd0:	01079793          	slli	a5,a5,0x10
40001cd4:	00f76733          	or	a4,a4,a5
40001cd8:	fec42783          	lw	a5,-20(s0)
40001cdc:	00e7a623          	sw	a4,12(a5)
}
40001ce0:	00000013          	nop
40001ce4:	01c12403          	lw	s0,28(sp)
40001ce8:	02010113          	addi	sp,sp,32
40001cec:	00008067          	ret

40001cf0 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001cf0:	fe010113          	addi	sp,sp,-32
40001cf4:	00812e23          	sw	s0,28(sp)
40001cf8:	02010413          	addi	s0,sp,32
40001cfc:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001d00:	fec42783          	lw	a5,-20(s0)
40001d04:	0007a783          	lw	a5,0(a5)
40001d08:	0027f793          	andi	a5,a5,2
40001d0c:	00f037b3          	snez	a5,a5
40001d10:	0ff7f793          	zext.b	a5,a5
}
40001d14:	00078513          	mv	a0,a5
40001d18:	01c12403          	lw	s0,28(sp)
40001d1c:	02010113          	addi	sp,sp,32
40001d20:	00008067          	ret

40001d24 <vga_run>:
static void vga_run(Vga_Reg *reg){
40001d24:	fe010113          	addi	sp,sp,-32
40001d28:	00812e23          	sw	s0,28(sp)
40001d2c:	02010413          	addi	s0,sp,32
40001d30:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40001d34:	fec42783          	lw	a5,-20(s0)
40001d38:	00100713          	li	a4,1
40001d3c:	00e7a023          	sw	a4,0(a5)
}
40001d40:	00000013          	nop
40001d44:	01c12403          	lw	s0,28(sp)
40001d48:	02010113          	addi	sp,sp,32
40001d4c:	00008067          	ret

40001d50 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40001d50:	fe010113          	addi	sp,sp,-32
40001d54:	00112e23          	sw	ra,28(sp)
40001d58:	00812c23          	sw	s0,24(sp)
40001d5c:	02010413          	addi	s0,sp,32
40001d60:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40001d64:	fec42783          	lw	a5,-20(s0)
40001d68:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001d6c:	00000013          	nop
40001d70:	fec42503          	lw	a0,-20(s0)
40001d74:	f7dff0ef          	jal	ra,40001cf0 <vga_isBusy>
40001d78:	00050793          	mv	a5,a0
40001d7c:	fe079ae3          	bnez	a5,40001d70 <vga_stop+0x20>
}
40001d80:	00000013          	nop
40001d84:	00000013          	nop
40001d88:	01c12083          	lw	ra,28(sp)
40001d8c:	01812403          	lw	s0,24(sp)
40001d90:	02010113          	addi	sp,sp,32
40001d94:	00008067          	ret

40001d98 <print>:
#include <briey.h>

void print(char *str){
40001d98:	fe010113          	addi	sp,sp,-32
40001d9c:	00112e23          	sw	ra,28(sp)
40001da0:	00812c23          	sw	s0,24(sp)
40001da4:	02010413          	addi	s0,sp,32
40001da8:	fea42623          	sw	a0,-20(s0)
	while(*str){
40001dac:	0200006f          	j	40001dcc <print+0x34>
		uart_write(UART,*(str++));
40001db0:	fec42783          	lw	a5,-20(s0)
40001db4:	00178713          	addi	a4,a5,1
40001db8:	fee42623          	sw	a4,-20(s0)
40001dbc:	0007c783          	lbu	a5,0(a5)
40001dc0:	00078593          	mv	a1,a5
40001dc4:	f0010537          	lui	a0,0xf0010
40001dc8:	e75ff0ef          	jal	ra,40001c3c <uart_write>
	while(*str){
40001dcc:	fec42783          	lw	a5,-20(s0)
40001dd0:	0007c783          	lbu	a5,0(a5)
40001dd4:	fc079ee3          	bnez	a5,40001db0 <print+0x18>
	}
}
40001dd8:	00000013          	nop
40001ddc:	00000013          	nop
40001de0:	01c12083          	lw	ra,28(sp)
40001de4:	01812403          	lw	s0,24(sp)
40001de8:	02010113          	addi	sp,sp,32
40001dec:	00008067          	ret

40001df0 <print16bit>:

void print16bit(uint32_t n)
{
40001df0:	fc010113          	addi	sp,sp,-64
40001df4:	02112e23          	sw	ra,60(sp)
40001df8:	02812c23          	sw	s0,56(sp)
40001dfc:	04010413          	addi	s0,sp,64
40001e00:	fca42623          	sw	a0,-52(s0)

    int i = 0;
40001e04:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40001e08:	fc042e23          	sw	zero,-36(s0)
40001e0c:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40001e10:	fcc42783          	lw	a5,-52(s0)
40001e14:	00f7f793          	andi	a5,a5,15
40001e18:	40003737          	lui	a4,0x40003
40001e1c:	c4870713          	addi	a4,a4,-952 # 40002c48 <vga_simRes_h160_v120+0x24>
40001e20:	00f707b3          	add	a5,a4,a5
40001e24:	0007c703          	lbu	a4,0(a5)
40001e28:	fec42783          	lw	a5,-20(s0)
40001e2c:	ff040693          	addi	a3,s0,-16
40001e30:	00f687b3          	add	a5,a3,a5
40001e34:	fee78623          	sb	a4,-20(a5)
        i++;
40001e38:	fec42783          	lw	a5,-20(s0)
40001e3c:	00178793          	addi	a5,a5,1
40001e40:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40001e44:	fcc42783          	lw	a5,-52(s0)
40001e48:	0047d793          	srli	a5,a5,0x4
40001e4c:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40001e50:	fcc42783          	lw	a5,-52(s0)
40001e54:	fa079ee3          	bnez	a5,40001e10 <print16bit+0x20>
    if(i<8) {
40001e58:	fec42703          	lw	a4,-20(s0)
40001e5c:	00700793          	li	a5,7
40001e60:	02e7ce63          	blt	a5,a4,40001e9c <print16bit+0xac>
    	for(int j=7;j>=i;j--){
40001e64:	00700793          	li	a5,7
40001e68:	fef42423          	sw	a5,-24(s0)
40001e6c:	0240006f          	j	40001e90 <print16bit+0xa0>
    		outbuf_inv[j]="0"[0];
40001e70:	03000713          	li	a4,48
40001e74:	fe842783          	lw	a5,-24(s0)
40001e78:	ff040693          	addi	a3,s0,-16
40001e7c:	00f687b3          	add	a5,a3,a5
40001e80:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40001e84:	fe842783          	lw	a5,-24(s0)
40001e88:	fff78793          	addi	a5,a5,-1
40001e8c:	fef42423          	sw	a5,-24(s0)
40001e90:	fe842703          	lw	a4,-24(s0)
40001e94:	fec42783          	lw	a5,-20(s0)
40001e98:	fcf75ce3          	bge	a4,a5,40001e70 <print16bit+0x80>
    	}
    }
    for(int j=3;j>=0;j--)
40001e9c:	00300793          	li	a5,3
40001ea0:	fef42223          	sw	a5,-28(s0)
40001ea4:	02c0006f          	j	40001ed0 <print16bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40001ea8:	fe442783          	lw	a5,-28(s0)
40001eac:	ff040713          	addi	a4,s0,-16
40001eb0:	00f707b3          	add	a5,a4,a5
40001eb4:	fec7c783          	lbu	a5,-20(a5)
40001eb8:	00078593          	mv	a1,a5
40001ebc:	f0010537          	lui	a0,0xf0010
40001ec0:	d7dff0ef          	jal	ra,40001c3c <uart_write>
    for(int j=3;j>=0;j--)
40001ec4:	fe442783          	lw	a5,-28(s0)
40001ec8:	fff78793          	addi	a5,a5,-1
40001ecc:	fef42223          	sw	a5,-28(s0)
40001ed0:	fe442783          	lw	a5,-28(s0)
40001ed4:	fc07dae3          	bgez	a5,40001ea8 <print16bit+0xb8>
    }
    print(" ");
40001ed8:	400037b7          	lui	a5,0x40003
40001edc:	c4478513          	addi	a0,a5,-956 # 40002c44 <vga_simRes_h160_v120+0x20>
40001ee0:	eb9ff0ef          	jal	ra,40001d98 <print>
}
40001ee4:	00000013          	nop
40001ee8:	03c12083          	lw	ra,60(sp)
40001eec:	03812403          	lw	s0,56(sp)
40001ef0:	04010113          	addi	sp,sp,64
40001ef4:	00008067          	ret

40001ef8 <print32bit>:
void print32bit(uint32_t n)
{
40001ef8:	fc010113          	addi	sp,sp,-64
40001efc:	02112e23          	sw	ra,60(sp)
40001f00:	02812c23          	sw	s0,56(sp)
40001f04:	04010413          	addi	s0,sp,64
40001f08:	fca42623          	sw	a0,-52(s0)

    int i = 0;
40001f0c:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40001f10:	fc042e23          	sw	zero,-36(s0)
40001f14:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40001f18:	fcc42783          	lw	a5,-52(s0)
40001f1c:	00f7f793          	andi	a5,a5,15
40001f20:	40003737          	lui	a4,0x40003
40001f24:	c4870713          	addi	a4,a4,-952 # 40002c48 <vga_simRes_h160_v120+0x24>
40001f28:	00f707b3          	add	a5,a4,a5
40001f2c:	0007c703          	lbu	a4,0(a5)
40001f30:	fec42783          	lw	a5,-20(s0)
40001f34:	ff040693          	addi	a3,s0,-16
40001f38:	00f687b3          	add	a5,a3,a5
40001f3c:	fee78623          	sb	a4,-20(a5)
        i++;
40001f40:	fec42783          	lw	a5,-20(s0)
40001f44:	00178793          	addi	a5,a5,1
40001f48:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40001f4c:	fcc42783          	lw	a5,-52(s0)
40001f50:	0047d793          	srli	a5,a5,0x4
40001f54:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40001f58:	fcc42783          	lw	a5,-52(s0)
40001f5c:	fa079ee3          	bnez	a5,40001f18 <print32bit+0x20>
    if(i<8) {
40001f60:	fec42703          	lw	a4,-20(s0)
40001f64:	00700793          	li	a5,7
40001f68:	02e7ce63          	blt	a5,a4,40001fa4 <print32bit+0xac>
    	for(int j=7;j>=i;j--){
40001f6c:	00700793          	li	a5,7
40001f70:	fef42423          	sw	a5,-24(s0)
40001f74:	0240006f          	j	40001f98 <print32bit+0xa0>
    		outbuf_inv[j]="0"[0];
40001f78:	03000713          	li	a4,48
40001f7c:	fe842783          	lw	a5,-24(s0)
40001f80:	ff040693          	addi	a3,s0,-16
40001f84:	00f687b3          	add	a5,a3,a5
40001f88:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40001f8c:	fe842783          	lw	a5,-24(s0)
40001f90:	fff78793          	addi	a5,a5,-1
40001f94:	fef42423          	sw	a5,-24(s0)
40001f98:	fe842703          	lw	a4,-24(s0)
40001f9c:	fec42783          	lw	a5,-20(s0)
40001fa0:	fcf75ce3          	bge	a4,a5,40001f78 <print32bit+0x80>
    	}
    }
    for(int j=7;j>=0;j--)
40001fa4:	00700793          	li	a5,7
40001fa8:	fef42223          	sw	a5,-28(s0)
40001fac:	02c0006f          	j	40001fd8 <print32bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40001fb0:	fe442783          	lw	a5,-28(s0)
40001fb4:	ff040713          	addi	a4,s0,-16
40001fb8:	00f707b3          	add	a5,a4,a5
40001fbc:	fec7c783          	lbu	a5,-20(a5)
40001fc0:	00078593          	mv	a1,a5
40001fc4:	f0010537          	lui	a0,0xf0010
40001fc8:	c75ff0ef          	jal	ra,40001c3c <uart_write>
    for(int j=7;j>=0;j--)
40001fcc:	fe442783          	lw	a5,-28(s0)
40001fd0:	fff78793          	addi	a5,a5,-1
40001fd4:	fef42223          	sw	a5,-28(s0)
40001fd8:	fe442783          	lw	a5,-28(s0)
40001fdc:	fc07dae3          	bgez	a5,40001fb0 <print32bit+0xb8>
    }
    print(" ");
40001fe0:	400037b7          	lui	a5,0x40003
40001fe4:	c4478513          	addi	a0,a5,-956 # 40002c44 <vga_simRes_h160_v120+0x20>
40001fe8:	db1ff0ef          	jal	ra,40001d98 <print>
}
40001fec:	00000013          	nop
40001ff0:	03c12083          	lw	ra,60(sp)
40001ff4:	03812403          	lw	s0,56(sp)
40001ff8:	04010113          	addi	sp,sp,64
40001ffc:	00008067          	ret

40002000 <print64bit>:

void print64bit(char *message,uint32_t *num)
{
40002000:	fe010113          	addi	sp,sp,-32
40002004:	00112e23          	sw	ra,28(sp)
40002008:	00812c23          	sw	s0,24(sp)
4000200c:	02010413          	addi	s0,sp,32
40002010:	fea42623          	sw	a0,-20(s0)
40002014:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002018:	400037b7          	lui	a5,0x40003
4000201c:	c5c78513          	addi	a0,a5,-932 # 40002c5c <vga_simRes_h160_v120+0x38>
40002020:	d79ff0ef          	jal	ra,40001d98 <print>
	print(message);
40002024:	fec42503          	lw	a0,-20(s0)
40002028:	d71ff0ef          	jal	ra,40001d98 <print>
	print32bit(num[1]);
4000202c:	fe842783          	lw	a5,-24(s0)
40002030:	00478793          	addi	a5,a5,4
40002034:	0007a783          	lw	a5,0(a5)
40002038:	00078513          	mv	a0,a5
4000203c:	ebdff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[0]);
40002040:	fe842783          	lw	a5,-24(s0)
40002044:	0007a783          	lw	a5,0(a5)
40002048:	00078513          	mv	a0,a5
4000204c:	eadff0ef          	jal	ra,40001ef8 <print32bit>
	print("\r\n");
40002050:	400037b7          	lui	a5,0x40003
40002054:	c6078513          	addi	a0,a5,-928 # 40002c60 <vga_simRes_h160_v120+0x3c>
40002058:	d41ff0ef          	jal	ra,40001d98 <print>
}
4000205c:	00000013          	nop
40002060:	01c12083          	lw	ra,28(sp)
40002064:	01812403          	lw	s0,24(sp)
40002068:	02010113          	addi	sp,sp,32
4000206c:	00008067          	ret

40002070 <print128bit>:
void print128bit(char *message, uint32_t *num)
{
40002070:	fe010113          	addi	sp,sp,-32
40002074:	00112e23          	sw	ra,28(sp)
40002078:	00812c23          	sw	s0,24(sp)
4000207c:	02010413          	addi	s0,sp,32
40002080:	fea42623          	sw	a0,-20(s0)
40002084:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002088:	400037b7          	lui	a5,0x40003
4000208c:	c5c78513          	addi	a0,a5,-932 # 40002c5c <vga_simRes_h160_v120+0x38>
40002090:	d09ff0ef          	jal	ra,40001d98 <print>
	print(message);
40002094:	fec42503          	lw	a0,-20(s0)
40002098:	d01ff0ef          	jal	ra,40001d98 <print>
	print32bit(num[3]);
4000209c:	fe842783          	lw	a5,-24(s0)
400020a0:	00c78793          	addi	a5,a5,12
400020a4:	0007a783          	lw	a5,0(a5)
400020a8:	00078513          	mv	a0,a5
400020ac:	e4dff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[2]);
400020b0:	fe842783          	lw	a5,-24(s0)
400020b4:	00878793          	addi	a5,a5,8
400020b8:	0007a783          	lw	a5,0(a5)
400020bc:	00078513          	mv	a0,a5
400020c0:	e39ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[1]);
400020c4:	fe842783          	lw	a5,-24(s0)
400020c8:	00478793          	addi	a5,a5,4
400020cc:	0007a783          	lw	a5,0(a5)
400020d0:	00078513          	mv	a0,a5
400020d4:	e25ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[0]);
400020d8:	fe842783          	lw	a5,-24(s0)
400020dc:	0007a783          	lw	a5,0(a5)
400020e0:	00078513          	mv	a0,a5
400020e4:	e15ff0ef          	jal	ra,40001ef8 <print32bit>
	print("\r\n");
400020e8:	400037b7          	lui	a5,0x40003
400020ec:	c6078513          	addi	a0,a5,-928 # 40002c60 <vga_simRes_h160_v120+0x3c>
400020f0:	ca9ff0ef          	jal	ra,40001d98 <print>
}
400020f4:	00000013          	nop
400020f8:	01c12083          	lw	ra,28(sp)
400020fc:	01812403          	lw	s0,24(sp)
40002100:	02010113          	addi	sp,sp,32
40002104:	00008067          	ret

40002108 <print80bit>:
void print80bit(char *message,uint32_t *num)
{
40002108:	fe010113          	addi	sp,sp,-32
4000210c:	00112e23          	sw	ra,28(sp)
40002110:	00812c23          	sw	s0,24(sp)
40002114:	02010413          	addi	s0,sp,32
40002118:	fea42623          	sw	a0,-20(s0)
4000211c:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002120:	400037b7          	lui	a5,0x40003
40002124:	c5c78513          	addi	a0,a5,-932 # 40002c5c <vga_simRes_h160_v120+0x38>
40002128:	c71ff0ef          	jal	ra,40001d98 <print>
	print(message);
4000212c:	fec42503          	lw	a0,-20(s0)
40002130:	c69ff0ef          	jal	ra,40001d98 <print>
	print32bit(num[2]);
40002134:	fe842783          	lw	a5,-24(s0)
40002138:	00878793          	addi	a5,a5,8
4000213c:	0007a783          	lw	a5,0(a5)
40002140:	00078513          	mv	a0,a5
40002144:	db5ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[1]);
40002148:	fe842783          	lw	a5,-24(s0)
4000214c:	00478793          	addi	a5,a5,4
40002150:	0007a783          	lw	a5,0(a5)
40002154:	00078513          	mv	a0,a5
40002158:	da1ff0ef          	jal	ra,40001ef8 <print32bit>
	print16bit(num[0]);
4000215c:	fe842783          	lw	a5,-24(s0)
40002160:	0007a783          	lw	a5,0(a5)
40002164:	00078513          	mv	a0,a5
40002168:	c89ff0ef          	jal	ra,40001df0 <print16bit>
	print("\r\n");
4000216c:	400037b7          	lui	a5,0x40003
40002170:	c6078513          	addi	a0,a5,-928 # 40002c60 <vga_simRes_h160_v120+0x3c>
40002174:	c25ff0ef          	jal	ra,40001d98 <print>
}
40002178:	00000013          	nop
4000217c:	01c12083          	lw	ra,28(sp)
40002180:	01812403          	lw	s0,24(sp)
40002184:	02010113          	addi	sp,sp,32
40002188:	00008067          	ret

4000218c <print256bit>:
void print256bit(char *message, uint32_t *num)
{
4000218c:	fe010113          	addi	sp,sp,-32
40002190:	00112e23          	sw	ra,28(sp)
40002194:	00812c23          	sw	s0,24(sp)
40002198:	02010413          	addi	s0,sp,32
4000219c:	fea42623          	sw	a0,-20(s0)
400021a0:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
400021a4:	400037b7          	lui	a5,0x40003
400021a8:	c5c78513          	addi	a0,a5,-932 # 40002c5c <vga_simRes_h160_v120+0x38>
400021ac:	bedff0ef          	jal	ra,40001d98 <print>
	print(message);
400021b0:	fec42503          	lw	a0,-20(s0)
400021b4:	be5ff0ef          	jal	ra,40001d98 <print>
	print32bit(num[7]);
400021b8:	fe842783          	lw	a5,-24(s0)
400021bc:	01c78793          	addi	a5,a5,28
400021c0:	0007a783          	lw	a5,0(a5)
400021c4:	00078513          	mv	a0,a5
400021c8:	d31ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[6]);
400021cc:	fe842783          	lw	a5,-24(s0)
400021d0:	01878793          	addi	a5,a5,24
400021d4:	0007a783          	lw	a5,0(a5)
400021d8:	00078513          	mv	a0,a5
400021dc:	d1dff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[5]);
400021e0:	fe842783          	lw	a5,-24(s0)
400021e4:	01478793          	addi	a5,a5,20
400021e8:	0007a783          	lw	a5,0(a5)
400021ec:	00078513          	mv	a0,a5
400021f0:	d09ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[4]);
400021f4:	fe842783          	lw	a5,-24(s0)
400021f8:	01078793          	addi	a5,a5,16
400021fc:	0007a783          	lw	a5,0(a5)
40002200:	00078513          	mv	a0,a5
40002204:	cf5ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[3]);
40002208:	fe842783          	lw	a5,-24(s0)
4000220c:	00c78793          	addi	a5,a5,12
40002210:	0007a783          	lw	a5,0(a5)
40002214:	00078513          	mv	a0,a5
40002218:	ce1ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[2]);
4000221c:	fe842783          	lw	a5,-24(s0)
40002220:	00878793          	addi	a5,a5,8
40002224:	0007a783          	lw	a5,0(a5)
40002228:	00078513          	mv	a0,a5
4000222c:	ccdff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[1]);
40002230:	fe842783          	lw	a5,-24(s0)
40002234:	00478793          	addi	a5,a5,4
40002238:	0007a783          	lw	a5,0(a5)
4000223c:	00078513          	mv	a0,a5
40002240:	cb9ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[0]);
40002244:	fe842783          	lw	a5,-24(s0)
40002248:	0007a783          	lw	a5,0(a5)
4000224c:	00078513          	mv	a0,a5
40002250:	ca9ff0ef          	jal	ra,40001ef8 <print32bit>
	print("\r\n");
40002254:	400037b7          	lui	a5,0x40003
40002258:	c6078513          	addi	a0,a5,-928 # 40002c60 <vga_simRes_h160_v120+0x3c>
4000225c:	b3dff0ef          	jal	ra,40001d98 <print>
}
40002260:	00000013          	nop
40002264:	01c12083          	lw	ra,28(sp)
40002268:	01812403          	lw	s0,24(sp)
4000226c:	02010113          	addi	sp,sp,32
40002270:	00008067          	ret

40002274 <print512bit>:
void print512bit (char *message, uint32_t *num)
{
40002274:	fe010113          	addi	sp,sp,-32
40002278:	00112e23          	sw	ra,28(sp)
4000227c:	00812c23          	sw	s0,24(sp)
40002280:	02010413          	addi	s0,sp,32
40002284:	fea42623          	sw	a0,-20(s0)
40002288:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
4000228c:	400037b7          	lui	a5,0x40003
40002290:	c5c78513          	addi	a0,a5,-932 # 40002c5c <vga_simRes_h160_v120+0x38>
40002294:	b05ff0ef          	jal	ra,40001d98 <print>
	print(message);
40002298:	fec42503          	lw	a0,-20(s0)
4000229c:	afdff0ef          	jal	ra,40001d98 <print>
	print32bit(num[15]);
400022a0:	fe842783          	lw	a5,-24(s0)
400022a4:	03c78793          	addi	a5,a5,60
400022a8:	0007a783          	lw	a5,0(a5)
400022ac:	00078513          	mv	a0,a5
400022b0:	c49ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[14]);
400022b4:	fe842783          	lw	a5,-24(s0)
400022b8:	03878793          	addi	a5,a5,56
400022bc:	0007a783          	lw	a5,0(a5)
400022c0:	00078513          	mv	a0,a5
400022c4:	c35ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[13]);
400022c8:	fe842783          	lw	a5,-24(s0)
400022cc:	03478793          	addi	a5,a5,52
400022d0:	0007a783          	lw	a5,0(a5)
400022d4:	00078513          	mv	a0,a5
400022d8:	c21ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[12]);
400022dc:	fe842783          	lw	a5,-24(s0)
400022e0:	03078793          	addi	a5,a5,48
400022e4:	0007a783          	lw	a5,0(a5)
400022e8:	00078513          	mv	a0,a5
400022ec:	c0dff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[11]);
400022f0:	fe842783          	lw	a5,-24(s0)
400022f4:	02c78793          	addi	a5,a5,44
400022f8:	0007a783          	lw	a5,0(a5)
400022fc:	00078513          	mv	a0,a5
40002300:	bf9ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[10]);
40002304:	fe842783          	lw	a5,-24(s0)
40002308:	02878793          	addi	a5,a5,40
4000230c:	0007a783          	lw	a5,0(a5)
40002310:	00078513          	mv	a0,a5
40002314:	be5ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[9]);
40002318:	fe842783          	lw	a5,-24(s0)
4000231c:	02478793          	addi	a5,a5,36
40002320:	0007a783          	lw	a5,0(a5)
40002324:	00078513          	mv	a0,a5
40002328:	bd1ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[8]);
4000232c:	fe842783          	lw	a5,-24(s0)
40002330:	02078793          	addi	a5,a5,32
40002334:	0007a783          	lw	a5,0(a5)
40002338:	00078513          	mv	a0,a5
4000233c:	bbdff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[7]);
40002340:	fe842783          	lw	a5,-24(s0)
40002344:	01c78793          	addi	a5,a5,28
40002348:	0007a783          	lw	a5,0(a5)
4000234c:	00078513          	mv	a0,a5
40002350:	ba9ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[6]);
40002354:	fe842783          	lw	a5,-24(s0)
40002358:	01878793          	addi	a5,a5,24
4000235c:	0007a783          	lw	a5,0(a5)
40002360:	00078513          	mv	a0,a5
40002364:	b95ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[5]);
40002368:	fe842783          	lw	a5,-24(s0)
4000236c:	01478793          	addi	a5,a5,20
40002370:	0007a783          	lw	a5,0(a5)
40002374:	00078513          	mv	a0,a5
40002378:	b81ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[4]);
4000237c:	fe842783          	lw	a5,-24(s0)
40002380:	01078793          	addi	a5,a5,16
40002384:	0007a783          	lw	a5,0(a5)
40002388:	00078513          	mv	a0,a5
4000238c:	b6dff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[3]);
40002390:	fe842783          	lw	a5,-24(s0)
40002394:	00c78793          	addi	a5,a5,12
40002398:	0007a783          	lw	a5,0(a5)
4000239c:	00078513          	mv	a0,a5
400023a0:	b59ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[2]);
400023a4:	fe842783          	lw	a5,-24(s0)
400023a8:	00878793          	addi	a5,a5,8
400023ac:	0007a783          	lw	a5,0(a5)
400023b0:	00078513          	mv	a0,a5
400023b4:	b45ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[1]);
400023b8:	fe842783          	lw	a5,-24(s0)
400023bc:	00478793          	addi	a5,a5,4
400023c0:	0007a783          	lw	a5,0(a5)
400023c4:	00078513          	mv	a0,a5
400023c8:	b31ff0ef          	jal	ra,40001ef8 <print32bit>
	print32bit(num[0]);
400023cc:	fe842783          	lw	a5,-24(s0)
400023d0:	0007a783          	lw	a5,0(a5)
400023d4:	00078513          	mv	a0,a5
400023d8:	b21ff0ef          	jal	ra,40001ef8 <print32bit>
	print("\r\n");
400023dc:	400037b7          	lui	a5,0x40003
400023e0:	c6078513          	addi	a0,a5,-928 # 40002c60 <vga_simRes_h160_v120+0x3c>
400023e4:	9b5ff0ef          	jal	ra,40001d98 <print>
}
400023e8:	00000013          	nop
400023ec:	01c12083          	lw	ra,28(sp)
400023f0:	01812403          	lw	s0,24(sp)
400023f4:	02010113          	addi	sp,sp,32
400023f8:	00008067          	ret
