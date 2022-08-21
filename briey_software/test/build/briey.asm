
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
80000068:	488080e7          	jalr	1160(ra) # 400014ec <irqCallback>
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
800000b4:	c0004197          	auipc	gp,0xc0004
800000b8:	5ac18193          	addi	gp,gp,1452 # 40004660 <__global_pointer$>
800000bc:	00001117          	auipc	sp,0x1
800000c0:	88410113          	addi	sp,sp,-1916 # 80000940 <_stack_start>

800000c4 <bss_init>:
800000c4:	c0004517          	auipc	a0,0xc0004
800000c8:	d9c50513          	addi	a0,a0,-612 # 40003e60 <_bss_end>
800000cc:	c0004597          	auipc	a1,0xc0004
800000d0:	d9458593          	addi	a1,a1,-620 # 40003e60 <_bss_end>

800000d4 <bss_loop>:
800000d4:	00b50863          	beq	a0,a1,800000e4 <bss_done>
800000d8:	00052023          	sw	zero,0(a0)
800000dc:	00450513          	addi	a0,a0,4
800000e0:	ff5ff06f          	j	800000d4 <bss_loop>

800000e4 <bss_done>:
800000e4:	c0004517          	auipc	a0,0xc0004
800000e8:	d7850513          	addi	a0,a0,-648 # 40003e5c <_ctors_end>
800000ec:	ffc10113          	addi	sp,sp,-4

800000f0 <ctors_loop>:
800000f0:	c0004597          	auipc	a1,0xc0004
800000f4:	d6c58593          	addi	a1,a1,-660 # 40003e5c <_ctors_end>
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
80000134:	bf4080e7          	jalr	-1036(ra) # 40000d24 <main>

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
	print("\r\t==================================CHACHA20 CIPHER=========================================\r\n");
40000344:	400037b7          	lui	a5,0x40003
40000348:	18078513          	addi	a0,a5,384 # 40003180 <vga_simRes_h160_v120+0x20>
4000034c:	665010ef          	jal	ra,400021b0 <print>
	print("\r\n");
40000350:	400037b7          	lui	a5,0x40003
40000354:	1e078513          	addi	a0,a5,480 # 400031e0 <vga_simRes_h160_v120+0x80>
40000358:	659010ef          	jal	ra,400021b0 <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
4000035c:	fe442583          	lw	a1,-28(s0)
40000360:	400037b7          	lui	a5,0x40003
40000364:	1e478513          	addi	a0,a5,484 # 400031e4 <vga_simRes_h160_v120+0x84>
40000368:	0b0020ef          	jal	ra,40002418 <print64bit>
	chacha_write(key[7],CHACHA_ADDR_KEY_BASE);
4000036c:	fe842783          	lw	a5,-24(s0)
40000370:	01c78793          	addi	a5,a5,28
40000374:	0007a783          	lw	a5,0(a5)
40000378:	01000593          	li	a1,16
4000037c:	00078513          	mv	a0,a5
40000380:	ebdff0ef          	jal	ra,4000023c <chacha_write>
	chacha_write(key[6],CHACHA_ADDR_KEY_BASE+1);
40000384:	fe842783          	lw	a5,-24(s0)
40000388:	01878793          	addi	a5,a5,24
4000038c:	0007a783          	lw	a5,0(a5)
40000390:	01100593          	li	a1,17
40000394:	00078513          	mv	a0,a5
40000398:	ea5ff0ef          	jal	ra,4000023c <chacha_write>
	chacha_write(key[5],CHACHA_ADDR_KEY_BASE+2);
4000039c:	fe842783          	lw	a5,-24(s0)
400003a0:	01478793          	addi	a5,a5,20
400003a4:	0007a783          	lw	a5,0(a5)
400003a8:	01200593          	li	a1,18
400003ac:	00078513          	mv	a0,a5
400003b0:	e8dff0ef          	jal	ra,4000023c <chacha_write>
	chacha_write(key[4],CHACHA_ADDR_KEY_BASE+3);
400003b4:	fe842783          	lw	a5,-24(s0)
400003b8:	01078793          	addi	a5,a5,16
400003bc:	0007a783          	lw	a5,0(a5)
400003c0:	01300593          	li	a1,19
400003c4:	00078513          	mv	a0,a5
400003c8:	e75ff0ef          	jal	ra,4000023c <chacha_write>
	chacha_write(key[3],CHACHA_ADDR_KEY_BASE+4);
400003cc:	fe842783          	lw	a5,-24(s0)
400003d0:	00c78793          	addi	a5,a5,12
400003d4:	0007a783          	lw	a5,0(a5)
400003d8:	01400593          	li	a1,20
400003dc:	00078513          	mv	a0,a5
400003e0:	e5dff0ef          	jal	ra,4000023c <chacha_write>
	chacha_write(key[2],CHACHA_ADDR_KEY_BASE+5);
400003e4:	fe842783          	lw	a5,-24(s0)
400003e8:	00878793          	addi	a5,a5,8
400003ec:	0007a783          	lw	a5,0(a5)
400003f0:	01500593          	li	a1,21
400003f4:	00078513          	mv	a0,a5
400003f8:	e45ff0ef          	jal	ra,4000023c <chacha_write>
	chacha_write(key[1],CHACHA_ADDR_KEY_BASE+6);
400003fc:	fe842783          	lw	a5,-24(s0)
40000400:	00478793          	addi	a5,a5,4
40000404:	0007a783          	lw	a5,0(a5)
40000408:	01600593          	li	a1,22
4000040c:	00078513          	mv	a0,a5
40000410:	e2dff0ef          	jal	ra,4000023c <chacha_write>
	chacha_write(key[0],CHACHA_ADDR_KEY_BASE+7);
40000414:	fe842783          	lw	a5,-24(s0)
40000418:	0007a783          	lw	a5,0(a5)
4000041c:	01700593          	li	a1,23
40000420:	00078513          	mv	a0,a5
40000424:	e19ff0ef          	jal	ra,4000023c <chacha_write>

	chacha_write(block[1],CHACHA_ADDR_BLOCK_BASE);
40000428:	fe442783          	lw	a5,-28(s0)
4000042c:	00478793          	addi	a5,a5,4
40000430:	0007a783          	lw	a5,0(a5)
40000434:	02000593          	li	a1,32
40000438:	00078513          	mv	a0,a5
4000043c:	e01ff0ef          	jal	ra,4000023c <chacha_write>
	chacha_write(block[0],CHACHA_ADDR_BLOCK_BASE+1);
40000440:	fe442783          	lw	a5,-28(s0)
40000444:	0007a783          	lw	a5,0(a5)
40000448:	02100593          	li	a1,33
4000044c:	00078513          	mv	a0,a5
40000450:	dedff0ef          	jal	ra,4000023c <chacha_write>

	chacha_write(key_length,CHACHA_ADDR_KEYLEN);
40000454:	fef44783          	lbu	a5,-17(s0)
40000458:	00a00593          	li	a1,10
4000045c:	00078513          	mv	a0,a5
40000460:	dddff0ef          	jal	ra,4000023c <chacha_write>


	chacha_write(rounds,CHACHA_ADDR_ROUNDS);
40000464:	00b00593          	li	a1,11
40000468:	fe042503          	lw	a0,-32(s0)
4000046c:	dd1ff0ef          	jal	ra,4000023c <chacha_write>

	chacha_write(0x1,CHACHA_ADDR_CTRL);
40000470:	00800593          	li	a1,8
40000474:	00100513          	li	a0,1
40000478:	dc5ff0ef          	jal	ra,4000023c <chacha_write>

	while (chacha_read(CHACHA_ADDR_STATUS)==0);
4000047c:	00000013          	nop
40000480:	00900513          	li	a0,9
40000484:	e29ff0ef          	jal	ra,400002ac <chacha_read>
40000488:	00050793          	mv	a5,a0
4000048c:	fe078ae3          	beqz	a5,40000480 <chacha_cipher+0x168>

	res[15] = chacha_read(CHACHA_ADDR_RESULT_BASE);
40000490:	fdc42783          	lw	a5,-36(s0)
40000494:	03c78493          	addi	s1,a5,60
40000498:	08000513          	li	a0,128
4000049c:	e11ff0ef          	jal	ra,400002ac <chacha_read>
400004a0:	00050793          	mv	a5,a0
400004a4:	00f4a023          	sw	a5,0(s1)
	res[14] = chacha_read(CHACHA_ADDR_RESULT_BASE + 1);
400004a8:	fdc42783          	lw	a5,-36(s0)
400004ac:	03878493          	addi	s1,a5,56
400004b0:	08100513          	li	a0,129
400004b4:	df9ff0ef          	jal	ra,400002ac <chacha_read>
400004b8:	00050793          	mv	a5,a0
400004bc:	00f4a023          	sw	a5,0(s1)
	res[13] = chacha_read(CHACHA_ADDR_RESULT_BASE + 2);
400004c0:	fdc42783          	lw	a5,-36(s0)
400004c4:	03478493          	addi	s1,a5,52
400004c8:	08200513          	li	a0,130
400004cc:	de1ff0ef          	jal	ra,400002ac <chacha_read>
400004d0:	00050793          	mv	a5,a0
400004d4:	00f4a023          	sw	a5,0(s1)
	res[12] = chacha_read(CHACHA_ADDR_RESULT_BASE + 3);
400004d8:	fdc42783          	lw	a5,-36(s0)
400004dc:	03078493          	addi	s1,a5,48
400004e0:	08300513          	li	a0,131
400004e4:	dc9ff0ef          	jal	ra,400002ac <chacha_read>
400004e8:	00050793          	mv	a5,a0
400004ec:	00f4a023          	sw	a5,0(s1)
	res[11] = chacha_read(CHACHA_ADDR_RESULT_BASE + 4);
400004f0:	fdc42783          	lw	a5,-36(s0)
400004f4:	02c78493          	addi	s1,a5,44
400004f8:	08400513          	li	a0,132
400004fc:	db1ff0ef          	jal	ra,400002ac <chacha_read>
40000500:	00050793          	mv	a5,a0
40000504:	00f4a023          	sw	a5,0(s1)
	res[10] = chacha_read(CHACHA_ADDR_RESULT_BASE + 5);
40000508:	fdc42783          	lw	a5,-36(s0)
4000050c:	02878493          	addi	s1,a5,40
40000510:	08500513          	li	a0,133
40000514:	d99ff0ef          	jal	ra,400002ac <chacha_read>
40000518:	00050793          	mv	a5,a0
4000051c:	00f4a023          	sw	a5,0(s1)
	res[9] = chacha_read(CHACHA_ADDR_RESULT_BASE + 6);
40000520:	fdc42783          	lw	a5,-36(s0)
40000524:	02478493          	addi	s1,a5,36
40000528:	08600513          	li	a0,134
4000052c:	d81ff0ef          	jal	ra,400002ac <chacha_read>
40000530:	00050793          	mv	a5,a0
40000534:	00f4a023          	sw	a5,0(s1)
	res[8] = chacha_read(CHACHA_ADDR_RESULT_BASE + 7);
40000538:	fdc42783          	lw	a5,-36(s0)
4000053c:	02078493          	addi	s1,a5,32
40000540:	08700513          	li	a0,135
40000544:	d69ff0ef          	jal	ra,400002ac <chacha_read>
40000548:	00050793          	mv	a5,a0
4000054c:	00f4a023          	sw	a5,0(s1)
	res[7] = chacha_read(CHACHA_ADDR_RESULT_BASE + 8);
40000550:	fdc42783          	lw	a5,-36(s0)
40000554:	01c78493          	addi	s1,a5,28
40000558:	08800513          	li	a0,136
4000055c:	d51ff0ef          	jal	ra,400002ac <chacha_read>
40000560:	00050793          	mv	a5,a0
40000564:	00f4a023          	sw	a5,0(s1)
	res[6] = chacha_read(CHACHA_ADDR_RESULT_BASE + 9);
40000568:	fdc42783          	lw	a5,-36(s0)
4000056c:	01878493          	addi	s1,a5,24
40000570:	08900513          	li	a0,137
40000574:	d39ff0ef          	jal	ra,400002ac <chacha_read>
40000578:	00050793          	mv	a5,a0
4000057c:	00f4a023          	sw	a5,0(s1)
	res[5] = chacha_read(CHACHA_ADDR_RESULT_BASE + 10);
40000580:	fdc42783          	lw	a5,-36(s0)
40000584:	01478493          	addi	s1,a5,20
40000588:	08a00513          	li	a0,138
4000058c:	d21ff0ef          	jal	ra,400002ac <chacha_read>
40000590:	00050793          	mv	a5,a0
40000594:	00f4a023          	sw	a5,0(s1)
	res[4] = chacha_read(CHACHA_ADDR_RESULT_BASE + 11);
40000598:	fdc42783          	lw	a5,-36(s0)
4000059c:	01078493          	addi	s1,a5,16
400005a0:	08b00513          	li	a0,139
400005a4:	d09ff0ef          	jal	ra,400002ac <chacha_read>
400005a8:	00050793          	mv	a5,a0
400005ac:	00f4a023          	sw	a5,0(s1)
	res[3] = chacha_read(CHACHA_ADDR_RESULT_BASE + 12);
400005b0:	fdc42783          	lw	a5,-36(s0)
400005b4:	00c78493          	addi	s1,a5,12
400005b8:	08c00513          	li	a0,140
400005bc:	cf1ff0ef          	jal	ra,400002ac <chacha_read>
400005c0:	00050793          	mv	a5,a0
400005c4:	00f4a023          	sw	a5,0(s1)
	res[2] = chacha_read(CHACHA_ADDR_RESULT_BASE + 13);
400005c8:	fdc42783          	lw	a5,-36(s0)
400005cc:	00878493          	addi	s1,a5,8
400005d0:	08d00513          	li	a0,141
400005d4:	cd9ff0ef          	jal	ra,400002ac <chacha_read>
400005d8:	00050793          	mv	a5,a0
400005dc:	00f4a023          	sw	a5,0(s1)
	res[1] = chacha_read(CHACHA_ADDR_RESULT_BASE + 14);
400005e0:	fdc42783          	lw	a5,-36(s0)
400005e4:	00478493          	addi	s1,a5,4
400005e8:	08e00513          	li	a0,142
400005ec:	cc1ff0ef          	jal	ra,400002ac <chacha_read>
400005f0:	00050793          	mv	a5,a0
400005f4:	00f4a023          	sw	a5,0(s1)
	res[0] = chacha_read(CHACHA_ADDR_RESULT_BASE + 15);
400005f8:	08f00513          	li	a0,143
400005fc:	cb1ff0ef          	jal	ra,400002ac <chacha_read>
40000600:	00050713          	mv	a4,a0
40000604:	fdc42783          	lw	a5,-36(s0)
40000608:	00e7a023          	sw	a4,0(a5)


	print256bit("KEY (128/256-bit): ", key);
4000060c:	fe842583          	lw	a1,-24(s0)
40000610:	400037b7          	lui	a5,0x40003
40000614:	20078513          	addi	a0,a5,512 # 40003200 <vga_simRes_h160_v120+0xa0>
40000618:	78d010ef          	jal	ra,400025a4 <print256bit>
	print512bit("RESULT (512-bit) : ", res);
4000061c:	fdc42583          	lw	a1,-36(s0)
40000620:	400037b7          	lui	a5,0x40003
40000624:	21478513          	addi	a0,a5,532 # 40003214 <vga_simRes_h160_v120+0xb4>
40000628:	064020ef          	jal	ra,4000268c <print512bit>
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
40000a44:	400037b7          	lui	a5,0x40003
40000a48:	28878513          	addi	a0,a5,648 # 40003288 <vga_simRes_h160_v120+0x20>
40000a4c:	764010ef          	jal	ra,400021b0 <print>
40000a50:	0100006f          	j	40000a60 <prince_cipher+0x12c>
40000a54:	400037b7          	lui	a5,0x40003
40000a58:	2dc78513          	addi	a0,a5,732 # 400032dc <vga_simRes_h160_v120+0x74>
40000a5c:	754010ef          	jal	ra,400021b0 <print>
40000a60:	400037b7          	lui	a5,0x40003
40000a64:	33078513          	addi	a0,a5,816 # 40003330 <vga_simRes_h160_v120+0xc8>
40000a68:	748010ef          	jal	ra,400021b0 <print>
40000a6c:	fe442583          	lw	a1,-28(s0)
40000a70:	400037b7          	lui	a5,0x40003
40000a74:	33478513          	addi	a0,a5,820 # 40003334 <vga_simRes_h160_v120+0xcc>
40000a78:	1a1010ef          	jal	ra,40002418 <print64bit>
40000a7c:	fe842583          	lw	a1,-24(s0)
40000a80:	400037b7          	lui	a5,0x40003
40000a84:	34c78513          	addi	a0,a5,844 # 4000334c <vga_simRes_h160_v120+0xe4>
40000a88:	201010ef          	jal	ra,40002488 <print128bit>
40000a8c:	fe042583          	lw	a1,-32(s0)
40000a90:	400037b7          	lui	a5,0x40003
40000a94:	36078513          	addi	a0,a5,864 # 40003360 <vga_simRes_h160_v120+0xf8>
40000a98:	181010ef          	jal	ra,40002418 <print64bit>
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

40000cf0 <resetBlock>:
#include <stdint.h>
#include <stdlib.h>
#include <briey.h>

void resetBlock(uint32_t *block)
{
40000cf0:	fe010113          	addi	sp,sp,-32
40000cf4:	00812e23          	sw	s0,28(sp)
40000cf8:	02010413          	addi	s0,sp,32
40000cfc:	fea42623          	sw	a0,-20(s0)
	block[1]=0;
40000d00:	fec42783          	lw	a5,-20(s0)
40000d04:	00478793          	addi	a5,a5,4
40000d08:	0007a023          	sw	zero,0(a5)
	block[0]=0;
40000d0c:	fec42783          	lw	a5,-20(s0)
40000d10:	0007a023          	sw	zero,0(a5)
}
40000d14:	00000013          	nop
40000d18:	01c12403          	lw	s0,28(sp)
40000d1c:	02010113          	addi	sp,sp,32
40000d20:	00008067          	ret

