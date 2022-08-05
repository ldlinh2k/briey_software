
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
80000068:	4a4080e7          	jalr	1188(ra) # 40001508 <irqCallback>
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
800000b8:	42c18193          	addi	gp,gp,1068 # 400044e0 <__global_pointer$>
800000bc:	00001117          	auipc	sp,0x1
800000c0:	88410113          	addi	sp,sp,-1916 # 80000940 <_stack_start>

800000c4 <bss_init>:
800000c4:	c0004517          	auipc	a0,0xc0004
800000c8:	c1c50513          	addi	a0,a0,-996 # 40003ce0 <_bss_end>
800000cc:	c0004597          	auipc	a1,0xc0004
800000d0:	c1458593          	addi	a1,a1,-1004 # 40003ce0 <_bss_end>

800000d4 <bss_loop>:
800000d4:	00b50863          	beq	a0,a1,800000e4 <bss_done>
800000d8:	00052023          	sw	zero,0(a0)
800000dc:	00450513          	addi	a0,a0,4
800000e0:	ff5ff06f          	j	800000d4 <bss_loop>

800000e4 <bss_done>:
800000e4:	c0004517          	auipc	a0,0xc0004
800000e8:	bf850513          	addi	a0,a0,-1032 # 40003cdc <_ctors_end>
800000ec:	ffc10113          	addi	sp,sp,-4

800000f0 <ctors_loop>:
800000f0:	c0004597          	auipc	a1,0xc0004
800000f4:	bec58593          	addi	a1,a1,-1044 # 40003cdc <_ctors_end>
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
40000348:	05478513          	addi	a0,a5,84 # 40003054 <vga_simRes_h160_v120+0x20>
4000034c:	539010ef          	jal	ra,40002084 <print>
	print("\r\n");
40000350:	400037b7          	lui	a5,0x40003
40000354:	0b478513          	addi	a0,a5,180 # 400030b4 <vga_simRes_h160_v120+0x80>
40000358:	52d010ef          	jal	ra,40002084 <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
4000035c:	fe442583          	lw	a1,-28(s0)
40000360:	400037b7          	lui	a5,0x40003
40000364:	0b878513          	addi	a0,a5,184 # 400030b8 <vga_simRes_h160_v120+0x84>
40000368:	785010ef          	jal	ra,400022ec <print64bit>
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
40000614:	0d478513          	addi	a0,a5,212 # 400030d4 <vga_simRes_h160_v120+0xa0>
40000618:	661010ef          	jal	ra,40002478 <print256bit>
	print512bit("RESULT (512-bit) : ", res);
4000061c:	fdc42583          	lw	a1,-36(s0)
40000620:	400037b7          	lui	a5,0x40003
40000624:	0e878513          	addi	a0,a5,232 # 400030e8 <vga_simRes_h160_v120+0xb4>
40000628:	739010ef          	jal	ra,40002560 <print512bit>
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
40000a48:	15c78513          	addi	a0,a5,348 # 4000315c <vga_simRes_h160_v120+0x20>
40000a4c:	638010ef          	jal	ra,40002084 <print>
40000a50:	0100006f          	j	40000a60 <prince_cipher+0x12c>
40000a54:	400037b7          	lui	a5,0x40003
40000a58:	1b078513          	addi	a0,a5,432 # 400031b0 <vga_simRes_h160_v120+0x74>
40000a5c:	628010ef          	jal	ra,40002084 <print>
40000a60:	400037b7          	lui	a5,0x40003
40000a64:	20478513          	addi	a0,a5,516 # 40003204 <vga_simRes_h160_v120+0xc8>
40000a68:	61c010ef          	jal	ra,40002084 <print>
40000a6c:	fe442583          	lw	a1,-28(s0)
40000a70:	400037b7          	lui	a5,0x40003
40000a74:	20878513          	addi	a0,a5,520 # 40003208 <vga_simRes_h160_v120+0xcc>
40000a78:	075010ef          	jal	ra,400022ec <print64bit>
40000a7c:	fe842583          	lw	a1,-24(s0)
40000a80:	400037b7          	lui	a5,0x40003
40000a84:	22078513          	addi	a0,a5,544 # 40003220 <vga_simRes_h160_v120+0xe4>
40000a88:	0d5010ef          	jal	ra,4000235c <print128bit>
40000a8c:	fe042583          	lw	a1,-32(s0)
40000a90:	400037b7          	lui	a5,0x40003
40000a94:	23478513          	addi	a0,a5,564 # 40003234 <vga_simRes_h160_v120+0xf8>
40000a98:	055010ef          	jal	ra,400022ec <print64bit>
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
40000d24:	ee010113          	addi	sp,sp,-288
40000d28:	10112e23          	sw	ra,284(sp)
40000d2c:	10812c23          	sw	s0,280(sp)
40000d30:	12010413          	addi	s0,sp,288
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
40000d60:	2a878513          	addi	a0,a5,680 # 400032a8 <vga_simRes_h160_v120+0x20>
40000d64:	320010ef          	jal	ra,40002084 <print>
	print("\r\t*****************************************POLY1305 TEST************************************\r\n");
40000d68:	400037b7          	lui	a5,0x40003
40000d6c:	2ac78513          	addi	a0,a5,684 # 400032ac <vga_simRes_h160_v120+0x24>
40000d70:	314010ef          	jal	ra,40002084 <print>
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
40000db8:	30c78513          	addi	a0,a5,780 # 4000330c <vga_simRes_h160_v120+0x84>
40000dbc:	2c8010ef          	jal	ra,40002084 <print>
	//key 85d6be78 57556d33 7f4452fe 42d506a8 0103808a fb0db2fd 4abff6af 4149f51b
	//0 bytes message
	//res expec: h0103808a fb0db2fd 4abff6af 4149f51b
	poly_key[7]= 0x85d6be78;
40000dc0:	85d6c7b7          	lui	a5,0x85d6c
40000dc4:	e7878793          	addi	a5,a5,-392 # 85d6be78 <_stack_start+0x5d6b538>
40000dc8:	fcf42e23          	sw	a5,-36(s0)
	poly_key[6]= 0x57556d33;
40000dcc:	575577b7          	lui	a5,0x57557
40000dd0:	d3378793          	addi	a5,a5,-717 # 57556d33 <__global_pointer$+0x17552853>
40000dd4:	fcf42c23          	sw	a5,-40(s0)
	poly_key[5]= 0x7f4452fe;
40000dd8:	7f4457b7          	lui	a5,0x7f445
40000ddc:	2fe78793          	addi	a5,a5,766 # 7f4452fe <__global_pointer$+0x3f440e1e>
40000de0:	fcf42a23          	sw	a5,-44(s0)
	poly_key[4]= 0x42d506a8;
40000de4:	42d507b7          	lui	a5,0x42d50
40000de8:	6a878793          	addi	a5,a5,1704 # 42d506a8 <__global_pointer$+0x2d4c1c8>
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
40000e0c:	6af78793          	addi	a5,a5,1711 # 4abff6af <__global_pointer$+0xabfb1cf>
40000e10:	fcf42223          	sw	a5,-60(s0)
	poly_key[0]= 0x4149f51b;
40000e14:	4149f7b7          	lui	a5,0x4149f
40000e18:	51b78793          	addi	a5,a5,1307 # 4149f51b <__global_pointer$+0x149b03b>
40000e1c:	fcf42023          	sw	a5,-64(s0)

	poly_test_N_bytes(0,poly_key,poly_block,poly_res);
40000e20:	fa040693          	addi	a3,s0,-96
40000e24:	fb040713          	addi	a4,s0,-80
40000e28:	fc040793          	addi	a5,s0,-64
40000e2c:	00070613          	mv	a2,a4
40000e30:	00078593          	mv	a1,a5
40000e34:	00000513          	li	a0,0
40000e38:	655010ef          	jal	ra,40002c8c <poly_test_N_bytes>
	print("\r\n\t==========================================TEST 2==========================================\r\n");
40000e3c:	400037b7          	lui	a5,0x40003
40000e40:	36c78513          	addi	a0,a5,876 # 4000336c <vga_simRes_h160_v120+0xe4>
40000e44:	240010ef          	jal	ra,40002084 <print>
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
40000e68:	625010ef          	jal	ra,40002c8c <poly_test_N_bytes>

	print("\r\n\t==========================================TEST 3==========================================\r\n");
40000e6c:	400037b7          	lui	a5,0x40003
40000e70:	3cc78513          	addi	a0,a5,972 # 400033cc <vga_simRes_h160_v120+0x144>
40000e74:	210010ef          	jal	ra,40002084 <print>
	//res expec: ha8061dc1_305136c6_c22b8baf_0c0127a9
	poly_test_rfc8439();
40000e78:	6a1010ef          	jal	ra,40002d18 <poly_test_rfc8439>

	print("\r\n\t==========================================TEST 4==========================================\r\n");
40000e7c:	400037b7          	lui	a5,0x40003
40000e80:	42c78513          	addi	a0,a5,1068 # 4000342c <vga_simRes_h160_v120+0x1a4>
40000e84:	200010ef          	jal	ra,40002084 <print>
	//res expec: hdc0964e5 ce9cd7d9 a7571faf a5dc0473
	poly_test_long();
40000e88:	054020ef          	jal	ra,40002edc <poly_test_long>
	//ab
	//CHACHA
	print("\r\n");
40000e8c:	400037b7          	lui	a5,0x40003
40000e90:	2a878513          	addi	a0,a5,680 # 400032a8 <vga_simRes_h160_v120+0x20>
40000e94:	1f0010ef          	jal	ra,40002084 <print>
	print("\r\t*****************************************CHACHA TEST**************************************\r\n");
40000e98:	400037b7          	lui	a5,0x40003
40000e9c:	48c78513          	addi	a0,a5,1164 # 4000348c <vga_simRes_h160_v120+0x204>
40000ea0:	1e4010ef          	jal	ra,40002084 <print>
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
40000f0c:	30c78513          	addi	a0,a5,780 # 4000330c <vga_simRes_h160_v120+0x84>
40000f10:	174010ef          	jal	ra,40002084 <print>
	print("\r\n\t[All zeros, 128-bit key, 8 rounds]\r\n");
40000f14:	400037b7          	lui	a5,0x40003
40000f18:	4ec78513          	addi	a0,a5,1260 # 400034ec <vga_simRes_h160_v120+0x264>
40000f1c:	168010ef          	jal	ra,40002084 <print>
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
40000f40:	51478513          	addi	a0,a5,1300 # 40003514 <vga_simRes_h160_v120+0x28c>
40000f44:	140010ef          	jal	ra,40002084 <print>
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
40000f74:	54078513          	addi	a0,a5,1344 # 40003540 <vga_simRes_h160_v120+0x2b8>
40000f78:	10c010ef          	jal	ra,40002084 <print>
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
40000fa8:	56c78513          	addi	a0,a5,1388 # 4000356c <vga_simRes_h160_v120+0x2e4>
40000fac:	0d8010ef          	jal	ra,40002084 <print>
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
40000fdc:	59478513          	addi	a0,a5,1428 # 40003594 <vga_simRes_h160_v120+0x30c>
40000fe0:	0a4010ef          	jal	ra,40002084 <print>
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
40001010:	5c078513          	addi	a0,a5,1472 # 400035c0 <vga_simRes_h160_v120+0x338>
40001014:	070010ef          	jal	ra,40002084 <print>
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
40001044:	36c78513          	addi	a0,a5,876 # 4000336c <vga_simRes_h160_v120+0xe4>
40001048:	03c010ef          	jal	ra,40002084 <print>
	print("\r\n\t[256-bit key, 8 rounds]\r\n");
4000104c:	400037b7          	lui	a5,0x40003
40001050:	5ec78513          	addi	a0,a5,1516 # 400035ec <vga_simRes_h160_v120+0x364>
40001054:	030010ef          	jal	ra,40002084 <print>
	chacha_block[1]=0x0f1e2d3c;
40001058:	0f1e37b7          	lui	a5,0xf1e3
4000105c:	d3c78793          	addi	a5,a5,-708 # f1e2d3c <_stack_size+0xf1e253c>
40001060:	f6f42e23          	sw	a5,-132(s0)
	chacha_block[0]=0x4b596877;
40001064:	4b5977b7          	lui	a5,0x4b597
40001068:	87778793          	addi	a5,a5,-1929 # 4b596877 <__global_pointer$+0xb592397>
4000106c:	f6f42c23          	sw	a5,-136(s0)

	chacha_key[7]=	0x00112233;
40001070:	001127b7          	lui	a5,0x112
40001074:	23378793          	addi	a5,a5,563 # 112233 <_stack_size+0x111a33>
40001078:	f8f42e23          	sw	a5,-100(s0)
	chacha_key[6]=	0x44556677;
4000107c:	445567b7          	lui	a5,0x44556
40001080:	67778793          	addi	a5,a5,1655 # 44556677 <__global_pointer$+0x4552197>
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
400010bc:	54478793          	addi	a5,a5,1348 # 77665544 <__global_pointer$+0x37661064>
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
400010f0:	3cc78513          	addi	a0,a5,972 # 400033cc <vga_simRes_h160_v120+0x144>
400010f4:	791000ef          	jal	ra,40002084 <print>
	print("\r\n\t[All bits in key and IV are set. 128 bit key, 8 rounds]\r\n");
400010f8:	400037b7          	lui	a5,0x40003
400010fc:	60c78513          	addi	a0,a5,1548 # 4000360c <vga_simRes_h160_v120+0x384>
40001100:	785000ef          	jal	ra,40002084 <print>
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
40001174:	42c78513          	addi	a0,a5,1068 # 4000342c <vga_simRes_h160_v120+0x1a4>
40001178:	70d000ef          	jal	ra,40002084 <print>
	//128-bit key
	//ha7a6c81bd8ac106e8f3a46a1bc8ec702e95d18c7e0f424519aeafb54471d83a2bf888861586b73d228eaaf82f9665a5a155e867f93731bfbe24fab495590b231
	chacha_block[1]=0x0f1e2d3c;
4000117c:	0f1e37b7          	lui	a5,0xf1e3
40001180:	d3c78793          	addi	a5,a5,-708 # f1e2d3c <_stack_size+0xf1e253c>
40001184:	f6f42e23          	sw	a5,-132(s0)
	chacha_block[0]=0x4b596877;
40001188:	4b5977b7          	lui	a5,0x4b597
4000118c:	87778793          	addi	a5,a5,-1929 # 4b596877 <__global_pointer$+0xb592397>
40001190:	f6f42c23          	sw	a5,-136(s0)
	chacha_key[7]=	0x00112233;
40001194:	001127b7          	lui	a5,0x112
40001198:	23378793          	addi	a5,a5,563 # 112233 <_stack_size+0x111a33>
4000119c:	f8f42e23          	sw	a5,-100(s0)
	chacha_key[6]=	0x44556677;
400011a0:	445567b7          	lui	a5,0x44556
400011a4:	67778793          	addi	a5,a5,1655 # 44556677 <__global_pointer$+0x4552197>
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
400011f4:	64c78513          	addi	a0,a5,1612 # 4000364c <vga_simRes_h160_v120+0x3c4>
400011f8:	68d000ef          	jal	ra,40002084 <print>
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
40001220:	6a078513          	addi	a0,a5,1696 # 400036a0 <vga_simRes_h160_v120+0x418>
40001224:	661000ef          	jal	ra,40002084 <print>

	prince_block[1] 	= 0x69c4e0d8;
40001228:	69c4e7b7          	lui	a5,0x69c4e
4000122c:	0d878793          	addi	a5,a5,216 # 69c4e0d8 <__global_pointer$+0x29c49bf8>
40001230:	f2f42423          	sw	a5,-216(s0)
	prince_block[0] 	= 0x6a7b0430;
40001234:	6a7b07b7          	lui	a5,0x6a7b0
40001238:	43078793          	addi	a5,a5,1072 # 6a7b0430 <__global_pointer$+0x2a7abf50>
4000123c:	f2f42223          	sw	a5,-220(s0)

	prince_key[3]		= 0xd8cdb780;
40001240:	d8cdb7b7          	lui	a5,0xd8cdb
40001244:	78078793          	addi	a5,a5,1920 # d8cdb780 <_stack_start+0x58cdae40>
40001248:	f2f42c23          	sw	a5,-200(s0)
	prince_key[2]		= 0x70b4c55a;
4000124c:	70b4c7b7          	lui	a5,0x70b4c
40001250:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b4807a>
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
4000128c:	400037b7          	lui	a5,0x40003
40001290:	6f478513          	addi	a0,a5,1780 # 400036f4 <vga_simRes_h160_v120+0x46c>
40001294:	5f1000ef          	jal	ra,40002084 <print>

	prince_block[1] 	= 0x43c6b256;
40001298:	43c6b7b7          	lui	a5,0x43c6b
4000129c:	25678793          	addi	a5,a5,598 # 43c6b256 <__global_pointer$+0x3c66d76>
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
400012d0:	2a878513          	addi	a0,a5,680 # 400032a8 <vga_simRes_h160_v120+0x20>
400012d4:	5b1000ef          	jal	ra,40002084 <print>
	print("\r\t******************************PRESENT TEST**********************************\r\n");
