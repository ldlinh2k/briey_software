
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
80000064:	c0002097          	auipc	ra,0xc0002
80000068:	814080e7          	jalr	-2028(ra) # 40001878 <irqCallback>
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
800000b4:	c0005197          	auipc	gp,0xc0005
800000b8:	06c18193          	addi	gp,gp,108 # 40005120 <__global_pointer$>
800000bc:	00001117          	auipc	sp,0x1
800000c0:	88410113          	addi	sp,sp,-1916 # 80000940 <_stack_start>

800000c4 <bss_init>:
800000c4:	c0005517          	auipc	a0,0xc0005
800000c8:	85c50513          	addi	a0,a0,-1956 # 40004920 <_bss_end>
800000cc:	c0005597          	auipc	a1,0xc0005
800000d0:	85458593          	addi	a1,a1,-1964 # 40004920 <_bss_end>

800000d4 <bss_loop>:
800000d4:	00b50863          	beq	a0,a1,800000e4 <bss_done>
800000d8:	00052023          	sw	zero,0(a0)
800000dc:	00450513          	addi	a0,a0,4
800000e0:	ff5ff06f          	j	800000d4 <bss_loop>

800000e4 <bss_done>:
800000e4:	c0005517          	auipc	a0,0xc0005
800000e8:	83c50513          	addi	a0,a0,-1988 # 40004920 <_bss_end>
800000ec:	ffc10113          	addi	sp,sp,-4

800000f0 <ctors_loop>:
800000f0:	c0005597          	auipc	a1,0xc0005
800000f4:	83058593          	addi	a1,a1,-2000 # 40004920 <_bss_end>
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
40000344:	400047b7          	lui	a5,0x40004
40000348:	89878513          	addi	a0,a5,-1896 # 40003898 <vga_simRes_h160_v120+0x20>
4000034c:	57c020ef          	jal	ra,400028c8 <print>
	print("\r\n");
40000350:	400047b7          	lui	a5,0x40004
40000354:	8f878513          	addi	a0,a5,-1800 # 400038f8 <vga_simRes_h160_v120+0x80>
40000358:	570020ef          	jal	ra,400028c8 <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
4000035c:	fe442583          	lw	a1,-28(s0)
40000360:	400047b7          	lui	a5,0x40004
40000364:	8fc78513          	addi	a0,a5,-1796 # 400038fc <vga_simRes_h160_v120+0x84>
40000368:	7c8020ef          	jal	ra,40002b30 <print64bit>
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
40000610:	400047b7          	lui	a5,0x40004
40000614:	91878513          	addi	a0,a5,-1768 # 40003918 <vga_simRes_h160_v120+0xa0>
40000618:	6a4020ef          	jal	ra,40002cbc <print256bit>
	print512bit("RESULT (512-bit) : ", res);
4000061c:	fdc42583          	lw	a1,-36(s0)
40000620:	400047b7          	lui	a5,0x40004
40000624:	92c78513          	addi	a0,a5,-1748 # 4000392c <vga_simRes_h160_v120+0xb4>
40000628:	77c020ef          	jal	ra,40002da4 <print512bit>
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
40000a44:	400047b7          	lui	a5,0x40004
40000a48:	9a078513          	addi	a0,a5,-1632 # 400039a0 <vga_simRes_h160_v120+0x20>
40000a4c:	67d010ef          	jal	ra,400028c8 <print>
40000a50:	0100006f          	j	40000a60 <prince_cipher+0x12c>
40000a54:	400047b7          	lui	a5,0x40004
40000a58:	9f478513          	addi	a0,a5,-1548 # 400039f4 <vga_simRes_h160_v120+0x74>
40000a5c:	66d010ef          	jal	ra,400028c8 <print>
40000a60:	400047b7          	lui	a5,0x40004
40000a64:	a4878513          	addi	a0,a5,-1464 # 40003a48 <vga_simRes_h160_v120+0xc8>
40000a68:	661010ef          	jal	ra,400028c8 <print>
40000a6c:	fe442583          	lw	a1,-28(s0)
40000a70:	400047b7          	lui	a5,0x40004
40000a74:	a4c78513          	addi	a0,a5,-1460 # 40003a4c <vga_simRes_h160_v120+0xcc>
40000a78:	0b8020ef          	jal	ra,40002b30 <print64bit>
40000a7c:	fe842583          	lw	a1,-24(s0)
40000a80:	400047b7          	lui	a5,0x40004
40000a84:	a6478513          	addi	a0,a5,-1436 # 40003a64 <vga_simRes_h160_v120+0xe4>
40000a88:	118020ef          	jal	ra,40002ba0 <print128bit>
40000a8c:	fe042583          	lw	a1,-32(s0)
40000a90:	400047b7          	lui	a5,0x40004
40000a94:	a7878513          	addi	a0,a5,-1416 # 40003a78 <vga_simRes_h160_v120+0xf8>
40000a98:	098020ef          	jal	ra,40002b30 <print64bit>
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
40000d24:	eb010113          	addi	sp,sp,-336
40000d28:	14112623          	sw	ra,332(sp)
40000d2c:	14812423          	sw	s0,328(sp)
40000d30:	15010413          	addi	s0,sp,336
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

	//AES
	print("\r\t*********************************AES TEST***********************************\r\n");
40000d5c:	400047b7          	lui	a5,0x40004
40000d60:	aec78513          	addi	a0,a5,-1300 # 40003aec <vga_simRes_h160_v120+0x20>
40000d64:	365010ef          	jal	ra,400028c8 <print>
	    unsigned int aes_key_128[4] = {0x0, 0x0, 0x0, 0x0};
40000d68:	fc042823          	sw	zero,-48(s0)
40000d6c:	fc042a23          	sw	zero,-44(s0)
40000d70:	fc042c23          	sw	zero,-40(s0)
40000d74:	fc042e23          	sw	zero,-36(s0)
	    unsigned int aes_block[4] 	= {0x0, 0x0, 0x0, 0x0};
40000d78:	fc042023          	sw	zero,-64(s0)
40000d7c:	fc042223          	sw	zero,-60(s0)
40000d80:	fc042423          	sw	zero,-56(s0)
40000d84:	fc042623          	sw	zero,-52(s0)

	    unsigned int aes_res[4] 	= {0x0, 0x0, 0x0, 0x0};
40000d88:	fa042823          	sw	zero,-80(s0)
40000d8c:	fa042a23          	sw	zero,-76(s0)
40000d90:	fa042c23          	sw	zero,-72(s0)
40000d94:	fa042e23          	sw	zero,-68(s0)

	    print("\r\n\t=================================TEST 1=====================================\r\n");
40000d98:	400047b7          	lui	a5,0x40004
40000d9c:	b4078513          	addi	a0,a5,-1216 # 40003b40 <vga_simRes_h160_v120+0x74>
40000da0:	329010ef          	jal	ra,400028c8 <print>
	    aes_block[3] 	= 0x33343536;
40000da4:	333437b7          	lui	a5,0x33343
40000da8:	53678793          	addi	a5,a5,1334 # 33343536 <_stack_size+0x33342d36>
40000dac:	fcf42623          	sw	a5,-52(s0)
	    aes_block[2] 	= 0x39303132;
40000db0:	393037b7          	lui	a5,0x39303
40000db4:	13278793          	addi	a5,a5,306 # 39303132 <_stack_size+0x39302932>
40000db8:	fcf42423          	sw	a5,-56(s0)
	    aes_block[1] 	= 0x35363738;
40000dbc:	353637b7          	lui	a5,0x35363
40000dc0:	73878793          	addi	a5,a5,1848 # 35363738 <_stack_size+0x35362f38>
40000dc4:	fcf42223          	sw	a5,-60(s0)
	    aes_block[0] 	= 0x31323334;
40000dc8:	313237b7          	lui	a5,0x31323
40000dcc:	33478793          	addi	a5,a5,820 # 31323334 <_stack_size+0x31322b34>
40000dd0:	fcf42023          	sw	a5,-64(s0)

		aes_key_128[3] 	= 0x37363534;
40000dd4:	373637b7          	lui	a5,0x37363
40000dd8:	53478793          	addi	a5,a5,1332 # 37363534 <_stack_size+0x37362d34>
40000ddc:	fcf42e23          	sw	a5,-36(s0)
	    aes_key_128[2] 	= 0x31303938;
40000de0:	313047b7          	lui	a5,0x31304
40000de4:	93878793          	addi	a5,a5,-1736 # 31303938 <_stack_size+0x31303138>
40000de8:	fcf42c23          	sw	a5,-40(s0)
	    aes_key_128[1] 	= 0x35343332;
40000dec:	353437b7          	lui	a5,0x35343
40000df0:	33278793          	addi	a5,a5,818 # 35343332 <_stack_size+0x35342b32>
40000df4:	fcf42a23          	sw	a5,-44(s0)
	    aes_key_128[0]	= 0x39383736;
40000df8:	393837b7          	lui	a5,0x39383
40000dfc:	73678793          	addi	a5,a5,1846 # 39383736 <_stack_size+0x39382f36>
40000e00:	fcf42823          	sw	a5,-48(s0)

	   	aes_128_cipher(AES_OP_EN, aes_key_128, aes_block, aes_res);
40000e04:	fb040693          	addi	a3,s0,-80
40000e08:	fc040713          	addi	a4,s0,-64
40000e0c:	fd040793          	addi	a5,s0,-48
40000e10:	00070613          	mv	a2,a4
40000e14:	00078593          	mv	a1,a5
40000e18:	00100513          	li	a0,1
40000e1c:	38c010ef          	jal	ra,400021a8 <aes_128_cipher>
	   	print("\r\n\t=================================TEST 2=====================================\r\n");
40000e20:	400047b7          	lui	a5,0x40004
40000e24:	b9478513          	addi	a0,a5,-1132 # 40003b94 <vga_simRes_h160_v120+0xc8>
40000e28:	2a1010ef          	jal	ra,400028c8 <print>

	    aes_block[3] 	= 0xa1e33d0b;
40000e2c:	a1e347b7          	lui	a5,0xa1e34
40000e30:	d0b78793          	addi	a5,a5,-757 # a1e33d0b <_stack_start+0x21e333cb>
40000e34:	fcf42623          	sw	a5,-52(s0)
	    aes_block[2] 	= 0xd07781b2;
40000e38:	d07787b7          	lui	a5,0xd0778
40000e3c:	1b278793          	addi	a5,a5,434 # d07781b2 <_stack_start+0x50777872>
40000e40:	fcf42423          	sw	a5,-56(s0)
	    aes_block[1] 	= 0x53e5f4da;
40000e44:	53e5f7b7          	lui	a5,0x53e5f
40000e48:	4da78793          	addi	a5,a5,1242 # 53e5f4da <__global_pointer$+0x13e5a3ba>
40000e4c:	fcf42223          	sw	a5,-60(s0)
	    aes_block[0] 	= 0x6f2f5312;
40000e50:	6f2f57b7          	lui	a5,0x6f2f5
40000e54:	31278793          	addi	a5,a5,786 # 6f2f5312 <__global_pointer$+0x2f2f01f2>
40000e58:	fcf42023          	sw	a5,-64(s0)

	    //USE THE SAME KEY

	   	aes_128_cipher(AES_OP_DE, aes_key_128, aes_block, aes_res);
40000e5c:	fb040693          	addi	a3,s0,-80
40000e60:	fc040713          	addi	a4,s0,-64
40000e64:	fd040793          	addi	a5,s0,-48
40000e68:	00070613          	mv	a2,a4
40000e6c:	00078593          	mv	a1,a5
40000e70:	00000513          	li	a0,0
40000e74:	334010ef          	jal	ra,400021a8 <aes_128_cipher>
	   	print("\r\n\t=================================TEST 3=====================================\r\n");
40000e78:	400047b7          	lui	a5,0x40004
40000e7c:	be878513          	addi	a0,a5,-1048 # 40003be8 <vga_simRes_h160_v120+0x11c>
40000e80:	249010ef          	jal	ra,400028c8 <print>

	    aes_block[3] 	= 0x7393172a;
40000e84:	739317b7          	lui	a5,0x73931
40000e88:	72a78793          	addi	a5,a5,1834 # 7393172a <__global_pointer$+0x3392c60a>
40000e8c:	fcf42623          	sw	a5,-52(s0)
	    aes_block[2] 	= 0xe93d7e11;
40000e90:	e93d87b7          	lui	a5,0xe93d8
40000e94:	e1178793          	addi	a5,a5,-495 # e93d7e11 <_stack_start+0x693d74d1>
40000e98:	fcf42423          	sw	a5,-56(s0)
	    aes_block[1] 	= 0x2e409f96;
40000e9c:	2e40a7b7          	lui	a5,0x2e40a
40000ea0:	f9678793          	addi	a5,a5,-106 # 2e409f96 <_stack_size+0x2e409796>
40000ea4:	fcf42223          	sw	a5,-60(s0)
	    aes_block[0] 	= 0x6bc1bee2;
40000ea8:	6bc1c7b7          	lui	a5,0x6bc1c
40000eac:	ee278793          	addi	a5,a5,-286 # 6bc1bee2 <__global_pointer$+0x2bc16dc2>
40000eb0:	fcf42023          	sw	a5,-64(s0)

		aes_key_128[3] 	= 0x09cf4f3c;
40000eb4:	09cf57b7          	lui	a5,0x9cf5
40000eb8:	f3c78793          	addi	a5,a5,-196 # 9cf4f3c <_stack_size+0x9cf473c>
40000ebc:	fcf42e23          	sw	a5,-36(s0)
	    aes_key_128[2] 	= 0xabf71588;
40000ec0:	abf717b7          	lui	a5,0xabf71
40000ec4:	58878793          	addi	a5,a5,1416 # abf71588 <_stack_start+0x2bf70c48>
40000ec8:	fcf42c23          	sw	a5,-40(s0)
	    aes_key_128[1] 	= 0x28aed2a6;
40000ecc:	28aed7b7          	lui	a5,0x28aed
40000ed0:	2a678793          	addi	a5,a5,678 # 28aed2a6 <_stack_size+0x28aecaa6>
40000ed4:	fcf42a23          	sw	a5,-44(s0)
	    aes_key_128[0]	= 0x2b7e1516;
40000ed8:	2b7e17b7          	lui	a5,0x2b7e1
40000edc:	51678793          	addi	a5,a5,1302 # 2b7e1516 <_stack_size+0x2b7e0d16>
40000ee0:	fcf42823          	sw	a5,-48(s0)
	   	aes_128_cipher(AES_OP_EN, aes_key_128, aes_block, aes_res);
40000ee4:	fb040693          	addi	a3,s0,-80
40000ee8:	fc040713          	addi	a4,s0,-64
40000eec:	fd040793          	addi	a5,s0,-48
40000ef0:	00070613          	mv	a2,a4
40000ef4:	00078593          	mv	a1,a5
40000ef8:	00100513          	li	a0,1
40000efc:	2ac010ef          	jal	ra,400021a8 <aes_128_cipher>
	   	print("\r\n\t=================================TEST 4=====================================\r\n");
40000f00:	400047b7          	lui	a5,0x40004
40000f04:	c3c78513          	addi	a0,a5,-964 # 40003c3c <vga_simRes_h160_v120+0x170>
40000f08:	1c1010ef          	jal	ra,400028c8 <print>

	    aes_block[3] 	= 0x2466ef97;
40000f0c:	2466f7b7          	lui	a5,0x2466f
40000f10:	f9778793          	addi	a5,a5,-105 # 2466ef97 <_stack_size+0x2466e797>
40000f14:	fcf42623          	sw	a5,-52(s0)
	    aes_block[2] 	= 0xa89ecaf3;
40000f18:	a89ed7b7          	lui	a5,0xa89ed
40000f1c:	af378793          	addi	a5,a5,-1293 # a89ecaf3 <_stack_start+0x289ec1b3>
40000f20:	fcf42423          	sw	a5,-56(s0)
	    aes_block[1] 	= 0x0d7a3660;
40000f24:	0d7a37b7          	lui	a5,0xd7a3
40000f28:	66078793          	addi	a5,a5,1632 # d7a3660 <_stack_size+0xd7a2e60>
40000f2c:	fcf42223          	sw	a5,-60(s0)
	    aes_block[0] 	= 0x3ad77bb4;
40000f30:	3ad787b7          	lui	a5,0x3ad78
40000f34:	bb478793          	addi	a5,a5,-1100 # 3ad77bb4 <_stack_size+0x3ad773b4>
40000f38:	fcf42023          	sw	a5,-64(s0)

	    //USE THE SAME KEY

	   	aes_128_cipher(AES_OP_DE, aes_key_128, aes_block, aes_res);
40000f3c:	fb040693          	addi	a3,s0,-80
40000f40:	fc040713          	addi	a4,s0,-64
40000f44:	fd040793          	addi	a5,s0,-48
40000f48:	00070613          	mv	a2,a4
40000f4c:	00078593          	mv	a1,a5
40000f50:	00000513          	li	a0,0
40000f54:	254010ef          	jal	ra,400021a8 <aes_128_cipher>


	   	print("\r\n\t========================================TEST 5(AES256)==========================================\r\n");
40000f58:	400047b7          	lui	a5,0x40004
40000f5c:	c9078513          	addi	a0,a5,-880 # 40003c90 <vga_simRes_h160_v120+0x1c4>
40000f60:	169010ef          	jal	ra,400028c8 <print>
	    unsigned int aes_key_256[8] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
40000f64:	f8042823          	sw	zero,-112(s0)
40000f68:	f8042a23          	sw	zero,-108(s0)
40000f6c:	f8042c23          	sw	zero,-104(s0)
40000f70:	f8042e23          	sw	zero,-100(s0)
40000f74:	fa042023          	sw	zero,-96(s0)
40000f78:	fa042223          	sw	zero,-92(s0)
40000f7c:	fa042423          	sw	zero,-88(s0)
40000f80:	fa042623          	sw	zero,-84(s0)

	    aes_block[3] 	= 0x7393172a;
40000f84:	739317b7          	lui	a5,0x73931
40000f88:	72a78793          	addi	a5,a5,1834 # 7393172a <__global_pointer$+0x3392c60a>
40000f8c:	fcf42623          	sw	a5,-52(s0)
	    aes_block[2] 	= 0xe93d7e11;
40000f90:	e93d87b7          	lui	a5,0xe93d8
40000f94:	e1178793          	addi	a5,a5,-495 # e93d7e11 <_stack_start+0x693d74d1>
40000f98:	fcf42423          	sw	a5,-56(s0)
	    aes_block[1] 	= 0x2e409f96;
40000f9c:	2e40a7b7          	lui	a5,0x2e40a
40000fa0:	f9678793          	addi	a5,a5,-106 # 2e409f96 <_stack_size+0x2e409796>
40000fa4:	fcf42223          	sw	a5,-60(s0)
	    aes_block[0] 	= 0x6bc1bee2;
40000fa8:	6bc1c7b7          	lui	a5,0x6bc1c
40000fac:	ee278793          	addi	a5,a5,-286 # 6bc1bee2 <__global_pointer$+0x2bc16dc2>
40000fb0:	fcf42023          	sw	a5,-64(s0)

	    aes_key_256[7] 	= 0x0914dff4;
40000fb4:	0914e7b7          	lui	a5,0x914e
40000fb8:	ff478793          	addi	a5,a5,-12 # 914dff4 <_stack_size+0x914d7f4>
40000fbc:	faf42623          	sw	a5,-84(s0)
	    aes_key_256[6] 	= 0x2d9810a3;
40000fc0:	2d9817b7          	lui	a5,0x2d981
40000fc4:	0a378793          	addi	a5,a5,163 # 2d9810a3 <_stack_size+0x2d9808a3>
40000fc8:	faf42423          	sw	a5,-88(s0)
	    aes_key_256[5] 	= 0x3b6108d7;
40000fcc:	3b6117b7          	lui	a5,0x3b611
40000fd0:	8d778793          	addi	a5,a5,-1833 # 3b6108d7 <_stack_size+0x3b6100d7>
40000fd4:	faf42223          	sw	a5,-92(s0)
	    aes_key_256[4]	= 0x1f352c07;
40000fd8:	1f3537b7          	lui	a5,0x1f353
40000fdc:	c0778793          	addi	a5,a5,-1017 # 1f352c07 <_stack_size+0x1f352407>
40000fe0:	faf42023          	sw	a5,-96(s0)
	    aes_key_256[3] 	= 0x857d7781;
40000fe4:	857d77b7          	lui	a5,0x857d7
40000fe8:	78178793          	addi	a5,a5,1921 # 857d7781 <_stack_start+0x57d6e41>
40000fec:	f8f42e23          	sw	a5,-100(s0)
	    aes_key_256[2] 	= 0x2b73aef0;
40000ff0:	2b73b7b7          	lui	a5,0x2b73b
40000ff4:	ef078793          	addi	a5,a5,-272 # 2b73aef0 <_stack_size+0x2b73a6f0>
40000ff8:	f8f42c23          	sw	a5,-104(s0)
	    aes_key_256[1] 	= 0x15ca71be;
40000ffc:	15ca77b7          	lui	a5,0x15ca7
40001000:	1be78793          	addi	a5,a5,446 # 15ca71be <_stack_size+0x15ca69be>
40001004:	f8f42a23          	sw	a5,-108(s0)
	    aes_key_256[0]	= 0x603deb10;
40001008:	603df7b7          	lui	a5,0x603df
4000100c:	b1078793          	addi	a5,a5,-1264 # 603deb10 <__global_pointer$+0x203d99f0>
40001010:	f8f42823          	sw	a5,-112(s0)

	    aes_256_cipher(AES_OP_EN, aes_key_256, aes_block, aes_res);
40001014:	fb040693          	addi	a3,s0,-80
40001018:	fc040713          	addi	a4,s0,-64
4000101c:	f9040793          	addi	a5,s0,-112
40001020:	00070613          	mv	a2,a4
40001024:	00078593          	mv	a1,a5
40001028:	00100513          	li	a0,1
4000102c:	3d4010ef          	jal	ra,40002400 <aes_256_cipher>


	   	print("\r\n\t========================================TEST 6(AES256)==========================================\r\n");
40001030:	400047b7          	lui	a5,0x40004
40001034:	cf878513          	addi	a0,a5,-776 # 40003cf8 <vga_simRes_h160_v120+0x22c>
40001038:	091010ef          	jal	ra,400028c8 <print>
	    aes_block[3] 	= 0x3db181f8 ;
4000103c:	3db187b7          	lui	a5,0x3db18
40001040:	1f878793          	addi	a5,a5,504 # 3db181f8 <_stack_size+0x3db179f8>
40001044:	fcf42623          	sw	a5,-52(s0)
	    aes_block[2] 	= 0x064b5a7e ;
40001048:	064b67b7          	lui	a5,0x64b6
4000104c:	a7e78793          	addi	a5,a5,-1410 # 64b5a7e <_stack_size+0x64b527e>
40001050:	fcf42423          	sw	a5,-56(s0)
	    aes_block[1] 	= 0xb5d2a03c;
40001054:	b5d2a7b7          	lui	a5,0xb5d2a
40001058:	03c78793          	addi	a5,a5,60 # b5d2a03c <_stack_start+0x35d296fc>
4000105c:	fcf42223          	sw	a5,-60(s0)
	    aes_block[0] 	= 0xf3eed1bd;
40001060:	f3eed7b7          	lui	a5,0xf3eed
40001064:	1bd78793          	addi	a5,a5,445 # f3eed1bd <_stack_start+0x73eec87d>
40001068:	fcf42023          	sw	a5,-64(s0)

	    aes_key_256[7] 	= 0x0914dff4;
4000106c:	0914e7b7          	lui	a5,0x914e
40001070:	ff478793          	addi	a5,a5,-12 # 914dff4 <_stack_size+0x914d7f4>
40001074:	faf42623          	sw	a5,-84(s0)
	    aes_key_256[6] 	= 0x2d9810a3;
40001078:	2d9817b7          	lui	a5,0x2d981
4000107c:	0a378793          	addi	a5,a5,163 # 2d9810a3 <_stack_size+0x2d9808a3>
40001080:	faf42423          	sw	a5,-88(s0)
	    aes_key_256[5] 	= 0x3b6108d7;
40001084:	3b6117b7          	lui	a5,0x3b611
40001088:	8d778793          	addi	a5,a5,-1833 # 3b6108d7 <_stack_size+0x3b6100d7>
4000108c:	faf42223          	sw	a5,-92(s0)
	    aes_key_256[4]	= 0x1f352c07;
40001090:	1f3537b7          	lui	a5,0x1f353
40001094:	c0778793          	addi	a5,a5,-1017 # 1f352c07 <_stack_size+0x1f352407>
40001098:	faf42023          	sw	a5,-96(s0)
	    aes_key_256[3] 	= 0x857d7781;
4000109c:	857d77b7          	lui	a5,0x857d7
400010a0:	78178793          	addi	a5,a5,1921 # 857d7781 <_stack_start+0x57d6e41>
400010a4:	f8f42e23          	sw	a5,-100(s0)
	    aes_key_256[2] 	= 0x2b73aef0;
400010a8:	2b73b7b7          	lui	a5,0x2b73b
400010ac:	ef078793          	addi	a5,a5,-272 # 2b73aef0 <_stack_size+0x2b73a6f0>
400010b0:	f8f42c23          	sw	a5,-104(s0)
	    aes_key_256[1] 	= 0x15ca71be;