40000d24 <main>:
int main() {
40000d24:	f0010113          	addi	sp,sp,-256
40000d28:	0e112e23          	sw	ra,252(sp)
40000d2c:	0e812c23          	sw	s0,248(sp)
40000d30:	10010413          	addi	s0,sp,256
	Uart_Config uartConfig;
	uartConfig.dataLength = 8;
40000d34:	00800793          	li	a5,8
40000d38:	fef42023          	sw	a5,-32(s0)
	uartConfig.parity = NONE;
40000d3c:	fe042223          	sw	zero,-28(s0)
	uartConfig.stop = ONE;
40000d40:	fe042423          	sw	zero,-24(s0)
	uartConfig.clockDivider = (CORE_HZ / 8 / 115200) - 1;
40000d44:	03500793          	li	a5,53
40000d48:	fef42623          	sw	a5,-20(s0)
	uart_applyConfig(UART,&uartConfig);
40000d4c:	fe040793          	addi	a5,s0,-32
40000d50:	00078593          	mv	a1,a5
40000d54:	f0010537          	lui	a0,0xf0010
40000d58:	e89ff0ef          	jal	ra,40000be0 <uart_applyConfig>

	//POLY1305
	print("\r\n");
40000d5c:	400037b7          	lui	a5,0x40003
40000d60:	3d478513          	addi	a0,a5,980 # 400033d4 <vga_simRes_h160_v120+0x20>
40000d64:	44c010ef          	jal	ra,400021b0 <print>
	print("\r\t*****************************************POLY1305 TEST************************************\r\n");
40000d68:	400037b7          	lui	a5,0x40003
40000d6c:	3d878513          	addi	a0,a5,984 # 400033d8 <vga_simRes_h160_v120+0x24>
40000d70:	440010ef          	jal	ra,400021b0 <print>
	uint32_t poly_key[8] 	= {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
40000d74:	fc042023          	sw	zero,-64(s0)
40000d78:	fc042223          	sw	zero,-60(s0)
40000d7c:	fc042423          	sw	zero,-56(s0)
40000d80:	fc042623          	sw	zero,-52(s0)
40000d84:	fc042823          	sw	zero,-48(s0)
40000d88:	fc042a23          	sw	zero,-44(s0)
40000d8c:	fc042c23          	sw	zero,-40(s0)
40000d90:	fc042e23          	sw	zero,-36(s0)
	uint32_t poly_block[4] 	= {0x0, 0x0,0x0,0x0};
40000d94:	fa042823          	sw	zero,-80(s0)
40000d98:	fa042a23          	sw	zero,-76(s0)
40000d9c:	fa042c23          	sw	zero,-72(s0)
40000da0:	fa042e23          	sw	zero,-68(s0)
	uint32_t poly_res[4] 	= {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
40000da4:	fa042023          	sw	zero,-96(s0)
40000da8:	fa042223          	sw	zero,-92(s0)
40000dac:	fa042423          	sw	zero,-88(s0)
40000db0:	fa042623          	sw	zero,-84(s0)
	print("\r\n\t==========================================TEST 1==========================================\r\n");
40000db4:	400037b7          	lui	a5,0x40003
40000db8:	43878513          	addi	a0,a5,1080 # 40003438 <vga_simRes_h160_v120+0x84>
40000dbc:	3f4010ef          	jal	ra,400021b0 <print>
	//key 85d6be78 57556d33 7f4452fe 42d506a8 0103808a fb0db2fd 4abff6af 4149f51b
	//0 bytes message
	//res expec: h0103808a fb0db2fd 4abff6af 4149f51b
	poly_key[7]= 0x85d6be78;
40000dc0:	85d6c7b7          	lui	a5,0x85d6c
40000dc4:	e7878793          	addi	a5,a5,-392 # 85d6be78 <_stack_start+0x5d6b538>
40000dc8:	fcf42e23          	sw	a5,-36(s0)
	poly_key[6]= 0x57556d33;
40000dcc:	575577b7          	lui	a5,0x57557
40000dd0:	d3378793          	addi	a5,a5,-717 # 57556d33 <__global_pointer$+0x175526d3>
40000dd4:	fcf42c23          	sw	a5,-40(s0)
	poly_key[5]= 0x7f4452fe;
40000dd8:	7f4457b7          	lui	a5,0x7f445
40000ddc:	2fe78793          	addi	a5,a5,766 # 7f4452fe <__global_pointer$+0x3f440c9e>
40000de0:	fcf42a23          	sw	a5,-44(s0)
	poly_key[4]= 0x42d506a8;
40000de4:	42d507b7          	lui	a5,0x42d50
40000de8:	6a878793          	addi	a5,a5,1704 # 42d506a8 <__global_pointer$+0x2d4c048>
40000dec:	fcf42823          	sw	a5,-48(s0)
	poly_key[3]= 0x0103808a;
40000df0:	010387b7          	lui	a5,0x1038
40000df4:	08a78793          	addi	a5,a5,138 # 103808a <_stack_size+0x103788a>
40000df8:	fcf42623          	sw	a5,-52(s0)
	poly_key[2]= 0xfb0db2fd;
40000dfc:	fb0db7b7          	lui	a5,0xfb0db
40000e00:	2fd78793          	addi	a5,a5,765 # fb0db2fd <_stack_start+0x7b0da9bd>
40000e04:	fcf42423          	sw	a5,-56(s0)
	poly_key[1]= 0x4abff6af;
40000e08:	4abff7b7          	lui	a5,0x4abff
40000e0c:	6af78793          	addi	a5,a5,1711 # 4abff6af <__global_pointer$+0xabfb04f>
40000e10:	fcf42223          	sw	a5,-60(s0)
	poly_key[0]= 0x4149f51b;
40000e14:	4149f7b7          	lui	a5,0x4149f
40000e18:	51b78793          	addi	a5,a5,1307 # 4149f51b <__global_pointer$+0x149aebb>
40000e1c:	fcf42023          	sw	a5,-64(s0)

	poly_test_N_bytes(0,poly_key,poly_block,poly_res);
40000e20:	fa040693          	addi	a3,s0,-96
40000e24:	fb040713          	addi	a4,s0,-80
40000e28:	fc040793          	addi	a5,s0,-64
40000e2c:	00070613          	mv	a2,a4
40000e30:	00078593          	mv	a1,a5
40000e34:	00000513          	li	a0,0
40000e38:	781010ef          	jal	ra,40002db8 <poly_test_N_bytes>
	print("\r\n\t==========================================TEST 2==========================================\r\n");
40000e3c:	400037b7          	lui	a5,0x40003
40000e40:	49878513          	addi	a0,a5,1176 # 40003498 <vga_simRes_h160_v120+0xe4>
40000e44:	36c010ef          	jal	ra,400021b0 <print>
	poly_block[3] = 0x31000000;
40000e48:	310007b7          	lui	a5,0x31000
40000e4c:	faf42e23          	sw	a5,-68(s0)
	//USE THE SAME KEY
	//res expec: h8097ddf5_19b7f412_0b57fabf_925a19ac
	//1 byte message: 31
	poly_test_N_bytes(1,poly_key,poly_block,poly_res);
40000e50:	fa040693          	addi	a3,s0,-96
40000e54:	fb040713          	addi	a4,s0,-80
40000e58:	fc040793          	addi	a5,s0,-64
40000e5c:	00070613          	mv	a2,a4
40000e60:	00078593          	mv	a1,a5
40000e64:	00100513          	li	a0,1
40000e68:	751010ef          	jal	ra,40002db8 <poly_test_N_bytes>

	print("\r\n\t==========================================TEST 3==========================================\r\n");
40000e6c:	400037b7          	lui	a5,0x40003
40000e70:	4f878513          	addi	a0,a5,1272 # 400034f8 <vga_simRes_h160_v120+0x144>
40000e74:	33c010ef          	jal	ra,400021b0 <print>
	//res expec: ha8061dc1_305136c6_c22b8baf_0c0127a9
	poly_test_rfc8439();
40000e78:	7cd010ef          	jal	ra,40002e44 <poly_test_rfc8439>

	print("\r\n\t==========================================TEST 4==========================================\r\n");
40000e7c:	400037b7          	lui	a5,0x40003
40000e80:	55878513          	addi	a0,a5,1368 # 40003558 <vga_simRes_h160_v120+0x1a4>
40000e84:	32c010ef          	jal	ra,400021b0 <print>
	//res expec: hdc0964e5 ce9cd7d9 a7571faf a5dc0473
	poly_test_long();
40000e88:	180020ef          	jal	ra,40003008 <poly_test_long>
	//ab
	//CHACHA
	print("\r\n");
40000e8c:	400037b7          	lui	a5,0x40003
40000e90:	3d478513          	addi	a0,a5,980 # 400033d4 <vga_simRes_h160_v120+0x20>
40000e94:	31c010ef          	jal	ra,400021b0 <print>
	print("\r\t*****************************************CHACHA TEST**************************************\r\n");
40000e98:	400037b7          	lui	a5,0x40003
40000e9c:	5b878513          	addi	a0,a5,1464 # 400035b8 <vga_simRes_h160_v120+0x204>
40000ea0:	310010ef          	jal	ra,400021b0 <print>
	uint32_t chacha_key[8] 		= {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
40000ea4:	f8042023          	sw	zero,-128(s0)
40000ea8:	f8042223          	sw	zero,-124(s0)
40000eac:	f8042423          	sw	zero,-120(s0)
40000eb0:	f8042623          	sw	zero,-116(s0)
40000eb4:	f8042823          	sw	zero,-112(s0)
40000eb8:	f8042a23          	sw	zero,-108(s0)
40000ebc:	f8042c23          	sw	zero,-104(s0)
40000ec0:	f8042e23          	sw	zero,-100(s0)
	uint32_t chacha_block[2] 	= {0x0, 0x0};
40000ec4:	f6042c23          	sw	zero,-136(s0)
40000ec8:	f6042e23          	sw	zero,-132(s0)
	uint32_t chacha_res[15] 	= {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
40000ecc:	f2042e23          	sw	zero,-196(s0)
40000ed0:	f4042023          	sw	zero,-192(s0)
40000ed4:	f4042223          	sw	zero,-188(s0)
40000ed8:	f4042423          	sw	zero,-184(s0)
40000edc:	f4042623          	sw	zero,-180(s0)
40000ee0:	f4042823          	sw	zero,-176(s0)
40000ee4:	f4042a23          	sw	zero,-172(s0)
40000ee8:	f4042c23          	sw	zero,-168(s0)
40000eec:	f4042e23          	sw	zero,-164(s0)
40000ef0:	f6042023          	sw	zero,-160(s0)
40000ef4:	f6042223          	sw	zero,-156(s0)
40000ef8:	f6042423          	sw	zero,-152(s0)
40000efc:	f6042623          	sw	zero,-148(s0)
40000f00:	f6042823          	sw	zero,-144(s0)
40000f04:	f6042a23          	sw	zero,-140(s0)
	print("\r\n\t==========================================TEST 1==========================================\r\n");
40000f08:	400037b7          	lui	a5,0x40003
40000f0c:	43878513          	addi	a0,a5,1080 # 40003438 <vga_simRes_h160_v120+0x84>
40000f10:	2a0010ef          	jal	ra,400021b0 <print>
	print("\r\n\t[All zeros, 128-bit key, 8 rounds]\r\n");
40000f14:	400037b7          	lui	a5,0x40003
40000f18:	61878513          	addi	a0,a5,1560 # 40003618 <vga_simRes_h160_v120+0x264>
40000f1c:	294010ef          	jal	ra,400021b0 <print>
	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,8,chacha_res);
40000f20:	f3c40713          	addi	a4,s0,-196
40000f24:	f7840613          	addi	a2,s0,-136
40000f28:	f8040793          	addi	a5,s0,-128
40000f2c:	00800693          	li	a3,8
40000f30:	00078593          	mv	a1,a5
40000f34:	00000513          	li	a0,0
40000f38:	be0ff0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t[All zeros, 128-bit key, 12 rounds]\r\n");
40000f3c:	400037b7          	lui	a5,0x40003
40000f40:	64078513          	addi	a0,a5,1600 # 40003640 <vga_simRes_h160_v120+0x28c>
40000f44:	26c010ef          	jal	ra,400021b0 <print>
	resetBlock(chacha_block);
40000f48:	f7840793          	addi	a5,s0,-136
40000f4c:	00078513          	mv	a0,a5
40000f50:	da1ff0ef          	jal	ra,40000cf0 <resetBlock>
	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,12,chacha_res);
40000f54:	f3c40713          	addi	a4,s0,-196
40000f58:	f7840613          	addi	a2,s0,-136
40000f5c:	f8040793          	addi	a5,s0,-128
40000f60:	00c00693          	li	a3,12
40000f64:	00078593          	mv	a1,a5
40000f68:	00000513          	li	a0,0
40000f6c:	bacff0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t[All zeros, 128-bit key, 20 rounds]\r\n");
40000f70:	400037b7          	lui	a5,0x40003
40000f74:	66c78513          	addi	a0,a5,1644 # 4000366c <vga_simRes_h160_v120+0x2b8>
40000f78:	238010ef          	jal	ra,400021b0 <print>
	resetBlock(chacha_block);
40000f7c:	f7840793          	addi	a5,s0,-136
40000f80:	00078513          	mv	a0,a5
40000f84:	d6dff0ef          	jal	ra,40000cf0 <resetBlock>
	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,20,chacha_res);
40000f88:	f3c40713          	addi	a4,s0,-196
40000f8c:	f7840613          	addi	a2,s0,-136
40000f90:	f8040793          	addi	a5,s0,-128
40000f94:	01400693          	li	a3,20
40000f98:	00078593          	mv	a1,a5
40000f9c:	00000513          	li	a0,0
40000fa0:	b78ff0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t[All zeros, 256-bit key, 8 rounds]\r\n");
40000fa4:	400037b7          	lui	a5,0x40003
40000fa8:	69878513          	addi	a0,a5,1688 # 40003698 <vga_simRes_h160_v120+0x2e4>
40000fac:	204010ef          	jal	ra,400021b0 <print>
	resetBlock(chacha_block);
40000fb0:	f7840793          	addi	a5,s0,-136
40000fb4:	00078513          	mv	a0,a5
40000fb8:	d39ff0ef          	jal	ra,40000cf0 <resetBlock>
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,8,chacha_res);
40000fbc:	f3c40713          	addi	a4,s0,-196
40000fc0:	f7840613          	addi	a2,s0,-136
40000fc4:	f8040793          	addi	a5,s0,-128
40000fc8:	00800693          	li	a3,8
40000fcc:	00078593          	mv	a1,a5
40000fd0:	00100513          	li	a0,1
40000fd4:	b44ff0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t[All zeros, 256-bit key, 12 rounds]\r\n");
40000fd8:	400037b7          	lui	a5,0x40003
40000fdc:	6c078513          	addi	a0,a5,1728 # 400036c0 <vga_simRes_h160_v120+0x30c>
40000fe0:	1d0010ef          	jal	ra,400021b0 <print>
	resetBlock(chacha_block);
40000fe4:	f7840793          	addi	a5,s0,-136
40000fe8:	00078513          	mv	a0,a5
40000fec:	d05ff0ef          	jal	ra,40000cf0 <resetBlock>
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,12,chacha_res);
40000ff0:	f3c40713          	addi	a4,s0,-196
40000ff4:	f7840613          	addi	a2,s0,-136
40000ff8:	f8040793          	addi	a5,s0,-128
40000ffc:	00c00693          	li	a3,12
40001000:	00078593          	mv	a1,a5
40001004:	00100513          	li	a0,1
40001008:	b10ff0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t[All zeros, 256-bit key, 20 rounds]\r\n");
4000100c:	400037b7          	lui	a5,0x40003
40001010:	6ec78513          	addi	a0,a5,1772 # 400036ec <vga_simRes_h160_v120+0x338>
40001014:	19c010ef          	jal	ra,400021b0 <print>
	resetBlock(chacha_block);
40001018:	f7840793          	addi	a5,s0,-136
4000101c:	00078513          	mv	a0,a5
40001020:	cd1ff0ef          	jal	ra,40000cf0 <resetBlock>
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,20,chacha_res);
40001024:	f3c40713          	addi	a4,s0,-196
40001028:	f7840613          	addi	a2,s0,-136
4000102c:	f8040793          	addi	a5,s0,-128
40001030:	01400693          	li	a3,20
40001034:	00078593          	mv	a1,a5
40001038:	00100513          	li	a0,1
4000103c:	adcff0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t==========================================TEST 2==========================================\r\n");
40001040:	400037b7          	lui	a5,0x40003
40001044:	49878513          	addi	a0,a5,1176 # 40003498 <vga_simRes_h160_v120+0xe4>
40001048:	168010ef          	jal	ra,400021b0 <print>
	print("\r\n\t[256-bit key, 8 rounds]\r\n");
4000104c:	400037b7          	lui	a5,0x40003
40001050:	71878513          	addi	a0,a5,1816 # 40003718 <vga_simRes_h160_v120+0x364>
40001054:	15c010ef          	jal	ra,400021b0 <print>
	chacha_block[1]=0x0f1e2d3c;
40001058:	0f1e37b7          	lui	a5,0xf1e3
4000105c:	d3c78793          	addi	a5,a5,-708 # f1e2d3c <_stack_size+0xf1e253c>
40001060:	f6f42e23          	sw	a5,-132(s0)
	chacha_block[0]=0x4b596877;
40001064:	4b5977b7          	lui	a5,0x4b597
40001068:	87778793          	addi	a5,a5,-1929 # 4b596877 <__global_pointer$+0xb592217>
4000106c:	f6f42c23          	sw	a5,-136(s0)

	chacha_key[7]=	0x00112233;
40001070:	001127b7          	lui	a5,0x112
40001074:	23378793          	addi	a5,a5,563 # 112233 <_stack_size+0x111a33>
40001078:	f8f42e23          	sw	a5,-100(s0)
	chacha_key[6]=	0x44556677;
4000107c:	445567b7          	lui	a5,0x44556
40001080:	67778793          	addi	a5,a5,1655 # 44556677 <__global_pointer$+0x4552017>
40001084:	f8f42c23          	sw	a5,-104(s0)
	chacha_key[5]=	0x8899aabb;
40001088:	8899b7b7          	lui	a5,0x8899b
4000108c:	abb78793          	addi	a5,a5,-1349 # 8899aabb <_stack_start+0x899a17b>
40001090:	f8f42a23          	sw	a5,-108(s0)
	chacha_key[4]=	0xccddeeff;
40001094:	ccddf7b7          	lui	a5,0xccddf
40001098:	eff78793          	addi	a5,a5,-257 # ccddeeff <_stack_start+0x4cdde5bf>
4000109c:	f8f42823          	sw	a5,-112(s0)
	chacha_key[3]=	0xffeeddcc;
400010a0:	ffeee7b7          	lui	a5,0xffeee
400010a4:	dcc78793          	addi	a5,a5,-564 # ffeeddcc <_stack_start+0x7feed48c>
400010a8:	f8f42623          	sw	a5,-116(s0)
	chacha_key[2]=	0xbbaa9988;
400010ac:	bbaaa7b7          	lui	a5,0xbbaaa
400010b0:	98878793          	addi	a5,a5,-1656 # bbaa9988 <_stack_start+0x3baa9048>
400010b4:	f8f42423          	sw	a5,-120(s0)
	chacha_key[1]=	0x77665544;
400010b8:	776657b7          	lui	a5,0x77665
400010bc:	54478793          	addi	a5,a5,1348 # 77665544 <__global_pointer$+0x37660ee4>
400010c0:	f8f42223          	sw	a5,-124(s0)
	chacha_key[0]= 	0x33221100;
400010c4:	332217b7          	lui	a5,0x33221
400010c8:	10078793          	addi	a5,a5,256 # 33221100 <_stack_size+0x33220900>
400010cc:	f8f42023          	sw	a5,-128(s0)

	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,8,chacha_res);
400010d0:	f3c40713          	addi	a4,s0,-196
400010d4:	f7840613          	addi	a2,s0,-136
400010d8:	f8040793          	addi	a5,s0,-128
400010dc:	00800693          	li	a3,8
400010e0:	00078593          	mv	a1,a5
400010e4:	00100513          	li	a0,1
400010e8:	a30ff0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t==========================================TEST 3==========================================\r\n");
400010ec:	400037b7          	lui	a5,0x40003
400010f0:	4f878513          	addi	a0,a5,1272 # 400034f8 <vga_simRes_h160_v120+0x144>
400010f4:	0bc010ef          	jal	ra,400021b0 <print>
	print("\r\n\t[All bits in key and IV are set. 128 bit key, 8 rounds]\r\n");
400010f8:	400037b7          	lui	a5,0x40003
400010fc:	73878513          	addi	a0,a5,1848 # 40003738 <vga_simRes_h160_v120+0x384>
40001100:	0b0010ef          	jal	ra,400021b0 <print>
	//h2204d5b81ce662193e00966034f91302f14a3fb047f58b6e6ef0d721132304163e0fb640d76ff9c3b9cd99996e6e38fad13f0e31c82244d33abbc1b11e8bf12d
	chacha_block[1]=0xffffffff;
40001104:	fff00793          	li	a5,-1
40001108:	f6f42e23          	sw	a5,-132(s0)
	chacha_block[0]=0xffffffff;
4000110c:	fff00793          	li	a5,-1
40001110:	f6f42c23          	sw	a5,-136(s0)

	chacha_key[7]=	0xffffffff;
40001114:	fff00793          	li	a5,-1
40001118:	f8f42e23          	sw	a5,-100(s0)
	chacha_key[6]=	0xffffffff;
4000111c:	fff00793          	li	a5,-1
40001120:	f8f42c23          	sw	a5,-104(s0)
	chacha_key[5]=	0xffffffff;
40001124:	fff00793          	li	a5,-1
40001128:	f8f42a23          	sw	a5,-108(s0)
	chacha_key[4]=	0xffffffff;
4000112c:	fff00793          	li	a5,-1
40001130:	f8f42823          	sw	a5,-112(s0)
	chacha_key[3]=	0xffffffff;
40001134:	fff00793          	li	a5,-1
40001138:	f8f42623          	sw	a5,-116(s0)
	chacha_key[2]=	0xffffffff;
4000113c:	fff00793          	li	a5,-1
40001140:	f8f42423          	sw	a5,-120(s0)
	chacha_key[1]=	0xffffffff;
40001144:	fff00793          	li	a5,-1
40001148:	f8f42223          	sw	a5,-124(s0)
	chacha_key[0]= 	0xffffffff;
4000114c:	fff00793          	li	a5,-1
40001150:	f8f42023          	sw	a5,-128(s0)

	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,8,chacha_res);
40001154:	f3c40713          	addi	a4,s0,-196
40001158:	f7840613          	addi	a2,s0,-136
4000115c:	f8040793          	addi	a5,s0,-128
40001160:	00800693          	li	a3,8
40001164:	00078593          	mv	a1,a5
40001168:	00000513          	li	a0,0
4000116c:	9acff0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t==========================================TEST 4==========================================\r\n");
40001170:	400037b7          	lui	a5,0x40003
40001174:	55878513          	addi	a0,a5,1368 # 40003558 <vga_simRes_h160_v120+0x1a4>
40001178:	038010ef          	jal	ra,400021b0 <print>
	//128-bit key
	//ha7a6c81bd8ac106e8f3a46a1bc8ec702e95d18c7e0f424519aeafb54471d83a2bf888861586b73d228eaaf82f9665a5a155e867f93731bfbe24fab495590b231
	chacha_block[1]=0x0f1e2d3c;
4000117c:	0f1e37b7          	lui	a5,0xf1e3
40001180:	d3c78793          	addi	a5,a5,-708 # f1e2d3c <_stack_size+0xf1e253c>
40001184:	f6f42e23          	sw	a5,-132(s0)
	chacha_block[0]=0x4b596877;
40001188:	4b5977b7          	lui	a5,0x4b597
4000118c:	87778793          	addi	a5,a5,-1929 # 4b596877 <__global_pointer$+0xb592217>
40001190:	f6f42c23          	sw	a5,-136(s0)
	chacha_key[7]=	0x00112233;
40001194:	001127b7          	lui	a5,0x112
40001198:	23378793          	addi	a5,a5,563 # 112233 <_stack_size+0x111a33>
4000119c:	f8f42e23          	sw	a5,-100(s0)
	chacha_key[6]=	0x44556677;
400011a0:	445567b7          	lui	a5,0x44556
400011a4:	67778793          	addi	a5,a5,1655 # 44556677 <__global_pointer$+0x4552017>
400011a8:	f8f42c23          	sw	a5,-104(s0)
	chacha_key[5]=	0x8899aabb;
400011ac:	8899b7b7          	lui	a5,0x8899b
400011b0:	abb78793          	addi	a5,a5,-1349 # 8899aabb <_stack_start+0x899a17b>
400011b4:	f8f42a23          	sw	a5,-108(s0)
	chacha_key[4]=	0xccddeeff;
400011b8:	ccddf7b7          	lui	a5,0xccddf
400011bc:	eff78793          	addi	a5,a5,-257 # ccddeeff <_stack_start+0x4cdde5bf>
400011c0:	f8f42823          	sw	a5,-112(s0)
	chacha_key[3]=	0x0;
400011c4:	f8042623          	sw	zero,-116(s0)
	chacha_key[2]=	0x0;
400011c8:	f8042423          	sw	zero,-120(s0)
	chacha_key[1]=	0x0;
400011cc:	f8042223          	sw	zero,-124(s0)
	chacha_key[0]= 	0x0;
400011d0:	f8042023          	sw	zero,-128(s0)

	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,8,chacha_res);
400011d4:	f3c40713          	addi	a4,s0,-196
400011d8:	f7840613          	addi	a2,s0,-136
400011dc:	f8040793          	addi	a5,s0,-128
400011e0:	00800693          	li	a3,8
400011e4:	00078593          	mv	a1,a5
400011e8:	00000513          	li	a0,0
400011ec:	92cff0ef          	jal	ra,40000318 <chacha_cipher>

//PRINCE
	print("\r\t**********************************PRINCE TEST*******************************\r\n");
400011f0:	400037b7          	lui	a5,0x40003
400011f4:	77878513          	addi	a0,a5,1912 # 40003778 <vga_simRes_h160_v120+0x3c4>
400011f8:	7b9000ef          	jal	ra,400021b0 <print>
	uint32_t prince_key[4] 		= {0x0, 0x0, 0x0, 0x0};
400011fc:	f2042623          	sw	zero,-212(s0)
40001200:	f2042823          	sw	zero,-208(s0)
40001204:	f2042a23          	sw	zero,-204(s0)
40001208:	f2042c23          	sw	zero,-200(s0)
	uint32_t prince_block[2] 		= {0x0, 0x0};
