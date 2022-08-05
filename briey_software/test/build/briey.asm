
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
80000068:	374080e7          	jalr	884(ra) # 400013d8 <irqCallback>
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
800000b8:	89418193          	addi	gp,gp,-1900 # 40003948 <__global_pointer$>
800000bc:	00001117          	auipc	sp,0x1
800000c0:	88410113          	addi	sp,sp,-1916 # 80000940 <_stack_start>

800000c4 <bss_init>:
800000c4:	c0003517          	auipc	a0,0xc0003
800000c8:	08450513          	addi	a0,a0,132 # 40003148 <_bss_end>
800000cc:	c0003597          	auipc	a1,0xc0003
800000d0:	07c58593          	addi	a1,a1,124 # 40003148 <_bss_end>

800000d4 <bss_loop>:
800000d4:	00b50863          	beq	a0,a1,800000e4 <bss_done>
800000d8:	00052023          	sw	zero,0(a0)
800000dc:	00450513          	addi	a0,a0,4
800000e0:	ff5ff06f          	j	800000d4 <bss_loop>

800000e4 <bss_done>:
800000e4:	c0003517          	auipc	a0,0xc0003
800000e8:	06050513          	addi	a0,a0,96 # 40003144 <_ctors_end>
800000ec:	ffc10113          	addi	sp,sp,-4

800000f0 <ctors_loop>:
800000f0:	c0003597          	auipc	a1,0xc0003
800000f4:	05458593          	addi	a1,a1,84 # 40003144 <_ctors_end>
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
40000344:	400027b7          	lui	a5,0x40002
40000348:	63078513          	addi	a0,a5,1584 # 40002630 <vga_simRes_h160_v120+0x20>
4000034c:	409010ef          	jal	ra,40001f54 <print>
	print("\r\n");
40000350:	400027b7          	lui	a5,0x40002
40000354:	69078513          	addi	a0,a5,1680 # 40002690 <vga_simRes_h160_v120+0x80>
40000358:	3fd010ef          	jal	ra,40001f54 <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
4000035c:	fe442583          	lw	a1,-28(s0)
40000360:	400027b7          	lui	a5,0x40002
40000364:	69478513          	addi	a0,a5,1684 # 40002694 <vga_simRes_h160_v120+0x84>
40000368:	655010ef          	jal	ra,400021bc <print64bit>
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
40000610:	400027b7          	lui	a5,0x40002
40000614:	6b078513          	addi	a0,a5,1712 # 400026b0 <vga_simRes_h160_v120+0xa0>
40000618:	531010ef          	jal	ra,40002348 <print256bit>
	print512bit("RESULT (512-bit) : ", res);
4000061c:	fdc42583          	lw	a1,-36(s0)
40000620:	400027b7          	lui	a5,0x40002
40000624:	6c478513          	addi	a0,a5,1732 # 400026c4 <vga_simRes_h160_v120+0xb4>
40000628:	609010ef          	jal	ra,40002430 <print512bit>
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
40000a48:	73878513          	addi	a0,a5,1848 # 40002738 <vga_simRes_h160_v120+0x20>
40000a4c:	508010ef          	jal	ra,40001f54 <print>
40000a50:	0100006f          	j	40000a60 <prince_cipher+0x12c>
40000a54:	400027b7          	lui	a5,0x40002
40000a58:	78c78513          	addi	a0,a5,1932 # 4000278c <vga_simRes_h160_v120+0x74>
40000a5c:	4f8010ef          	jal	ra,40001f54 <print>
40000a60:	400027b7          	lui	a5,0x40002
40000a64:	7e078513          	addi	a0,a5,2016 # 400027e0 <vga_simRes_h160_v120+0xc8>
40000a68:	4ec010ef          	jal	ra,40001f54 <print>
40000a6c:	fe442583          	lw	a1,-28(s0)
40000a70:	400027b7          	lui	a5,0x40002
40000a74:	7e478513          	addi	a0,a5,2020 # 400027e4 <vga_simRes_h160_v120+0xcc>
40000a78:	744010ef          	jal	ra,400021bc <print64bit>
40000a7c:	fe842583          	lw	a1,-24(s0)
40000a80:	400027b7          	lui	a5,0x40002
40000a84:	7fc78513          	addi	a0,a5,2044 # 400027fc <vga_simRes_h160_v120+0xe4>
40000a88:	7a4010ef          	jal	ra,4000222c <print128bit>
40000a8c:	fe042583          	lw	a1,-32(s0)
40000a90:	400037b7          	lui	a5,0x40003
40000a94:	81078513          	addi	a0,a5,-2032 # 40002810 <vga_simRes_h160_v120+0xf8>
40000a98:	724010ef          	jal	ra,400021bc <print64bit>
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
40000d24:	f2010113          	addi	sp,sp,-224
40000d28:	0c112e23          	sw	ra,220(sp)
40000d2c:	0c812c23          	sw	s0,216(sp)
40000d30:	0e010413          	addi	s0,sp,224
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
//CHACHA
	print("\r\n");
40000d5c:	400037b7          	lui	a5,0x40003
40000d60:	88478513          	addi	a0,a5,-1916 # 40002884 <vga_simRes_h160_v120+0x20>
40000d64:	1f0010ef          	jal	ra,40001f54 <print>
	print("\r\t*****************************************CHACHA TEST**************************************\r\n");
40000d68:	400037b7          	lui	a5,0x40003
40000d6c:	88878513          	addi	a0,a5,-1912 # 40002888 <vga_simRes_h160_v120+0x24>
40000d70:	1e4010ef          	jal	ra,40001f54 <print>
	uint32_t chacha_key[8] 		= {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
40000d74:	fc042023          	sw	zero,-64(s0)
40000d78:	fc042223          	sw	zero,-60(s0)
40000d7c:	fc042423          	sw	zero,-56(s0)
40000d80:	fc042623          	sw	zero,-52(s0)
40000d84:	fc042823          	sw	zero,-48(s0)
40000d88:	fc042a23          	sw	zero,-44(s0)
40000d8c:	fc042c23          	sw	zero,-40(s0)
40000d90:	fc042e23          	sw	zero,-36(s0)
	uint32_t chacha_block[2] 	= {0x0, 0x0};
40000d94:	fa042c23          	sw	zero,-72(s0)
40000d98:	fa042e23          	sw	zero,-68(s0)
	uint32_t chacha_res[15] 	= {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
40000d9c:	f6042e23          	sw	zero,-132(s0)
40000da0:	f8042023          	sw	zero,-128(s0)
40000da4:	f8042223          	sw	zero,-124(s0)
40000da8:	f8042423          	sw	zero,-120(s0)
40000dac:	f8042623          	sw	zero,-116(s0)
40000db0:	f8042823          	sw	zero,-112(s0)
40000db4:	f8042a23          	sw	zero,-108(s0)
40000db8:	f8042c23          	sw	zero,-104(s0)
40000dbc:	f8042e23          	sw	zero,-100(s0)
40000dc0:	fa042023          	sw	zero,-96(s0)
40000dc4:	fa042223          	sw	zero,-92(s0)
40000dc8:	fa042423          	sw	zero,-88(s0)
40000dcc:	fa042623          	sw	zero,-84(s0)
40000dd0:	fa042823          	sw	zero,-80(s0)
40000dd4:	fa042a23          	sw	zero,-76(s0)
	print("\r\n\t==========================================TEST 1==========================================\r\n");
40000dd8:	400037b7          	lui	a5,0x40003
40000ddc:	8e878513          	addi	a0,a5,-1816 # 400028e8 <vga_simRes_h160_v120+0x84>
40000de0:	174010ef          	jal	ra,40001f54 <print>
	print("\r\n\t[All zeros, 128-bit key, 8 rounds]\r\n");
40000de4:	400037b7          	lui	a5,0x40003
40000de8:	94878513          	addi	a0,a5,-1720 # 40002948 <vga_simRes_h160_v120+0xe4>
40000dec:	168010ef          	jal	ra,40001f54 <print>
	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,8,chacha_res);
40000df0:	f7c40713          	addi	a4,s0,-132
40000df4:	fb840613          	addi	a2,s0,-72
40000df8:	fc040793          	addi	a5,s0,-64
40000dfc:	00800693          	li	a3,8
40000e00:	00078593          	mv	a1,a5
40000e04:	00000513          	li	a0,0
40000e08:	d10ff0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t[All zeros, 128-bit key, 12 rounds]\r\n");
40000e0c:	400037b7          	lui	a5,0x40003
40000e10:	97078513          	addi	a0,a5,-1680 # 40002970 <vga_simRes_h160_v120+0x10c>
40000e14:	140010ef          	jal	ra,40001f54 <print>
	resetBlock(chacha_block);
40000e18:	fb840793          	addi	a5,s0,-72
40000e1c:	00078513          	mv	a0,a5
40000e20:	ed1ff0ef          	jal	ra,40000cf0 <resetBlock>
	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,12,chacha_res);
40000e24:	f7c40713          	addi	a4,s0,-132
40000e28:	fb840613          	addi	a2,s0,-72
40000e2c:	fc040793          	addi	a5,s0,-64
40000e30:	00c00693          	li	a3,12
40000e34:	00078593          	mv	a1,a5
40000e38:	00000513          	li	a0,0
40000e3c:	cdcff0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t[All zeros, 128-bit key, 20 rounds]\r\n");
40000e40:	400037b7          	lui	a5,0x40003
40000e44:	99c78513          	addi	a0,a5,-1636 # 4000299c <vga_simRes_h160_v120+0x138>
40000e48:	10c010ef          	jal	ra,40001f54 <print>
	resetBlock(chacha_block);
40000e4c:	fb840793          	addi	a5,s0,-72
40000e50:	00078513          	mv	a0,a5
40000e54:	e9dff0ef          	jal	ra,40000cf0 <resetBlock>
	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,20,chacha_res);
40000e58:	f7c40713          	addi	a4,s0,-132
40000e5c:	fb840613          	addi	a2,s0,-72
40000e60:	fc040793          	addi	a5,s0,-64
40000e64:	01400693          	li	a3,20
40000e68:	00078593          	mv	a1,a5
40000e6c:	00000513          	li	a0,0
40000e70:	ca8ff0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t[All zeros, 256-bit key, 8 rounds]\r\n");
40000e74:	400037b7          	lui	a5,0x40003
40000e78:	9c878513          	addi	a0,a5,-1592 # 400029c8 <vga_simRes_h160_v120+0x164>
40000e7c:	0d8010ef          	jal	ra,40001f54 <print>
	resetBlock(chacha_block);
40000e80:	fb840793          	addi	a5,s0,-72
40000e84:	00078513          	mv	a0,a5
40000e88:	e69ff0ef          	jal	ra,40000cf0 <resetBlock>
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,8,chacha_res);
40000e8c:	f7c40713          	addi	a4,s0,-132
40000e90:	fb840613          	addi	a2,s0,-72
40000e94:	fc040793          	addi	a5,s0,-64
40000e98:	00800693          	li	a3,8
40000e9c:	00078593          	mv	a1,a5
40000ea0:	00100513          	li	a0,1
40000ea4:	c74ff0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t[All zeros, 256-bit key, 12 rounds]\r\n");
40000ea8:	400037b7          	lui	a5,0x40003
40000eac:	9f078513          	addi	a0,a5,-1552 # 400029f0 <vga_simRes_h160_v120+0x18c>
40000eb0:	0a4010ef          	jal	ra,40001f54 <print>
	resetBlock(chacha_block);
40000eb4:	fb840793          	addi	a5,s0,-72
40000eb8:	00078513          	mv	a0,a5
40000ebc:	e35ff0ef          	jal	ra,40000cf0 <resetBlock>
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,12,chacha_res);
40000ec0:	f7c40713          	addi	a4,s0,-132
40000ec4:	fb840613          	addi	a2,s0,-72
40000ec8:	fc040793          	addi	a5,s0,-64
40000ecc:	00c00693          	li	a3,12
40000ed0:	00078593          	mv	a1,a5
40000ed4:	00100513          	li	a0,1
40000ed8:	c40ff0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t[All zeros, 256-bit key, 20 rounds]\r\n");
40000edc:	400037b7          	lui	a5,0x40003
40000ee0:	a1c78513          	addi	a0,a5,-1508 # 40002a1c <vga_simRes_h160_v120+0x1b8>
40000ee4:	070010ef          	jal	ra,40001f54 <print>
	resetBlock(chacha_block);
40000ee8:	fb840793          	addi	a5,s0,-72
40000eec:	00078513          	mv	a0,a5
40000ef0:	e01ff0ef          	jal	ra,40000cf0 <resetBlock>
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,20,chacha_res);
40000ef4:	f7c40713          	addi	a4,s0,-132
40000ef8:	fb840613          	addi	a2,s0,-72
40000efc:	fc040793          	addi	a5,s0,-64
40000f00:	01400693          	li	a3,20
40000f04:	00078593          	mv	a1,a5
40000f08:	00100513          	li	a0,1
40000f0c:	c0cff0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t==========================================TEST 2==========================================\r\n");
40000f10:	400037b7          	lui	a5,0x40003
40000f14:	a4878513          	addi	a0,a5,-1464 # 40002a48 <vga_simRes_h160_v120+0x1e4>
40000f18:	03c010ef          	jal	ra,40001f54 <print>
	print("\r\n\t[256-bit key, 8 rounds]\r\n");
40000f1c:	400037b7          	lui	a5,0x40003
40000f20:	aa878513          	addi	a0,a5,-1368 # 40002aa8 <vga_simRes_h160_v120+0x244>
40000f24:	030010ef          	jal	ra,40001f54 <print>
	chacha_block[1]=0x0f1e2d3c;