400010b4:	15ca77b7          	lui	a5,0x15ca7
400010b8:	1be78793          	addi	a5,a5,446 # 15ca71be <_stack_size+0x15ca69be>
400010bc:	f8f42a23          	sw	a5,-108(s0)
	    aes_key_256[0]	= 0x603deb10;
400010c0:	603df7b7          	lui	a5,0x603df
400010c4:	b1078793          	addi	a5,a5,-1264 # 603deb10 <__global_pointer$+0x203d99f0>
400010c8:	f8f42823          	sw	a5,-112(s0)

	    aes_256_cipher(AES_OP_DE, aes_key_256, aes_block, aes_res);
400010cc:	fb040693          	addi	a3,s0,-80
400010d0:	fc040713          	addi	a4,s0,-64
400010d4:	f9040793          	addi	a5,s0,-112
400010d8:	00070613          	mv	a2,a4
400010dc:	00078593          	mv	a1,a5
400010e0:	00000513          	li	a0,0
400010e4:	31c010ef          	jal	ra,40002400 <aes_256_cipher>

	//POLY1305
	print("\r\n");
400010e8:	400047b7          	lui	a5,0x40004
400010ec:	d6078513          	addi	a0,a5,-672 # 40003d60 <vga_simRes_h160_v120+0x294>
400010f0:	7d8010ef          	jal	ra,400028c8 <print>
	print("\r\t*****************************************POLY1305 TEST************************************\r\n");
400010f4:	400047b7          	lui	a5,0x40004
400010f8:	d6478513          	addi	a0,a5,-668 # 40003d64 <vga_simRes_h160_v120+0x298>
400010fc:	7cc010ef          	jal	ra,400028c8 <print>
	uint32_t poly_key[8] 	= {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
40001100:	f6042823          	sw	zero,-144(s0)
40001104:	f6042a23          	sw	zero,-140(s0)
40001108:	f6042c23          	sw	zero,-136(s0)
4000110c:	f6042e23          	sw	zero,-132(s0)
40001110:	f8042023          	sw	zero,-128(s0)
40001114:	f8042223          	sw	zero,-124(s0)
40001118:	f8042423          	sw	zero,-120(s0)
4000111c:	f8042623          	sw	zero,-116(s0)
	uint32_t poly_block[4] 	= {0x0, 0x0,0x0,0x0};
40001120:	f6042023          	sw	zero,-160(s0)
40001124:	f6042223          	sw	zero,-156(s0)
40001128:	f6042423          	sw	zero,-152(s0)
4000112c:	f6042623          	sw	zero,-148(s0)
	uint32_t poly_res[4] 	= {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
40001130:	f4042823          	sw	zero,-176(s0)
40001134:	f4042a23          	sw	zero,-172(s0)
40001138:	f4042c23          	sw	zero,-168(s0)
4000113c:	f4042e23          	sw	zero,-164(s0)
	print("\r\n\t==========================================TEST 1==========================================\r\n");
40001140:	400047b7          	lui	a5,0x40004
40001144:	dc478513          	addi	a0,a5,-572 # 40003dc4 <vga_simRes_h160_v120+0x2f8>
40001148:	780010ef          	jal	ra,400028c8 <print>
	//key 85d6be78 57556d33 7f4452fe 42d506a8 0103808a fb0db2fd 4abff6af 4149f51b
	//0 bytes message
	//res expec: h0103808a fb0db2fd 4abff6af 4149f51b
	poly_key[7]= 0x85d6be78;
4000114c:	85d6c7b7          	lui	a5,0x85d6c
40001150:	e7878793          	addi	a5,a5,-392 # 85d6be78 <_stack_start+0x5d6b538>
40001154:	f8f42623          	sw	a5,-116(s0)
	poly_key[6]= 0x57556d33;
40001158:	575577b7          	lui	a5,0x57557
4000115c:	d3378793          	addi	a5,a5,-717 # 57556d33 <__global_pointer$+0x17551c13>
40001160:	f8f42423          	sw	a5,-120(s0)
	poly_key[5]= 0x7f4452fe;
40001164:	7f4457b7          	lui	a5,0x7f445
40001168:	2fe78793          	addi	a5,a5,766 # 7f4452fe <__global_pointer$+0x3f4401de>
4000116c:	f8f42223          	sw	a5,-124(s0)
	poly_key[4]= 0x42d506a8;
40001170:	42d507b7          	lui	a5,0x42d50
40001174:	6a878793          	addi	a5,a5,1704 # 42d506a8 <__global_pointer$+0x2d4b588>
40001178:	f8f42023          	sw	a5,-128(s0)
	poly_key[3]= 0x0103808a;
4000117c:	010387b7          	lui	a5,0x1038
40001180:	08a78793          	addi	a5,a5,138 # 103808a <_stack_size+0x103788a>
40001184:	f6f42e23          	sw	a5,-132(s0)
	poly_key[2]= 0xfb0db2fd;
40001188:	fb0db7b7          	lui	a5,0xfb0db
4000118c:	2fd78793          	addi	a5,a5,765 # fb0db2fd <_stack_start+0x7b0da9bd>
40001190:	f6f42c23          	sw	a5,-136(s0)
	poly_key[1]= 0x4abff6af;
40001194:	4abff7b7          	lui	a5,0x4abff
40001198:	6af78793          	addi	a5,a5,1711 # 4abff6af <__global_pointer$+0xabfa58f>
4000119c:	f6f42a23          	sw	a5,-140(s0)
	poly_key[0]= 0x4149f51b;
400011a0:	4149f7b7          	lui	a5,0x4149f
400011a4:	51b78793          	addi	a5,a5,1307 # 4149f51b <__global_pointer$+0x149a3fb>
400011a8:	f6f42823          	sw	a5,-144(s0)

	poly_test_N_bytes(0,poly_key,poly_block,poly_res);
400011ac:	f5040693          	addi	a3,s0,-176
400011b0:	f6040713          	addi	a4,s0,-160
400011b4:	f7040793          	addi	a5,s0,-144
400011b8:	00070613          	mv	a2,a4
400011bc:	00078593          	mv	a1,a5
400011c0:	00000513          	li	a0,0
400011c4:	30c020ef          	jal	ra,400034d0 <poly_test_N_bytes>
	print("\r\n\t==========================================TEST 2==========================================\r\n");
400011c8:	400047b7          	lui	a5,0x40004
400011cc:	e2478513          	addi	a0,a5,-476 # 40003e24 <vga_simRes_h160_v120+0x358>
400011d0:	6f8010ef          	jal	ra,400028c8 <print>
	poly_block[3] = 0x31000000;
400011d4:	310007b7          	lui	a5,0x31000
400011d8:	f6f42623          	sw	a5,-148(s0)
	//USE THE SAME KEY
	//res expec: h8097ddf5_19b7f412_0b57fabf_925a19ac
	//1 byte message: 31
	poly_test_N_bytes(1,poly_key,poly_block,poly_res);
400011dc:	f5040693          	addi	a3,s0,-176
400011e0:	f6040713          	addi	a4,s0,-160
400011e4:	f7040793          	addi	a5,s0,-144
400011e8:	00070613          	mv	a2,a4
400011ec:	00078593          	mv	a1,a5
400011f0:	00100513          	li	a0,1
400011f4:	2dc020ef          	jal	ra,400034d0 <poly_test_N_bytes>

	print("\r\n\t==========================================TEST 3==========================================\r\n");
400011f8:	400047b7          	lui	a5,0x40004
400011fc:	e8478513          	addi	a0,a5,-380 # 40003e84 <vga_simRes_h160_v120+0x3b8>
40001200:	6c8010ef          	jal	ra,400028c8 <print>
	//res expec: ha8061dc1_305136c6_c22b8baf_0c0127a9
	poly_test_rfc8439();
40001204:	358020ef          	jal	ra,4000355c <poly_test_rfc8439>

	print("\r\n\t==========================================TEST 4==========================================\r\n");
40001208:	400047b7          	lui	a5,0x40004
4000120c:	ee478513          	addi	a0,a5,-284 # 40003ee4 <vga_simRes_h160_v120+0x418>
40001210:	6b8010ef          	jal	ra,400028c8 <print>
	//res expec: hdc0964e5 ce9cd7d9 a7571faf a5dc0473
	poly_test_long();
40001214:	50c020ef          	jal	ra,40003720 <poly_test_long>
	//ab
	//CHACHA
	print("\r\n");
40001218:	400047b7          	lui	a5,0x40004
4000121c:	d6078513          	addi	a0,a5,-672 # 40003d60 <vga_simRes_h160_v120+0x294>
40001220:	6a8010ef          	jal	ra,400028c8 <print>
	print("\r\t*****************************************CHACHA TEST**************************************\r\n");
40001224:	400047b7          	lui	a5,0x40004
40001228:	f4478513          	addi	a0,a5,-188 # 40003f44 <vga_simRes_h160_v120+0x478>
4000122c:	69c010ef          	jal	ra,400028c8 <print>
	uint32_t chacha_key[8] 		= {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
40001230:	f2042823          	sw	zero,-208(s0)
40001234:	f2042a23          	sw	zero,-204(s0)
40001238:	f2042c23          	sw	zero,-200(s0)
4000123c:	f2042e23          	sw	zero,-196(s0)
40001240:	f4042023          	sw	zero,-192(s0)
40001244:	f4042223          	sw	zero,-188(s0)
40001248:	f4042423          	sw	zero,-184(s0)
4000124c:	f4042623          	sw	zero,-180(s0)
	uint32_t chacha_block[2] 	= {0x0, 0x0};
40001250:	f2042423          	sw	zero,-216(s0)
40001254:	f2042623          	sw	zero,-212(s0)
	uint32_t chacha_res[15] 	= {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
40001258:	ee042623          	sw	zero,-276(s0)
4000125c:	ee042823          	sw	zero,-272(s0)
40001260:	ee042a23          	sw	zero,-268(s0)
40001264:	ee042c23          	sw	zero,-264(s0)
40001268:	ee042e23          	sw	zero,-260(s0)
4000126c:	f0042023          	sw	zero,-256(s0)
40001270:	f0042223          	sw	zero,-252(s0)
40001274:	f0042423          	sw	zero,-248(s0)
40001278:	f0042623          	sw	zero,-244(s0)
4000127c:	f0042823          	sw	zero,-240(s0)
40001280:	f0042a23          	sw	zero,-236(s0)
40001284:	f0042c23          	sw	zero,-232(s0)
40001288:	f0042e23          	sw	zero,-228(s0)
4000128c:	f2042023          	sw	zero,-224(s0)
40001290:	f2042223          	sw	zero,-220(s0)
	print("\r\n\t==========================================TEST 1==========================================\r\n");
40001294:	400047b7          	lui	a5,0x40004
40001298:	dc478513          	addi	a0,a5,-572 # 40003dc4 <vga_simRes_h160_v120+0x2f8>
4000129c:	62c010ef          	jal	ra,400028c8 <print>
	print("\r\n\t[All zeros, 128-bit key, 8 rounds]\r\n");
400012a0:	400047b7          	lui	a5,0x40004
400012a4:	fa478513          	addi	a0,a5,-92 # 40003fa4 <vga_simRes_h160_v120+0x4d8>
400012a8:	620010ef          	jal	ra,400028c8 <print>
	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,8,chacha_res);
400012ac:	eec40713          	addi	a4,s0,-276
400012b0:	f2840613          	addi	a2,s0,-216
400012b4:	f3040793          	addi	a5,s0,-208
400012b8:	00800693          	li	a3,8
400012bc:	00078593          	mv	a1,a5
400012c0:	00000513          	li	a0,0
400012c4:	854ff0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t[All zeros, 128-bit key, 12 rounds]\r\n");
400012c8:	400047b7          	lui	a5,0x40004
400012cc:	fcc78513          	addi	a0,a5,-52 # 40003fcc <vga_simRes_h160_v120+0x500>
400012d0:	5f8010ef          	jal	ra,400028c8 <print>
	resetBlock(chacha_block);
400012d4:	f2840793          	addi	a5,s0,-216
400012d8:	00078513          	mv	a0,a5
400012dc:	a15ff0ef          	jal	ra,40000cf0 <resetBlock>
	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,12,chacha_res);
400012e0:	eec40713          	addi	a4,s0,-276
400012e4:	f2840613          	addi	a2,s0,-216
400012e8:	f3040793          	addi	a5,s0,-208
400012ec:	00c00693          	li	a3,12
400012f0:	00078593          	mv	a1,a5
400012f4:	00000513          	li	a0,0
400012f8:	820ff0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t[All zeros, 128-bit key, 20 rounds]\r\n");
400012fc:	400047b7          	lui	a5,0x40004
40001300:	ff878513          	addi	a0,a5,-8 # 40003ff8 <vga_simRes_h160_v120+0x52c>
40001304:	5c4010ef          	jal	ra,400028c8 <print>
	resetBlock(chacha_block);
40001308:	f2840793          	addi	a5,s0,-216
4000130c:	00078513          	mv	a0,a5
40001310:	9e1ff0ef          	jal	ra,40000cf0 <resetBlock>
	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,20,chacha_res);
40001314:	eec40713          	addi	a4,s0,-276
40001318:	f2840613          	addi	a2,s0,-216
4000131c:	f3040793          	addi	a5,s0,-208
40001320:	01400693          	li	a3,20
40001324:	00078593          	mv	a1,a5
40001328:	00000513          	li	a0,0
4000132c:	fedfe0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t[All zeros, 256-bit key, 8 rounds]\r\n");
40001330:	400047b7          	lui	a5,0x40004
40001334:	02478513          	addi	a0,a5,36 # 40004024 <vga_simRes_h160_v120+0x558>
40001338:	590010ef          	jal	ra,400028c8 <print>
	resetBlock(chacha_block);
4000133c:	f2840793          	addi	a5,s0,-216
40001340:	00078513          	mv	a0,a5
40001344:	9adff0ef          	jal	ra,40000cf0 <resetBlock>
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,8,chacha_res);
40001348:	eec40713          	addi	a4,s0,-276
4000134c:	f2840613          	addi	a2,s0,-216
40001350:	f3040793          	addi	a5,s0,-208
40001354:	00800693          	li	a3,8
40001358:	00078593          	mv	a1,a5
4000135c:	00100513          	li	a0,1
40001360:	fb9fe0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t[All zeros, 256-bit key, 12 rounds]\r\n");
40001364:	400047b7          	lui	a5,0x40004
40001368:	04c78513          	addi	a0,a5,76 # 4000404c <vga_simRes_h160_v120+0x580>
4000136c:	55c010ef          	jal	ra,400028c8 <print>
	resetBlock(chacha_block);
40001370:	f2840793          	addi	a5,s0,-216
40001374:	00078513          	mv	a0,a5
40001378:	979ff0ef          	jal	ra,40000cf0 <resetBlock>
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,12,chacha_res);
4000137c:	eec40713          	addi	a4,s0,-276
40001380:	f2840613          	addi	a2,s0,-216
40001384:	f3040793          	addi	a5,s0,-208
40001388:	00c00693          	li	a3,12
4000138c:	00078593          	mv	a1,a5
40001390:	00100513          	li	a0,1
40001394:	f85fe0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t[All zeros, 256-bit key, 20 rounds]\r\n");
40001398:	400047b7          	lui	a5,0x40004
4000139c:	07878513          	addi	a0,a5,120 # 40004078 <vga_simRes_h160_v120+0x5ac>
400013a0:	528010ef          	jal	ra,400028c8 <print>
	resetBlock(chacha_block);
400013a4:	f2840793          	addi	a5,s0,-216
400013a8:	00078513          	mv	a0,a5
400013ac:	945ff0ef          	jal	ra,40000cf0 <resetBlock>
	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,20,chacha_res);
400013b0:	eec40713          	addi	a4,s0,-276
400013b4:	f2840613          	addi	a2,s0,-216
400013b8:	f3040793          	addi	a5,s0,-208
400013bc:	01400693          	li	a3,20
400013c0:	00078593          	mv	a1,a5
400013c4:	00100513          	li	a0,1
400013c8:	f51fe0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t==========================================TEST 2==========================================\r\n");
400013cc:	400047b7          	lui	a5,0x40004
400013d0:	e2478513          	addi	a0,a5,-476 # 40003e24 <vga_simRes_h160_v120+0x358>
400013d4:	4f4010ef          	jal	ra,400028c8 <print>
	print("\r\n\t[256-bit key, 8 rounds]\r\n");
400013d8:	400047b7          	lui	a5,0x40004
400013dc:	0a478513          	addi	a0,a5,164 # 400040a4 <vga_simRes_h160_v120+0x5d8>
400013e0:	4e8010ef          	jal	ra,400028c8 <print>
	chacha_block[1]=0x0f1e2d3c;
400013e4:	0f1e37b7          	lui	a5,0xf1e3
400013e8:	d3c78793          	addi	a5,a5,-708 # f1e2d3c <_stack_size+0xf1e253c>
400013ec:	f2f42623          	sw	a5,-212(s0)
	chacha_block[0]=0x4b596877;
400013f0:	4b5977b7          	lui	a5,0x4b597
400013f4:	87778793          	addi	a5,a5,-1929 # 4b596877 <__global_pointer$+0xb591757>
400013f8:	f2f42423          	sw	a5,-216(s0)

	chacha_key[7]=	0x00112233;
400013fc:	001127b7          	lui	a5,0x112
40001400:	23378793          	addi	a5,a5,563 # 112233 <_stack_size+0x111a33>
40001404:	f4f42623          	sw	a5,-180(s0)
	chacha_key[6]=	0x44556677;
40001408:	445567b7          	lui	a5,0x44556
4000140c:	67778793          	addi	a5,a5,1655 # 44556677 <__global_pointer$+0x4551557>
40001410:	f4f42423          	sw	a5,-184(s0)
	chacha_key[5]=	0x8899aabb;
40001414:	8899b7b7          	lui	a5,0x8899b
40001418:	abb78793          	addi	a5,a5,-1349 # 8899aabb <_stack_start+0x899a17b>
4000141c:	f4f42223          	sw	a5,-188(s0)
	chacha_key[4]=	0xccddeeff;
40001420:	ccddf7b7          	lui	a5,0xccddf
40001424:	eff78793          	addi	a5,a5,-257 # ccddeeff <_stack_start+0x4cdde5bf>
40001428:	f4f42023          	sw	a5,-192(s0)
	chacha_key[3]=	0xffeeddcc;
4000142c:	ffeee7b7          	lui	a5,0xffeee
40001430:	dcc78793          	addi	a5,a5,-564 # ffeeddcc <_stack_start+0x7feed48c>
40001434:	f2f42e23          	sw	a5,-196(s0)
	chacha_key[2]=	0xbbaa9988;
40001438:	bbaaa7b7          	lui	a5,0xbbaaa
4000143c:	98878793          	addi	a5,a5,-1656 # bbaa9988 <_stack_start+0x3baa9048>
40001440:	f2f42c23          	sw	a5,-200(s0)
	chacha_key[1]=	0x77665544;
40001444:	776657b7          	lui	a5,0x77665
40001448:	54478793          	addi	a5,a5,1348 # 77665544 <__global_pointer$+0x37660424>
4000144c:	f2f42a23          	sw	a5,-204(s0)
	chacha_key[0]= 	0x33221100;
40001450:	332217b7          	lui	a5,0x33221
40001454:	10078793          	addi	a5,a5,256 # 33221100 <_stack_size+0x33220900>
40001458:	f2f42823          	sw	a5,-208(s0)

	chacha_cipher(KEY_256_BITS,chacha_key,chacha_block,8,chacha_res);
4000145c:	eec40713          	addi	a4,s0,-276
40001460:	f2840613          	addi	a2,s0,-216
40001464:	f3040793          	addi	a5,s0,-208
40001468:	00800693          	li	a3,8
4000146c:	00078593          	mv	a1,a5
40001470:	00100513          	li	a0,1
40001474:	ea5fe0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t==========================================TEST 3==========================================\r\n");
40001478:	400047b7          	lui	a5,0x40004
4000147c:	e8478513          	addi	a0,a5,-380 # 40003e84 <vga_simRes_h160_v120+0x3b8>
40001480:	448010ef          	jal	ra,400028c8 <print>
	print("\r\n\t[All bits in key and IV are set. 128 bit key, 8 rounds]\r\n");
40001484:	400047b7          	lui	a5,0x40004
40001488:	0c478513          	addi	a0,a5,196 # 400040c4 <vga_simRes_h160_v120+0x5f8>
4000148c:	43c010ef          	jal	ra,400028c8 <print>
	//h2204d5b81ce662193e00966034f91302f14a3fb047f58b6e6ef0d721132304163e0fb640d76ff9c3b9cd99996e6e38fad13f0e31c82244d33abbc1b11e8bf12d
	chacha_block[1]=0xffffffff;
40001490:	fff00793          	li	a5,-1
40001494:	f2f42623          	sw	a5,-212(s0)
	chacha_block[0]=0xffffffff;
40001498:	fff00793          	li	a5,-1
4000149c:	f2f42423          	sw	a5,-216(s0)

	chacha_key[7]=	0xffffffff;
400014a0:	fff00793          	li	a5,-1
400014a4:	f4f42623          	sw	a5,-180(s0)
	chacha_key[6]=	0xffffffff;
400014a8:	fff00793          	li	a5,-1
400014ac:	f4f42423          	sw	a5,-184(s0)
	chacha_key[5]=	0xffffffff;
400014b0:	fff00793          	li	a5,-1
400014b4:	f4f42223          	sw	a5,-188(s0)
	chacha_key[4]=	0xffffffff;
400014b8:	fff00793          	li	a5,-1
400014bc:	f4f42023          	sw	a5,-192(s0)
	chacha_key[3]=	0xffffffff;
400014c0:	fff00793          	li	a5,-1
400014c4:	f2f42e23          	sw	a5,-196(s0)
	chacha_key[2]=	0xffffffff;
400014c8:	fff00793          	li	a5,-1
400014cc:	f2f42c23          	sw	a5,-200(s0)
	chacha_key[1]=	0xffffffff;
400014d0:	fff00793          	li	a5,-1
400014d4:	f2f42a23          	sw	a5,-204(s0)
	chacha_key[0]= 	0xffffffff;
400014d8:	fff00793          	li	a5,-1
400014dc:	f2f42823          	sw	a5,-208(s0)

	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,8,chacha_res);
400014e0:	eec40713          	addi	a4,s0,-276
400014e4:	f2840613          	addi	a2,s0,-216
400014e8:	f3040793          	addi	a5,s0,-208
400014ec:	00800693          	li	a3,8
400014f0:	00078593          	mv	a1,a5
400014f4:	00000513          	li	a0,0
400014f8:	e21fe0ef          	jal	ra,40000318 <chacha_cipher>

	print("\r\n\t==========================================TEST 4==========================================\r\n");
400014fc:	400047b7          	lui	a5,0x40004
40001500:	ee478513          	addi	a0,a5,-284 # 40003ee4 <vga_simRes_h160_v120+0x418>
40001504:	3c4010ef          	jal	ra,400028c8 <print>
	//128-bit key
	//ha7a6c81bd8ac106e8f3a46a1bc8ec702e95d18c7e0f424519aeafb54471d83a2bf888861586b73d228eaaf82f9665a5a155e867f93731bfbe24fab495590b231
	chacha_block[1]=0x0f1e2d3c;
40001508:	0f1e37b7          	lui	a5,0xf1e3
4000150c:	d3c78793          	addi	a5,a5,-708 # f1e2d3c <_stack_size+0xf1e253c>
40001510:	f2f42623          	sw	a5,-212(s0)
	chacha_block[0]=0x4b596877;
40001514:	4b5977b7          	lui	a5,0x4b597
40001518:	87778793          	addi	a5,a5,-1929 # 4b596877 <__global_pointer$+0xb591757>
4000151c:	f2f42423          	sw	a5,-216(s0)
	chacha_key[7]=	0x00112233;
40001520:	001127b7          	lui	a5,0x112
40001524:	23378793          	addi	a5,a5,563 # 112233 <_stack_size+0x111a33>
40001528:	f4f42623          	sw	a5,-180(s0)
	chacha_key[6]=	0x44556677;
4000152c:	445567b7          	lui	a5,0x44556
40001530:	67778793          	addi	a5,a5,1655 # 44556677 <__global_pointer$+0x4551557>
40001534:	f4f42423          	sw	a5,-184(s0)
	chacha_key[5]=	0x8899aabb;
40001538:	8899b7b7          	lui	a5,0x8899b
4000153c:	abb78793          	addi	a5,a5,-1349 # 8899aabb <_stack_start+0x899a17b>
40001540:	f4f42223          	sw	a5,-188(s0)
	chacha_key[4]=	0xccddeeff;
40001544:	ccddf7b7          	lui	a5,0xccddf
40001548:	eff78793          	addi	a5,a5,-257 # ccddeeff <_stack_start+0x4cdde5bf>
4000154c:	f4f42023          	sw	a5,-192(s0)
	chacha_key[3]=	0x0;
40001550:	f2042e23          	sw	zero,-196(s0)
	chacha_key[2]=	0x0;
40001554:	f2042c23          	sw	zero,-200(s0)
	chacha_key[1]=	0x0;
40001558:	f2042a23          	sw	zero,-204(s0)
	chacha_key[0]= 	0x0;
4000155c:	f2042823          	sw	zero,-208(s0)

	chacha_cipher(KEY_128_BITS,chacha_key,chacha_block,8,chacha_res);