4000120c:	f2042223          	sw	zero,-220(s0)
40001210:	f2042423          	sw	zero,-216(s0)
	uint32_t prince_res[2] 	= {0x0,0x0};
40001214:	f0042e23          	sw	zero,-228(s0)
40001218:	f2042023          	sw	zero,-224(s0)
	print("\r\n\t===================================TEST 1===================================\r\n");
4000121c:	400037b7          	lui	a5,0x40003
40001220:	7cc78513          	addi	a0,a5,1996 # 400037cc <vga_simRes_h160_v120+0x418>
40001224:	78d000ef          	jal	ra,400021b0 <print>

	prince_block[1] 	= 0x69c4e0d8;
40001228:	69c4e7b7          	lui	a5,0x69c4e
4000122c:	0d878793          	addi	a5,a5,216 # 69c4e0d8 <__global_pointer$+0x29c49a78>
40001230:	f2f42423          	sw	a5,-216(s0)
	prince_block[0] 	= 0x6a7b0430;
40001234:	6a7b07b7          	lui	a5,0x6a7b0
40001238:	43078793          	addi	a5,a5,1072 # 6a7b0430 <__global_pointer$+0x2a7abdd0>
4000123c:	f2f42223          	sw	a5,-220(s0)

	prince_key[3]		= 0xd8cdb780;
40001240:	d8cdb7b7          	lui	a5,0xd8cdb
40001244:	78078793          	addi	a5,a5,1920 # d8cdb780 <_stack_start+0x58cdae40>
40001248:	f2f42c23          	sw	a5,-200(s0)
	prince_key[2]		= 0x70b4c55a;
4000124c:	70b4c7b7          	lui	a5,0x70b4c
40001250:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b47efa>
40001254:	f2f42a23          	sw	a5,-204(s0)
	prince_key[1]		= 0x818665aa;
40001258:	818667b7          	lui	a5,0x81866
4000125c:	5aa78793          	addi	a5,a5,1450 # 818665aa <_stack_start+0x1865c6a>
40001260:	f2f42823          	sw	a5,-208(s0)
	prince_key[0]		= 0x0d02dfda;
40001264:	0d02e7b7          	lui	a5,0xd02e
40001268:	fda78793          	addi	a5,a5,-38 # d02dfda <_stack_size+0xd02d7da>
4000126c:	f2f42623          	sw	a5,-212(s0)

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
40001270:	f1c40693          	addi	a3,s0,-228
40001274:	f2440713          	addi	a4,s0,-220
40001278:	f2c40793          	addi	a5,s0,-212
4000127c:	00070613          	mv	a2,a4
40001280:	00078593          	mv	a1,a5
40001284:	00100513          	li	a0,1
40001288:	eacff0ef          	jal	ra,40000934 <prince_cipher>

	print("\r\n\t===================================TEST 2===================================\r\n");
4000128c:	400047b7          	lui	a5,0x40004
40001290:	82078513          	addi	a0,a5,-2016 # 40003820 <vga_simRes_h160_v120+0x46c>
40001294:	71d000ef          	jal	ra,400021b0 <print>

	prince_block[1] 	= 0x43c6b256;
40001298:	43c6b7b7          	lui	a5,0x43c6b
4000129c:	25678793          	addi	a5,a5,598 # 43c6b256 <__global_pointer$+0x3c66bf6>
400012a0:	f2f42423          	sw	a5,-216(s0)
	prince_block[0] 	= 0xd79de7e8;
400012a4:	d79de7b7          	lui	a5,0xd79de
400012a8:	7e878793          	addi	a5,a5,2024 # d79de7e8 <_stack_start+0x579ddea8>
400012ac:	f2f42223          	sw	a5,-220(s0)

	//USE THE SAME KEY

	prince_cipher(PRINCE_OP_DE,prince_key,prince_block,prince_res);
400012b0:	f1c40693          	addi	a3,s0,-228
400012b4:	f2440713          	addi	a4,s0,-220
400012b8:	f2c40793          	addi	a5,s0,-212
400012bc:	00070613          	mv	a2,a4
400012c0:	00078593          	mv	a1,a5
400012c4:	00000513          	li	a0,0
400012c8:	e6cff0ef          	jal	ra,40000934 <prince_cipher>
//PRESENT
 	print("\r\n");
400012cc:	400037b7          	lui	a5,0x40003
400012d0:	3d478513          	addi	a0,a5,980 # 400033d4 <vga_simRes_h160_v120+0x20>
400012d4:	6dd000ef          	jal	ra,400021b0 <print>
	print("\r\t******************************PRESENT TEST**********************************\r\n");
400012d8:	400047b7          	lui	a5,0x40004
400012dc:	87478513          	addi	a0,a5,-1932 # 40003874 <vga_simRes_h160_v120+0x4c0>
400012e0:	6d1000ef          	jal	ra,400021b0 <print>
	unsigned int present_key[3] = {0x0, 0x0, 0x0};
400012e4:	f0042823          	sw	zero,-240(s0)
400012e8:	f0042a23          	sw	zero,-236(s0)
400012ec:	f0042c23          	sw	zero,-232(s0)
	unsigned int present_block[2] 	= {0x0, 0x0};
400012f0:	f0042423          	sw	zero,-248(s0)
400012f4:	f0042623          	sw	zero,-244(s0)
	unsigned int present_res[2] 	= {0x0, 0x0};
400012f8:	f0042023          	sw	zero,-256(s0)
400012fc:	f0042223          	sw	zero,-252(s0)

	print("\r\n\t==================================TEST 1====================================\r\n");
40001300:	400047b7          	lui	a5,0x40004
40001304:	8c878513          	addi	a0,a5,-1848 # 400038c8 <vga_simRes_h160_v120+0x514>
40001308:	6a9000ef          	jal	ra,400021b0 <print>

	present_block[1]=0x4c746e67;
4000130c:	4c7477b7          	lui	a5,0x4c747
40001310:	e6778793          	addi	a5,a5,-409 # 4c746e67 <__global_pointer$+0xc742807>
40001314:	f0f42623          	sw	a5,-244(s0)
	present_block[0]=0x7579656e;
40001318:	757967b7          	lui	a5,0x75796
4000131c:	56e78793          	addi	a5,a5,1390 # 7579656e <__global_pointer$+0x35791f0e>
40001320:	f0f42423          	sw	a5,-248(s0)

	present_key[2] = 0x46657465;
40001324:	466577b7          	lui	a5,0x46657
40001328:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6652e05>
4000132c:	f0f42c23          	sw	a5,-232(s0)
	present_key[1] = 0x6c48636d;
40001330:	6c4867b7          	lui	a5,0x6c486
40001334:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c481d0d>
40001338:	f0f42a23          	sw	a5,-236(s0)
	present_key[0] = 0x7573;
4000133c:	000077b7          	lui	a5,0x7
40001340:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
40001344:	f0f42823          	sw	a5,-240(s0)

	present_cipher(PRESENT_OP_EN,present_key,present_block,present_res);
40001348:	f0040693          	addi	a3,s0,-256
4000134c:	f0840713          	addi	a4,s0,-248
40001350:	f1040793          	addi	a5,s0,-240
40001354:	00070613          	mv	a2,a4
40001358:	00078593          	mv	a1,a5
4000135c:	00000513          	li	a0,0
40001360:	4dc000ef          	jal	ra,4000183c <present_cipher>

	print("\r\n\t==================================TEST 2====================================\r\n");
40001364:	400047b7          	lui	a5,0x40004
40001368:	91c78513          	addi	a0,a5,-1764 # 4000391c <vga_simRes_h160_v120+0x568>
4000136c:	645000ef          	jal	ra,400021b0 <print>

	present_block[1]=0x0e1d00d4;
40001370:	0e1d07b7          	lui	a5,0xe1d0
40001374:	0d478793          	addi	a5,a5,212 # e1d00d4 <_stack_size+0xe1cf8d4>
40001378:	f0f42623          	sw	a5,-244(s0)
	present_block[0]=0xe46ba99c;
4000137c:	e46bb7b7          	lui	a5,0xe46bb
40001380:	99c78793          	addi	a5,a5,-1636 # e46ba99c <_stack_start+0x646ba05c>
40001384:	f0f42423          	sw	a5,-248(s0)

	//USE THE SAME KEY

	present_cipher(PRESENT_OP_DE,present_key,present_block,present_res);
40001388:	f0040693          	addi	a3,s0,-256
4000138c:	f0840713          	addi	a4,s0,-248
40001390:	f1040793          	addi	a5,s0,-240
40001394:	00070613          	mv	a2,a4
40001398:	00078593          	mv	a1,a5
4000139c:	00100513          	li	a0,1
400013a0:	49c000ef          	jal	ra,4000183c <present_cipher>
	//DM_PRESENT
	print("\r\n");
400013a4:	400037b7          	lui	a5,0x40003
400013a8:	3d478513          	addi	a0,a5,980 # 400033d4 <vga_simRes_h160_v120+0x20>
400013ac:	605000ef          	jal	ra,400021b0 <print>
	print("\r\t***************************DM_PRESENT TEST**********************************\r\n");
400013b0:	400047b7          	lui	a5,0x40004
400013b4:	97078513          	addi	a0,a5,-1680 # 40003970 <vga_simRes_h160_v120+0x5bc>
400013b8:	5f9000ef          	jal	ra,400021b0 <print>
	print("\r\n\t==================================TEST 1====================================\r\n");
400013bc:	400047b7          	lui	a5,0x40004
400013c0:	8c878513          	addi	a0,a5,-1848 # 400038c8 <vga_simRes_h160_v120+0x514>
400013c4:	5ed000ef          	jal	ra,400021b0 <print>

	present_block[1]=0x4c746e67;
400013c8:	4c7477b7          	lui	a5,0x4c747
400013cc:	e6778793          	addi	a5,a5,-409 # 4c746e67 <__global_pointer$+0xc742807>
400013d0:	f0f42623          	sw	a5,-244(s0)
	present_block[0]=0x7579656e;
400013d4:	757967b7          	lui	a5,0x75796
400013d8:	56e78793          	addi	a5,a5,1390 # 7579656e <__global_pointer$+0x35791f0e>
400013dc:	f0f42423          	sw	a5,-248(s0)

	present_key[2] = 0x46657465;
400013e0:	466577b7          	lui	a5,0x46657
400013e4:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6652e05>
400013e8:	f0f42c23          	sw	a5,-232(s0)
	present_key[1] = 0x6c48636d;
400013ec:	6c4867b7          	lui	a5,0x6c486
400013f0:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c481d0d>
400013f4:	f0f42a23          	sw	a5,-236(s0)
	present_key[0] = 0x7573;
400013f8:	000077b7          	lui	a5,0x7
400013fc:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
40001400:	f0f42823          	sw	a5,-240(s0)

	//expec: 42696eb3 9112ccf2

	present_hash(present_key,present_block,present_res);
40001404:	f0040693          	addi	a3,s0,-256
40001408:	f0840713          	addi	a4,s0,-248
4000140c:	f1040793          	addi	a5,s0,-240
40001410:	00068613          	mv	a2,a3
40001414:	00070593          	mv	a1,a4
40001418:	00078513          	mv	a0,a5
4000141c:	5ac000ef          	jal	ra,400019c8 <present_hash>

	print("\r\n\t==================================TEST 2====================================\r\n");
40001420:	400047b7          	lui	a5,0x40004
40001424:	91c78513          	addi	a0,a5,-1764 # 4000391c <vga_simRes_h160_v120+0x568>
40001428:	589000ef          	jal	ra,400021b0 <print>

	present_block[1]=0x46657465;
4000142c:	466577b7          	lui	a5,0x46657
40001430:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6652e05>
40001434:	f0f42623          	sw	a5,-244(s0)
	present_block[0]=0x6c5f5553;
40001438:	6c5f57b7          	lui	a5,0x6c5f5
4000143c:	55378793          	addi	a5,a5,1363 # 6c5f5553 <__global_pointer$+0x2c5f0ef3>
40001440:	f0f42423          	sw	a5,-248(s0)

	present_key[2] = 0x00000000;
40001444:	f0042c23          	sw	zero,-232(s0)
	present_key[1] = 0x00000000;
40001448:	f0042a23          	sw	zero,-236(s0)
	present_key[0] = 0x0001;
4000144c:	00100793          	li	a5,1
40001450:	f0f42823          	sw	a5,-240(s0)
	//expec:d52384e3 dcee9ce7
	present_hash(present_key,present_block,present_res);
40001454:	f0040693          	addi	a3,s0,-256
40001458:	f0840713          	addi	a4,s0,-248
4000145c:	f1040793          	addi	a5,s0,-240
40001460:	00068613          	mv	a2,a3
40001464:	00070593          	mv	a1,a4
40001468:	00078513          	mv	a0,a5
4000146c:	55c000ef          	jal	ra,400019c8 <present_hash>
	print("\r\n\t==================================TEST 3====================================\r\n");
40001470:	400047b7          	lui	a5,0x40004
40001474:	9c478513          	addi	a0,a5,-1596 # 400039c4 <vga_simRes_h160_v120+0x610>
40001478:	539000ef          	jal	ra,400021b0 <print>

	present_block[1]=0x31383230;
4000147c:	313837b7          	lui	a5,0x31383
40001480:	23078793          	addi	a5,a5,560 # 31383230 <_stack_size+0x31382a30>
40001484:	f0f42623          	sw	a5,-244(s0)
	present_block[0]=0x30313833;
40001488:	303147b7          	lui	a5,0x30314
4000148c:	83378793          	addi	a5,a5,-1997 # 30313833 <_stack_size+0x30313033>
40001490:	f0f42423          	sw	a5,-248(s0)

	present_key[2] = 0x31383230;
40001494:	313837b7          	lui	a5,0x31383
40001498:	23078793          	addi	a5,a5,560 # 31383230 <_stack_size+0x31382a30>
4000149c:	f0f42c23          	sw	a5,-232(s0)
	present_key[1] = 0x30313833;
400014a0:	303147b7          	lui	a5,0x30314
400014a4:	83378793          	addi	a5,a5,-1997 # 30313833 <_stack_size+0x30313033>
400014a8:	f0f42a23          	sw	a5,-236(s0)
	present_key[0] = 0x5553;
400014ac:	000057b7          	lui	a5,0x5
400014b0:	55378793          	addi	a5,a5,1363 # 5553 <_stack_size+0x4d53>
400014b4:	f0f42823          	sw	a5,-240(s0)
	//expec: 08e11c56 b6d5a592

	present_hash(present_key,present_block,present_res);
400014b8:	f0040693          	addi	a3,s0,-256
400014bc:	f0840713          	addi	a4,s0,-248
400014c0:	f1040793          	addi	a5,s0,-240
400014c4:	00068613          	mv	a2,a3
400014c8:	00070593          	mv	a1,a4
400014cc:	00078513          	mv	a0,a5
400014d0:	4f8000ef          	jal	ra,400019c8 <present_hash>
	return 0;	
400014d4:	00000793          	li	a5,0
}
400014d8:	00078513          	mv	a0,a5
400014dc:	0fc12083          	lw	ra,252(sp)
400014e0:	0f812403          	lw	s0,248(sp)
400014e4:	10010113          	addi	sp,sp,256
400014e8:	00008067          	ret

400014ec <irqCallback>:
void irqCallback(){
400014ec:	ff010113          	addi	sp,sp,-16
400014f0:	00812623          	sw	s0,12(sp)
400014f4:	01010413          	addi	s0,sp,16

}
400014f8:	00000013          	nop
400014fc:	00c12403          	lw	s0,12(sp)
40001500:	01010113          	addi	sp,sp,16
40001504:	00008067          	ret

40001508 <timer_init>:
static void timer_init(Timer_Reg *reg){
40001508:	fe010113          	addi	sp,sp,-32
4000150c:	00812e23          	sw	s0,28(sp)
40001510:	02010413          	addi	s0,sp,32
40001514:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40001518:	fec42783          	lw	a5,-20(s0)
4000151c:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40001520:	fec42783          	lw	a5,-20(s0)
40001524:	0007a423          	sw	zero,8(a5)
}
40001528:	00000013          	nop
4000152c:	01c12403          	lw	s0,28(sp)
40001530:	02010113          	addi	sp,sp,32
40001534:	00008067          	ret

40001538 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001538:	fe010113          	addi	sp,sp,-32
4000153c:	00812e23          	sw	s0,28(sp)
40001540:	02010413          	addi	s0,sp,32
40001544:	fea42623          	sw	a0,-20(s0)
}
40001548:	00000013          	nop
4000154c:	01c12403          	lw	s0,28(sp)
40001550:	02010113          	addi	sp,sp,32
40001554:	00008067          	ret

40001558 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001558:	fe010113          	addi	sp,sp,-32
4000155c:	00812e23          	sw	s0,28(sp)
40001560:	02010413          	addi	s0,sp,32
40001564:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001568:	fec42783          	lw	a5,-20(s0)
4000156c:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001570:	fec42783          	lw	a5,-20(s0)
40001574:	fff00713          	li	a4,-1
40001578:	00e7a023          	sw	a4,0(a5)
}
4000157c:	00000013          	nop
40001580:	01c12403          	lw	s0,28(sp)
40001584:	02010113          	addi	sp,sp,32
40001588:	00008067          	ret

4000158c <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
4000158c:	fe010113          	addi	sp,sp,-32
40001590:	00812e23          	sw	s0,28(sp)
40001594:	02010413          	addi	s0,sp,32
40001598:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
4000159c:	fec42783          	lw	a5,-20(s0)
400015a0:	0047a783          	lw	a5,4(a5)
400015a4:	0107d793          	srli	a5,a5,0x10
400015a8:	0ff7f793          	zext.b	a5,a5
}
400015ac:	00078513          	mv	a0,a5
400015b0:	01c12403          	lw	s0,28(sp)
400015b4:	02010113          	addi	sp,sp,32
400015b8:	00008067          	ret

400015bc <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
400015bc:	fe010113          	addi	sp,sp,-32
400015c0:	00812e23          	sw	s0,28(sp)
400015c4:	02010413          	addi	s0,sp,32
400015c8:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
400015cc:	fec42783          	lw	a5,-20(s0)
400015d0:	0047a783          	lw	a5,4(a5)
400015d4:	0187d793          	srli	a5,a5,0x18
}
400015d8:	00078513          	mv	a0,a5
400015dc:	01c12403          	lw	s0,28(sp)
400015e0:	02010113          	addi	sp,sp,32
400015e4:	00008067          	ret

400015e8 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
400015e8:	fe010113          	addi	sp,sp,-32
400015ec:	00112e23          	sw	ra,28(sp)
400015f0:	00812c23          	sw	s0,24(sp)
400015f4:	02010413          	addi	s0,sp,32
400015f8:	fea42623          	sw	a0,-20(s0)
400015fc:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40001600:	00000013          	nop
40001604:	fec42503          	lw	a0,-20(s0)
40001608:	f85ff0ef          	jal	ra,4000158c <uart_writeAvailability>
4000160c:	00050793          	mv	a5,a0
40001610:	fe078ae3          	beqz	a5,40001604 <uart_write+0x1c>
	reg->DATA = data;
40001614:	fec42783          	lw	a5,-20(s0)
40001618:	fe842703          	lw	a4,-24(s0)
4000161c:	00e7a023          	sw	a4,0(a5)
}
40001620:	00000013          	nop
40001624:	01c12083          	lw	ra,28(sp)
40001628:	01812403          	lw	s0,24(sp)
4000162c:	02010113          	addi	sp,sp,32
40001630:	00008067          	ret

40001634 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001634:	fe010113          	addi	sp,sp,-32
40001638:	00812e23          	sw	s0,28(sp)
4000163c:	02010413          	addi	s0,sp,32
40001640:	fea42623          	sw	a0,-20(s0)
40001644:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001648:	fe842783          	lw	a5,-24(s0)
4000164c:	00c7a703          	lw	a4,12(a5)
40001650:	fec42783          	lw	a5,-20(s0)
40001654:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001658:	fe842783          	lw	a5,-24(s0)
4000165c:	0007a783          	lw	a5,0(a5)
40001660:	fff78713          	addi	a4,a5,-1
40001664:	fe842783          	lw	a5,-24(s0)
40001668:	0047a783          	lw	a5,4(a5)
4000166c:	00879793          	slli	a5,a5,0x8
40001670:	00f76733          	or	a4,a4,a5
40001674:	fe842783          	lw	a5,-24(s0)
40001678:	0087a783          	lw	a5,8(a5)
4000167c:	01079793          	slli	a5,a5,0x10
40001680:	00f76733          	or	a4,a4,a5
40001684:	fec42783          	lw	a5,-20(s0)
40001688:	00e7a623          	sw	a4,12(a5)
}
4000168c:	00000013          	nop
40001690:	01c12403          	lw	s0,28(sp)
40001694:	02010113          	addi	sp,sp,32
40001698:	00008067          	ret

4000169c <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
4000169c:	fe010113          	addi	sp,sp,-32
400016a0:	00812e23          	sw	s0,28(sp)
400016a4:	02010413          	addi	s0,sp,32
400016a8:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
400016ac:	fec42783          	lw	a5,-20(s0)
400016b0:	0007a783          	lw	a5,0(a5)
400016b4:	0027f793          	andi	a5,a5,2
400016b8:	00f037b3          	snez	a5,a5
400016bc:	0ff7f793          	zext.b	a5,a5
}
400016c0:	00078513          	mv	a0,a5
400016c4:	01c12403          	lw	s0,28(sp)
400016c8:	02010113          	addi	sp,sp,32
400016cc:	00008067          	ret

400016d0 <vga_run>:
static void vga_run(Vga_Reg *reg){
400016d0:	fe010113          	addi	sp,sp,-32
400016d4:	00812e23          	sw	s0,28(sp)
400016d8:	02010413          	addi	s0,sp,32
400016dc:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
400016e0:	fec42783          	lw	a5,-20(s0)
400016e4:	00100713          	li	a4,1
400016e8:	00e7a023          	sw	a4,0(a5)
}
400016ec:	00000013          	nop
400016f0:	01c12403          	lw	s0,28(sp)
400016f4:	02010113          	addi	sp,sp,32
400016f8:	00008067          	ret