400012d8:	400037b7          	lui	a5,0x40003
400012dc:	74878513          	addi	a0,a5,1864 # 40003748 <vga_simRes_h160_v120+0x4c0>
400012e0:	5a5000ef          	jal	ra,40002084 <print>
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
40001300:	400037b7          	lui	a5,0x40003
40001304:	79c78513          	addi	a0,a5,1948 # 4000379c <vga_simRes_h160_v120+0x514>
40001308:	57d000ef          	jal	ra,40002084 <print>

	present_block[1]=0x4c746e67;
4000130c:	4c7477b7          	lui	a5,0x4c747
40001310:	e6778793          	addi	a5,a5,-409 # 4c746e67 <__global_pointer$+0xc742987>
40001314:	f0f42623          	sw	a5,-244(s0)
	present_block[0]=0x7579656e;
40001318:	757967b7          	lui	a5,0x75796
4000131c:	56e78793          	addi	a5,a5,1390 # 7579656e <__global_pointer$+0x3579208e>
40001320:	f0f42423          	sw	a5,-248(s0)

	present_key[2] = 0x46657465;
40001324:	466577b7          	lui	a5,0x46657
40001328:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6652f85>
4000132c:	f0f42c23          	sw	a5,-232(s0)
	present_key[1] = 0x6c48636d;
40001330:	6c4867b7          	lui	a5,0x6c486
40001334:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c481e8d>
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
40001360:	4f8000ef          	jal	ra,40001858 <present_cipher>

	print("\r\n\t==================================TEST 2====================================\r\n");
40001364:	400037b7          	lui	a5,0x40003
40001368:	7f078513          	addi	a0,a5,2032 # 400037f0 <vga_simRes_h160_v120+0x568>
4000136c:	519000ef          	jal	ra,40002084 <print>

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
400013a0:	4b8000ef          	jal	ra,40001858 <present_cipher>
	//DM_PRESENT
	print("\r\n");
400013a4:	400037b7          	lui	a5,0x40003
400013a8:	2a878513          	addi	a0,a5,680 # 400032a8 <vga_simRes_h160_v120+0x20>
400013ac:	4d9000ef          	jal	ra,40002084 <print>
	print("\r\t***************************DM_PRESENT TEST**********************************\r\n");
400013b0:	400047b7          	lui	a5,0x40004
400013b4:	84478513          	addi	a0,a5,-1980 # 40003844 <vga_simRes_h160_v120+0x5bc>
400013b8:	4cd000ef          	jal	ra,40002084 <print>
	unsigned int dm_present_key[3] 		= {0x0, 0x0, 0x0};
400013bc:	ee042a23          	sw	zero,-268(s0)
400013c0:	ee042c23          	sw	zero,-264(s0)
400013c4:	ee042e23          	sw	zero,-260(s0)
	unsigned int dm_present_block[2] 	= {0x0, 0x0};
400013c8:	ee042623          	sw	zero,-276(s0)
400013cc:	ee042823          	sw	zero,-272(s0)
	unsigned int dm_present_res[2] 		= {0x0, 0x0};
400013d0:	ee042223          	sw	zero,-284(s0)
400013d4:	ee042423          	sw	zero,-280(s0)

	print("\r\n\t==================================TEST 1====================================\r\n");
400013d8:	400037b7          	lui	a5,0x40003
400013dc:	79c78513          	addi	a0,a5,1948 # 4000379c <vga_simRes_h160_v120+0x514>
400013e0:	4a5000ef          	jal	ra,40002084 <print>

	dm_present_block[1]=0x4c746e67;
400013e4:	4c7477b7          	lui	a5,0x4c747
400013e8:	e6778793          	addi	a5,a5,-409 # 4c746e67 <__global_pointer$+0xc742987>
400013ec:	eef42823          	sw	a5,-272(s0)
	dm_present_block[0]=0x7579656e;
400013f0:	757967b7          	lui	a5,0x75796
400013f4:	56e78793          	addi	a5,a5,1390 # 7579656e <__global_pointer$+0x3579208e>
400013f8:	eef42623          	sw	a5,-276(s0)

	dm_present_key[2] = 0x46657465;
400013fc:	466577b7          	lui	a5,0x46657
40001400:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6652f85>
40001404:	eef42e23          	sw	a5,-260(s0)
	dm_present_key[1] = 0x6c48636d;
40001408:	6c4867b7          	lui	a5,0x6c486
4000140c:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c481e8d>
40001410:	eef42c23          	sw	a5,-264(s0)
	dm_present_key[0] = 0x7573;
40001414:	000077b7          	lui	a5,0x7
40001418:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
4000141c:	eef42a23          	sw	a5,-268(s0)

	//expec: 42696eb3 9112ccf2

	dm_present_hash(dm_present_key,dm_present_block,dm_present_res);
40001420:	ee440693          	addi	a3,s0,-284
40001424:	eec40713          	addi	a4,s0,-276
40001428:	ef440793          	addi	a5,s0,-268
4000142c:	00068613          	mv	a2,a3
40001430:	00070593          	mv	a1,a4
40001434:	00078513          	mv	a0,a5
40001438:	0d5000ef          	jal	ra,40001d0c <dm_present_hash>

	print("\r\n\t==================================TEST 2====================================\r\n");
4000143c:	400037b7          	lui	a5,0x40003
40001440:	7f078513          	addi	a0,a5,2032 # 400037f0 <vga_simRes_h160_v120+0x568>
40001444:	441000ef          	jal	ra,40002084 <print>

	dm_present_block[1]=0x46657465;
40001448:	466577b7          	lui	a5,0x46657
4000144c:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6652f85>
40001450:	eef42823          	sw	a5,-272(s0)
	dm_present_block[0]=0x6c5f5553;
40001454:	6c5f57b7          	lui	a5,0x6c5f5
40001458:	55378793          	addi	a5,a5,1363 # 6c5f5553 <__global_pointer$+0x2c5f1073>
4000145c:	eef42623          	sw	a5,-276(s0)

	dm_present_key[2] = 0x00000000;
40001460:	ee042e23          	sw	zero,-260(s0)
	dm_present_key[1] = 0x00000000;
40001464:	ee042c23          	sw	zero,-264(s0)
	dm_present_key[0] = 0x0001;
40001468:	00100793          	li	a5,1
4000146c:	eef42a23          	sw	a5,-268(s0)
	//expec:d52384e3 dcee9ce7

	dm_present_hash(dm_present_key,dm_present_block,dm_present_res);
40001470:	ee440693          	addi	a3,s0,-284
40001474:	eec40713          	addi	a4,s0,-276
40001478:	ef440793          	addi	a5,s0,-268
4000147c:	00068613          	mv	a2,a3
40001480:	00070593          	mv	a1,a4
40001484:	00078513          	mv	a0,a5
40001488:	085000ef          	jal	ra,40001d0c <dm_present_hash>
	print("\r\n\t==================================TEST 3====================================\r\n");
4000148c:	400047b7          	lui	a5,0x40004
40001490:	89878513          	addi	a0,a5,-1896 # 40003898 <vga_simRes_h160_v120+0x610>
40001494:	3f1000ef          	jal	ra,40002084 <print>

	dm_present_block[1]=0x31383230;
40001498:	313837b7          	lui	a5,0x31383
4000149c:	23078793          	addi	a5,a5,560 # 31383230 <_stack_size+0x31382a30>
400014a0:	eef42823          	sw	a5,-272(s0)
	dm_present_block[0]=0x30313833;
400014a4:	303147b7          	lui	a5,0x30314
400014a8:	83378793          	addi	a5,a5,-1997 # 30313833 <_stack_size+0x30313033>
400014ac:	eef42623          	sw	a5,-276(s0)

	dm_present_key[2] = 0x31383230;
400014b0:	313837b7          	lui	a5,0x31383
400014b4:	23078793          	addi	a5,a5,560 # 31383230 <_stack_size+0x31382a30>
400014b8:	eef42e23          	sw	a5,-260(s0)
	dm_present_key[1] = 0x30313833;
400014bc:	303147b7          	lui	a5,0x30314
400014c0:	83378793          	addi	a5,a5,-1997 # 30313833 <_stack_size+0x30313033>
400014c4:	eef42c23          	sw	a5,-264(s0)
	dm_present_key[0] = 0x5553;
400014c8:	000057b7          	lui	a5,0x5
400014cc:	55378793          	addi	a5,a5,1363 # 5553 <_stack_size+0x4d53>
400014d0:	eef42a23          	sw	a5,-268(s0)
	//expec: 08e11c56 b6d5a592
	dm_present_hash(dm_present_key,dm_present_block,dm_present_res);
400014d4:	ee440693          	addi	a3,s0,-284
400014d8:	eec40713          	addi	a4,s0,-276
400014dc:	ef440793          	addi	a5,s0,-268
400014e0:	00068613          	mv	a2,a3
400014e4:	00070593          	mv	a1,a4
400014e8:	00078513          	mv	a0,a5
400014ec:	021000ef          	jal	ra,40001d0c <dm_present_hash>

	return 0;	
400014f0:	00000793          	li	a5,0
}
400014f4:	00078513          	mv	a0,a5
400014f8:	11c12083          	lw	ra,284(sp)
400014fc:	11812403          	lw	s0,280(sp)
40001500:	12010113          	addi	sp,sp,288
40001504:	00008067          	ret

40001508 <irqCallback>:
void irqCallback(){
40001508:	ff010113          	addi	sp,sp,-16
4000150c:	00812623          	sw	s0,12(sp)
40001510:	01010413          	addi	s0,sp,16

}
40001514:	00000013          	nop
40001518:	00c12403          	lw	s0,12(sp)
4000151c:	01010113          	addi	sp,sp,16
40001520:	00008067          	ret

40001524 <timer_init>:
static void timer_init(Timer_Reg *reg){
40001524:	fe010113          	addi	sp,sp,-32
40001528:	00812e23          	sw	s0,28(sp)
4000152c:	02010413          	addi	s0,sp,32
40001530:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40001534:	fec42783          	lw	a5,-20(s0)
40001538:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
4000153c:	fec42783          	lw	a5,-20(s0)
40001540:	0007a423          	sw	zero,8(a5)
}
40001544:	00000013          	nop
40001548:	01c12403          	lw	s0,28(sp)
4000154c:	02010113          	addi	sp,sp,32
40001550:	00008067          	ret

40001554 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001554:	fe010113          	addi	sp,sp,-32
40001558:	00812e23          	sw	s0,28(sp)
4000155c:	02010413          	addi	s0,sp,32
40001560:	fea42623          	sw	a0,-20(s0)
}
40001564:	00000013          	nop
40001568:	01c12403          	lw	s0,28(sp)
4000156c:	02010113          	addi	sp,sp,32
40001570:	00008067          	ret

40001574 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001574:	fe010113          	addi	sp,sp,-32
40001578:	00812e23          	sw	s0,28(sp)
4000157c:	02010413          	addi	s0,sp,32
40001580:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001584:	fec42783          	lw	a5,-20(s0)
40001588:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
4000158c:	fec42783          	lw	a5,-20(s0)
40001590:	fff00713          	li	a4,-1
40001594:	00e7a023          	sw	a4,0(a5)
}
40001598:	00000013          	nop
4000159c:	01c12403          	lw	s0,28(sp)
400015a0:	02010113          	addi	sp,sp,32
400015a4:	00008067          	ret

400015a8 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
400015a8:	fe010113          	addi	sp,sp,-32
400015ac:	00812e23          	sw	s0,28(sp)
400015b0:	02010413          	addi	s0,sp,32
400015b4:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
400015b8:	fec42783          	lw	a5,-20(s0)
400015bc:	0047a783          	lw	a5,4(a5)
400015c0:	0107d793          	srli	a5,a5,0x10
400015c4:	0ff7f793          	zext.b	a5,a5
}
400015c8:	00078513          	mv	a0,a5
400015cc:	01c12403          	lw	s0,28(sp)
400015d0:	02010113          	addi	sp,sp,32
400015d4:	00008067          	ret

400015d8 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
400015d8:	fe010113          	addi	sp,sp,-32
400015dc:	00812e23          	sw	s0,28(sp)
400015e0:	02010413          	addi	s0,sp,32
400015e4:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
400015e8:	fec42783          	lw	a5,-20(s0)
400015ec:	0047a783          	lw	a5,4(a5)
400015f0:	0187d793          	srli	a5,a5,0x18
}
400015f4:	00078513          	mv	a0,a5
400015f8:	01c12403          	lw	s0,28(sp)
400015fc:	02010113          	addi	sp,sp,32
40001600:	00008067          	ret

40001604 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40001604:	fe010113          	addi	sp,sp,-32
40001608:	00112e23          	sw	ra,28(sp)
4000160c:	00812c23          	sw	s0,24(sp)
40001610:	02010413          	addi	s0,sp,32
40001614:	fea42623          	sw	a0,-20(s0)
40001618:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
4000161c:	00000013          	nop
40001620:	fec42503          	lw	a0,-20(s0)
40001624:	f85ff0ef          	jal	ra,400015a8 <uart_writeAvailability>
40001628:	00050793          	mv	a5,a0
4000162c:	fe078ae3          	beqz	a5,40001620 <uart_write+0x1c>
	reg->DATA = data;
40001630:	fec42783          	lw	a5,-20(s0)
40001634:	fe842703          	lw	a4,-24(s0)
40001638:	00e7a023          	sw	a4,0(a5)
}
4000163c:	00000013          	nop
40001640:	01c12083          	lw	ra,28(sp)
40001644:	01812403          	lw	s0,24(sp)
40001648:	02010113          	addi	sp,sp,32
4000164c:	00008067          	ret

40001650 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001650:	fe010113          	addi	sp,sp,-32
40001654:	00812e23          	sw	s0,28(sp)
40001658:	02010413          	addi	s0,sp,32
4000165c:	fea42623          	sw	a0,-20(s0)
40001660:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001664:	fe842783          	lw	a5,-24(s0)
40001668:	00c7a703          	lw	a4,12(a5)
4000166c:	fec42783          	lw	a5,-20(s0)
40001670:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001674:	fe842783          	lw	a5,-24(s0)
40001678:	0007a783          	lw	a5,0(a5)
4000167c:	fff78713          	addi	a4,a5,-1
40001680:	fe842783          	lw	a5,-24(s0)
40001684:	0047a783          	lw	a5,4(a5)
40001688:	00879793          	slli	a5,a5,0x8
4000168c:	00f76733          	or	a4,a4,a5
40001690:	fe842783          	lw	a5,-24(s0)
40001694:	0087a783          	lw	a5,8(a5)
40001698:	01079793          	slli	a5,a5,0x10
4000169c:	00f76733          	or	a4,a4,a5
400016a0:	fec42783          	lw	a5,-20(s0)
400016a4:	00e7a623          	sw	a4,12(a5)
}
400016a8:	00000013          	nop
400016ac:	01c12403          	lw	s0,28(sp)
400016b0:	02010113          	addi	sp,sp,32
400016b4:	00008067          	ret

400016b8 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
400016b8:	fe010113          	addi	sp,sp,-32
400016bc:	00812e23          	sw	s0,28(sp)
400016c0:	02010413          	addi	s0,sp,32
400016c4:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
400016c8:	fec42783          	lw	a5,-20(s0)
400016cc:	0007a783          	lw	a5,0(a5)
400016d0:	0027f793          	andi	a5,a5,2
400016d4:	00f037b3          	snez	a5,a5
400016d8:	0ff7f793          	zext.b	a5,a5
}
400016dc:	00078513          	mv	a0,a5
400016e0:	01c12403          	lw	s0,28(sp)
400016e4:	02010113          	addi	sp,sp,32
400016e8:	00008067          	ret

400016ec <vga_run>:
static void vga_run(Vga_Reg *reg){
400016ec:	fe010113          	addi	sp,sp,-32
400016f0:	00812e23          	sw	s0,28(sp)
400016f4:	02010413          	addi	s0,sp,32
400016f8:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
400016fc:	fec42783          	lw	a5,-20(s0)
40001700:	00100713          	li	a4,1
40001704:	00e7a023          	sw	a4,0(a5)
}
40001708:	00000013          	nop
4000170c:	01c12403          	lw	s0,28(sp)
40001710:	02010113          	addi	sp,sp,32
40001714:	00008067          	ret

40001718 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40001718:	fe010113          	addi	sp,sp,-32
4000171c:	00112e23          	sw	ra,28(sp)
40001720:	00812c23          	sw	s0,24(sp)
40001724:	02010413          	addi	s0,sp,32
40001728:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
4000172c:	fec42783          	lw	a5,-20(s0)
40001730:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001734:	00000013          	nop
40001738:	fec42503          	lw	a0,-20(s0)
4000173c:	f7dff0ef          	jal	ra,400016b8 <vga_isBusy>
40001740:	00050793          	mv	a5,a0
40001744:	fe079ae3          	bnez	a5,40001738 <vga_stop+0x20>
}
40001748:	00000013          	nop
4000174c:	00000013          	nop
40001750:	01c12083          	lw	ra,28(sp)
40001754:	01812403          	lw	s0,24(sp)
40001758:	02010113          	addi	sp,sp,32
4000175c:	00008067          	ret