40000f28:	0f1e37b7          	lui	a5,0xf1e3
40000f2c:	d3c78793          	addi	a5,a5,-708 # f1e2d3c <_stack_size+0xf1e253c>
40000f30:	faf42e23          	sw	a5,-68(s0)
	chacha_block[0]=0x4b596877;
40000f34:	4b5977b7          	lui	a5,0x4b597
40000f38:	87778793          	addi	a5,a5,-1929 # 4b596877 <__global_pointer$+0xb592f2f>
40000f3c:	faf42c23          	sw	a5,-72(s0)

	chacha_key[7]=	0x00112233;
40000f40:	001127b7          	lui	a5,0x112
40000f44:	23378793          	addi	a5,a5,563 # 112233 <_stack_size+0x111a33>
40000f48:	fcf42e23          	sw	a5,-36(s0)
	chacha_key[6]=	0x44556677;
40000f4c:	445567b7          	lui	a5,0x44556
40000f50:	67778793          	addi	a5,a5,1655 # 44556677 <__global_pointer$+0x4552d2f>
40000f54:	fcf42c23          	sw	a5,-40(s0)
	chacha_key[5]=	0x8899aabb;
40000f58:	8899b7b7          	lui	a5,0x8899b
40000f5c:	abb78793          	addi	a5,a5,-1349 # 8899aabb <_stack_start+0x899a17b>
40000f60:	fcf42a23          	sw	a5,-44(s0)
	chacha_key[4]=	0xccddeeff;
40000f64:	ccddf7b7          	lui	a5,0xccddf
40000f68:	eff78793          	addi	a5,a5,-257 # ccddeeff <_stack_start+0x4cdde5bf>
40000f6c:	fcf42823          	sw	a5,-48(s0)
	chacha_key[3]=	0xffeeddcc;
40000f70:	ffeee7b7          	lui	a5,0xffeee
40000f74:	dcc78793          	addi	a5,a5,-564 # ffeeddcc <_stack_start+0x7feed48c>
40000f78:	fcf42623          	sw	a5,-52(s0)
	chacha_key[2]=	0xbbaa9988;
40000f7c:	bbaaa7b7          	lui	a5,0xbbaaa
40000f80:	98878793          	addi	a5,a5,-1656 # bbaa9988 <_stack_start+0x3baa9048>
40000f84:	fcf42423          	sw	a5,-56(s0)
	chacha_key[1]=	0x77665544;
40000f88:	776657b7          	lui	a5,0x77665
40000f8c:	54478793          	addi	a5,a5,1348 # 77665544 <__global_pointer$+0x37661bfc>
40000f90:	fcf42223          	sw	a5,-60(s0)
	chacha_key[0]= 	0x33221100;
40000f94:	332217b7          	lui	a5,0x33221
40000f98:	10078793          	addi	a5,a5,256 # 33221100 <_stack_size+0x33220900>
40000f9c:	fcf42023          	sw	a5,-64(s0)

	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,8,chacha_res);
40000fa0:	f7c40713          	addi	a4,s0,-132
40000fa4:	fb840613          	addi	a2,s0,-72
40000fa8:	fc040793          	addi	a5,s0,-64
40000fac:	00800693          	li	a3,8
40000fb0:	00078593          	mv	a1,a5
40000fb4:	00100513          	li	a0,1
40000fb8:	b60ff0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t==========================================TEST 3==========================================\r\n");
40000fbc:	400037b7          	lui	a5,0x40003
40000fc0:	ac878513          	addi	a0,a5,-1336 # 40002ac8 <vga_simRes_h160_v120+0x264>
40000fc4:	791000ef          	jal	ra,40001f54 <print>
	print("\r\n\t[All bits in key and IV are set. 128 bit key, 8 rounds]\r\n");
40000fc8:	400037b7          	lui	a5,0x40003
40000fcc:	b2878513          	addi	a0,a5,-1240 # 40002b28 <vga_simRes_h160_v120+0x2c4>
40000fd0:	785000ef          	jal	ra,40001f54 <print>
	//h2204d5b81ce662193e00966034f91302f14a3fb047f58b6e6ef0d721132304163e0fb640d76ff9c3b9cd99996e6e38fad13f0e31c82244d33abbc1b11e8bf12d
	chacha_block[1]=0xffffffff;
40000fd4:	fff00793          	li	a5,-1
40000fd8:	faf42e23          	sw	a5,-68(s0)
	chacha_block[0]=0xffffffff;
40000fdc:	fff00793          	li	a5,-1
40000fe0:	faf42c23          	sw	a5,-72(s0)

	chacha_key[7]=	0xffffffff;
40000fe4:	fff00793          	li	a5,-1
40000fe8:	fcf42e23          	sw	a5,-36(s0)
	chacha_key[6]=	0xffffffff;
40000fec:	fff00793          	li	a5,-1
40000ff0:	fcf42c23          	sw	a5,-40(s0)
	chacha_key[5]=	0xffffffff;
40000ff4:	fff00793          	li	a5,-1
40000ff8:	fcf42a23          	sw	a5,-44(s0)
	chacha_key[4]=	0xffffffff;
40000ffc:	fff00793          	li	a5,-1
40001000:	fcf42823          	sw	a5,-48(s0)
	chacha_key[3]=	0xffffffff;
40001004:	fff00793          	li	a5,-1
40001008:	fcf42623          	sw	a5,-52(s0)
	chacha_key[2]=	0xffffffff;
4000100c:	fff00793          	li	a5,-1
40001010:	fcf42423          	sw	a5,-56(s0)
	chacha_key[1]=	0xffffffff;
40001014:	fff00793          	li	a5,-1
40001018:	fcf42223          	sw	a5,-60(s0)
	chacha_key[0]= 	0xffffffff;
4000101c:	fff00793          	li	a5,-1
40001020:	fcf42023          	sw	a5,-64(s0)

	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,8,chacha_res);
40001024:	f7c40713          	addi	a4,s0,-132
40001028:	fb840613          	addi	a2,s0,-72
4000102c:	fc040793          	addi	a5,s0,-64
40001030:	00800693          	li	a3,8
40001034:	00078593          	mv	a1,a5
40001038:	00000513          	li	a0,0
4000103c:	adcff0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t==========================================TEST 4==========================================\r\n");
40001040:	400037b7          	lui	a5,0x40003
40001044:	b6878513          	addi	a0,a5,-1176 # 40002b68 <vga_simRes_h160_v120+0x304>
40001048:	70d000ef          	jal	ra,40001f54 <print>
	//128-bit key
	//ha7a6c81bd8ac106e8f3a46a1bc8ec702e95d18c7e0f424519aeafb54471d83a2bf888861586b73d228eaaf82f9665a5a155e867f93731bfbe24fab495590b231
	chacha_block[1]=0x0f1e2d3c;
4000104c:	0f1e37b7          	lui	a5,0xf1e3
40001050:	d3c78793          	addi	a5,a5,-708 # f1e2d3c <_stack_size+0xf1e253c>
40001054:	faf42e23          	sw	a5,-68(s0)
	chacha_block[0]=0x4b596877;
40001058:	4b5977b7          	lui	a5,0x4b597
4000105c:	87778793          	addi	a5,a5,-1929 # 4b596877 <__global_pointer$+0xb592f2f>
40001060:	faf42c23          	sw	a5,-72(s0)
	chacha_key[7]=	0x00112233;
40001064:	001127b7          	lui	a5,0x112
40001068:	23378793          	addi	a5,a5,563 # 112233 <_stack_size+0x111a33>
4000106c:	fcf42e23          	sw	a5,-36(s0)
	chacha_key[6]=	0x44556677;
40001070:	445567b7          	lui	a5,0x44556
40001074:	67778793          	addi	a5,a5,1655 # 44556677 <__global_pointer$+0x4552d2f>
40001078:	fcf42c23          	sw	a5,-40(s0)
	chacha_key[5]=	0x8899aabb;
4000107c:	8899b7b7          	lui	a5,0x8899b
40001080:	abb78793          	addi	a5,a5,-1349 # 8899aabb <_stack_start+0x899a17b>
40001084:	fcf42a23          	sw	a5,-44(s0)
	chacha_key[4]=	0xccddeeff;
40001088:	ccddf7b7          	lui	a5,0xccddf
4000108c:	eff78793          	addi	a5,a5,-257 # ccddeeff <_stack_start+0x4cdde5bf>
40001090:	fcf42823          	sw	a5,-48(s0)
	chacha_key[3]=	0x0;
40001094:	fc042623          	sw	zero,-52(s0)
	chacha_key[2]=	0x0;
40001098:	fc042423          	sw	zero,-56(s0)
	chacha_key[1]=	0x0;
4000109c:	fc042223          	sw	zero,-60(s0)
	chacha_key[0]= 	0x0;
400010a0:	fc042023          	sw	zero,-64(s0)

	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,8,chacha_res);
400010a4:	f7c40713          	addi	a4,s0,-132
400010a8:	fb840613          	addi	a2,s0,-72
400010ac:	fc040793          	addi	a5,s0,-64
400010b0:	00800693          	li	a3,8
400010b4:	00078593          	mv	a1,a5
400010b8:	00000513          	li	a0,0
400010bc:	a5cff0ef          	jal	ra,40000318 <chacha_cipher>

//PRINCE
	print("\r\t**********************************PRINCE TEST*******************************\r\n");
400010c0:	400037b7          	lui	a5,0x40003
400010c4:	bc878513          	addi	a0,a5,-1080 # 40002bc8 <vga_simRes_h160_v120+0x364>
400010c8:	68d000ef          	jal	ra,40001f54 <print>
	uint32_t prince_key[4] 		= {0x0, 0x0, 0x0, 0x0};
400010cc:	f6042623          	sw	zero,-148(s0)
400010d0:	f6042823          	sw	zero,-144(s0)
400010d4:	f6042a23          	sw	zero,-140(s0)
400010d8:	f6042c23          	sw	zero,-136(s0)
	uint32_t prince_block[2] 		= {0x0, 0x0};
400010dc:	f6042223          	sw	zero,-156(s0)
400010e0:	f6042423          	sw	zero,-152(s0)
	uint32_t prince_res[2] 	= {0x0,0x0};
400010e4:	f4042e23          	sw	zero,-164(s0)
400010e8:	f6042023          	sw	zero,-160(s0)
	print("\r\n\t===================================TEST 1===================================\r\n");
400010ec:	400037b7          	lui	a5,0x40003
400010f0:	c1c78513          	addi	a0,a5,-996 # 40002c1c <vga_simRes_h160_v120+0x3b8>
400010f4:	661000ef          	jal	ra,40001f54 <print>

	prince_block[1] 	= 0x69c4e0d8;
400010f8:	69c4e7b7          	lui	a5,0x69c4e
400010fc:	0d878793          	addi	a5,a5,216 # 69c4e0d8 <__global_pointer$+0x29c4a790>
40001100:	f6f42423          	sw	a5,-152(s0)
	prince_block[0] 	= 0x6a7b0430;
40001104:	6a7b07b7          	lui	a5,0x6a7b0
40001108:	43078793          	addi	a5,a5,1072 # 6a7b0430 <__global_pointer$+0x2a7acae8>
4000110c:	f6f42223          	sw	a5,-156(s0)

	prince_key[3]		= 0xd8cdb780;
40001110:	d8cdb7b7          	lui	a5,0xd8cdb
40001114:	78078793          	addi	a5,a5,1920 # d8cdb780 <_stack_start+0x58cdae40>
40001118:	f6f42c23          	sw	a5,-136(s0)
	prince_key[2]		= 0x70b4c55a;
4000111c:	70b4c7b7          	lui	a5,0x70b4c
40001120:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b48c12>
40001124:	f6f42a23          	sw	a5,-140(s0)
	prince_key[1]		= 0x818665aa;
40001128:	818667b7          	lui	a5,0x81866
4000112c:	5aa78793          	addi	a5,a5,1450 # 818665aa <_stack_start+0x1865c6a>
40001130:	f6f42823          	sw	a5,-144(s0)
	prince_key[0]		= 0x0d02dfda;
40001134:	0d02e7b7          	lui	a5,0xd02e
40001138:	fda78793          	addi	a5,a5,-38 # d02dfda <_stack_size+0xd02d7da>
4000113c:	f6f42623          	sw	a5,-148(s0)

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
40001140:	f5c40693          	addi	a3,s0,-164
40001144:	f6440713          	addi	a4,s0,-156
40001148:	f6c40793          	addi	a5,s0,-148
4000114c:	00070613          	mv	a2,a4
40001150:	00078593          	mv	a1,a5
40001154:	00100513          	li	a0,1
40001158:	fdcff0ef          	jal	ra,40000934 <prince_cipher>

	print("\r\n\t===================================TEST 2===================================\r\n");
4000115c:	400037b7          	lui	a5,0x40003
40001160:	c7078513          	addi	a0,a5,-912 # 40002c70 <vga_simRes_h160_v120+0x40c>
40001164:	5f1000ef          	jal	ra,40001f54 <print>

	prince_block[1] 	= 0x43c6b256;
40001168:	43c6b7b7          	lui	a5,0x43c6b
4000116c:	25678793          	addi	a5,a5,598 # 43c6b256 <__global_pointer$+0x3c6790e>
40001170:	f6f42423          	sw	a5,-152(s0)
	prince_block[0] 	= 0xd79de7e8;
40001174:	d79de7b7          	lui	a5,0xd79de
40001178:	7e878793          	addi	a5,a5,2024 # d79de7e8 <_stack_start+0x579ddea8>
4000117c:	f6f42223          	sw	a5,-156(s0)

	//USE THE SAME KEY

	prince_cipher(PRINCE_OP_DE,prince_key,prince_block,prince_res);