400016fc <vga_stop>:
static void vga_stop(Vga_Reg *reg){
400016fc:	fe010113          	addi	sp,sp,-32
40001700:	00112e23          	sw	ra,28(sp)
40001704:	00812c23          	sw	s0,24(sp)
40001708:	02010413          	addi	s0,sp,32
4000170c:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40001710:	fec42783          	lw	a5,-20(s0)
40001714:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001718:	00000013          	nop
4000171c:	fec42503          	lw	a0,-20(s0)
40001720:	f7dff0ef          	jal	ra,4000169c <vga_isBusy>
40001724:	00050793          	mv	a5,a0
40001728:	fe079ae3          	bnez	a5,4000171c <vga_stop+0x20>
}
4000172c:	00000013          	nop
40001730:	00000013          	nop
40001734:	01c12083          	lw	ra,28(sp)
40001738:	01812403          	lw	s0,24(sp)
4000173c:	02010113          	addi	sp,sp,32
40001740:	00008067          	ret

40001744 <present_write>:
#include "briey.h"
void present_write(uint32_t iData, uint32_t iAddress)
{
40001744:	fe010113          	addi	sp,sp,-32
40001748:	00812e23          	sw	s0,28(sp)
4000174c:	02010413          	addi	s0,sp,32
40001750:	fea42623          	sw	a0,-20(s0)
40001754:	feb42423          	sw	a1,-24(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
40001758:	f00027b7          	lui	a5,0xf0002
4000175c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001760:	fe842703          	lw	a4,-24(s0)
40001764:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->WRITE_N 		= 0;
40001768:	f00027b7          	lui	a5,0xf0002
4000176c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001770:	0007a223          	sw	zero,4(a5)
	PRESENT_BASE->READ_N 		= 1;
40001774:	f00027b7          	lui	a5,0xf0002
40001778:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000177c:	00100713          	li	a4,1
40001780:	00e7a423          	sw	a4,8(a5)
	PRESENT_BASE->IDATA			= iData;
40001784:	f00027b7          	lui	a5,0xf0002
40001788:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000178c:	fec42703          	lw	a4,-20(s0)
40001790:	00e7a823          	sw	a4,16(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
40001794:	f00027b7          	lui	a5,0xf0002
40001798:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000179c:	0007a023          	sw	zero,0(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
400017a0:	f00027b7          	lui	a5,0xf0002
400017a4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400017a8:	00100713          	li	a4,1
400017ac:	00e7a023          	sw	a4,0(a5)
}
400017b0:	00000013          	nop
400017b4:	01c12403          	lw	s0,28(sp)
400017b8:	02010113          	addi	sp,sp,32
400017bc:	00008067          	ret

400017c0 <present_read>:
uint32_t present_read(uint32_t iAddress)
{
400017c0:	fd010113          	addi	sp,sp,-48
400017c4:	02812623          	sw	s0,44(sp)
400017c8:	03010413          	addi	s0,sp,48
400017cc:	fca42e23          	sw	a0,-36(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
400017d0:	f00027b7          	lui	a5,0xf0002
400017d4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400017d8:	fdc42703          	lw	a4,-36(s0)
400017dc:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->READ_N		= 0;
400017e0:	f00027b7          	lui	a5,0xf0002
400017e4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400017e8:	0007a423          	sw	zero,8(a5)
	PRESENT_BASE->WRITE_N		= 1;
400017ec:	f00027b7          	lui	a5,0xf0002
400017f0:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400017f4:	00100713          	li	a4,1
400017f8:	00e7a223          	sw	a4,4(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
400017fc:	f00027b7          	lui	a5,0xf0002
40001800:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001804:	0007a023          	sw	zero,0(a5)
	uint32_t res 				= PRESENT_BASE->ODATA;
40001808:	f00027b7          	lui	a5,0xf0002
4000180c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001810:	0147a783          	lw	a5,20(a5)
40001814:	fef42623          	sw	a5,-20(s0)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
40001818:	f00027b7          	lui	a5,0xf0002
4000181c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001820:	00100713          	li	a4,1
40001824:	00e7a023          	sw	a4,0(a5)
	return res;
40001828:	fec42783          	lw	a5,-20(s0)
}
4000182c:	00078513          	mv	a0,a5
40001830:	02c12403          	lw	s0,44(sp)
40001834:	03010113          	addi	sp,sp,48
40001838:	00008067          	ret

4000183c <present_cipher>:
void present_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
4000183c:	fe010113          	addi	sp,sp,-32
40001840:	00112e23          	sw	ra,28(sp)
40001844:	00812c23          	sw	s0,24(sp)
40001848:	00912a23          	sw	s1,20(sp)
4000184c:	02010413          	addi	s0,sp,32
40001850:	00050793          	mv	a5,a0
40001854:	feb42423          	sw	a1,-24(s0)
40001858:	fec42223          	sw	a2,-28(s0)
4000185c:	fed42023          	sw	a3,-32(s0)
40001860:	fef407a3          	sb	a5,-17(s0)

	//EN_OR_DE
	if(operation == PRESENT_OP_EN) present_write(PRESENT_OP_EN,PRESENT_ADDR_EN_OR_DE);
40001864:	fef44783          	lbu	a5,-17(s0)
40001868:	00079a63          	bnez	a5,4000187c <present_cipher+0x40>
4000186c:	00800593          	li	a1,8
40001870:	00000513          	li	a0,0
40001874:	ed1ff0ef          	jal	ra,40001744 <present_write>
40001878:	01c0006f          	j	40001894 <present_cipher+0x58>
	else if(operation == PRESENT_OP_DE) present_write(PRESENT_OP_DE,PRESENT_ADDR_EN_OR_DE);
4000187c:	fef44703          	lbu	a4,-17(s0)
40001880:	00100793          	li	a5,1
40001884:	00f71863          	bne	a4,a5,40001894 <present_cipher+0x58>
40001888:	00800593          	li	a1,8
4000188c:	00100513          	li	a0,1
40001890:	eb5ff0ef          	jal	ra,40001744 <present_write>

	//PLAIN_TEXT
	present_write(block[1],PRESENT_ADDR_BLOCK_BASE +1);
40001894:	fe442783          	lw	a5,-28(s0)
40001898:	00478793          	addi	a5,a5,4
4000189c:	0007a783          	lw	a5,0(a5)
400018a0:	00500593          	li	a1,5
400018a4:	00078513          	mv	a0,a5
400018a8:	e9dff0ef          	jal	ra,40001744 <present_write>
	present_write(block[0],PRESENT_ADDR_BLOCK_BASE);
400018ac:	fe442783          	lw	a5,-28(s0)
400018b0:	0007a783          	lw	a5,0(a5)
400018b4:	00400593          	li	a1,4
400018b8:	00078513          	mv	a0,a5
400018bc:	e89ff0ef          	jal	ra,40001744 <present_write>

	//KEY
	present_write(key[2],PRESENT_ADDR_KEY_BASE +2);
400018c0:	fe842783          	lw	a5,-24(s0)
400018c4:	00878793          	addi	a5,a5,8
400018c8:	0007a783          	lw	a5,0(a5)
400018cc:	00300593          	li	a1,3
400018d0:	00078513          	mv	a0,a5
400018d4:	e71ff0ef          	jal	ra,40001744 <present_write>
	present_write(key[1],PRESENT_ADDR_KEY_BASE +1);
400018d8:	fe842783          	lw	a5,-24(s0)
400018dc:	00478793          	addi	a5,a5,4
400018e0:	0007a783          	lw	a5,0(a5)
400018e4:	00200593          	li	a1,2
400018e8:	00078513          	mv	a0,a5
400018ec:	e59ff0ef          	jal	ra,40001744 <present_write>
	present_write(key[0],PRESENT_ADDR_KEY_BASE);
400018f0:	fe842783          	lw	a5,-24(s0)
400018f4:	0007a783          	lw	a5,0(a5)
400018f8:	00100593          	li	a1,1
400018fc:	00078513          	mv	a0,a5
40001900:	e45ff0ef          	jal	ra,40001744 <present_write>

	//START
	present_write(0x1,PRESENT_ADDR_START);
40001904:	00000593          	li	a1,0
40001908:	00100513          	li	a0,1
4000190c:	e39ff0ef          	jal	ra,40001744 <present_write>

	while(present_read(PRESENT_ADDR_RESULT_BASE)==0);
40001910:	00000013          	nop
40001914:	00600513          	li	a0,6
40001918:	ea9ff0ef          	jal	ra,400017c0 <present_read>
4000191c:	00050793          	mv	a5,a0
40001920:	fe078ae3          	beqz	a5,40001914 <present_cipher+0xd8>

	res[1] = present_read(PRESENT_ADDR_RESULT_BASE +1);
40001924:	fe042783          	lw	a5,-32(s0)
40001928:	00478493          	addi	s1,a5,4
4000192c:	00700513          	li	a0,7
40001930:	e91ff0ef          	jal	ra,400017c0 <present_read>
40001934:	00050793          	mv	a5,a0
40001938:	00f4a023          	sw	a5,0(s1)
	res[0] =present_read(PRESENT_ADDR_RESULT_BASE);
4000193c:	00600513          	li	a0,6
40001940:	e81ff0ef          	jal	ra,400017c0 <present_read>
40001944:	00050713          	mv	a4,a0
40001948:	fe042783          	lw	a5,-32(s0)
4000194c:	00e7a023          	sw	a4,0(a5)


    //print result to terminal
	if(operation == PRESENT_OP_EN)
40001950:	fef44783          	lbu	a5,-17(s0)
40001954:	00079a63          	bnez	a5,40001968 <present_cipher+0x12c>
		print("\r\t===========================PRESENT ENCRYPTTION==============================\r\n");
40001958:	400047b7          	lui	a5,0x40004
4000195c:	a7878513          	addi	a0,a5,-1416 # 40003a78 <vga_simRes_h160_v120+0x20>
40001960:	051000ef          	jal	ra,400021b0 <print>
40001964:	0100006f          	j	40001974 <present_cipher+0x138>
	else
		print("\r\t===========================PRESENT DECRYPTTION==============================\r\n");
40001968:	400047b7          	lui	a5,0x40004
4000196c:	acc78513          	addi	a0,a5,-1332 # 40003acc <vga_simRes_h160_v120+0x74>
40001970:	041000ef          	jal	ra,400021b0 <print>
	print("\r\n");
40001974:	400047b7          	lui	a5,0x40004
40001978:	b2078513          	addi	a0,a5,-1248 # 40003b20 <vga_simRes_h160_v120+0xc8>
4000197c:	035000ef          	jal	ra,400021b0 <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
40001980:	fe442583          	lw	a1,-28(s0)
40001984:	400047b7          	lui	a5,0x40004
40001988:	b2478513          	addi	a0,a5,-1244 # 40003b24 <vga_simRes_h160_v120+0xcc>
4000198c:	28d000ef          	jal	ra,40002418 <print64bit>
	print80bit("KEY (80-bit) : ", key);
40001990:	fe842583          	lw	a1,-24(s0)
40001994:	400047b7          	lui	a5,0x40004
40001998:	b4078513          	addi	a0,a5,-1216 # 40003b40 <vga_simRes_h160_v120+0xe8>
4000199c:	385000ef          	jal	ra,40002520 <print80bit>
	print64bit("RESULT (64-bit) : ", res);
400019a0:	fe042583          	lw	a1,-32(s0)
400019a4:	400047b7          	lui	a5,0x40004
400019a8:	b5078513          	addi	a0,a5,-1200 # 40003b50 <vga_simRes_h160_v120+0xf8>
400019ac:	26d000ef          	jal	ra,40002418 <print64bit>
	//print("\r\n============================================================================\r\n");
}
400019b0:	00000013          	nop
400019b4:	01c12083          	lw	ra,28(sp)
400019b8:	01812403          	lw	s0,24(sp)
400019bc:	01412483          	lw	s1,20(sp)
400019c0:	02010113          	addi	sp,sp,32
400019c4:	00008067          	ret

400019c8 <present_hash>:
void present_hash(uint32_t *key, uint32_t *block, uint32_t *res) {
400019c8:	fe010113          	addi	sp,sp,-32
400019cc:	00112e23          	sw	ra,28(sp)
400019d0:	00812c23          	sw	s0,24(sp)
400019d4:	00912a23          	sw	s1,20(sp)
400019d8:	02010413          	addi	s0,sp,32
400019dc:	fea42623          	sw	a0,-20(s0)
400019e0:	feb42423          	sw	a1,-24(s0)
400019e4:	fec42223          	sw	a2,-28(s0)
	//PLAIN_TEXT
		present_write(block[1],PRESENT_ADDR_BLOCK_BASE +1);
400019e8:	fe842783          	lw	a5,-24(s0)
400019ec:	00478793          	addi	a5,a5,4
400019f0:	0007a783          	lw	a5,0(a5)
400019f4:	00500593          	li	a1,5
400019f8:	00078513          	mv	a0,a5
400019fc:	d49ff0ef          	jal	ra,40001744 <present_write>
		present_write(block[0],PRESENT_ADDR_BLOCK_BASE);
40001a00:	fe842783          	lw	a5,-24(s0)
40001a04:	0007a783          	lw	a5,0(a5)
40001a08:	00400593          	li	a1,4
40001a0c:	00078513          	mv	a0,a5
40001a10:	d35ff0ef          	jal	ra,40001744 <present_write>

		//KEY
		present_write(key[2],PRESENT_ADDR_KEY_BASE +2);
40001a14:	fec42783          	lw	a5,-20(s0)
40001a18:	00878793          	addi	a5,a5,8
40001a1c:	0007a783          	lw	a5,0(a5)
40001a20:	00300593          	li	a1,3
40001a24:	00078513          	mv	a0,a5
40001a28:	d1dff0ef          	jal	ra,40001744 <present_write>
		present_write(key[1],PRESENT_ADDR_KEY_BASE +1);
40001a2c:	fec42783          	lw	a5,-20(s0)
40001a30:	00478793          	addi	a5,a5,4
40001a34:	0007a783          	lw	a5,0(a5)
40001a38:	00200593          	li	a1,2
40001a3c:	00078513          	mv	a0,a5
40001a40:	d05ff0ef          	jal	ra,40001744 <present_write>
		present_write(key[0],PRESENT_ADDR_KEY_BASE);
40001a44:	fec42783          	lw	a5,-20(s0)
40001a48:	0007a783          	lw	a5,0(a5)
40001a4c:	00100593          	li	a1,1
40001a50:	00078513          	mv	a0,a5
40001a54:	cf1ff0ef          	jal	ra,40001744 <present_write>

		//START
		present_write(0x1,PRESENT_ADDR_START);
40001a58:	00000593          	li	a1,0
40001a5c:	00100513          	li	a0,1
40001a60:	ce5ff0ef          	jal	ra,40001744 <present_write>

		while(present_read(PRESENT_ADDR_RESULT_HASH_BASE)==0);
40001a64:	00000013          	nop
40001a68:	00900513          	li	a0,9
40001a6c:	d55ff0ef          	jal	ra,400017c0 <present_read>
40001a70:	00050793          	mv	a5,a0
40001a74:	fe078ae3          	beqz	a5,40001a68 <present_hash+0xa0>

		res[1] = present_read(PRESENT_ADDR_RESULT_HASH_BASE +1);
40001a78:	fe442783          	lw	a5,-28(s0)
40001a7c:	00478493          	addi	s1,a5,4
40001a80:	00a00513          	li	a0,10
40001a84:	d3dff0ef          	jal	ra,400017c0 <present_read>
40001a88:	00050793          	mv	a5,a0
40001a8c:	00f4a023          	sw	a5,0(s1)
		res[0] =present_read(PRESENT_ADDR_RESULT_HASH_BASE);
40001a90:	00900513          	li	a0,9
40001a94:	d2dff0ef          	jal	ra,400017c0 <present_read>
40001a98:	00050713          	mv	a4,a0
40001a9c:	fe442783          	lw	a5,-28(s0)
40001aa0:	00e7a023          	sw	a4,0(a5)

		print("\r\t===========================DM_PRESENT HASH==================================\r\n");
40001aa4:	400047b7          	lui	a5,0x40004
40001aa8:	b6478513          	addi	a0,a5,-1180 # 40003b64 <vga_simRes_h160_v120+0x10c>
40001aac:	704000ef          	jal	ra,400021b0 <print>
		print("\r\n");
40001ab0:	400047b7          	lui	a5,0x40004
40001ab4:	b2078513          	addi	a0,a5,-1248 # 40003b20 <vga_simRes_h160_v120+0xc8>
40001ab8:	6f8000ef          	jal	ra,400021b0 <print>
		print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
40001abc:	fe842583          	lw	a1,-24(s0)
40001ac0:	400047b7          	lui	a5,0x40004
40001ac4:	b2478513          	addi	a0,a5,-1244 # 40003b24 <vga_simRes_h160_v120+0xcc>
40001ac8:	151000ef          	jal	ra,40002418 <print64bit>
		print80bit("KEY (80-bit) : ", key);
40001acc:	fec42583          	lw	a1,-20(s0)
40001ad0:	400047b7          	lui	a5,0x40004
40001ad4:	b4078513          	addi	a0,a5,-1216 # 40003b40 <vga_simRes_h160_v120+0xe8>
40001ad8:	249000ef          	jal	ra,40002520 <print80bit>
		print64bit("RESULT (64-bit) : ", res);
40001adc:	fe442583          	lw	a1,-28(s0)
40001ae0:	400047b7          	lui	a5,0x40004
40001ae4:	b5078513          	addi	a0,a5,-1200 # 40003b50 <vga_simRes_h160_v120+0xf8>
40001ae8:	131000ef          	jal	ra,40002418 <print64bit>
}
40001aec:	00000013          	nop
40001af0:	01c12083          	lw	ra,28(sp)
40001af4:	01812403          	lw	s0,24(sp)
40001af8:	01412483          	lw	s1,20(sp)
40001afc:	02010113          	addi	sp,sp,32
40001b00:	00008067          	ret

40001b04 <timer_init>:
static void timer_init(Timer_Reg *reg){
40001b04:	fe010113          	addi	sp,sp,-32
40001b08:	00812e23          	sw	s0,28(sp)
40001b0c:	02010413          	addi	s0,sp,32
40001b10:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40001b14:	fec42783          	lw	a5,-20(s0)
40001b18:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40001b1c:	fec42783          	lw	a5,-20(s0)
40001b20:	0007a423          	sw	zero,8(a5)
}
40001b24:	00000013          	nop
40001b28:	01c12403          	lw	s0,28(sp)
40001b2c:	02010113          	addi	sp,sp,32
40001b30:	00008067          	ret

40001b34 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001b34:	fe010113          	addi	sp,sp,-32
40001b38:	00812e23          	sw	s0,28(sp)
40001b3c:	02010413          	addi	s0,sp,32
40001b40:	fea42623          	sw	a0,-20(s0)
}
40001b44:	00000013          	nop
40001b48:	01c12403          	lw	s0,28(sp)
40001b4c:	02010113          	addi	sp,sp,32
40001b50:	00008067          	ret

40001b54 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001b54:	fe010113          	addi	sp,sp,-32
40001b58:	00812e23          	sw	s0,28(sp)
40001b5c:	02010413          	addi	s0,sp,32
40001b60:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001b64:	fec42783          	lw	a5,-20(s0)
40001b68:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001b6c:	fec42783          	lw	a5,-20(s0)
40001b70:	fff00713          	li	a4,-1
40001b74:	00e7a023          	sw	a4,0(a5)
}
40001b78:	00000013          	nop
40001b7c:	01c12403          	lw	s0,28(sp)
40001b80:	02010113          	addi	sp,sp,32
40001b84:	00008067          	ret

40001b88 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40001b88:	fe010113          	addi	sp,sp,-32
40001b8c:	00812e23          	sw	s0,28(sp)
40001b90:	02010413          	addi	s0,sp,32
40001b94:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40001b98:	fec42783          	lw	a5,-20(s0)
40001b9c:	0047a783          	lw	a5,4(a5)
40001ba0:	0107d793          	srli	a5,a5,0x10
40001ba4:	0ff7f793          	zext.b	a5,a5
}
40001ba8:	00078513          	mv	a0,a5
40001bac:	01c12403          	lw	s0,28(sp)
40001bb0:	02010113          	addi	sp,sp,32
40001bb4:	00008067          	ret

40001bb8 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40001bb8:	fe010113          	addi	sp,sp,-32
40001bbc:	00812e23          	sw	s0,28(sp)
40001bc0:	02010413          	addi	s0,sp,32
40001bc4:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40001bc8:	fec42783          	lw	a5,-20(s0)
40001bcc:	0047a783          	lw	a5,4(a5)
40001bd0:	0187d793          	srli	a5,a5,0x18
}
40001bd4:	00078513          	mv	a0,a5
40001bd8:	01c12403          	lw	s0,28(sp)
40001bdc:	02010113          	addi	sp,sp,32
40001be0:	00008067          	ret

40001be4 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40001be4:	fe010113          	addi	sp,sp,-32
40001be8:	00112e23          	sw	ra,28(sp)
40001bec:	00812c23          	sw	s0,24(sp)
40001bf0:	02010413          	addi	s0,sp,32
40001bf4:	fea42623          	sw	a0,-20(s0)
40001bf8:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40001bfc:	00000013          	nop
40001c00:	fec42503          	lw	a0,-20(s0)
40001c04:	f85ff0ef          	jal	ra,40001b88 <uart_writeAvailability>
40001c08:	00050793          	mv	a5,a0
40001c0c:	fe078ae3          	beqz	a5,40001c00 <uart_write+0x1c>
	reg->DATA = data;
40001c10:	fec42783          	lw	a5,-20(s0)
40001c14:	fe842703          	lw	a4,-24(s0)
40001c18:	00e7a023          	sw	a4,0(a5)
}
40001c1c:	00000013          	nop
40001c20:	01c12083          	lw	ra,28(sp)
40001c24:	01812403          	lw	s0,24(sp)
40001c28:	02010113          	addi	sp,sp,32
40001c2c:	00008067          	ret