40001760 <present_write>:
#include "briey.h"
void present_write(uint32_t iData, uint32_t iAddress)
{
40001760:	fe010113          	addi	sp,sp,-32
40001764:	00812e23          	sw	s0,28(sp)
40001768:	02010413          	addi	s0,sp,32
4000176c:	fea42623          	sw	a0,-20(s0)
40001770:	feb42423          	sw	a1,-24(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
40001774:	f00027b7          	lui	a5,0xf0002
40001778:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000177c:	fe842703          	lw	a4,-24(s0)
40001780:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->WRITE_N 		= 0;
40001784:	f00027b7          	lui	a5,0xf0002
40001788:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000178c:	0007a223          	sw	zero,4(a5)
	PRESENT_BASE->READ_N 		= 1;
40001790:	f00027b7          	lui	a5,0xf0002
40001794:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001798:	00100713          	li	a4,1
4000179c:	00e7a423          	sw	a4,8(a5)
	PRESENT_BASE->IDATA			= iData;
400017a0:	f00027b7          	lui	a5,0xf0002
400017a4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400017a8:	fec42703          	lw	a4,-20(s0)
400017ac:	00e7a823          	sw	a4,16(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
400017b0:	f00027b7          	lui	a5,0xf0002
400017b4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400017b8:	0007a023          	sw	zero,0(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
400017bc:	f00027b7          	lui	a5,0xf0002
400017c0:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400017c4:	00100713          	li	a4,1
400017c8:	00e7a023          	sw	a4,0(a5)
}
400017cc:	00000013          	nop
400017d0:	01c12403          	lw	s0,28(sp)
400017d4:	02010113          	addi	sp,sp,32
400017d8:	00008067          	ret

400017dc <present_read>:
uint32_t present_read(uint32_t iAddress)
{
400017dc:	fd010113          	addi	sp,sp,-48
400017e0:	02812623          	sw	s0,44(sp)
400017e4:	03010413          	addi	s0,sp,48
400017e8:	fca42e23          	sw	a0,-36(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
400017ec:	f00027b7          	lui	a5,0xf0002
400017f0:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
400017f4:	fdc42703          	lw	a4,-36(s0)
400017f8:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->READ_N		= 0;
400017fc:	f00027b7          	lui	a5,0xf0002
40001800:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001804:	0007a423          	sw	zero,8(a5)
	PRESENT_BASE->WRITE_N		= 1;
40001808:	f00027b7          	lui	a5,0xf0002
4000180c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001810:	00100713          	li	a4,1
40001814:	00e7a223          	sw	a4,4(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
40001818:	f00027b7          	lui	a5,0xf0002
4000181c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001820:	0007a023          	sw	zero,0(a5)
	uint32_t res 				= PRESENT_BASE->ODATA;
40001824:	f00027b7          	lui	a5,0xf0002
40001828:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000182c:	0147a783          	lw	a5,20(a5)
40001830:	fef42623          	sw	a5,-20(s0)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
40001834:	f00027b7          	lui	a5,0xf0002
40001838:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
4000183c:	00100713          	li	a4,1
40001840:	00e7a023          	sw	a4,0(a5)
	return res;
40001844:	fec42783          	lw	a5,-20(s0)
}
40001848:	00078513          	mv	a0,a5
4000184c:	02c12403          	lw	s0,44(sp)
40001850:	03010113          	addi	sp,sp,48
40001854:	00008067          	ret

40001858 <present_cipher>:
void present_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
40001858:	fe010113          	addi	sp,sp,-32
4000185c:	00112e23          	sw	ra,28(sp)
40001860:	00812c23          	sw	s0,24(sp)
40001864:	00912a23          	sw	s1,20(sp)
40001868:	02010413          	addi	s0,sp,32
4000186c:	00050793          	mv	a5,a0
40001870:	feb42423          	sw	a1,-24(s0)
40001874:	fec42223          	sw	a2,-28(s0)
40001878:	fed42023          	sw	a3,-32(s0)
4000187c:	fef407a3          	sb	a5,-17(s0)

	//EN_OR_DE
	if(operation == PRESENT_OP_EN) present_write(PRESENT_OP_EN,PRESENT_ADDR_EN_OR_DE);
40001880:	fef44783          	lbu	a5,-17(s0)
40001884:	00079a63          	bnez	a5,40001898 <present_cipher+0x40>
40001888:	00800593          	li	a1,8
4000188c:	00000513          	li	a0,0
40001890:	ed1ff0ef          	jal	ra,40001760 <present_write>
40001894:	0100006f          	j	400018a4 <present_cipher+0x4c>
	else present_write(PRESENT_OP_DE,PRESENT_ADDR_EN_OR_DE);
40001898:	00800593          	li	a1,8
4000189c:	00100513          	li	a0,1
400018a0:	ec1ff0ef          	jal	ra,40001760 <present_write>

	//PLAIN_TEXT
	present_write(block[1],PRESENT_ADDR_BLOCK_BASE +1);
400018a4:	fe442783          	lw	a5,-28(s0)
400018a8:	00478793          	addi	a5,a5,4
400018ac:	0007a783          	lw	a5,0(a5)
400018b0:	00500593          	li	a1,5
400018b4:	00078513          	mv	a0,a5
400018b8:	ea9ff0ef          	jal	ra,40001760 <present_write>
	present_write(block[0],PRESENT_ADDR_BLOCK_BASE);
400018bc:	fe442783          	lw	a5,-28(s0)
400018c0:	0007a783          	lw	a5,0(a5)
400018c4:	00400593          	li	a1,4
400018c8:	00078513          	mv	a0,a5
400018cc:	e95ff0ef          	jal	ra,40001760 <present_write>

	//KEY
	present_write(key[2],PRESENT_ADDR_KEY_BASE +2);
400018d0:	fe842783          	lw	a5,-24(s0)
400018d4:	00878793          	addi	a5,a5,8
400018d8:	0007a783          	lw	a5,0(a5)
400018dc:	00300593          	li	a1,3
400018e0:	00078513          	mv	a0,a5
400018e4:	e7dff0ef          	jal	ra,40001760 <present_write>
	present_write(key[1],PRESENT_ADDR_KEY_BASE +1);
400018e8:	fe842783          	lw	a5,-24(s0)
400018ec:	00478793          	addi	a5,a5,4
400018f0:	0007a783          	lw	a5,0(a5)
400018f4:	00200593          	li	a1,2
400018f8:	00078513          	mv	a0,a5
400018fc:	e65ff0ef          	jal	ra,40001760 <present_write>
	present_write(key[0],PRESENT_ADDR_KEY_BASE);
40001900:	fe842783          	lw	a5,-24(s0)
40001904:	0007a783          	lw	a5,0(a5)
40001908:	00100593          	li	a1,1
4000190c:	00078513          	mv	a0,a5
40001910:	e51ff0ef          	jal	ra,40001760 <present_write>

	//START
	present_write(0x1,PRESENT_ADDR_START);
40001914:	00000593          	li	a1,0
40001918:	00100513          	li	a0,1
4000191c:	e45ff0ef          	jal	ra,40001760 <present_write>
    while(present_read(PRESENT_ADDR_RESULT_BASE) == 0);
40001920:	00000013          	nop
40001924:	00600513          	li	a0,6
40001928:	eb5ff0ef          	jal	ra,400017dc <present_read>
4000192c:	00050793          	mv	a5,a0
40001930:	fe078ae3          	beqz	a5,40001924 <present_cipher+0xcc>

    res[1] = present_read(PRESENT_ADDR_RESULT_BASE +1);
40001934:	fe042783          	lw	a5,-32(s0)
40001938:	00478493          	addi	s1,a5,4
4000193c:	00700513          	li	a0,7
40001940:	e9dff0ef          	jal	ra,400017dc <present_read>
40001944:	00050793          	mv	a5,a0
40001948:	00f4a023          	sw	a5,0(s1)
    res[0] =present_read(PRESENT_ADDR_RESULT_BASE);
4000194c:	00600513          	li	a0,6
40001950:	e8dff0ef          	jal	ra,400017dc <present_read>
40001954:	00050713          	mv	a4,a0
40001958:	fe042783          	lw	a5,-32(s0)
4000195c:	00e7a023          	sw	a4,0(a5)


    //print result to terminal
	if(operation == PRESENT_OP_EN)
40001960:	fef44783          	lbu	a5,-17(s0)
40001964:	00079a63          	bnez	a5,40001978 <present_cipher+0x120>
		print("\r\t===========================PRESENT ENCRYPTTION==============================\r\n");
40001968:	400047b7          	lui	a5,0x40004
4000196c:	94c78513          	addi	a0,a5,-1716 # 4000394c <vga_simRes_h160_v120+0x20>
40001970:	714000ef          	jal	ra,40002084 <print>
40001974:	0100006f          	j	40001984 <present_cipher+0x12c>
	else
		print("\r\t===========================PRESENT DECRYPTTION==============================\r\n");
40001978:	400047b7          	lui	a5,0x40004
4000197c:	9a078513          	addi	a0,a5,-1632 # 400039a0 <vga_simRes_h160_v120+0x74>
40001980:	704000ef          	jal	ra,40002084 <print>
	print("\r\n");
40001984:	400047b7          	lui	a5,0x40004
40001988:	9f478513          	addi	a0,a5,-1548 # 400039f4 <vga_simRes_h160_v120+0xc8>
4000198c:	6f8000ef          	jal	ra,40002084 <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
40001990:	fe442583          	lw	a1,-28(s0)
40001994:	400047b7          	lui	a5,0x40004
40001998:	9f878513          	addi	a0,a5,-1544 # 400039f8 <vga_simRes_h160_v120+0xcc>
4000199c:	151000ef          	jal	ra,400022ec <print64bit>
	print80bit("KEY (80-bit) : ", key);
400019a0:	fe842583          	lw	a1,-24(s0)
400019a4:	400047b7          	lui	a5,0x40004
400019a8:	a1478513          	addi	a0,a5,-1516 # 40003a14 <vga_simRes_h160_v120+0xe8>
400019ac:	249000ef          	jal	ra,400023f4 <print80bit>
	print64bit("RESULT (64-bit) : ", res);
400019b0:	fe042583          	lw	a1,-32(s0)
400019b4:	400047b7          	lui	a5,0x40004
400019b8:	a2478513          	addi	a0,a5,-1500 # 40003a24 <vga_simRes_h160_v120+0xf8>
400019bc:	131000ef          	jal	ra,400022ec <print64bit>
	//print("\r\n============================================================================\r\n");
}
400019c0:	00000013          	nop
400019c4:	01c12083          	lw	ra,28(sp)
400019c8:	01812403          	lw	s0,24(sp)
400019cc:	01412483          	lw	s1,20(sp)
400019d0:	02010113          	addi	sp,sp,32
400019d4:	00008067          	ret

400019d8 <timer_init>:
static void timer_init(Timer_Reg *reg){
400019d8:	fe010113          	addi	sp,sp,-32
400019dc:	00812e23          	sw	s0,28(sp)
400019e0:	02010413          	addi	s0,sp,32
400019e4:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
400019e8:	fec42783          	lw	a5,-20(s0)
400019ec:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
400019f0:	fec42783          	lw	a5,-20(s0)
400019f4:	0007a423          	sw	zero,8(a5)
}
400019f8:	00000013          	nop
400019fc:	01c12403          	lw	s0,28(sp)
40001a00:	02010113          	addi	sp,sp,32
40001a04:	00008067          	ret

40001a08 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001a08:	fe010113          	addi	sp,sp,-32
40001a0c:	00812e23          	sw	s0,28(sp)
40001a10:	02010413          	addi	s0,sp,32
40001a14:	fea42623          	sw	a0,-20(s0)
}
40001a18:	00000013          	nop
40001a1c:	01c12403          	lw	s0,28(sp)
40001a20:	02010113          	addi	sp,sp,32
40001a24:	00008067          	ret

40001a28 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001a28:	fe010113          	addi	sp,sp,-32
40001a2c:	00812e23          	sw	s0,28(sp)
40001a30:	02010413          	addi	s0,sp,32
40001a34:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001a38:	fec42783          	lw	a5,-20(s0)
40001a3c:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001a40:	fec42783          	lw	a5,-20(s0)
40001a44:	fff00713          	li	a4,-1
40001a48:	00e7a023          	sw	a4,0(a5)
}
40001a4c:	00000013          	nop
40001a50:	01c12403          	lw	s0,28(sp)
40001a54:	02010113          	addi	sp,sp,32
40001a58:	00008067          	ret

40001a5c <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40001a5c:	fe010113          	addi	sp,sp,-32
40001a60:	00812e23          	sw	s0,28(sp)
40001a64:	02010413          	addi	s0,sp,32
40001a68:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40001a6c:	fec42783          	lw	a5,-20(s0)
40001a70:	0047a783          	lw	a5,4(a5)
40001a74:	0107d793          	srli	a5,a5,0x10
40001a78:	0ff7f793          	zext.b	a5,a5
}
40001a7c:	00078513          	mv	a0,a5
40001a80:	01c12403          	lw	s0,28(sp)
40001a84:	02010113          	addi	sp,sp,32
40001a88:	00008067          	ret

40001a8c <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40001a8c:	fe010113          	addi	sp,sp,-32
40001a90:	00812e23          	sw	s0,28(sp)
40001a94:	02010413          	addi	s0,sp,32
40001a98:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40001a9c:	fec42783          	lw	a5,-20(s0)
40001aa0:	0047a783          	lw	a5,4(a5)
40001aa4:	0187d793          	srli	a5,a5,0x18
}
40001aa8:	00078513          	mv	a0,a5
40001aac:	01c12403          	lw	s0,28(sp)
40001ab0:	02010113          	addi	sp,sp,32
40001ab4:	00008067          	ret

40001ab8 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40001ab8:	fe010113          	addi	sp,sp,-32
40001abc:	00112e23          	sw	ra,28(sp)
40001ac0:	00812c23          	sw	s0,24(sp)
40001ac4:	02010413          	addi	s0,sp,32
40001ac8:	fea42623          	sw	a0,-20(s0)
40001acc:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40001ad0:	00000013          	nop
40001ad4:	fec42503          	lw	a0,-20(s0)
40001ad8:	f85ff0ef          	jal	ra,40001a5c <uart_writeAvailability>
40001adc:	00050793          	mv	a5,a0
40001ae0:	fe078ae3          	beqz	a5,40001ad4 <uart_write+0x1c>
	reg->DATA = data;
40001ae4:	fec42783          	lw	a5,-20(s0)
40001ae8:	fe842703          	lw	a4,-24(s0)
40001aec:	00e7a023          	sw	a4,0(a5)
}
40001af0:	00000013          	nop
40001af4:	01c12083          	lw	ra,28(sp)
40001af8:	01812403          	lw	s0,24(sp)
40001afc:	02010113          	addi	sp,sp,32
40001b00:	00008067          	ret

40001b04 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001b04:	fe010113          	addi	sp,sp,-32
40001b08:	00812e23          	sw	s0,28(sp)
40001b0c:	02010413          	addi	s0,sp,32
40001b10:	fea42623          	sw	a0,-20(s0)
40001b14:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001b18:	fe842783          	lw	a5,-24(s0)
40001b1c:	00c7a703          	lw	a4,12(a5)
40001b20:	fec42783          	lw	a5,-20(s0)
40001b24:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001b28:	fe842783          	lw	a5,-24(s0)
40001b2c:	0007a783          	lw	a5,0(a5)
40001b30:	fff78713          	addi	a4,a5,-1
40001b34:	fe842783          	lw	a5,-24(s0)
40001b38:	0047a783          	lw	a5,4(a5)
40001b3c:	00879793          	slli	a5,a5,0x8
40001b40:	00f76733          	or	a4,a4,a5
40001b44:	fe842783          	lw	a5,-24(s0)
40001b48:	0087a783          	lw	a5,8(a5)
40001b4c:	01079793          	slli	a5,a5,0x10
40001b50:	00f76733          	or	a4,a4,a5
40001b54:	fec42783          	lw	a5,-20(s0)
40001b58:	00e7a623          	sw	a4,12(a5)
}
40001b5c:	00000013          	nop
40001b60:	01c12403          	lw	s0,28(sp)
40001b64:	02010113          	addi	sp,sp,32
40001b68:	00008067          	ret

40001b6c <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001b6c:	fe010113          	addi	sp,sp,-32
40001b70:	00812e23          	sw	s0,28(sp)
40001b74:	02010413          	addi	s0,sp,32
40001b78:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001b7c:	fec42783          	lw	a5,-20(s0)
40001b80:	0007a783          	lw	a5,0(a5)
40001b84:	0027f793          	andi	a5,a5,2
40001b88:	00f037b3          	snez	a5,a5
40001b8c:	0ff7f793          	zext.b	a5,a5
}
40001b90:	00078513          	mv	a0,a5
40001b94:	01c12403          	lw	s0,28(sp)
40001b98:	02010113          	addi	sp,sp,32
40001b9c:	00008067          	ret

40001ba0 <vga_run>:
static void vga_run(Vga_Reg *reg){
40001ba0:	fe010113          	addi	sp,sp,-32
40001ba4:	00812e23          	sw	s0,28(sp)
40001ba8:	02010413          	addi	s0,sp,32
40001bac:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40001bb0:	fec42783          	lw	a5,-20(s0)
40001bb4:	00100713          	li	a4,1
40001bb8:	00e7a023          	sw	a4,0(a5)
}
40001bbc:	00000013          	nop
40001bc0:	01c12403          	lw	s0,28(sp)
40001bc4:	02010113          	addi	sp,sp,32
40001bc8:	00008067          	ret