40001180:	f5c40693          	addi	a3,s0,-164
40001184:	f6440713          	addi	a4,s0,-156
40001188:	f6c40793          	addi	a5,s0,-148
4000118c:	00070613          	mv	a2,a4
40001190:	00078593          	mv	a1,a5
40001194:	00000513          	li	a0,0
40001198:	f9cff0ef          	jal	ra,40000934 <prince_cipher>
//PRESENT
	print("\r\n");
4000119c:	400037b7          	lui	a5,0x40003
400011a0:	88478513          	addi	a0,a5,-1916 # 40002884 <vga_simRes_h160_v120+0x20>
400011a4:	5b1000ef          	jal	ra,40001f54 <print>
	print("\r\t******************************PRESENT TEST**********************************\r\n");
400011a8:	400037b7          	lui	a5,0x40003
400011ac:	cc478513          	addi	a0,a5,-828 # 40002cc4 <vga_simRes_h160_v120+0x460>
400011b0:	5a5000ef          	jal	ra,40001f54 <print>
	unsigned int present_key[3] = {0x0, 0x0, 0x0};
400011b4:	f4042823          	sw	zero,-176(s0)
400011b8:	f4042a23          	sw	zero,-172(s0)
400011bc:	f4042c23          	sw	zero,-168(s0)
	unsigned int present_block[2] 	= {0x0, 0x0};
400011c0:	f4042423          	sw	zero,-184(s0)
400011c4:	f4042623          	sw	zero,-180(s0)
	unsigned int present_res[2] 	= {0x0, 0x0};
400011c8:	f4042023          	sw	zero,-192(s0)
400011cc:	f4042223          	sw	zero,-188(s0)

	print("\r\n\t==================================TEST 1====================================\r\n");
400011d0:	400037b7          	lui	a5,0x40003
400011d4:	d1878513          	addi	a0,a5,-744 # 40002d18 <vga_simRes_h160_v120+0x4b4>
400011d8:	57d000ef          	jal	ra,40001f54 <print>

	present_block[1]=0x4c746e67;
400011dc:	4c7477b7          	lui	a5,0x4c747
400011e0:	e6778793          	addi	a5,a5,-409 # 4c746e67 <__global_pointer$+0xc74351f>
400011e4:	f4f42623          	sw	a5,-180(s0)
	present_block[0]=0x7579656e;
400011e8:	757967b7          	lui	a5,0x75796
400011ec:	56e78793          	addi	a5,a5,1390 # 7579656e <__global_pointer$+0x35792c26>
400011f0:	f4f42423          	sw	a5,-184(s0)

	present_key[2] = 0x46657465;
400011f4:	466577b7          	lui	a5,0x46657
400011f8:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6653b1d>
400011fc:	f4f42c23          	sw	a5,-168(s0)
	present_key[1] = 0x6c48636d;
40001200:	6c4867b7          	lui	a5,0x6c486
40001204:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c482a25>
40001208:	f4f42a23          	sw	a5,-172(s0)
	present_key[0] = 0x7573;
4000120c:	000077b7          	lui	a5,0x7
40001210:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
40001214:	f4f42823          	sw	a5,-176(s0)

	present_cipher(PRESENT_OP_EN,present_key,present_block,present_res);
40001218:	f4040693          	addi	a3,s0,-192
4000121c:	f4840713          	addi	a4,s0,-184
40001220:	f5040793          	addi	a5,s0,-176
40001224:	00070613          	mv	a2,a4
40001228:	00078593          	mv	a1,a5
4000122c:	00000513          	li	a0,0
40001230:	4f8000ef          	jal	ra,40001728 <present_cipher>

	print("\r\n\t==================================TEST 2====================================\r\n");
40001234:	400037b7          	lui	a5,0x40003
40001238:	d6c78513          	addi	a0,a5,-660 # 40002d6c <vga_simRes_h160_v120+0x508>
4000123c:	519000ef          	jal	ra,40001f54 <print>

	present_block[1]=0x0e1d00d4;
40001240:	0e1d07b7          	lui	a5,0xe1d0
40001244:	0d478793          	addi	a5,a5,212 # e1d00d4 <_stack_size+0xe1cf8d4>
40001248:	f4f42623          	sw	a5,-180(s0)
	present_block[0]=0xe46ba99c;
4000124c:	e46bb7b7          	lui	a5,0xe46bb
40001250:	99c78793          	addi	a5,a5,-1636 # e46ba99c <_stack_start+0x646ba05c>
40001254:	f4f42423          	sw	a5,-184(s0)

	//USE THE SAME KEY

	present_cipher(PRESENT_OP_DE,present_key,present_block,present_res);
40001258:	f4040693          	addi	a3,s0,-192
4000125c:	f4840713          	addi	a4,s0,-184
40001260:	f5040793          	addi	a5,s0,-176
40001264:	00070613          	mv	a2,a4
40001268:	00078593          	mv	a1,a5
4000126c:	00100513          	li	a0,1
40001270:	4b8000ef          	jal	ra,40001728 <present_cipher>
	//DM_PRESENT
	print("\r\n");
40001274:	400037b7          	lui	a5,0x40003
40001278:	88478513          	addi	a0,a5,-1916 # 40002884 <vga_simRes_h160_v120+0x20>
4000127c:	4d9000ef          	jal	ra,40001f54 <print>
	print("\r\t***************************DM_PRESENT TEST**********************************\r\n");
40001280:	400037b7          	lui	a5,0x40003
40001284:	dc078513          	addi	a0,a5,-576 # 40002dc0 <vga_simRes_h160_v120+0x55c>
40001288:	4cd000ef          	jal	ra,40001f54 <print>
	unsigned int dm_present_key[3] 		= {0x0, 0x0, 0x0};
4000128c:	f2042a23          	sw	zero,-204(s0)
40001290:	f2042c23          	sw	zero,-200(s0)
40001294:	f2042e23          	sw	zero,-196(s0)
	unsigned int dm_present_block[2] 	= {0x0, 0x0};
40001298:	f2042623          	sw	zero,-212(s0)
4000129c:	f2042823          	sw	zero,-208(s0)
	unsigned int dm_present_res[2] 		= {0x0, 0x0};
400012a0:	f2042223          	sw	zero,-220(s0)
400012a4:	f2042423          	sw	zero,-216(s0)

	print("\r\n\t==================================TEST 1====================================\r\n");
400012a8:	400037b7          	lui	a5,0x40003
400012ac:	d1878513          	addi	a0,a5,-744 # 40002d18 <vga_simRes_h160_v120+0x4b4>
400012b0:	4a5000ef          	jal	ra,40001f54 <print>

	dm_present_block[1]=0x4c746e67;
400012b4:	4c7477b7          	lui	a5,0x4c747
400012b8:	e6778793          	addi	a5,a5,-409 # 4c746e67 <__global_pointer$+0xc74351f>
400012bc:	f2f42823          	sw	a5,-208(s0)
	dm_present_block[0]=0x7579656e;
400012c0:	757967b7          	lui	a5,0x75796
400012c4:	56e78793          	addi	a5,a5,1390 # 7579656e <__global_pointer$+0x35792c26>
400012c8:	f2f42623          	sw	a5,-212(s0)

	dm_present_key[2] = 0x46657465;
400012cc:	466577b7          	lui	a5,0x46657
400012d0:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6653b1d>
400012d4:	f2f42e23          	sw	a5,-196(s0)
	dm_present_key[1] = 0x6c48636d;
400012d8:	6c4867b7          	lui	a5,0x6c486
400012dc:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c482a25>
400012e0:	f2f42c23          	sw	a5,-200(s0)
	dm_present_key[0] = 0x7573;
400012e4:	000077b7          	lui	a5,0x7
400012e8:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
400012ec:	f2f42a23          	sw	a5,-204(s0)

	//expec: 42696eb3 9112ccf2

	dm_present_hash(dm_present_key,dm_present_block,dm_present_res);
400012f0:	f2440693          	addi	a3,s0,-220
400012f4:	f2c40713          	addi	a4,s0,-212
400012f8:	f3440793          	addi	a5,s0,-204
400012fc:	00068613          	mv	a2,a3
40001300:	00070593          	mv	a1,a4
40001304:	00078513          	mv	a0,a5
40001308:	0d5000ef          	jal	ra,40001bdc <dm_present_hash>

	print("\r\n\t==================================TEST 2====================================\r\n");
4000130c:	400037b7          	lui	a5,0x40003
40001310:	d6c78513          	addi	a0,a5,-660 # 40002d6c <vga_simRes_h160_v120+0x508>
40001314:	441000ef          	jal	ra,40001f54 <print>

	dm_present_block[1]=0x46657465;
40001318:	466577b7          	lui	a5,0x46657
4000131c:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6653b1d>
40001320:	f2f42823          	sw	a5,-208(s0)
	dm_present_block[0]=0x6c5f5553;
40001324:	6c5f57b7          	lui	a5,0x6c5f5
40001328:	55378793          	addi	a5,a5,1363 # 6c5f5553 <__global_pointer$+0x2c5f1c0b>
4000132c:	f2f42623          	sw	a5,-212(s0)

	dm_present_key[2] = 0x00000000;
40001330:	f2042e23          	sw	zero,-196(s0)
	dm_present_key[1] = 0x00000000;
40001334:	f2042c23          	sw	zero,-200(s0)
	dm_present_key[0] = 0x0001;
40001338:	00100793          	li	a5,1
4000133c:	f2f42a23          	sw	a5,-204(s0)
	//expec:d52384e3 dcee9ce7

	dm_present_hash(dm_present_key,dm_present_block,dm_present_res);
40001340:	f2440693          	addi	a3,s0,-220
40001344:	f2c40713          	addi	a4,s0,-212
40001348:	f3440793          	addi	a5,s0,-204
4000134c:	00068613          	mv	a2,a3
40001350:	00070593          	mv	a1,a4
40001354:	00078513          	mv	a0,a5
40001358:	085000ef          	jal	ra,40001bdc <dm_present_hash>
	print("\r\n\t==================================TEST 3====================================\r\n");
4000135c:	400037b7          	lui	a5,0x40003
40001360:	e1478513          	addi	a0,a5,-492 # 40002e14 <vga_simRes_h160_v120+0x5b0>
40001364:	3f1000ef          	jal	ra,40001f54 <print>

	dm_present_block[1]=0x31383230;
40001368:	313837b7          	lui	a5,0x31383
4000136c:	23078793          	addi	a5,a5,560 # 31383230 <_stack_size+0x31382a30>
40001370:	f2f42823          	sw	a5,-208(s0)
	dm_present_block[0]=0x30313833;
40001374:	303147b7          	lui	a5,0x30314
40001378:	83378793          	addi	a5,a5,-1997 # 30313833 <_stack_size+0x30313033>
4000137c:	f2f42623          	sw	a5,-212(s0)

	dm_present_key[2] = 0x31383230;
40001380:	313837b7          	lui	a5,0x31383
40001384:	23078793          	addi	a5,a5,560 # 31383230 <_stack_size+0x31382a30>
40001388:	f2f42e23          	sw	a5,-196(s0)
	dm_present_key[1] = 0x30313833;
4000138c:	303147b7          	lui	a5,0x30314
40001390:	83378793          	addi	a5,a5,-1997 # 30313833 <_stack_size+0x30313033>
40001394:	f2f42c23          	sw	a5,-200(s0)
	dm_present_key[0] = 0x5553;
40001398:	000057b7          	lui	a5,0x5
4000139c:	55378793          	addi	a5,a5,1363 # 5553 <_stack_size+0x4d53>
400013a0:	f2f42a23          	sw	a5,-204(s0)
	//expec: 08e11c56 b6d5a592
	dm_present_hash(dm_present_key,dm_present_block,dm_present_res);
400013a4:	f2440693          	addi	a3,s0,-220
400013a8:	f2c40713          	addi	a4,s0,-212
400013ac:	f3440793          	addi	a5,s0,-204
400013b0:	00068613          	mv	a2,a3
400013b4:	00070593          	mv	a1,a4
400013b8:	00078513          	mv	a0,a5
400013bc:	021000ef          	jal	ra,40001bdc <dm_present_hash>

	return 0;	
400013c0:	00000793          	li	a5,0
}
400013c4:	00078513          	mv	a0,a5
400013c8:	0dc12083          	lw	ra,220(sp)
400013cc:	0d812403          	lw	s0,216(sp)
400013d0:	0e010113          	addi	sp,sp,224
400013d4:	00008067          	ret

400013d8 <irqCallback>:
void irqCallback(){
400013d8:	ff010113          	addi	sp,sp,-16
400013dc:	00812623          	sw	s0,12(sp)
400013e0:	01010413          	addi	s0,sp,16

}
400013e4:	00000013          	nop
400013e8:	00c12403          	lw	s0,12(sp)
400013ec:	01010113          	addi	sp,sp,16
400013f0:	00008067          	ret

400013f4 <timer_init>:
static void timer_init(Timer_Reg *reg){
400013f4:	fe010113          	addi	sp,sp,-32
400013f8:	00812e23          	sw	s0,28(sp)
400013fc:	02010413          	addi	s0,sp,32
40001400:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40001404:	fec42783          	lw	a5,-20(s0)
40001408:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
4000140c:	fec42783          	lw	a5,-20(s0)
40001410:	0007a423          	sw	zero,8(a5)
}
40001414:	00000013          	nop
40001418:	01c12403          	lw	s0,28(sp)
4000141c:	02010113          	addi	sp,sp,32
40001420:	00008067          	ret

40001424 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001424:	fe010113          	addi	sp,sp,-32
40001428:	00812e23          	sw	s0,28(sp)
4000142c:	02010413          	addi	s0,sp,32
40001430:	fea42623          	sw	a0,-20(s0)
}
40001434:	00000013          	nop
40001438:	01c12403          	lw	s0,28(sp)
4000143c:	02010113          	addi	sp,sp,32
40001440:	00008067          	ret