40001c30 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001c30:	fe010113          	addi	sp,sp,-32
40001c34:	00812e23          	sw	s0,28(sp)
40001c38:	02010413          	addi	s0,sp,32
40001c3c:	fea42623          	sw	a0,-20(s0)
40001c40:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001c44:	fe842783          	lw	a5,-24(s0)
40001c48:	00c7a703          	lw	a4,12(a5)
40001c4c:	fec42783          	lw	a5,-20(s0)
40001c50:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001c54:	fe842783          	lw	a5,-24(s0)
40001c58:	0007a783          	lw	a5,0(a5)
40001c5c:	fff78713          	addi	a4,a5,-1
40001c60:	fe842783          	lw	a5,-24(s0)
40001c64:	0047a783          	lw	a5,4(a5)
40001c68:	00879793          	slli	a5,a5,0x8
40001c6c:	00f76733          	or	a4,a4,a5
40001c70:	fe842783          	lw	a5,-24(s0)
40001c74:	0087a783          	lw	a5,8(a5)
40001c78:	01079793          	slli	a5,a5,0x10
40001c7c:	00f76733          	or	a4,a4,a5
40001c80:	fec42783          	lw	a5,-20(s0)
40001c84:	00e7a623          	sw	a4,12(a5)
}
40001c88:	00000013          	nop
40001c8c:	01c12403          	lw	s0,28(sp)
40001c90:	02010113          	addi	sp,sp,32
40001c94:	00008067          	ret

40001c98 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001c98:	fe010113          	addi	sp,sp,-32
40001c9c:	00812e23          	sw	s0,28(sp)
40001ca0:	02010413          	addi	s0,sp,32
40001ca4:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001ca8:	fec42783          	lw	a5,-20(s0)
40001cac:	0007a783          	lw	a5,0(a5)
40001cb0:	0027f793          	andi	a5,a5,2
40001cb4:	00f037b3          	snez	a5,a5
40001cb8:	0ff7f793          	zext.b	a5,a5
}
40001cbc:	00078513          	mv	a0,a5
40001cc0:	01c12403          	lw	s0,28(sp)
40001cc4:	02010113          	addi	sp,sp,32
40001cc8:	00008067          	ret

40001ccc <vga_run>:
static void vga_run(Vga_Reg *reg){
40001ccc:	fe010113          	addi	sp,sp,-32
40001cd0:	00812e23          	sw	s0,28(sp)
40001cd4:	02010413          	addi	s0,sp,32
40001cd8:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40001cdc:	fec42783          	lw	a5,-20(s0)
40001ce0:	00100713          	li	a4,1
40001ce4:	00e7a023          	sw	a4,0(a5)
}
40001ce8:	00000013          	nop
40001cec:	01c12403          	lw	s0,28(sp)
40001cf0:	02010113          	addi	sp,sp,32
40001cf4:	00008067          	ret

40001cf8 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40001cf8:	fe010113          	addi	sp,sp,-32
40001cfc:	00112e23          	sw	ra,28(sp)
40001d00:	00812c23          	sw	s0,24(sp)
40001d04:	02010413          	addi	s0,sp,32
40001d08:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40001d0c:	fec42783          	lw	a5,-20(s0)
40001d10:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001d14:	00000013          	nop
40001d18:	fec42503          	lw	a0,-20(s0)
40001d1c:	f7dff0ef          	jal	ra,40001c98 <vga_isBusy>
40001d20:	00050793          	mv	a5,a0
40001d24:	fe079ae3          	bnez	a5,40001d18 <vga_stop+0x20>
}
40001d28:	00000013          	nop
40001d2c:	00000013          	nop
40001d30:	01c12083          	lw	ra,28(sp)
40001d34:	01812403          	lw	s0,24(sp)
40001d38:	02010113          	addi	sp,sp,32
40001d3c:	00008067          	ret

40001d40 <dm_present_write>:
#include "briey.h"
void dm_present_write(uint32_t iData, uint32_t iAddress)
{
40001d40:	fe010113          	addi	sp,sp,-32
40001d44:	00812e23          	sw	s0,28(sp)
40001d48:	02010413          	addi	s0,sp,32
40001d4c:	fea42623          	sw	a0,-20(s0)
40001d50:	feb42423          	sw	a1,-24(s0)
	DMPRESENT_BASE->ADDRESS			= iAddress;
40001d54:	f00037b7          	lui	a5,0xf0003
40001d58:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001d5c:	fe842703          	lw	a4,-24(s0)
40001d60:	00e7a623          	sw	a4,12(a5)
	DMPRESENT_BASE->WRITE_N 		= 0;
40001d64:	f00037b7          	lui	a5,0xf0003
40001d68:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001d6c:	0007a223          	sw	zero,4(a5)
	DMPRESENT_BASE->READ_N 			= 1;
40001d70:	f00037b7          	lui	a5,0xf0003
40001d74:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001d78:	00100713          	li	a4,1
40001d7c:	00e7a423          	sw	a4,8(a5)
	DMPRESENT_BASE->IDATA			= iData;
40001d80:	f00037b7          	lui	a5,0xf0003
40001d84:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001d88:	fec42703          	lw	a4,-20(s0)
40001d8c:	00e7a823          	sw	a4,16(a5)
	DMPRESENT_BASE->CHIP_SELECT_N	= 0;
40001d90:	f00037b7          	lui	a5,0xf0003
40001d94:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001d98:	0007a023          	sw	zero,0(a5)
	DMPRESENT_BASE->CHIP_SELECT_N	= 1;
40001d9c:	f00037b7          	lui	a5,0xf0003
40001da0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001da4:	00100713          	li	a4,1
40001da8:	00e7a023          	sw	a4,0(a5)
}
40001dac:	00000013          	nop
40001db0:	01c12403          	lw	s0,28(sp)
40001db4:	02010113          	addi	sp,sp,32
40001db8:	00008067          	ret

40001dbc <dm_present_read>:
uint32_t dm_present_read(uint32_t iAddress)
{
40001dbc:	fd010113          	addi	sp,sp,-48
40001dc0:	02812623          	sw	s0,44(sp)
40001dc4:	03010413          	addi	s0,sp,48
40001dc8:	fca42e23          	sw	a0,-36(s0)
	DMPRESENT_BASE->ADDRESS			= iAddress;
40001dcc:	f00037b7          	lui	a5,0xf0003
40001dd0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001dd4:	fdc42703          	lw	a4,-36(s0)
40001dd8:	00e7a623          	sw	a4,12(a5)
	DMPRESENT_BASE->READ_N			= 0;
40001ddc:	f00037b7          	lui	a5,0xf0003
40001de0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001de4:	0007a423          	sw	zero,8(a5)
	DMPRESENT_BASE->WRITE_N			= 1;
40001de8:	f00037b7          	lui	a5,0xf0003
40001dec:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001df0:	00100713          	li	a4,1
40001df4:	00e7a223          	sw	a4,4(a5)
	DMPRESENT_BASE->CHIP_SELECT_N	= 0;
40001df8:	f00037b7          	lui	a5,0xf0003
40001dfc:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001e00:	0007a023          	sw	zero,0(a5)
	uint32_t res 					= DMPRESENT_BASE->ODATA;
40001e04:	f00037b7          	lui	a5,0xf0003
40001e08:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001e0c:	0147a783          	lw	a5,20(a5)
40001e10:	fef42623          	sw	a5,-20(s0)
	DMPRESENT_BASE->CHIP_SELECT_N	= 1;
40001e14:	f00037b7          	lui	a5,0xf0003
40001e18:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001e1c:	00100713          	li	a4,1
40001e20:	00e7a023          	sw	a4,0(a5)
	return res;
40001e24:	fec42783          	lw	a5,-20(s0)
}
40001e28:	00078513          	mv	a0,a5
40001e2c:	02c12403          	lw	s0,44(sp)
40001e30:	03010113          	addi	sp,sp,48
40001e34:	00008067          	ret

40001e38 <dm_present_hash>:
void dm_present_hash(uint32_t *key, uint32_t *block, uint32_t *res) {
40001e38:	fe010113          	addi	sp,sp,-32
40001e3c:	00112e23          	sw	ra,28(sp)
40001e40:	00812c23          	sw	s0,24(sp)
40001e44:	00912a23          	sw	s1,20(sp)
40001e48:	02010413          	addi	s0,sp,32
40001e4c:	fea42623          	sw	a0,-20(s0)
40001e50:	feb42423          	sw	a1,-24(s0)
40001e54:	fec42223          	sw	a2,-28(s0)

	//PLAIN_TEXT
	dm_present_write(block[1],DMPRESENT_ADDR_BLOCK_BASE +1);
40001e58:	fe842783          	lw	a5,-24(s0)
40001e5c:	00478793          	addi	a5,a5,4
40001e60:	0007a783          	lw	a5,0(a5)
40001e64:	00500593          	li	a1,5
40001e68:	00078513          	mv	a0,a5
40001e6c:	ed5ff0ef          	jal	ra,40001d40 <dm_present_write>
	dm_present_write(block[0],DMPRESENT_ADDR_BLOCK_BASE);
40001e70:	fe842783          	lw	a5,-24(s0)
40001e74:	0007a783          	lw	a5,0(a5)
40001e78:	00400593          	li	a1,4
40001e7c:	00078513          	mv	a0,a5
40001e80:	ec1ff0ef          	jal	ra,40001d40 <dm_present_write>

	//KEY
	dm_present_write(key[2],DMPRESENT_ADDR_KEY_BASE +2);
40001e84:	fec42783          	lw	a5,-20(s0)
40001e88:	00878793          	addi	a5,a5,8
40001e8c:	0007a783          	lw	a5,0(a5)
40001e90:	00300593          	li	a1,3
40001e94:	00078513          	mv	a0,a5
40001e98:	ea9ff0ef          	jal	ra,40001d40 <dm_present_write>
	dm_present_write(key[1],DMPRESENT_ADDR_KEY_BASE +1);
40001e9c:	fec42783          	lw	a5,-20(s0)
40001ea0:	00478793          	addi	a5,a5,4
40001ea4:	0007a783          	lw	a5,0(a5)
40001ea8:	00200593          	li	a1,2
40001eac:	00078513          	mv	a0,a5
40001eb0:	e91ff0ef          	jal	ra,40001d40 <dm_present_write>
	dm_present_write(key[0],DMPRESENT_ADDR_KEY_BASE);
40001eb4:	fec42783          	lw	a5,-20(s0)
40001eb8:	0007a783          	lw	a5,0(a5)
40001ebc:	00100593          	li	a1,1
40001ec0:	00078513          	mv	a0,a5
40001ec4:	e7dff0ef          	jal	ra,40001d40 <dm_present_write>

	//START
	dm_present_write(0x1,DMPRESENT_ADDR_START);
40001ec8:	00000593          	li	a1,0
40001ecc:	00100513          	li	a0,1
40001ed0:	e71ff0ef          	jal	ra,40001d40 <dm_present_write>
    while(dm_present_read(DMPRESENT_ADDR_RESULT_BASE) == 0);
40001ed4:	00000013          	nop
40001ed8:	00600513          	li	a0,6
40001edc:	ee1ff0ef          	jal	ra,40001dbc <dm_present_read>
40001ee0:	00050793          	mv	a5,a0
40001ee4:	fe078ae3          	beqz	a5,40001ed8 <dm_present_hash+0xa0>

    res[1] = dm_present_read(DMPRESENT_ADDR_RESULT_BASE +1);
40001ee8:	fe442783          	lw	a5,-28(s0)
40001eec:	00478493          	addi	s1,a5,4
40001ef0:	00700513          	li	a0,7
40001ef4:	ec9ff0ef          	jal	ra,40001dbc <dm_present_read>
40001ef8:	00050793          	mv	a5,a0
40001efc:	00f4a023          	sw	a5,0(s1)
    res[0] = dm_present_read(DMPRESENT_ADDR_RESULT_BASE);
40001f00:	00600513          	li	a0,6
40001f04:	eb9ff0ef          	jal	ra,40001dbc <dm_present_read>
40001f08:	00050713          	mv	a4,a0
40001f0c:	fe442783          	lw	a5,-28(s0)
40001f10:	00e7a023          	sw	a4,0(a5)


    //print result to terminal
	print("\r\t===========================DM_PRESENT HASH==================================\r\n");
40001f14:	400047b7          	lui	a5,0x40004
40001f18:	c1878513          	addi	a0,a5,-1000 # 40003c18 <vga_simRes_h160_v120+0x20>
40001f1c:	294000ef          	jal	ra,400021b0 <print>
	print("\r\n");
40001f20:	400047b7          	lui	a5,0x40004
40001f24:	c6c78513          	addi	a0,a5,-916 # 40003c6c <vga_simRes_h160_v120+0x74>
40001f28:	288000ef          	jal	ra,400021b0 <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
40001f2c:	fe842583          	lw	a1,-24(s0)
40001f30:	400047b7          	lui	a5,0x40004
40001f34:	c7078513          	addi	a0,a5,-912 # 40003c70 <vga_simRes_h160_v120+0x78>
40001f38:	4e0000ef          	jal	ra,40002418 <print64bit>
	print80bit("KEY (80-bit) : ", key);
40001f3c:	fec42583          	lw	a1,-20(s0)
40001f40:	400047b7          	lui	a5,0x40004
40001f44:	c8c78513          	addi	a0,a5,-884 # 40003c8c <vga_simRes_h160_v120+0x94>
40001f48:	5d8000ef          	jal	ra,40002520 <print80bit>
	print64bit("RESULT (64-bit) : ", res);
40001f4c:	fe442583          	lw	a1,-28(s0)
40001f50:	400047b7          	lui	a5,0x40004
40001f54:	c9c78513          	addi	a0,a5,-868 # 40003c9c <vga_simRes_h160_v120+0xa4>
40001f58:	4c0000ef          	jal	ra,40002418 <print64bit>
	//print("\r\n============================================================================\r\n");
}
40001f5c:	00000013          	nop
40001f60:	01c12083          	lw	ra,28(sp)
40001f64:	01812403          	lw	s0,24(sp)
40001f68:	01412483          	lw	s1,20(sp)
40001f6c:	02010113          	addi	sp,sp,32
40001f70:	00008067          	ret

40001f74 <timer_init>:
static void timer_init(Timer_Reg *reg){
40001f74:	fe010113          	addi	sp,sp,-32
40001f78:	00812e23          	sw	s0,28(sp)
40001f7c:	02010413          	addi	s0,sp,32
40001f80:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40001f84:	fec42783          	lw	a5,-20(s0)
40001f88:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40001f8c:	fec42783          	lw	a5,-20(s0)
40001f90:	0007a423          	sw	zero,8(a5)
}
40001f94:	00000013          	nop
40001f98:	01c12403          	lw	s0,28(sp)
40001f9c:	02010113          	addi	sp,sp,32
40001fa0:	00008067          	ret

40001fa4 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001fa4:	fe010113          	addi	sp,sp,-32
40001fa8:	00812e23          	sw	s0,28(sp)
40001fac:	02010413          	addi	s0,sp,32
40001fb0:	fea42623          	sw	a0,-20(s0)
}
40001fb4:	00000013          	nop
40001fb8:	01c12403          	lw	s0,28(sp)
40001fbc:	02010113          	addi	sp,sp,32
40001fc0:	00008067          	ret

40001fc4 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001fc4:	fe010113          	addi	sp,sp,-32
40001fc8:	00812e23          	sw	s0,28(sp)
40001fcc:	02010413          	addi	s0,sp,32
40001fd0:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001fd4:	fec42783          	lw	a5,-20(s0)
40001fd8:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001fdc:	fec42783          	lw	a5,-20(s0)
40001fe0:	fff00713          	li	a4,-1
40001fe4:	00e7a023          	sw	a4,0(a5)
}
40001fe8:	00000013          	nop
40001fec:	01c12403          	lw	s0,28(sp)
40001ff0:	02010113          	addi	sp,sp,32
40001ff4:	00008067          	ret

40001ff8 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40001ff8:	fe010113          	addi	sp,sp,-32
40001ffc:	00812e23          	sw	s0,28(sp)
40002000:	02010413          	addi	s0,sp,32
40002004:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40002008:	fec42783          	lw	a5,-20(s0)
4000200c:	0047a783          	lw	a5,4(a5)
40002010:	0107d793          	srli	a5,a5,0x10
40002014:	0ff7f793          	zext.b	a5,a5
}
40002018:	00078513          	mv	a0,a5
4000201c:	01c12403          	lw	s0,28(sp)
40002020:	02010113          	addi	sp,sp,32
40002024:	00008067          	ret

40002028 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40002028:	fe010113          	addi	sp,sp,-32
4000202c:	00812e23          	sw	s0,28(sp)
40002030:	02010413          	addi	s0,sp,32
40002034:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40002038:	fec42783          	lw	a5,-20(s0)
4000203c:	0047a783          	lw	a5,4(a5)
40002040:	0187d793          	srli	a5,a5,0x18
}
40002044:	00078513          	mv	a0,a5
40002048:	01c12403          	lw	s0,28(sp)
4000204c:	02010113          	addi	sp,sp,32
40002050:	00008067          	ret

40002054 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40002054:	fe010113          	addi	sp,sp,-32
40002058:	00112e23          	sw	ra,28(sp)
4000205c:	00812c23          	sw	s0,24(sp)
40002060:	02010413          	addi	s0,sp,32
40002064:	fea42623          	sw	a0,-20(s0)
40002068:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
4000206c:	00000013          	nop
40002070:	fec42503          	lw	a0,-20(s0)
40002074:	f85ff0ef          	jal	ra,40001ff8 <uart_writeAvailability>
40002078:	00050793          	mv	a5,a0
4000207c:	fe078ae3          	beqz	a5,40002070 <uart_write+0x1c>
	reg->DATA = data;
40002080:	fec42783          	lw	a5,-20(s0)
40002084:	fe842703          	lw	a4,-24(s0)
40002088:	00e7a023          	sw	a4,0(a5)
}
4000208c:	00000013          	nop
40002090:	01c12083          	lw	ra,28(sp)
40002094:	01812403          	lw	s0,24(sp)
40002098:	02010113          	addi	sp,sp,32
4000209c:	00008067          	ret

400020a0 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
400020a0:	fe010113          	addi	sp,sp,-32
400020a4:	00812e23          	sw	s0,28(sp)
400020a8:	02010413          	addi	s0,sp,32
400020ac:	fea42623          	sw	a0,-20(s0)
400020b0:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
400020b4:	fe842783          	lw	a5,-24(s0)
400020b8:	00c7a703          	lw	a4,12(a5)
400020bc:	fec42783          	lw	a5,-20(s0)
400020c0:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
400020c4:	fe842783          	lw	a5,-24(s0)
400020c8:	0007a783          	lw	a5,0(a5)
400020cc:	fff78713          	addi	a4,a5,-1
400020d0:	fe842783          	lw	a5,-24(s0)
400020d4:	0047a783          	lw	a5,4(a5)
400020d8:	00879793          	slli	a5,a5,0x8
400020dc:	00f76733          	or	a4,a4,a5
400020e0:	fe842783          	lw	a5,-24(s0)
400020e4:	0087a783          	lw	a5,8(a5)
400020e8:	01079793          	slli	a5,a5,0x10
400020ec:	00f76733          	or	a4,a4,a5
400020f0:	fec42783          	lw	a5,-20(s0)
400020f4:	00e7a623          	sw	a4,12(a5)
}
400020f8:	00000013          	nop
400020fc:	01c12403          	lw	s0,28(sp)
40002100:	02010113          	addi	sp,sp,32
40002104:	00008067          	ret

40002108 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40002108:	fe010113          	addi	sp,sp,-32
4000210c:	00812e23          	sw	s0,28(sp)
40002110:	02010413          	addi	s0,sp,32
40002114:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40002118:	fec42783          	lw	a5,-20(s0)
4000211c:	0007a783          	lw	a5,0(a5)
40002120:	0027f793          	andi	a5,a5,2
40002124:	00f037b3          	snez	a5,a5
40002128:	0ff7f793          	zext.b	a5,a5
}
4000212c:	00078513          	mv	a0,a5
40002130:	01c12403          	lw	s0,28(sp)
40002134:	02010113          	addi	sp,sp,32
40002138:	00008067          	ret

4000213c <vga_run>:
static void vga_run(Vga_Reg *reg){
4000213c:	fe010113          	addi	sp,sp,-32
40002140:	00812e23          	sw	s0,28(sp)
40002144:	02010413          	addi	s0,sp,32
40002148:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
4000214c:	fec42783          	lw	a5,-20(s0)
40002150:	00100713          	li	a4,1
40002154:	00e7a023          	sw	a4,0(a5)
}
40002158:	00000013          	nop
4000215c:	01c12403          	lw	s0,28(sp)
40002160:	02010113          	addi	sp,sp,32
40002164:	00008067          	ret

40002168 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40002168:	fe010113          	addi	sp,sp,-32
4000216c:	00112e23          	sw	ra,28(sp)
40002170:	00812c23          	sw	s0,24(sp)
40002174:	02010413          	addi	s0,sp,32
40002178:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
4000217c:	fec42783          	lw	a5,-20(s0)
40002180:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40002184:	00000013          	nop
40002188:	fec42503          	lw	a0,-20(s0)
4000218c:	f7dff0ef          	jal	ra,40002108 <vga_isBusy>
40002190:	00050793          	mv	a5,a0
40002194:	fe079ae3          	bnez	a5,40002188 <vga_stop+0x20>
}
40002198:	00000013          	nop
4000219c:	00000013          	nop
400021a0:	01c12083          	lw	ra,28(sp)
400021a4:	01812403          	lw	s0,24(sp)
400021a8:	02010113          	addi	sp,sp,32
400021ac:	00008067          	ret

400021b0 <print>:
#include <briey.h>