40001560:	eec40713          	addi	a4,s0,-276
40001564:	f2840613          	addi	a2,s0,-216
40001568:	f3040793          	addi	a5,s0,-208
4000156c:	00800693          	li	a3,8
40001570:	00078593          	mv	a1,a5
40001574:	00000513          	li	a0,0
40001578:	da1fe0ef          	jal	ra,40000318 <chacha_cipher>

//PRINCE
	print("\r\t**********************************PRINCE TEST*******************************\r\n");
4000157c:	400047b7          	lui	a5,0x40004
40001580:	10478513          	addi	a0,a5,260 # 40004104 <vga_simRes_h160_v120+0x638>
40001584:	344010ef          	jal	ra,400028c8 <print>
	uint32_t prince_key[4] 		= {0x0, 0x0, 0x0, 0x0};
40001588:	ec042e23          	sw	zero,-292(s0)
4000158c:	ee042023          	sw	zero,-288(s0)
40001590:	ee042223          	sw	zero,-284(s0)
40001594:	ee042423          	sw	zero,-280(s0)
	uint32_t prince_block[2] 		= {0x0, 0x0};
40001598:	ec042a23          	sw	zero,-300(s0)
4000159c:	ec042c23          	sw	zero,-296(s0)
	uint32_t prince_res[2] 	= {0x0,0x0};
400015a0:	ec042623          	sw	zero,-308(s0)
400015a4:	ec042823          	sw	zero,-304(s0)
	print("\r\n\t===================================TEST 1===================================\r\n");
400015a8:	400047b7          	lui	a5,0x40004
400015ac:	15878513          	addi	a0,a5,344 # 40004158 <vga_simRes_h160_v120+0x68c>
400015b0:	318010ef          	jal	ra,400028c8 <print>

	prince_block[1] 	= 0x69c4e0d8;
400015b4:	69c4e7b7          	lui	a5,0x69c4e
400015b8:	0d878793          	addi	a5,a5,216 # 69c4e0d8 <__global_pointer$+0x29c48fb8>
400015bc:	ecf42c23          	sw	a5,-296(s0)
	prince_block[0] 	= 0x6a7b0430;
400015c0:	6a7b07b7          	lui	a5,0x6a7b0
400015c4:	43078793          	addi	a5,a5,1072 # 6a7b0430 <__global_pointer$+0x2a7ab310>
400015c8:	ecf42a23          	sw	a5,-300(s0)

	prince_key[3]		= 0xd8cdb780;
400015cc:	d8cdb7b7          	lui	a5,0xd8cdb
400015d0:	78078793          	addi	a5,a5,1920 # d8cdb780 <_stack_start+0x58cdae40>
400015d4:	eef42423          	sw	a5,-280(s0)
	prince_key[2]		= 0x70b4c55a;
400015d8:	70b4c7b7          	lui	a5,0x70b4c
400015dc:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b4743a>
400015e0:	eef42223          	sw	a5,-284(s0)
	prince_key[1]		= 0x818665aa;
400015e4:	818667b7          	lui	a5,0x81866
400015e8:	5aa78793          	addi	a5,a5,1450 # 818665aa <_stack_start+0x1865c6a>
400015ec:	eef42023          	sw	a5,-288(s0)
	prince_key[0]		= 0x0d02dfda;
400015f0:	0d02e7b7          	lui	a5,0xd02e
400015f4:	fda78793          	addi	a5,a5,-38 # d02dfda <_stack_size+0xd02d7da>
400015f8:	ecf42e23          	sw	a5,-292(s0)

	prince_cipher(PRINCE_OP_EN,prince_key,prince_block,prince_res);
400015fc:	ecc40693          	addi	a3,s0,-308
40001600:	ed440713          	addi	a4,s0,-300
40001604:	edc40793          	addi	a5,s0,-292
40001608:	00070613          	mv	a2,a4
4000160c:	00078593          	mv	a1,a5
40001610:	00100513          	li	a0,1
40001614:	b20ff0ef          	jal	ra,40000934 <prince_cipher>

	print("\r\n\t===================================TEST 2===================================\r\n");
40001618:	400047b7          	lui	a5,0x40004
4000161c:	1ac78513          	addi	a0,a5,428 # 400041ac <vga_simRes_h160_v120+0x6e0>
40001620:	2a8010ef          	jal	ra,400028c8 <print>

	prince_block[1] 	= 0x43c6b256;
40001624:	43c6b7b7          	lui	a5,0x43c6b
40001628:	25678793          	addi	a5,a5,598 # 43c6b256 <__global_pointer$+0x3c66136>
4000162c:	ecf42c23          	sw	a5,-296(s0)
	prince_block[0] 	= 0xd79de7e8;
40001630:	d79de7b7          	lui	a5,0xd79de
40001634:	7e878793          	addi	a5,a5,2024 # d79de7e8 <_stack_start+0x579ddea8>
40001638:	ecf42a23          	sw	a5,-300(s0)

	//USE THE SAME KEY

	prince_cipher(PRINCE_OP_DE,prince_key,prince_block,prince_res);
4000163c:	ecc40693          	addi	a3,s0,-308
40001640:	ed440713          	addi	a4,s0,-300
40001644:	edc40793          	addi	a5,s0,-292
40001648:	00070613          	mv	a2,a4
4000164c:	00078593          	mv	a1,a5
40001650:	00000513          	li	a0,0
40001654:	ae0ff0ef          	jal	ra,40000934 <prince_cipher>
//PRESENT
 	print("\r\n");
40001658:	400047b7          	lui	a5,0x40004
4000165c:	d6078513          	addi	a0,a5,-672 # 40003d60 <vga_simRes_h160_v120+0x294>
40001660:	268010ef          	jal	ra,400028c8 <print>
	print("\r\t******************************PRESENT TEST**********************************\r\n");
40001664:	400047b7          	lui	a5,0x40004
40001668:	20078513          	addi	a0,a5,512 # 40004200 <vga_simRes_h160_v120+0x734>
4000166c:	25c010ef          	jal	ra,400028c8 <print>
	unsigned int present_key[3] = {0x0, 0x0, 0x0};
40001670:	ec042023          	sw	zero,-320(s0)
40001674:	ec042223          	sw	zero,-316(s0)
40001678:	ec042423          	sw	zero,-312(s0)
	unsigned int present_block[2] 	= {0x0, 0x0};
4000167c:	ea042c23          	sw	zero,-328(s0)
40001680:	ea042e23          	sw	zero,-324(s0)
	unsigned int present_res[2] 	= {0x0, 0x0};
40001684:	ea042823          	sw	zero,-336(s0)
40001688:	ea042a23          	sw	zero,-332(s0)

	print("\r\n\t==================================TEST 1====================================\r\n");
4000168c:	400047b7          	lui	a5,0x40004
40001690:	25478513          	addi	a0,a5,596 # 40004254 <vga_simRes_h160_v120+0x788>
40001694:	234010ef          	jal	ra,400028c8 <print>

	present_block[1]=0x4c746e67;
40001698:	4c7477b7          	lui	a5,0x4c747
4000169c:	e6778793          	addi	a5,a5,-409 # 4c746e67 <__global_pointer$+0xc741d47>
400016a0:	eaf42e23          	sw	a5,-324(s0)
	present_block[0]=0x7579656e;
400016a4:	757967b7          	lui	a5,0x75796
400016a8:	56e78793          	addi	a5,a5,1390 # 7579656e <__global_pointer$+0x3579144e>
400016ac:	eaf42c23          	sw	a5,-328(s0)

	present_key[2] = 0x46657465;
400016b0:	466577b7          	lui	a5,0x46657
400016b4:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6652345>
400016b8:	ecf42423          	sw	a5,-312(s0)
	present_key[1] = 0x6c48636d;
400016bc:	6c4867b7          	lui	a5,0x6c486
400016c0:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c48124d>
400016c4:	ecf42223          	sw	a5,-316(s0)
	present_key[0] = 0x7573;
400016c8:	000077b7          	lui	a5,0x7
400016cc:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
400016d0:	ecf42023          	sw	a5,-320(s0)

	present_cipher(PRESENT_OP_EN,present_key,present_block,present_res);
400016d4:	eb040693          	addi	a3,s0,-336
400016d8:	eb840713          	addi	a4,s0,-328
400016dc:	ec040793          	addi	a5,s0,-320
400016e0:	00070613          	mv	a2,a4
400016e4:	00078593          	mv	a1,a5
400016e8:	00000513          	li	a0,0
400016ec:	4dc000ef          	jal	ra,40001bc8 <present_cipher>

	print("\r\n\t==================================TEST 2====================================\r\n");
400016f0:	400047b7          	lui	a5,0x40004
400016f4:	2a878513          	addi	a0,a5,680 # 400042a8 <vga_simRes_h160_v120+0x7dc>
400016f8:	1d0010ef          	jal	ra,400028c8 <print>

	present_block[1]=0x0e1d00d4;
400016fc:	0e1d07b7          	lui	a5,0xe1d0
40001700:	0d478793          	addi	a5,a5,212 # e1d00d4 <_stack_size+0xe1cf8d4>
40001704:	eaf42e23          	sw	a5,-324(s0)
	present_block[0]=0xe46ba99c;
40001708:	e46bb7b7          	lui	a5,0xe46bb
4000170c:	99c78793          	addi	a5,a5,-1636 # e46ba99c <_stack_start+0x646ba05c>
40001710:	eaf42c23          	sw	a5,-328(s0)

	//USE THE SAME KEY

	present_cipher(PRESENT_OP_DE,present_key,present_block,present_res);
40001714:	eb040693          	addi	a3,s0,-336
40001718:	eb840713          	addi	a4,s0,-328
4000171c:	ec040793          	addi	a5,s0,-320
40001720:	00070613          	mv	a2,a4
40001724:	00078593          	mv	a1,a5
40001728:	00100513          	li	a0,1
4000172c:	49c000ef          	jal	ra,40001bc8 <present_cipher>
	//DM_PRESENT
	print("\r\n");
40001730:	400047b7          	lui	a5,0x40004
40001734:	d6078513          	addi	a0,a5,-672 # 40003d60 <vga_simRes_h160_v120+0x294>
40001738:	190010ef          	jal	ra,400028c8 <print>
	print("\r\t***************************DM_PRESENT TEST**********************************\r\n");
4000173c:	400047b7          	lui	a5,0x40004
40001740:	2fc78513          	addi	a0,a5,764 # 400042fc <vga_simRes_h160_v120+0x830>
40001744:	184010ef          	jal	ra,400028c8 <print>
	print("\r\n\t==================================TEST 1====================================\r\n");
40001748:	400047b7          	lui	a5,0x40004
4000174c:	25478513          	addi	a0,a5,596 # 40004254 <vga_simRes_h160_v120+0x788>
40001750:	178010ef          	jal	ra,400028c8 <print>

	present_block[1]=0x4c746e67;
40001754:	4c7477b7          	lui	a5,0x4c747
40001758:	e6778793          	addi	a5,a5,-409 # 4c746e67 <__global_pointer$+0xc741d47>
4000175c:	eaf42e23          	sw	a5,-324(s0)
	present_block[0]=0x7579656e;
40001760:	757967b7          	lui	a5,0x75796
40001764:	56e78793          	addi	a5,a5,1390 # 7579656e <__global_pointer$+0x3579144e>
40001768:	eaf42c23          	sw	a5,-328(s0)

	present_key[2] = 0x46657465;
4000176c:	466577b7          	lui	a5,0x46657
40001770:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6652345>
40001774:	ecf42423          	sw	a5,-312(s0)
	present_key[1] = 0x6c48636d;
40001778:	6c4867b7          	lui	a5,0x6c486
4000177c:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c48124d>
40001780:	ecf42223          	sw	a5,-316(s0)
	present_key[0] = 0x7573;
40001784:	000077b7          	lui	a5,0x7
40001788:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
4000178c:	ecf42023          	sw	a5,-320(s0)

	//expec: 42696eb3 9112ccf2

	present_hash(present_key,present_block,present_res);
40001790:	eb040693          	addi	a3,s0,-336
40001794:	eb840713          	addi	a4,s0,-328
40001798:	ec040793          	addi	a5,s0,-320
4000179c:	00068613          	mv	a2,a3
400017a0:	00070593          	mv	a1,a4
400017a4:	00078513          	mv	a0,a5
400017a8:	5ac000ef          	jal	ra,40001d54 <present_hash>

	print("\r\n\t==================================TEST 2====================================\r\n");
400017ac:	400047b7          	lui	a5,0x40004
400017b0:	2a878513          	addi	a0,a5,680 # 400042a8 <vga_simRes_h160_v120+0x7dc>
400017b4:	114010ef          	jal	ra,400028c8 <print>

	present_block[1]=0x46657465;
400017b8:	466577b7          	lui	a5,0x46657
400017bc:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6652345>
400017c0:	eaf42e23          	sw	a5,-324(s0)
	present_block[0]=0x6c5f5553;
400017c4:	6c5f57b7          	lui	a5,0x6c5f5
400017c8:	55378793          	addi	a5,a5,1363 # 6c5f5553 <__global_pointer$+0x2c5f0433>
400017cc:	eaf42c23          	sw	a5,-328(s0)

	present_key[2] = 0x00000000;
400017d0:	ec042423          	sw	zero,-312(s0)
	present_key[1] = 0x00000000;
400017d4:	ec042223          	sw	zero,-316(s0)
	present_key[0] = 0x0001;
400017d8:	00100793          	li	a5,1
400017dc:	ecf42023          	sw	a5,-320(s0)
	//expec:d52384e3 dcee9ce7
	present_hash(present_key,present_block,present_res);
400017e0:	eb040693          	addi	a3,s0,-336
400017e4:	eb840713          	addi	a4,s0,-328
400017e8:	ec040793          	addi	a5,s0,-320
400017ec:	00068613          	mv	a2,a3
400017f0:	00070593          	mv	a1,a4
400017f4:	00078513          	mv	a0,a5
400017f8:	55c000ef          	jal	ra,40001d54 <present_hash>
	print("\r\n\t==================================TEST 3====================================\r\n");
400017fc:	400047b7          	lui	a5,0x40004
40001800:	35078513          	addi	a0,a5,848 # 40004350 <vga_simRes_h160_v120+0x884>
40001804:	0c4010ef          	jal	ra,400028c8 <print>

	present_block[1]=0x31383230;
40001808:	313837b7          	lui	a5,0x31383
4000180c:	23078793          	addi	a5,a5,560 # 31383230 <_stack_size+0x31382a30>
40001810:	eaf42e23          	sw	a5,-324(s0)
	present_block[0]=0x30313833;
40001814:	303147b7          	lui	a5,0x30314
40001818:	83378793          	addi	a5,a5,-1997 # 30313833 <_stack_size+0x30313033>
4000181c:	eaf42c23          	sw	a5,-328(s0)

	present_key[2] = 0x31383230;
40001820:	313837b7          	lui	a5,0x31383
40001824:	23078793          	addi	a5,a5,560 # 31383230 <_stack_size+0x31382a30>
40001828:	ecf42423          	sw	a5,-312(s0)
	present_key[1] = 0x30313833;
4000182c:	303147b7          	lui	a5,0x30314
40001830:	83378793          	addi	a5,a5,-1997 # 30313833 <_stack_size+0x30313033>
40001834:	ecf42223          	sw	a5,-316(s0)
	present_key[0] = 0x5553;
40001838:	000057b7          	lui	a5,0x5
4000183c:	55378793          	addi	a5,a5,1363 # 5553 <_stack_size+0x4d53>
40001840:	ecf42023          	sw	a5,-320(s0)
	//expec: 08e11c56 b6d5a592


	present_hash(present_key,present_block,present_res);
40001844:	eb040693          	addi	a3,s0,-336
40001848:	eb840713          	addi	a4,s0,-328
4000184c:	ec040793          	addi	a5,s0,-320
40001850:	00068613          	mv	a2,a3
40001854:	00070593          	mv	a1,a4
40001858:	00078513          	mv	a0,a5
4000185c:	4f8000ef          	jal	ra,40001d54 <present_hash>
	return 0;	
40001860:	00000793          	li	a5,0
}
40001864:	00078513          	mv	a0,a5
40001868:	14c12083          	lw	ra,332(sp)
4000186c:	14812403          	lw	s0,328(sp)
40001870:	15010113          	addi	sp,sp,336
40001874:	00008067          	ret

40001878 <irqCallback>:
void irqCallback(){
40001878:	ff010113          	addi	sp,sp,-16
4000187c:	00812623          	sw	s0,12(sp)
40001880:	01010413          	addi	s0,sp,16

}
40001884:	00000013          	nop
40001888:	00c12403          	lw	s0,12(sp)
4000188c:	01010113          	addi	sp,sp,16
40001890:	00008067          	ret

40001894 <timer_init>:
static void timer_init(Timer_Reg *reg){
40001894:	fe010113          	addi	sp,sp,-32
40001898:	00812e23          	sw	s0,28(sp)
4000189c:	02010413          	addi	s0,sp,32
400018a0:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
400018a4:	fec42783          	lw	a5,-20(s0)
400018a8:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
400018ac:	fec42783          	lw	a5,-20(s0)
400018b0:	0007a423          	sw	zero,8(a5)
}
400018b4:	00000013          	nop
400018b8:	01c12403          	lw	s0,28(sp)
400018bc:	02010113          	addi	sp,sp,32
400018c0:	00008067          	ret

400018c4 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
400018c4:	fe010113          	addi	sp,sp,-32
400018c8:	00812e23          	sw	s0,28(sp)
400018cc:	02010413          	addi	s0,sp,32
400018d0:	fea42623          	sw	a0,-20(s0)
}
400018d4:	00000013          	nop
400018d8:	01c12403          	lw	s0,28(sp)
400018dc:	02010113          	addi	sp,sp,32
400018e0:	00008067          	ret

400018e4 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
400018e4:	fe010113          	addi	sp,sp,-32
400018e8:	00812e23          	sw	s0,28(sp)
400018ec:	02010413          	addi	s0,sp,32
400018f0:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
400018f4:	fec42783          	lw	a5,-20(s0)
400018f8:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
400018fc:	fec42783          	lw	a5,-20(s0)
40001900:	fff00713          	li	a4,-1
40001904:	00e7a023          	sw	a4,0(a5)
}
40001908:	00000013          	nop
4000190c:	01c12403          	lw	s0,28(sp)
40001910:	02010113          	addi	sp,sp,32
40001914:	00008067          	ret

40001918 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40001918:	fe010113          	addi	sp,sp,-32
4000191c:	00812e23          	sw	s0,28(sp)
40001920:	02010413          	addi	s0,sp,32
40001924:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40001928:	fec42783          	lw	a5,-20(s0)
4000192c:	0047a783          	lw	a5,4(a5)
40001930:	0107d793          	srli	a5,a5,0x10
40001934:	0ff7f793          	zext.b	a5,a5
}
40001938:	00078513          	mv	a0,a5
4000193c:	01c12403          	lw	s0,28(sp)
40001940:	02010113          	addi	sp,sp,32
40001944:	00008067          	ret

40001948 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40001948:	fe010113          	addi	sp,sp,-32
4000194c:	00812e23          	sw	s0,28(sp)
40001950:	02010413          	addi	s0,sp,32
40001954:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40001958:	fec42783          	lw	a5,-20(s0)
4000195c:	0047a783          	lw	a5,4(a5)
40001960:	0187d793          	srli	a5,a5,0x18
}
40001964:	00078513          	mv	a0,a5
40001968:	01c12403          	lw	s0,28(sp)
4000196c:	02010113          	addi	sp,sp,32
40001970:	00008067          	ret

40001974 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40001974:	fe010113          	addi	sp,sp,-32
40001978:	00112e23          	sw	ra,28(sp)
4000197c:	00812c23          	sw	s0,24(sp)
40001980:	02010413          	addi	s0,sp,32
40001984:	fea42623          	sw	a0,-20(s0)
40001988:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
4000198c:	00000013          	nop
40001990:	fec42503          	lw	a0,-20(s0)
40001994:	f85ff0ef          	jal	ra,40001918 <uart_writeAvailability>
40001998:	00050793          	mv	a5,a0
4000199c:	fe078ae3          	beqz	a5,40001990 <uart_write+0x1c>
	reg->DATA = data;
400019a0:	fec42783          	lw	a5,-20(s0)
400019a4:	fe842703          	lw	a4,-24(s0)
400019a8:	00e7a023          	sw	a4,0(a5)
}
400019ac:	00000013          	nop
400019b0:	01c12083          	lw	ra,28(sp)
400019b4:	01812403          	lw	s0,24(sp)
400019b8:	02010113          	addi	sp,sp,32
400019bc:	00008067          	ret

400019c0 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
400019c0:	fe010113          	addi	sp,sp,-32
400019c4:	00812e23          	sw	s0,28(sp)
400019c8:	02010413          	addi	s0,sp,32
400019cc:	fea42623          	sw	a0,-20(s0)
400019d0:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
400019d4:	fe842783          	lw	a5,-24(s0)
400019d8:	00c7a703          	lw	a4,12(a5)
400019dc:	fec42783          	lw	a5,-20(s0)
400019e0:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
400019e4:	fe842783          	lw	a5,-24(s0)
400019e8:	0007a783          	lw	a5,0(a5)
400019ec:	fff78713          	addi	a4,a5,-1
400019f0:	fe842783          	lw	a5,-24(s0)
400019f4:	0047a783          	lw	a5,4(a5)
400019f8:	00879793          	slli	a5,a5,0x8
400019fc:	00f76733          	or	a4,a4,a5
40001a00:	fe842783          	lw	a5,-24(s0)
40001a04:	0087a783          	lw	a5,8(a5)
40001a08:	01079793          	slli	a5,a5,0x10
40001a0c:	00f76733          	or	a4,a4,a5
40001a10:	fec42783          	lw	a5,-20(s0)
40001a14:	00e7a623          	sw	a4,12(a5)
}
40001a18:	00000013          	nop
40001a1c:	01c12403          	lw	s0,28(sp)
40001a20:	02010113          	addi	sp,sp,32
40001a24:	00008067          	ret

40001a28 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001a28:	fe010113          	addi	sp,sp,-32
40001a2c:	00812e23          	sw	s0,28(sp)
40001a30:	02010413          	addi	s0,sp,32
40001a34:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001a38:	fec42783          	lw	a5,-20(s0)
40001a3c:	0007a783          	lw	a5,0(a5)
40001a40:	0027f793          	andi	a5,a5,2
40001a44:	00f037b3          	snez	a5,a5
40001a48:	0ff7f793          	zext.b	a5,a5
}
40001a4c:	00078513          	mv	a0,a5
40001a50:	01c12403          	lw	s0,28(sp)
40001a54:	02010113          	addi	sp,sp,32
40001a58:	00008067          	ret

40001a5c <vga_run>:
static void vga_run(Vga_Reg *reg){
40001a5c:	fe010113          	addi	sp,sp,-32
40001a60:	00812e23          	sw	s0,28(sp)
40001a64:	02010413          	addi	s0,sp,32
40001a68:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40001a6c:	fec42783          	lw	a5,-20(s0)
40001a70:	00100713          	li	a4,1
40001a74:	00e7a023          	sw	a4,0(a5)
}
40001a78:	00000013          	nop
40001a7c:	01c12403          	lw	s0,28(sp)
40001a80:	02010113          	addi	sp,sp,32
40001a84:	00008067          	ret

40001a88 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40001a88:	fe010113          	addi	sp,sp,-32
40001a8c:	00112e23          	sw	ra,28(sp)
40001a90:	00812c23          	sw	s0,24(sp)
40001a94:	02010413          	addi	s0,sp,32
40001a98:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40001a9c:	fec42783          	lw	a5,-20(s0)
40001aa0:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40001aa4:	00000013          	nop
40001aa8:	fec42503          	lw	a0,-20(s0)
40001aac:	f7dff0ef          	jal	ra,40001a28 <vga_isBusy>
40001ab0:	00050793          	mv	a5,a0
40001ab4:	fe079ae3          	bnez	a5,40001aa8 <vga_stop+0x20>
}
40001ab8:	00000013          	nop
40001abc:	00000013          	nop
40001ac0:	01c12083          	lw	ra,28(sp)
40001ac4:	01812403          	lw	s0,24(sp)
40001ac8:	02010113          	addi	sp,sp,32
40001acc:	00008067          	ret