40001444 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001444:	fe010113          	addi	sp,sp,-32
40001448:	00812e23          	sw	s0,28(sp)
4000144c:	02010413          	addi	s0,sp,32
40001450:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001454:	fec42783          	lw	a5,-20(s0)
40001458:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
4000145c:	fec42783          	lw	a5,-20(s0)
40001460:	fff00713          	li	a4,-1
40001464:	00e7a023          	sw	a4,0(a5)
}
40001468:	00000013          	nop
4000146c:	01c12403          	lw	s0,28(sp)
40001470:	02010113          	addi	sp,sp,32
40001474:	00008067          	ret

40001478 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40001478:	fe010113          	addi	sp,sp,-32
4000147c:	00812e23          	sw	s0,28(sp)
40001480:	02010413          	addi	s0,sp,32
40001484:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40001488:	fec42783          	lw	a5,-20(s0)
4000148c:	0047a783          	lw	a5,4(a5)
40001490:	0107d793          	srli	a5,a5,0x10
40001494:	0ff7f793          	zext.b	a5,a5
}
40001498:	00078513          	mv	a0,a5
4000149c:	01c12403          	lw	s0,28(sp)
400014a0:	02010113          	addi	sp,sp,32
400014a4:	00008067          	ret

400014a8 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
400014a8:	fe010113          	addi	sp,sp,-32
400014ac:	00812e23          	sw	s0,28(sp)
400014b0:	02010413          	addi	s0,sp,32
400014b4:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
400014b8:	fec42783          	lw	a5,-20(s0)
400014bc:	0047a783          	lw	a5,4(a5)
400014c0:	0187d793          	srli	a5,a5,0x18
}
400014c4:	00078513          	mv	a0,a5
400014c8:	01c12403          	lw	s0,28(sp)
400014cc:	02010113          	addi	sp,sp,32
400014d0:	00008067          	ret

400014d4 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
400014d4:	fe010113          	addi	sp,sp,-32
400014d8:	00112e23          	sw	ra,28(sp)
400014dc:	00812c23          	sw	s0,24(sp)
400014e0:	02010413          	addi	s0,sp,32
400014e4:	fea42623          	sw	a0,-20(s0)
400014e8:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
400014ec:	00000013          	nop
400014f0:	fec42503          	lw	a0,-20(s0)
400014f4:	f85ff0ef          	jal	ra,40001478 <uart_writeAvailability>
400014f8:	00050793          	mv	a5,a0
400014fc:	fe078ae3          	beqz	a5,400014f0 <uart_write+0x1c>
	reg->DATA = data;
40001500:	fec42783          	lw	a5,-20(s0)
40001504:	fe842703          	lw	a4,-24(s0)
40001508:	00e7a023          	sw	a4,0(a5)
}
4000150c:	00000013          	nop
40001510:	01c12083          	lw	ra,28(sp)
40001514:	01812403          	lw	s0,24(sp)
40001518:	02010113          	addi	sp,sp,32
4000151c:	00008067          	ret

40001520 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001520:	fe010113          	addi	sp,sp,-32
40001524:	00812e23          	sw	s0,28(sp)
40001528:	02010413          	addi	s0,sp,32
4000152c:	fea42623          	sw	a0,-20(s0)
40001530:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001534:	fe842783          	lw	a5,-24(s0)
40001538:	00c7a703          	lw	a4,12(a5)
4000153c:	fec42783          	lw	a5,-20(s0)
40001540:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001544:	fe842783          	lw	a5,-24(s0)
40001548:	0007a783          	lw	a5,0(a5)
4000154c:	fff78713          	addi	a4,a5,-1
40001550:	fe842783          	lw	a5,-24(s0)
40001554:	0047a783          	lw	a5,4(a5)
40001558:	00879793          	slli	a5,a5,0x8
4000155c:	00f76733          	or	a4,a4,a5
40001560:	fe842783          	lw	a5,-24(s0)
40001564:	0087a783          	lw	a5,8(a5)
40001568:	01079793          	slli	a5,a5,0x10
4000156c:	00f76733          	or	a4,a4,a5
40001570:	fec42783          	lw	a5,-20(s0)
40001574:	00e7a623          	sw	a4,12(a5)
}
40001578:	00000013          	nop
4000157c:	01c12403          	lw	s0,28(sp)
40001580:	02010113          	addi	sp,sp,32
40001584:	00008067          	ret

40001588 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001588:	fe010113          	addi	sp,sp,-32
4000158c:	00812e23          	sw	s0,28(sp)
40001590:	02010413          	addi	s0,sp,32
40001594:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001598:	fec42783          	lw	a5,-20(s0)
4000159c:	0007a783          	lw	a5,0(a5)
400015a0:	0027f793          	andi	a5,a5,2
400015a4:	00f037b3          	snez	a5,a5
400015a8:	0ff7f793          	zext.b	a5,a5
}
400015ac:	00078513          	mv	a0,a5
400015b0:	01c12403          	lw	s0,28(sp)
400015b4:	02010113          	addi	sp,sp,32
400015b8:	00008067          	ret

400015bc <vga_run>:
static void vga_run(Vga_Reg *reg){
400015bc:	fe010113          	addi	sp,sp,-32
400015c0:	00812e23          	sw	s0,28(sp)
400015c4:	02010413          	addi	s0,sp,32
400015c8:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
400015cc:	fec42783          	lw	a5,-20(s0)
400015d0:	00100713          	li	a4,1
400015d4:	00e7a023          	sw	a4,0(a5)
}
400015d8:	00000013          	nop
400015dc:	01c12403          	lw	s0,28(sp)
400015e0:	02010113          	addi	sp,sp,32
400015e4:	00008067          	ret

400015e8 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
400015e8:	fe010113          	addi	sp,sp,-32
400015ec:	00112e23          	sw	ra,28(sp)
400015f0:	00812c23          	sw	s0,24(sp)
400015f4:	02010413          	addi	s0,sp,32
400015f8:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
400015fc:	fec42783          	lw	a5,-20(s0)
40001600:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001604:	00000013          	nop
40001608:	fec42503          	lw	a0,-20(s0)
4000160c:	f7dff0ef          	jal	ra,40001588 <vga_isBusy>
40001610:	00050793          	mv	a5,a0
40001614:	fe079ae3          	bnez	a5,40001608 <vga_stop+0x20>
}
40001618:	00000013          	nop
4000161c:	00000013          	nop
40001620:	01c12083          	lw	ra,28(sp)
40001624:	01812403          	lw	s0,24(sp)
40001628:	02010113          	addi	sp,sp,32
4000162c:	00008067          	ret

40001630 <present_write>:
#include "briey.h"
void present_write(uint32_t iData, uint32_t iAddress)
{
40001630:	fe010113          	addi	sp,sp,-32
40001634:	00812e23          	sw	s0,28(sp)
40001638:	02010413          	addi	s0,sp,32
4000163c:	fea42623          	sw	a0,-20(s0)
40001640:	feb42423          	sw	a1,-24(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
40001644:	f00027b7          	lui	a5,0xf0002
40001648:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000164c:	fe842703          	lw	a4,-24(s0)
40001650:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->WRITE_N 		= 0;
40001654:	f00027b7          	lui	a5,0xf0002
40001658:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000165c:	0007a223          	sw	zero,4(a5)
	PRESENT_BASE->READ_N 		= 1;
40001660:	f00027b7          	lui	a5,0xf0002
40001664:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001668:	00100713          	li	a4,1
4000166c:	00e7a423          	sw	a4,8(a5)
	PRESENT_BASE->IDATA			= iData;
40001670:	f00027b7          	lui	a5,0xf0002
40001674:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001678:	fec42703          	lw	a4,-20(s0)
4000167c:	00e7a823          	sw	a4,16(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
40001680:	f00027b7          	lui	a5,0xf0002
40001684:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001688:	0007a023          	sw	zero,0(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
4000168c:	f00027b7          	lui	a5,0xf0002
40001690:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001694:	00100713          	li	a4,1
40001698:	00e7a023          	sw	a4,0(a5)
}
4000169c:	00000013          	nop
400016a0:	01c12403          	lw	s0,28(sp)
400016a4:	02010113          	addi	sp,sp,32
400016a8:	00008067          	ret

400016ac <present_read>:
uint32_t present_read(uint32_t iAddress)
{
400016ac:	fd010113          	addi	sp,sp,-48
400016b0:	02812623          	sw	s0,44(sp)
400016b4:	03010413          	addi	s0,sp,48
400016b8:	fca42e23          	sw	a0,-36(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
400016bc:	f00027b7          	lui	a5,0xf0002
400016c0:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400016c4:	fdc42703          	lw	a4,-36(s0)
400016c8:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->READ_N		= 0;
400016cc:	f00027b7          	lui	a5,0xf0002
400016d0:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400016d4:	0007a423          	sw	zero,8(a5)
	PRESENT_BASE->WRITE_N		= 1;
400016d8:	f00027b7          	lui	a5,0xf0002
400016dc:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400016e0:	00100713          	li	a4,1
400016e4:	00e7a223          	sw	a4,4(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
400016e8:	f00027b7          	lui	a5,0xf0002
400016ec:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400016f0:	0007a023          	sw	zero,0(a5)
	uint32_t res 				= PRESENT_BASE->ODATA;
400016f4:	f00027b7          	lui	a5,0xf0002
400016f8:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400016fc:	0147a783          	lw	a5,20(a5)
40001700:	fef42623          	sw	a5,-20(s0)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
40001704:	f00027b7          	lui	a5,0xf0002
40001708:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000170c:	00100713          	li	a4,1
40001710:	00e7a023          	sw	a4,0(a5)
	return res;
40001714:	fec42783          	lw	a5,-20(s0)
}
40001718:	00078513          	mv	a0,a5
4000171c:	02c12403          	lw	s0,44(sp)
40001720:	03010113          	addi	sp,sp,48
40001724:	00008067          	ret

40001728 <present_cipher>:
void present_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
40001728:	fe010113          	addi	sp,sp,-32
4000172c:	00112e23          	sw	ra,28(sp)
40001730:	00812c23          	sw	s0,24(sp)
40001734:	00912a23          	sw	s1,20(sp)
40001738:	02010413          	addi	s0,sp,32
4000173c:	00050793          	mv	a5,a0
40001740:	feb42423          	sw	a1,-24(s0)
40001744:	fec42223          	sw	a2,-28(s0)
40001748:	fed42023          	sw	a3,-32(s0)
4000174c:	fef407a3          	sb	a5,-17(s0)

	//EN_OR_DE
	if(operation == PRESENT_OP_EN) present_write(PRESENT_OP_EN,PRESENT_ADDR_EN_OR_DE);
40001750:	fef44783          	lbu	a5,-17(s0)
40001754:	00079a63          	bnez	a5,40001768 <present_cipher+0x40>
40001758:	00800593          	li	a1,8
4000175c:	00000513          	li	a0,0
40001760:	ed1ff0ef          	jal	ra,40001630 <present_write>
40001764:	0100006f          	j	40001774 <present_cipher+0x4c>
	else present_write(PRESENT_OP_DE,PRESENT_ADDR_EN_OR_DE);
40001768:	00800593          	li	a1,8
4000176c:	00100513          	li	a0,1
40001770:	ec1ff0ef          	jal	ra,40001630 <present_write>

	//PLAIN_TEXT
	present_write(block[1],PRESENT_ADDR_BLOCK_BASE +1);
40001774:	fe442783          	lw	a5,-28(s0)
40001778:	00478793          	addi	a5,a5,4
4000177c:	0007a783          	lw	a5,0(a5)
40001780:	00500593          	li	a1,5
40001784:	00078513          	mv	a0,a5
40001788:	ea9ff0ef          	jal	ra,40001630 <present_write>
	present_write(block[0],PRESENT_ADDR_BLOCK_BASE);
4000178c:	fe442783          	lw	a5,-28(s0)
40001790:	0007a783          	lw	a5,0(a5)
40001794:	00400593          	li	a1,4
40001798:	00078513          	mv	a0,a5
4000179c:	e95ff0ef          	jal	ra,40001630 <present_write>

	//KEY
	present_write(key[2],PRESENT_ADDR_KEY_BASE +2);
400017a0:	fe842783          	lw	a5,-24(s0)
400017a4:	00878793          	addi	a5,a5,8
400017a8:	0007a783          	lw	a5,0(a5)
400017ac:	00300593          	li	a1,3
400017b0:	00078513          	mv	a0,a5
400017b4:	e7dff0ef          	jal	ra,40001630 <present_write>
	present_write(key[1],PRESENT_ADDR_KEY_BASE +1);
400017b8:	fe842783          	lw	a5,-24(s0)
400017bc:	00478793          	addi	a5,a5,4
400017c0:	0007a783          	lw	a5,0(a5)
400017c4:	00200593          	li	a1,2
400017c8:	00078513          	mv	a0,a5
400017cc:	e65ff0ef          	jal	ra,40001630 <present_write>
	present_write(key[0],PRESENT_ADDR_KEY_BASE);
400017d0:	fe842783          	lw	a5,-24(s0)
400017d4:	0007a783          	lw	a5,0(a5)
400017d8:	00100593          	li	a1,1
400017dc:	00078513          	mv	a0,a5
400017e0:	e51ff0ef          	jal	ra,40001630 <present_write>

	//START
	present_write(0x1,PRESENT_ADDR_START);
400017e4:	00000593          	li	a1,0
400017e8:	00100513          	li	a0,1
400017ec:	e45ff0ef          	jal	ra,40001630 <present_write>
    while(present_read(PRESENT_ADDR_RESULT_BASE) == 0);
400017f0:	00000013          	nop
400017f4:	00600513          	li	a0,6
400017f8:	eb5ff0ef          	jal	ra,400016ac <present_read>
400017fc:	00050793          	mv	a5,a0
40001800:	fe078ae3          	beqz	a5,400017f4 <present_cipher+0xcc>

    res[1] = present_read(PRESENT_ADDR_RESULT_BASE +1);
40001804:	fe042783          	lw	a5,-32(s0)
40001808:	00478493          	addi	s1,a5,4
4000180c:	00700513          	li	a0,7
40001810:	e9dff0ef          	jal	ra,400016ac <present_read>
40001814:	00050793          	mv	a5,a0
40001818:	00f4a023          	sw	a5,0(s1)
    res[0] =present_read(PRESENT_ADDR_RESULT_BASE);
4000181c:	00600513          	li	a0,6
40001820:	e8dff0ef          	jal	ra,400016ac <present_read>
40001824:	00050713          	mv	a4,a0
40001828:	fe042783          	lw	a5,-32(s0)
4000182c:	00e7a023          	sw	a4,0(a5)


    //print result to terminal
	if(operation == PRESENT_OP_EN)
40001830:	fef44783          	lbu	a5,-17(s0)
40001834:	00079a63          	bnez	a5,40001848 <present_cipher+0x120>
		print("\r\t===========================PRESENT ENCRYPTTION==============================\r\n");
40001838:	400037b7          	lui	a5,0x40003
4000183c:	ec878513          	addi	a0,a5,-312 # 40002ec8 <vga_simRes_h160_v120+0x20>
40001840:	714000ef          	jal	ra,40001f54 <print>
40001844:	0100006f          	j	40001854 <present_cipher+0x12c>
	else
		print("\r\t===========================PRESENT DECRYPTTION==============================\r\n");
40001848:	400037b7          	lui	a5,0x40003
4000184c:	f1c78513          	addi	a0,a5,-228 # 40002f1c <vga_simRes_h160_v120+0x74>
40001850:	704000ef          	jal	ra,40001f54 <print>
	print("\r\n");
40001854:	400037b7          	lui	a5,0x40003
40001858:	f7078513          	addi	a0,a5,-144 # 40002f70 <vga_simRes_h160_v120+0xc8>
4000185c:	6f8000ef          	jal	ra,40001f54 <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
40001860:	fe442583          	lw	a1,-28(s0)
40001864:	400037b7          	lui	a5,0x40003
40001868:	f7478513          	addi	a0,a5,-140 # 40002f74 <vga_simRes_h160_v120+0xcc>
4000186c:	151000ef          	jal	ra,400021bc <print64bit>
	print80bit("KEY (80-bit) : ", key);
40001870:	fe842583          	lw	a1,-24(s0)
40001874:	400037b7          	lui	a5,0x40003
40001878:	f9078513          	addi	a0,a5,-112 # 40002f90 <vga_simRes_h160_v120+0xe8>
4000187c:	249000ef          	jal	ra,400022c4 <print80bit>
	print64bit("RESULT (64-bit) : ", res);
40001880:	fe042583          	lw	a1,-32(s0)
40001884:	400037b7          	lui	a5,0x40003
40001888:	fa078513          	addi	a0,a5,-96 # 40002fa0 <vga_simRes_h160_v120+0xf8>
4000188c:	131000ef          	jal	ra,400021bc <print64bit>
	//print("\r\n============================================================================\r\n");
}
40001890:	00000013          	nop
40001894:	01c12083          	lw	ra,28(sp)
40001898:	01812403          	lw	s0,24(sp)
4000189c:	01412483          	lw	s1,20(sp)
400018a0:	02010113          	addi	sp,sp,32
400018a4:	00008067          	ret

400018a8 <timer_init>:
static void timer_init(Timer_Reg *reg){
400018a8:	fe010113          	addi	sp,sp,-32
400018ac:	00812e23          	sw	s0,28(sp)
400018b0:	02010413          	addi	s0,sp,32
400018b4:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
400018b8:	fec42783          	lw	a5,-20(s0)
400018bc:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
400018c0:	fec42783          	lw	a5,-20(s0)
400018c4:	0007a423          	sw	zero,8(a5)
}
400018c8:	00000013          	nop
400018cc:	01c12403          	lw	s0,28(sp)
400018d0:	02010113          	addi	sp,sp,32
400018d4:	00008067          	ret

400018d8 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
400018d8:	fe010113          	addi	sp,sp,-32
400018dc:	00812e23          	sw	s0,28(sp)
400018e0:	02010413          	addi	s0,sp,32
400018e4:	fea42623          	sw	a0,-20(s0)
}
400018e8:	00000013          	nop
400018ec:	01c12403          	lw	s0,28(sp)
400018f0:	02010113          	addi	sp,sp,32
400018f4:	00008067          	ret

400018f8 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
400018f8:	fe010113          	addi	sp,sp,-32
400018fc:	00812e23          	sw	s0,28(sp)
40001900:	02010413          	addi	s0,sp,32
40001904:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001908:	fec42783          	lw	a5,-20(s0)
4000190c:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001910:	fec42783          	lw	a5,-20(s0)
40001914:	fff00713          	li	a4,-1
40001918:	00e7a023          	sw	a4,0(a5)
}
4000191c:	00000013          	nop
40001920:	01c12403          	lw	s0,28(sp)
40001924:	02010113          	addi	sp,sp,32
40001928:	00008067          	ret

4000192c <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
4000192c:	fe010113          	addi	sp,sp,-32
40001930:	00812e23          	sw	s0,28(sp)
40001934:	02010413          	addi	s0,sp,32
40001938:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
4000193c:	fec42783          	lw	a5,-20(s0)
40001940:	0047a783          	lw	a5,4(a5)
40001944:	0107d793          	srli	a5,a5,0x10
40001948:	0ff7f793          	zext.b	a5,a5
}
4000194c:	00078513          	mv	a0,a5
40001950:	01c12403          	lw	s0,28(sp)
40001954:	02010113          	addi	sp,sp,32
40001958:	00008067          	ret

4000195c <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
4000195c:	fe010113          	addi	sp,sp,-32
40001960:	00812e23          	sw	s0,28(sp)
40001964:	02010413          	addi	s0,sp,32
40001968:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
4000196c:	fec42783          	lw	a5,-20(s0)
40001970:	0047a783          	lw	a5,4(a5)
40001974:	0187d793          	srli	a5,a5,0x18
}
40001978:	00078513          	mv	a0,a5
4000197c:	01c12403          	lw	s0,28(sp)
40001980:	02010113          	addi	sp,sp,32
40001984:	00008067          	ret