void print(char *str){
400021b0:	fe010113          	addi	sp,sp,-32
400021b4:	00112e23          	sw	ra,28(sp)
400021b8:	00812c23          	sw	s0,24(sp)
400021bc:	02010413          	addi	s0,sp,32
400021c0:	fea42623          	sw	a0,-20(s0)
	while(*str){
400021c4:	0200006f          	j	400021e4 <print+0x34>
		uart_write(UART,*(str++));
400021c8:	fec42783          	lw	a5,-20(s0)
400021cc:	00178713          	addi	a4,a5,1
400021d0:	fee42623          	sw	a4,-20(s0)
400021d4:	0007c783          	lbu	a5,0(a5)
400021d8:	00078593          	mv	a1,a5
400021dc:	f0010537          	lui	a0,0xf0010
400021e0:	e75ff0ef          	jal	ra,40002054 <uart_write>
	while(*str){
400021e4:	fec42783          	lw	a5,-20(s0)
400021e8:	0007c783          	lbu	a5,0(a5)
400021ec:	fc079ee3          	bnez	a5,400021c8 <print+0x18>
	}
}
400021f0:	00000013          	nop
400021f4:	00000013          	nop
400021f8:	01c12083          	lw	ra,28(sp)
400021fc:	01812403          	lw	s0,24(sp)
40002200:	02010113          	addi	sp,sp,32
40002204:	00008067          	ret

40002208 <print16bit>:

void print16bit(uint32_t n)
{
40002208:	fc010113          	addi	sp,sp,-64
4000220c:	02112e23          	sw	ra,60(sp)
40002210:	02812c23          	sw	s0,56(sp)
40002214:	04010413          	addi	s0,sp,64
40002218:	fca42623          	sw	a0,-52(s0)

    int i = 0;
4000221c:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40002220:	fc042e23          	sw	zero,-36(s0)
40002224:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40002228:	fcc42783          	lw	a5,-52(s0)
4000222c:	00f7f793          	andi	a5,a5,15
40002230:	40004737          	lui	a4,0x40004
40002234:	d1470713          	addi	a4,a4,-748 # 40003d14 <vga_simRes_h160_v120+0x24>
40002238:	00f707b3          	add	a5,a4,a5
4000223c:	0007c703          	lbu	a4,0(a5)
40002240:	fec42783          	lw	a5,-20(s0)
40002244:	ff040693          	addi	a3,s0,-16
40002248:	00f687b3          	add	a5,a3,a5
4000224c:	fee78623          	sb	a4,-20(a5)
        i++;
40002250:	fec42783          	lw	a5,-20(s0)
40002254:	00178793          	addi	a5,a5,1
40002258:	fef42623          	sw	a5,-20(s0)
        n = n/16;
4000225c:	fcc42783          	lw	a5,-52(s0)
40002260:	0047d793          	srli	a5,a5,0x4
40002264:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40002268:	fcc42783          	lw	a5,-52(s0)
4000226c:	fa079ee3          	bnez	a5,40002228 <print16bit+0x20>
    if(i<8) {
40002270:	fec42703          	lw	a4,-20(s0)
40002274:	00700793          	li	a5,7
40002278:	02e7ce63          	blt	a5,a4,400022b4 <print16bit+0xac>
    	for(int j=7;j>=i;j--){
4000227c:	00700793          	li	a5,7
40002280:	fef42423          	sw	a5,-24(s0)
40002284:	0240006f          	j	400022a8 <print16bit+0xa0>
    		outbuf_inv[j]="0"[0];
40002288:	03000713          	li	a4,48
4000228c:	fe842783          	lw	a5,-24(s0)
40002290:	ff040693          	addi	a3,s0,-16
40002294:	00f687b3          	add	a5,a3,a5
40002298:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
4000229c:	fe842783          	lw	a5,-24(s0)
400022a0:	fff78793          	addi	a5,a5,-1
400022a4:	fef42423          	sw	a5,-24(s0)
400022a8:	fe842703          	lw	a4,-24(s0)
400022ac:	fec42783          	lw	a5,-20(s0)
400022b0:	fcf75ce3          	bge	a4,a5,40002288 <print16bit+0x80>
    	}
    }
    for(int j=3;j>=0;j--)
400022b4:	00300793          	li	a5,3
400022b8:	fef42223          	sw	a5,-28(s0)
400022bc:	02c0006f          	j	400022e8 <print16bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
400022c0:	fe442783          	lw	a5,-28(s0)
400022c4:	ff040713          	addi	a4,s0,-16
400022c8:	00f707b3          	add	a5,a4,a5
400022cc:	fec7c783          	lbu	a5,-20(a5)
400022d0:	00078593          	mv	a1,a5
400022d4:	f0010537          	lui	a0,0xf0010
400022d8:	d7dff0ef          	jal	ra,40002054 <uart_write>
    for(int j=3;j>=0;j--)
400022dc:	fe442783          	lw	a5,-28(s0)
400022e0:	fff78793          	addi	a5,a5,-1
400022e4:	fef42223          	sw	a5,-28(s0)
400022e8:	fe442783          	lw	a5,-28(s0)
400022ec:	fc07dae3          	bgez	a5,400022c0 <print16bit+0xb8>
    }
    print(" ");
400022f0:	400047b7          	lui	a5,0x40004
400022f4:	d1078513          	addi	a0,a5,-752 # 40003d10 <vga_simRes_h160_v120+0x20>
400022f8:	eb9ff0ef          	jal	ra,400021b0 <print>
}
400022fc:	00000013          	nop
40002300:	03c12083          	lw	ra,60(sp)
40002304:	03812403          	lw	s0,56(sp)
40002308:	04010113          	addi	sp,sp,64
4000230c:	00008067          	ret

40002310 <print32bit>:
void print32bit(uint32_t n)
{
40002310:	fc010113          	addi	sp,sp,-64
40002314:	02112e23          	sw	ra,60(sp)
40002318:	02812c23          	sw	s0,56(sp)
4000231c:	04010413          	addi	s0,sp,64
40002320:	fca42623          	sw	a0,-52(s0)

    int i = 0;
40002324:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40002328:	fc042e23          	sw	zero,-36(s0)
4000232c:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40002330:	fcc42783          	lw	a5,-52(s0)
40002334:	00f7f793          	andi	a5,a5,15
40002338:	40004737          	lui	a4,0x40004
4000233c:	d1470713          	addi	a4,a4,-748 # 40003d14 <vga_simRes_h160_v120+0x24>
40002340:	00f707b3          	add	a5,a4,a5
40002344:	0007c703          	lbu	a4,0(a5)
40002348:	fec42783          	lw	a5,-20(s0)
4000234c:	ff040693          	addi	a3,s0,-16
40002350:	00f687b3          	add	a5,a3,a5
40002354:	fee78623          	sb	a4,-20(a5)
        i++;
40002358:	fec42783          	lw	a5,-20(s0)
4000235c:	00178793          	addi	a5,a5,1
40002360:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40002364:	fcc42783          	lw	a5,-52(s0)
40002368:	0047d793          	srli	a5,a5,0x4
4000236c:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40002370:	fcc42783          	lw	a5,-52(s0)
40002374:	fa079ee3          	bnez	a5,40002330 <print32bit+0x20>
    if(i<8) {
40002378:	fec42703          	lw	a4,-20(s0)
4000237c:	00700793          	li	a5,7
40002380:	02e7ce63          	blt	a5,a4,400023bc <print32bit+0xac>
    	for(int j=7;j>=i;j--){
40002384:	00700793          	li	a5,7
40002388:	fef42423          	sw	a5,-24(s0)
4000238c:	0240006f          	j	400023b0 <print32bit+0xa0>
    		outbuf_inv[j]="0"[0];
40002390:	03000713          	li	a4,48
40002394:	fe842783          	lw	a5,-24(s0)
40002398:	ff040693          	addi	a3,s0,-16
4000239c:	00f687b3          	add	a5,a3,a5
400023a0:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
400023a4:	fe842783          	lw	a5,-24(s0)
400023a8:	fff78793          	addi	a5,a5,-1
400023ac:	fef42423          	sw	a5,-24(s0)
400023b0:	fe842703          	lw	a4,-24(s0)
400023b4:	fec42783          	lw	a5,-20(s0)
400023b8:	fcf75ce3          	bge	a4,a5,40002390 <print32bit+0x80>
    	}
    }
    for(int j=7;j>=0;j--)
400023bc:	00700793          	li	a5,7
400023c0:	fef42223          	sw	a5,-28(s0)
400023c4:	02c0006f          	j	400023f0 <print32bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
400023c8:	fe442783          	lw	a5,-28(s0)
400023cc:	ff040713          	addi	a4,s0,-16
400023d0:	00f707b3          	add	a5,a4,a5
400023d4:	fec7c783          	lbu	a5,-20(a5)
400023d8:	00078593          	mv	a1,a5
400023dc:	f0010537          	lui	a0,0xf0010
400023e0:	c75ff0ef          	jal	ra,40002054 <uart_write>
    for(int j=7;j>=0;j--)
400023e4:	fe442783          	lw	a5,-28(s0)
400023e8:	fff78793          	addi	a5,a5,-1
400023ec:	fef42223          	sw	a5,-28(s0)
400023f0:	fe442783          	lw	a5,-28(s0)
400023f4:	fc07dae3          	bgez	a5,400023c8 <print32bit+0xb8>
    }
    print(" ");
400023f8:	400047b7          	lui	a5,0x40004
400023fc:	d1078513          	addi	a0,a5,-752 # 40003d10 <vga_simRes_h160_v120+0x20>
40002400:	db1ff0ef          	jal	ra,400021b0 <print>
}
40002404:	00000013          	nop
40002408:	03c12083          	lw	ra,60(sp)
4000240c:	03812403          	lw	s0,56(sp)
40002410:	04010113          	addi	sp,sp,64
40002414:	00008067          	ret

40002418 <print64bit>:

void print64bit(char *message,uint32_t *num)
{
40002418:	fe010113          	addi	sp,sp,-32
4000241c:	00112e23          	sw	ra,28(sp)
40002420:	00812c23          	sw	s0,24(sp)
40002424:	02010413          	addi	s0,sp,32
40002428:	fea42623          	sw	a0,-20(s0)
4000242c:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002430:	400047b7          	lui	a5,0x40004
40002434:	d2878513          	addi	a0,a5,-728 # 40003d28 <vga_simRes_h160_v120+0x38>
40002438:	d79ff0ef          	jal	ra,400021b0 <print>
	print(message);
4000243c:	fec42503          	lw	a0,-20(s0)
40002440:	d71ff0ef          	jal	ra,400021b0 <print>
	print32bit(num[1]);
40002444:	fe842783          	lw	a5,-24(s0)
40002448:	00478793          	addi	a5,a5,4
4000244c:	0007a783          	lw	a5,0(a5)
40002450:	00078513          	mv	a0,a5
40002454:	ebdff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[0]);
40002458:	fe842783          	lw	a5,-24(s0)
4000245c:	0007a783          	lw	a5,0(a5)
40002460:	00078513          	mv	a0,a5
40002464:	eadff0ef          	jal	ra,40002310 <print32bit>
	print("\r\n");
40002468:	400047b7          	lui	a5,0x40004
4000246c:	d2c78513          	addi	a0,a5,-724 # 40003d2c <vga_simRes_h160_v120+0x3c>
40002470:	d41ff0ef          	jal	ra,400021b0 <print>
}
40002474:	00000013          	nop
40002478:	01c12083          	lw	ra,28(sp)
4000247c:	01812403          	lw	s0,24(sp)
40002480:	02010113          	addi	sp,sp,32
40002484:	00008067          	ret

40002488 <print128bit>:
void print128bit(char *message, uint32_t *num)
{
40002488:	fe010113          	addi	sp,sp,-32
4000248c:	00112e23          	sw	ra,28(sp)
40002490:	00812c23          	sw	s0,24(sp)
40002494:	02010413          	addi	s0,sp,32
40002498:	fea42623          	sw	a0,-20(s0)
4000249c:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
400024a0:	400047b7          	lui	a5,0x40004
400024a4:	d2878513          	addi	a0,a5,-728 # 40003d28 <vga_simRes_h160_v120+0x38>
400024a8:	d09ff0ef          	jal	ra,400021b0 <print>
	print(message);
400024ac:	fec42503          	lw	a0,-20(s0)
400024b0:	d01ff0ef          	jal	ra,400021b0 <print>
	print32bit(num[3]);
400024b4:	fe842783          	lw	a5,-24(s0)
400024b8:	00c78793          	addi	a5,a5,12
400024bc:	0007a783          	lw	a5,0(a5)
400024c0:	00078513          	mv	a0,a5
400024c4:	e4dff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[2]);
400024c8:	fe842783          	lw	a5,-24(s0)
400024cc:	00878793          	addi	a5,a5,8
400024d0:	0007a783          	lw	a5,0(a5)
400024d4:	00078513          	mv	a0,a5
400024d8:	e39ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[1]);
400024dc:	fe842783          	lw	a5,-24(s0)
400024e0:	00478793          	addi	a5,a5,4
400024e4:	0007a783          	lw	a5,0(a5)
400024e8:	00078513          	mv	a0,a5
400024ec:	e25ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[0]);
400024f0:	fe842783          	lw	a5,-24(s0)
400024f4:	0007a783          	lw	a5,0(a5)
400024f8:	00078513          	mv	a0,a5
400024fc:	e15ff0ef          	jal	ra,40002310 <print32bit>
	print("\r\n");
40002500:	400047b7          	lui	a5,0x40004
40002504:	d2c78513          	addi	a0,a5,-724 # 40003d2c <vga_simRes_h160_v120+0x3c>
40002508:	ca9ff0ef          	jal	ra,400021b0 <print>
}
4000250c:	00000013          	nop
40002510:	01c12083          	lw	ra,28(sp)
40002514:	01812403          	lw	s0,24(sp)
40002518:	02010113          	addi	sp,sp,32
4000251c:	00008067          	ret

40002520 <print80bit>:
void print80bit(char *message,uint32_t *num)
{
40002520:	fe010113          	addi	sp,sp,-32
40002524:	00112e23          	sw	ra,28(sp)
40002528:	00812c23          	sw	s0,24(sp)
4000252c:	02010413          	addi	s0,sp,32
40002530:	fea42623          	sw	a0,-20(s0)
40002534:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002538:	400047b7          	lui	a5,0x40004
4000253c:	d2878513          	addi	a0,a5,-728 # 40003d28 <vga_simRes_h160_v120+0x38>
40002540:	c71ff0ef          	jal	ra,400021b0 <print>
	print(message);
40002544:	fec42503          	lw	a0,-20(s0)
40002548:	c69ff0ef          	jal	ra,400021b0 <print>
	print32bit(num[2]);
4000254c:	fe842783          	lw	a5,-24(s0)
40002550:	00878793          	addi	a5,a5,8
40002554:	0007a783          	lw	a5,0(a5)
40002558:	00078513          	mv	a0,a5
4000255c:	db5ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[1]);
40002560:	fe842783          	lw	a5,-24(s0)
40002564:	00478793          	addi	a5,a5,4
40002568:	0007a783          	lw	a5,0(a5)
4000256c:	00078513          	mv	a0,a5
40002570:	da1ff0ef          	jal	ra,40002310 <print32bit>
	print16bit(num[0]);
40002574:	fe842783          	lw	a5,-24(s0)
40002578:	0007a783          	lw	a5,0(a5)
4000257c:	00078513          	mv	a0,a5
40002580:	c89ff0ef          	jal	ra,40002208 <print16bit>
	print("\r\n");
40002584:	400047b7          	lui	a5,0x40004
40002588:	d2c78513          	addi	a0,a5,-724 # 40003d2c <vga_simRes_h160_v120+0x3c>
4000258c:	c25ff0ef          	jal	ra,400021b0 <print>
}
40002590:	00000013          	nop
40002594:	01c12083          	lw	ra,28(sp)
40002598:	01812403          	lw	s0,24(sp)
4000259c:	02010113          	addi	sp,sp,32
400025a0:	00008067          	ret

400025a4 <print256bit>:
void print256bit(char *message, uint32_t *num)
{
400025a4:	fe010113          	addi	sp,sp,-32
400025a8:	00112e23          	sw	ra,28(sp)
400025ac:	00812c23          	sw	s0,24(sp)
400025b0:	02010413          	addi	s0,sp,32
400025b4:	fea42623          	sw	a0,-20(s0)
400025b8:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
400025bc:	400047b7          	lui	a5,0x40004
400025c0:	d2878513          	addi	a0,a5,-728 # 40003d28 <vga_simRes_h160_v120+0x38>
400025c4:	bedff0ef          	jal	ra,400021b0 <print>
	print(message);
400025c8:	fec42503          	lw	a0,-20(s0)
400025cc:	be5ff0ef          	jal	ra,400021b0 <print>
	print32bit(num[7]);
400025d0:	fe842783          	lw	a5,-24(s0)
400025d4:	01c78793          	addi	a5,a5,28
400025d8:	0007a783          	lw	a5,0(a5)
400025dc:	00078513          	mv	a0,a5
400025e0:	d31ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[6]);
400025e4:	fe842783          	lw	a5,-24(s0)
400025e8:	01878793          	addi	a5,a5,24
400025ec:	0007a783          	lw	a5,0(a5)
400025f0:	00078513          	mv	a0,a5
400025f4:	d1dff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[5]);
400025f8:	fe842783          	lw	a5,-24(s0)
400025fc:	01478793          	addi	a5,a5,20
40002600:	0007a783          	lw	a5,0(a5)
40002604:	00078513          	mv	a0,a5
40002608:	d09ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[4]);
4000260c:	fe842783          	lw	a5,-24(s0)
40002610:	01078793          	addi	a5,a5,16
40002614:	0007a783          	lw	a5,0(a5)
40002618:	00078513          	mv	a0,a5
4000261c:	cf5ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[3]);
40002620:	fe842783          	lw	a5,-24(s0)
40002624:	00c78793          	addi	a5,a5,12
40002628:	0007a783          	lw	a5,0(a5)
4000262c:	00078513          	mv	a0,a5
40002630:	ce1ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[2]);
40002634:	fe842783          	lw	a5,-24(s0)
40002638:	00878793          	addi	a5,a5,8
4000263c:	0007a783          	lw	a5,0(a5)
40002640:	00078513          	mv	a0,a5
40002644:	ccdff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[1]);
40002648:	fe842783          	lw	a5,-24(s0)
4000264c:	00478793          	addi	a5,a5,4
40002650:	0007a783          	lw	a5,0(a5)
40002654:	00078513          	mv	a0,a5
40002658:	cb9ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[0]);
4000265c:	fe842783          	lw	a5,-24(s0)
40002660:	0007a783          	lw	a5,0(a5)
40002664:	00078513          	mv	a0,a5
40002668:	ca9ff0ef          	jal	ra,40002310 <print32bit>
	print("\r\n");
4000266c:	400047b7          	lui	a5,0x40004
40002670:	d2c78513          	addi	a0,a5,-724 # 40003d2c <vga_simRes_h160_v120+0x3c>
40002674:	b3dff0ef          	jal	ra,400021b0 <print>
}
40002678:	00000013          	nop
4000267c:	01c12083          	lw	ra,28(sp)
40002680:	01812403          	lw	s0,24(sp)
40002684:	02010113          	addi	sp,sp,32
40002688:	00008067          	ret

4000268c <print512bit>:
void print512bit (char *message, uint32_t *num)
{
4000268c:	fe010113          	addi	sp,sp,-32
40002690:	00112e23          	sw	ra,28(sp)
40002694:	00812c23          	sw	s0,24(sp)
40002698:	02010413          	addi	s0,sp,32
4000269c:	fea42623          	sw	a0,-20(s0)
400026a0:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
400026a4:	400047b7          	lui	a5,0x40004
400026a8:	d2878513          	addi	a0,a5,-728 # 40003d28 <vga_simRes_h160_v120+0x38>
400026ac:	b05ff0ef          	jal	ra,400021b0 <print>
	print(message);
400026b0:	fec42503          	lw	a0,-20(s0)
400026b4:	afdff0ef          	jal	ra,400021b0 <print>
	print32bit(num[15]);
400026b8:	fe842783          	lw	a5,-24(s0)
400026bc:	03c78793          	addi	a5,a5,60
400026c0:	0007a783          	lw	a5,0(a5)
400026c4:	00078513          	mv	a0,a5
400026c8:	c49ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[14]);
400026cc:	fe842783          	lw	a5,-24(s0)
400026d0:	03878793          	addi	a5,a5,56
400026d4:	0007a783          	lw	a5,0(a5)
400026d8:	00078513          	mv	a0,a5
400026dc:	c35ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[13]);
400026e0:	fe842783          	lw	a5,-24(s0)
400026e4:	03478793          	addi	a5,a5,52
400026e8:	0007a783          	lw	a5,0(a5)
400026ec:	00078513          	mv	a0,a5
400026f0:	c21ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[12]);
400026f4:	fe842783          	lw	a5,-24(s0)
400026f8:	03078793          	addi	a5,a5,48
400026fc:	0007a783          	lw	a5,0(a5)
40002700:	00078513          	mv	a0,a5
40002704:	c0dff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[11]);
40002708:	fe842783          	lw	a5,-24(s0)
4000270c:	02c78793          	addi	a5,a5,44
40002710:	0007a783          	lw	a5,0(a5)
40002714:	00078513          	mv	a0,a5
40002718:	bf9ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[10]);
4000271c:	fe842783          	lw	a5,-24(s0)
40002720:	02878793          	addi	a5,a5,40
40002724:	0007a783          	lw	a5,0(a5)
40002728:	00078513          	mv	a0,a5
4000272c:	be5ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[9]);
40002730:	fe842783          	lw	a5,-24(s0)
40002734:	02478793          	addi	a5,a5,36
40002738:	0007a783          	lw	a5,0(a5)
4000273c:	00078513          	mv	a0,a5
40002740:	bd1ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[8]);
40002744:	fe842783          	lw	a5,-24(s0)
40002748:	02078793          	addi	a5,a5,32
4000274c:	0007a783          	lw	a5,0(a5)
40002750:	00078513          	mv	a0,a5
40002754:	bbdff0ef          	jal	ra,40002310 <print32bit>
	print("\r\n");
40002758:	400047b7          	lui	a5,0x40004
4000275c:	d2c78513          	addi	a0,a5,-724 # 40003d2c <vga_simRes_h160_v120+0x3c>
40002760:	a51ff0ef          	jal	ra,400021b0 <print>
	print("\r\t                   ");
40002764:	400047b7          	lui	a5,0x40004
40002768:	d3078513          	addi	a0,a5,-720 # 40003d30 <vga_simRes_h160_v120+0x40>
4000276c:	a45ff0ef          	jal	ra,400021b0 <print>
	print32bit(num[7]);