40001ad0 <present_write>:
#include "briey.h"
void present_write(uint32_t iData, uint32_t iAddress)
{
40001ad0:	fe010113          	addi	sp,sp,-32
40001ad4:	00812e23          	sw	s0,28(sp)
40001ad8:	02010413          	addi	s0,sp,32
40001adc:	fea42623          	sw	a0,-20(s0)
40001ae0:	feb42423          	sw	a1,-24(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
40001ae4:	f00027b7          	lui	a5,0xf0002
40001ae8:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001aec:	fe842703          	lw	a4,-24(s0)
40001af0:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->WRITE_N 		= 0;
40001af4:	f00027b7          	lui	a5,0xf0002
40001af8:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001afc:	0007a223          	sw	zero,4(a5)
	PRESENT_BASE->READ_N 		= 1;
40001b00:	f00027b7          	lui	a5,0xf0002
40001b04:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001b08:	00100713          	li	a4,1
40001b0c:	00e7a423          	sw	a4,8(a5)
	PRESENT_BASE->IDATA			= iData;
40001b10:	f00027b7          	lui	a5,0xf0002
40001b14:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001b18:	fec42703          	lw	a4,-20(s0)
40001b1c:	00e7a823          	sw	a4,16(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
40001b20:	f00027b7          	lui	a5,0xf0002
40001b24:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001b28:	0007a023          	sw	zero,0(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
40001b2c:	f00027b7          	lui	a5,0xf0002
40001b30:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001b34:	00100713          	li	a4,1
40001b38:	00e7a023          	sw	a4,0(a5)
}
40001b3c:	00000013          	nop
40001b40:	01c12403          	lw	s0,28(sp)
40001b44:	02010113          	addi	sp,sp,32
40001b48:	00008067          	ret

40001b4c <present_read>:
uint32_t present_read(uint32_t iAddress)
{
40001b4c:	fd010113          	addi	sp,sp,-48
40001b50:	02812623          	sw	s0,44(sp)
40001b54:	03010413          	addi	s0,sp,48
40001b58:	fca42e23          	sw	a0,-36(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
40001b5c:	f00027b7          	lui	a5,0xf0002
40001b60:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001b64:	fdc42703          	lw	a4,-36(s0)
40001b68:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->READ_N		= 0;
40001b6c:	f00027b7          	lui	a5,0xf0002
40001b70:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001b74:	0007a423          	sw	zero,8(a5)
	PRESENT_BASE->WRITE_N		= 1;
40001b78:	f00027b7          	lui	a5,0xf0002
40001b7c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001b80:	00100713          	li	a4,1
40001b84:	00e7a223          	sw	a4,4(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
40001b88:	f00027b7          	lui	a5,0xf0002
40001b8c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001b90:	0007a023          	sw	zero,0(a5)
	uint32_t res 				= PRESENT_BASE->ODATA;
40001b94:	f00027b7          	lui	a5,0xf0002
40001b98:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001b9c:	0147a783          	lw	a5,20(a5)
40001ba0:	fef42623          	sw	a5,-20(s0)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
40001ba4:	f00027b7          	lui	a5,0xf0002
40001ba8:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40001bac:	00100713          	li	a4,1
40001bb0:	00e7a023          	sw	a4,0(a5)
	return res;
40001bb4:	fec42783          	lw	a5,-20(s0)
}
40001bb8:	00078513          	mv	a0,a5
40001bbc:	02c12403          	lw	s0,44(sp)
40001bc0:	03010113          	addi	sp,sp,48
40001bc4:	00008067          	ret

40001bc8 <present_cipher>:
void present_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
40001bc8:	fe010113          	addi	sp,sp,-32
40001bcc:	00112e23          	sw	ra,28(sp)
40001bd0:	00812c23          	sw	s0,24(sp)
40001bd4:	00912a23          	sw	s1,20(sp)
40001bd8:	02010413          	addi	s0,sp,32
40001bdc:	00050793          	mv	a5,a0
40001be0:	feb42423          	sw	a1,-24(s0)
40001be4:	fec42223          	sw	a2,-28(s0)
40001be8:	fed42023          	sw	a3,-32(s0)
40001bec:	fef407a3          	sb	a5,-17(s0)

	//EN_OR_DE
	if(operation == PRESENT_OP_EN) present_write(PRESENT_OP_EN,PRESENT_ADDR_EN_OR_DE);
40001bf0:	fef44783          	lbu	a5,-17(s0)
40001bf4:	00079a63          	bnez	a5,40001c08 <present_cipher+0x40>
40001bf8:	00800593          	li	a1,8
40001bfc:	00000513          	li	a0,0
40001c00:	ed1ff0ef          	jal	ra,40001ad0 <present_write>
40001c04:	01c0006f          	j	40001c20 <present_cipher+0x58>
	else if(operation == PRESENT_OP_DE) present_write(PRESENT_OP_DE,PRESENT_ADDR_EN_OR_DE);
40001c08:	fef44703          	lbu	a4,-17(s0)
40001c0c:	00100793          	li	a5,1
40001c10:	00f71863          	bne	a4,a5,40001c20 <present_cipher+0x58>
40001c14:	00800593          	li	a1,8
40001c18:	00100513          	li	a0,1
40001c1c:	eb5ff0ef          	jal	ra,40001ad0 <present_write>

	//PLAIN_TEXT
	present_write(block[1],PRESENT_ADDR_BLOCK_BASE +1);
40001c20:	fe442783          	lw	a5,-28(s0)
40001c24:	00478793          	addi	a5,a5,4
40001c28:	0007a783          	lw	a5,0(a5)
40001c2c:	00500593          	li	a1,5
40001c30:	00078513          	mv	a0,a5
40001c34:	e9dff0ef          	jal	ra,40001ad0 <present_write>
	present_write(block[0],PRESENT_ADDR_BLOCK_BASE);
40001c38:	fe442783          	lw	a5,-28(s0)
40001c3c:	0007a783          	lw	a5,0(a5)
40001c40:	00400593          	li	a1,4
40001c44:	00078513          	mv	a0,a5
40001c48:	e89ff0ef          	jal	ra,40001ad0 <present_write>

	//KEY
	present_write(key[2],PRESENT_ADDR_KEY_BASE +2);
40001c4c:	fe842783          	lw	a5,-24(s0)
40001c50:	00878793          	addi	a5,a5,8
40001c54:	0007a783          	lw	a5,0(a5)
40001c58:	00300593          	li	a1,3
40001c5c:	00078513          	mv	a0,a5
40001c60:	e71ff0ef          	jal	ra,40001ad0 <present_write>
	present_write(key[1],PRESENT_ADDR_KEY_BASE +1);
40001c64:	fe842783          	lw	a5,-24(s0)
40001c68:	00478793          	addi	a5,a5,4
40001c6c:	0007a783          	lw	a5,0(a5)
40001c70:	00200593          	li	a1,2
40001c74:	00078513          	mv	a0,a5
40001c78:	e59ff0ef          	jal	ra,40001ad0 <present_write>
	present_write(key[0],PRESENT_ADDR_KEY_BASE);
40001c7c:	fe842783          	lw	a5,-24(s0)
40001c80:	0007a783          	lw	a5,0(a5)
40001c84:	00100593          	li	a1,1
40001c88:	00078513          	mv	a0,a5
40001c8c:	e45ff0ef          	jal	ra,40001ad0 <present_write>

	//START
	present_write(0x1,PRESENT_ADDR_START);
40001c90:	00000593          	li	a1,0
40001c94:	00100513          	li	a0,1
40001c98:	e39ff0ef          	jal	ra,40001ad0 <present_write>

	while(present_read(PRESENT_ADDR_RESULT_BASE)==0);
40001c9c:	00000013          	nop
40001ca0:	00600513          	li	a0,6
40001ca4:	ea9ff0ef          	jal	ra,40001b4c <present_read>
40001ca8:	00050793          	mv	a5,a0
40001cac:	fe078ae3          	beqz	a5,40001ca0 <present_cipher+0xd8>

	res[1] = present_read(PRESENT_ADDR_RESULT_BASE +1);
40001cb0:	fe042783          	lw	a5,-32(s0)
40001cb4:	00478493          	addi	s1,a5,4
40001cb8:	00700513          	li	a0,7
40001cbc:	e91ff0ef          	jal	ra,40001b4c <present_read>
40001cc0:	00050793          	mv	a5,a0
40001cc4:	00f4a023          	sw	a5,0(s1)
	res[0] =present_read(PRESENT_ADDR_RESULT_BASE);
40001cc8:	00600513          	li	a0,6
40001ccc:	e81ff0ef          	jal	ra,40001b4c <present_read>
40001cd0:	00050713          	mv	a4,a0
40001cd4:	fe042783          	lw	a5,-32(s0)
40001cd8:	00e7a023          	sw	a4,0(a5)


    //print result to terminal
	if(operation == PRESENT_OP_EN)
40001cdc:	fef44783          	lbu	a5,-17(s0)
40001ce0:	00079a63          	bnez	a5,40001cf4 <present_cipher+0x12c>
		print("\r\t===========================PRESENT ENCRYPTTION==============================\r\n");
40001ce4:	400047b7          	lui	a5,0x40004
40001ce8:	40478513          	addi	a0,a5,1028 # 40004404 <vga_simRes_h160_v120+0x20>
40001cec:	3dd000ef          	jal	ra,400028c8 <print>
40001cf0:	0100006f          	j	40001d00 <present_cipher+0x138>
	else
		print("\r\t===========================PRESENT DECRYPTTION==============================\r\n");
40001cf4:	400047b7          	lui	a5,0x40004
40001cf8:	45878513          	addi	a0,a5,1112 # 40004458 <vga_simRes_h160_v120+0x74>
40001cfc:	3cd000ef          	jal	ra,400028c8 <print>
	print("\r\n");
40001d00:	400047b7          	lui	a5,0x40004
40001d04:	4ac78513          	addi	a0,a5,1196 # 400044ac <vga_simRes_h160_v120+0xc8>
40001d08:	3c1000ef          	jal	ra,400028c8 <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
40001d0c:	fe442583          	lw	a1,-28(s0)
40001d10:	400047b7          	lui	a5,0x40004
40001d14:	4b078513          	addi	a0,a5,1200 # 400044b0 <vga_simRes_h160_v120+0xcc>
40001d18:	619000ef          	jal	ra,40002b30 <print64bit>
	print80bit("KEY (80-bit) : ", key);
40001d1c:	fe842583          	lw	a1,-24(s0)
40001d20:	400047b7          	lui	a5,0x40004
40001d24:	4cc78513          	addi	a0,a5,1228 # 400044cc <vga_simRes_h160_v120+0xe8>
40001d28:	711000ef          	jal	ra,40002c38 <print80bit>
	print64bit("RESULT (64-bit) : ", res);
40001d2c:	fe042583          	lw	a1,-32(s0)
40001d30:	400047b7          	lui	a5,0x40004
40001d34:	4dc78513          	addi	a0,a5,1244 # 400044dc <vga_simRes_h160_v120+0xf8>
40001d38:	5f9000ef          	jal	ra,40002b30 <print64bit>
	//print("\r\n============================================================================\r\n");
}
40001d3c:	00000013          	nop
40001d40:	01c12083          	lw	ra,28(sp)
40001d44:	01812403          	lw	s0,24(sp)
40001d48:	01412483          	lw	s1,20(sp)
40001d4c:	02010113          	addi	sp,sp,32
40001d50:	00008067          	ret

40001d54 <present_hash>:
void present_hash(uint32_t *key, uint32_t *block, uint32_t *res) {
40001d54:	fe010113          	addi	sp,sp,-32
40001d58:	00112e23          	sw	ra,28(sp)
40001d5c:	00812c23          	sw	s0,24(sp)
40001d60:	00912a23          	sw	s1,20(sp)
40001d64:	02010413          	addi	s0,sp,32
40001d68:	fea42623          	sw	a0,-20(s0)
40001d6c:	feb42423          	sw	a1,-24(s0)
40001d70:	fec42223          	sw	a2,-28(s0)
	//PLAIN_TEXT
		present_write(block[1],PRESENT_ADDR_BLOCK_BASE +1);
40001d74:	fe842783          	lw	a5,-24(s0)
40001d78:	00478793          	addi	a5,a5,4
40001d7c:	0007a783          	lw	a5,0(a5)
40001d80:	00500593          	li	a1,5
40001d84:	00078513          	mv	a0,a5
40001d88:	d49ff0ef          	jal	ra,40001ad0 <present_write>
		present_write(block[0],PRESENT_ADDR_BLOCK_BASE);
40001d8c:	fe842783          	lw	a5,-24(s0)
40001d90:	0007a783          	lw	a5,0(a5)
40001d94:	00400593          	li	a1,4
40001d98:	00078513          	mv	a0,a5
40001d9c:	d35ff0ef          	jal	ra,40001ad0 <present_write>

		//KEY
		present_write(key[2],PRESENT_ADDR_KEY_BASE +2);
40001da0:	fec42783          	lw	a5,-20(s0)
40001da4:	00878793          	addi	a5,a5,8
40001da8:	0007a783          	lw	a5,0(a5)
40001dac:	00300593          	li	a1,3
40001db0:	00078513          	mv	a0,a5
40001db4:	d1dff0ef          	jal	ra,40001ad0 <present_write>
		present_write(key[1],PRESENT_ADDR_KEY_BASE +1);
40001db8:	fec42783          	lw	a5,-20(s0)
40001dbc:	00478793          	addi	a5,a5,4
40001dc0:	0007a783          	lw	a5,0(a5)
40001dc4:	00200593          	li	a1,2
40001dc8:	00078513          	mv	a0,a5
40001dcc:	d05ff0ef          	jal	ra,40001ad0 <present_write>
		present_write(key[0],PRESENT_ADDR_KEY_BASE);
40001dd0:	fec42783          	lw	a5,-20(s0)
40001dd4:	0007a783          	lw	a5,0(a5)
40001dd8:	00100593          	li	a1,1
40001ddc:	00078513          	mv	a0,a5
40001de0:	cf1ff0ef          	jal	ra,40001ad0 <present_write>

		//START
		present_write(0x1,PRESENT_ADDR_START);
40001de4:	00000593          	li	a1,0
40001de8:	00100513          	li	a0,1
40001dec:	ce5ff0ef          	jal	ra,40001ad0 <present_write>

		while(present_read(PRESENT_ADDR_RESULT_HASH_BASE)==0);
40001df0:	00000013          	nop
40001df4:	00900513          	li	a0,9
40001df8:	d55ff0ef          	jal	ra,40001b4c <present_read>
40001dfc:	00050793          	mv	a5,a0
40001e00:	fe078ae3          	beqz	a5,40001df4 <present_hash+0xa0>

		res[1] = present_read(PRESENT_ADDR_RESULT_HASH_BASE +1);
40001e04:	fe442783          	lw	a5,-28(s0)
40001e08:	00478493          	addi	s1,a5,4
40001e0c:	00a00513          	li	a0,10
40001e10:	d3dff0ef          	jal	ra,40001b4c <present_read>
40001e14:	00050793          	mv	a5,a0
40001e18:	00f4a023          	sw	a5,0(s1)
		res[0] =present_read(PRESENT_ADDR_RESULT_HASH_BASE);
40001e1c:	00900513          	li	a0,9
40001e20:	d2dff0ef          	jal	ra,40001b4c <present_read>
40001e24:	00050713          	mv	a4,a0
40001e28:	fe442783          	lw	a5,-28(s0)
40001e2c:	00e7a023          	sw	a4,0(a5)

		print("\r\t===========================DM_PRESENT HASH==================================\r\n");
40001e30:	400047b7          	lui	a5,0x40004
40001e34:	4f078513          	addi	a0,a5,1264 # 400044f0 <vga_simRes_h160_v120+0x10c>
40001e38:	291000ef          	jal	ra,400028c8 <print>
		print("\r\n");
40001e3c:	400047b7          	lui	a5,0x40004
40001e40:	4ac78513          	addi	a0,a5,1196 # 400044ac <vga_simRes_h160_v120+0xc8>
40001e44:	285000ef          	jal	ra,400028c8 <print>
		print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
40001e48:	fe842583          	lw	a1,-24(s0)
40001e4c:	400047b7          	lui	a5,0x40004
40001e50:	4b078513          	addi	a0,a5,1200 # 400044b0 <vga_simRes_h160_v120+0xcc>
40001e54:	4dd000ef          	jal	ra,40002b30 <print64bit>
		print80bit("KEY (80-bit) : ", key);
40001e58:	fec42583          	lw	a1,-20(s0)
40001e5c:	400047b7          	lui	a5,0x40004
40001e60:	4cc78513          	addi	a0,a5,1228 # 400044cc <vga_simRes_h160_v120+0xe8>
40001e64:	5d5000ef          	jal	ra,40002c38 <print80bit>
		print64bit("RESULT (64-bit) : ", res);
40001e68:	fe442583          	lw	a1,-28(s0)
40001e6c:	400047b7          	lui	a5,0x40004
40001e70:	4dc78513          	addi	a0,a5,1244 # 400044dc <vga_simRes_h160_v120+0xf8>
40001e74:	4bd000ef          	jal	ra,40002b30 <print64bit>
}
40001e78:	00000013          	nop
40001e7c:	01c12083          	lw	ra,28(sp)
40001e80:	01812403          	lw	s0,24(sp)
40001e84:	01412483          	lw	s1,20(sp)
40001e88:	02010113          	addi	sp,sp,32
40001e8c:	00008067          	ret

40001e90 <timer_init>:
static void timer_init(Timer_Reg *reg){
40001e90:	fe010113          	addi	sp,sp,-32
40001e94:	00812e23          	sw	s0,28(sp)
40001e98:	02010413          	addi	s0,sp,32
40001e9c:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40001ea0:	fec42783          	lw	a5,-20(s0)
40001ea4:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40001ea8:	fec42783          	lw	a5,-20(s0)
40001eac:	0007a423          	sw	zero,8(a5)
}
40001eb0:	00000013          	nop
40001eb4:	01c12403          	lw	s0,28(sp)
40001eb8:	02010113          	addi	sp,sp,32
40001ebc:	00008067          	ret

40001ec0 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40001ec0:	fe010113          	addi	sp,sp,-32
40001ec4:	00812e23          	sw	s0,28(sp)
40001ec8:	02010413          	addi	s0,sp,32
40001ecc:	fea42623          	sw	a0,-20(s0)
}
40001ed0:	00000013          	nop
40001ed4:	01c12403          	lw	s0,28(sp)
40001ed8:	02010113          	addi	sp,sp,32
40001edc:	00008067          	ret

40001ee0 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40001ee0:	fe010113          	addi	sp,sp,-32
40001ee4:	00812e23          	sw	s0,28(sp)
40001ee8:	02010413          	addi	s0,sp,32
40001eec:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40001ef0:	fec42783          	lw	a5,-20(s0)
40001ef4:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40001ef8:	fec42783          	lw	a5,-20(s0)
40001efc:	fff00713          	li	a4,-1
40001f00:	00e7a023          	sw	a4,0(a5)
}
40001f04:	00000013          	nop
40001f08:	01c12403          	lw	s0,28(sp)
40001f0c:	02010113          	addi	sp,sp,32
40001f10:	00008067          	ret

40001f14 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40001f14:	fe010113          	addi	sp,sp,-32
40001f18:	00812e23          	sw	s0,28(sp)
40001f1c:	02010413          	addi	s0,sp,32
40001f20:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40001f24:	fec42783          	lw	a5,-20(s0)
40001f28:	0047a783          	lw	a5,4(a5)
40001f2c:	0107d793          	srli	a5,a5,0x10
40001f30:	0ff7f793          	zext.b	a5,a5
}
40001f34:	00078513          	mv	a0,a5
40001f38:	01c12403          	lw	s0,28(sp)
40001f3c:	02010113          	addi	sp,sp,32
40001f40:	00008067          	ret

40001f44 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40001f44:	fe010113          	addi	sp,sp,-32
40001f48:	00812e23          	sw	s0,28(sp)
40001f4c:	02010413          	addi	s0,sp,32
40001f50:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40001f54:	fec42783          	lw	a5,-20(s0)
40001f58:	0047a783          	lw	a5,4(a5)
40001f5c:	0187d793          	srli	a5,a5,0x18
}
40001f60:	00078513          	mv	a0,a5
40001f64:	01c12403          	lw	s0,28(sp)
40001f68:	02010113          	addi	sp,sp,32
40001f6c:	00008067          	ret

40001f70 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40001f70:	fe010113          	addi	sp,sp,-32
40001f74:	00112e23          	sw	ra,28(sp)
40001f78:	00812c23          	sw	s0,24(sp)
40001f7c:	02010413          	addi	s0,sp,32
40001f80:	fea42623          	sw	a0,-20(s0)
40001f84:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40001f88:	00000013          	nop
40001f8c:	fec42503          	lw	a0,-20(s0)
40001f90:	f85ff0ef          	jal	ra,40001f14 <uart_writeAvailability>
40001f94:	00050793          	mv	a5,a0
40001f98:	fe078ae3          	beqz	a5,40001f8c <uart_write+0x1c>
	reg->DATA = data;
40001f9c:	fec42783          	lw	a5,-20(s0)
40001fa0:	fe842703          	lw	a4,-24(s0)
40001fa4:	00e7a023          	sw	a4,0(a5)
}
40001fa8:	00000013          	nop
40001fac:	01c12083          	lw	ra,28(sp)
40001fb0:	01812403          	lw	s0,24(sp)
40001fb4:	02010113          	addi	sp,sp,32
40001fb8:	00008067          	ret

40001fbc <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40001fbc:	fe010113          	addi	sp,sp,-32
40001fc0:	00812e23          	sw	s0,28(sp)
40001fc4:	02010413          	addi	s0,sp,32
40001fc8:	fea42623          	sw	a0,-20(s0)
40001fcc:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40001fd0:	fe842783          	lw	a5,-24(s0)
40001fd4:	00c7a703          	lw	a4,12(a5)
40001fd8:	fec42783          	lw	a5,-20(s0)
40001fdc:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40001fe0:	fe842783          	lw	a5,-24(s0)
40001fe4:	0007a783          	lw	a5,0(a5)
40001fe8:	fff78713          	addi	a4,a5,-1
40001fec:	fe842783          	lw	a5,-24(s0)
40001ff0:	0047a783          	lw	a5,4(a5)
40001ff4:	00879793          	slli	a5,a5,0x8
40001ff8:	00f76733          	or	a4,a4,a5
40001ffc:	fe842783          	lw	a5,-24(s0)
40002000:	0087a783          	lw	a5,8(a5)
40002004:	01079793          	slli	a5,a5,0x10
40002008:	00f76733          	or	a4,a4,a5
4000200c:	fec42783          	lw	a5,-20(s0)
40002010:	00e7a623          	sw	a4,12(a5)
}
40002014:	00000013          	nop
40002018:	01c12403          	lw	s0,28(sp)
4000201c:	02010113          	addi	sp,sp,32
40002020:	00008067          	ret

40002024 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40002024:	fe010113          	addi	sp,sp,-32
40002028:	00812e23          	sw	s0,28(sp)
4000202c:	02010413          	addi	s0,sp,32
40002030:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40002034:	fec42783          	lw	a5,-20(s0)
40002038:	0007a783          	lw	a5,0(a5)
4000203c:	0027f793          	andi	a5,a5,2
40002040:	00f037b3          	snez	a5,a5
40002044:	0ff7f793          	zext.b	a5,a5
}
40002048:	00078513          	mv	a0,a5
4000204c:	01c12403          	lw	s0,28(sp)
40002050:	02010113          	addi	sp,sp,32
40002054:	00008067          	ret

40002058 <vga_run>:
static void vga_run(Vga_Reg *reg){
40002058:	fe010113          	addi	sp,sp,-32
4000205c:	00812e23          	sw	s0,28(sp)
40002060:	02010413          	addi	s0,sp,32
40002064:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40002068:	fec42783          	lw	a5,-20(s0)
4000206c:	00100713          	li	a4,1
40002070:	00e7a023          	sw	a4,0(a5)
}
40002074:	00000013          	nop
40002078:	01c12403          	lw	s0,28(sp)
4000207c:	02010113          	addi	sp,sp,32
40002080:	00008067          	ret

40002084 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40002084:	fe010113          	addi	sp,sp,-32
40002088:	00112e23          	sw	ra,28(sp)
4000208c:	00812c23          	sw	s0,24(sp)
40002090:	02010413          	addi	s0,sp,32
40002094:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40002098:	fec42783          	lw	a5,-20(s0)
4000209c:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
400020a0:	00000013          	nop
400020a4:	fec42503          	lw	a0,-20(s0)
400020a8:	f7dff0ef          	jal	ra,40002024 <vga_isBusy>
400020ac:	00050793          	mv	a5,a0
400020b0:	fe079ae3          	bnez	a5,400020a4 <vga_stop+0x20>
}
400020b4:	00000013          	nop
400020b8:	00000013          	nop
400020bc:	01c12083          	lw	ra,28(sp)
400020c0:	01812403          	lw	s0,24(sp)
400020c4:	02010113          	addi	sp,sp,32
400020c8:	00008067          	ret

400020cc <aes_write>:
#include "briey.h"
void aes_write(uint32_t iData, uint32_t iAddress)
{
400020cc:	fe010113          	addi	sp,sp,-32
400020d0:	00812e23          	sw	s0,28(sp)
400020d4:	02010413          	addi	s0,sp,32
400020d8:	fea42623          	sw	a0,-20(s0)
400020dc:	feb42423          	sw	a1,-24(s0)
	AES_BASE->ADDRESS		= iAddress;
400020e0:	f00037b7          	lui	a5,0xf0003
400020e4:	40078793          	addi	a5,a5,1024 # f0003400 <_stack_start+0x70002ac0>
400020e8:	fe842703          	lw	a4,-24(s0)
400020ec:	00e7a423          	sw	a4,8(a5)
	AES_BASE->WRITE_ENABLE 	= 1;
400020f0:	f00037b7          	lui	a5,0xf0003
400020f4:	40078793          	addi	a5,a5,1024 # f0003400 <_stack_start+0x70002ac0>
400020f8:	00100713          	li	a4,1
400020fc:	00e7a223          	sw	a4,4(a5)
	AES_BASE->IDATA			= iData;
40002100:	f00037b7          	lui	a5,0xf0003
40002104:	40078793          	addi	a5,a5,1024 # f0003400 <_stack_start+0x70002ac0>
40002108:	fec42703          	lw	a4,-20(s0)
4000210c:	00e7a623          	sw	a4,12(a5)
	AES_BASE->CHIP_SELECT	= 1;
40002110:	f00037b7          	lui	a5,0xf0003
40002114:	40078793          	addi	a5,a5,1024 # f0003400 <_stack_start+0x70002ac0>
40002118:	00100713          	li	a4,1
4000211c:	00e7a023          	sw	a4,0(a5)
	AES_BASE->CHIP_SELECT	= 0;
40002120:	f00037b7          	lui	a5,0xf0003
40002124:	40078793          	addi	a5,a5,1024 # f0003400 <_stack_start+0x70002ac0>
40002128:	0007a023          	sw	zero,0(a5)
}
4000212c:	00000013          	nop
40002130:	01c12403          	lw	s0,28(sp)
40002134:	02010113          	addi	sp,sp,32
40002138:	00008067          	ret