40001988 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40001988:	fe010113          	addi	sp,sp,-32
4000198c:	00112e23          	sw	ra,28(sp)
40001990:	00812c23          	sw	s0,24(sp)
40001994:	02010413          	addi	s0,sp,32
40001998:	fea42623          	sw	a0,-20(s0)
4000199c:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
400019a0:	00000013          	nop
400019a4:	fec42503          	lw	a0,-20(s0)
400019a8:	f85ff0ef          	jal	ra,4000192c <uart_writeAvailability>
400019ac:	00050793          	mv	a5,a0
400019b0:	fe078ae3          	beqz	a5,400019a4 <uart_write+0x1c>
	reg->DATA = data;
400019b4:	fec42783          	lw	a5,-20(s0)
400019b8:	fe842703          	lw	a4,-24(s0)
400019bc:	00e7a023          	sw	a4,0(a5)
}
400019c0:	00000013          	nop
400019c4:	01c12083          	lw	ra,28(sp)
400019c8:	01812403          	lw	s0,24(sp)
400019cc:	02010113          	addi	sp,sp,32
400019d0:	00008067          	ret

400019d4 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
400019d4:	fe010113          	addi	sp,sp,-32
400019d8:	00812e23          	sw	s0,28(sp)
400019dc:	02010413          	addi	s0,sp,32
400019e0:	fea42623          	sw	a0,-20(s0)
400019e4:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
400019e8:	fe842783          	lw	a5,-24(s0)
400019ec:	00c7a703          	lw	a4,12(a5)
400019f0:	fec42783          	lw	a5,-20(s0)
400019f4:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
400019f8:	fe842783          	lw	a5,-24(s0)
400019fc:	0007a783          	lw	a5,0(a5)
40001a00:	fff78713          	addi	a4,a5,-1
40001a04:	fe842783          	lw	a5,-24(s0)
40001a08:	0047a783          	lw	a5,4(a5)
40001a0c:	00879793          	slli	a5,a5,0x8
40001a10:	00f76733          	or	a4,a4,a5
40001a14:	fe842783          	lw	a5,-24(s0)
40001a18:	0087a783          	lw	a5,8(a5)
40001a1c:	01079793          	slli	a5,a5,0x10
40001a20:	00f76733          	or	a4,a4,a5
40001a24:	fec42783          	lw	a5,-20(s0)
40001a28:	00e7a623          	sw	a4,12(a5)
}
40001a2c:	00000013          	nop
40001a30:	01c12403          	lw	s0,28(sp)
40001a34:	02010113          	addi	sp,sp,32
40001a38:	00008067          	ret

40001a3c <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001a3c:	fe010113          	addi	sp,sp,-32
40001a40:	00812e23          	sw	s0,28(sp)
40001a44:	02010413          	addi	s0,sp,32
40001a48:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001a4c:	fec42783          	lw	a5,-20(s0)
40001a50:	0007a783          	lw	a5,0(a5)
40001a54:	0027f793          	andi	a5,a5,2
40001a58:	00f037b3          	snez	a5,a5
40001a5c:	0ff7f793          	zext.b	a5,a5
}
40001a60:	00078513          	mv	a0,a5
40001a64:	01c12403          	lw	s0,28(sp)
40001a68:	02010113          	addi	sp,sp,32
40001a6c:	00008067          	ret

40001a70 <vga_run>:
static void vga_run(Vga_Reg *reg){
40001a70:	fe010113          	addi	sp,sp,-32
40001a74:	00812e23          	sw	s0,28(sp)
40001a78:	02010413          	addi	s0,sp,32
40001a7c:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40001a80:	fec42783          	lw	a5,-20(s0)
40001a84:	00100713          	li	a4,1
40001a88:	00e7a023          	sw	a4,0(a5)
}
40001a8c:	00000013          	nop
40001a90:	01c12403          	lw	s0,28(sp)
40001a94:	02010113          	addi	sp,sp,32
40001a98:	00008067          	ret

40001a9c <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40001a9c:	fe010113          	addi	sp,sp,-32
40001aa0:	00112e23          	sw	ra,28(sp)
40001aa4:	00812c23          	sw	s0,24(sp)
40001aa8:	02010413          	addi	s0,sp,32
40001aac:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40001ab0:	fec42783          	lw	a5,-20(s0)
40001ab4:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001ab8:	00000013          	nop
40001abc:	fec42503          	lw	a0,-20(s0)
40001ac0:	f7dff0ef          	jal	ra,40001a3c <vga_isBusy>
40001ac4:	00050793          	mv	a5,a0
40001ac8:	fe079ae3          	bnez	a5,40001abc <vga_stop+0x20>
}
40001acc:	00000013          	nop
40001ad0:	00000013          	nop
40001ad4:	01c12083          	lw	ra,28(sp)
40001ad8:	01812403          	lw	s0,24(sp)
40001adc:	02010113          	addi	sp,sp,32
40001ae0:	00008067          	ret

40001ae4 <dm_present_write>:
#include "briey.h"
void dm_present_write(uint32_t iData, uint32_t iAddress)
{
40001ae4:	fe010113          	addi	sp,sp,-32
40001ae8:	00812e23          	sw	s0,28(sp)
40001aec:	02010413          	addi	s0,sp,32
40001af0:	fea42623          	sw	a0,-20(s0)
40001af4:	feb42423          	sw	a1,-24(s0)
	DMPRESENT_BASE->ADDRESS			= iAddress;
40001af8:	f00037b7          	lui	a5,0xf0003
40001afc:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001b00:	fe842703          	lw	a4,-24(s0)
40001b04:	00e7a623          	sw	a4,12(a5)
	DMPRESENT_BASE->WRITE_N 		= 0;
40001b08:	f00037b7          	lui	a5,0xf0003
40001b0c:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001b10:	0007a223          	sw	zero,4(a5)
	DMPRESENT_BASE->READ_N 			= 1;
40001b14:	f00037b7          	lui	a5,0xf0003
40001b18:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001b1c:	00100713          	li	a4,1
40001b20:	00e7a423          	sw	a4,8(a5)
	DMPRESENT_BASE->IDATA			= iData;
40001b24:	f00037b7          	lui	a5,0xf0003
40001b28:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001b2c:	fec42703          	lw	a4,-20(s0)
40001b30:	00e7a823          	sw	a4,16(a5)
	DMPRESENT_BASE->CHIP_SELECT_N	= 0;
40001b34:	f00037b7          	lui	a5,0xf0003
40001b38:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001b3c:	0007a023          	sw	zero,0(a5)
	DMPRESENT_BASE->CHIP_SELECT_N	= 1;
40001b40:	f00037b7          	lui	a5,0xf0003
40001b44:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001b48:	00100713          	li	a4,1
40001b4c:	00e7a023          	sw	a4,0(a5)
}
40001b50:	00000013          	nop
40001b54:	01c12403          	lw	s0,28(sp)
40001b58:	02010113          	addi	sp,sp,32
40001b5c:	00008067          	ret