40002770:	fe842783          	lw	a5,-24(s0)
40002774:	01c78793          	addi	a5,a5,28
40002778:	0007a783          	lw	a5,0(a5)
4000277c:	00078513          	mv	a0,a5
40002780:	b91ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[6]);
40002784:	fe842783          	lw	a5,-24(s0)
40002788:	01878793          	addi	a5,a5,24
4000278c:	0007a783          	lw	a5,0(a5)
40002790:	00078513          	mv	a0,a5
40002794:	b7dff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[5]);
40002798:	fe842783          	lw	a5,-24(s0)
4000279c:	01478793          	addi	a5,a5,20
400027a0:	0007a783          	lw	a5,0(a5)
400027a4:	00078513          	mv	a0,a5
400027a8:	b69ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[4]);
400027ac:	fe842783          	lw	a5,-24(s0)
400027b0:	01078793          	addi	a5,a5,16
400027b4:	0007a783          	lw	a5,0(a5)
400027b8:	00078513          	mv	a0,a5
400027bc:	b55ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[3]);
400027c0:	fe842783          	lw	a5,-24(s0)
400027c4:	00c78793          	addi	a5,a5,12
400027c8:	0007a783          	lw	a5,0(a5)
400027cc:	00078513          	mv	a0,a5
400027d0:	b41ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[2]);
400027d4:	fe842783          	lw	a5,-24(s0)
400027d8:	00878793          	addi	a5,a5,8
400027dc:	0007a783          	lw	a5,0(a5)
400027e0:	00078513          	mv	a0,a5
400027e4:	b2dff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[1]);
400027e8:	fe842783          	lw	a5,-24(s0)
400027ec:	00478793          	addi	a5,a5,4
400027f0:	0007a783          	lw	a5,0(a5)
400027f4:	00078513          	mv	a0,a5
400027f8:	b19ff0ef          	jal	ra,40002310 <print32bit>
	print32bit(num[0]);
400027fc:	fe842783          	lw	a5,-24(s0)
40002800:	0007a783          	lw	a5,0(a5)
40002804:	00078513          	mv	a0,a5
40002808:	b09ff0ef          	jal	ra,40002310 <print32bit>
	print("\r\n");
4000280c:	400047b7          	lui	a5,0x40004
40002810:	d2c78513          	addi	a0,a5,-724 # 40003d2c <vga_simRes_h160_v120+0x3c>
40002814:	99dff0ef          	jal	ra,400021b0 <print>
}
40002818:	00000013          	nop
4000281c:	01c12083          	lw	ra,28(sp)
40002820:	01812403          	lw	s0,24(sp)
40002824:	02010113          	addi	sp,sp,32
40002828:	00008067          	ret

4000282c <timer_init>:
static void timer_init(Timer_Reg *reg){
4000282c:	fe010113          	addi	sp,sp,-32
40002830:	00812e23          	sw	s0,28(sp)
40002834:	02010413          	addi	s0,sp,32
40002838:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
4000283c:	fec42783          	lw	a5,-20(s0)
40002840:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40002844:	fec42783          	lw	a5,-20(s0)
40002848:	0007a423          	sw	zero,8(a5)
}
4000284c:	00000013          	nop
40002850:	01c12403          	lw	s0,28(sp)
40002854:	02010113          	addi	sp,sp,32
40002858:	00008067          	ret

4000285c <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
4000285c:	fe010113          	addi	sp,sp,-32
40002860:	00812e23          	sw	s0,28(sp)
40002864:	02010413          	addi	s0,sp,32
40002868:	fea42623          	sw	a0,-20(s0)
}
4000286c:	00000013          	nop
40002870:	01c12403          	lw	s0,28(sp)
40002874:	02010113          	addi	sp,sp,32
40002878:	00008067          	ret

4000287c <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
4000287c:	fe010113          	addi	sp,sp,-32
40002880:	00812e23          	sw	s0,28(sp)
40002884:	02010413          	addi	s0,sp,32
40002888:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
4000288c:	fec42783          	lw	a5,-20(s0)
40002890:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40002894:	fec42783          	lw	a5,-20(s0)
40002898:	fff00713          	li	a4,-1
4000289c:	00e7a023          	sw	a4,0(a5)
}
400028a0:	00000013          	nop
400028a4:	01c12403          	lw	s0,28(sp)
400028a8:	02010113          	addi	sp,sp,32
400028ac:	00008067          	ret

400028b0 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
400028b0:	fe010113          	addi	sp,sp,-32
400028b4:	00812e23          	sw	s0,28(sp)
400028b8:	02010413          	addi	s0,sp,32
400028bc:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
400028c0:	fec42783          	lw	a5,-20(s0)
400028c4:	0047a783          	lw	a5,4(a5)
400028c8:	0107d793          	srli	a5,a5,0x10
400028cc:	0ff7f793          	zext.b	a5,a5
}
400028d0:	00078513          	mv	a0,a5
400028d4:	01c12403          	lw	s0,28(sp)
400028d8:	02010113          	addi	sp,sp,32
400028dc:	00008067          	ret

400028e0 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
400028e0:	fe010113          	addi	sp,sp,-32
400028e4:	00812e23          	sw	s0,28(sp)
400028e8:	02010413          	addi	s0,sp,32
400028ec:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
400028f0:	fec42783          	lw	a5,-20(s0)
400028f4:	0047a783          	lw	a5,4(a5)
400028f8:	0187d793          	srli	a5,a5,0x18
}
400028fc:	00078513          	mv	a0,a5
40002900:	01c12403          	lw	s0,28(sp)
40002904:	02010113          	addi	sp,sp,32
40002908:	00008067          	ret

4000290c <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
4000290c:	fe010113          	addi	sp,sp,-32
40002910:	00112e23          	sw	ra,28(sp)
40002914:	00812c23          	sw	s0,24(sp)
40002918:	02010413          	addi	s0,sp,32
4000291c:	fea42623          	sw	a0,-20(s0)
40002920:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40002924:	00000013          	nop
40002928:	fec42503          	lw	a0,-20(s0)
4000292c:	f85ff0ef          	jal	ra,400028b0 <uart_writeAvailability>
40002930:	00050793          	mv	a5,a0
40002934:	fe078ae3          	beqz	a5,40002928 <uart_write+0x1c>
	reg->DATA = data;
40002938:	fec42783          	lw	a5,-20(s0)
4000293c:	fe842703          	lw	a4,-24(s0)
40002940:	00e7a023          	sw	a4,0(a5)
}
40002944:	00000013          	nop
40002948:	01c12083          	lw	ra,28(sp)
4000294c:	01812403          	lw	s0,24(sp)
40002950:	02010113          	addi	sp,sp,32
40002954:	00008067          	ret

40002958 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40002958:	fe010113          	addi	sp,sp,-32
4000295c:	00812e23          	sw	s0,28(sp)
40002960:	02010413          	addi	s0,sp,32
40002964:	fea42623          	sw	a0,-20(s0)
40002968:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
4000296c:	fe842783          	lw	a5,-24(s0)
40002970:	00c7a703          	lw	a4,12(a5)
40002974:	fec42783          	lw	a5,-20(s0)
40002978:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
4000297c:	fe842783          	lw	a5,-24(s0)
40002980:	0007a783          	lw	a5,0(a5)
40002984:	fff78713          	addi	a4,a5,-1
40002988:	fe842783          	lw	a5,-24(s0)
4000298c:	0047a783          	lw	a5,4(a5)
40002990:	00879793          	slli	a5,a5,0x8
40002994:	00f76733          	or	a4,a4,a5
40002998:	fe842783          	lw	a5,-24(s0)
4000299c:	0087a783          	lw	a5,8(a5)
400029a0:	01079793          	slli	a5,a5,0x10
400029a4:	00f76733          	or	a4,a4,a5
400029a8:	fec42783          	lw	a5,-20(s0)
400029ac:	00e7a623          	sw	a4,12(a5)
}
400029b0:	00000013          	nop
400029b4:	01c12403          	lw	s0,28(sp)
400029b8:	02010113          	addi	sp,sp,32
400029bc:	00008067          	ret

400029c0 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
400029c0:	fe010113          	addi	sp,sp,-32
400029c4:	00812e23          	sw	s0,28(sp)
400029c8:	02010413          	addi	s0,sp,32
400029cc:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
400029d0:	fec42783          	lw	a5,-20(s0)
400029d4:	0007a783          	lw	a5,0(a5)
400029d8:	0027f793          	andi	a5,a5,2
400029dc:	00f037b3          	snez	a5,a5
400029e0:	0ff7f793          	zext.b	a5,a5
}
400029e4:	00078513          	mv	a0,a5
400029e8:	01c12403          	lw	s0,28(sp)
400029ec:	02010113          	addi	sp,sp,32
400029f0:	00008067          	ret

400029f4 <vga_run>:
static void vga_run(Vga_Reg *reg){
400029f4:	fe010113          	addi	sp,sp,-32
400029f8:	00812e23          	sw	s0,28(sp)
400029fc:	02010413          	addi	s0,sp,32
40002a00:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40002a04:	fec42783          	lw	a5,-20(s0)
40002a08:	00100713          	li	a4,1
40002a0c:	00e7a023          	sw	a4,0(a5)
}
40002a10:	00000013          	nop
40002a14:	01c12403          	lw	s0,28(sp)
40002a18:	02010113          	addi	sp,sp,32
40002a1c:	00008067          	ret

40002a20 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40002a20:	fe010113          	addi	sp,sp,-32
40002a24:	00112e23          	sw	ra,28(sp)
40002a28:	00812c23          	sw	s0,24(sp)
40002a2c:	02010413          	addi	s0,sp,32
40002a30:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40002a34:	fec42783          	lw	a5,-20(s0)
40002a38:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40002a3c:	00000013          	nop
40002a40:	fec42503          	lw	a0,-20(s0)
40002a44:	f7dff0ef          	jal	ra,400029c0 <vga_isBusy>
40002a48:	00050793          	mv	a5,a0
40002a4c:	fe079ae3          	bnez	a5,40002a40 <vga_stop+0x20>
}
40002a50:	00000013          	nop
40002a54:	00000013          	nop
40002a58:	01c12083          	lw	ra,28(sp)
40002a5c:	01812403          	lw	s0,24(sp)
40002a60:	02010113          	addi	sp,sp,32
40002a64:	00008067          	ret

40002a68 <poly_write>:
#include "briey.h"
void poly_write(uint32_t iData, uint32_t iAddress)
{
40002a68:	fe010113          	addi	sp,sp,-32
40002a6c:	00812e23          	sw	s0,28(sp)
40002a70:	02010413          	addi	s0,sp,32
40002a74:	fea42623          	sw	a0,-20(s0)
40002a78:	feb42423          	sw	a1,-24(s0)
	POLY_BASE->ADDRESS			= iAddress;
40002a7c:	f00037b7          	lui	a5,0xf0003
40002a80:	fe842703          	lw	a4,-24(s0)
40002a84:	00e7a423          	sw	a4,8(a5) # f0003008 <_stack_start+0x700026c8>
	POLY_BASE->WRITE_ENABLE 	= 1;
40002a88:	f00037b7          	lui	a5,0xf0003
40002a8c:	00100713          	li	a4,1
40002a90:	00e7a223          	sw	a4,4(a5) # f0003004 <_stack_start+0x700026c4>
	POLY_BASE->IDATA			= iData;
40002a94:	f00037b7          	lui	a5,0xf0003
40002a98:	fec42703          	lw	a4,-20(s0)
40002a9c:	00e7a623          	sw	a4,12(a5) # f000300c <_stack_start+0x700026cc>
	POLY_BASE->CHIP_SELECT		= 1;
40002aa0:	f00037b7          	lui	a5,0xf0003
40002aa4:	00100713          	li	a4,1
40002aa8:	00e7a023          	sw	a4,0(a5) # f0003000 <_stack_start+0x700026c0>
	POLY_BASE->CHIP_SELECT		= 0;
40002aac:	f00037b7          	lui	a5,0xf0003
40002ab0:	0007a023          	sw	zero,0(a5) # f0003000 <_stack_start+0x700026c0>
}
40002ab4:	00000013          	nop
40002ab8:	01c12403          	lw	s0,28(sp)
40002abc:	02010113          	addi	sp,sp,32
40002ac0:	00008067          	ret

40002ac4 <poly_read>:
uint32_t poly_read(uint32_t iAddress)
{
40002ac4:	fd010113          	addi	sp,sp,-48
40002ac8:	02812623          	sw	s0,44(sp)
40002acc:	03010413          	addi	s0,sp,48
40002ad0:	fca42e23          	sw	a0,-36(s0)
	POLY_BASE->ADDRESS		= iAddress;
40002ad4:	f00037b7          	lui	a5,0xf0003
40002ad8:	fdc42703          	lw	a4,-36(s0)
40002adc:	00e7a423          	sw	a4,8(a5) # f0003008 <_stack_start+0x700026c8>
	POLY_BASE->WRITE_ENABLE	= 0;
40002ae0:	f00037b7          	lui	a5,0xf0003
40002ae4:	0007a223          	sw	zero,4(a5) # f0003004 <_stack_start+0x700026c4>
	POLY_BASE->CHIP_SELECT	= 1;
40002ae8:	f00037b7          	lui	a5,0xf0003
40002aec:	00100713          	li	a4,1
40002af0:	00e7a023          	sw	a4,0(a5) # f0003000 <_stack_start+0x700026c0>
	uint32_t res 			= POLY_BASE->ODATA;
40002af4:	f00037b7          	lui	a5,0xf0003
40002af8:	0107a783          	lw	a5,16(a5) # f0003010 <_stack_start+0x700026d0>
40002afc:	fef42623          	sw	a5,-20(s0)
	POLY_BASE->CHIP_SELECT	= 0;
40002b00:	f00037b7          	lui	a5,0xf0003
40002b04:	0007a023          	sw	zero,0(a5) # f0003000 <_stack_start+0x700026c0>
	return res;
40002b08:	fec42783          	lw	a5,-20(s0)
}
40002b0c:	00078513          	mv	a0,a5
40002b10:	02c12403          	lw	s0,44(sp)
40002b14:	03010113          	addi	sp,sp,48
40002b18:	00008067          	ret

40002b1c <poly_init>:
//1. write 256-bit to key
//2. reset block
//3. write 1 to ctrl_reg
//4. wait ready
void poly_init(uint32_t *key)
{
40002b1c:	fe010113          	addi	sp,sp,-32
40002b20:	00112e23          	sw	ra,28(sp)
40002b24:	00812c23          	sw	s0,24(sp)
40002b28:	02010413          	addi	s0,sp,32
40002b2c:	fea42623          	sw	a0,-20(s0)
	poly_write(key[7],POLY_ADDR_KEY_BASE);
40002b30:	fec42783          	lw	a5,-20(s0)
40002b34:	01c78793          	addi	a5,a5,28
40002b38:	0007a783          	lw	a5,0(a5)
40002b3c:	01000593          	li	a1,16
40002b40:	00078513          	mv	a0,a5
40002b44:	f25ff0ef          	jal	ra,40002a68 <poly_write>
	poly_write(key[6],POLY_ADDR_KEY_BASE + 1);
40002b48:	fec42783          	lw	a5,-20(s0)
40002b4c:	01878793          	addi	a5,a5,24
40002b50:	0007a783          	lw	a5,0(a5)
40002b54:	01100593          	li	a1,17
40002b58:	00078513          	mv	a0,a5
40002b5c:	f0dff0ef          	jal	ra,40002a68 <poly_write>
	poly_write(key[5],POLY_ADDR_KEY_BASE + 2);
40002b60:	fec42783          	lw	a5,-20(s0)
40002b64:	01478793          	addi	a5,a5,20
40002b68:	0007a783          	lw	a5,0(a5)
40002b6c:	01200593          	li	a1,18
40002b70:	00078513          	mv	a0,a5
40002b74:	ef5ff0ef          	jal	ra,40002a68 <poly_write>
	poly_write(key[4],POLY_ADDR_KEY_BASE + 3);
40002b78:	fec42783          	lw	a5,-20(s0)
40002b7c:	01078793          	addi	a5,a5,16
40002b80:	0007a783          	lw	a5,0(a5)
40002b84:	01300593          	li	a1,19
40002b88:	00078513          	mv	a0,a5
40002b8c:	eddff0ef          	jal	ra,40002a68 <poly_write>
	poly_write(key[3],POLY_ADDR_KEY_BASE + 4);
40002b90:	fec42783          	lw	a5,-20(s0)
40002b94:	00c78793          	addi	a5,a5,12
40002b98:	0007a783          	lw	a5,0(a5)
40002b9c:	01400593          	li	a1,20
40002ba0:	00078513          	mv	a0,a5
40002ba4:	ec5ff0ef          	jal	ra,40002a68 <poly_write>
	poly_write(key[2],POLY_ADDR_KEY_BASE + 5);
40002ba8:	fec42783          	lw	a5,-20(s0)
40002bac:	00878793          	addi	a5,a5,8
40002bb0:	0007a783          	lw	a5,0(a5)
40002bb4:	01500593          	li	a1,21
40002bb8:	00078513          	mv	a0,a5
40002bbc:	eadff0ef          	jal	ra,40002a68 <poly_write>
	poly_write(key[1],POLY_ADDR_KEY_BASE + 6);
40002bc0:	fec42783          	lw	a5,-20(s0)
40002bc4:	00478793          	addi	a5,a5,4
40002bc8:	0007a783          	lw	a5,0(a5)
40002bcc:	01600593          	li	a1,22
40002bd0:	00078513          	mv	a0,a5
40002bd4:	e95ff0ef          	jal	ra,40002a68 <poly_write>
	poly_write(key[0],POLY_ADDR_KEY_BASE + 7);
40002bd8:	fec42783          	lw	a5,-20(s0)
40002bdc:	0007a783          	lw	a5,0(a5)
40002be0:	01700593          	li	a1,23
40002be4:	00078513          	mv	a0,a5
40002be8:	e81ff0ef          	jal	ra,40002a68 <poly_write>

	poly_write(0x0,POLY_ADDR_BLOCK_BASE);
40002bec:	02000593          	li	a1,32
40002bf0:	00000513          	li	a0,0
40002bf4:	e75ff0ef          	jal	ra,40002a68 <poly_write>
	poly_write(0x0,POLY_ADDR_BLOCK_BASE + 1);
40002bf8:	02100593          	li	a1,33
40002bfc:	00000513          	li	a0,0
40002c00:	e69ff0ef          	jal	ra,40002a68 <poly_write>
	poly_write(0x0,POLY_ADDR_BLOCK_BASE + 2);
40002c04:	02200593          	li	a1,34
40002c08:	00000513          	li	a0,0
40002c0c:	e5dff0ef          	jal	ra,40002a68 <poly_write>
	poly_write(0x0,POLY_ADDR_BLOCK_BASE + 3);
40002c10:	02300593          	li	a1,35
40002c14:	00000513          	li	a0,0
40002c18:	e51ff0ef          	jal	ra,40002a68 <poly_write>

	poly_write(CONST_INIT,POLY_ADDR_CTRL);
40002c1c:	00800593          	li	a1,8
40002c20:	00100513          	li	a0,1
40002c24:	e45ff0ef          	jal	ra,40002a68 <poly_write>
	while(poly_read(POLY_ADDR_STATUS)==0);
40002c28:	00000013          	nop
40002c2c:	00900513          	li	a0,9
40002c30:	e95ff0ef          	jal	ra,40002ac4 <poly_read>
40002c34:	00050793          	mv	a5,a0
40002c38:	fe078ae3          	beqz	a5,40002c2c <poly_init+0x110>
}
40002c3c:	00000013          	nop
40002c40:	00000013          	nop
40002c44:	01c12083          	lw	ra,28(sp)
40002c48:	01812403          	lw	s0,24(sp)
40002c4c:	02010113          	addi	sp,sp,32
40002c50:	00008067          	ret

40002c54 <poly_write_block>:
//1. write data to block
//2. set number of bytes of block
//3. write 2 to ctrl_reg
//4. wait ready
void poly_write_block(uint32_t block_length,uint32_t *block)
{
40002c54:	fe010113          	addi	sp,sp,-32
40002c58:	00112e23          	sw	ra,28(sp)
40002c5c:	00812c23          	sw	s0,24(sp)
40002c60:	02010413          	addi	s0,sp,32
40002c64:	fea42623          	sw	a0,-20(s0)
40002c68:	feb42423          	sw	a1,-24(s0)
	//16 bytes block input
	poly_write(block[3],POLY_ADDR_BLOCK_BASE);
40002c6c:	fe842783          	lw	a5,-24(s0)
40002c70:	00c78793          	addi	a5,a5,12
40002c74:	0007a783          	lw	a5,0(a5)
40002c78:	02000593          	li	a1,32
40002c7c:	00078513          	mv	a0,a5
40002c80:	de9ff0ef          	jal	ra,40002a68 <poly_write>
	poly_write(block[2],POLY_ADDR_BLOCK_BASE + 1);
40002c84:	fe842783          	lw	a5,-24(s0)
40002c88:	00878793          	addi	a5,a5,8
40002c8c:	0007a783          	lw	a5,0(a5)
40002c90:	02100593          	li	a1,33
40002c94:	00078513          	mv	a0,a5
40002c98:	dd1ff0ef          	jal	ra,40002a68 <poly_write>
	poly_write(block[1],POLY_ADDR_BLOCK_BASE + 2);
40002c9c:	fe842783          	lw	a5,-24(s0)
40002ca0:	00478793          	addi	a5,a5,4
40002ca4:	0007a783          	lw	a5,0(a5)
40002ca8:	02200593          	li	a1,34
40002cac:	00078513          	mv	a0,a5
40002cb0:	db9ff0ef          	jal	ra,40002a68 <poly_write>
	poly_write(block[0],POLY_ADDR_BLOCK_BASE + 3);
40002cb4:	fe842783          	lw	a5,-24(s0)
40002cb8:	0007a783          	lw	a5,0(a5)
40002cbc:	02300593          	li	a1,35
40002cc0:	00078513          	mv	a0,a5
40002cc4:	da5ff0ef          	jal	ra,40002a68 <poly_write>

	//Set number of bytes
	poly_write(block_length,POLY_ADDR_BLOCKLEN);
40002cc8:	00a00593          	li	a1,10
40002ccc:	fec42503          	lw	a0,-20(s0)
40002cd0:	d99ff0ef          	jal	ra,40002a68 <poly_write>

	//write next to ctrl_reg
	poly_write(CONST_NEXT,POLY_ADDR_CTRL);
40002cd4:	00800593          	li	a1,8
40002cd8:	00200513          	li	a0,2
40002cdc:	d8dff0ef          	jal	ra,40002a68 <poly_write>

	//wait ready
	while(poly_read(POLY_ADDR_STATUS)==0);
40002ce0:	00000013          	nop
40002ce4:	00900513          	li	a0,9
40002ce8:	dddff0ef          	jal	ra,40002ac4 <poly_read>
40002cec:	00050793          	mv	a5,a0
40002cf0:	fe078ae3          	beqz	a5,40002ce4 <poly_write_block+0x90>

}
40002cf4:	00000013          	nop
40002cf8:	00000013          	nop
40002cfc:	01c12083          	lw	ra,28(sp)
40002d00:	01812403          	lw	s0,24(sp)
40002d04:	02010113          	addi	sp,sp,32
40002d08:	00008067          	ret