40001bcc <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40001bcc:	fe010113          	addi	sp,sp,-32
40001bd0:	00112e23          	sw	ra,28(sp)
40001bd4:	00812c23          	sw	s0,24(sp)
40001bd8:	02010413          	addi	s0,sp,32
40001bdc:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40001be0:	fec42783          	lw	a5,-20(s0)
40001be4:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001be8:	00000013          	nop
40001bec:	fec42503          	lw	a0,-20(s0)
40001bf0:	f7dff0ef          	jal	ra,40001b6c <vga_isBusy>
40001bf4:	00050793          	mv	a5,a0
40001bf8:	fe079ae3          	bnez	a5,40001bec <vga_stop+0x20>
}
40001bfc:	00000013          	nop
40001c00:	00000013          	nop
40001c04:	01c12083          	lw	ra,28(sp)
40001c08:	01812403          	lw	s0,24(sp)
40001c0c:	02010113          	addi	sp,sp,32
40001c10:	00008067          	ret

40001c14 <dm_present_write>:
#include "briey.h"
void dm_present_write(uint32_t iData, uint32_t iAddress)
{
40001c14:	fe010113          	addi	sp,sp,-32
40001c18:	00812e23          	sw	s0,28(sp)
40001c1c:	02010413          	addi	s0,sp,32
40001c20:	fea42623          	sw	a0,-20(s0)
40001c24:	feb42423          	sw	a1,-24(s0)
	DMPRESENT_BASE->ADDRESS			= iAddress;
40001c28:	f00037b7          	lui	a5,0xf0003
40001c2c:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001c30:	fe842703          	lw	a4,-24(s0)
40001c34:	00e7a623          	sw	a4,12(a5)
	DMPRESENT_BASE->WRITE_N 		= 0;
40001c38:	f00037b7          	lui	a5,0xf0003
40001c3c:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001c40:	0007a223          	sw	zero,4(a5)
	DMPRESENT_BASE->READ_N 			= 1;
40001c44:	f00037b7          	lui	a5,0xf0003
40001c48:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001c4c:	00100713          	li	a4,1
40001c50:	00e7a423          	sw	a4,8(a5)
	DMPRESENT_BASE->IDATA			= iData;
40001c54:	f00037b7          	lui	a5,0xf0003
40001c58:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001c5c:	fec42703          	lw	a4,-20(s0)
40001c60:	00e7a823          	sw	a4,16(a5)
	DMPRESENT_BASE->CHIP_SELECT_N	= 0;
40001c64:	f00037b7          	lui	a5,0xf0003
40001c68:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001c6c:	0007a023          	sw	zero,0(a5)
	DMPRESENT_BASE->CHIP_SELECT_N	= 1;
40001c70:	f00037b7          	lui	a5,0xf0003
40001c74:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001c78:	00100713          	li	a4,1
40001c7c:	00e7a023          	sw	a4,0(a5)
}
40001c80:	00000013          	nop
40001c84:	01c12403          	lw	s0,28(sp)
40001c88:	02010113          	addi	sp,sp,32
40001c8c:	00008067          	ret

40001c90 <dm_present_read>:
uint32_t dm_present_read(uint32_t iAddress)
{
40001c90:	fd010113          	addi	sp,sp,-48
40001c94:	02812623          	sw	s0,44(sp)
40001c98:	03010413          	addi	s0,sp,48
40001c9c:	fca42e23          	sw	a0,-36(s0)
	DMPRESENT_BASE->ADDRESS			= iAddress;
40001ca0:	f00037b7          	lui	a5,0xf0003
40001ca4:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001ca8:	fdc42703          	lw	a4,-36(s0)
40001cac:	00e7a623          	sw	a4,12(a5)
	DMPRESENT_BASE->READ_N			= 0;
40001cb0:	f00037b7          	lui	a5,0xf0003
40001cb4:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001cb8:	0007a423          	sw	zero,8(a5)
	DMPRESENT_BASE->WRITE_N			= 1;
40001cbc:	f00037b7          	lui	a5,0xf0003
40001cc0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001cc4:	00100713          	li	a4,1
40001cc8:	00e7a223          	sw	a4,4(a5)
	DMPRESENT_BASE->CHIP_SELECT_N	= 0;
40001ccc:	f00037b7          	lui	a5,0xf0003
40001cd0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001cd4:	0007a023          	sw	zero,0(a5)
	uint32_t res 					= DMPRESENT_BASE->ODATA;
40001cd8:	f00037b7          	lui	a5,0xf0003
40001cdc:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001ce0:	0147a783          	lw	a5,20(a5)
40001ce4:	fef42623          	sw	a5,-20(s0)
	DMPRESENT_BASE->CHIP_SELECT_N	= 1;
40001ce8:	f00037b7          	lui	a5,0xf0003
40001cec:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001cf0:	00100713          	li	a4,1
40001cf4:	00e7a023          	sw	a4,0(a5)
	return res;
40001cf8:	fec42783          	lw	a5,-20(s0)
}
40001cfc:	00078513          	mv	a0,a5
40001d00:	02c12403          	lw	s0,44(sp)
40001d04:	03010113          	addi	sp,sp,48
40001d08:	00008067          	ret

40001d0c <dm_present_hash>:
void dm_present_hash(uint32_t *key, uint32_t *block, uint32_t *res) {
40001d0c:	fe010113          	addi	sp,sp,-32
40001d10:	00112e23          	sw	ra,28(sp)
40001d14:	00812c23          	sw	s0,24(sp)
40001d18:	00912a23          	sw	s1,20(sp)
40001d1c:	02010413          	addi	s0,sp,32
40001d20:	fea42623          	sw	a0,-20(s0)
40001d24:	feb42423          	sw	a1,-24(s0)
40001d28:	fec42223          	sw	a2,-28(s0)

	//PLAIN_TEXT
	dm_present_write(block[1],DMPRESENT_ADDR_BLOCK_BASE +1);
40001d2c:	fe842783          	lw	a5,-24(s0)
40001d30:	00478793          	addi	a5,a5,4
40001d34:	0007a783          	lw	a5,0(a5)
40001d38:	00500593          	li	a1,5
40001d3c:	00078513          	mv	a0,a5
40001d40:	ed5ff0ef          	jal	ra,40001c14 <dm_present_write>
	dm_present_write(block[0],DMPRESENT_ADDR_BLOCK_BASE);
40001d44:	fe842783          	lw	a5,-24(s0)
40001d48:	0007a783          	lw	a5,0(a5)
40001d4c:	00400593          	li	a1,4
40001d50:	00078513          	mv	a0,a5
40001d54:	ec1ff0ef          	jal	ra,40001c14 <dm_present_write>

	//KEY
	dm_present_write(key[2],DMPRESENT_ADDR_KEY_BASE +2);
40001d58:	fec42783          	lw	a5,-20(s0)
40001d5c:	00878793          	addi	a5,a5,8
40001d60:	0007a783          	lw	a5,0(a5)
40001d64:	00300593          	li	a1,3
40001d68:	00078513          	mv	a0,a5
40001d6c:	ea9ff0ef          	jal	ra,40001c14 <dm_present_write>
	dm_present_write(key[1],DMPRESENT_ADDR_KEY_BASE +1);
40001d70:	fec42783          	lw	a5,-20(s0)
40001d74:	00478793          	addi	a5,a5,4
40001d78:	0007a783          	lw	a5,0(a5)
40001d7c:	00200593          	li	a1,2
40001d80:	00078513          	mv	a0,a5
40001d84:	e91ff0ef          	jal	ra,40001c14 <dm_present_write>
	dm_present_write(key[0],DMPRESENT_ADDR_KEY_BASE);
40001d88:	fec42783          	lw	a5,-20(s0)
40001d8c:	0007a783          	lw	a5,0(a5)
40001d90:	00100593          	li	a1,1
40001d94:	00078513          	mv	a0,a5
40001d98:	e7dff0ef          	jal	ra,40001c14 <dm_present_write>

	//START
	dm_present_write(0x1,DMPRESENT_ADDR_START);
40001d9c:	00000593          	li	a1,0
40001da0:	00100513          	li	a0,1
40001da4:	e71ff0ef          	jal	ra,40001c14 <dm_present_write>
    while(dm_present_read(DMPRESENT_ADDR_RESULT_BASE) == 0);
40001da8:	00000013          	nop
40001dac:	00600513          	li	a0,6
40001db0:	ee1ff0ef          	jal	ra,40001c90 <dm_present_read>
40001db4:	00050793          	mv	a5,a0
40001db8:	fe078ae3          	beqz	a5,40001dac <dm_present_hash+0xa0>

    res[1] = dm_present_read(DMPRESENT_ADDR_RESULT_BASE +1);
40001dbc:	fe442783          	lw	a5,-28(s0)
40001dc0:	00478493          	addi	s1,a5,4
40001dc4:	00700513          	li	a0,7
40001dc8:	ec9ff0ef          	jal	ra,40001c90 <dm_present_read>
40001dcc:	00050793          	mv	a5,a0
40001dd0:	00f4a023          	sw	a5,0(s1)
    res[0] = dm_present_read(DMPRESENT_ADDR_RESULT_BASE);
40001dd4:	00600513          	li	a0,6
40001dd8:	eb9ff0ef          	jal	ra,40001c90 <dm_present_read>
40001ddc:	00050713          	mv	a4,a0
40001de0:	fe442783          	lw	a5,-28(s0)
40001de4:	00e7a023          	sw	a4,0(a5)


    //print result to terminal
	print("\r\t===========================DM_PRESENT HASH==================================\r\n");
40001de8:	400047b7          	lui	a5,0x40004
40001dec:	a9878513          	addi	a0,a5,-1384 # 40003a98 <vga_simRes_h160_v120+0x20>
40001df0:	294000ef          	jal	ra,40002084 <print>
	print("\r\n");
40001df4:	400047b7          	lui	a5,0x40004
40001df8:	aec78513          	addi	a0,a5,-1300 # 40003aec <vga_simRes_h160_v120+0x74>
40001dfc:	288000ef          	jal	ra,40002084 <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
40001e00:	fe842583          	lw	a1,-24(s0)
40001e04:	400047b7          	lui	a5,0x40004
40001e08:	af078513          	addi	a0,a5,-1296 # 40003af0 <vga_simRes_h160_v120+0x78>
40001e0c:	4e0000ef          	jal	ra,400022ec <print64bit>
	print80bit("KEY (80-bit) : ", key);
40001e10:	fec42583          	lw	a1,-20(s0)
40001e14:	400047b7          	lui	a5,0x40004
40001e18:	b0c78513          	addi	a0,a5,-1268 # 40003b0c <vga_simRes_h160_v120+0x94>
40001e1c:	5d8000ef          	jal	ra,400023f4 <print80bit>
	print64bit("RESULT (64-bit) : ", res);
40001e20:	fe442583          	lw	a1,-28(s0)
40001e24:	400047b7          	lui	a5,0x40004
40001e28:	b1c78513          	addi	a0,a5,-1252 # 40003b1c <vga_simRes_h160_v120+0xa4>
40001e2c:	4c0000ef          	jal	ra,400022ec <print64bit>
	//print("\r\n============================================================================\r\n");
}
40001e30:	00000013          	nop
40001e34:	01c12083          	lw	ra,28(sp)
40001e38:	01812403          	lw	s0,24(sp)
40001e3c:	01412483          	lw	s1,20(sp)
40001e40:	02010113          	addi	sp,sp,32
40001e44:	00008067          	ret

40001e48 <timer_init>:
static void timer_init(Timer_Reg *reg){
40001e48:	fe010113          	addi	sp,sp,-32
40001e4c:	00812e23          	sw	s0,28(sp)
40001e50:	02010413          	addi	s0,sp,32
40001e54:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40001e58:	fec42783          	lw	a5,-20(s0)
40001e5c:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40001e60:	fec42783          	lw	a5,-20(s0)
40001e64:	0007a423          	sw	zero,8(a5)
}
40001e68:	00000013          	nop
40001e6c:	01c12403          	lw	s0,28(sp)
40001e70:	02010113          	addi	sp,sp,32
40001e74:	00008067          	ret

40001e78 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001e78:	fe010113          	addi	sp,sp,-32
40001e7c:	00812e23          	sw	s0,28(sp)
40001e80:	02010413          	addi	s0,sp,32
40001e84:	fea42623          	sw	a0,-20(s0)
}
40001e88:	00000013          	nop
40001e8c:	01c12403          	lw	s0,28(sp)
40001e90:	02010113          	addi	sp,sp,32
40001e94:	00008067          	ret

40001e98 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001e98:	fe010113          	addi	sp,sp,-32
40001e9c:	00812e23          	sw	s0,28(sp)
40001ea0:	02010413          	addi	s0,sp,32
40001ea4:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001ea8:	fec42783          	lw	a5,-20(s0)
40001eac:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001eb0:	fec42783          	lw	a5,-20(s0)
40001eb4:	fff00713          	li	a4,-1
40001eb8:	00e7a023          	sw	a4,0(a5)
}
40001ebc:	00000013          	nop
40001ec0:	01c12403          	lw	s0,28(sp)
40001ec4:	02010113          	addi	sp,sp,32
40001ec8:	00008067          	ret

40001ecc <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40001ecc:	fe010113          	addi	sp,sp,-32
40001ed0:	00812e23          	sw	s0,28(sp)
40001ed4:	02010413          	addi	s0,sp,32
40001ed8:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40001edc:	fec42783          	lw	a5,-20(s0)
40001ee0:	0047a783          	lw	a5,4(a5)
40001ee4:	0107d793          	srli	a5,a5,0x10
40001ee8:	0ff7f793          	zext.b	a5,a5
}
40001eec:	00078513          	mv	a0,a5
40001ef0:	01c12403          	lw	s0,28(sp)
40001ef4:	02010113          	addi	sp,sp,32
40001ef8:	00008067          	ret

40001efc <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40001efc:	fe010113          	addi	sp,sp,-32
40001f00:	00812e23          	sw	s0,28(sp)
40001f04:	02010413          	addi	s0,sp,32
40001f08:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40001f0c:	fec42783          	lw	a5,-20(s0)
40001f10:	0047a783          	lw	a5,4(a5)
40001f14:	0187d793          	srli	a5,a5,0x18
}
40001f18:	00078513          	mv	a0,a5
40001f1c:	01c12403          	lw	s0,28(sp)
40001f20:	02010113          	addi	sp,sp,32
40001f24:	00008067          	ret

40001f28 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40001f28:	fe010113          	addi	sp,sp,-32
40001f2c:	00112e23          	sw	ra,28(sp)
40001f30:	00812c23          	sw	s0,24(sp)
40001f34:	02010413          	addi	s0,sp,32
40001f38:	fea42623          	sw	a0,-20(s0)
40001f3c:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40001f40:	00000013          	nop
40001f44:	fec42503          	lw	a0,-20(s0)
40001f48:	f85ff0ef          	jal	ra,40001ecc <uart_writeAvailability>
40001f4c:	00050793          	mv	a5,a0
40001f50:	fe078ae3          	beqz	a5,40001f44 <uart_write+0x1c>
	reg->DATA = data;
40001f54:	fec42783          	lw	a5,-20(s0)
40001f58:	fe842703          	lw	a4,-24(s0)
40001f5c:	00e7a023          	sw	a4,0(a5)
}
40001f60:	00000013          	nop
40001f64:	01c12083          	lw	ra,28(sp)
40001f68:	01812403          	lw	s0,24(sp)
40001f6c:	02010113          	addi	sp,sp,32
40001f70:	00008067          	ret

40001f74 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001f74:	fe010113          	addi	sp,sp,-32
40001f78:	00812e23          	sw	s0,28(sp)
40001f7c:	02010413          	addi	s0,sp,32
40001f80:	fea42623          	sw	a0,-20(s0)
40001f84:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001f88:	fe842783          	lw	a5,-24(s0)
40001f8c:	00c7a703          	lw	a4,12(a5)
40001f90:	fec42783          	lw	a5,-20(s0)
40001f94:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001f98:	fe842783          	lw	a5,-24(s0)
40001f9c:	0007a783          	lw	a5,0(a5)
40001fa0:	fff78713          	addi	a4,a5,-1
40001fa4:	fe842783          	lw	a5,-24(s0)
40001fa8:	0047a783          	lw	a5,4(a5)
40001fac:	00879793          	slli	a5,a5,0x8
40001fb0:	00f76733          	or	a4,a4,a5
40001fb4:	fe842783          	lw	a5,-24(s0)
40001fb8:	0087a783          	lw	a5,8(a5)
40001fbc:	01079793          	slli	a5,a5,0x10
40001fc0:	00f76733          	or	a4,a4,a5
40001fc4:	fec42783          	lw	a5,-20(s0)
40001fc8:	00e7a623          	sw	a4,12(a5)
}
40001fcc:	00000013          	nop
40001fd0:	01c12403          	lw	s0,28(sp)
40001fd4:	02010113          	addi	sp,sp,32
40001fd8:	00008067          	ret

40001fdc <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001fdc:	fe010113          	addi	sp,sp,-32
40001fe0:	00812e23          	sw	s0,28(sp)
40001fe4:	02010413          	addi	s0,sp,32
40001fe8:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001fec:	fec42783          	lw	a5,-20(s0)
40001ff0:	0007a783          	lw	a5,0(a5)
40001ff4:	0027f793          	andi	a5,a5,2
40001ff8:	00f037b3          	snez	a5,a5
40001ffc:	0ff7f793          	zext.b	a5,a5
}
40002000:	00078513          	mv	a0,a5
40002004:	01c12403          	lw	s0,28(sp)
40002008:	02010113          	addi	sp,sp,32
4000200c:	00008067          	ret