4000213c <aes_read>:
uint32_t aes_read(uint32_t iAddress)
{
4000213c:	fd010113          	addi	sp,sp,-48
40002140:	02812623          	sw	s0,44(sp)
40002144:	03010413          	addi	s0,sp,48
40002148:	fca42e23          	sw	a0,-36(s0)
	AES_BASE->ADDRESS		= iAddress;
4000214c:	f00037b7          	lui	a5,0xf0003
40002150:	40078793          	addi	a5,a5,1024 # f0003400 <_stack_start+0x70002ac0>
40002154:	fdc42703          	lw	a4,-36(s0)
40002158:	00e7a423          	sw	a4,8(a5)
	AES_BASE->WRITE_ENABLE	= 0;
4000215c:	f00037b7          	lui	a5,0xf0003
40002160:	40078793          	addi	a5,a5,1024 # f0003400 <_stack_start+0x70002ac0>
40002164:	0007a223          	sw	zero,4(a5)
	AES_BASE->CHIP_SELECT	= 1;
40002168:	f00037b7          	lui	a5,0xf0003
4000216c:	40078793          	addi	a5,a5,1024 # f0003400 <_stack_start+0x70002ac0>
40002170:	00100713          	li	a4,1
40002174:	00e7a023          	sw	a4,0(a5)
	uint32_t res 				= AES_BASE->ODATA;
40002178:	f00037b7          	lui	a5,0xf0003
4000217c:	40078793          	addi	a5,a5,1024 # f0003400 <_stack_start+0x70002ac0>
40002180:	0107a783          	lw	a5,16(a5)
40002184:	fef42623          	sw	a5,-20(s0)
	AES_BASE->CHIP_SELECT	= 0;
40002188:	f00037b7          	lui	a5,0xf0003
4000218c:	40078793          	addi	a5,a5,1024 # f0003400 <_stack_start+0x70002ac0>
40002190:	0007a023          	sw	zero,0(a5)
	return res;
40002194:	fec42783          	lw	a5,-20(s0)
}
40002198:	00078513          	mv	a0,a5
4000219c:	02c12403          	lw	s0,44(sp)
400021a0:	03010113          	addi	sp,sp,48
400021a4:	00008067          	ret

400021a8 <aes_128_cipher>:
void aes_128_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
400021a8:	fd010113          	addi	sp,sp,-48
400021ac:	02112623          	sw	ra,44(sp)
400021b0:	02812423          	sw	s0,40(sp)
400021b4:	02912223          	sw	s1,36(sp)
400021b8:	03010413          	addi	s0,sp,48
400021bc:	00050793          	mv	a5,a0
400021c0:	fcb42c23          	sw	a1,-40(s0)
400021c4:	fcc42a23          	sw	a2,-44(s0)
400021c8:	fcd42823          	sw	a3,-48(s0)
400021cc:	fcf40fa3          	sb	a5,-33(s0)
	aes_write(0x0,AES_ADDR_KEY_BASE +7);
400021d0:	01700593          	li	a1,23
400021d4:	00000513          	li	a0,0
400021d8:	ef5ff0ef          	jal	ra,400020cc <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +6);
400021dc:	01600593          	li	a1,22
400021e0:	00000513          	li	a0,0
400021e4:	ee9ff0ef          	jal	ra,400020cc <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +5);
400021e8:	01500593          	li	a1,21
400021ec:	00000513          	li	a0,0
400021f0:	eddff0ef          	jal	ra,400020cc <aes_write>
	aes_write(0x0,AES_ADDR_KEY_BASE +4);
400021f4:	01400593          	li	a1,20
400021f8:	00000513          	li	a0,0
400021fc:	ed1ff0ef          	jal	ra,400020cc <aes_write>
	aes_write(key[3],AES_ADDR_KEY_BASE +3);
40002200:	fd842783          	lw	a5,-40(s0)
40002204:	00c78793          	addi	a5,a5,12
40002208:	0007a783          	lw	a5,0(a5)
4000220c:	01300593          	li	a1,19
40002210:	00078513          	mv	a0,a5
40002214:	eb9ff0ef          	jal	ra,400020cc <aes_write>
	aes_write(key[2],AES_ADDR_KEY_BASE +2);
40002218:	fd842783          	lw	a5,-40(s0)
4000221c:	00878793          	addi	a5,a5,8
40002220:	0007a783          	lw	a5,0(a5)
40002224:	01200593          	li	a1,18
40002228:	00078513          	mv	a0,a5
4000222c:	ea1ff0ef          	jal	ra,400020cc <aes_write>
	aes_write(key[1],AES_ADDR_KEY_BASE +1);
40002230:	fd842783          	lw	a5,-40(s0)
40002234:	00478793          	addi	a5,a5,4
40002238:	0007a783          	lw	a5,0(a5)
4000223c:	01100593          	li	a1,17
40002240:	00078513          	mv	a0,a5
40002244:	e89ff0ef          	jal	ra,400020cc <aes_write>
	aes_write(key[0],AES_ADDR_KEY_BASE);
40002248:	fd842783          	lw	a5,-40(s0)
4000224c:	0007a783          	lw	a5,0(a5)
40002250:	01000593          	li	a1,16
40002254:	00078513          	mv	a0,a5
40002258:	e75ff0ef          	jal	ra,400020cc <aes_write>

	aes_write(AES_CONFIG_128_KEY,AES_ADDR_CONFIG);
4000225c:	00a00593          	li	a1,10
40002260:	00000513          	li	a0,0
40002264:	e69ff0ef          	jal	ra,400020cc <aes_write>
	aes_write(AES_CTRL_INIT_KEY,AES_ADDR_CTRL);
40002268:	00800593          	li	a1,8
4000226c:	00100513          	li	a0,1
40002270:	e5dff0ef          	jal	ra,400020cc <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
40002274:	00000013          	nop
40002278:	00900513          	li	a0,9
4000227c:	ec1ff0ef          	jal	ra,4000213c <aes_read>
40002280:	00050793          	mv	a5,a0
40002284:	fe078ae3          	beqz	a5,40002278 <aes_128_cipher+0xd0>

    aes_write(block[3],AES_ADDR_BLOCK_BASE + 3);
40002288:	fd442783          	lw	a5,-44(s0)
4000228c:	00c78793          	addi	a5,a5,12
40002290:	0007a783          	lw	a5,0(a5)
40002294:	02300593          	li	a1,35
40002298:	00078513          	mv	a0,a5
4000229c:	e31ff0ef          	jal	ra,400020cc <aes_write>
    aes_write(block[2],AES_ADDR_BLOCK_BASE + 2);
400022a0:	fd442783          	lw	a5,-44(s0)
400022a4:	00878793          	addi	a5,a5,8
400022a8:	0007a783          	lw	a5,0(a5)
400022ac:	02200593          	li	a1,34
400022b0:	00078513          	mv	a0,a5
400022b4:	e19ff0ef          	jal	ra,400020cc <aes_write>
    aes_write(block[1],AES_ADDR_BLOCK_BASE + 1);
400022b8:	fd442783          	lw	a5,-44(s0)
400022bc:	00478793          	addi	a5,a5,4
400022c0:	0007a783          	lw	a5,0(a5)
400022c4:	02100593          	li	a1,33
400022c8:	00078513          	mv	a0,a5
400022cc:	e01ff0ef          	jal	ra,400020cc <aes_write>
    aes_write(block[0],AES_ADDR_BLOCK_BASE + 0);
400022d0:	fd442783          	lw	a5,-44(s0)
400022d4:	0007a783          	lw	a5,0(a5)
400022d8:	02000593          	li	a1,32
400022dc:	00078513          	mv	a0,a5
400022e0:	dedff0ef          	jal	ra,400020cc <aes_write>


    unsigned char AES_CONFIG = 0x00;
400022e4:	fe0407a3          	sb	zero,-17(s0)
	if (operation == 0x01)
400022e8:	fdf44703          	lbu	a4,-33(s0)
400022ec:	00100793          	li	a5,1
400022f0:	00f71863          	bne	a4,a5,40002300 <aes_128_cipher+0x158>
		AES_CONFIG = AES_CONFIG_128_EN;
400022f4:	00100793          	li	a5,1
400022f8:	fef407a3          	sb	a5,-17(s0)
400022fc:	0080006f          	j	40002304 <aes_128_cipher+0x15c>
	else
		AES_CONFIG = AES_CONFIG_128_DE;
40002300:	fe0407a3          	sb	zero,-17(s0)

	aes_write(AES_CONFIG,AES_ADDR_CONFIG);
40002304:	fef44783          	lbu	a5,-17(s0)
40002308:	00a00593          	li	a1,10
4000230c:	00078513          	mv	a0,a5
40002310:	dbdff0ef          	jal	ra,400020cc <aes_write>
    aes_write(AES_CTRL_START, AES_ADDR_CTRL);
40002314:	00800593          	li	a1,8
40002318:	00200513          	li	a0,2
4000231c:	db1ff0ef          	jal	ra,400020cc <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
40002320:	00000013          	nop
40002324:	00900513          	li	a0,9
40002328:	e15ff0ef          	jal	ra,4000213c <aes_read>
4000232c:	00050793          	mv	a5,a0
40002330:	fe078ae3          	beqz	a5,40002324 <aes_128_cipher+0x17c>

    res[3] = aes_read(AES_ADDR_RESULT_BASE + 3);
40002334:	fd042783          	lw	a5,-48(s0)
40002338:	00c78493          	addi	s1,a5,12
4000233c:	03300513          	li	a0,51
40002340:	dfdff0ef          	jal	ra,4000213c <aes_read>
40002344:	00050793          	mv	a5,a0
40002348:	00f4a023          	sw	a5,0(s1)
    res[2] = aes_read(AES_ADDR_RESULT_BASE + 2);
4000234c:	fd042783          	lw	a5,-48(s0)
40002350:	00878493          	addi	s1,a5,8
40002354:	03200513          	li	a0,50
40002358:	de5ff0ef          	jal	ra,4000213c <aes_read>
4000235c:	00050793          	mv	a5,a0
40002360:	00f4a023          	sw	a5,0(s1)
    res[1] = aes_read(AES_ADDR_RESULT_BASE + 1);
40002364:	fd042783          	lw	a5,-48(s0)
40002368:	00478493          	addi	s1,a5,4
4000236c:	03100513          	li	a0,49
40002370:	dcdff0ef          	jal	ra,4000213c <aes_read>
40002374:	00050793          	mv	a5,a0
40002378:	00f4a023          	sw	a5,0(s1)
    res[0] = aes_read(AES_ADDR_RESULT_BASE + 0);
4000237c:	03000513          	li	a0,48
40002380:	dbdff0ef          	jal	ra,4000213c <aes_read>
40002384:	00050713          	mv	a4,a0
40002388:	fd042783          	lw	a5,-48(s0)
4000238c:	00e7a023          	sw	a4,0(a5)

    //print result to terminal
	if(operation == 0x1)
40002390:	fdf44703          	lbu	a4,-33(s0)
40002394:	00100793          	li	a5,1
40002398:	00f71a63          	bne	a4,a5,400023ac <aes_128_cipher+0x204>
		print("\r\t============================AES128 ENCRYPTTION==============================\r\n");
4000239c:	400047b7          	lui	a5,0x40004
400023a0:	5a478513          	addi	a0,a5,1444 # 400045a4 <vga_simRes_h160_v120+0x20>
400023a4:	524000ef          	jal	ra,400028c8 <print>
400023a8:	0100006f          	j	400023b8 <aes_128_cipher+0x210>
	else
		print("\r\t============================AES128 DECRYPTTION==============================\r\n");
400023ac:	400047b7          	lui	a5,0x40004
400023b0:	5f878513          	addi	a0,a5,1528 # 400045f8 <vga_simRes_h160_v120+0x74>
400023b4:	514000ef          	jal	ra,400028c8 <print>
	print128bit("\r\tPLAIN_TEXT (128-bit) : ", block);
400023b8:	fd442583          	lw	a1,-44(s0)
400023bc:	400047b7          	lui	a5,0x40004
400023c0:	64c78513          	addi	a0,a5,1612 # 4000464c <vga_simRes_h160_v120+0xc8>
400023c4:	7dc000ef          	jal	ra,40002ba0 <print128bit>
	print128bit("KEY (128-bit) : ", key);
400023c8:	fd842583          	lw	a1,-40(s0)
400023cc:	400047b7          	lui	a5,0x40004
400023d0:	66878513          	addi	a0,a5,1640 # 40004668 <vga_simRes_h160_v120+0xe4>
400023d4:	7cc000ef          	jal	ra,40002ba0 <print128bit>
	print128bit("RESULT (128-bit) : ", res);
400023d8:	fd042583          	lw	a1,-48(s0)
400023dc:	400047b7          	lui	a5,0x40004
400023e0:	67c78513          	addi	a0,a5,1660 # 4000467c <vga_simRes_h160_v120+0xf8>
400023e4:	7bc000ef          	jal	ra,40002ba0 <print128bit>
}
400023e8:	00000013          	nop
400023ec:	02c12083          	lw	ra,44(sp)
400023f0:	02812403          	lw	s0,40(sp)
400023f4:	02412483          	lw	s1,36(sp)
400023f8:	03010113          	addi	sp,sp,48
400023fc:	00008067          	ret

40002400 <aes_256_cipher>:

void aes_256_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
40002400:	fd010113          	addi	sp,sp,-48
40002404:	02112623          	sw	ra,44(sp)
40002408:	02812423          	sw	s0,40(sp)
4000240c:	02912223          	sw	s1,36(sp)
40002410:	03010413          	addi	s0,sp,48
40002414:	00050793          	mv	a5,a0
40002418:	fcb42c23          	sw	a1,-40(s0)
4000241c:	fcc42a23          	sw	a2,-44(s0)
40002420:	fcd42823          	sw	a3,-48(s0)
40002424:	fcf40fa3          	sb	a5,-33(s0)
	aes_write(key[7],AES_ADDR_KEY_BASE +7);
40002428:	fd842783          	lw	a5,-40(s0)
4000242c:	01c78793          	addi	a5,a5,28
40002430:	0007a783          	lw	a5,0(a5)
40002434:	01700593          	li	a1,23
40002438:	00078513          	mv	a0,a5
4000243c:	c91ff0ef          	jal	ra,400020cc <aes_write>
	aes_write(key[6],AES_ADDR_KEY_BASE +6);
40002440:	fd842783          	lw	a5,-40(s0)
40002444:	01878793          	addi	a5,a5,24
40002448:	0007a783          	lw	a5,0(a5)
4000244c:	01600593          	li	a1,22
40002450:	00078513          	mv	a0,a5
40002454:	c79ff0ef          	jal	ra,400020cc <aes_write>
	aes_write(key[5],AES_ADDR_KEY_BASE +5);
40002458:	fd842783          	lw	a5,-40(s0)
4000245c:	01478793          	addi	a5,a5,20
40002460:	0007a783          	lw	a5,0(a5)
40002464:	01500593          	li	a1,21
40002468:	00078513          	mv	a0,a5
4000246c:	c61ff0ef          	jal	ra,400020cc <aes_write>
	aes_write(key[4],AES_ADDR_KEY_BASE +4);
40002470:	fd842783          	lw	a5,-40(s0)
40002474:	01078793          	addi	a5,a5,16
40002478:	0007a783          	lw	a5,0(a5)
4000247c:	01400593          	li	a1,20
40002480:	00078513          	mv	a0,a5
40002484:	c49ff0ef          	jal	ra,400020cc <aes_write>
	aes_write(key[3],AES_ADDR_KEY_BASE +3);
40002488:	fd842783          	lw	a5,-40(s0)
4000248c:	00c78793          	addi	a5,a5,12
40002490:	0007a783          	lw	a5,0(a5)
40002494:	01300593          	li	a1,19
40002498:	00078513          	mv	a0,a5
4000249c:	c31ff0ef          	jal	ra,400020cc <aes_write>
	aes_write(key[2],AES_ADDR_KEY_BASE +2);
400024a0:	fd842783          	lw	a5,-40(s0)
400024a4:	00878793          	addi	a5,a5,8
400024a8:	0007a783          	lw	a5,0(a5)
400024ac:	01200593          	li	a1,18
400024b0:	00078513          	mv	a0,a5
400024b4:	c19ff0ef          	jal	ra,400020cc <aes_write>
	aes_write(key[1],AES_ADDR_KEY_BASE +1);
400024b8:	fd842783          	lw	a5,-40(s0)
400024bc:	00478793          	addi	a5,a5,4
400024c0:	0007a783          	lw	a5,0(a5)
400024c4:	01100593          	li	a1,17
400024c8:	00078513          	mv	a0,a5
400024cc:	c01ff0ef          	jal	ra,400020cc <aes_write>
	aes_write(key[0],AES_ADDR_KEY_BASE);
400024d0:	fd842783          	lw	a5,-40(s0)
400024d4:	0007a783          	lw	a5,0(a5)
400024d8:	01000593          	li	a1,16
400024dc:	00078513          	mv	a0,a5
400024e0:	bedff0ef          	jal	ra,400020cc <aes_write>

	aes_write(AES_CONFIG_256_KEY,AES_ADDR_CONFIG);
400024e4:	00a00593          	li	a1,10
400024e8:	00200513          	li	a0,2
400024ec:	be1ff0ef          	jal	ra,400020cc <aes_write>
	aes_write(AES_CTRL_INIT_KEY,AES_ADDR_CTRL);
400024f0:	00800593          	li	a1,8
400024f4:	00100513          	li	a0,1
400024f8:	bd5ff0ef          	jal	ra,400020cc <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
400024fc:	00000013          	nop
40002500:	00900513          	li	a0,9
40002504:	c39ff0ef          	jal	ra,4000213c <aes_read>
40002508:	00050793          	mv	a5,a0
4000250c:	fe078ae3          	beqz	a5,40002500 <aes_256_cipher+0x100>

    aes_write(block[3],AES_ADDR_BLOCK_BASE + 3);
40002510:	fd442783          	lw	a5,-44(s0)
40002514:	00c78793          	addi	a5,a5,12
40002518:	0007a783          	lw	a5,0(a5)
4000251c:	02300593          	li	a1,35
40002520:	00078513          	mv	a0,a5
40002524:	ba9ff0ef          	jal	ra,400020cc <aes_write>
    aes_write(block[2],AES_ADDR_BLOCK_BASE + 2);
40002528:	fd442783          	lw	a5,-44(s0)
4000252c:	00878793          	addi	a5,a5,8
40002530:	0007a783          	lw	a5,0(a5)
40002534:	02200593          	li	a1,34
40002538:	00078513          	mv	a0,a5
4000253c:	b91ff0ef          	jal	ra,400020cc <aes_write>
    aes_write(block[1],AES_ADDR_BLOCK_BASE + 1);
40002540:	fd442783          	lw	a5,-44(s0)
40002544:	00478793          	addi	a5,a5,4
40002548:	0007a783          	lw	a5,0(a5)
4000254c:	02100593          	li	a1,33
40002550:	00078513          	mv	a0,a5
40002554:	b79ff0ef          	jal	ra,400020cc <aes_write>
    aes_write(block[0],AES_ADDR_BLOCK_BASE + 0);
40002558:	fd442783          	lw	a5,-44(s0)
4000255c:	0007a783          	lw	a5,0(a5)
40002560:	02000593          	li	a1,32
40002564:	00078513          	mv	a0,a5
40002568:	b65ff0ef          	jal	ra,400020cc <aes_write>


    unsigned char AES_CONFIG = 0x00;
4000256c:	fe0407a3          	sb	zero,-17(s0)
	if (operation == 0x01)
40002570:	fdf44703          	lbu	a4,-33(s0)
40002574:	00100793          	li	a5,1
40002578:	00f71863          	bne	a4,a5,40002588 <aes_256_cipher+0x188>
		AES_CONFIG = AES_CONFIG_256_EN;
4000257c:	00300793          	li	a5,3
40002580:	fef407a3          	sb	a5,-17(s0)
40002584:	00c0006f          	j	40002590 <aes_256_cipher+0x190>
	else
		AES_CONFIG = AES_CONFIG_256_DE;
40002588:	00200793          	li	a5,2
4000258c:	fef407a3          	sb	a5,-17(s0)

	aes_write(AES_CONFIG, AES_ADDR_CONFIG);
40002590:	fef44783          	lbu	a5,-17(s0)
40002594:	00a00593          	li	a1,10
40002598:	00078513          	mv	a0,a5
4000259c:	b31ff0ef          	jal	ra,400020cc <aes_write>
    aes_write(AES_CTRL_START, AES_ADDR_CTRL);
400025a0:	00800593          	li	a1,8
400025a4:	00200513          	li	a0,2
400025a8:	b25ff0ef          	jal	ra,400020cc <aes_write>

    while(aes_read(AES_ADDR_STATUS) == 0);
400025ac:	00000013          	nop
400025b0:	00900513          	li	a0,9
400025b4:	b89ff0ef          	jal	ra,4000213c <aes_read>
400025b8:	00050793          	mv	a5,a0
400025bc:	fe078ae3          	beqz	a5,400025b0 <aes_256_cipher+0x1b0>

    res[3] = aes_read(AES_ADDR_RESULT_BASE + 3);
400025c0:	fd042783          	lw	a5,-48(s0)
400025c4:	00c78493          	addi	s1,a5,12
400025c8:	03300513          	li	a0,51
400025cc:	b71ff0ef          	jal	ra,4000213c <aes_read>
400025d0:	00050793          	mv	a5,a0
400025d4:	00f4a023          	sw	a5,0(s1)
    res[2] = aes_read(AES_ADDR_RESULT_BASE + 2);
400025d8:	fd042783          	lw	a5,-48(s0)
400025dc:	00878493          	addi	s1,a5,8
400025e0:	03200513          	li	a0,50
400025e4:	b59ff0ef          	jal	ra,4000213c <aes_read>
400025e8:	00050793          	mv	a5,a0
400025ec:	00f4a023          	sw	a5,0(s1)
    res[1] = aes_read(AES_ADDR_RESULT_BASE + 1);
400025f0:	fd042783          	lw	a5,-48(s0)
400025f4:	00478493          	addi	s1,a5,4
400025f8:	03100513          	li	a0,49
400025fc:	b41ff0ef          	jal	ra,4000213c <aes_read>
40002600:	00050793          	mv	a5,a0
40002604:	00f4a023          	sw	a5,0(s1)
    res[0] = aes_read(AES_ADDR_RESULT_BASE + 0);
40002608:	03000513          	li	a0,48
4000260c:	b31ff0ef          	jal	ra,4000213c <aes_read>
40002610:	00050713          	mv	a4,a0
40002614:	fd042783          	lw	a5,-48(s0)
40002618:	00e7a023          	sw	a4,0(a5)

    //print result to terminal
	if(operation == 0x1)
4000261c:	fdf44703          	lbu	a4,-33(s0)
40002620:	00100793          	li	a5,1
40002624:	00f71a63          	bne	a4,a5,40002638 <aes_256_cipher+0x238>
		print("\r\t======================================AES256 ENCRYPTTION========================================\r\n");
40002628:	400047b7          	lui	a5,0x40004
4000262c:	69078513          	addi	a0,a5,1680 # 40004690 <vga_simRes_h160_v120+0x10c>
40002630:	298000ef          	jal	ra,400028c8 <print>
40002634:	0100006f          	j	40002644 <aes_256_cipher+0x244>
	else
		print("\r\t======================================AES256 DECRYPTTION========================================\r\n");
40002638:	400047b7          	lui	a5,0x40004
4000263c:	6f878513          	addi	a0,a5,1784 # 400046f8 <vga_simRes_h160_v120+0x174>
40002640:	288000ef          	jal	ra,400028c8 <print>
	print128bit("\r\tPLAIN_TEXT (128-bit) : ", block);
40002644:	fd442583          	lw	a1,-44(s0)
40002648:	400047b7          	lui	a5,0x40004
4000264c:	64c78513          	addi	a0,a5,1612 # 4000464c <vga_simRes_h160_v120+0xc8>
40002650:	550000ef          	jal	ra,40002ba0 <print128bit>
	print256bit("KEY (256-bit) : ", key);
40002654:	fd842583          	lw	a1,-40(s0)
40002658:	400047b7          	lui	a5,0x40004
4000265c:	76078513          	addi	a0,a5,1888 # 40004760 <vga_simRes_h160_v120+0x1dc>
40002660:	65c000ef          	jal	ra,40002cbc <print256bit>
	print128bit("RESULT (128-bit) : ", res);
40002664:	fd042583          	lw	a1,-48(s0)
40002668:	400047b7          	lui	a5,0x40004
4000266c:	67c78513          	addi	a0,a5,1660 # 4000467c <vga_simRes_h160_v120+0xf8>
40002670:	530000ef          	jal	ra,40002ba0 <print128bit>
}
40002674:	00000013          	nop
40002678:	02c12083          	lw	ra,44(sp)
4000267c:	02812403          	lw	s0,40(sp)
40002680:	02412483          	lw	s1,36(sp)
40002684:	03010113          	addi	sp,sp,48
40002688:	00008067          	ret