40001b60 <dm_present_read>:
uint32_t dm_present_read(uint32_t iAddress)
{
40001b60:	fd010113          	addi	sp,sp,-48
40001b64:	02812623          	sw	s0,44(sp)
40001b68:	03010413          	addi	s0,sp,48
40001b6c:	fca42e23          	sw	a0,-36(s0)
	DMPRESENT_BASE->ADDRESS			= iAddress;
40001b70:	f00037b7          	lui	a5,0xf0003
40001b74:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001b78:	fdc42703          	lw	a4,-36(s0)
40001b7c:	00e7a623          	sw	a4,12(a5)
	DMPRESENT_BASE->READ_N			= 0;
40001b80:	f00037b7          	lui	a5,0xf0003
40001b84:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001b88:	0007a423          	sw	zero,8(a5)
	DMPRESENT_BASE->WRITE_N			= 1;
40001b8c:	f00037b7          	lui	a5,0xf0003
40001b90:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001b94:	00100713          	li	a4,1
40001b98:	00e7a223          	sw	a4,4(a5)
	DMPRESENT_BASE->CHIP_SELECT_N	= 0;
40001b9c:	f00037b7          	lui	a5,0xf0003
40001ba0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001ba4:	0007a023          	sw	zero,0(a5)
	uint32_t res 					= DMPRESENT_BASE->ODATA;
40001ba8:	f00037b7          	lui	a5,0xf0003
40001bac:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001bb0:	0147a783          	lw	a5,20(a5)
40001bb4:	fef42623          	sw	a5,-20(s0)
	DMPRESENT_BASE->CHIP_SELECT_N	= 1;
40001bb8:	f00037b7          	lui	a5,0xf0003
40001bbc:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001bc0:	00100713          	li	a4,1
40001bc4:	00e7a023          	sw	a4,0(a5)
	return res;
40001bc8:	fec42783          	lw	a5,-20(s0)
}
40001bcc:	00078513          	mv	a0,a5
40001bd0:	02c12403          	lw	s0,44(sp)
40001bd4:	03010113          	addi	sp,sp,48
40001bd8:	00008067          	ret

40001bdc <dm_present_hash>:
void dm_present_hash(uint32_t *key, uint32_t *block, uint32_t *res) {
40001bdc:	fe010113          	addi	sp,sp,-32
40001be0:	00112e23          	sw	ra,28(sp)
40001be4:	00812c23          	sw	s0,24(sp)
40001be8:	00912a23          	sw	s1,20(sp)
40001bec:	02010413          	addi	s0,sp,32
40001bf0:	fea42623          	sw	a0,-20(s0)
40001bf4:	feb42423          	sw	a1,-24(s0)
40001bf8:	fec42223          	sw	a2,-28(s0)

	//PLAIN_TEXT
	dm_present_write(block[1],DMPRESENT_ADDR_BLOCK_BASE +1);
40001bfc:	fe842783          	lw	a5,-24(s0)
40001c00:	00478793          	addi	a5,a5,4
40001c04:	0007a783          	lw	a5,0(a5)
40001c08:	00500593          	li	a1,5
40001c0c:	00078513          	mv	a0,a5
40001c10:	ed5ff0ef          	jal	ra,40001ae4 <dm_present_write>
	dm_present_write(block[0],DMPRESENT_ADDR_BLOCK_BASE);
40001c14:	fe842783          	lw	a5,-24(s0)
40001c18:	0007a783          	lw	a5,0(a5)
40001c1c:	00400593          	li	a1,4
40001c20:	00078513          	mv	a0,a5
40001c24:	ec1ff0ef          	jal	ra,40001ae4 <dm_present_write>

	//KEY
	dm_present_write(key[2],DMPRESENT_ADDR_KEY_BASE +2);
40001c28:	fec42783          	lw	a5,-20(s0)
40001c2c:	00878793          	addi	a5,a5,8
40001c30:	0007a783          	lw	a5,0(a5)
40001c34:	00300593          	li	a1,3
40001c38:	00078513          	mv	a0,a5
40001c3c:	ea9ff0ef          	jal	ra,40001ae4 <dm_present_write>
	dm_present_write(key[1],DMPRESENT_ADDR_KEY_BASE +1);
40001c40:	fec42783          	lw	a5,-20(s0)
40001c44:	00478793          	addi	a5,a5,4
40001c48:	0007a783          	lw	a5,0(a5)
40001c4c:	00200593          	li	a1,2
40001c50:	00078513          	mv	a0,a5
40001c54:	e91ff0ef          	jal	ra,40001ae4 <dm_present_write>
	dm_present_write(key[0],DMPRESENT_ADDR_KEY_BASE);
40001c58:	fec42783          	lw	a5,-20(s0)
40001c5c:	0007a783          	lw	a5,0(a5)
40001c60:	00100593          	li	a1,1
40001c64:	00078513          	mv	a0,a5
40001c68:	e7dff0ef          	jal	ra,40001ae4 <dm_present_write>

	//START
	dm_present_write(0x1,DMPRESENT_ADDR_START);
40001c6c:	00000593          	li	a1,0
40001c70:	00100513          	li	a0,1
40001c74:	e71ff0ef          	jal	ra,40001ae4 <dm_present_write>
    while(dm_present_read(DMPRESENT_ADDR_RESULT_BASE) == 0);
40001c78:	00000013          	nop
40001c7c:	00600513          	li	a0,6
40001c80:	ee1ff0ef          	jal	ra,40001b60 <dm_present_read>
40001c84:	00050793          	mv	a5,a0
40001c88:	fe078ae3          	beqz	a5,40001c7c <dm_present_hash+0xa0>

    res[1] = dm_present_read(DMPRESENT_ADDR_RESULT_BASE +1);
40001c8c:	fe442783          	lw	a5,-28(s0)
40001c90:	00478493          	addi	s1,a5,4
40001c94:	00700513          	li	a0,7
40001c98:	ec9ff0ef          	jal	ra,40001b60 <dm_present_read>
40001c9c:	00050793          	mv	a5,a0
40001ca0:	00f4a023          	sw	a5,0(s1)
    res[0] = dm_present_read(DMPRESENT_ADDR_RESULT_BASE);
40001ca4:	00600513          	li	a0,6
40001ca8:	eb9ff0ef          	jal	ra,40001b60 <dm_present_read>
40001cac:	00050713          	mv	a4,a0
40001cb0:	fe442783          	lw	a5,-28(s0)
40001cb4:	00e7a023          	sw	a4,0(a5)


    //print result to terminal
	print("\r\t===========================DM_PRESENT HASH==================================\r\n");
40001cb8:	400037b7          	lui	a5,0x40003
40001cbc:	01478513          	addi	a0,a5,20 # 40003014 <vga_simRes_h160_v120+0x20>
40001cc0:	294000ef          	jal	ra,40001f54 <print>
	print("\r\n");
40001cc4:	400037b7          	lui	a5,0x40003
40001cc8:	06878513          	addi	a0,a5,104 # 40003068 <vga_simRes_h160_v120+0x74>
40001ccc:	288000ef          	jal	ra,40001f54 <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
40001cd0:	fe842583          	lw	a1,-24(s0)
40001cd4:	400037b7          	lui	a5,0x40003
40001cd8:	06c78513          	addi	a0,a5,108 # 4000306c <vga_simRes_h160_v120+0x78>
40001cdc:	4e0000ef          	jal	ra,400021bc <print64bit>
	print80bit("KEY (80-bit) : ", key);
40001ce0:	fec42583          	lw	a1,-20(s0)
40001ce4:	400037b7          	lui	a5,0x40003
40001ce8:	08878513          	addi	a0,a5,136 # 40003088 <vga_simRes_h160_v120+0x94>
40001cec:	5d8000ef          	jal	ra,400022c4 <print80bit>
	print64bit("RESULT (64-bit) : ", res);
40001cf0:	fe442583          	lw	a1,-28(s0)
40001cf4:	400037b7          	lui	a5,0x40003
40001cf8:	09878513          	addi	a0,a5,152 # 40003098 <vga_simRes_h160_v120+0xa4>
40001cfc:	4c0000ef          	jal	ra,400021bc <print64bit>
	//print("\r\n============================================================================\r\n");
}
40001d00:	00000013          	nop
40001d04:	01c12083          	lw	ra,28(sp)
40001d08:	01812403          	lw	s0,24(sp)
40001d0c:	01412483          	lw	s1,20(sp)
40001d10:	02010113          	addi	sp,sp,32
40001d14:	00008067          	ret

40001d18 <timer_init>:
static void timer_init(Timer_Reg *reg){
40001d18:	fe010113          	addi	sp,sp,-32
40001d1c:	00812e23          	sw	s0,28(sp)
40001d20:	02010413          	addi	s0,sp,32
40001d24:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40001d28:	fec42783          	lw	a5,-20(s0)
40001d2c:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40001d30:	fec42783          	lw	a5,-20(s0)
40001d34:	0007a423          	sw	zero,8(a5)
}
40001d38:	00000013          	nop
40001d3c:	01c12403          	lw	s0,28(sp)
40001d40:	02010113          	addi	sp,sp,32
40001d44:	00008067          	ret

40001d48 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001d48:	fe010113          	addi	sp,sp,-32
40001d4c:	00812e23          	sw	s0,28(sp)
40001d50:	02010413          	addi	s0,sp,32
40001d54:	fea42623          	sw	a0,-20(s0)
}
40001d58:	00000013          	nop
40001d5c:	01c12403          	lw	s0,28(sp)
40001d60:	02010113          	addi	sp,sp,32
40001d64:	00008067          	ret

40001d68 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001d68:	fe010113          	addi	sp,sp,-32
40001d6c:	00812e23          	sw	s0,28(sp)
40001d70:	02010413          	addi	s0,sp,32
40001d74:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001d78:	fec42783          	lw	a5,-20(s0)
40001d7c:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001d80:	fec42783          	lw	a5,-20(s0)
40001d84:	fff00713          	li	a4,-1
40001d88:	00e7a023          	sw	a4,0(a5)
}
40001d8c:	00000013          	nop
40001d90:	01c12403          	lw	s0,28(sp)
40001d94:	02010113          	addi	sp,sp,32
40001d98:	00008067          	ret

40001d9c <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40001d9c:	fe010113          	addi	sp,sp,-32
40001da0:	00812e23          	sw	s0,28(sp)
40001da4:	02010413          	addi	s0,sp,32
40001da8:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40001dac:	fec42783          	lw	a5,-20(s0)
40001db0:	0047a783          	lw	a5,4(a5)
40001db4:	0107d793          	srli	a5,a5,0x10
40001db8:	0ff7f793          	zext.b	a5,a5
}
40001dbc:	00078513          	mv	a0,a5
40001dc0:	01c12403          	lw	s0,28(sp)
40001dc4:	02010113          	addi	sp,sp,32
40001dc8:	00008067          	ret

40001dcc <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40001dcc:	fe010113          	addi	sp,sp,-32
40001dd0:	00812e23          	sw	s0,28(sp)
40001dd4:	02010413          	addi	s0,sp,32
40001dd8:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40001ddc:	fec42783          	lw	a5,-20(s0)
40001de0:	0047a783          	lw	a5,4(a5)
40001de4:	0187d793          	srli	a5,a5,0x18
}
40001de8:	00078513          	mv	a0,a5
40001dec:	01c12403          	lw	s0,28(sp)
40001df0:	02010113          	addi	sp,sp,32
40001df4:	00008067          	ret

40001df8 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40001df8:	fe010113          	addi	sp,sp,-32
40001dfc:	00112e23          	sw	ra,28(sp)
40001e00:	00812c23          	sw	s0,24(sp)
40001e04:	02010413          	addi	s0,sp,32
40001e08:	fea42623          	sw	a0,-20(s0)
40001e0c:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40001e10:	00000013          	nop
40001e14:	fec42503          	lw	a0,-20(s0)
40001e18:	f85ff0ef          	jal	ra,40001d9c <uart_writeAvailability>
40001e1c:	00050793          	mv	a5,a0
40001e20:	fe078ae3          	beqz	a5,40001e14 <uart_write+0x1c>
	reg->DATA = data;
40001e24:	fec42783          	lw	a5,-20(s0)
40001e28:	fe842703          	lw	a4,-24(s0)
40001e2c:	00e7a023          	sw	a4,0(a5)
}
40001e30:	00000013          	nop
40001e34:	01c12083          	lw	ra,28(sp)
40001e38:	01812403          	lw	s0,24(sp)
40001e3c:	02010113          	addi	sp,sp,32
40001e40:	00008067          	ret

40001e44 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001e44:	fe010113          	addi	sp,sp,-32
40001e48:	00812e23          	sw	s0,28(sp)
40001e4c:	02010413          	addi	s0,sp,32
40001e50:	fea42623          	sw	a0,-20(s0)
40001e54:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001e58:	fe842783          	lw	a5,-24(s0)
40001e5c:	00c7a703          	lw	a4,12(a5)
40001e60:	fec42783          	lw	a5,-20(s0)
40001e64:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001e68:	fe842783          	lw	a5,-24(s0)
40001e6c:	0007a783          	lw	a5,0(a5)
40001e70:	fff78713          	addi	a4,a5,-1
40001e74:	fe842783          	lw	a5,-24(s0)
40001e78:	0047a783          	lw	a5,4(a5)
40001e7c:	00879793          	slli	a5,a5,0x8
40001e80:	00f76733          	or	a4,a4,a5
40001e84:	fe842783          	lw	a5,-24(s0)
40001e88:	0087a783          	lw	a5,8(a5)
40001e8c:	01079793          	slli	a5,a5,0x10
40001e90:	00f76733          	or	a4,a4,a5
40001e94:	fec42783          	lw	a5,-20(s0)
40001e98:	00e7a623          	sw	a4,12(a5)
}
40001e9c:	00000013          	nop
40001ea0:	01c12403          	lw	s0,28(sp)
40001ea4:	02010113          	addi	sp,sp,32
40001ea8:	00008067          	ret