40002010 <vga_run>:
static void vga_run(Vga_Reg *reg){
40002010:	fe010113          	addi	sp,sp,-32
40002014:	00812e23          	sw	s0,28(sp)
40002018:	02010413          	addi	s0,sp,32
4000201c:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40002020:	fec42783          	lw	a5,-20(s0)
40002024:	00100713          	li	a4,1
40002028:	00e7a023          	sw	a4,0(a5)
}
4000202c:	00000013          	nop
40002030:	01c12403          	lw	s0,28(sp)
40002034:	02010113          	addi	sp,sp,32
40002038:	00008067          	ret

4000203c <vga_stop>:
static void vga_stop(Vga_Reg *reg){
4000203c:	fe010113          	addi	sp,sp,-32
40002040:	00112e23          	sw	ra,28(sp)
40002044:	00812c23          	sw	s0,24(sp)
40002048:	02010413          	addi	s0,sp,32
4000204c:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40002050:	fec42783          	lw	a5,-20(s0)
40002054:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40002058:	00000013          	nop
4000205c:	fec42503          	lw	a0,-20(s0)
40002060:	f7dff0ef          	jal	ra,40001fdc <vga_isBusy>
40002064:	00050793          	mv	a5,a0
40002068:	fe079ae3          	bnez	a5,4000205c <vga_stop+0x20>
}
4000206c:	00000013          	nop
40002070:	00000013          	nop
40002074:	01c12083          	lw	ra,28(sp)
40002078:	01812403          	lw	s0,24(sp)
4000207c:	02010113          	addi	sp,sp,32
40002080:	00008067          	ret

40002084 <print>:
#include <briey.h>

void print(char *str){
40002084:	fe010113          	addi	sp,sp,-32
40002088:	00112e23          	sw	ra,28(sp)
4000208c:	00812c23          	sw	s0,24(sp)
40002090:	02010413          	addi	s0,sp,32
40002094:	fea42623          	sw	a0,-20(s0)
	while(*str){
40002098:	0200006f          	j	400020b8 <print+0x34>
		uart_write(UART,*(str++));
4000209c:	fec42783          	lw	a5,-20(s0)
400020a0:	00178713          	addi	a4,a5,1
400020a4:	fee42623          	sw	a4,-20(s0)
400020a8:	0007c783          	lbu	a5,0(a5)
400020ac:	00078593          	mv	a1,a5
400020b0:	f0010537          	lui	a0,0xf0010
400020b4:	e75ff0ef          	jal	ra,40001f28 <uart_write>
	while(*str){
400020b8:	fec42783          	lw	a5,-20(s0)
400020bc:	0007c783          	lbu	a5,0(a5)
400020c0:	fc079ee3          	bnez	a5,4000209c <print+0x18>
	}
}
400020c4:	00000013          	nop
400020c8:	00000013          	nop
400020cc:	01c12083          	lw	ra,28(sp)
400020d0:	01812403          	lw	s0,24(sp)
400020d4:	02010113          	addi	sp,sp,32
400020d8:	00008067          	ret

400020dc <print16bit>:

void print16bit(uint32_t n)
{
400020dc:	fc010113          	addi	sp,sp,-64
400020e0:	02112e23          	sw	ra,60(sp)
400020e4:	02812c23          	sw	s0,56(sp)
400020e8:	04010413          	addi	s0,sp,64
400020ec:	fca42623          	sw	a0,-52(s0)

    int i = 0;
400020f0:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
400020f4:	fc042e23          	sw	zero,-36(s0)
400020f8:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
400020fc:	fcc42783          	lw	a5,-52(s0)
40002100:	00f7f793          	andi	a5,a5,15
40002104:	40004737          	lui	a4,0x40004
40002108:	b9470713          	addi	a4,a4,-1132 # 40003b94 <vga_simRes_h160_v120+0x24>
4000210c:	00f707b3          	add	a5,a4,a5
40002110:	0007c703          	lbu	a4,0(a5)
40002114:	fec42783          	lw	a5,-20(s0)
40002118:	ff040693          	addi	a3,s0,-16
4000211c:	00f687b3          	add	a5,a3,a5
40002120:	fee78623          	sb	a4,-20(a5)
        i++;
40002124:	fec42783          	lw	a5,-20(s0)
40002128:	00178793          	addi	a5,a5,1
4000212c:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40002130:	fcc42783          	lw	a5,-52(s0)
40002134:	0047d793          	srli	a5,a5,0x4
40002138:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
4000213c:	fcc42783          	lw	a5,-52(s0)
40002140:	fa079ee3          	bnez	a5,400020fc <print16bit+0x20>
    if(i<8) {
40002144:	fec42703          	lw	a4,-20(s0)
40002148:	00700793          	li	a5,7
4000214c:	02e7ce63          	blt	a5,a4,40002188 <print16bit+0xac>
    	for(int j=7;j>=i;j--){
40002150:	00700793          	li	a5,7
40002154:	fef42423          	sw	a5,-24(s0)
40002158:	0240006f          	j	4000217c <print16bit+0xa0>
    		outbuf_inv[j]="0"[0];
4000215c:	03000713          	li	a4,48
40002160:	fe842783          	lw	a5,-24(s0)
40002164:	ff040693          	addi	a3,s0,-16
40002168:	00f687b3          	add	a5,a3,a5
4000216c:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40002170:	fe842783          	lw	a5,-24(s0)
40002174:	fff78793          	addi	a5,a5,-1
40002178:	fef42423          	sw	a5,-24(s0)
4000217c:	fe842703          	lw	a4,-24(s0)
40002180:	fec42783          	lw	a5,-20(s0)
40002184:	fcf75ce3          	bge	a4,a5,4000215c <print16bit+0x80>
    	}
    }
    for(int j=3;j>=0;j--)
40002188:	00300793          	li	a5,3
4000218c:	fef42223          	sw	a5,-28(s0)
40002190:	02c0006f          	j	400021bc <print16bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40002194:	fe442783          	lw	a5,-28(s0)
40002198:	ff040713          	addi	a4,s0,-16
4000219c:	00f707b3          	add	a5,a4,a5
400021a0:	fec7c783          	lbu	a5,-20(a5)
400021a4:	00078593          	mv	a1,a5
400021a8:	f0010537          	lui	a0,0xf0010
400021ac:	d7dff0ef          	jal	ra,40001f28 <uart_write>
    for(int j=3;j>=0;j--)
400021b0:	fe442783          	lw	a5,-28(s0)
400021b4:	fff78793          	addi	a5,a5,-1
400021b8:	fef42223          	sw	a5,-28(s0)
400021bc:	fe442783          	lw	a5,-28(s0)
400021c0:	fc07dae3          	bgez	a5,40002194 <print16bit+0xb8>
    }
    print(" ");
400021c4:	400047b7          	lui	a5,0x40004
400021c8:	b9078513          	addi	a0,a5,-1136 # 40003b90 <vga_simRes_h160_v120+0x20>
400021cc:	eb9ff0ef          	jal	ra,40002084 <print>
}
400021d0:	00000013          	nop
400021d4:	03c12083          	lw	ra,60(sp)
400021d8:	03812403          	lw	s0,56(sp)
400021dc:	04010113          	addi	sp,sp,64
400021e0:	00008067          	ret

400021e4 <print32bit>:
void print32bit(uint32_t n)
{
400021e4:	fc010113          	addi	sp,sp,-64
400021e8:	02112e23          	sw	ra,60(sp)
400021ec:	02812c23          	sw	s0,56(sp)
400021f0:	04010413          	addi	s0,sp,64
400021f4:	fca42623          	sw	a0,-52(s0)

    int i = 0;
400021f8:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
400021fc:	fc042e23          	sw	zero,-36(s0)
40002200:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40002204:	fcc42783          	lw	a5,-52(s0)
40002208:	00f7f793          	andi	a5,a5,15
4000220c:	40004737          	lui	a4,0x40004
40002210:	b9470713          	addi	a4,a4,-1132 # 40003b94 <vga_simRes_h160_v120+0x24>
40002214:	00f707b3          	add	a5,a4,a5
40002218:	0007c703          	lbu	a4,0(a5)
4000221c:	fec42783          	lw	a5,-20(s0)
40002220:	ff040693          	addi	a3,s0,-16
40002224:	00f687b3          	add	a5,a3,a5
40002228:	fee78623          	sb	a4,-20(a5)
        i++;
4000222c:	fec42783          	lw	a5,-20(s0)
40002230:	00178793          	addi	a5,a5,1
40002234:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40002238:	fcc42783          	lw	a5,-52(s0)
4000223c:	0047d793          	srli	a5,a5,0x4
40002240:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40002244:	fcc42783          	lw	a5,-52(s0)
40002248:	fa079ee3          	bnez	a5,40002204 <print32bit+0x20>
    if(i<8) {
4000224c:	fec42703          	lw	a4,-20(s0)
40002250:	00700793          	li	a5,7
40002254:	02e7ce63          	blt	a5,a4,40002290 <print32bit+0xac>
    	for(int j=7;j>=i;j--){
40002258:	00700793          	li	a5,7
4000225c:	fef42423          	sw	a5,-24(s0)
40002260:	0240006f          	j	40002284 <print32bit+0xa0>
    		outbuf_inv[j]="0"[0];
40002264:	03000713          	li	a4,48
40002268:	fe842783          	lw	a5,-24(s0)
4000226c:	ff040693          	addi	a3,s0,-16
40002270:	00f687b3          	add	a5,a3,a5
40002274:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40002278:	fe842783          	lw	a5,-24(s0)
4000227c:	fff78793          	addi	a5,a5,-1
40002280:	fef42423          	sw	a5,-24(s0)
40002284:	fe842703          	lw	a4,-24(s0)
40002288:	fec42783          	lw	a5,-20(s0)
4000228c:	fcf75ce3          	bge	a4,a5,40002264 <print32bit+0x80>
    	}
    }
    for(int j=7;j>=0;j--)
40002290:	00700793          	li	a5,7
40002294:	fef42223          	sw	a5,-28(s0)
40002298:	02c0006f          	j	400022c4 <print32bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
4000229c:	fe442783          	lw	a5,-28(s0)
400022a0:	ff040713          	addi	a4,s0,-16
400022a4:	00f707b3          	add	a5,a4,a5
400022a8:	fec7c783          	lbu	a5,-20(a5)
400022ac:	00078593          	mv	a1,a5
400022b0:	f0010537          	lui	a0,0xf0010
400022b4:	c75ff0ef          	jal	ra,40001f28 <uart_write>
    for(int j=7;j>=0;j--)
400022b8:	fe442783          	lw	a5,-28(s0)
400022bc:	fff78793          	addi	a5,a5,-1
400022c0:	fef42223          	sw	a5,-28(s0)
400022c4:	fe442783          	lw	a5,-28(s0)
400022c8:	fc07dae3          	bgez	a5,4000229c <print32bit+0xb8>
    }
    print(" ");
400022cc:	400047b7          	lui	a5,0x40004
400022d0:	b9078513          	addi	a0,a5,-1136 # 40003b90 <vga_simRes_h160_v120+0x20>
400022d4:	db1ff0ef          	jal	ra,40002084 <print>
}
400022d8:	00000013          	nop
400022dc:	03c12083          	lw	ra,60(sp)
400022e0:	03812403          	lw	s0,56(sp)
400022e4:	04010113          	addi	sp,sp,64
400022e8:	00008067          	ret

400022ec <print64bit>:

void print64bit(char *message,uint32_t *num)
{
400022ec:	fe010113          	addi	sp,sp,-32
400022f0:	00112e23          	sw	ra,28(sp)
400022f4:	00812c23          	sw	s0,24(sp)
400022f8:	02010413          	addi	s0,sp,32
400022fc:	fea42623          	sw	a0,-20(s0)
40002300:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002304:	400047b7          	lui	a5,0x40004
40002308:	ba878513          	addi	a0,a5,-1112 # 40003ba8 <vga_simRes_h160_v120+0x38>
4000230c:	d79ff0ef          	jal	ra,40002084 <print>
	print(message);
40002310:	fec42503          	lw	a0,-20(s0)
40002314:	d71ff0ef          	jal	ra,40002084 <print>
	print32bit(num[1]);
40002318:	fe842783          	lw	a5,-24(s0)
4000231c:	00478793          	addi	a5,a5,4
40002320:	0007a783          	lw	a5,0(a5)
40002324:	00078513          	mv	a0,a5
40002328:	ebdff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[0]);
4000232c:	fe842783          	lw	a5,-24(s0)
40002330:	0007a783          	lw	a5,0(a5)
40002334:	00078513          	mv	a0,a5
40002338:	eadff0ef          	jal	ra,400021e4 <print32bit>
	print("\r\n");
4000233c:	400047b7          	lui	a5,0x40004
40002340:	bac78513          	addi	a0,a5,-1108 # 40003bac <vga_simRes_h160_v120+0x3c>
40002344:	d41ff0ef          	jal	ra,40002084 <print>
}
40002348:	00000013          	nop
4000234c:	01c12083          	lw	ra,28(sp)
40002350:	01812403          	lw	s0,24(sp)
40002354:	02010113          	addi	sp,sp,32
40002358:	00008067          	ret

4000235c <print128bit>:
void print128bit(char *message, uint32_t *num)
{
4000235c:	fe010113          	addi	sp,sp,-32
40002360:	00112e23          	sw	ra,28(sp)
40002364:	00812c23          	sw	s0,24(sp)
40002368:	02010413          	addi	s0,sp,32
4000236c:	fea42623          	sw	a0,-20(s0)
40002370:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002374:	400047b7          	lui	a5,0x40004
40002378:	ba878513          	addi	a0,a5,-1112 # 40003ba8 <vga_simRes_h160_v120+0x38>
4000237c:	d09ff0ef          	jal	ra,40002084 <print>
	print(message);
40002380:	fec42503          	lw	a0,-20(s0)
40002384:	d01ff0ef          	jal	ra,40002084 <print>
	print32bit(num[3]);
40002388:	fe842783          	lw	a5,-24(s0)
4000238c:	00c78793          	addi	a5,a5,12
40002390:	0007a783          	lw	a5,0(a5)
40002394:	00078513          	mv	a0,a5
40002398:	e4dff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[2]);
4000239c:	fe842783          	lw	a5,-24(s0)
400023a0:	00878793          	addi	a5,a5,8
400023a4:	0007a783          	lw	a5,0(a5)
400023a8:	00078513          	mv	a0,a5
400023ac:	e39ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[1]);
400023b0:	fe842783          	lw	a5,-24(s0)
400023b4:	00478793          	addi	a5,a5,4
400023b8:	0007a783          	lw	a5,0(a5)
400023bc:	00078513          	mv	a0,a5
400023c0:	e25ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[0]);
400023c4:	fe842783          	lw	a5,-24(s0)
400023c8:	0007a783          	lw	a5,0(a5)
400023cc:	00078513          	mv	a0,a5
400023d0:	e15ff0ef          	jal	ra,400021e4 <print32bit>
	print("\r\n");
400023d4:	400047b7          	lui	a5,0x40004
400023d8:	bac78513          	addi	a0,a5,-1108 # 40003bac <vga_simRes_h160_v120+0x3c>
400023dc:	ca9ff0ef          	jal	ra,40002084 <print>
}
400023e0:	00000013          	nop
400023e4:	01c12083          	lw	ra,28(sp)
400023e8:	01812403          	lw	s0,24(sp)
400023ec:	02010113          	addi	sp,sp,32
400023f0:	00008067          	ret

400023f4 <print80bit>:
void print80bit(char *message,uint32_t *num)
{
400023f4:	fe010113          	addi	sp,sp,-32
400023f8:	00112e23          	sw	ra,28(sp)
400023fc:	00812c23          	sw	s0,24(sp)
40002400:	02010413          	addi	s0,sp,32
40002404:	fea42623          	sw	a0,-20(s0)
40002408:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
4000240c:	400047b7          	lui	a5,0x40004
40002410:	ba878513          	addi	a0,a5,-1112 # 40003ba8 <vga_simRes_h160_v120+0x38>
40002414:	c71ff0ef          	jal	ra,40002084 <print>
	print(message);
40002418:	fec42503          	lw	a0,-20(s0)
4000241c:	c69ff0ef          	jal	ra,40002084 <print>
	print32bit(num[2]);
40002420:	fe842783          	lw	a5,-24(s0)
40002424:	00878793          	addi	a5,a5,8
40002428:	0007a783          	lw	a5,0(a5)
4000242c:	00078513          	mv	a0,a5
40002430:	db5ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[1]);
40002434:	fe842783          	lw	a5,-24(s0)
40002438:	00478793          	addi	a5,a5,4
4000243c:	0007a783          	lw	a5,0(a5)
40002440:	00078513          	mv	a0,a5
40002444:	da1ff0ef          	jal	ra,400021e4 <print32bit>
	print16bit(num[0]);
40002448:	fe842783          	lw	a5,-24(s0)
4000244c:	0007a783          	lw	a5,0(a5)
40002450:	00078513          	mv	a0,a5
40002454:	c89ff0ef          	jal	ra,400020dc <print16bit>
	print("\r\n");
40002458:	400047b7          	lui	a5,0x40004
4000245c:	bac78513          	addi	a0,a5,-1108 # 40003bac <vga_simRes_h160_v120+0x3c>
40002460:	c25ff0ef          	jal	ra,40002084 <print>
}
40002464:	00000013          	nop
40002468:	01c12083          	lw	ra,28(sp)
4000246c:	01812403          	lw	s0,24(sp)
40002470:	02010113          	addi	sp,sp,32
40002474:	00008067          	ret