40002d0c <get_MAC>:

//get_MAC (result) function:
//1.write 4 to ctrl_reg
//2.wait ready
void get_MAC(uint32_t *MAC)
{
40002d0c:	fe010113          	addi	sp,sp,-32
40002d10:	00112e23          	sw	ra,28(sp)
40002d14:	00812c23          	sw	s0,24(sp)
40002d18:	00912a23          	sw	s1,20(sp)
40002d1c:	02010413          	addi	s0,sp,32
40002d20:	fea42623          	sw	a0,-20(s0)
	poly_write(CONST_FINISH,POLY_ADDR_CTRL);
40002d24:	00800593          	li	a1,8
40002d28:	00400513          	li	a0,4
40002d2c:	d3dff0ef          	jal	ra,40002a68 <poly_write>
	while(poly_read(POLY_ADDR_STATUS)==0);
40002d30:	00000013          	nop
40002d34:	00900513          	li	a0,9
40002d38:	d8dff0ef          	jal	ra,40002ac4 <poly_read>
40002d3c:	00050793          	mv	a5,a0
40002d40:	fe078ae3          	beqz	a5,40002d34 <get_MAC+0x28>
	MAC[3] = poly_read(POLY_ADDR_RESULT_BASE);
40002d44:	fec42783          	lw	a5,-20(s0)
40002d48:	00c78493          	addi	s1,a5,12
40002d4c:	03000513          	li	a0,48
40002d50:	d75ff0ef          	jal	ra,40002ac4 <poly_read>
40002d54:	00050793          	mv	a5,a0
40002d58:	00f4a023          	sw	a5,0(s1)
	MAC[2] = poly_read(POLY_ADDR_RESULT_BASE + 1);
40002d5c:	fec42783          	lw	a5,-20(s0)
40002d60:	00878493          	addi	s1,a5,8
40002d64:	03100513          	li	a0,49
40002d68:	d5dff0ef          	jal	ra,40002ac4 <poly_read>
40002d6c:	00050793          	mv	a5,a0
40002d70:	00f4a023          	sw	a5,0(s1)
	MAC[1] = poly_read(POLY_ADDR_RESULT_BASE + 2);
40002d74:	fec42783          	lw	a5,-20(s0)
40002d78:	00478493          	addi	s1,a5,4
40002d7c:	03200513          	li	a0,50
40002d80:	d45ff0ef          	jal	ra,40002ac4 <poly_read>
40002d84:	00050793          	mv	a5,a0
40002d88:	00f4a023          	sw	a5,0(s1)
	MAC[0] = poly_read(POLY_ADDR_RESULT_BASE + 3);
40002d8c:	03300513          	li	a0,51
40002d90:	d35ff0ef          	jal	ra,40002ac4 <poly_read>
40002d94:	00050713          	mv	a4,a0
40002d98:	fec42783          	lw	a5,-20(s0)
40002d9c:	00e7a023          	sw	a4,0(a5)
}
40002da0:	00000013          	nop
40002da4:	01c12083          	lw	ra,28(sp)
40002da8:	01812403          	lw	s0,24(sp)
40002dac:	01412483          	lw	s1,20(sp)
40002db0:	02010113          	addi	sp,sp,32
40002db4:	00008067          	ret

40002db8 <poly_test_N_bytes>:
void poly_test_N_bytes(uint32_t block_length,uint32_t *key, uint32_t *block, uint32_t *res)
{
40002db8:	fe010113          	addi	sp,sp,-32
40002dbc:	00112e23          	sw	ra,28(sp)
40002dc0:	00812c23          	sw	s0,24(sp)
40002dc4:	02010413          	addi	s0,sp,32
40002dc8:	fea42623          	sw	a0,-20(s0)
40002dcc:	feb42423          	sw	a1,-24(s0)
40002dd0:	fec42223          	sw	a2,-28(s0)
40002dd4:	fed42023          	sw	a3,-32(s0)

	poly_init(key);
40002dd8:	fe842503          	lw	a0,-24(s0)
40002ddc:	d41ff0ef          	jal	ra,40002b1c <poly_init>
	poly_write_block(block_length,block);
40002de0:	fe442583          	lw	a1,-28(s0)
40002de4:	fec42503          	lw	a0,-20(s0)
40002de8:	e6dff0ef          	jal	ra,40002c54 <poly_write_block>
	get_MAC(res);
40002dec:	fe042503          	lw	a0,-32(s0)
40002df0:	f1dff0ef          	jal	ra,40002d0c <get_MAC>

	print("\r\n");
40002df4:	400047b7          	lui	a5,0x40004
40002df8:	da878513          	addi	a0,a5,-600 # 40003da8 <vga_simRes_h160_v120+0x20>
40002dfc:	bb4ff0ef          	jal	ra,400021b0 <print>
	print128bit("\r\tPLAIN_TEXT (128-bit) : ", block);
40002e00:	fe442583          	lw	a1,-28(s0)
40002e04:	400047b7          	lui	a5,0x40004
40002e08:	dac78513          	addi	a0,a5,-596 # 40003dac <vga_simRes_h160_v120+0x24>
40002e0c:	e7cff0ef          	jal	ra,40002488 <print128bit>
	print256bit("KEY (256-bit): ", key);
40002e10:	fe842583          	lw	a1,-24(s0)
40002e14:	400047b7          	lui	a5,0x40004
40002e18:	dc878513          	addi	a0,a5,-568 # 40003dc8 <vga_simRes_h160_v120+0x40>
40002e1c:	f88ff0ef          	jal	ra,400025a4 <print256bit>
	print128bit("RESULT (128-bit) : ", res);
40002e20:	fe042583          	lw	a1,-32(s0)
40002e24:	400047b7          	lui	a5,0x40004
40002e28:	dd878513          	addi	a0,a5,-552 # 40003dd8 <vga_simRes_h160_v120+0x50>
40002e2c:	e5cff0ef          	jal	ra,40002488 <print128bit>

}
40002e30:	00000013          	nop
40002e34:	01c12083          	lw	ra,28(sp)
40002e38:	01812403          	lw	s0,24(sp)
40002e3c:	02010113          	addi	sp,sp,32
40002e40:	00008067          	ret

40002e44 <poly_test_rfc8439>:

void poly_test_rfc8439()
{
40002e44:	f9010113          	addi	sp,sp,-112
40002e48:	06112623          	sw	ra,108(sp)
40002e4c:	06812423          	sw	s0,104(sp)
40002e50:	07010413          	addi	s0,sp,112
	uint32_t rfc8439_key[8];
	uint32_t rfc8439_block2[4];
	uint32_t rfc8439_block1[4];
	uint32_t rfc8439_block0[4];

	rfc8439_key[7]= 0x85d6be78;
40002e54:	85d6c7b7          	lui	a5,0x85d6c
40002e58:	e7878793          	addi	a5,a5,-392 # 85d6be78 <_stack_start+0x5d6b538>
40002e5c:	fef42623          	sw	a5,-20(s0)
	rfc8439_key[6]= 0x57556d33;
40002e60:	575577b7          	lui	a5,0x57557
40002e64:	d3378793          	addi	a5,a5,-717 # 57556d33 <__global_pointer$+0x175526d3>
40002e68:	fef42423          	sw	a5,-24(s0)
	rfc8439_key[5]= 0x7f4452fe;
40002e6c:	7f4457b7          	lui	a5,0x7f445
40002e70:	2fe78793          	addi	a5,a5,766 # 7f4452fe <__global_pointer$+0x3f440c9e>
40002e74:	fef42223          	sw	a5,-28(s0)
	rfc8439_key[4]= 0x42d506a8;
40002e78:	42d507b7          	lui	a5,0x42d50
40002e7c:	6a878793          	addi	a5,a5,1704 # 42d506a8 <__global_pointer$+0x2d4c048>
40002e80:	fef42023          	sw	a5,-32(s0)
	rfc8439_key[3]= 0x0103808a;
40002e84:	010387b7          	lui	a5,0x1038
40002e88:	08a78793          	addi	a5,a5,138 # 103808a <_stack_size+0x103788a>
40002e8c:	fcf42e23          	sw	a5,-36(s0)
	rfc8439_key[2]= 0xfb0db2fd;
40002e90:	fb0db7b7          	lui	a5,0xfb0db
40002e94:	2fd78793          	addi	a5,a5,765 # fb0db2fd <_stack_start+0x7b0da9bd>
40002e98:	fcf42c23          	sw	a5,-40(s0)
	rfc8439_key[1]= 0x4abff6af;
40002e9c:	4abff7b7          	lui	a5,0x4abff
40002ea0:	6af78793          	addi	a5,a5,1711 # 4abff6af <__global_pointer$+0xabfb04f>
40002ea4:	fcf42a23          	sw	a5,-44(s0)
	rfc8439_key[0]= 0x4149f51b;
40002ea8:	4149f7b7          	lui	a5,0x4149f
40002eac:	51b78793          	addi	a5,a5,1307 # 4149f51b <__global_pointer$+0x149aebb>
40002eb0:	fcf42823          	sw	a5,-48(s0)

	rfc8439_block2[3]= 0x43727970;
40002eb4:	437287b7          	lui	a5,0x43728
40002eb8:	97078793          	addi	a5,a5,-1680 # 43727970 <__global_pointer$+0x3723310>
40002ebc:	fcf42623          	sw	a5,-52(s0)
	rfc8439_block2[2]= 0x746f6772;
40002ec0:	746f67b7          	lui	a5,0x746f6
40002ec4:	77278793          	addi	a5,a5,1906 # 746f6772 <__global_pointer$+0x346f2112>
40002ec8:	fcf42423          	sw	a5,-56(s0)
	rfc8439_block2[1]= 0x61706869;
40002ecc:	617077b7          	lui	a5,0x61707
40002ed0:	86978793          	addi	a5,a5,-1943 # 61706869 <__global_pointer$+0x21702209>
40002ed4:	fcf42223          	sw	a5,-60(s0)
	rfc8439_block2[0]= 0x6320466f;
40002ed8:	632047b7          	lui	a5,0x63204
40002edc:	66f78793          	addi	a5,a5,1647 # 6320466f <__global_pointer$+0x2320000f>
40002ee0:	fcf42023          	sw	a5,-64(s0)

	rfc8439_block1[3]= 0x72756d20;
40002ee4:	727577b7          	lui	a5,0x72757
40002ee8:	d2078793          	addi	a5,a5,-736 # 72756d20 <__global_pointer$+0x327526c0>
40002eec:	faf42e23          	sw	a5,-68(s0)
	rfc8439_block1[2]= 0x52657365;
40002ef0:	526577b7          	lui	a5,0x52657
40002ef4:	36578793          	addi	a5,a5,869 # 52657365 <__global_pointer$+0x12652d05>
40002ef8:	faf42c23          	sw	a5,-72(s0)
	rfc8439_block1[1]= 0x61726368;
40002efc:	617267b7          	lui	a5,0x61726
40002f00:	36878793          	addi	a5,a5,872 # 61726368 <__global_pointer$+0x21721d08>
40002f04:	faf42a23          	sw	a5,-76(s0)
	rfc8439_block1[0]= 0x2047726f;
40002f08:	204777b7          	lui	a5,0x20477
40002f0c:	26f78793          	addi	a5,a5,623 # 2047726f <_stack_size+0x20476a6f>
40002f10:	faf42823          	sw	a5,-80(s0)

	rfc8439_block0[3]= 0x75700000;
40002f14:	757007b7          	lui	a5,0x75700
40002f18:	faf42623          	sw	a5,-84(s0)
	rfc8439_block0[2]= 0x00000000;
40002f1c:	fa042423          	sw	zero,-88(s0)
	rfc8439_block0[1]= 0x00000000;
40002f20:	fa042223          	sw	zero,-92(s0)
	rfc8439_block0[0]= 0x00000000;
40002f24:	fa042023          	sw	zero,-96(s0)

	uint32_t rfc8439_res[4] = {0x00, 0x00, 0x00,0x00};
40002f28:	f8042823          	sw	zero,-112(s0)
40002f2c:	f8042a23          	sw	zero,-108(s0)
40002f30:	f8042c23          	sw	zero,-104(s0)
40002f34:	f8042e23          	sw	zero,-100(s0)

	//PROCESSING
	poly_init(rfc8439_key);
40002f38:	fd040793          	addi	a5,s0,-48
40002f3c:	00078513          	mv	a0,a5
40002f40:	bddff0ef          	jal	ra,40002b1c <poly_init>
	poly_write_block(0x10,rfc8439_block2);
40002f44:	fc040793          	addi	a5,s0,-64
40002f48:	00078593          	mv	a1,a5
40002f4c:	01000513          	li	a0,16
40002f50:	d05ff0ef          	jal	ra,40002c54 <poly_write_block>
	poly_write_block(0x10,rfc8439_block1);
40002f54:	fb040793          	addi	a5,s0,-80
40002f58:	00078593          	mv	a1,a5
40002f5c:	01000513          	li	a0,16
40002f60:	cf5ff0ef          	jal	ra,40002c54 <poly_write_block>
	poly_write_block(0x2,rfc8439_block0);
40002f64:	fa040793          	addi	a5,s0,-96
40002f68:	00078593          	mv	a1,a5
40002f6c:	00200513          	li	a0,2
40002f70:	ce5ff0ef          	jal	ra,40002c54 <poly_write_block>

	//OUTPUT
	get_MAC(rfc8439_res);
40002f74:	f9040793          	addi	a5,s0,-112
40002f78:	00078513          	mv	a0,a5
40002f7c:	d91ff0ef          	jal	ra,40002d0c <get_MAC>

	//print
	print128bit("\r\tPLAIN_TEXT (272-bit) : ", rfc8439_block2);
40002f80:	fc040793          	addi	a5,s0,-64
40002f84:	00078593          	mv	a1,a5
40002f88:	400047b7          	lui	a5,0x40004
40002f8c:	dec78513          	addi	a0,a5,-532 # 40003dec <vga_simRes_h160_v120+0x64>
40002f90:	cf8ff0ef          	jal	ra,40002488 <print128bit>
	print128bit("\r\t                       ", rfc8439_block1);
40002f94:	fb040793          	addi	a5,s0,-80
40002f98:	00078593          	mv	a1,a5
40002f9c:	400047b7          	lui	a5,0x40004
40002fa0:	e0878513          	addi	a0,a5,-504 # 40003e08 <vga_simRes_h160_v120+0x80>
40002fa4:	ce4ff0ef          	jal	ra,40002488 <print128bit>
	print("\r\t                       ");
40002fa8:	400047b7          	lui	a5,0x40004
40002fac:	e0878513          	addi	a0,a5,-504 # 40003e08 <vga_simRes_h160_v120+0x80>
40002fb0:	a00ff0ef          	jal	ra,400021b0 <print>
	print16bit(0x7570);
40002fb4:	000077b7          	lui	a5,0x7
40002fb8:	57078513          	addi	a0,a5,1392 # 7570 <_stack_size+0x6d70>
40002fbc:	a4cff0ef          	jal	ra,40002208 <print16bit>
	print("\r\n");
40002fc0:	400047b7          	lui	a5,0x40004
40002fc4:	da878513          	addi	a0,a5,-600 # 40003da8 <vga_simRes_h160_v120+0x20>
40002fc8:	9e8ff0ef          	jal	ra,400021b0 <print>


	print256bit("KEY (256-bit): ", rfc8439_key);
40002fcc:	fd040793          	addi	a5,s0,-48
40002fd0:	00078593          	mv	a1,a5
40002fd4:	400047b7          	lui	a5,0x40004
40002fd8:	dc878513          	addi	a0,a5,-568 # 40003dc8 <vga_simRes_h160_v120+0x40>
40002fdc:	dc8ff0ef          	jal	ra,400025a4 <print256bit>

	print128bit("RESULT (128-bit) : ", rfc8439_res);
40002fe0:	f9040793          	addi	a5,s0,-112
40002fe4:	00078593          	mv	a1,a5
40002fe8:	400047b7          	lui	a5,0x40004
40002fec:	dd878513          	addi	a0,a5,-552 # 40003dd8 <vga_simRes_h160_v120+0x50>
40002ff0:	c98ff0ef          	jal	ra,40002488 <print128bit>
}
40002ff4:	00000013          	nop
40002ff8:	06c12083          	lw	ra,108(sp)
40002ffc:	06812403          	lw	s0,104(sp)
40003000:	07010113          	addi	sp,sp,112
40003004:	00008067          	ret

40003008 <poly_test_long>:

void poly_test_long()
{
40003008:	f9010113          	addi	sp,sp,-112
4000300c:	06112623          	sw	ra,108(sp)
40003010:	06812423          	sw	s0,104(sp)
40003014:	07010413          	addi	s0,sp,112
	uint32_t long_key[8];
	uint32_t long_block[4];
	uint32_t long_block_final[4];
	uint32_t long_res[4] = {0x00, 0x00, 0x00,0x00};
40003018:	f8042e23          	sw	zero,-100(s0)
4000301c:	fa042023          	sw	zero,-96(s0)
40003020:	fa042223          	sw	zero,-92(s0)
40003024:	fa042423          	sw	zero,-88(s0)

	long_key[7]= 0xf3000000;
40003028:	f30007b7          	lui	a5,0xf3000
4000302c:	fef42423          	sw	a5,-24(s0)
	long_key[6]= 0x00000000;
40003030:	fe042223          	sw	zero,-28(s0)
	long_key[5]= 0x00000000;
40003034:	fe042023          	sw	zero,-32(s0)
	long_key[4]= 0x0000003f;
40003038:	03f00793          	li	a5,63
4000303c:	fcf42e23          	sw	a5,-36(s0)
	long_key[3]= 0x3f000000;
40003040:	3f0007b7          	lui	a5,0x3f000
40003044:	fcf42c23          	sw	a5,-40(s0)
	long_key[2]= 0x00000000;
40003048:	fc042a23          	sw	zero,-44(s0)
	long_key[1]= 0x00000000;
4000304c:	fc042823          	sw	zero,-48(s0)
	long_key[0]= 0x000000f3;
40003050:	0f300793          	li	a5,243
40003054:	fcf42623          	sw	a5,-52(s0)

	long_block[3]= 0xffffffff;
40003058:	fff00793          	li	a5,-1
4000305c:	fcf42423          	sw	a5,-56(s0)
	long_block[2]= 0xffffffff;
40003060:	fff00793          	li	a5,-1
40003064:	fcf42223          	sw	a5,-60(s0)
	long_block[1]= 0xffffffff;
40003068:	fff00793          	li	a5,-1
4000306c:	fcf42023          	sw	a5,-64(s0)
	long_block[0]= 0xffffffff;
40003070:	fff00793          	li	a5,-1
40003074:	faf42e23          	sw	a5,-68(s0)

	long_block_final[3]= 0x01000000;
40003078:	010007b7          	lui	a5,0x1000
4000307c:	faf42c23          	sw	a5,-72(s0)
	long_block_final[2]= 0x00000000;
40003080:	fa042a23          	sw	zero,-76(s0)
	long_block_final[1]= 0x00000000;
40003084:	fa042823          	sw	zero,-80(s0)
	long_block_final[0]= 0x00000000;
40003088:	fa042623          	sw	zero,-84(s0)

	//PROCESS
	poly_init(long_key);
4000308c:	fcc40793          	addi	a5,s0,-52
40003090:	00078513          	mv	a0,a5
40003094:	a89ff0ef          	jal	ra,40002b1c <poly_init>
	//write 64x128 bit block
	for(int i=0;i<64;i++)
40003098:	fe042623          	sw	zero,-20(s0)
4000309c:	0200006f          	j	400030bc <poly_test_long+0xb4>
	{
		poly_write_block(0x10,long_block);
400030a0:	fbc40793          	addi	a5,s0,-68
400030a4:	00078593          	mv	a1,a5
400030a8:	01000513          	li	a0,16
400030ac:	ba9ff0ef          	jal	ra,40002c54 <poly_write_block>
	for(int i=0;i<64;i++)
400030b0:	fec42783          	lw	a5,-20(s0)
400030b4:	00178793          	addi	a5,a5,1 # 1000001 <_stack_size+0xfff801>
400030b8:	fef42623          	sw	a5,-20(s0)
400030bc:	fec42703          	lw	a4,-20(s0)
400030c0:	03f00793          	li	a5,63
400030c4:	fce7dee3          	bge	a5,a4,400030a0 <poly_test_long+0x98>
	}
	//write final block
	poly_write_block(0x1,long_block_final);
400030c8:	fac40793          	addi	a5,s0,-84
400030cc:	00078593          	mv	a1,a5
400030d0:	00100513          	li	a0,1
400030d4:	b81ff0ef          	jal	ra,40002c54 <poly_write_block>

	//get result
	get_MAC(long_res);
400030d8:	f9c40793          	addi	a5,s0,-100
400030dc:	00078513          	mv	a0,a5
400030e0:	c2dff0ef          	jal	ra,40002d0c <get_MAC>

	//print
	print256bit("PLAIN_TEXT (8200-bit) : 0xff..ff01\r\n\tKEY (256-bit): ", long_key);
400030e4:	fcc40793          	addi	a5,s0,-52
400030e8:	00078593          	mv	a1,a5
400030ec:	400047b7          	lui	a5,0x40004
400030f0:	e2478513          	addi	a0,a5,-476 # 40003e24 <vga_simRes_h160_v120+0x9c>
400030f4:	cb0ff0ef          	jal	ra,400025a4 <print256bit>
	print128bit("RESULT (128-bit) : ", long_res);
400030f8:	f9c40793          	addi	a5,s0,-100
400030fc:	00078593          	mv	a1,a5
40003100:	400047b7          	lui	a5,0x40004
40003104:	dd878513          	addi	a0,a5,-552 # 40003dd8 <vga_simRes_h160_v120+0x50>
40003108:	b80ff0ef          	jal	ra,40002488 <print128bit>

}
4000310c:	00000013          	nop
40003110:	06c12083          	lw	ra,108(sp)
40003114:	06812403          	lw	s0,104(sp)
40003118:	07010113          	addi	sp,sp,112
4000311c:	00008067          	ret