4000268c <timer_init>:
static void timer_init(Timer_Reg *reg){
4000268c:	fe010113          	addi	sp,sp,-32
40002690:	00812e23          	sw	s0,28(sp)
40002694:	02010413          	addi	s0,sp,32
40002698:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
4000269c:	fec42783          	lw	a5,-20(s0)
400026a0:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
400026a4:	fec42783          	lw	a5,-20(s0)
400026a8:	0007a423          	sw	zero,8(a5)
}
400026ac:	00000013          	nop
400026b0:	01c12403          	lw	s0,28(sp)
400026b4:	02010113          	addi	sp,sp,32
400026b8:	00008067          	ret

400026bc <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
400026bc:	fe010113          	addi	sp,sp,-32
400026c0:	00812e23          	sw	s0,28(sp)
400026c4:	02010413          	addi	s0,sp,32
400026c8:	fea42623          	sw	a0,-20(s0)
}
400026cc:	00000013          	nop
400026d0:	01c12403          	lw	s0,28(sp)
400026d4:	02010113          	addi	sp,sp,32
400026d8:	00008067          	ret

400026dc <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
400026dc:	fe010113          	addi	sp,sp,-32
400026e0:	00812e23          	sw	s0,28(sp)
400026e4:	02010413          	addi	s0,sp,32
400026e8:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
400026ec:	fec42783          	lw	a5,-20(s0)
400026f0:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
400026f4:	fec42783          	lw	a5,-20(s0)
400026f8:	fff00713          	li	a4,-1
400026fc:	00e7a023          	sw	a4,0(a5)
}
40002700:	00000013          	nop
40002704:	01c12403          	lw	s0,28(sp)
40002708:	02010113          	addi	sp,sp,32
4000270c:	00008067          	ret

40002710 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40002710:	fe010113          	addi	sp,sp,-32
40002714:	00812e23          	sw	s0,28(sp)
40002718:	02010413          	addi	s0,sp,32
4000271c:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40002720:	fec42783          	lw	a5,-20(s0)
40002724:	0047a783          	lw	a5,4(a5)
40002728:	0107d793          	srli	a5,a5,0x10
4000272c:	0ff7f793          	zext.b	a5,a5
}
40002730:	00078513          	mv	a0,a5
40002734:	01c12403          	lw	s0,28(sp)
40002738:	02010113          	addi	sp,sp,32
4000273c:	00008067          	ret

40002740 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40002740:	fe010113          	addi	sp,sp,-32
40002744:	00812e23          	sw	s0,28(sp)
40002748:	02010413          	addi	s0,sp,32
4000274c:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40002750:	fec42783          	lw	a5,-20(s0)
40002754:	0047a783          	lw	a5,4(a5)
40002758:	0187d793          	srli	a5,a5,0x18
}
4000275c:	00078513          	mv	a0,a5
40002760:	01c12403          	lw	s0,28(sp)
40002764:	02010113          	addi	sp,sp,32
40002768:	00008067          	ret

4000276c <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
4000276c:	fe010113          	addi	sp,sp,-32
40002770:	00112e23          	sw	ra,28(sp)
40002774:	00812c23          	sw	s0,24(sp)
40002778:	02010413          	addi	s0,sp,32
4000277c:	fea42623          	sw	a0,-20(s0)
40002780:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40002784:	00000013          	nop
40002788:	fec42503          	lw	a0,-20(s0)
4000278c:	f85ff0ef          	jal	ra,40002710 <uart_writeAvailability>
40002790:	00050793          	mv	a5,a0
40002794:	fe078ae3          	beqz	a5,40002788 <uart_write+0x1c>
	reg->DATA = data;
40002798:	fec42783          	lw	a5,-20(s0)
4000279c:	fe842703          	lw	a4,-24(s0)
400027a0:	00e7a023          	sw	a4,0(a5)
}
400027a4:	00000013          	nop
400027a8:	01c12083          	lw	ra,28(sp)
400027ac:	01812403          	lw	s0,24(sp)
400027b0:	02010113          	addi	sp,sp,32
400027b4:	00008067          	ret

400027b8 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
400027b8:	fe010113          	addi	sp,sp,-32
400027bc:	00812e23          	sw	s0,28(sp)
400027c0:	02010413          	addi	s0,sp,32
400027c4:	fea42623          	sw	a0,-20(s0)
400027c8:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
400027cc:	fe842783          	lw	a5,-24(s0)
400027d0:	00c7a703          	lw	a4,12(a5)
400027d4:	fec42783          	lw	a5,-20(s0)
400027d8:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
400027dc:	fe842783          	lw	a5,-24(s0)
400027e0:	0007a783          	lw	a5,0(a5)
400027e4:	fff78713          	addi	a4,a5,-1
400027e8:	fe842783          	lw	a5,-24(s0)
400027ec:	0047a783          	lw	a5,4(a5)
400027f0:	00879793          	slli	a5,a5,0x8
400027f4:	00f76733          	or	a4,a4,a5
400027f8:	fe842783          	lw	a5,-24(s0)
400027fc:	0087a783          	lw	a5,8(a5)
40002800:	01079793          	slli	a5,a5,0x10
40002804:	00f76733          	or	a4,a4,a5
40002808:	fec42783          	lw	a5,-20(s0)
4000280c:	00e7a623          	sw	a4,12(a5)
}
40002810:	00000013          	nop
40002814:	01c12403          	lw	s0,28(sp)
40002818:	02010113          	addi	sp,sp,32
4000281c:	00008067          	ret

40002820 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40002820:	fe010113          	addi	sp,sp,-32
40002824:	00812e23          	sw	s0,28(sp)
40002828:	02010413          	addi	s0,sp,32
4000282c:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40002830:	fec42783          	lw	a5,-20(s0)
40002834:	0007a783          	lw	a5,0(a5)
40002838:	0027f793          	andi	a5,a5,2
4000283c:	00f037b3          	snez	a5,a5
40002840:	0ff7f793          	zext.b	a5,a5
}
40002844:	00078513          	mv	a0,a5
40002848:	01c12403          	lw	s0,28(sp)
4000284c:	02010113          	addi	sp,sp,32
40002850:	00008067          	ret

40002854 <vga_run>:
static void vga_run(Vga_Reg *reg){
40002854:	fe010113          	addi	sp,sp,-32
40002858:	00812e23          	sw	s0,28(sp)
4000285c:	02010413          	addi	s0,sp,32
40002860:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40002864:	fec42783          	lw	a5,-20(s0)
40002868:	00100713          	li	a4,1
4000286c:	00e7a023          	sw	a4,0(a5)
}
40002870:	00000013          	nop
40002874:	01c12403          	lw	s0,28(sp)
40002878:	02010113          	addi	sp,sp,32
4000287c:	00008067          	ret

40002880 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40002880:	fe010113          	addi	sp,sp,-32
40002884:	00112e23          	sw	ra,28(sp)
40002888:	00812c23          	sw	s0,24(sp)
4000288c:	02010413          	addi	s0,sp,32
40002890:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40002894:	fec42783          	lw	a5,-20(s0)
40002898:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
4000289c:	00000013          	nop
400028a0:	fec42503          	lw	a0,-20(s0)
400028a4:	f7dff0ef          	jal	ra,40002820 <vga_isBusy>
400028a8:	00050793          	mv	a5,a0
400028ac:	fe079ae3          	bnez	a5,400028a0 <vga_stop+0x20>
}
400028b0:	00000013          	nop
400028b4:	00000013          	nop
400028b8:	01c12083          	lw	ra,28(sp)
400028bc:	01812403          	lw	s0,24(sp)
400028c0:	02010113          	addi	sp,sp,32
400028c4:	00008067          	ret

400028c8 <print>:
#include <briey.h>

void print(char *str){
400028c8:	fe010113          	addi	sp,sp,-32
400028cc:	00112e23          	sw	ra,28(sp)
400028d0:	00812c23          	sw	s0,24(sp)
400028d4:	02010413          	addi	s0,sp,32
400028d8:	fea42623          	sw	a0,-20(s0)
	while(*str){
400028dc:	0200006f          	j	400028fc <print+0x34>
		uart_write(UART,*(str++));
400028e0:	fec42783          	lw	a5,-20(s0)
400028e4:	00178713          	addi	a4,a5,1
400028e8:	fee42623          	sw	a4,-20(s0)
400028ec:	0007c783          	lbu	a5,0(a5)
400028f0:	00078593          	mv	a1,a5
400028f4:	f0010537          	lui	a0,0xf0010
400028f8:	e75ff0ef          	jal	ra,4000276c <uart_write>
	while(*str){
400028fc:	fec42783          	lw	a5,-20(s0)
40002900:	0007c783          	lbu	a5,0(a5)
40002904:	fc079ee3          	bnez	a5,400028e0 <print+0x18>
	}
}
40002908:	00000013          	nop
4000290c:	00000013          	nop
40002910:	01c12083          	lw	ra,28(sp)
40002914:	01812403          	lw	s0,24(sp)
40002918:	02010113          	addi	sp,sp,32
4000291c:	00008067          	ret

40002920 <print16bit>:

void print16bit(uint32_t n)
{
40002920:	fc010113          	addi	sp,sp,-64
40002924:	02112e23          	sw	ra,60(sp)
40002928:	02812c23          	sw	s0,56(sp)
4000292c:	04010413          	addi	s0,sp,64
40002930:	fca42623          	sw	a0,-52(s0)

    int i = 0;
40002934:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40002938:	fc042e23          	sw	zero,-36(s0)
4000293c:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40002940:	fcc42783          	lw	a5,-52(s0)
40002944:	00f7f793          	andi	a5,a5,15
40002948:	40004737          	lui	a4,0x40004
4000294c:	7d870713          	addi	a4,a4,2008 # 400047d8 <vga_simRes_h160_v120+0x24>
40002950:	00f707b3          	add	a5,a4,a5
40002954:	0007c703          	lbu	a4,0(a5)
40002958:	fec42783          	lw	a5,-20(s0)
4000295c:	ff040693          	addi	a3,s0,-16
40002960:	00f687b3          	add	a5,a3,a5
40002964:	fee78623          	sb	a4,-20(a5)
        i++;
40002968:	fec42783          	lw	a5,-20(s0)
4000296c:	00178793          	addi	a5,a5,1
40002970:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40002974:	fcc42783          	lw	a5,-52(s0)
40002978:	0047d793          	srli	a5,a5,0x4
4000297c:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40002980:	fcc42783          	lw	a5,-52(s0)
40002984:	fa079ee3          	bnez	a5,40002940 <print16bit+0x20>
    if(i<8) {
40002988:	fec42703          	lw	a4,-20(s0)
4000298c:	00700793          	li	a5,7
40002990:	02e7ce63          	blt	a5,a4,400029cc <print16bit+0xac>
    	for(int j=7;j>=i;j--){
40002994:	00700793          	li	a5,7
40002998:	fef42423          	sw	a5,-24(s0)
4000299c:	0240006f          	j	400029c0 <print16bit+0xa0>
    		outbuf_inv[j]="0"[0];
400029a0:	03000713          	li	a4,48
400029a4:	fe842783          	lw	a5,-24(s0)
400029a8:	ff040693          	addi	a3,s0,-16
400029ac:	00f687b3          	add	a5,a3,a5
400029b0:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
400029b4:	fe842783          	lw	a5,-24(s0)
400029b8:	fff78793          	addi	a5,a5,-1
400029bc:	fef42423          	sw	a5,-24(s0)
400029c0:	fe842703          	lw	a4,-24(s0)
400029c4:	fec42783          	lw	a5,-20(s0)
400029c8:	fcf75ce3          	bge	a4,a5,400029a0 <print16bit+0x80>
    	}
    }
    for(int j=3;j>=0;j--)
400029cc:	00300793          	li	a5,3
400029d0:	fef42223          	sw	a5,-28(s0)
400029d4:	02c0006f          	j	40002a00 <print16bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
400029d8:	fe442783          	lw	a5,-28(s0)
400029dc:	ff040713          	addi	a4,s0,-16
400029e0:	00f707b3          	add	a5,a4,a5
400029e4:	fec7c783          	lbu	a5,-20(a5)
400029e8:	00078593          	mv	a1,a5
400029ec:	f0010537          	lui	a0,0xf0010
400029f0:	d7dff0ef          	jal	ra,4000276c <uart_write>
    for(int j=3;j>=0;j--)
400029f4:	fe442783          	lw	a5,-28(s0)
400029f8:	fff78793          	addi	a5,a5,-1
400029fc:	fef42223          	sw	a5,-28(s0)
40002a00:	fe442783          	lw	a5,-28(s0)
40002a04:	fc07dae3          	bgez	a5,400029d8 <print16bit+0xb8>
    }
    print(" ");
40002a08:	400047b7          	lui	a5,0x40004
40002a0c:	7d478513          	addi	a0,a5,2004 # 400047d4 <vga_simRes_h160_v120+0x20>
40002a10:	eb9ff0ef          	jal	ra,400028c8 <print>
}
40002a14:	00000013          	nop
40002a18:	03c12083          	lw	ra,60(sp)
40002a1c:	03812403          	lw	s0,56(sp)
40002a20:	04010113          	addi	sp,sp,64
40002a24:	00008067          	ret

40002a28 <print32bit>:
void print32bit(uint32_t n)
{
40002a28:	fc010113          	addi	sp,sp,-64
40002a2c:	02112e23          	sw	ra,60(sp)
40002a30:	02812c23          	sw	s0,56(sp)
40002a34:	04010413          	addi	s0,sp,64
40002a38:	fca42623          	sw	a0,-52(s0)

    int i = 0;
40002a3c:	fe042623          	sw	zero,-20(s0)
    char outbuf_inv[8]="";
40002a40:	fc042e23          	sw	zero,-36(s0)
40002a44:	fe042023          	sw	zero,-32(s0)
    do{
    	outbuf_inv[i] = "0123456789abcdef"[n % 16];
40002a48:	fcc42783          	lw	a5,-52(s0)
40002a4c:	00f7f793          	andi	a5,a5,15
40002a50:	40004737          	lui	a4,0x40004
40002a54:	7d870713          	addi	a4,a4,2008 # 400047d8 <vga_simRes_h160_v120+0x24>
40002a58:	00f707b3          	add	a5,a4,a5
40002a5c:	0007c703          	lbu	a4,0(a5)
40002a60:	fec42783          	lw	a5,-20(s0)
40002a64:	ff040693          	addi	a3,s0,-16
40002a68:	00f687b3          	add	a5,a3,a5
40002a6c:	fee78623          	sb	a4,-20(a5)
        i++;
40002a70:	fec42783          	lw	a5,-20(s0)
40002a74:	00178793          	addi	a5,a5,1
40002a78:	fef42623          	sw	a5,-20(s0)
        n = n/16;
40002a7c:	fcc42783          	lw	a5,-52(s0)
40002a80:	0047d793          	srli	a5,a5,0x4
40002a84:	fcf42623          	sw	a5,-52(s0)
    }while( n > 0);
40002a88:	fcc42783          	lw	a5,-52(s0)
40002a8c:	fa079ee3          	bnez	a5,40002a48 <print32bit+0x20>
    if(i<8) {
40002a90:	fec42703          	lw	a4,-20(s0)
40002a94:	00700793          	li	a5,7
40002a98:	02e7ce63          	blt	a5,a4,40002ad4 <print32bit+0xac>
    	for(int j=7;j>=i;j--){
40002a9c:	00700793          	li	a5,7
40002aa0:	fef42423          	sw	a5,-24(s0)
40002aa4:	0240006f          	j	40002ac8 <print32bit+0xa0>
    		outbuf_inv[j]="0"[0];
40002aa8:	03000713          	li	a4,48
40002aac:	fe842783          	lw	a5,-24(s0)
40002ab0:	ff040693          	addi	a3,s0,-16
40002ab4:	00f687b3          	add	a5,a3,a5
40002ab8:	fee78623          	sb	a4,-20(a5)
    	for(int j=7;j>=i;j--){
40002abc:	fe842783          	lw	a5,-24(s0)
40002ac0:	fff78793          	addi	a5,a5,-1
40002ac4:	fef42423          	sw	a5,-24(s0)
40002ac8:	fe842703          	lw	a4,-24(s0)
40002acc:	fec42783          	lw	a5,-20(s0)
40002ad0:	fcf75ce3          	bge	a4,a5,40002aa8 <print32bit+0x80>
    	}
    }
    for(int j=7;j>=0;j--)
40002ad4:	00700793          	li	a5,7
40002ad8:	fef42223          	sw	a5,-28(s0)
40002adc:	02c0006f          	j	40002b08 <print32bit+0xe0>
    {
    	uart_write(UART,outbuf_inv[j]);
40002ae0:	fe442783          	lw	a5,-28(s0)
40002ae4:	ff040713          	addi	a4,s0,-16
40002ae8:	00f707b3          	add	a5,a4,a5
40002aec:	fec7c783          	lbu	a5,-20(a5)
40002af0:	00078593          	mv	a1,a5
40002af4:	f0010537          	lui	a0,0xf0010
40002af8:	c75ff0ef          	jal	ra,4000276c <uart_write>
    for(int j=7;j>=0;j--)
40002afc:	fe442783          	lw	a5,-28(s0)
40002b00:	fff78793          	addi	a5,a5,-1
40002b04:	fef42223          	sw	a5,-28(s0)
40002b08:	fe442783          	lw	a5,-28(s0)
40002b0c:	fc07dae3          	bgez	a5,40002ae0 <print32bit+0xb8>
    }
    print(" ");
40002b10:	400047b7          	lui	a5,0x40004
40002b14:	7d478513          	addi	a0,a5,2004 # 400047d4 <vga_simRes_h160_v120+0x20>
40002b18:	db1ff0ef          	jal	ra,400028c8 <print>
}
40002b1c:	00000013          	nop
40002b20:	03c12083          	lw	ra,60(sp)
40002b24:	03812403          	lw	s0,56(sp)
40002b28:	04010113          	addi	sp,sp,64
40002b2c:	00008067          	ret

40002b30 <print64bit>:

void print64bit(char *message,uint32_t *num)
{
40002b30:	fe010113          	addi	sp,sp,-32
40002b34:	00112e23          	sw	ra,28(sp)
40002b38:	00812c23          	sw	s0,24(sp)
40002b3c:	02010413          	addi	s0,sp,32
40002b40:	fea42623          	sw	a0,-20(s0)
40002b44:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002b48:	400047b7          	lui	a5,0x40004
40002b4c:	7ec78513          	addi	a0,a5,2028 # 400047ec <vga_simRes_h160_v120+0x38>
40002b50:	d79ff0ef          	jal	ra,400028c8 <print>
	print(message);
40002b54:	fec42503          	lw	a0,-20(s0)
40002b58:	d71ff0ef          	jal	ra,400028c8 <print>
	print32bit(num[1]);
40002b5c:	fe842783          	lw	a5,-24(s0)
40002b60:	00478793          	addi	a5,a5,4
40002b64:	0007a783          	lw	a5,0(a5)
40002b68:	00078513          	mv	a0,a5
40002b6c:	ebdff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[0]);
40002b70:	fe842783          	lw	a5,-24(s0)
40002b74:	0007a783          	lw	a5,0(a5)
40002b78:	00078513          	mv	a0,a5
40002b7c:	eadff0ef          	jal	ra,40002a28 <print32bit>
	print("\r\n");
40002b80:	400047b7          	lui	a5,0x40004
40002b84:	7f078513          	addi	a0,a5,2032 # 400047f0 <vga_simRes_h160_v120+0x3c>
40002b88:	d41ff0ef          	jal	ra,400028c8 <print>
}
40002b8c:	00000013          	nop
40002b90:	01c12083          	lw	ra,28(sp)
40002b94:	01812403          	lw	s0,24(sp)
40002b98:	02010113          	addi	sp,sp,32
40002b9c:	00008067          	ret

40002ba0 <print128bit>:
void print128bit(char *message, uint32_t *num)
{
40002ba0:	fe010113          	addi	sp,sp,-32
40002ba4:	00112e23          	sw	ra,28(sp)
40002ba8:	00812c23          	sw	s0,24(sp)
40002bac:	02010413          	addi	s0,sp,32
40002bb0:	fea42623          	sw	a0,-20(s0)
40002bb4:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002bb8:	400047b7          	lui	a5,0x40004
40002bbc:	7ec78513          	addi	a0,a5,2028 # 400047ec <vga_simRes_h160_v120+0x38>
40002bc0:	d09ff0ef          	jal	ra,400028c8 <print>
	print(message);
40002bc4:	fec42503          	lw	a0,-20(s0)
40002bc8:	d01ff0ef          	jal	ra,400028c8 <print>
	print32bit(num[3]);
40002bcc:	fe842783          	lw	a5,-24(s0)
40002bd0:	00c78793          	addi	a5,a5,12
40002bd4:	0007a783          	lw	a5,0(a5)
40002bd8:	00078513          	mv	a0,a5
40002bdc:	e4dff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[2]);
40002be0:	fe842783          	lw	a5,-24(s0)
40002be4:	00878793          	addi	a5,a5,8
40002be8:	0007a783          	lw	a5,0(a5)
40002bec:	00078513          	mv	a0,a5
40002bf0:	e39ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[1]);
40002bf4:	fe842783          	lw	a5,-24(s0)
40002bf8:	00478793          	addi	a5,a5,4
40002bfc:	0007a783          	lw	a5,0(a5)
40002c00:	00078513          	mv	a0,a5
40002c04:	e25ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[0]);
40002c08:	fe842783          	lw	a5,-24(s0)
40002c0c:	0007a783          	lw	a5,0(a5)
40002c10:	00078513          	mv	a0,a5
40002c14:	e15ff0ef          	jal	ra,40002a28 <print32bit>
	print("\r\n");
40002c18:	400047b7          	lui	a5,0x40004
40002c1c:	7f078513          	addi	a0,a5,2032 # 400047f0 <vga_simRes_h160_v120+0x3c>
40002c20:	ca9ff0ef          	jal	ra,400028c8 <print>
}
40002c24:	00000013          	nop
40002c28:	01c12083          	lw	ra,28(sp)
40002c2c:	01812403          	lw	s0,24(sp)
40002c30:	02010113          	addi	sp,sp,32
40002c34:	00008067          	ret

40002c38 <print80bit>:
void print80bit(char *message,uint32_t *num)
{
40002c38:	fe010113          	addi	sp,sp,-32
40002c3c:	00112e23          	sw	ra,28(sp)
40002c40:	00812c23          	sw	s0,24(sp)
40002c44:	02010413          	addi	s0,sp,32
40002c48:	fea42623          	sw	a0,-20(s0)
40002c4c:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002c50:	400047b7          	lui	a5,0x40004
40002c54:	7ec78513          	addi	a0,a5,2028 # 400047ec <vga_simRes_h160_v120+0x38>
40002c58:	c71ff0ef          	jal	ra,400028c8 <print>
	print(message);
40002c5c:	fec42503          	lw	a0,-20(s0)
40002c60:	c69ff0ef          	jal	ra,400028c8 <print>
	print32bit(num[2]);
40002c64:	fe842783          	lw	a5,-24(s0)
40002c68:	00878793          	addi	a5,a5,8
40002c6c:	0007a783          	lw	a5,0(a5)
40002c70:	00078513          	mv	a0,a5
40002c74:	db5ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[1]);
40002c78:	fe842783          	lw	a5,-24(s0)
40002c7c:	00478793          	addi	a5,a5,4
40002c80:	0007a783          	lw	a5,0(a5)
40002c84:	00078513          	mv	a0,a5
40002c88:	da1ff0ef          	jal	ra,40002a28 <print32bit>
	print16bit(num[0]);
40002c8c:	fe842783          	lw	a5,-24(s0)
40002c90:	0007a783          	lw	a5,0(a5)
40002c94:	00078513          	mv	a0,a5
40002c98:	c89ff0ef          	jal	ra,40002920 <print16bit>
	print("\r\n");
40002c9c:	400047b7          	lui	a5,0x40004
40002ca0:	7f078513          	addi	a0,a5,2032 # 400047f0 <vga_simRes_h160_v120+0x3c>
40002ca4:	c25ff0ef          	jal	ra,400028c8 <print>
}
40002ca8:	00000013          	nop
40002cac:	01c12083          	lw	ra,28(sp)
40002cb0:	01812403          	lw	s0,24(sp)
40002cb4:	02010113          	addi	sp,sp,32
40002cb8:	00008067          	ret