40002478 <print256bit>:
void print256bit(char *message, uint32_t *num)
{
40002478:	fe010113          	addi	sp,sp,-32
4000247c:	00112e23          	sw	ra,28(sp)
40002480:	00812c23          	sw	s0,24(sp)
40002484:	02010413          	addi	s0,sp,32
40002488:	fea42623          	sw	a0,-20(s0)
4000248c:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002490:	400047b7          	lui	a5,0x40004
40002494:	ba878513          	addi	a0,a5,-1112 # 40003ba8 <vga_simRes_h160_v120+0x38>
40002498:	bedff0ef          	jal	ra,40002084 <print>
	print(message);
4000249c:	fec42503          	lw	a0,-20(s0)
400024a0:	be5ff0ef          	jal	ra,40002084 <print>
	print32bit(num[7]);
400024a4:	fe842783          	lw	a5,-24(s0)
400024a8:	01c78793          	addi	a5,a5,28
400024ac:	0007a783          	lw	a5,0(a5)
400024b0:	00078513          	mv	a0,a5
400024b4:	d31ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[6]);
400024b8:	fe842783          	lw	a5,-24(s0)
400024bc:	01878793          	addi	a5,a5,24
400024c0:	0007a783          	lw	a5,0(a5)
400024c4:	00078513          	mv	a0,a5
400024c8:	d1dff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[5]);
400024cc:	fe842783          	lw	a5,-24(s0)
400024d0:	01478793          	addi	a5,a5,20
400024d4:	0007a783          	lw	a5,0(a5)
400024d8:	00078513          	mv	a0,a5
400024dc:	d09ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[4]);
400024e0:	fe842783          	lw	a5,-24(s0)
400024e4:	01078793          	addi	a5,a5,16
400024e8:	0007a783          	lw	a5,0(a5)
400024ec:	00078513          	mv	a0,a5
400024f0:	cf5ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[3]);
400024f4:	fe842783          	lw	a5,-24(s0)
400024f8:	00c78793          	addi	a5,a5,12
400024fc:	0007a783          	lw	a5,0(a5)
40002500:	00078513          	mv	a0,a5
40002504:	ce1ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[2]);
40002508:	fe842783          	lw	a5,-24(s0)
4000250c:	00878793          	addi	a5,a5,8
40002510:	0007a783          	lw	a5,0(a5)
40002514:	00078513          	mv	a0,a5
40002518:	ccdff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[1]);
4000251c:	fe842783          	lw	a5,-24(s0)
40002520:	00478793          	addi	a5,a5,4
40002524:	0007a783          	lw	a5,0(a5)
40002528:	00078513          	mv	a0,a5
4000252c:	cb9ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[0]);
40002530:	fe842783          	lw	a5,-24(s0)
40002534:	0007a783          	lw	a5,0(a5)
40002538:	00078513          	mv	a0,a5
4000253c:	ca9ff0ef          	jal	ra,400021e4 <print32bit>
	print("\r\n");
40002540:	400047b7          	lui	a5,0x40004
40002544:	bac78513          	addi	a0,a5,-1108 # 40003bac <vga_simRes_h160_v120+0x3c>
40002548:	b3dff0ef          	jal	ra,40002084 <print>
}
4000254c:	00000013          	nop
40002550:	01c12083          	lw	ra,28(sp)
40002554:	01812403          	lw	s0,24(sp)
40002558:	02010113          	addi	sp,sp,32
4000255c:	00008067          	ret

40002560 <print512bit>:
void print512bit (char *message, uint32_t *num)
{
40002560:	fe010113          	addi	sp,sp,-32
40002564:	00112e23          	sw	ra,28(sp)
40002568:	00812c23          	sw	s0,24(sp)
4000256c:	02010413          	addi	s0,sp,32
40002570:	fea42623          	sw	a0,-20(s0)
40002574:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002578:	400047b7          	lui	a5,0x40004
4000257c:	ba878513          	addi	a0,a5,-1112 # 40003ba8 <vga_simRes_h160_v120+0x38>
40002580:	b05ff0ef          	jal	ra,40002084 <print>
	print(message);
40002584:	fec42503          	lw	a0,-20(s0)
40002588:	afdff0ef          	jal	ra,40002084 <print>
	print32bit(num[15]);
4000258c:	fe842783          	lw	a5,-24(s0)
40002590:	03c78793          	addi	a5,a5,60
40002594:	0007a783          	lw	a5,0(a5)
40002598:	00078513          	mv	a0,a5
4000259c:	c49ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[14]);
400025a0:	fe842783          	lw	a5,-24(s0)
400025a4:	03878793          	addi	a5,a5,56
400025a8:	0007a783          	lw	a5,0(a5)
400025ac:	00078513          	mv	a0,a5
400025b0:	c35ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[13]);
400025b4:	fe842783          	lw	a5,-24(s0)
400025b8:	03478793          	addi	a5,a5,52
400025bc:	0007a783          	lw	a5,0(a5)
400025c0:	00078513          	mv	a0,a5
400025c4:	c21ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[12]);
400025c8:	fe842783          	lw	a5,-24(s0)
400025cc:	03078793          	addi	a5,a5,48
400025d0:	0007a783          	lw	a5,0(a5)
400025d4:	00078513          	mv	a0,a5
400025d8:	c0dff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[11]);
400025dc:	fe842783          	lw	a5,-24(s0)
400025e0:	02c78793          	addi	a5,a5,44
400025e4:	0007a783          	lw	a5,0(a5)
400025e8:	00078513          	mv	a0,a5
400025ec:	bf9ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[10]);
400025f0:	fe842783          	lw	a5,-24(s0)
400025f4:	02878793          	addi	a5,a5,40
400025f8:	0007a783          	lw	a5,0(a5)
400025fc:	00078513          	mv	a0,a5
40002600:	be5ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[9]);
40002604:	fe842783          	lw	a5,-24(s0)
40002608:	02478793          	addi	a5,a5,36
4000260c:	0007a783          	lw	a5,0(a5)
40002610:	00078513          	mv	a0,a5
40002614:	bd1ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[8]);
40002618:	fe842783          	lw	a5,-24(s0)
4000261c:	02078793          	addi	a5,a5,32
40002620:	0007a783          	lw	a5,0(a5)
40002624:	00078513          	mv	a0,a5
40002628:	bbdff0ef          	jal	ra,400021e4 <print32bit>
	print("\r\n");
4000262c:	400047b7          	lui	a5,0x40004
40002630:	bac78513          	addi	a0,a5,-1108 # 40003bac <vga_simRes_h160_v120+0x3c>
40002634:	a51ff0ef          	jal	ra,40002084 <print>
	print("\r\t                   ");
40002638:	400047b7          	lui	a5,0x40004
4000263c:	bb078513          	addi	a0,a5,-1104 # 40003bb0 <vga_simRes_h160_v120+0x40>
40002640:	a45ff0ef          	jal	ra,40002084 <print>
	print32bit(num[7]);
40002644:	fe842783          	lw	a5,-24(s0)
40002648:	01c78793          	addi	a5,a5,28
4000264c:	0007a783          	lw	a5,0(a5)
40002650:	00078513          	mv	a0,a5
40002654:	b91ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[6]);
40002658:	fe842783          	lw	a5,-24(s0)
4000265c:	01878793          	addi	a5,a5,24
40002660:	0007a783          	lw	a5,0(a5)
40002664:	00078513          	mv	a0,a5
40002668:	b7dff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[5]);
4000266c:	fe842783          	lw	a5,-24(s0)
40002670:	01478793          	addi	a5,a5,20
40002674:	0007a783          	lw	a5,0(a5)
40002678:	00078513          	mv	a0,a5
4000267c:	b69ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[4]);
40002680:	fe842783          	lw	a5,-24(s0)
40002684:	01078793          	addi	a5,a5,16
40002688:	0007a783          	lw	a5,0(a5)
4000268c:	00078513          	mv	a0,a5
40002690:	b55ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[3]);
40002694:	fe842783          	lw	a5,-24(s0)
40002698:	00c78793          	addi	a5,a5,12
4000269c:	0007a783          	lw	a5,0(a5)
400026a0:	00078513          	mv	a0,a5
400026a4:	b41ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[2]);
400026a8:	fe842783          	lw	a5,-24(s0)
400026ac:	00878793          	addi	a5,a5,8
400026b0:	0007a783          	lw	a5,0(a5)
400026b4:	00078513          	mv	a0,a5
400026b8:	b2dff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[1]);
400026bc:	fe842783          	lw	a5,-24(s0)
400026c0:	00478793          	addi	a5,a5,4
400026c4:	0007a783          	lw	a5,0(a5)
400026c8:	00078513          	mv	a0,a5
400026cc:	b19ff0ef          	jal	ra,400021e4 <print32bit>
	print32bit(num[0]);
400026d0:	fe842783          	lw	a5,-24(s0)
400026d4:	0007a783          	lw	a5,0(a5)
400026d8:	00078513          	mv	a0,a5
400026dc:	b09ff0ef          	jal	ra,400021e4 <print32bit>
	print("\r\n");
400026e0:	400047b7          	lui	a5,0x40004
400026e4:	bac78513          	addi	a0,a5,-1108 # 40003bac <vga_simRes_h160_v120+0x3c>
400026e8:	99dff0ef          	jal	ra,40002084 <print>
}
400026ec:	00000013          	nop
400026f0:	01c12083          	lw	ra,28(sp)
400026f4:	01812403          	lw	s0,24(sp)
400026f8:	02010113          	addi	sp,sp,32
400026fc:	00008067          	ret

40002700 <timer_init>:
static void timer_init(Timer_Reg *reg){
40002700:	fe010113          	addi	sp,sp,-32
40002704:	00812e23          	sw	s0,28(sp)
40002708:	02010413          	addi	s0,sp,32
4000270c:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40002710:	fec42783          	lw	a5,-20(s0)
40002714:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40002718:	fec42783          	lw	a5,-20(s0)
4000271c:	0007a423          	sw	zero,8(a5)
}
40002720:	00000013          	nop
40002724:	01c12403          	lw	s0,28(sp)
40002728:	02010113          	addi	sp,sp,32
4000272c:	00008067          	ret

40002730 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40002730:	fe010113          	addi	sp,sp,-32
40002734:	00812e23          	sw	s0,28(sp)
40002738:	02010413          	addi	s0,sp,32
4000273c:	fea42623          	sw	a0,-20(s0)
}
40002740:	00000013          	nop
40002744:	01c12403          	lw	s0,28(sp)
40002748:	02010113          	addi	sp,sp,32
4000274c:	00008067          	ret

40002750 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40002750:	fe010113          	addi	sp,sp,-32
40002754:	00812e23          	sw	s0,28(sp)
40002758:	02010413          	addi	s0,sp,32
4000275c:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40002760:	fec42783          	lw	a5,-20(s0)
40002764:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40002768:	fec42783          	lw	a5,-20(s0)
4000276c:	fff00713          	li	a4,-1
40002770:	00e7a023          	sw	a4,0(a5)
}
40002774:	00000013          	nop
40002778:	01c12403          	lw	s0,28(sp)
4000277c:	02010113          	addi	sp,sp,32
40002780:	00008067          	ret

40002784 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40002784:	fe010113          	addi	sp,sp,-32
40002788:	00812e23          	sw	s0,28(sp)
4000278c:	02010413          	addi	s0,sp,32
40002790:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40002794:	fec42783          	lw	a5,-20(s0)
40002798:	0047a783          	lw	a5,4(a5)
4000279c:	0107d793          	srli	a5,a5,0x10
400027a0:	0ff7f793          	zext.b	a5,a5
}
400027a4:	00078513          	mv	a0,a5
400027a8:	01c12403          	lw	s0,28(sp)
400027ac:	02010113          	addi	sp,sp,32
400027b0:	00008067          	ret

400027b4 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
400027b4:	fe010113          	addi	sp,sp,-32
400027b8:	00812e23          	sw	s0,28(sp)
400027bc:	02010413          	addi	s0,sp,32
400027c0:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
400027c4:	fec42783          	lw	a5,-20(s0)
400027c8:	0047a783          	lw	a5,4(a5)
400027cc:	0187d793          	srli	a5,a5,0x18
}
400027d0:	00078513          	mv	a0,a5
400027d4:	01c12403          	lw	s0,28(sp)
400027d8:	02010113          	addi	sp,sp,32
400027dc:	00008067          	ret

400027e0 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
400027e0:	fe010113          	addi	sp,sp,-32
400027e4:	00112e23          	sw	ra,28(sp)
400027e8:	00812c23          	sw	s0,24(sp)
400027ec:	02010413          	addi	s0,sp,32
400027f0:	fea42623          	sw	a0,-20(s0)
400027f4:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
400027f8:	00000013          	nop
400027fc:	fec42503          	lw	a0,-20(s0)
40002800:	f85ff0ef          	jal	ra,40002784 <uart_writeAvailability>
40002804:	00050793          	mv	a5,a0
40002808:	fe078ae3          	beqz	a5,400027fc <uart_write+0x1c>
	reg->DATA = data;
4000280c:	fec42783          	lw	a5,-20(s0)
40002810:	fe842703          	lw	a4,-24(s0)
40002814:	00e7a023          	sw	a4,0(a5)
}
40002818:	00000013          	nop
4000281c:	01c12083          	lw	ra,28(sp)
40002820:	01812403          	lw	s0,24(sp)
40002824:	02010113          	addi	sp,sp,32
40002828:	00008067          	ret

4000282c <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
4000282c:	fe010113          	addi	sp,sp,-32
40002830:	00812e23          	sw	s0,28(sp)
40002834:	02010413          	addi	s0,sp,32
40002838:	fea42623          	sw	a0,-20(s0)
4000283c:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40002840:	fe842783          	lw	a5,-24(s0)
40002844:	00c7a703          	lw	a4,12(a5)
40002848:	fec42783          	lw	a5,-20(s0)
4000284c:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40002850:	fe842783          	lw	a5,-24(s0)
40002854:	0007a783          	lw	a5,0(a5)
40002858:	fff78713          	addi	a4,a5,-1
4000285c:	fe842783          	lw	a5,-24(s0)
40002860:	0047a783          	lw	a5,4(a5)
40002864:	00879793          	slli	a5,a5,0x8
40002868:	00f76733          	or	a4,a4,a5
4000286c:	fe842783          	lw	a5,-24(s0)
40002870:	0087a783          	lw	a5,8(a5)
40002874:	01079793          	slli	a5,a5,0x10
40002878:	00f76733          	or	a4,a4,a5
4000287c:	fec42783          	lw	a5,-20(s0)
40002880:	00e7a623          	sw	a4,12(a5)
}
40002884:	00000013          	nop
40002888:	01c12403          	lw	s0,28(sp)
4000288c:	02010113          	addi	sp,sp,32
40002890:	00008067          	ret

40002894 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40002894:	fe010113          	addi	sp,sp,-32
40002898:	00812e23          	sw	s0,28(sp)
4000289c:	02010413          	addi	s0,sp,32
400028a0:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
400028a4:	fec42783          	lw	a5,-20(s0)
400028a8:	0007a783          	lw	a5,0(a5)
400028ac:	0027f793          	andi	a5,a5,2
400028b0:	00f037b3          	snez	a5,a5
400028b4:	0ff7f793          	zext.b	a5,a5
}
400028b8:	00078513          	mv	a0,a5
400028bc:	01c12403          	lw	s0,28(sp)
400028c0:	02010113          	addi	sp,sp,32
400028c4:	00008067          	ret

400028c8 <vga_run>:
static void vga_run(Vga_Reg *reg){
400028c8:	fe010113          	addi	sp,sp,-32
400028cc:	00812e23          	sw	s0,28(sp)
400028d0:	02010413          	addi	s0,sp,32
400028d4:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
400028d8:	fec42783          	lw	a5,-20(s0)
400028dc:	00100713          	li	a4,1
400028e0:	00e7a023          	sw	a4,0(a5)
}
400028e4:	00000013          	nop
400028e8:	01c12403          	lw	s0,28(sp)
400028ec:	02010113          	addi	sp,sp,32
400028f0:	00008067          	ret

400028f4 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
400028f4:	fe010113          	addi	sp,sp,-32
400028f8:	00112e23          	sw	ra,28(sp)
400028fc:	00812c23          	sw	s0,24(sp)
40002900:	02010413          	addi	s0,sp,32
40002904:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40002908:	fec42783          	lw	a5,-20(s0)
4000290c:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40002910:	00000013          	nop
40002914:	fec42503          	lw	a0,-20(s0)
40002918:	f7dff0ef          	jal	ra,40002894 <vga_isBusy>
4000291c:	00050793          	mv	a5,a0
40002920:	fe079ae3          	bnez	a5,40002914 <vga_stop+0x20>
}
40002924:	00000013          	nop
40002928:	00000013          	nop
4000292c:	01c12083          	lw	ra,28(sp)
40002930:	01812403          	lw	s0,24(sp)
40002934:	02010113          	addi	sp,sp,32
40002938:	00008067          	ret