40001eac <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001eac:	fe010113          	addi	sp,sp,-32
40001eb0:	00812e23          	sw	s0,28(sp)
40001eb4:	02010413          	addi	s0,sp,32
40001eb8:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001ebc:	fec42783          	lw	a5,-20(s0)
40001ec0:	0007a783          	lw	a5,0(a5)
40001ec4:	0027f793          	andi	a5,a5,2
40001ec8:	00f037b3          	snez	a5,a5
40001ecc:	0ff7f793          	zext.b	a5,a5
}
40001ed0:	00078513          	mv	a0,a5
40001ed4:	01c12403          	lw	s0,28(sp)
40001ed8:	02010113          	addi	sp,sp,32
40001edc:	00008067          	ret

40001ee0 <vga_run>:
static void vga_run(Vga_Reg *reg){
40001ee0:	fe010113          	addi	sp,sp,-32
40001ee4:	00812e23          	sw	s0,28(sp)
40001ee8:	02010413          	addi	s0,sp,32
40001eec:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40001ef0:	fec42783          	lw	a5,-20(s0)
40001ef4:	00100713          	li	a4,1
40001ef8:	00e7a023          	sw	a4,0(a5)
}
40001efc:	00000013          	nop
40001f00:	01c12403          	lw	s0,28(sp)
40001f04:	02010113          	addi	sp,sp,32
40001f08:	00008067          	ret

40001f0c <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40001f0c:	fe010113          	addi	sp,sp,-32
40001f10:	00112e23          	sw	ra,28(sp)
40001f14:	00812c23          	sw	s0,24(sp)
40001f18:	02010413          	addi	s0,sp,32
40001f1c:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40001f20:	fec42783          	lw	a5,-20(s0)
40001f24:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001f28:	00000013          	nop
40001f2c:	fec42503          	lw	a0,-20(s0)
40001f30:	f7dff0ef          	jal	ra,40001eac <vga_isBusy>
40001f34:	00050793          	mv	a5,a0
40001f38:	fe079ae3          	bnez	a5,40001f2c <vga_stop+0x20>
}
40001f3c:	00000013          	nop
40001f40:	00000013          	nop
40001f44:	01c12083          	lw	ra,28(sp)
40001f48:	01812403          	lw	s0,24(sp)
40001f4c:	02010113          	addi	sp,sp,32
40001f50:	00008067          	ret

40001f54 <print>:
#include <briey.h>

void print(char *str){
40001f54:	fe010113          	addi	sp,sp,-32
40001f58:	00112e23          	sw	ra,28(sp)
40001f5c:	00812c23          	sw	s0,24(sp)
40001f60:	02010413          	addi	s0,sp,32
40001f64:	fea42623          	sw	a0,-20(s0)
	while(*str){
40001f68:	0200006f          	j	40001f88 <print+0x34>
		uart_write(UART,*(str++));
40001f6c:	fec42783          	lw	a5,-20(s0)
40001f70:	00178713          	addi	a4,a5,1
40001f74:	fee42623          	sw	a4,-20(s0)
40001f78:	0007c783          	lbu	a5,0(a5)
40001f7c:	00078593          	mv	a1,a5
40001f80:	f0010537          	lui	a0,0xf0010
40001f84:	e75ff0ef          	jal	ra,40001df8 <uart_write>
	while(*str){
40001f88:	fec42783          	lw	a5,-20(s0)
40001f8c:	0007c783          	lbu	a5,0(a5)
40001f90:	fc079ee3          	bnez	a5,40001f6c <print+0x18>
	}
}
40001f94:	00000013          	nop
40001f98:	00000013          	nop
40001f9c:	01c12083          	lw	ra,28(sp)
40001fa0:	01812403          	lw	s0,24(sp)
40001fa4:	02010113          	addi	sp,sp,32
40001fa8:	00008067          	ret

40001fac <print16bit>:

void print16bit(uint32_t n)
{
40001fac:	fc010113          	addi	sp,sp,-64
40001fb0:	02112e23          	sw	ra,60(sp)
40001fb4:	02812c23          	sw	s0,56(sp)
40001fb8:	04010413          	addi	s0,sp,64
40001fbc:	fca42623          	sw	a0,-52(s0)

    int i = 0;
40001fc0:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40001fc4:	fc042e23          	sw	zero,-36(s0)
40001fc8:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40001fcc:	fcc42783          	lw	a5,-52(s0)
40001fd0:	00f7f793          	andi	a5,a5,15
40001fd4:	40003737          	lui	a4,0x40003
40001fd8:	11070713          	addi	a4,a4,272 # 40003110 <vga_simRes_h160_v120+0x24>
40001fdc:	00f707b3          	add	a5,a4,a5
40001fe0:	0007c703          	lbu	a4,0(a5)
40001fe4:	fec42783          	lw	a5,-20(s0)
40001fe8:	ff040693          	addi	a3,s0,-16
40001fec:	00f687b3          	add	a5,a3,a5
40001ff0:	fee78623          	sb	a4,-20(a5)
        i++;
40001ff4:	fec42783          	lw	a5,-20(s0)
40001ff8:	00178793          	addi	a5,a5,1
40001ffc:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40002000:	fcc42783          	lw	a5,-52(s0)
40002004:	0047d793          	srli	a5,a5,0x4
40002008:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
4000200c:	fcc42783          	lw	a5,-52(s0)
40002010:	fa079ee3          	bnez	a5,40001fcc <print16bit+0x20>
    if(i<8) {
40002014:	fec42703          	lw	a4,-20(s0)
40002018:	00700793          	li	a5,7
4000201c:	02e7ce63          	blt	a5,a4,40002058 <print16bit+0xac>
    	for(int j=7;j>=i;j--){
40002020:	00700793          	li	a5,7
40002024:	fef42423          	sw	a5,-24(s0)
40002028:	0240006f          	j	4000204c <print16bit+0xa0>
    		outbuf_inv[j]="0"[0];
4000202c:	03000713          	li	a4,48
40002030:	fe842783          	lw	a5,-24(s0)
40002034:	ff040693          	addi	a3,s0,-16
40002038:	00f687b3          	add	a5,a3,a5
4000203c:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40002040:	fe842783          	lw	a5,-24(s0)
40002044:	fff78793          	addi	a5,a5,-1
40002048:	fef42423          	sw	a5,-24(s0)
4000204c:	fe842703          	lw	a4,-24(s0)
40002050:	fec42783          	lw	a5,-20(s0)
40002054:	fcf75ce3          	bge	a4,a5,4000202c <print16bit+0x80>
    	}
    }
    for(int j=3;j>=0;j--)
40002058:	00300793          	li	a5,3
4000205c:	fef42223          	sw	a5,-28(s0)
40002060:	02c0006f          	j	4000208c <print16bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40002064:	fe442783          	lw	a5,-28(s0)
40002068:	ff040713          	addi	a4,s0,-16
4000206c:	00f707b3          	add	a5,a4,a5
40002070:	fec7c783          	lbu	a5,-20(a5)
40002074:	00078593          	mv	a1,a5
40002078:	f0010537          	lui	a0,0xf0010
4000207c:	d7dff0ef          	jal	ra,40001df8 <uart_write>
    for(int j=3;j>=0;j--)
40002080:	fe442783          	lw	a5,-28(s0)
40002084:	fff78793          	addi	a5,a5,-1
40002088:	fef42223          	sw	a5,-28(s0)
4000208c:	fe442783          	lw	a5,-28(s0)
40002090:	fc07dae3          	bgez	a5,40002064 <print16bit+0xb8>
    }
    print(" ");
40002094:	400037b7          	lui	a5,0x40003
40002098:	10c78513          	addi	a0,a5,268 # 4000310c <vga_simRes_h160_v120+0x20>
4000209c:	eb9ff0ef          	jal	ra,40001f54 <print>
}
400020a0:	00000013          	nop
400020a4:	03c12083          	lw	ra,60(sp)
400020a8:	03812403          	lw	s0,56(sp)
400020ac:	04010113          	addi	sp,sp,64
400020b0:	00008067          	ret

400020b4 <print32bit>:
void print32bit(uint32_t n)
{
400020b4:	fc010113          	addi	sp,sp,-64
400020b8:	02112e23          	sw	ra,60(sp)
400020bc:	02812c23          	sw	s0,56(sp)
400020c0:	04010413          	addi	s0,sp,64
400020c4:	fca42623          	sw	a0,-52(s0)

    int i = 0;
400020c8:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
400020cc:	fc042e23          	sw	zero,-36(s0)
400020d0:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
400020d4:	fcc42783          	lw	a5,-52(s0)
400020d8:	00f7f793          	andi	a5,a5,15
400020dc:	40003737          	lui	a4,0x40003
400020e0:	11070713          	addi	a4,a4,272 # 40003110 <vga_simRes_h160_v120+0x24>
400020e4:	00f707b3          	add	a5,a4,a5
400020e8:	0007c703          	lbu	a4,0(a5)
400020ec:	fec42783          	lw	a5,-20(s0)
400020f0:	ff040693          	addi	a3,s0,-16
400020f4:	00f687b3          	add	a5,a3,a5
400020f8:	fee78623          	sb	a4,-20(a5)
        i++;
400020fc:	fec42783          	lw	a5,-20(s0)
40002100:	00178793          	addi	a5,a5,1
40002104:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40002108:	fcc42783          	lw	a5,-52(s0)
4000210c:	0047d793          	srli	a5,a5,0x4
40002110:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40002114:	fcc42783          	lw	a5,-52(s0)
40002118:	fa079ee3          	bnez	a5,400020d4 <print32bit+0x20>
    if(i<8) {
4000211c:	fec42703          	lw	a4,-20(s0)
40002120:	00700793          	li	a5,7
40002124:	02e7ce63          	blt	a5,a4,40002160 <print32bit+0xac>
    	for(int j=7;j>=i;j--){
40002128:	00700793          	li	a5,7
4000212c:	fef42423          	sw	a5,-24(s0)
40002130:	0240006f          	j	40002154 <print32bit+0xa0>
    		outbuf_inv[j]="0"[0];
40002134:	03000713          	li	a4,48
40002138:	fe842783          	lw	a5,-24(s0)
4000213c:	ff040693          	addi	a3,s0,-16
40002140:	00f687b3          	add	a5,a3,a5
40002144:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40002148:	fe842783          	lw	a5,-24(s0)
4000214c:	fff78793          	addi	a5,a5,-1
40002150:	fef42423          	sw	a5,-24(s0)
40002154:	fe842703          	lw	a4,-24(s0)
40002158:	fec42783          	lw	a5,-20(s0)
4000215c:	fcf75ce3          	bge	a4,a5,40002134 <print32bit+0x80>
    	}
    }
    for(int j=7;j>=0;j--)
40002160:	00700793          	li	a5,7
40002164:	fef42223          	sw	a5,-28(s0)
40002168:	02c0006f          	j	40002194 <print32bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
4000216c:	fe442783          	lw	a5,-28(s0)
40002170:	ff040713          	addi	a4,s0,-16
40002174:	00f707b3          	add	a5,a4,a5
40002178:	fec7c783          	lbu	a5,-20(a5)
4000217c:	00078593          	mv	a1,a5
40002180:	f0010537          	lui	a0,0xf0010
40002184:	c75ff0ef          	jal	ra,40001df8 <uart_write>
    for(int j=7;j>=0;j--)
40002188:	fe442783          	lw	a5,-28(s0)
4000218c:	fff78793          	addi	a5,a5,-1
40002190:	fef42223          	sw	a5,-28(s0)
40002194:	fe442783          	lw	a5,-28(s0)
40002198:	fc07dae3          	bgez	a5,4000216c <print32bit+0xb8>
    }
    print(" ");
4000219c:	400037b7          	lui	a5,0x40003
400021a0:	10c78513          	addi	a0,a5,268 # 4000310c <vga_simRes_h160_v120+0x20>
400021a4:	db1ff0ef          	jal	ra,40001f54 <print>
}
400021a8:	00000013          	nop
400021ac:	03c12083          	lw	ra,60(sp)
400021b0:	03812403          	lw	s0,56(sp)
400021b4:	04010113          	addi	sp,sp,64
400021b8:	00008067          	ret

400021bc <print64bit>:

void print64bit(char *message,uint32_t *num)
{
400021bc:	fe010113          	addi	sp,sp,-32
400021c0:	00112e23          	sw	ra,28(sp)
400021c4:	00812c23          	sw	s0,24(sp)
400021c8:	02010413          	addi	s0,sp,32
400021cc:	fea42623          	sw	a0,-20(s0)
400021d0:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
400021d4:	400037b7          	lui	a5,0x40003
400021d8:	12478513          	addi	a0,a5,292 # 40003124 <vga_simRes_h160_v120+0x38>
400021dc:	d79ff0ef          	jal	ra,40001f54 <print>
	print(message);
400021e0:	fec42503          	lw	a0,-20(s0)
400021e4:	d71ff0ef          	jal	ra,40001f54 <print>
	print32bit(num[1]);
400021e8:	fe842783          	lw	a5,-24(s0)
400021ec:	00478793          	addi	a5,a5,4
400021f0:	0007a783          	lw	a5,0(a5)
400021f4:	00078513          	mv	a0,a5
400021f8:	ebdff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[0]);
400021fc:	fe842783          	lw	a5,-24(s0)
40002200:	0007a783          	lw	a5,0(a5)
40002204:	00078513          	mv	a0,a5
40002208:	eadff0ef          	jal	ra,400020b4 <print32bit>
	print("\r\n");
4000220c:	400037b7          	lui	a5,0x40003
40002210:	12878513          	addi	a0,a5,296 # 40003128 <vga_simRes_h160_v120+0x3c>
40002214:	d41ff0ef          	jal	ra,40001f54 <print>
}
40002218:	00000013          	nop
4000221c:	01c12083          	lw	ra,28(sp)
40002220:	01812403          	lw	s0,24(sp)
40002224:	02010113          	addi	sp,sp,32
40002228:	00008067          	ret