40002cbc <print256bit>:
void print256bit(char *message, uint32_t *num)
{
40002cbc:	fe010113          	addi	sp,sp,-32
40002cc0:	00112e23          	sw	ra,28(sp)
40002cc4:	00812c23          	sw	s0,24(sp)
40002cc8:	02010413          	addi	s0,sp,32
40002ccc:	fea42623          	sw	a0,-20(s0)
40002cd0:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002cd4:	400047b7          	lui	a5,0x40004
40002cd8:	7ec78513          	addi	a0,a5,2028 # 400047ec <vga_simRes_h160_v120+0x38>
40002cdc:	bedff0ef          	jal	ra,400028c8 <print>
	print(message);
40002ce0:	fec42503          	lw	a0,-20(s0)
40002ce4:	be5ff0ef          	jal	ra,400028c8 <print>
	print32bit(num[7]);
40002ce8:	fe842783          	lw	a5,-24(s0)
40002cec:	01c78793          	addi	a5,a5,28
40002cf0:	0007a783          	lw	a5,0(a5)
40002cf4:	00078513          	mv	a0,a5
40002cf8:	d31ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[6]);
40002cfc:	fe842783          	lw	a5,-24(s0)
40002d00:	01878793          	addi	a5,a5,24
40002d04:	0007a783          	lw	a5,0(a5)
40002d08:	00078513          	mv	a0,a5
40002d0c:	d1dff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[5]);
40002d10:	fe842783          	lw	a5,-24(s0)
40002d14:	01478793          	addi	a5,a5,20
40002d18:	0007a783          	lw	a5,0(a5)
40002d1c:	00078513          	mv	a0,a5
40002d20:	d09ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[4]);
40002d24:	fe842783          	lw	a5,-24(s0)
40002d28:	01078793          	addi	a5,a5,16
40002d2c:	0007a783          	lw	a5,0(a5)
40002d30:	00078513          	mv	a0,a5
40002d34:	cf5ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[3]);
40002d38:	fe842783          	lw	a5,-24(s0)
40002d3c:	00c78793          	addi	a5,a5,12
40002d40:	0007a783          	lw	a5,0(a5)
40002d44:	00078513          	mv	a0,a5
40002d48:	ce1ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[2]);
40002d4c:	fe842783          	lw	a5,-24(s0)
40002d50:	00878793          	addi	a5,a5,8
40002d54:	0007a783          	lw	a5,0(a5)
40002d58:	00078513          	mv	a0,a5
40002d5c:	ccdff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[1]);
40002d60:	fe842783          	lw	a5,-24(s0)
40002d64:	00478793          	addi	a5,a5,4
40002d68:	0007a783          	lw	a5,0(a5)
40002d6c:	00078513          	mv	a0,a5
40002d70:	cb9ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[0]);
40002d74:	fe842783          	lw	a5,-24(s0)
40002d78:	0007a783          	lw	a5,0(a5)
40002d7c:	00078513          	mv	a0,a5
40002d80:	ca9ff0ef          	jal	ra,40002a28 <print32bit>
	print("\r\n");
40002d84:	400047b7          	lui	a5,0x40004
40002d88:	7f078513          	addi	a0,a5,2032 # 400047f0 <vga_simRes_h160_v120+0x3c>
40002d8c:	b3dff0ef          	jal	ra,400028c8 <print>
}
40002d90:	00000013          	nop
40002d94:	01c12083          	lw	ra,28(sp)
40002d98:	01812403          	lw	s0,24(sp)
40002d9c:	02010113          	addi	sp,sp,32
40002da0:	00008067          	ret

40002da4 <print512bit>:
void print512bit (char *message, uint32_t *num)
{
40002da4:	fe010113          	addi	sp,sp,-32
40002da8:	00112e23          	sw	ra,28(sp)
40002dac:	00812c23          	sw	s0,24(sp)
40002db0:	02010413          	addi	s0,sp,32
40002db4:	fea42623          	sw	a0,-20(s0)
40002db8:	feb42423          	sw	a1,-24(s0)
	print("\r\t");
40002dbc:	400047b7          	lui	a5,0x40004
40002dc0:	7ec78513          	addi	a0,a5,2028 # 400047ec <vga_simRes_h160_v120+0x38>
40002dc4:	b05ff0ef          	jal	ra,400028c8 <print>
	print(message);
40002dc8:	fec42503          	lw	a0,-20(s0)
40002dcc:	afdff0ef          	jal	ra,400028c8 <print>
	print32bit(num[15]);
40002dd0:	fe842783          	lw	a5,-24(s0)
40002dd4:	03c78793          	addi	a5,a5,60
40002dd8:	0007a783          	lw	a5,0(a5)
40002ddc:	00078513          	mv	a0,a5
40002de0:	c49ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[14]);
40002de4:	fe842783          	lw	a5,-24(s0)
40002de8:	03878793          	addi	a5,a5,56
40002dec:	0007a783          	lw	a5,0(a5)
40002df0:	00078513          	mv	a0,a5
40002df4:	c35ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[13]);
40002df8:	fe842783          	lw	a5,-24(s0)
40002dfc:	03478793          	addi	a5,a5,52
40002e00:	0007a783          	lw	a5,0(a5)
40002e04:	00078513          	mv	a0,a5
40002e08:	c21ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[12]);
40002e0c:	fe842783          	lw	a5,-24(s0)
40002e10:	03078793          	addi	a5,a5,48
40002e14:	0007a783          	lw	a5,0(a5)
40002e18:	00078513          	mv	a0,a5
40002e1c:	c0dff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[11]);
40002e20:	fe842783          	lw	a5,-24(s0)
40002e24:	02c78793          	addi	a5,a5,44
40002e28:	0007a783          	lw	a5,0(a5)
40002e2c:	00078513          	mv	a0,a5
40002e30:	bf9ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[10]);
40002e34:	fe842783          	lw	a5,-24(s0)
40002e38:	02878793          	addi	a5,a5,40
40002e3c:	0007a783          	lw	a5,0(a5)
40002e40:	00078513          	mv	a0,a5
40002e44:	be5ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[9]);
40002e48:	fe842783          	lw	a5,-24(s0)
40002e4c:	02478793          	addi	a5,a5,36
40002e50:	0007a783          	lw	a5,0(a5)
40002e54:	00078513          	mv	a0,a5
40002e58:	bd1ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[8]);
40002e5c:	fe842783          	lw	a5,-24(s0)
40002e60:	02078793          	addi	a5,a5,32
40002e64:	0007a783          	lw	a5,0(a5)
40002e68:	00078513          	mv	a0,a5
40002e6c:	bbdff0ef          	jal	ra,40002a28 <print32bit>
	print("\r\n");
40002e70:	400047b7          	lui	a5,0x40004
40002e74:	7f078513          	addi	a0,a5,2032 # 400047f0 <vga_simRes_h160_v120+0x3c>
40002e78:	a51ff0ef          	jal	ra,400028c8 <print>
	print("\r\t                   ");
40002e7c:	400047b7          	lui	a5,0x40004
40002e80:	7f478513          	addi	a0,a5,2036 # 400047f4 <vga_simRes_h160_v120+0x40>
40002e84:	a45ff0ef          	jal	ra,400028c8 <print>
	print32bit(num[7]);
40002e88:	fe842783          	lw	a5,-24(s0)
40002e8c:	01c78793          	addi	a5,a5,28
40002e90:	0007a783          	lw	a5,0(a5)
40002e94:	00078513          	mv	a0,a5
40002e98:	b91ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[6]);
40002e9c:	fe842783          	lw	a5,-24(s0)
40002ea0:	01878793          	addi	a5,a5,24
40002ea4:	0007a783          	lw	a5,0(a5)
40002ea8:	00078513          	mv	a0,a5
40002eac:	b7dff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[5]);
40002eb0:	fe842783          	lw	a5,-24(s0)
40002eb4:	01478793          	addi	a5,a5,20
40002eb8:	0007a783          	lw	a5,0(a5)
40002ebc:	00078513          	mv	a0,a5
40002ec0:	b69ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[4]);
40002ec4:	fe842783          	lw	a5,-24(s0)
40002ec8:	01078793          	addi	a5,a5,16
40002ecc:	0007a783          	lw	a5,0(a5)
40002ed0:	00078513          	mv	a0,a5
40002ed4:	b55ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[3]);
40002ed8:	fe842783          	lw	a5,-24(s0)
40002edc:	00c78793          	addi	a5,a5,12
40002ee0:	0007a783          	lw	a5,0(a5)
40002ee4:	00078513          	mv	a0,a5
40002ee8:	b41ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[2]);
40002eec:	fe842783          	lw	a5,-24(s0)
40002ef0:	00878793          	addi	a5,a5,8
40002ef4:	0007a783          	lw	a5,0(a5)
40002ef8:	00078513          	mv	a0,a5
40002efc:	b2dff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[1]);
40002f00:	fe842783          	lw	a5,-24(s0)
40002f04:	00478793          	addi	a5,a5,4
40002f08:	0007a783          	lw	a5,0(a5)
40002f0c:	00078513          	mv	a0,a5
40002f10:	b19ff0ef          	jal	ra,40002a28 <print32bit>
	print32bit(num[0]);
40002f14:	fe842783          	lw	a5,-24(s0)
40002f18:	0007a783          	lw	a5,0(a5)
40002f1c:	00078513          	mv	a0,a5
40002f20:	b09ff0ef          	jal	ra,40002a28 <print32bit>
	print("\r\n");
40002f24:	400047b7          	lui	a5,0x40004
40002f28:	7f078513          	addi	a0,a5,2032 # 400047f0 <vga_simRes_h160_v120+0x3c>
40002f2c:	99dff0ef          	jal	ra,400028c8 <print>
}
40002f30:	00000013          	nop
40002f34:	01c12083          	lw	ra,28(sp)
40002f38:	01812403          	lw	s0,24(sp)
40002f3c:	02010113          	addi	sp,sp,32
40002f40:	00008067          	ret

40002f44 <timer_init>:
static void timer_init(Timer_Reg *reg){
40002f44:	fe010113          	addi	sp,sp,-32
40002f48:	00812e23          	sw	s0,28(sp)
40002f4c:	02010413          	addi	s0,sp,32
40002f50:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40002f54:	fec42783          	lw	a5,-20(s0)
40002f58:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40002f5c:	fec42783          	lw	a5,-20(s0)
40002f60:	0007a423          	sw	zero,8(a5)
}
40002f64:	00000013          	nop
40002f68:	01c12403          	lw	s0,28(sp)
40002f6c:	02010113          	addi	sp,sp,32
40002f70:	00008067          	ret

40002f74 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40002f74:	fe010113          	addi	sp,sp,-32
40002f78:	00812e23          	sw	s0,28(sp)
40002f7c:	02010413          	addi	s0,sp,32
40002f80:	fea42623          	sw	a0,-20(s0)
}
40002f84:	00000013          	nop
40002f88:	01c12403          	lw	s0,28(sp)
40002f8c:	02010113          	addi	sp,sp,32
40002f90:	00008067          	ret

40002f94 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40002f94:	fe010113          	addi	sp,sp,-32
40002f98:	00812e23          	sw	s0,28(sp)
40002f9c:	02010413          	addi	s0,sp,32
40002fa0:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40002fa4:	fec42783          	lw	a5,-20(s0)
40002fa8:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40002fac:	fec42783          	lw	a5,-20(s0)
40002fb0:	fff00713          	li	a4,-1
40002fb4:	00e7a023          	sw	a4,0(a5)
}
40002fb8:	00000013          	nop
40002fbc:	01c12403          	lw	s0,28(sp)
40002fc0:	02010113          	addi	sp,sp,32
40002fc4:	00008067          	ret

40002fc8 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40002fc8:	fe010113          	addi	sp,sp,-32
40002fcc:	00812e23          	sw	s0,28(sp)
40002fd0:	02010413          	addi	s0,sp,32
40002fd4:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40002fd8:	fec42783          	lw	a5,-20(s0)
40002fdc:	0047a783          	lw	a5,4(a5)
40002fe0:	0107d793          	srli	a5,a5,0x10
40002fe4:	0ff7f793          	zext.b	a5,a5
}
40002fe8:	00078513          	mv	a0,a5
40002fec:	01c12403          	lw	s0,28(sp)
40002ff0:	02010113          	addi	sp,sp,32
40002ff4:	00008067          	ret

40002ff8 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40002ff8:	fe010113          	addi	sp,sp,-32
40002ffc:	00812e23          	sw	s0,28(sp)
40003000:	02010413          	addi	s0,sp,32
40003004:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40003008:	fec42783          	lw	a5,-20(s0)
4000300c:	0047a783          	lw	a5,4(a5)
40003010:	0187d793          	srli	a5,a5,0x18
}
40003014:	00078513          	mv	a0,a5
40003018:	01c12403          	lw	s0,28(sp)
4000301c:	02010113          	addi	sp,sp,32
40003020:	00008067          	ret

40003024 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40003024:	fe010113          	addi	sp,sp,-32
40003028:	00112e23          	sw	ra,28(sp)
4000302c:	00812c23          	sw	s0,24(sp)
40003030:	02010413          	addi	s0,sp,32
40003034:	fea42623          	sw	a0,-20(s0)
40003038:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
4000303c:	00000013          	nop
40003040:	fec42503          	lw	a0,-20(s0)
40003044:	f85ff0ef          	jal	ra,40002fc8 <uart_writeAvailability>
40003048:	00050793          	mv	a5,a0
4000304c:	fe078ae3          	beqz	a5,40003040 <uart_write+0x1c>
	reg->DATA = data;
40003050:	fec42783          	lw	a5,-20(s0)
40003054:	fe842703          	lw	a4,-24(s0)
40003058:	00e7a023          	sw	a4,0(a5)
}
4000305c:	00000013          	nop
40003060:	01c12083          	lw	ra,28(sp)
40003064:	01812403          	lw	s0,24(sp)
40003068:	02010113          	addi	sp,sp,32
4000306c:	00008067          	ret

40003070 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40003070:	fe010113          	addi	sp,sp,-32
40003074:	00812e23          	sw	s0,28(sp)
40003078:	02010413          	addi	s0,sp,32
4000307c:	fea42623          	sw	a0,-20(s0)
40003080:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40003084:	fe842783          	lw	a5,-24(s0)
40003088:	00c7a703          	lw	a4,12(a5)
4000308c:	fec42783          	lw	a5,-20(s0)
40003090:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40003094:	fe842783          	lw	a5,-24(s0)
40003098:	0007a783          	lw	a5,0(a5)
4000309c:	fff78713          	addi	a4,a5,-1
400030a0:	fe842783          	lw	a5,-24(s0)
400030a4:	0047a783          	lw	a5,4(a5)
400030a8:	00879793          	slli	a5,a5,0x8
400030ac:	00f76733          	or	a4,a4,a5
400030b0:	fe842783          	lw	a5,-24(s0)
400030b4:	0087a783          	lw	a5,8(a5)
400030b8:	01079793          	slli	a5,a5,0x10
400030bc:	00f76733          	or	a4,a4,a5
400030c0:	fec42783          	lw	a5,-20(s0)
400030c4:	00e7a623          	sw	a4,12(a5)
}
400030c8:	00000013          	nop
400030cc:	01c12403          	lw	s0,28(sp)
400030d0:	02010113          	addi	sp,sp,32
400030d4:	00008067          	ret

400030d8 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
400030d8:	fe010113          	addi	sp,sp,-32
400030dc:	00812e23          	sw	s0,28(sp)
400030e0:	02010413          	addi	s0,sp,32
400030e4:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
400030e8:	fec42783          	lw	a5,-20(s0)
400030ec:	0007a783          	lw	a5,0(a5)
400030f0:	0027f793          	andi	a5,a5,2
400030f4:	00f037b3          	snez	a5,a5
400030f8:	0ff7f793          	zext.b	a5,a5
}
400030fc:	00078513          	mv	a0,a5
40003100:	01c12403          	lw	s0,28(sp)
40003104:	02010113          	addi	sp,sp,32
40003108:	00008067          	ret

4000310c <vga_run>:
static void vga_run(Vga_Reg *reg){
4000310c:	fe010113          	addi	sp,sp,-32
40003110:	00812e23          	sw	s0,28(sp)
40003114:	02010413          	addi	s0,sp,32
40003118:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
4000311c:	fec42783          	lw	a5,-20(s0)
40003120:	00100713          	li	a4,1
40003124:	00e7a023          	sw	a4,0(a5)
}
40003128:	00000013          	nop
4000312c:	01c12403          	lw	s0,28(sp)
40003130:	02010113          	addi	sp,sp,32
40003134:	00008067          	ret

40003138 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40003138:	fe010113          	addi	sp,sp,-32
4000313c:	00112e23          	sw	ra,28(sp)
40003140:	00812c23          	sw	s0,24(sp)
40003144:	02010413          	addi	s0,sp,32
40003148:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
4000314c:	fec42783          	lw	a5,-20(s0)
40003150:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40003154:	00000013          	nop
40003158:	fec42503          	lw	a0,-20(s0)
4000315c:	f7dff0ef          	jal	ra,400030d8 <vga_isBusy>
40003160:	00050793          	mv	a5,a0
40003164:	fe079ae3          	bnez	a5,40003158 <vga_stop+0x20>
}
40003168:	00000013          	nop
4000316c:	00000013          	nop
40003170:	01c12083          	lw	ra,28(sp)
40003174:	01812403          	lw	s0,24(sp)
40003178:	02010113          	addi	sp,sp,32
4000317c:	00008067          	ret

40003180 <poly_write>:
#include "briey.h"
void poly_write(uint32_t iData, uint32_t iAddress)
{
40003180:	fe010113          	addi	sp,sp,-32
40003184:	00812e23          	sw	s0,28(sp)
40003188:	02010413          	addi	s0,sp,32
4000318c:	fea42623          	sw	a0,-20(s0)
40003190:	feb42423          	sw	a1,-24(s0)
	POLY_BASE->ADDRESS			= iAddress;
40003194:	f00037b7          	lui	a5,0xf0003
40003198:	fe842703          	lw	a4,-24(s0)
4000319c:	00e7a423          	sw	a4,8(a5) # f0003008 <_stack_start+0x700026c8>
	POLY_BASE->WRITE_ENABLE 	= 1;
400031a0:	f00037b7          	lui	a5,0xf0003
400031a4:	00100713          	li	a4,1
400031a8:	00e7a223          	sw	a4,4(a5) # f0003004 <_stack_start+0x700026c4>
	POLY_BASE->IDATA			= iData;
400031ac:	f00037b7          	lui	a5,0xf0003
400031b0:	fec42703          	lw	a4,-20(s0)
400031b4:	00e7a623          	sw	a4,12(a5) # f000300c <_stack_start+0x700026cc>
	POLY_BASE->CHIP_SELECT		= 1;
400031b8:	f00037b7          	lui	a5,0xf0003
400031bc:	00100713          	li	a4,1
400031c0:	00e7a023          	sw	a4,0(a5) # f0003000 <_stack_start+0x700026c0>
	POLY_BASE->CHIP_SELECT		= 0;
400031c4:	f00037b7          	lui	a5,0xf0003
400031c8:	0007a023          	sw	zero,0(a5) # f0003000 <_stack_start+0x700026c0>
}
400031cc:	00000013          	nop
400031d0:	01c12403          	lw	s0,28(sp)
400031d4:	02010113          	addi	sp,sp,32
400031d8:	00008067          	ret

400031dc <poly_read>:
uint32_t poly_read(uint32_t iAddress)
{
400031dc:	fd010113          	addi	sp,sp,-48
400031e0:	02812623          	sw	s0,44(sp)
400031e4:	03010413          	addi	s0,sp,48
400031e8:	fca42e23          	sw	a0,-36(s0)
	POLY_BASE->ADDRESS		= iAddress;
400031ec:	f00037b7          	lui	a5,0xf0003
400031f0:	fdc42703          	lw	a4,-36(s0)
400031f4:	00e7a423          	sw	a4,8(a5) # f0003008 <_stack_start+0x700026c8>
	POLY_BASE->WRITE_ENABLE	= 0;
400031f8:	f00037b7          	lui	a5,0xf0003
400031fc:	0007a223          	sw	zero,4(a5) # f0003004 <_stack_start+0x700026c4>
	POLY_BASE->CHIP_SELECT	= 1;
40003200:	f00037b7          	lui	a5,0xf0003
40003204:	00100713          	li	a4,1
40003208:	00e7a023          	sw	a4,0(a5) # f0003000 <_stack_start+0x700026c0>
	uint32_t res 			= POLY_BASE->ODATA;
4000320c:	f00037b7          	lui	a5,0xf0003
40003210:	0107a783          	lw	a5,16(a5) # f0003010 <_stack_start+0x700026d0>
40003214:	fef42623          	sw	a5,-20(s0)
	POLY_BASE->CHIP_SELECT	= 0;
40003218:	f00037b7          	lui	a5,0xf0003
4000321c:	0007a023          	sw	zero,0(a5) # f0003000 <_stack_start+0x700026c0>
	return res;
40003220:	fec42783          	lw	a5,-20(s0)
}
40003224:	00078513          	mv	a0,a5
40003228:	02c12403          	lw	s0,44(sp)
4000322c:	03010113          	addi	sp,sp,48
40003230:	00008067          	ret

40003234 <poly_init>:
//1. write 256-bit to key
//2. reset block
//3. write 1 to ctrl_reg
//4. wait ready
void poly_init(uint32_t *key)
{
40003234:	fe010113          	addi	sp,sp,-32
40003238:	00112e23          	sw	ra,28(sp)
4000323c:	00812c23          	sw	s0,24(sp)
40003240:	02010413          	addi	s0,sp,32
40003244:	fea42623          	sw	a0,-20(s0)
	poly_write(key[7],POLY_ADDR_KEY_BASE);
40003248:	fec42783          	lw	a5,-20(s0)
4000324c:	01c78793          	addi	a5,a5,28
40003250:	0007a783          	lw	a5,0(a5)
40003254:	01000593          	li	a1,16
40003258:	00078513          	mv	a0,a5
4000325c:	f25ff0ef          	jal	ra,40003180 <poly_write>
	poly_write(key[6],POLY_ADDR_KEY_BASE + 1);
40003260:	fec42783          	lw	a5,-20(s0)
40003264:	01878793          	addi	a5,a5,24
40003268:	0007a783          	lw	a5,0(a5)
4000326c:	01100593          	li	a1,17
40003270:	00078513          	mv	a0,a5
40003274:	f0dff0ef          	jal	ra,40003180 <poly_write>
	poly_write(key[5],POLY_ADDR_KEY_BASE + 2);
40003278:	fec42783          	lw	a5,-20(s0)
4000327c:	01478793          	addi	a5,a5,20
40003280:	0007a783          	lw	a5,0(a5)
40003284:	01200593          	li	a1,18
40003288:	00078513          	mv	a0,a5
4000328c:	ef5ff0ef          	jal	ra,40003180 <poly_write>
	poly_write(key[4],POLY_ADDR_KEY_BASE + 3);
40003290:	fec42783          	lw	a5,-20(s0)
40003294:	01078793          	addi	a5,a5,16
40003298:	0007a783          	lw	a5,0(a5)
4000329c:	01300593          	li	a1,19
400032a0:	00078513          	mv	a0,a5
400032a4:	eddff0ef          	jal	ra,40003180 <poly_write>
	poly_write(key[3],POLY_ADDR_KEY_BASE + 4);
400032a8:	fec42783          	lw	a5,-20(s0)
400032ac:	00c78793          	addi	a5,a5,12
400032b0:	0007a783          	lw	a5,0(a5)
400032b4:	01400593          	li	a1,20
400032b8:	00078513          	mv	a0,a5
400032bc:	ec5ff0ef          	jal	ra,40003180 <poly_write>
	poly_write(key[2],POLY_ADDR_KEY_BASE + 5);
400032c0:	fec42783          	lw	a5,-20(s0)
400032c4:	00878793          	addi	a5,a5,8
400032c8:	0007a783          	lw	a5,0(a5)
400032cc:	01500593          	li	a1,21
400032d0:	00078513          	mv	a0,a5
400032d4:	eadff0ef          	jal	ra,40003180 <poly_write>
	poly_write(key[1],POLY_ADDR_KEY_BASE + 6);
400032d8:	fec42783          	lw	a5,-20(s0)
400032dc:	00478793          	addi	a5,a5,4
400032e0:	0007a783          	lw	a5,0(a5)
400032e4:	01600593          	li	a1,22
400032e8:	00078513          	mv	a0,a5
400032ec:	e95ff0ef          	jal	ra,40003180 <poly_write>
	poly_write(key[0],POLY_ADDR_KEY_BASE + 7);
400032f0:	fec42783          	lw	a5,-20(s0)
400032f4:	0007a783          	lw	a5,0(a5)
400032f8:	01700593          	li	a1,23
400032fc:	00078513          	mv	a0,a5
40003300:	e81ff0ef          	jal	ra,40003180 <poly_write>

	poly_write(0x0,POLY_ADDR_BLOCK_BASE);
40003304:	02000593          	li	a1,32
40003308:	00000513          	li	a0,0
4000330c:	e75ff0ef          	jal	ra,40003180 <poly_write>
	poly_write(0x0,POLY_ADDR_BLOCK_BASE + 1);
40003310:	02100593          	li	a1,33
40003314:	00000513          	li	a0,0
40003318:	e69ff0ef          	jal	ra,40003180 <poly_write>
	poly_write(0x0,POLY_ADDR_BLOCK_BASE + 2);
4000331c:	02200593          	li	a1,34
40003320:	00000513          	li	a0,0
40003324:	e5dff0ef          	jal	ra,40003180 <poly_write>
	poly_write(0x0,POLY_ADDR_BLOCK_BASE + 3);
40003328:	02300593          	li	a1,35
4000332c:	00000513          	li	a0,0
40003330:	e51ff0ef          	jal	ra,40003180 <poly_write>

	poly_write(CONST_INIT,POLY_ADDR_CTRL);
40003334:	00800593          	li	a1,8
40003338:	00100513          	li	a0,1
4000333c:	e45ff0ef          	jal	ra,40003180 <poly_write>
	while(poly_read(POLY_ADDR_STATUS)==0);
40003340:	00000013          	nop
40003344:	00900513          	li	a0,9
40003348:	e95ff0ef          	jal	ra,400031dc <poly_read>
4000334c:	00050793          	mv	a5,a0
40003350:	fe078ae3          	beqz	a5,40003344 <poly_init+0x110>
}
40003354:	00000013          	nop
40003358:	00000013          	nop
4000335c:	01c12083          	lw	ra,28(sp)
40003360:	01812403          	lw	s0,24(sp)
40003364:	02010113          	addi	sp,sp,32
40003368:	00008067          	ret