4000293c <poly_write>:
#include "briey.h"
void poly_write(uint32_t iData, uint32_t iAddress)
{
4000293c:	fe010113          	addi	sp,sp,-32
40002940:	00812e23          	sw	s0,28(sp)
40002944:	02010413          	addi	s0,sp,32
40002948:	fea42623          	sw	a0,-20(s0)
4000294c:	feb42423          	sw	a1,-24(s0)
	POLY_BASE->ADDRESS			= iAddress;
40002950:	f00037b7          	lui	a5,0xf0003
40002954:	fe842703          	lw	a4,-24(s0)
40002958:	00e7a423          	sw	a4,8(a5) # f0003008 <_stack_start+0x700026c8>
	POLY_BASE->WRITE_ENABLE 	= 1;
4000295c:	f00037b7          	lui	a5,0xf0003
40002960:	00100713          	li	a4,1
40002964:	00e7a223          	sw	a4,4(a5) # f0003004 <_stack_start+0x700026c4>
	POLY_BASE->IDATA			= iData;
40002968:	f00037b7          	lui	a5,0xf0003
4000296c:	fec42703          	lw	a4,-20(s0)
40002970:	00e7a623          	sw	a4,12(a5) # f000300c <_stack_start+0x700026cc>
	POLY_BASE->CHIP_SELECT		= 1;
40002974:	f00037b7          	lui	a5,0xf0003
40002978:	00100713          	li	a4,1
4000297c:	00e7a023          	sw	a4,0(a5) # f0003000 <_stack_start+0x700026c0>
	POLY_BASE->CHIP_SELECT		= 0;
40002980:	f00037b7          	lui	a5,0xf0003
40002984:	0007a023          	sw	zero,0(a5) # f0003000 <_stack_start+0x700026c0>
}
40002988:	00000013          	nop
4000298c:	01c12403          	lw	s0,28(sp)
40002990:	02010113          	addi	sp,sp,32
40002994:	00008067          	ret

40002998 <poly_read>:
uint32_t poly_read(uint32_t iAddress)
{
40002998:	fd010113          	addi	sp,sp,-48
4000299c:	02812623          	sw	s0,44(sp)
400029a0:	03010413          	addi	s0,sp,48
400029a4:	fca42e23          	sw	a0,-36(s0)
	POLY_BASE->ADDRESS		= iAddress;
400029a8:	f00037b7          	lui	a5,0xf0003
400029ac:	fdc42703          	lw	a4,-36(s0)
400029b0:	00e7a423          	sw	a4,8(a5) # f0003008 <_stack_start+0x700026c8>
	POLY_BASE->WRITE_ENABLE	= 0;
400029b4:	f00037b7          	lui	a5,0xf0003
400029b8:	0007a223          	sw	zero,4(a5) # f0003004 <_stack_start+0x700026c4>
	POLY_BASE->CHIP_SELECT	= 1;
400029bc:	f00037b7          	lui	a5,0xf0003
400029c0:	00100713          	li	a4,1
400029c4:	00e7a023          	sw	a4,0(a5) # f0003000 <_stack_start+0x700026c0>
	uint32_t res 			= POLY_BASE->ODATA;
400029c8:	f00037b7          	lui	a5,0xf0003
400029cc:	0107a783          	lw	a5,16(a5) # f0003010 <_stack_start+0x700026d0>
400029d0:	fef42623          	sw	a5,-20(s0)
	POLY_BASE->CHIP_SELECT	= 0;
400029d4:	f00037b7          	lui	a5,0xf0003
400029d8:	0007a023          	sw	zero,0(a5) # f0003000 <_stack_start+0x700026c0>
	return res;
400029dc:	fec42783          	lw	a5,-20(s0)
}
400029e0:	00078513          	mv	a0,a5
400029e4:	02c12403          	lw	s0,44(sp)
400029e8:	03010113          	addi	sp,sp,48
400029ec:	00008067          	ret

400029f0 <poly_init>:
//1. write 256-bit to key
//2. reset block
//3. write 1 to ctrl_reg
//4. wait ready
void poly_init(uint32_t *key)
{
400029f0:	fe010113          	addi	sp,sp,-32
400029f4:	00112e23          	sw	ra,28(sp)
400029f8:	00812c23          	sw	s0,24(sp)
400029fc:	02010413          	addi	s0,sp,32
40002a00:	fea42623          	sw	a0,-20(s0)
	poly_write(key[7],POLY_ADDR_KEY_BASE);
40002a04:	fec42783          	lw	a5,-20(s0)
40002a08:	01c78793          	addi	a5,a5,28
40002a0c:	0007a783          	lw	a5,0(a5)
40002a10:	01000593          	li	a1,16
40002a14:	00078513          	mv	a0,a5
40002a18:	f25ff0ef          	jal	ra,4000293c <poly_write>
	poly_write(key[6],POLY_ADDR_KEY_BASE + 1);
40002a1c:	fec42783          	lw	a5,-20(s0)
40002a20:	01878793          	addi	a5,a5,24
40002a24:	0007a783          	lw	a5,0(a5)
40002a28:	01100593          	li	a1,17
40002a2c:	00078513          	mv	a0,a5
40002a30:	f0dff0ef          	jal	ra,4000293c <poly_write>
	poly_write(key[5],POLY_ADDR_KEY_BASE + 2);
40002a34:	fec42783          	lw	a5,-20(s0)
40002a38:	01478793          	addi	a5,a5,20
40002a3c:	0007a783          	lw	a5,0(a5)
40002a40:	01200593          	li	a1,18
40002a44:	00078513          	mv	a0,a5
40002a48:	ef5ff0ef          	jal	ra,4000293c <poly_write>
	poly_write(key[4],POLY_ADDR_KEY_BASE + 3);
40002a4c:	fec42783          	lw	a5,-20(s0)
40002a50:	01078793          	addi	a5,a5,16
40002a54:	0007a783          	lw	a5,0(a5)
40002a58:	01300593          	li	a1,19
40002a5c:	00078513          	mv	a0,a5
40002a60:	eddff0ef          	jal	ra,4000293c <poly_write>
	poly_write(key[3],POLY_ADDR_KEY_BASE + 4);
40002a64:	fec42783          	lw	a5,-20(s0)
40002a68:	00c78793          	addi	a5,a5,12
40002a6c:	0007a783          	lw	a5,0(a5)
40002a70:	01400593          	li	a1,20
40002a74:	00078513          	mv	a0,a5
40002a78:	ec5ff0ef          	jal	ra,4000293c <poly_write>
	poly_write(key[2],POLY_ADDR_KEY_BASE + 5);
40002a7c:	fec42783          	lw	a5,-20(s0)
40002a80:	00878793          	addi	a5,a5,8
40002a84:	0007a783          	lw	a5,0(a5)
40002a88:	01500593          	li	a1,21
40002a8c:	00078513          	mv	a0,a5
40002a90:	eadff0ef          	jal	ra,4000293c <poly_write>
	poly_write(key[1],POLY_ADDR_KEY_BASE + 6);
40002a94:	fec42783          	lw	a5,-20(s0)
40002a98:	00478793          	addi	a5,a5,4
40002a9c:	0007a783          	lw	a5,0(a5)
40002aa0:	01600593          	li	a1,22
40002aa4:	00078513          	mv	a0,a5
40002aa8:	e95ff0ef          	jal	ra,4000293c <poly_write>
	poly_write(key[0],POLY_ADDR_KEY_BASE + 7);
40002aac:	fec42783          	lw	a5,-20(s0)
40002ab0:	0007a783          	lw	a5,0(a5)
40002ab4:	01700593          	li	a1,23
40002ab8:	00078513          	mv	a0,a5
40002abc:	e81ff0ef          	jal	ra,4000293c <poly_write>

	poly_write(0x0,POLY_ADDR_BLOCK_BASE);
40002ac0:	02000593          	li	a1,32
40002ac4:	00000513          	li	a0,0
40002ac8:	e75ff0ef          	jal	ra,4000293c <poly_write>
	poly_write(0x0,POLY_ADDR_BLOCK_BASE + 1);
40002acc:	02100593          	li	a1,33
40002ad0:	00000513          	li	a0,0
40002ad4:	e69ff0ef          	jal	ra,4000293c <poly_write>
	poly_write(0x0,POLY_ADDR_BLOCK_BASE + 2);
40002ad8:	02200593          	li	a1,34
40002adc:	00000513          	li	a0,0
40002ae0:	e5dff0ef          	jal	ra,4000293c <poly_write>
	poly_write(0x0,POLY_ADDR_BLOCK_BASE + 3);
40002ae4:	02300593          	li	a1,35
40002ae8:	00000513          	li	a0,0
40002aec:	e51ff0ef          	jal	ra,4000293c <poly_write>

	poly_write(CONST_INIT,POLY_ADDR_CTRL);
40002af0:	00800593          	li	a1,8
40002af4:	00100513          	li	a0,1
40002af8:	e45ff0ef          	jal	ra,4000293c <poly_write>
	while(poly_read(POLY_ADDR_STATUS)==0);
40002afc:	00000013          	nop
40002b00:	00900513          	li	a0,9
40002b04:	e95ff0ef          	jal	ra,40002998 <poly_read>
40002b08:	00050793          	mv	a5,a0
40002b0c:	fe078ae3          	beqz	a5,40002b00 <poly_init+0x110>
}
40002b10:	00000013          	nop
40002b14:	00000013          	nop
40002b18:	01c12083          	lw	ra,28(sp)
40002b1c:	01812403          	lw	s0,24(sp)
40002b20:	02010113          	addi	sp,sp,32
40002b24:	00008067          	ret

40002b28 <poly_write_block>:
//1. write data to block
//2. set number of bytes of block
//3. write 2 to ctrl_reg
//4. wait ready
void poly_write_block(uint32_t block_length,uint32_t *block)
{
40002b28:	fe010113          	addi	sp,sp,-32
40002b2c:	00112e23          	sw	ra,28(sp)
40002b30:	00812c23          	sw	s0,24(sp)
40002b34:	02010413          	addi	s0,sp,32
40002b38:	fea42623          	sw	a0,-20(s0)
40002b3c:	feb42423          	sw	a1,-24(s0)
	//16 bytes block input
	poly_write(block[3],POLY_ADDR_BLOCK_BASE);
40002b40:	fe842783          	lw	a5,-24(s0)
40002b44:	00c78793          	addi	a5,a5,12
40002b48:	0007a783          	lw	a5,0(a5)
40002b4c:	02000593          	li	a1,32
40002b50:	00078513          	mv	a0,a5
40002b54:	de9ff0ef          	jal	ra,4000293c <poly_write>
	poly_write(block[2],POLY_ADDR_BLOCK_BASE + 1);
40002b58:	fe842783          	lw	a5,-24(s0)
40002b5c:	00878793          	addi	a5,a5,8
40002b60:	0007a783          	lw	a5,0(a5)
40002b64:	02100593          	li	a1,33
40002b68:	00078513          	mv	a0,a5
40002b6c:	dd1ff0ef          	jal	ra,4000293c <poly_write>
	poly_write(block[1],POLY_ADDR_BLOCK_BASE + 2);
40002b70:	fe842783          	lw	a5,-24(s0)
40002b74:	00478793          	addi	a5,a5,4
40002b78:	0007a783          	lw	a5,0(a5)
40002b7c:	02200593          	li	a1,34
40002b80:	00078513          	mv	a0,a5
40002b84:	db9ff0ef          	jal	ra,4000293c <poly_write>
	poly_write(block[0],POLY_ADDR_BLOCK_BASE + 3);
40002b88:	fe842783          	lw	a5,-24(s0)
40002b8c:	0007a783          	lw	a5,0(a5)
40002b90:	02300593          	li	a1,35
40002b94:	00078513          	mv	a0,a5
40002b98:	da5ff0ef          	jal	ra,4000293c <poly_write>

	//Set number of bytes
	poly_write(block_length,POLY_ADDR_BLOCKLEN);
40002b9c:	00a00593          	li	a1,10
40002ba0:	fec42503          	lw	a0,-20(s0)
40002ba4:	d99ff0ef          	jal	ra,4000293c <poly_write>

	//write next to ctrl_reg
	poly_write(CONST_NEXT,POLY_ADDR_CTRL);
40002ba8:	00800593          	li	a1,8
40002bac:	00200513          	li	a0,2
40002bb0:	d8dff0ef          	jal	ra,4000293c <poly_write>

	//wait ready
	while(poly_read(POLY_ADDR_STATUS)==0);
40002bb4:	00000013          	nop
40002bb8:	00900513          	li	a0,9
40002bbc:	dddff0ef          	jal	ra,40002998 <poly_read>
40002bc0:	00050793          	mv	a5,a0
40002bc4:	fe078ae3          	beqz	a5,40002bb8 <poly_write_block+0x90>

}
40002bc8:	00000013          	nop
40002bcc:	00000013          	nop
40002bd0:	01c12083          	lw	ra,28(sp)
40002bd4:	01812403          	lw	s0,24(sp)
40002bd8:	02010113          	addi	sp,sp,32
40002bdc:	00008067          	ret

40002be0 <get_MAC>:

//get_MAC (result) function:
//1.write 4 to ctrl_reg
//2.wait ready
void get_MAC(uint32_t *MAC)
{
40002be0:	fe010113          	addi	sp,sp,-32
40002be4:	00112e23          	sw	ra,28(sp)
40002be8:	00812c23          	sw	s0,24(sp)
40002bec:	00912a23          	sw	s1,20(sp)
40002bf0:	02010413          	addi	s0,sp,32
40002bf4:	fea42623          	sw	a0,-20(s0)
	poly_write(CONST_FINISH,POLY_ADDR_CTRL);
40002bf8:	00800593          	li	a1,8
40002bfc:	00400513          	li	a0,4
40002c00:	d3dff0ef          	jal	ra,4000293c <poly_write>
	while(poly_read(POLY_ADDR_STATUS)==0);
40002c04:	00000013          	nop
40002c08:	00900513          	li	a0,9
40002c0c:	d8dff0ef          	jal	ra,40002998 <poly_read>
40002c10:	00050793          	mv	a5,a0
40002c14:	fe078ae3          	beqz	a5,40002c08 <get_MAC+0x28>
	MAC[3] = poly_read(POLY_ADDR_RESULT_BASE);
40002c18:	fec42783          	lw	a5,-20(s0)
40002c1c:	00c78493          	addi	s1,a5,12
40002c20:	03000513          	li	a0,48
40002c24:	d75ff0ef          	jal	ra,40002998 <poly_read>
40002c28:	00050793          	mv	a5,a0
40002c2c:	00f4a023          	sw	a5,0(s1)
	MAC[2] = poly_read(POLY_ADDR_RESULT_BASE + 1);
40002c30:	fec42783          	lw	a5,-20(s0)
40002c34:	00878493          	addi	s1,a5,8
40002c38:	03100513          	li	a0,49
40002c3c:	d5dff0ef          	jal	ra,40002998 <poly_read>
40002c40:	00050793          	mv	a5,a0
40002c44:	00f4a023          	sw	a5,0(s1)
	MAC[1] = poly_read(POLY_ADDR_RESULT_BASE + 2);
40002c48:	fec42783          	lw	a5,-20(s0)
40002c4c:	00478493          	addi	s1,a5,4
40002c50:	03200513          	li	a0,50
40002c54:	d45ff0ef          	jal	ra,40002998 <poly_read>
40002c58:	00050793          	mv	a5,a0
40002c5c:	00f4a023          	sw	a5,0(s1)
	MAC[0] = poly_read(POLY_ADDR_RESULT_BASE + 3);
40002c60:	03300513          	li	a0,51
40002c64:	d35ff0ef          	jal	ra,40002998 <poly_read>
40002c68:	00050713          	mv	a4,a0
40002c6c:	fec42783          	lw	a5,-20(s0)
40002c70:	00e7a023          	sw	a4,0(a5)
}
40002c74:	00000013          	nop
40002c78:	01c12083          	lw	ra,28(sp)
40002c7c:	01812403          	lw	s0,24(sp)
40002c80:	01412483          	lw	s1,20(sp)
40002c84:	02010113          	addi	sp,sp,32
40002c88:	00008067          	ret

40002c8c <poly_test_N_bytes>:
void poly_test_N_bytes(uint32_t block_length,uint32_t *key, uint32_t *block, uint32_t *res)
{
40002c8c:	fe010113          	addi	sp,sp,-32
40002c90:	00112e23          	sw	ra,28(sp)
40002c94:	00812c23          	sw	s0,24(sp)
40002c98:	02010413          	addi	s0,sp,32
40002c9c:	fea42623          	sw	a0,-20(s0)
40002ca0:	feb42423          	sw	a1,-24(s0)
40002ca4:	fec42223          	sw	a2,-28(s0)
40002ca8:	fed42023          	sw	a3,-32(s0)

	poly_init(key);
40002cac:	fe842503          	lw	a0,-24(s0)
40002cb0:	d41ff0ef          	jal	ra,400029f0 <poly_init>
	poly_write_block(block_length,block);
40002cb4:	fe442583          	lw	a1,-28(s0)
40002cb8:	fec42503          	lw	a0,-20(s0)
40002cbc:	e6dff0ef          	jal	ra,40002b28 <poly_write_block>
	get_MAC(res);
40002cc0:	fe042503          	lw	a0,-32(s0)
40002cc4:	f1dff0ef          	jal	ra,40002be0 <get_MAC>

	print("\r\n");
40002cc8:	400047b7          	lui	a5,0x40004
40002ccc:	c2878513          	addi	a0,a5,-984 # 40003c28 <vga_simRes_h160_v120+0x20>
40002cd0:	bb4ff0ef          	jal	ra,40002084 <print>
	print128bit("\r\tPLAIN_TEXT (128-bit) : ", block);
40002cd4:	fe442583          	lw	a1,-28(s0)
40002cd8:	400047b7          	lui	a5,0x40004
40002cdc:	c2c78513          	addi	a0,a5,-980 # 40003c2c <vga_simRes_h160_v120+0x24>
40002ce0:	e7cff0ef          	jal	ra,4000235c <print128bit>
	print256bit("KEY (256-bit): ", key);
40002ce4:	fe842583          	lw	a1,-24(s0)
40002ce8:	400047b7          	lui	a5,0x40004
40002cec:	c4878513          	addi	a0,a5,-952 # 40003c48 <vga_simRes_h160_v120+0x40>
40002cf0:	f88ff0ef          	jal	ra,40002478 <print256bit>
	print128bit("RESULT (128-bit) : ", res);
40002cf4:	fe042583          	lw	a1,-32(s0)
40002cf8:	400047b7          	lui	a5,0x40004
40002cfc:	c5878513          	addi	a0,a5,-936 # 40003c58 <vga_simRes_h160_v120+0x50>
40002d00:	e5cff0ef          	jal	ra,4000235c <print128bit>

}
40002d04:	00000013          	nop
40002d08:	01c12083          	lw	ra,28(sp)
40002d0c:	01812403          	lw	s0,24(sp)
40002d10:	02010113          	addi	sp,sp,32
40002d14:	00008067          	ret