4000222c <print128bit>:
void print128bit(char *message, uint32_t *num)
{
4000222c:	fe010113          	addi	sp,sp,-32
40002230:	00112e23          	sw	ra,28(sp)
40002234:	00812c23          	sw	s0,24(sp)
40002238:	02010413          	addi	s0,sp,32
4000223c:	fea42623          	sw	a0,-20(s0)
40002240:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002244:	400037b7          	lui	a5,0x40003
40002248:	12478513          	addi	a0,a5,292 # 40003124 <vga_simRes_h160_v120+0x38>
4000224c:	d09ff0ef          	jal	ra,40001f54 <print>
	print(message);
40002250:	fec42503          	lw	a0,-20(s0)
40002254:	d01ff0ef          	jal	ra,40001f54 <print>
	print32bit(num[3]);
40002258:	fe842783          	lw	a5,-24(s0)
4000225c:	00c78793          	addi	a5,a5,12
40002260:	0007a783          	lw	a5,0(a5)
40002264:	00078513          	mv	a0,a5
40002268:	e4dff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[2]);
4000226c:	fe842783          	lw	a5,-24(s0)
40002270:	00878793          	addi	a5,a5,8
40002274:	0007a783          	lw	a5,0(a5)
40002278:	00078513          	mv	a0,a5
4000227c:	e39ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[1]);
40002280:	fe842783          	lw	a5,-24(s0)
40002284:	00478793          	addi	a5,a5,4
40002288:	0007a783          	lw	a5,0(a5)
4000228c:	00078513          	mv	a0,a5
40002290:	e25ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[0]);
40002294:	fe842783          	lw	a5,-24(s0)
40002298:	0007a783          	lw	a5,0(a5)
4000229c:	00078513          	mv	a0,a5
400022a0:	e15ff0ef          	jal	ra,400020b4 <print32bit>
	print("\r\n");
400022a4:	400037b7          	lui	a5,0x40003
400022a8:	12878513          	addi	a0,a5,296 # 40003128 <vga_simRes_h160_v120+0x3c>
400022ac:	ca9ff0ef          	jal	ra,40001f54 <print>
}
400022b0:	00000013          	nop
400022b4:	01c12083          	lw	ra,28(sp)
400022b8:	01812403          	lw	s0,24(sp)
400022bc:	02010113          	addi	sp,sp,32
400022c0:	00008067          	ret

400022c4 <print80bit>:
void print80bit(char *message,uint32_t *num)
{
400022c4:	fe010113          	addi	sp,sp,-32
400022c8:	00112e23          	sw	ra,28(sp)
400022cc:	00812c23          	sw	s0,24(sp)
400022d0:	02010413          	addi	s0,sp,32
400022d4:	fea42623          	sw	a0,-20(s0)
400022d8:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
400022dc:	400037b7          	lui	a5,0x40003
400022e0:	12478513          	addi	a0,a5,292 # 40003124 <vga_simRes_h160_v120+0x38>
400022e4:	c71ff0ef          	jal	ra,40001f54 <print>
	print(message);
400022e8:	fec42503          	lw	a0,-20(s0)
400022ec:	c69ff0ef          	jal	ra,40001f54 <print>
	print32bit(num[2]);
400022f0:	fe842783          	lw	a5,-24(s0)
400022f4:	00878793          	addi	a5,a5,8
400022f8:	0007a783          	lw	a5,0(a5)
400022fc:	00078513          	mv	a0,a5
40002300:	db5ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[1]);
40002304:	fe842783          	lw	a5,-24(s0)
40002308:	00478793          	addi	a5,a5,4
4000230c:	0007a783          	lw	a5,0(a5)
40002310:	00078513          	mv	a0,a5
40002314:	da1ff0ef          	jal	ra,400020b4 <print32bit>
	print16bit(num[0]);
40002318:	fe842783          	lw	a5,-24(s0)
4000231c:	0007a783          	lw	a5,0(a5)
40002320:	00078513          	mv	a0,a5
40002324:	c89ff0ef          	jal	ra,40001fac <print16bit>
	print("\r\n");
40002328:	400037b7          	lui	a5,0x40003
4000232c:	12878513          	addi	a0,a5,296 # 40003128 <vga_simRes_h160_v120+0x3c>
40002330:	c25ff0ef          	jal	ra,40001f54 <print>
}
40002334:	00000013          	nop
40002338:	01c12083          	lw	ra,28(sp)
4000233c:	01812403          	lw	s0,24(sp)
40002340:	02010113          	addi	sp,sp,32
40002344:	00008067          	ret

40002348 <print256bit>:
void print256bit(char *message, uint32_t *num)
{
40002348:	fe010113          	addi	sp,sp,-32
4000234c:	00112e23          	sw	ra,28(sp)
40002350:	00812c23          	sw	s0,24(sp)
40002354:	02010413          	addi	s0,sp,32
40002358:	fea42623          	sw	a0,-20(s0)
4000235c:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002360:	400037b7          	lui	a5,0x40003
40002364:	12478513          	addi	a0,a5,292 # 40003124 <vga_simRes_h160_v120+0x38>
40002368:	bedff0ef          	jal	ra,40001f54 <print>
	print(message);
4000236c:	fec42503          	lw	a0,-20(s0)
40002370:	be5ff0ef          	jal	ra,40001f54 <print>
	print32bit(num[7]);
40002374:	fe842783          	lw	a5,-24(s0)
40002378:	01c78793          	addi	a5,a5,28
4000237c:	0007a783          	lw	a5,0(a5)
40002380:	00078513          	mv	a0,a5
40002384:	d31ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[6]);
40002388:	fe842783          	lw	a5,-24(s0)
4000238c:	01878793          	addi	a5,a5,24
40002390:	0007a783          	lw	a5,0(a5)
40002394:	00078513          	mv	a0,a5
40002398:	d1dff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[5]);
4000239c:	fe842783          	lw	a5,-24(s0)
400023a0:	01478793          	addi	a5,a5,20
400023a4:	0007a783          	lw	a5,0(a5)
400023a8:	00078513          	mv	a0,a5
400023ac:	d09ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[4]);
400023b0:	fe842783          	lw	a5,-24(s0)
400023b4:	01078793          	addi	a5,a5,16
400023b8:	0007a783          	lw	a5,0(a5)
400023bc:	00078513          	mv	a0,a5
400023c0:	cf5ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[3]);
400023c4:	fe842783          	lw	a5,-24(s0)
400023c8:	00c78793          	addi	a5,a5,12
400023cc:	0007a783          	lw	a5,0(a5)
400023d0:	00078513          	mv	a0,a5
400023d4:	ce1ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[2]);
400023d8:	fe842783          	lw	a5,-24(s0)
400023dc:	00878793          	addi	a5,a5,8
400023e0:	0007a783          	lw	a5,0(a5)
400023e4:	00078513          	mv	a0,a5
400023e8:	ccdff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[1]);
400023ec:	fe842783          	lw	a5,-24(s0)
400023f0:	00478793          	addi	a5,a5,4
400023f4:	0007a783          	lw	a5,0(a5)
400023f8:	00078513          	mv	a0,a5
400023fc:	cb9ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[0]);
40002400:	fe842783          	lw	a5,-24(s0)
40002404:	0007a783          	lw	a5,0(a5)
40002408:	00078513          	mv	a0,a5
4000240c:	ca9ff0ef          	jal	ra,400020b4 <print32bit>
	print("\r\n");
40002410:	400037b7          	lui	a5,0x40003
40002414:	12878513          	addi	a0,a5,296 # 40003128 <vga_simRes_h160_v120+0x3c>
40002418:	b3dff0ef          	jal	ra,40001f54 <print>
}
4000241c:	00000013          	nop
40002420:	01c12083          	lw	ra,28(sp)
40002424:	01812403          	lw	s0,24(sp)
40002428:	02010113          	addi	sp,sp,32
4000242c:	00008067          	ret

40002430 <print512bit>:
void print512bit (char *message, uint32_t *num)
{
40002430:	fe010113          	addi	sp,sp,-32
40002434:	00112e23          	sw	ra,28(sp)
40002438:	00812c23          	sw	s0,24(sp)
4000243c:	02010413          	addi	s0,sp,32
40002440:	fea42623          	sw	a0,-20(s0)
40002444:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002448:	400037b7          	lui	a5,0x40003
4000244c:	12478513          	addi	a0,a5,292 # 40003124 <vga_simRes_h160_v120+0x38>
40002450:	b05ff0ef          	jal	ra,40001f54 <print>
	print(message);
40002454:	fec42503          	lw	a0,-20(s0)
40002458:	afdff0ef          	jal	ra,40001f54 <print>
	print32bit(num[15]);
4000245c:	fe842783          	lw	a5,-24(s0)
40002460:	03c78793          	addi	a5,a5,60
40002464:	0007a783          	lw	a5,0(a5)
40002468:	00078513          	mv	a0,a5
4000246c:	c49ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[14]);
40002470:	fe842783          	lw	a5,-24(s0)
40002474:	03878793          	addi	a5,a5,56
40002478:	0007a783          	lw	a5,0(a5)
4000247c:	00078513          	mv	a0,a5
40002480:	c35ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[13]);
40002484:	fe842783          	lw	a5,-24(s0)
40002488:	03478793          	addi	a5,a5,52
4000248c:	0007a783          	lw	a5,0(a5)
40002490:	00078513          	mv	a0,a5
40002494:	c21ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[12]);
40002498:	fe842783          	lw	a5,-24(s0)
4000249c:	03078793          	addi	a5,a5,48
400024a0:	0007a783          	lw	a5,0(a5)
400024a4:	00078513          	mv	a0,a5
400024a8:	c0dff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[11]);
400024ac:	fe842783          	lw	a5,-24(s0)
400024b0:	02c78793          	addi	a5,a5,44
400024b4:	0007a783          	lw	a5,0(a5)
400024b8:	00078513          	mv	a0,a5
400024bc:	bf9ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[10]);
400024c0:	fe842783          	lw	a5,-24(s0)
400024c4:	02878793          	addi	a5,a5,40
400024c8:	0007a783          	lw	a5,0(a5)
400024cc:	00078513          	mv	a0,a5
400024d0:	be5ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[9]);
400024d4:	fe842783          	lw	a5,-24(s0)
400024d8:	02478793          	addi	a5,a5,36
400024dc:	0007a783          	lw	a5,0(a5)
400024e0:	00078513          	mv	a0,a5
400024e4:	bd1ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[8]);
400024e8:	fe842783          	lw	a5,-24(s0)
400024ec:	02078793          	addi	a5,a5,32
400024f0:	0007a783          	lw	a5,0(a5)
400024f4:	00078513          	mv	a0,a5
400024f8:	bbdff0ef          	jal	ra,400020b4 <print32bit>
	print("\r\n");
400024fc:	400037b7          	lui	a5,0x40003
40002500:	12878513          	addi	a0,a5,296 # 40003128 <vga_simRes_h160_v120+0x3c>
40002504:	a51ff0ef          	jal	ra,40001f54 <print>
	print("\r\t                   ");
40002508:	400037b7          	lui	a5,0x40003
4000250c:	12c78513          	addi	a0,a5,300 # 4000312c <vga_simRes_h160_v120+0x40>
40002510:	a45ff0ef          	jal	ra,40001f54 <print>
	print32bit(num[7]);
40002514:	fe842783          	lw	a5,-24(s0)
40002518:	01c78793          	addi	a5,a5,28
4000251c:	0007a783          	lw	a5,0(a5)
40002520:	00078513          	mv	a0,a5
40002524:	b91ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[6]);
40002528:	fe842783          	lw	a5,-24(s0)
4000252c:	01878793          	addi	a5,a5,24
40002530:	0007a783          	lw	a5,0(a5)
40002534:	00078513          	mv	a0,a5
40002538:	b7dff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[5]);
4000253c:	fe842783          	lw	a5,-24(s0)
40002540:	01478793          	addi	a5,a5,20
40002544:	0007a783          	lw	a5,0(a5)
40002548:	00078513          	mv	a0,a5
4000254c:	b69ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[4]);
40002550:	fe842783          	lw	a5,-24(s0)
40002554:	01078793          	addi	a5,a5,16
40002558:	0007a783          	lw	a5,0(a5)
4000255c:	00078513          	mv	a0,a5
40002560:	b55ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[3]);
40002564:	fe842783          	lw	a5,-24(s0)
40002568:	00c78793          	addi	a5,a5,12
4000256c:	0007a783          	lw	a5,0(a5)
40002570:	00078513          	mv	a0,a5
40002574:	b41ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[2]);
40002578:	fe842783          	lw	a5,-24(s0)
4000257c:	00878793          	addi	a5,a5,8
40002580:	0007a783          	lw	a5,0(a5)
40002584:	00078513          	mv	a0,a5
40002588:	b2dff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[1]);
4000258c:	fe842783          	lw	a5,-24(s0)
40002590:	00478793          	addi	a5,a5,4
40002594:	0007a783          	lw	a5,0(a5)
40002598:	00078513          	mv	a0,a5
4000259c:	b19ff0ef          	jal	ra,400020b4 <print32bit>
	print32bit(num[0]);
400025a0:	fe842783          	lw	a5,-24(s0)
400025a4:	0007a783          	lw	a5,0(a5)
400025a8:	00078513          	mv	a0,a5
400025ac:	b09ff0ef          	jal	ra,400020b4 <print32bit>
	print("\r\n");
400025b0:	400037b7          	lui	a5,0x40003
400025b4:	12878513          	addi	a0,a5,296 # 40003128 <vga_simRes_h160_v120+0x3c>
400025b8:	99dff0ef          	jal	ra,40001f54 <print>
}
400025bc:	00000013          	nop
400025c0:	01c12083          	lw	ra,28(sp)
400025c4:	01812403          	lw	s0,24(sp)
400025c8:	02010113          	addi	sp,sp,32
400025cc:	00008067          	ret