4000336c <poly_write_block>:
//1. write data to block
//2. set number of bytes of block
//3. write 2 to ctrl_reg
//4. wait ready
void poly_write_block(uint32_t block_length,uint32_t *block)
{
4000336c:	fe010113          	addi	sp,sp,-32
40003370:	00112e23          	sw	ra,28(sp)
40003374:	00812c23          	sw	s0,24(sp)
40003378:	02010413          	addi	s0,sp,32
4000337c:	fea42623          	sw	a0,-20(s0)
40003380:	feb42423          	sw	a1,-24(s0)
	//16 bytes block input
	poly_write(block[3],POLY_ADDR_BLOCK_BASE);
40003384:	fe842783          	lw	a5,-24(s0)
40003388:	00c78793          	addi	a5,a5,12
4000338c:	0007a783          	lw	a5,0(a5)
40003390:	02000593          	li	a1,32
40003394:	00078513          	mv	a0,a5
40003398:	de9ff0ef          	jal	ra,40003180 <poly_write>
	poly_write(block[2],POLY_ADDR_BLOCK_BASE + 1);
4000339c:	fe842783          	lw	a5,-24(s0)
400033a0:	00878793          	addi	a5,a5,8
400033a4:	0007a783          	lw	a5,0(a5)
400033a8:	02100593          	li	a1,33
400033ac:	00078513          	mv	a0,a5
400033b0:	dd1ff0ef          	jal	ra,40003180 <poly_write>
	poly_write(block[1],POLY_ADDR_BLOCK_BASE + 2);
400033b4:	fe842783          	lw	a5,-24(s0)
400033b8:	00478793          	addi	a5,a5,4
400033bc:	0007a783          	lw	a5,0(a5)
400033c0:	02200593          	li	a1,34
400033c4:	00078513          	mv	a0,a5
400033c8:	db9ff0ef          	jal	ra,40003180 <poly_write>
	poly_write(block[0],POLY_ADDR_BLOCK_BASE + 3);
400033cc:	fe842783          	lw	a5,-24(s0)
400033d0:	0007a783          	lw	a5,0(a5)
400033d4:	02300593          	li	a1,35
400033d8:	00078513          	mv	a0,a5
400033dc:	da5ff0ef          	jal	ra,40003180 <poly_write>

	//Set number of bytes
	poly_write(block_length,POLY_ADDR_BLOCKLEN);
400033e0:	00a00593          	li	a1,10
400033e4:	fec42503          	lw	a0,-20(s0)
400033e8:	d99ff0ef          	jal	ra,40003180 <poly_write>

	//write next to ctrl_reg
	poly_write(CONST_NEXT,POLY_ADDR_CTRL);
400033ec:	00800593          	li	a1,8
400033f0:	00200513          	li	a0,2
400033f4:	d8dff0ef          	jal	ra,40003180 <poly_write>

	//wait ready
	while(poly_read(POLY_ADDR_STATUS)==0);
400033f8:	00000013          	nop
400033fc:	00900513          	li	a0,9
40003400:	dddff0ef          	jal	ra,400031dc <poly_read>
40003404:	00050793          	mv	a5,a0
40003408:	fe078ae3          	beqz	a5,400033fc <poly_write_block+0x90>

}
4000340c:	00000013          	nop
40003410:	00000013          	nop
40003414:	01c12083          	lw	ra,28(sp)
40003418:	01812403          	lw	s0,24(sp)
4000341c:	02010113          	addi	sp,sp,32
40003420:	00008067          	ret

40003424 <get_MAC>:

//get_MAC (result) function:
//1.write 4 to ctrl_reg
//2.wait ready
void get_MAC(uint32_t *MAC)
{
40003424:	fe010113          	addi	sp,sp,-32
40003428:	00112e23          	sw	ra,28(sp)
4000342c:	00812c23          	sw	s0,24(sp)
40003430:	00912a23          	sw	s1,20(sp)
40003434:	02010413          	addi	s0,sp,32
40003438:	fea42623          	sw	a0,-20(s0)
	poly_write(CONST_FINISH,POLY_ADDR_CTRL);
4000343c:	00800593          	li	a1,8
40003440:	00400513          	li	a0,4
40003444:	d3dff0ef          	jal	ra,40003180 <poly_write>
	while(poly_read(POLY_ADDR_STATUS)==0);
40003448:	00000013          	nop
4000344c:	00900513          	li	a0,9
40003450:	d8dff0ef          	jal	ra,400031dc <poly_read>
40003454:	00050793          	mv	a5,a0
40003458:	fe078ae3          	beqz	a5,4000344c <get_MAC+0x28>
	MAC[3] = poly_read(POLY_ADDR_RESULT_BASE);
4000345c:	fec42783          	lw	a5,-20(s0)
40003460:	00c78493          	addi	s1,a5,12
40003464:	03000513          	li	a0,48
40003468:	d75ff0ef          	jal	ra,400031dc <poly_read>
4000346c:	00050793          	mv	a5,a0
40003470:	00f4a023          	sw	a5,0(s1)
	MAC[2] = poly_read(POLY_ADDR_RESULT_BASE + 1);
40003474:	fec42783          	lw	a5,-20(s0)
40003478:	00878493          	addi	s1,a5,8
4000347c:	03100513          	li	a0,49
40003480:	d5dff0ef          	jal	ra,400031dc <poly_read>
40003484:	00050793          	mv	a5,a0
40003488:	00f4a023          	sw	a5,0(s1)
	MAC[1] = poly_read(POLY_ADDR_RESULT_BASE + 2);
4000348c:	fec42783          	lw	a5,-20(s0)
40003490:	00478493          	addi	s1,a5,4
40003494:	03200513          	li	a0,50
40003498:	d45ff0ef          	jal	ra,400031dc <poly_read>
4000349c:	00050793          	mv	a5,a0
400034a0:	00f4a023          	sw	a5,0(s1)
	MAC[0] = poly_read(POLY_ADDR_RESULT_BASE + 3);
400034a4:	03300513          	li	a0,51
400034a8:	d35ff0ef          	jal	ra,400031dc <poly_read>
400034ac:	00050713          	mv	a4,a0
400034b0:	fec42783          	lw	a5,-20(s0)
400034b4:	00e7a023          	sw	a4,0(a5)
}
400034b8:	00000013          	nop
400034bc:	01c12083          	lw	ra,28(sp)
400034c0:	01812403          	lw	s0,24(sp)
400034c4:	01412483          	lw	s1,20(sp)
400034c8:	02010113          	addi	sp,sp,32
400034cc:	00008067          	ret

400034d0 <poly_test_N_bytes>:
void poly_test_N_bytes(uint32_t block_length,uint32_t *key, uint32_t *block, uint32_t *res)
{
400034d0:	fe010113          	addi	sp,sp,-32
400034d4:	00112e23          	sw	ra,28(sp)
400034d8:	00812c23          	sw	s0,24(sp)
400034dc:	02010413          	addi	s0,sp,32
400034e0:	fea42623          	sw	a0,-20(s0)
400034e4:	feb42423          	sw	a1,-24(s0)
400034e8:	fec42223          	sw	a2,-28(s0)
400034ec:	fed42023          	sw	a3,-32(s0)

	poly_init(key);
400034f0:	fe842503          	lw	a0,-24(s0)
400034f4:	d41ff0ef          	jal	ra,40003234 <poly_init>
	poly_write_block(block_length,block);
400034f8:	fe442583          	lw	a1,-28(s0)
400034fc:	fec42503          	lw	a0,-20(s0)
40003500:	e6dff0ef          	jal	ra,4000336c <poly_write_block>
	get_MAC(res);
40003504:	fe042503          	lw	a0,-32(s0)
40003508:	f1dff0ef          	jal	ra,40003424 <get_MAC>

	print("\r\n");
4000350c:	400057b7          	lui	a5,0x40005
40003510:	86c78513          	addi	a0,a5,-1940 # 4000486c <vga_simRes_h160_v120+0x20>
40003514:	bb4ff0ef          	jal	ra,400028c8 <print>
	print128bit("\r\tPLAIN_TEXT (128-bit) : ", block);
40003518:	fe442583          	lw	a1,-28(s0)
4000351c:	400057b7          	lui	a5,0x40005
40003520:	87078513          	addi	a0,a5,-1936 # 40004870 <vga_simRes_h160_v120+0x24>
40003524:	e7cff0ef          	jal	ra,40002ba0 <print128bit>
	print256bit("KEY (256-bit): ", key);
40003528:	fe842583          	lw	a1,-24(s0)
4000352c:	400057b7          	lui	a5,0x40005
40003530:	88c78513          	addi	a0,a5,-1908 # 4000488c <vga_simRes_h160_v120+0x40>
40003534:	f88ff0ef          	jal	ra,40002cbc <print256bit>
	print128bit("RESULT (128-bit) : ", res);
40003538:	fe042583          	lw	a1,-32(s0)
4000353c:	400057b7          	lui	a5,0x40005
40003540:	89c78513          	addi	a0,a5,-1892 # 4000489c <vga_simRes_h160_v120+0x50>
40003544:	e5cff0ef          	jal	ra,40002ba0 <print128bit>

}
40003548:	00000013          	nop
4000354c:	01c12083          	lw	ra,28(sp)
40003550:	01812403          	lw	s0,24(sp)
40003554:	02010113          	addi	sp,sp,32
40003558:	00008067          	ret

4000355c <poly_test_rfc8439>:

void poly_test_rfc8439()
{
4000355c:	f9010113          	addi	sp,sp,-112
40003560:	06112623          	sw	ra,108(sp)
40003564:	06812423          	sw	s0,104(sp)
40003568:	07010413          	addi	s0,sp,112
	uint32_t rfc8439_key[8];
	uint32_t rfc8439_block2[4];
	uint32_t rfc8439_block1[4];
	uint32_t rfc8439_block0[4];

	rfc8439_key[7]= 0x85d6be78;
4000356c:	85d6c7b7          	lui	a5,0x85d6c
40003570:	e7878793          	addi	a5,a5,-392 # 85d6be78 <_stack_start+0x5d6b538>
40003574:	fef42623          	sw	a5,-20(s0)
	rfc8439_key[6]= 0x57556d33;
40003578:	575577b7          	lui	a5,0x57557
4000357c:	d3378793          	addi	a5,a5,-717 # 57556d33 <__global_pointer$+0x17551c13>
40003580:	fef42423          	sw	a5,-24(s0)
	rfc8439_key[5]= 0x7f4452fe;
40003584:	7f4457b7          	lui	a5,0x7f445
40003588:	2fe78793          	addi	a5,a5,766 # 7f4452fe <__global_pointer$+0x3f4401de>
4000358c:	fef42223          	sw	a5,-28(s0)
	rfc8439_key[4]= 0x42d506a8;
40003590:	42d507b7          	lui	a5,0x42d50
40003594:	6a878793          	addi	a5,a5,1704 # 42d506a8 <__global_pointer$+0x2d4b588>
40003598:	fef42023          	sw	a5,-32(s0)
	rfc8439_key[3]= 0x0103808a;
4000359c:	010387b7          	lui	a5,0x1038
400035a0:	08a78793          	addi	a5,a5,138 # 103808a <_stack_size+0x103788a>
400035a4:	fcf42e23          	sw	a5,-36(s0)
	rfc8439_key[2]= 0xfb0db2fd;
400035a8:	fb0db7b7          	lui	a5,0xfb0db
400035ac:	2fd78793          	addi	a5,a5,765 # fb0db2fd <_stack_start+0x7b0da9bd>
400035b0:	fcf42c23          	sw	a5,-40(s0)
	rfc8439_key[1]= 0x4abff6af;
400035b4:	4abff7b7          	lui	a5,0x4abff
400035b8:	6af78793          	addi	a5,a5,1711 # 4abff6af <__global_pointer$+0xabfa58f>
400035bc:	fcf42a23          	sw	a5,-44(s0)
	rfc8439_key[0]= 0x4149f51b;
400035c0:	4149f7b7          	lui	a5,0x4149f
400035c4:	51b78793          	addi	a5,a5,1307 # 4149f51b <__global_pointer$+0x149a3fb>
400035c8:	fcf42823          	sw	a5,-48(s0)

	rfc8439_block2[3]= 0x43727970;
400035cc:	437287b7          	lui	a5,0x43728
400035d0:	97078793          	addi	a5,a5,-1680 # 43727970 <__global_pointer$+0x3722850>
400035d4:	fcf42623          	sw	a5,-52(s0)
	rfc8439_block2[2]= 0x746f6772;
400035d8:	746f67b7          	lui	a5,0x746f6
400035dc:	77278793          	addi	a5,a5,1906 # 746f6772 <__global_pointer$+0x346f1652>
400035e0:	fcf42423          	sw	a5,-56(s0)
	rfc8439_block2[1]= 0x61706869;
400035e4:	617077b7          	lui	a5,0x61707
400035e8:	86978793          	addi	a5,a5,-1943 # 61706869 <__global_pointer$+0x21701749>
400035ec:	fcf42223          	sw	a5,-60(s0)
	rfc8439_block2[0]= 0x6320466f;
400035f0:	632047b7          	lui	a5,0x63204
400035f4:	66f78793          	addi	a5,a5,1647 # 6320466f <__global_pointer$+0x231ff54f>
400035f8:	fcf42023          	sw	a5,-64(s0)

	rfc8439_block1[3]= 0x72756d20;
400035fc:	727577b7          	lui	a5,0x72757
40003600:	d2078793          	addi	a5,a5,-736 # 72756d20 <__global_pointer$+0x32751c00>
40003604:	faf42e23          	sw	a5,-68(s0)
	rfc8439_block1[2]= 0x52657365;
40003608:	526577b7          	lui	a5,0x52657
4000360c:	36578793          	addi	a5,a5,869 # 52657365 <__global_pointer$+0x12652245>
40003610:	faf42c23          	sw	a5,-72(s0)
	rfc8439_block1[1]= 0x61726368;
40003614:	617267b7          	lui	a5,0x61726
40003618:	36878793          	addi	a5,a5,872 # 61726368 <__global_pointer$+0x21721248>
4000361c:	faf42a23          	sw	a5,-76(s0)
	rfc8439_block1[0]= 0x2047726f;
40003620:	204777b7          	lui	a5,0x20477
40003624:	26f78793          	addi	a5,a5,623 # 2047726f <_stack_size+0x20476a6f>
40003628:	faf42823          	sw	a5,-80(s0)

	rfc8439_block0[3]= 0x75700000;
4000362c:	757007b7          	lui	a5,0x75700
40003630:	faf42623          	sw	a5,-84(s0)
	rfc8439_block0[2]= 0x00000000;
40003634:	fa042423          	sw	zero,-88(s0)
	rfc8439_block0[1]= 0x00000000;
40003638:	fa042223          	sw	zero,-92(s0)
	rfc8439_block0[0]= 0x00000000;
4000363c:	fa042023          	sw	zero,-96(s0)

	uint32_t rfc8439_res[4] = {0x00, 0x00, 0x00,0x00};
40003640:	f8042823          	sw	zero,-112(s0)
40003644:	f8042a23          	sw	zero,-108(s0)
40003648:	f8042c23          	sw	zero,-104(s0)
4000364c:	f8042e23          	sw	zero,-100(s0)

	//PROCESSING
	poly_init(rfc8439_key);
40003650:	fd040793          	addi	a5,s0,-48
40003654:	00078513          	mv	a0,a5
40003658:	bddff0ef          	jal	ra,40003234 <poly_init>
	poly_write_block(0x10,rfc8439_block2);
4000365c:	fc040793          	addi	a5,s0,-64
40003660:	00078593          	mv	a1,a5
40003664:	01000513          	li	a0,16
40003668:	d05ff0ef          	jal	ra,4000336c <poly_write_block>
	poly_write_block(0x10,rfc8439_block1);
4000366c:	fb040793          	addi	a5,s0,-80
40003670:	00078593          	mv	a1,a5
40003674:	01000513          	li	a0,16
40003678:	cf5ff0ef          	jal	ra,4000336c <poly_write_block>
	poly_write_block(0x2,rfc8439_block0);
4000367c:	fa040793          	addi	a5,s0,-96
40003680:	00078593          	mv	a1,a5
40003684:	00200513          	li	a0,2
40003688:	ce5ff0ef          	jal	ra,4000336c <poly_write_block>

	//OUTPUT
	get_MAC(rfc8439_res);
4000368c:	f9040793          	addi	a5,s0,-112
40003690:	00078513          	mv	a0,a5
40003694:	d91ff0ef          	jal	ra,40003424 <get_MAC>

	//print
	print128bit("\r\tPLAIN_TEXT (272-bit) : ", rfc8439_block2);
40003698:	fc040793          	addi	a5,s0,-64
4000369c:	00078593          	mv	a1,a5
400036a0:	400057b7          	lui	a5,0x40005
400036a4:	8b078513          	addi	a0,a5,-1872 # 400048b0 <vga_simRes_h160_v120+0x64>
400036a8:	cf8ff0ef          	jal	ra,40002ba0 <print128bit>
	print128bit("\r\t                       ", rfc8439_block1);
400036ac:	fb040793          	addi	a5,s0,-80
400036b0:	00078593          	mv	a1,a5
400036b4:	400057b7          	lui	a5,0x40005
400036b8:	8cc78513          	addi	a0,a5,-1844 # 400048cc <vga_simRes_h160_v120+0x80>
400036bc:	ce4ff0ef          	jal	ra,40002ba0 <print128bit>
	print("\r\t                       ");
400036c0:	400057b7          	lui	a5,0x40005
400036c4:	8cc78513          	addi	a0,a5,-1844 # 400048cc <vga_simRes_h160_v120+0x80>
400036c8:	a00ff0ef          	jal	ra,400028c8 <print>
	print16bit(0x7570);
400036cc:	000077b7          	lui	a5,0x7
400036d0:	57078513          	addi	a0,a5,1392 # 7570 <_stack_size+0x6d70>
400036d4:	a4cff0ef          	jal	ra,40002920 <print16bit>
	print("\r\n");
400036d8:	400057b7          	lui	a5,0x40005
400036dc:	86c78513          	addi	a0,a5,-1940 # 4000486c <vga_simRes_h160_v120+0x20>
400036e0:	9e8ff0ef          	jal	ra,400028c8 <print>


	print256bit("KEY (256-bit): ", rfc8439_key);
400036e4:	fd040793          	addi	a5,s0,-48
400036e8:	00078593          	mv	a1,a5
400036ec:	400057b7          	lui	a5,0x40005
400036f0:	88c78513          	addi	a0,a5,-1908 # 4000488c <vga_simRes_h160_v120+0x40>
400036f4:	dc8ff0ef          	jal	ra,40002cbc <print256bit>

	print128bit("RESULT (128-bit) : ", rfc8439_res);
400036f8:	f9040793          	addi	a5,s0,-112
400036fc:	00078593          	mv	a1,a5
40003700:	400057b7          	lui	a5,0x40005
40003704:	89c78513          	addi	a0,a5,-1892 # 4000489c <vga_simRes_h160_v120+0x50>
40003708:	c98ff0ef          	jal	ra,40002ba0 <print128bit>
}
4000370c:	00000013          	nop
40003710:	06c12083          	lw	ra,108(sp)
40003714:	06812403          	lw	s0,104(sp)
40003718:	07010113          	addi	sp,sp,112
4000371c:	00008067          	ret

40003720 <poly_test_long>:

void poly_test_long()
{
40003720:	f9010113          	addi	sp,sp,-112
40003724:	06112623          	sw	ra,108(sp)
40003728:	06812423          	sw	s0,104(sp)
4000372c:	07010413          	addi	s0,sp,112
	uint32_t long_key[8];
	uint32_t long_block[4];
	uint32_t long_block_final[4];
	uint32_t long_res[4] = {0x00, 0x00, 0x00,0x00};
40003730:	f8042e23          	sw	zero,-100(s0)
40003734:	fa042023          	sw	zero,-96(s0)
40003738:	fa042223          	sw	zero,-92(s0)
4000373c:	fa042423          	sw	zero,-88(s0)

	long_key[7]= 0xf3000000;
40003740:	f30007b7          	lui	a5,0xf3000
40003744:	fef42423          	sw	a5,-24(s0)
	long_key[6]= 0x00000000;
40003748:	fe042223          	sw	zero,-28(s0)
	long_key[5]= 0x00000000;
4000374c:	fe042023          	sw	zero,-32(s0)
	long_key[4]= 0x0000003f;
40003750:	03f00793          	li	a5,63
40003754:	fcf42e23          	sw	a5,-36(s0)
	long_key[3]= 0x3f000000;
40003758:	3f0007b7          	lui	a5,0x3f000
4000375c:	fcf42c23          	sw	a5,-40(s0)
	long_key[2]= 0x00000000;
40003760:	fc042a23          	sw	zero,-44(s0)
	long_key[1]= 0x00000000;
40003764:	fc042823          	sw	zero,-48(s0)
	long_key[0]= 0x000000f3;
40003768:	0f300793          	li	a5,243
4000376c:	fcf42623          	sw	a5,-52(s0)

	long_block[3]= 0xffffffff;
40003770:	fff00793          	li	a5,-1
40003774:	fcf42423          	sw	a5,-56(s0)
	long_block[2]= 0xffffffff;
40003778:	fff00793          	li	a5,-1
4000377c:	fcf42223          	sw	a5,-60(s0)
	long_block[1]= 0xffffffff;
40003780:	fff00793          	li	a5,-1
40003784:	fcf42023          	sw	a5,-64(s0)
	long_block[0]= 0xffffffff;
40003788:	fff00793          	li	a5,-1
4000378c:	faf42e23          	sw	a5,-68(s0)

	long_block_final[3]= 0x01000000;
40003790:	010007b7          	lui	a5,0x1000
40003794:	faf42c23          	sw	a5,-72(s0)
	long_block_final[2]= 0x00000000;
40003798:	fa042a23          	sw	zero,-76(s0)
	long_block_final[1]= 0x00000000;
4000379c:	fa042823          	sw	zero,-80(s0)
	long_block_final[0]= 0x00000000;
400037a0:	fa042623          	sw	zero,-84(s0)

	//PROCESS
	poly_init(long_key);
400037a4:	fcc40793          	addi	a5,s0,-52
400037a8:	00078513          	mv	a0,a5
400037ac:	a89ff0ef          	jal	ra,40003234 <poly_init>
	//write 64x128 bit block
	for(int i=0;i<64;i++)
400037b0:	fe042623          	sw	zero,-20(s0)
400037b4:	0200006f          	j	400037d4 <poly_test_long+0xb4>
	{
		poly_write_block(0x10,long_block);
400037b8:	fbc40793          	addi	a5,s0,-68
400037bc:	00078593          	mv	a1,a5
400037c0:	01000513          	li	a0,16
400037c4:	ba9ff0ef          	jal	ra,4000336c <poly_write_block>
	for(int i=0;i<64;i++)
400037c8:	fec42783          	lw	a5,-20(s0)
400037cc:	00178793          	addi	a5,a5,1 # 1000001 <_stack_size+0xfff801>
400037d0:	fef42623          	sw	a5,-20(s0)
400037d4:	fec42703          	lw	a4,-20(s0)
400037d8:	03f00793          	li	a5,63
400037dc:	fce7dee3          	bge	a5,a4,400037b8 <poly_test_long+0x98>
	}
	//write final block
	poly_write_block(0x1,long_block_final);
400037e0:	fac40793          	addi	a5,s0,-84
400037e4:	00078593          	mv	a1,a5
400037e8:	00100513          	li	a0,1
400037ec:	b81ff0ef          	jal	ra,4000336c <poly_write_block>

	//get result
	get_MAC(long_res);
400037f0:	f9c40793          	addi	a5,s0,-100
400037f4:	00078513          	mv	a0,a5
400037f8:	c2dff0ef          	jal	ra,40003424 <get_MAC>

	//print
	print256bit("PLAIN_TEXT (8200-bit) : 0xff..ff01\r\n\tKEY (256-bit): ", long_key);
400037fc:	fcc40793          	addi	a5,s0,-52
40003800:	00078593          	mv	a1,a5
40003804:	400057b7          	lui	a5,0x40005
40003808:	8e878513          	addi	a0,a5,-1816 # 400048e8 <vga_simRes_h160_v120+0x9c>
4000380c:	cb0ff0ef          	jal	ra,40002cbc <print256bit>
	print128bit("RESULT (128-bit) : ", long_res);
40003810:	f9c40793          	addi	a5,s0,-100
40003814:	00078593          	mv	a1,a5
40003818:	400057b7          	lui	a5,0x40005
4000381c:	89c78513          	addi	a0,a5,-1892 # 4000489c <vga_simRes_h160_v120+0x50>
40003820:	b80ff0ef          	jal	ra,40002ba0 <print128bit>

}
40003824:	00000013          	nop
40003828:	06c12083          	lw	ra,108(sp)
4000382c:	06812403          	lw	s0,104(sp)
40003830:	07010113          	addi	sp,sp,112
40003834:	00008067          	ret