40002d18 <poly_test_rfc8439>:

void poly_test_rfc8439()
{
40002d18:	f9010113          	addi	sp,sp,-112
40002d1c:	06112623          	sw	ra,108(sp)
40002d20:	06812423          	sw	s0,104(sp)
40002d24:	07010413          	addi	s0,sp,112
	uint32_t rfc8439_key[8];
	uint32_t rfc8439_block2[4];
	uint32_t rfc8439_block1[4];
	uint32_t rfc8439_block0[4];

	rfc8439_key[7]= 0x85d6be78;
40002d28:	85d6c7b7          	lui	a5,0x85d6c
40002d2c:	e7878793          	addi	a5,a5,-392 # 85d6be78 <_stack_start+0x5d6b538>
40002d30:	fef42623          	sw	a5,-20(s0)
	rfc8439_key[6]= 0x57556d33;
40002d34:	575577b7          	lui	a5,0x57557
40002d38:	d3378793          	addi	a5,a5,-717 # 57556d33 <__global_pointer$+0x17552853>
40002d3c:	fef42423          	sw	a5,-24(s0)
	rfc8439_key[5]= 0x7f4452fe;
40002d40:	7f4457b7          	lui	a5,0x7f445
40002d44:	2fe78793          	addi	a5,a5,766 # 7f4452fe <__global_pointer$+0x3f440e1e>
40002d48:	fef42223          	sw	a5,-28(s0)
	rfc8439_key[4]= 0x42d506a8;
40002d4c:	42d507b7          	lui	a5,0x42d50
40002d50:	6a878793          	addi	a5,a5,1704 # 42d506a8 <__global_pointer$+0x2d4c1c8>
40002d54:	fef42023          	sw	a5,-32(s0)
	rfc8439_key[3]= 0x0103808a;
40002d58:	010387b7          	lui	a5,0x1038
40002d5c:	08a78793          	addi	a5,a5,138 # 103808a <_stack_size+0x103788a>
40002d60:	fcf42e23          	sw	a5,-36(s0)
	rfc8439_key[2]= 0xfb0db2fd;
40002d64:	fb0db7b7          	lui	a5,0xfb0db
40002d68:	2fd78793          	addi	a5,a5,765 # fb0db2fd <_stack_start+0x7b0da9bd>
40002d6c:	fcf42c23          	sw	a5,-40(s0)
	rfc8439_key[1]= 0x4abff6af;
40002d70:	4abff7b7          	lui	a5,0x4abff
40002d74:	6af78793          	addi	a5,a5,1711 # 4abff6af <__global_pointer$+0xabfb1cf>
40002d78:	fcf42a23          	sw	a5,-44(s0)
	rfc8439_key[0]= 0x4149f51b;
40002d7c:	4149f7b7          	lui	a5,0x4149f
40002d80:	51b78793          	addi	a5,a5,1307 # 4149f51b <__global_pointer$+0x149b03b>
40002d84:	fcf42823          	sw	a5,-48(s0)

	rfc8439_block2[3]= 0x43727970;
40002d88:	437287b7          	lui	a5,0x43728
40002d8c:	97078793          	addi	a5,a5,-1680 # 43727970 <__global_pointer$+0x3723490>
40002d90:	fcf42623          	sw	a5,-52(s0)
	rfc8439_block2[2]= 0x746f6772;
40002d94:	746f67b7          	lui	a5,0x746f6
40002d98:	77278793          	addi	a5,a5,1906 # 746f6772 <__global_pointer$+0x346f2292>
40002d9c:	fcf42423          	sw	a5,-56(s0)
	rfc8439_block2[1]= 0x61706869;
40002da0:	617077b7          	lui	a5,0x61707
40002da4:	86978793          	addi	a5,a5,-1943 # 61706869 <__global_pointer$+0x21702389>
40002da8:	fcf42223          	sw	a5,-60(s0)
	rfc8439_block2[0]= 0x6320466f;
40002dac:	632047b7          	lui	a5,0x63204
40002db0:	66f78793          	addi	a5,a5,1647 # 6320466f <__global_pointer$+0x2320018f>
40002db4:	fcf42023          	sw	a5,-64(s0)

	rfc8439_block1[3]= 0x72756d20;
40002db8:	727577b7          	lui	a5,0x72757
40002dbc:	d2078793          	addi	a5,a5,-736 # 72756d20 <__global_pointer$+0x32752840>
40002dc0:	faf42e23          	sw	a5,-68(s0)
	rfc8439_block1[2]= 0x52657365;
40002dc4:	526577b7          	lui	a5,0x52657
40002dc8:	36578793          	addi	a5,a5,869 # 52657365 <__global_pointer$+0x12652e85>
40002dcc:	faf42c23          	sw	a5,-72(s0)
	rfc8439_block1[1]= 0x61726368;
40002dd0:	617267b7          	lui	a5,0x61726
40002dd4:	36878793          	addi	a5,a5,872 # 61726368 <__global_pointer$+0x21721e88>
40002dd8:	faf42a23          	sw	a5,-76(s0)
	rfc8439_block1[0]= 0x2047726f;
40002ddc:	204777b7          	lui	a5,0x20477
40002de0:	26f78793          	addi	a5,a5,623 # 2047726f <_stack_size+0x20476a6f>
40002de4:	faf42823          	sw	a5,-80(s0)

	rfc8439_block0[3]= 0x75700000;
40002de8:	757007b7          	lui	a5,0x75700
40002dec:	faf42623          	sw	a5,-84(s0)
	rfc8439_block0[2]= 0x00000000;
40002df0:	fa042423          	sw	zero,-88(s0)
	rfc8439_block0[1]= 0x00000000;
40002df4:	fa042223          	sw	zero,-92(s0)
	rfc8439_block0[0]= 0x00000000;
40002df8:	fa042023          	sw	zero,-96(s0)

	uint32_t rfc8439_res[4] = {0x00, 0x00, 0x00,0x00};
40002dfc:	f8042823          	sw	zero,-112(s0)
40002e00:	f8042a23          	sw	zero,-108(s0)
40002e04:	f8042c23          	sw	zero,-104(s0)
40002e08:	f8042e23          	sw	zero,-100(s0)

	//PROCESSING
	poly_init(rfc8439_key);
40002e0c:	fd040793          	addi	a5,s0,-48
40002e10:	00078513          	mv	a0,a5
40002e14:	bddff0ef          	jal	ra,400029f0 <poly_init>
	poly_write_block(0x10,rfc8439_block2);
40002e18:	fc040793          	addi	a5,s0,-64
40002e1c:	00078593          	mv	a1,a5
40002e20:	01000513          	li	a0,16
40002e24:	d05ff0ef          	jal	ra,40002b28 <poly_write_block>
	poly_write_block(0x10,rfc8439_block1);
40002e28:	fb040793          	addi	a5,s0,-80
40002e2c:	00078593          	mv	a1,a5
40002e30:	01000513          	li	a0,16
40002e34:	cf5ff0ef          	jal	ra,40002b28 <poly_write_block>
	poly_write_block(0x2,rfc8439_block0);
40002e38:	fa040793          	addi	a5,s0,-96
40002e3c:	00078593          	mv	a1,a5
40002e40:	00200513          	li	a0,2
40002e44:	ce5ff0ef          	jal	ra,40002b28 <poly_write_block>

	//OUTPUT
	get_MAC(rfc8439_res);
40002e48:	f9040793          	addi	a5,s0,-112
40002e4c:	00078513          	mv	a0,a5
40002e50:	d91ff0ef          	jal	ra,40002be0 <get_MAC>

	//print
	print128bit("\r\tPLAIN_TEXT (272-bit) : ", rfc8439_block2);
40002e54:	fc040793          	addi	a5,s0,-64
40002e58:	00078593          	mv	a1,a5
40002e5c:	400047b7          	lui	a5,0x40004
40002e60:	c6c78513          	addi	a0,a5,-916 # 40003c6c <vga_simRes_h160_v120+0x64>
40002e64:	cf8ff0ef          	jal	ra,4000235c <print128bit>
	print128bit("\r\t                       ", rfc8439_block1);
40002e68:	fb040793          	addi	a5,s0,-80
40002e6c:	00078593          	mv	a1,a5
40002e70:	400047b7          	lui	a5,0x40004
40002e74:	c8878513          	addi	a0,a5,-888 # 40003c88 <vga_simRes_h160_v120+0x80>
40002e78:	ce4ff0ef          	jal	ra,4000235c <print128bit>
	print("\r\t                       ");
40002e7c:	400047b7          	lui	a5,0x40004
40002e80:	c8878513          	addi	a0,a5,-888 # 40003c88 <vga_simRes_h160_v120+0x80>
40002e84:	a00ff0ef          	jal	ra,40002084 <print>
	print16bit(0x7570);
40002e88:	000077b7          	lui	a5,0x7
40002e8c:	57078513          	addi	a0,a5,1392 # 7570 <_stack_size+0x6d70>
40002e90:	a4cff0ef          	jal	ra,400020dc <print16bit>
	print("\r\n");
40002e94:	400047b7          	lui	a5,0x40004
40002e98:	c2878513          	addi	a0,a5,-984 # 40003c28 <vga_simRes_h160_v120+0x20>
40002e9c:	9e8ff0ef          	jal	ra,40002084 <print>


	print256bit("KEY (256-bit): ", rfc8439_key);
40002ea0:	fd040793          	addi	a5,s0,-48
40002ea4:	00078593          	mv	a1,a5
40002ea8:	400047b7          	lui	a5,0x40004
40002eac:	c4878513          	addi	a0,a5,-952 # 40003c48 <vga_simRes_h160_v120+0x40>
40002eb0:	dc8ff0ef          	jal	ra,40002478 <print256bit>

	print128bit("RESULT (128-bit) : ", rfc8439_res);
40002eb4:	f9040793          	addi	a5,s0,-112
40002eb8:	00078593          	mv	a1,a5
40002ebc:	400047b7          	lui	a5,0x40004
40002ec0:	c5878513          	addi	a0,a5,-936 # 40003c58 <vga_simRes_h160_v120+0x50>
40002ec4:	c98ff0ef          	jal	ra,4000235c <print128bit>
}
40002ec8:	00000013          	nop
40002ecc:	06c12083          	lw	ra,108(sp)
40002ed0:	06812403          	lw	s0,104(sp)
40002ed4:	07010113          	addi	sp,sp,112
40002ed8:	00008067          	ret

40002edc <poly_test_long>:

void poly_test_long()
{
40002edc:	f9010113          	addi	sp,sp,-112
40002ee0:	06112623          	sw	ra,108(sp)
40002ee4:	06812423          	sw	s0,104(sp)
40002ee8:	07010413          	addi	s0,sp,112
	uint32_t long_key[8];
	uint32_t long_block[4];
	uint32_t long_block_final[4];
	uint32_t long_res[4] = {0x00, 0x00, 0x00,0x00};
40002eec:	f8042e23          	sw	zero,-100(s0)
40002ef0:	fa042023          	sw	zero,-96(s0)
40002ef4:	fa042223          	sw	zero,-92(s0)
40002ef8:	fa042423          	sw	zero,-88(s0)

	long_key[7]= 0xf3000000;
40002efc:	f30007b7          	lui	a5,0xf3000
40002f00:	fef42423          	sw	a5,-24(s0)
	long_key[6]= 0x00000000;
40002f04:	fe042223          	sw	zero,-28(s0)
	long_key[5]= 0x00000000;
40002f08:	fe042023          	sw	zero,-32(s0)
	long_key[4]= 0x0000003f;
40002f0c:	03f00793          	li	a5,63
40002f10:	fcf42e23          	sw	a5,-36(s0)
	long_key[3]= 0x3f000000;
40002f14:	3f0007b7          	lui	a5,0x3f000
40002f18:	fcf42c23          	sw	a5,-40(s0)
	long_key[2]= 0x00000000;
40002f1c:	fc042a23          	sw	zero,-44(s0)
	long_key[1]= 0x00000000;
40002f20:	fc042823          	sw	zero,-48(s0)
	long_key[0]= 0x000000f3;
40002f24:	0f300793          	li	a5,243
40002f28:	fcf42623          	sw	a5,-52(s0)

	long_block[3]= 0xffffffff;
40002f2c:	fff00793          	li	a5,-1
40002f30:	fcf42423          	sw	a5,-56(s0)
	long_block[2]= 0xffffffff;
40002f34:	fff00793          	li	a5,-1
40002f38:	fcf42223          	sw	a5,-60(s0)
	long_block[1]= 0xffffffff;
40002f3c:	fff00793          	li	a5,-1
40002f40:	fcf42023          	sw	a5,-64(s0)
	long_block[0]= 0xffffffff;
40002f44:	fff00793          	li	a5,-1
40002f48:	faf42e23          	sw	a5,-68(s0)

	long_block_final[3]= 0x01000000;
40002f4c:	010007b7          	lui	a5,0x1000
40002f50:	faf42c23          	sw	a5,-72(s0)
	long_block_final[2]= 0x00000000;
40002f54:	fa042a23          	sw	zero,-76(s0)
	long_block_final[1]= 0x00000000;
40002f58:	fa042823          	sw	zero,-80(s0)
	long_block_final[0]= 0x00000000;
40002f5c:	fa042623          	sw	zero,-84(s0)

	//PROCESS
	poly_init(long_key);
40002f60:	fcc40793          	addi	a5,s0,-52
40002f64:	00078513          	mv	a0,a5
40002f68:	a89ff0ef          	jal	ra,400029f0 <poly_init>
	//write 64x128 bit block
	for(int i=0;i<64;i++)
40002f6c:	fe042623          	sw	zero,-20(s0)
40002f70:	0200006f          	j	40002f90 <poly_test_long+0xb4>
	{
		poly_write_block(0x10,long_block);
40002f74:	fbc40793          	addi	a5,s0,-68
40002f78:	00078593          	mv	a1,a5
40002f7c:	01000513          	li	a0,16
40002f80:	ba9ff0ef          	jal	ra,40002b28 <poly_write_block>
	for(int i=0;i<64;i++)
40002f84:	fec42783          	lw	a5,-20(s0)
40002f88:	00178793          	addi	a5,a5,1 # 1000001 <_stack_size+0xfff801>
40002f8c:	fef42623          	sw	a5,-20(s0)
40002f90:	fec42703          	lw	a4,-20(s0)
40002f94:	03f00793          	li	a5,63
40002f98:	fce7dee3          	bge	a5,a4,40002f74 <poly_test_long+0x98>
	}
	//write final block
	poly_write_block(0x1,long_block_final);
40002f9c:	fac40793          	addi	a5,s0,-84
40002fa0:	00078593          	mv	a1,a5
40002fa4:	00100513          	li	a0,1
40002fa8:	b81ff0ef          	jal	ra,40002b28 <poly_write_block>

	//get result
	get_MAC(long_res);
40002fac:	f9c40793          	addi	a5,s0,-100
40002fb0:	00078513          	mv	a0,a5
40002fb4:	c2dff0ef          	jal	ra,40002be0 <get_MAC>

	//print
	print256bit("PLAIN_TEXT (8200-bit) : 0xff..ff01\r\n\tKEY (256-bit): ", long_key);
40002fb8:	fcc40793          	addi	a5,s0,-52
40002fbc:	00078593          	mv	a1,a5
40002fc0:	400047b7          	lui	a5,0x40004
40002fc4:	ca478513          	addi	a0,a5,-860 # 40003ca4 <vga_simRes_h160_v120+0x9c>
40002fc8:	cb0ff0ef          	jal	ra,40002478 <print256bit>
	print128bit("RESULT (128-bit) : ", long_res);
40002fcc:	f9c40793          	addi	a5,s0,-100
40002fd0:	00078593          	mv	a1,a5
40002fd4:	400047b7          	lui	a5,0x40004
40002fd8:	c5878513          	addi	a0,a5,-936 # 40003c58 <vga_simRes_h160_v120+0x50>
40002fdc:	b80ff0ef          	jal	ra,4000235c <print128bit>

}
40002fe0:	00000013          	nop
40002fe4:	06c12083          	lw	ra,108(sp)
40002fe8:	06812403          	lw	s0,104(sp)
40002fec:	07010113          	addi	sp,sp,112
40002ff0:	00008067          	ret
