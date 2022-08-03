
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
80000068:	998080e7          	jalr	-1640(ra) # 400009fc <irqCallback>
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
800000b8:	8b418193          	addi	gp,gp,-1868 # 40002968 <__global_pointer$>
800000bc:	00001117          	auipc	sp,0x1
800000c0:	88410113          	addi	sp,sp,-1916 # 80000940 <_stack_start>

800000c4 <bss_init>:
800000c4:	c0002517          	auipc	a0,0xc0002
800000c8:	0a450513          	addi	a0,a0,164 # 40002168 <_bss_end>
800000cc:	c0002597          	auipc	a1,0xc0002
800000d0:	09c58593          	addi	a1,a1,156 # 40002168 <_bss_end>

800000d4 <bss_loop>:
800000d4:	00b50863          	beq	a0,a1,800000e4 <bss_done>
800000d8:	00052023          	sw	zero,0(a0)
800000dc:	00450513          	addi	a0,a0,4
800000e0:	ff5ff06f          	j	800000d4 <bss_loop>

800000e4 <bss_done>:
800000e4:	c0002517          	auipc	a0,0xc0002
800000e8:	08450513          	addi	a0,a0,132 # 40002168 <_bss_end>
800000ec:	ffc10113          	addi	sp,sp,-4

800000f0 <ctors_loop>:
800000f0:	c0002597          	auipc	a1,0xc0002
800000f4:	07858593          	addi	a1,a1,120 # 40002168 <_bss_end>
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
80000130:	c0000097          	auipc	ra,0xc0000
80000134:	57c080e7          	jalr	1404(ra) # 400006ac <main>

80000138 <infinitLoop>:
80000138:	0000006f          	j	80000138 <infinitLoop>

Disassembly of section .memory:

40000000 <timer_init>:
40000000:	fe010113          	addi	sp,sp,-32
40000004:	00812e23          	sw	s0,28(sp)
40000008:	02010413          	addi	s0,sp,32
4000000c:	fea42623          	sw	a0,-20(s0)
40000010:	fec42783          	lw	a5,-20(s0)
40000014:	0007a023          	sw	zero,0(a5)
40000018:	fec42783          	lw	a5,-20(s0)
4000001c:	0007a423          	sw	zero,8(a5)
40000020:	00000013          	nop
40000024:	01c12403          	lw	s0,28(sp)
40000028:	02010113          	addi	sp,sp,32
4000002c:	00008067          	ret

40000030 <prescaler_init>:
40000030:	fe010113          	addi	sp,sp,-32
40000034:	00812e23          	sw	s0,28(sp)
40000038:	02010413          	addi	s0,sp,32
4000003c:	fea42623          	sw	a0,-20(s0)
40000040:	00000013          	nop
40000044:	01c12403          	lw	s0,28(sp)
40000048:	02010113          	addi	sp,sp,32
4000004c:	00008067          	ret

40000050 <interruptCtrl_init>:
40000050:	fe010113          	addi	sp,sp,-32
40000054:	00812e23          	sw	s0,28(sp)
40000058:	02010413          	addi	s0,sp,32
4000005c:	fea42623          	sw	a0,-20(s0)
40000060:	fec42783          	lw	a5,-20(s0)
40000064:	0007a223          	sw	zero,4(a5)
40000068:	fec42783          	lw	a5,-20(s0)
4000006c:	fff00713          	li	a4,-1
40000070:	00e7a023          	sw	a4,0(a5)
40000074:	00000013          	nop
40000078:	01c12403          	lw	s0,28(sp)
4000007c:	02010113          	addi	sp,sp,32
40000080:	00008067          	ret

40000084 <uart_writeAvailability>:
40000084:	fe010113          	addi	sp,sp,-32
40000088:	00812e23          	sw	s0,28(sp)
4000008c:	02010413          	addi	s0,sp,32
40000090:	fea42623          	sw	a0,-20(s0)
40000094:	fec42783          	lw	a5,-20(s0)
40000098:	0047a783          	lw	a5,4(a5)
4000009c:	0107d793          	srli	a5,a5,0x10
400000a0:	0ff7f793          	zext.b	a5,a5
400000a4:	00078513          	mv	a0,a5
400000a8:	01c12403          	lw	s0,28(sp)
400000ac:	02010113          	addi	sp,sp,32
400000b0:	00008067          	ret

400000b4 <uart_readOccupancy>:
400000b4:	fe010113          	addi	sp,sp,-32
400000b8:	00812e23          	sw	s0,28(sp)
400000bc:	02010413          	addi	s0,sp,32
400000c0:	fea42623          	sw	a0,-20(s0)
400000c4:	fec42783          	lw	a5,-20(s0)
400000c8:	0047a783          	lw	a5,4(a5)
400000cc:	0187d793          	srli	a5,a5,0x18
400000d0:	00078513          	mv	a0,a5
400000d4:	01c12403          	lw	s0,28(sp)
400000d8:	02010113          	addi	sp,sp,32
400000dc:	00008067          	ret

400000e0 <uart_write>:
400000e0:	fe010113          	addi	sp,sp,-32
400000e4:	00112e23          	sw	ra,28(sp)
400000e8:	00812c23          	sw	s0,24(sp)
400000ec:	02010413          	addi	s0,sp,32
400000f0:	fea42623          	sw	a0,-20(s0)
400000f4:	feb42423          	sw	a1,-24(s0)
400000f8:	00000013          	nop
400000fc:	fec42503          	lw	a0,-20(s0)
40000100:	f85ff0ef          	jal	ra,40000084 <uart_writeAvailability>
40000104:	00050793          	mv	a5,a0
40000108:	fe078ae3          	beqz	a5,400000fc <uart_write+0x1c>
4000010c:	fec42783          	lw	a5,-20(s0)
40000110:	fe842703          	lw	a4,-24(s0)
40000114:	00e7a023          	sw	a4,0(a5)
40000118:	00000013          	nop
4000011c:	01c12083          	lw	ra,28(sp)
40000120:	01812403          	lw	s0,24(sp)
40000124:	02010113          	addi	sp,sp,32
40000128:	00008067          	ret

4000012c <uart_applyConfig>:
4000012c:	fe010113          	addi	sp,sp,-32
40000130:	00812e23          	sw	s0,28(sp)
40000134:	02010413          	addi	s0,sp,32
40000138:	fea42623          	sw	a0,-20(s0)
4000013c:	feb42423          	sw	a1,-24(s0)
40000140:	fe842783          	lw	a5,-24(s0)
40000144:	00c7a703          	lw	a4,12(a5)
40000148:	fec42783          	lw	a5,-20(s0)
4000014c:	00e7a423          	sw	a4,8(a5)
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
40000184:	00000013          	nop
40000188:	01c12403          	lw	s0,28(sp)
4000018c:	02010113          	addi	sp,sp,32
40000190:	00008067          	ret

40000194 <vga_isBusy>:
40000194:	fe010113          	addi	sp,sp,-32
40000198:	00812e23          	sw	s0,28(sp)
4000019c:	02010413          	addi	s0,sp,32
400001a0:	fea42623          	sw	a0,-20(s0)
400001a4:	fec42783          	lw	a5,-20(s0)
400001a8:	0007a783          	lw	a5,0(a5)
400001ac:	0027f793          	andi	a5,a5,2
400001b0:	00f037b3          	snez	a5,a5
400001b4:	0ff7f793          	zext.b	a5,a5
400001b8:	00078513          	mv	a0,a5
400001bc:	01c12403          	lw	s0,28(sp)
400001c0:	02010113          	addi	sp,sp,32
400001c4:	00008067          	ret

400001c8 <vga_run>:
400001c8:	fe010113          	addi	sp,sp,-32
400001cc:	00812e23          	sw	s0,28(sp)
400001d0:	02010413          	addi	s0,sp,32
400001d4:	fea42623          	sw	a0,-20(s0)
400001d8:	fec42783          	lw	a5,-20(s0)
400001dc:	00100713          	li	a4,1
400001e0:	00e7a023          	sw	a4,0(a5)
400001e4:	00000013          	nop
400001e8:	01c12403          	lw	s0,28(sp)
400001ec:	02010113          	addi	sp,sp,32
400001f0:	00008067          	ret

400001f4 <vga_stop>:
400001f4:	fe010113          	addi	sp,sp,-32
400001f8:	00112e23          	sw	ra,28(sp)
400001fc:	00812c23          	sw	s0,24(sp)
40000200:	02010413          	addi	s0,sp,32
40000204:	fea42623          	sw	a0,-20(s0)
40000208:	fec42783          	lw	a5,-20(s0)
4000020c:	0007a023          	sw	zero,0(a5)
40000210:	00000013          	nop
40000214:	fec42503          	lw	a0,-20(s0)
40000218:	f7dff0ef          	jal	ra,40000194 <vga_isBusy>
4000021c:	00050793          	mv	a5,a0
40000220:	fe079ae3          	bnez	a5,40000214 <vga_stop+0x20>
40000224:	00000013          	nop
40000228:	00000013          	nop
4000022c:	01c12083          	lw	ra,28(sp)
40000230:	01812403          	lw	s0,24(sp)
40000234:	02010113          	addi	sp,sp,32
40000238:	00008067          	ret

4000023c <prince_write>:
4000023c:	fe010113          	addi	sp,sp,-32
40000240:	00812e23          	sw	s0,28(sp)
40000244:	02010413          	addi	s0,sp,32
40000248:	fea42623          	sw	a0,-20(s0)
4000024c:	feb42423          	sw	a1,-24(s0)
40000250:	f00027b7          	lui	a5,0xf0002
40000254:	fe842703          	lw	a4,-24(s0)
40000258:	00e7a423          	sw	a4,8(a5) # f0002008 <_stack_start+0x700016c8>
4000025c:	f00027b7          	lui	a5,0xf0002
40000260:	00100713          	li	a4,1
40000264:	00e7a223          	sw	a4,4(a5) # f0002004 <_stack_start+0x700016c4>
40000268:	f00027b7          	lui	a5,0xf0002
4000026c:	fec42703          	lw	a4,-20(s0)
40000270:	00e7a623          	sw	a4,12(a5) # f000200c <_stack_start+0x700016cc>
40000274:	f00027b7          	lui	a5,0xf0002
40000278:	00100713          	li	a4,1
4000027c:	00e7a023          	sw	a4,0(a5) # f0002000 <_stack_start+0x700016c0>
40000280:	f00027b7          	lui	a5,0xf0002
40000284:	0007a023          	sw	zero,0(a5) # f0002000 <_stack_start+0x700016c0>
40000288:	00000013          	nop
4000028c:	01c12403          	lw	s0,28(sp)
40000290:	02010113          	addi	sp,sp,32
40000294:	00008067          	ret

40000298 <prince_read>:
40000298:	fd010113          	addi	sp,sp,-48
4000029c:	02812623          	sw	s0,44(sp)
400002a0:	03010413          	addi	s0,sp,48
400002a4:	fca42e23          	sw	a0,-36(s0)
400002a8:	f00027b7          	lui	a5,0xf0002
400002ac:	fdc42703          	lw	a4,-36(s0)
400002b0:	00e7a423          	sw	a4,8(a5) # f0002008 <_stack_start+0x700016c8>
400002b4:	f00027b7          	lui	a5,0xf0002
400002b8:	0007a223          	sw	zero,4(a5) # f0002004 <_stack_start+0x700016c4>
400002bc:	f00027b7          	lui	a5,0xf0002
400002c0:	00100713          	li	a4,1
400002c4:	00e7a023          	sw	a4,0(a5) # f0002000 <_stack_start+0x700016c0>
400002c8:	f00027b7          	lui	a5,0xf0002
400002cc:	0107a783          	lw	a5,16(a5) # f0002010 <_stack_start+0x700016d0>
400002d0:	fef42623          	sw	a5,-20(s0)
400002d4:	f00027b7          	lui	a5,0xf0002
400002d8:	0007a023          	sw	zero,0(a5) # f0002000 <_stack_start+0x700016c0>
400002dc:	fec42783          	lw	a5,-20(s0)
400002e0:	00078513          	mv	a0,a5
400002e4:	02c12403          	lw	s0,44(sp)
400002e8:	03010113          	addi	sp,sp,48
400002ec:	00008067          	ret

400002f0 <prince_cipher>:
400002f0:	fe010113          	addi	sp,sp,-32
400002f4:	00112e23          	sw	ra,28(sp)
400002f8:	00812c23          	sw	s0,24(sp)
400002fc:	00912a23          	sw	s1,20(sp)
40000300:	02010413          	addi	s0,sp,32
40000304:	fea42623          	sw	a0,-20(s0)
40000308:	feb42423          	sw	a1,-24(s0)
4000030c:	fec42223          	sw	a2,-28(s0)
40000310:	fed42023          	sw	a3,-32(s0)
40000314:	00a00593          	li	a1,10
40000318:	fec42503          	lw	a0,-20(s0)
4000031c:	f21ff0ef          	jal	ra,4000023c <prince_write>
40000320:	fe442783          	lw	a5,-28(s0)
40000324:	00478793          	addi	a5,a5,4
40000328:	0007a783          	lw	a5,0(a5)
4000032c:	02100593          	li	a1,33
40000330:	00078513          	mv	a0,a5
40000334:	f09ff0ef          	jal	ra,4000023c <prince_write>
40000338:	fe442783          	lw	a5,-28(s0)
4000033c:	0007a783          	lw	a5,0(a5)
40000340:	02000593          	li	a1,32
40000344:	00078513          	mv	a0,a5
40000348:	ef5ff0ef          	jal	ra,4000023c <prince_write>
4000034c:	fe842783          	lw	a5,-24(s0)
40000350:	00c78793          	addi	a5,a5,12
40000354:	0007a783          	lw	a5,0(a5)
40000358:	01300593          	li	a1,19
4000035c:	00078513          	mv	a0,a5
40000360:	eddff0ef          	jal	ra,4000023c <prince_write>
40000364:	fe842783          	lw	a5,-24(s0)
40000368:	00878793          	addi	a5,a5,8
4000036c:	0007a783          	lw	a5,0(a5)
40000370:	01200593          	li	a1,18
40000374:	00078513          	mv	a0,a5
40000378:	ec5ff0ef          	jal	ra,4000023c <prince_write>
4000037c:	fe842783          	lw	a5,-24(s0)
40000380:	00478793          	addi	a5,a5,4
40000384:	0007a783          	lw	a5,0(a5)
40000388:	01100593          	li	a1,17
4000038c:	00078513          	mv	a0,a5
40000390:	eadff0ef          	jal	ra,4000023c <prince_write>
40000394:	fe842783          	lw	a5,-24(s0)
40000398:	0007a783          	lw	a5,0(a5)
4000039c:	01000593          	li	a1,16
400003a0:	00078513          	mv	a0,a5
400003a4:	e99ff0ef          	jal	ra,4000023c <prince_write>
400003a8:	00800593          	li	a1,8
400003ac:	00100513          	li	a0,1
400003b0:	e8dff0ef          	jal	ra,4000023c <prince_write>
400003b4:	00000013          	nop
400003b8:	00900513          	li	a0,9
400003bc:	eddff0ef          	jal	ra,40000298 <prince_read>
400003c0:	00050793          	mv	a5,a0
400003c4:	fe078ae3          	beqz	a5,400003b8 <prince_cipher+0xc8>
400003c8:	fe042783          	lw	a5,-32(s0)
400003cc:	00478493          	addi	s1,a5,4
400003d0:	03100513          	li	a0,49
400003d4:	ec5ff0ef          	jal	ra,40000298 <prince_read>
400003d8:	00050793          	mv	a5,a0
400003dc:	00f4a023          	sw	a5,0(s1)
400003e0:	03000513          	li	a0,48
400003e4:	eb5ff0ef          	jal	ra,40000298 <prince_read>
400003e8:	00050713          	mv	a4,a0
400003ec:	fe042783          	lw	a5,-32(s0)
400003f0:	00e7a023          	sw	a4,0(a5)
400003f4:	fec42703          	lw	a4,-20(s0)
400003f8:	00100793          	li	a5,1
400003fc:	00f71a63          	bne	a4,a5,40000410 <prince_cipher+0x120>
40000400:	400027b7          	lui	a5,0x40002
40000404:	ab478513          	addi	a0,a5,-1356 # 40001ab4 <vga_simRes_h160_v120+0x20>
40000408:	170010ef          	jal	ra,40001578 <print>
4000040c:	0100006f          	j	4000041c <prince_cipher+0x12c>
40000410:	400027b7          	lui	a5,0x40002
40000414:	b0878513          	addi	a0,a5,-1272 # 40001b08 <vga_simRes_h160_v120+0x74>
40000418:	160010ef          	jal	ra,40001578 <print>
4000041c:	400027b7          	lui	a5,0x40002
40000420:	b5c78513          	addi	a0,a5,-1188 # 40001b5c <vga_simRes_h160_v120+0xc8>
40000424:	154010ef          	jal	ra,40001578 <print>
40000428:	fe442583          	lw	a1,-28(s0)
4000042c:	400027b7          	lui	a5,0x40002
40000430:	b6078513          	addi	a0,a5,-1184 # 40001b60 <vga_simRes_h160_v120+0xcc>
40000434:	3ac010ef          	jal	ra,400017e0 <print64bit>
40000438:	fe842583          	lw	a1,-24(s0)
4000043c:	400027b7          	lui	a5,0x40002
40000440:	b7878513          	addi	a0,a5,-1160 # 40001b78 <vga_simRes_h160_v120+0xe4>
40000444:	40c010ef          	jal	ra,40001850 <print128bit>
40000448:	fe042583          	lw	a1,-32(s0)
4000044c:	400027b7          	lui	a5,0x40002
40000450:	b8c78513          	addi	a0,a5,-1140 # 40001b8c <vga_simRes_h160_v120+0xf8>
40000454:	38c010ef          	jal	ra,400017e0 <print64bit>
40000458:	00000013          	nop
4000045c:	01c12083          	lw	ra,28(sp)
40000460:	01812403          	lw	s0,24(sp)
40000464:	01412483          	lw	s1,20(sp)
40000468:	02010113          	addi	sp,sp,32
4000046c:	00008067          	ret

40000470 <timer_init>:
  volatile uint32_t CLEARS_TICKS;
  volatile uint32_t LIMIT;
  volatile uint32_t VALUE;
} Timer_Reg;

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
typedef struct
{
  volatile uint32_t LIMIT;
} Prescaler_Reg;

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
{
  volatile uint32_t PENDINGS;
  volatile uint32_t MASKS;
} InterruptCtrl_Reg;

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
	enum UartParity parity;
	enum UartStop stop;
	uint32_t clockDivider;
} Uart_Config;

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
  volatile uint32_t  FRAME_BASE;
  volatile uint32_t  DUMMY0[13];
  volatile Vga_Timing TIMING;
} Vga_Reg;

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
400006ac:	f8010113          	addi	sp,sp,-128
400006b0:	06112e23          	sw	ra,124(sp)
400006b4:	06812c23          	sw	s0,120(sp)
400006b8:	08010413          	addi	s0,sp,128
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

//PRINCE
	print("\r\t**********************************PRINCE TEST*******************************\r\n");
400006e4:	400027b7          	lui	a5,0x40002
400006e8:	c0078513          	addi	a0,a5,-1024 # 40001c00 <vga_simRes_h160_v120+0x20>
400006ec:	68d000ef          	jal	ra,40001578 <print>
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
40000714:	c5478513          	addi	a0,a5,-940 # 40001c54 <vga_simRes_h160_v120+0x74>
40000718:	661000ef          	jal	ra,40001578 <print>

	prince_block[1] 	= 0x69c4e0d8;
4000071c:	69c4e7b7          	lui	a5,0x69c4e
40000720:	0d878793          	addi	a5,a5,216 # 69c4e0d8 <__global_pointer$+0x29c4b770>
40000724:	fcf42623          	sw	a5,-52(s0)
	prince_block[0] 	= 0x6a7b0430;
40000728:	6a7b07b7          	lui	a5,0x6a7b0
4000072c:	43078793          	addi	a5,a5,1072 # 6a7b0430 <__global_pointer$+0x2a7adac8>
40000730:	fcf42423          	sw	a5,-56(s0)

	prince_key[3]		= 0xd8cdb780;
40000734:	d8cdb7b7          	lui	a5,0xd8cdb
40000738:	78078793          	addi	a5,a5,1920 # d8cdb780 <_stack_start+0x58cdae40>
4000073c:	fcf42e23          	sw	a5,-36(s0)
	prince_key[2]		= 0x70b4c55a;
40000740:	70b4c7b7          	lui	a5,0x70b4c
40000744:	55a78793          	addi	a5,a5,1370 # 70b4c55a <__global_pointer$+0x30b49bf2>
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
40000784:	ca878513          	addi	a0,a5,-856 # 40001ca8 <vga_simRes_h160_v120+0xc8>
40000788:	5f1000ef          	jal	ra,40001578 <print>

	prince_block[1] 	= 0x43c6b256;
4000078c:	43c6b7b7          	lui	a5,0x43c6b
40000790:	25678793          	addi	a5,a5,598 # 43c6b256 <__global_pointer$+0x3c688ee>
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
//PRESENT
	print("\r\n");
400007c0:	400027b7          	lui	a5,0x40002
400007c4:	cfc78513          	addi	a0,a5,-772 # 40001cfc <vga_simRes_h160_v120+0x11c>
400007c8:	5b1000ef          	jal	ra,40001578 <print>
	print("\r\t******************************PRESENT TEST**********************************\r\n");
400007cc:	400027b7          	lui	a5,0x40002
400007d0:	d0078513          	addi	a0,a5,-768 # 40001d00 <vga_simRes_h160_v120+0x120>
400007d4:	5a5000ef          	jal	ra,40001578 <print>
	unsigned int present_key[3] = {0x0, 0x0, 0x0};
400007d8:	fa042a23          	sw	zero,-76(s0)
400007dc:	fa042c23          	sw	zero,-72(s0)
400007e0:	fa042e23          	sw	zero,-68(s0)
	unsigned int present_block[2] 	= {0x0, 0x0};
400007e4:	fa042623          	sw	zero,-84(s0)
400007e8:	fa042823          	sw	zero,-80(s0)
	unsigned int present_res[2] 	= {0x0, 0x0};
400007ec:	fa042223          	sw	zero,-92(s0)
400007f0:	fa042423          	sw	zero,-88(s0)

	print("\r\n\t==================================TEST 1====================================\r\n");
400007f4:	400027b7          	lui	a5,0x40002
400007f8:	d5478513          	addi	a0,a5,-684 # 40001d54 <vga_simRes_h160_v120+0x174>
400007fc:	57d000ef          	jal	ra,40001578 <print>

	present_block[1]=0x4c746e67;
40000800:	4c7477b7          	lui	a5,0x4c747
40000804:	e6778793          	addi	a5,a5,-409 # 4c746e67 <__global_pointer$+0xc7444ff>
40000808:	faf42823          	sw	a5,-80(s0)
	present_block[0]=0x7579656e;
4000080c:	757967b7          	lui	a5,0x75796
40000810:	56e78793          	addi	a5,a5,1390 # 7579656e <__global_pointer$+0x35793c06>
40000814:	faf42623          	sw	a5,-84(s0)

	present_key[2] = 0x46657465;
40000818:	466577b7          	lui	a5,0x46657
4000081c:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6654afd>
40000820:	faf42e23          	sw	a5,-68(s0)
	present_key[1] = 0x6c48636d;
40000824:	6c4867b7          	lui	a5,0x6c486
40000828:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c483a05>
4000082c:	faf42c23          	sw	a5,-72(s0)
	present_key[0] = 0x7573;
40000830:	000077b7          	lui	a5,0x7
40000834:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
40000838:	faf42a23          	sw	a5,-76(s0)

	present_cipher(PRESENT_OP_EN,present_key,present_block,present_res);
4000083c:	fa440693          	addi	a3,s0,-92
40000840:	fac40713          	addi	a4,s0,-84
40000844:	fb440793          	addi	a5,s0,-76
40000848:	00070613          	mv	a2,a4
4000084c:	00078593          	mv	a1,a5
40000850:	00000513          	li	a0,0
40000854:	4f8000ef          	jal	ra,40000d4c <present_cipher>

	print("\r\n\t==================================TEST 2====================================\r\n");
40000858:	400027b7          	lui	a5,0x40002
4000085c:	da878513          	addi	a0,a5,-600 # 40001da8 <vga_simRes_h160_v120+0x1c8>
40000860:	519000ef          	jal	ra,40001578 <print>

	present_block[1]=0x0e1d00d4;
40000864:	0e1d07b7          	lui	a5,0xe1d0
40000868:	0d478793          	addi	a5,a5,212 # e1d00d4 <_stack_size+0xe1cf8d4>
4000086c:	faf42823          	sw	a5,-80(s0)
	present_block[0]=0xe46ba99c;
40000870:	e46bb7b7          	lui	a5,0xe46bb
40000874:	99c78793          	addi	a5,a5,-1636 # e46ba99c <_stack_start+0x646ba05c>
40000878:	faf42623          	sw	a5,-84(s0)

	//USE THE SAME KEY

	present_cipher(PRESENT_OP_DE,present_key,present_block,present_res);
4000087c:	fa440693          	addi	a3,s0,-92
40000880:	fac40713          	addi	a4,s0,-84
40000884:	fb440793          	addi	a5,s0,-76
40000888:	00070613          	mv	a2,a4
4000088c:	00078593          	mv	a1,a5
40000890:	00100513          	li	a0,1
40000894:	4b8000ef          	jal	ra,40000d4c <present_cipher>
	//DM_PRESENT
	print("\r\n");
40000898:	400027b7          	lui	a5,0x40002
4000089c:	cfc78513          	addi	a0,a5,-772 # 40001cfc <vga_simRes_h160_v120+0x11c>
400008a0:	4d9000ef          	jal	ra,40001578 <print>
	print("\r\t***************************DM_PRESENT TEST**********************************\r\n");
400008a4:	400027b7          	lui	a5,0x40002
400008a8:	dfc78513          	addi	a0,a5,-516 # 40001dfc <vga_simRes_h160_v120+0x21c>
400008ac:	4cd000ef          	jal	ra,40001578 <print>
	unsigned int dm_present_key[3] 		= {0x0, 0x0, 0x0};
400008b0:	f8042c23          	sw	zero,-104(s0)
400008b4:	f8042e23          	sw	zero,-100(s0)
400008b8:	fa042023          	sw	zero,-96(s0)
	unsigned int dm_present_block[2] 	= {0x0, 0x0};
400008bc:	f8042823          	sw	zero,-112(s0)
400008c0:	f8042a23          	sw	zero,-108(s0)
	unsigned int dm_present_res[2] 		= {0x0, 0x0};
400008c4:	f8042423          	sw	zero,-120(s0)
400008c8:	f8042623          	sw	zero,-116(s0)

	print("\r\n\t==================================TEST 1====================================\r\n");
400008cc:	400027b7          	lui	a5,0x40002
400008d0:	d5478513          	addi	a0,a5,-684 # 40001d54 <vga_simRes_h160_v120+0x174>
400008d4:	4a5000ef          	jal	ra,40001578 <print>

	dm_present_block[1]=0x4c746e67;
400008d8:	4c7477b7          	lui	a5,0x4c747
400008dc:	e6778793          	addi	a5,a5,-409 # 4c746e67 <__global_pointer$+0xc7444ff>
400008e0:	f8f42a23          	sw	a5,-108(s0)
	dm_present_block[0]=0x7579656e;
400008e4:	757967b7          	lui	a5,0x75796
400008e8:	56e78793          	addi	a5,a5,1390 # 7579656e <__global_pointer$+0x35793c06>
400008ec:	f8f42823          	sw	a5,-112(s0)

	dm_present_key[2] = 0x46657465;
400008f0:	466577b7          	lui	a5,0x46657
400008f4:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6654afd>
400008f8:	faf42023          	sw	a5,-96(s0)
	dm_present_key[1] = 0x6c48636d;
400008fc:	6c4867b7          	lui	a5,0x6c486
40000900:	36d78793          	addi	a5,a5,877 # 6c48636d <__global_pointer$+0x2c483a05>
40000904:	f8f42e23          	sw	a5,-100(s0)
	dm_present_key[0] = 0x7573;
40000908:	000077b7          	lui	a5,0x7
4000090c:	57378793          	addi	a5,a5,1395 # 7573 <_stack_size+0x6d73>
40000910:	f8f42c23          	sw	a5,-104(s0)

	//expec: 42696eb3 9112ccf2

	dm_present_hash(dm_present_key,dm_present_block,dm_present_res);
40000914:	f8840693          	addi	a3,s0,-120
40000918:	f9040713          	addi	a4,s0,-112
4000091c:	f9840793          	addi	a5,s0,-104
40000920:	00068613          	mv	a2,a3
40000924:	00070593          	mv	a1,a4
40000928:	00078513          	mv	a0,a5
4000092c:	0d5000ef          	jal	ra,40001200 <dm_present_hash>

	print("\r\n\t==================================TEST 2====================================\r\n");
40000930:	400027b7          	lui	a5,0x40002
40000934:	da878513          	addi	a0,a5,-600 # 40001da8 <vga_simRes_h160_v120+0x1c8>
40000938:	441000ef          	jal	ra,40001578 <print>

	dm_present_block[1]=0x46657465;
4000093c:	466577b7          	lui	a5,0x46657
40000940:	46578793          	addi	a5,a5,1125 # 46657465 <__global_pointer$+0x6654afd>
40000944:	f8f42a23          	sw	a5,-108(s0)
	dm_present_block[0]=0x6c5f5553;
40000948:	6c5f57b7          	lui	a5,0x6c5f5
4000094c:	55378793          	addi	a5,a5,1363 # 6c5f5553 <__global_pointer$+0x2c5f2beb>
40000950:	f8f42823          	sw	a5,-112(s0)

	dm_present_key[2] = 0x00000000;
40000954:	fa042023          	sw	zero,-96(s0)
	dm_present_key[1] = 0x00000000;
40000958:	f8042e23          	sw	zero,-100(s0)
	dm_present_key[0] = 0x0001;
4000095c:	00100793          	li	a5,1
40000960:	f8f42c23          	sw	a5,-104(s0)
	//expec:d52384e3 dcee9ce7

	dm_present_hash(dm_present_key,dm_present_block,dm_present_res);
40000964:	f8840693          	addi	a3,s0,-120
40000968:	f9040713          	addi	a4,s0,-112
4000096c:	f9840793          	addi	a5,s0,-104
40000970:	00068613          	mv	a2,a3
40000974:	00070593          	mv	a1,a4
40000978:	00078513          	mv	a0,a5
4000097c:	085000ef          	jal	ra,40001200 <dm_present_hash>
	print("\r\n\t==================================TEST 3====================================\r\n");
40000980:	400027b7          	lui	a5,0x40002
40000984:	e5078513          	addi	a0,a5,-432 # 40001e50 <vga_simRes_h160_v120+0x270>
40000988:	3f1000ef          	jal	ra,40001578 <print>

	dm_present_block[1]=0x31383230;
4000098c:	313837b7          	lui	a5,0x31383
40000990:	23078793          	addi	a5,a5,560 # 31383230 <_stack_size+0x31382a30>
40000994:	f8f42a23          	sw	a5,-108(s0)
	dm_present_block[0]=0x30313833;
40000998:	303147b7          	lui	a5,0x30314
4000099c:	83378793          	addi	a5,a5,-1997 # 30313833 <_stack_size+0x30313033>
400009a0:	f8f42823          	sw	a5,-112(s0)

	dm_present_key[2] = 0x31383230;
400009a4:	313837b7          	lui	a5,0x31383
400009a8:	23078793          	addi	a5,a5,560 # 31383230 <_stack_size+0x31382a30>
400009ac:	faf42023          	sw	a5,-96(s0)
	dm_present_key[1] = 0x30313833;
400009b0:	303147b7          	lui	a5,0x30314
400009b4:	83378793          	addi	a5,a5,-1997 # 30313833 <_stack_size+0x30313033>
400009b8:	f8f42e23          	sw	a5,-100(s0)
	dm_present_key[0] = 0x5553;
400009bc:	000057b7          	lui	a5,0x5
400009c0:	55378793          	addi	a5,a5,1363 # 5553 <_stack_size+0x4d53>
400009c4:	f8f42c23          	sw	a5,-104(s0)
	//expec: 08e11c56 b6d5a592
	dm_present_hash(dm_present_key,dm_present_block,dm_present_res);
400009c8:	f8840693          	addi	a3,s0,-120
400009cc:	f9040713          	addi	a4,s0,-112
400009d0:	f9840793          	addi	a5,s0,-104
400009d4:	00068613          	mv	a2,a3
400009d8:	00070593          	mv	a1,a4
400009dc:	00078513          	mv	a0,a5
400009e0:	021000ef          	jal	ra,40001200 <dm_present_hash>

	return 0;	
400009e4:	00000793          	li	a5,0
}
400009e8:	00078513          	mv	a0,a5
400009ec:	07c12083          	lw	ra,124(sp)
400009f0:	07812403          	lw	s0,120(sp)
400009f4:	08010113          	addi	sp,sp,128
400009f8:	00008067          	ret

400009fc <irqCallback>:
void irqCallback(){
400009fc:	ff010113          	addi	sp,sp,-16
40000a00:	00812623          	sw	s0,12(sp)
40000a04:	01010413          	addi	s0,sp,16

}
40000a08:	00000013          	nop
40000a0c:	00c12403          	lw	s0,12(sp)
40000a10:	01010113          	addi	sp,sp,16
40000a14:	00008067          	ret

40000a18 <timer_init>:
static void timer_init(Timer_Reg *reg){
40000a18:	fe010113          	addi	sp,sp,-32
40000a1c:	00812e23          	sw	s0,28(sp)
40000a20:	02010413          	addi	s0,sp,32
40000a24:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000a28:	fec42783          	lw	a5,-20(s0)
40000a2c:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000a30:	fec42783          	lw	a5,-20(s0)
40000a34:	0007a423          	sw	zero,8(a5)
}
40000a38:	00000013          	nop
40000a3c:	01c12403          	lw	s0,28(sp)
40000a40:	02010113          	addi	sp,sp,32
40000a44:	00008067          	ret

40000a48 <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40000a48:	fe010113          	addi	sp,sp,-32
40000a4c:	00812e23          	sw	s0,28(sp)
40000a50:	02010413          	addi	s0,sp,32
40000a54:	fea42623          	sw	a0,-20(s0)
}
40000a58:	00000013          	nop
40000a5c:	01c12403          	lw	s0,28(sp)
40000a60:	02010113          	addi	sp,sp,32
40000a64:	00008067          	ret

40000a68 <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40000a68:	fe010113          	addi	sp,sp,-32
40000a6c:	00812e23          	sw	s0,28(sp)
40000a70:	02010413          	addi	s0,sp,32
40000a74:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40000a78:	fec42783          	lw	a5,-20(s0)
40000a7c:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40000a80:	fec42783          	lw	a5,-20(s0)
40000a84:	fff00713          	li	a4,-1
40000a88:	00e7a023          	sw	a4,0(a5)
}
40000a8c:	00000013          	nop
40000a90:	01c12403          	lw	s0,28(sp)
40000a94:	02010113          	addi	sp,sp,32
40000a98:	00008067          	ret

40000a9c <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40000a9c:	fe010113          	addi	sp,sp,-32
40000aa0:	00812e23          	sw	s0,28(sp)
40000aa4:	02010413          	addi	s0,sp,32
40000aa8:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000aac:	fec42783          	lw	a5,-20(s0)
40000ab0:	0047a783          	lw	a5,4(a5)
40000ab4:	0107d793          	srli	a5,a5,0x10
40000ab8:	0ff7f793          	zext.b	a5,a5
}
40000abc:	00078513          	mv	a0,a5
40000ac0:	01c12403          	lw	s0,28(sp)
40000ac4:	02010113          	addi	sp,sp,32
40000ac8:	00008067          	ret

40000acc <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40000acc:	fe010113          	addi	sp,sp,-32
40000ad0:	00812e23          	sw	s0,28(sp)
40000ad4:	02010413          	addi	s0,sp,32
40000ad8:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40000adc:	fec42783          	lw	a5,-20(s0)
40000ae0:	0047a783          	lw	a5,4(a5)
40000ae4:	0187d793          	srli	a5,a5,0x18
}
40000ae8:	00078513          	mv	a0,a5
40000aec:	01c12403          	lw	s0,28(sp)
40000af0:	02010113          	addi	sp,sp,32
40000af4:	00008067          	ret

40000af8 <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40000af8:	fe010113          	addi	sp,sp,-32
40000afc:	00112e23          	sw	ra,28(sp)
40000b00:	00812c23          	sw	s0,24(sp)
40000b04:	02010413          	addi	s0,sp,32
40000b08:	fea42623          	sw	a0,-20(s0)
40000b0c:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40000b10:	00000013          	nop
40000b14:	fec42503          	lw	a0,-20(s0)
40000b18:	f85ff0ef          	jal	ra,40000a9c <uart_writeAvailability>
40000b1c:	00050793          	mv	a5,a0
40000b20:	fe078ae3          	beqz	a5,40000b14 <uart_write+0x1c>
	reg->DATA = data;
40000b24:	fec42783          	lw	a5,-20(s0)
40000b28:	fe842703          	lw	a4,-24(s0)
40000b2c:	00e7a023          	sw	a4,0(a5)
}
40000b30:	00000013          	nop
40000b34:	01c12083          	lw	ra,28(sp)
40000b38:	01812403          	lw	s0,24(sp)
40000b3c:	02010113          	addi	sp,sp,32
40000b40:	00008067          	ret

40000b44 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40000b44:	fe010113          	addi	sp,sp,-32
40000b48:	00812e23          	sw	s0,28(sp)
40000b4c:	02010413          	addi	s0,sp,32
40000b50:	fea42623          	sw	a0,-20(s0)
40000b54:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40000b58:	fe842783          	lw	a5,-24(s0)
40000b5c:	00c7a703          	lw	a4,12(a5)
40000b60:	fec42783          	lw	a5,-20(s0)
40000b64:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40000b68:	fe842783          	lw	a5,-24(s0)
40000b6c:	0007a783          	lw	a5,0(a5)
40000b70:	fff78713          	addi	a4,a5,-1
40000b74:	fe842783          	lw	a5,-24(s0)
40000b78:	0047a783          	lw	a5,4(a5)
40000b7c:	00879793          	slli	a5,a5,0x8
40000b80:	00f76733          	or	a4,a4,a5
40000b84:	fe842783          	lw	a5,-24(s0)
40000b88:	0087a783          	lw	a5,8(a5)
40000b8c:	01079793          	slli	a5,a5,0x10
40000b90:	00f76733          	or	a4,a4,a5
40000b94:	fec42783          	lw	a5,-20(s0)
40000b98:	00e7a623          	sw	a4,12(a5)
}
40000b9c:	00000013          	nop
40000ba0:	01c12403          	lw	s0,28(sp)
40000ba4:	02010113          	addi	sp,sp,32
40000ba8:	00008067          	ret

40000bac <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40000bac:	fe010113          	addi	sp,sp,-32
40000bb0:	00812e23          	sw	s0,28(sp)
40000bb4:	02010413          	addi	s0,sp,32
40000bb8:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40000bbc:	fec42783          	lw	a5,-20(s0)
40000bc0:	0007a783          	lw	a5,0(a5)
40000bc4:	0027f793          	andi	a5,a5,2
40000bc8:	00f037b3          	snez	a5,a5
40000bcc:	0ff7f793          	zext.b	a5,a5
}
40000bd0:	00078513          	mv	a0,a5
40000bd4:	01c12403          	lw	s0,28(sp)
40000bd8:	02010113          	addi	sp,sp,32
40000bdc:	00008067          	ret

40000be0 <vga_run>:
static void vga_run(Vga_Reg *reg){
40000be0:	fe010113          	addi	sp,sp,-32
40000be4:	00812e23          	sw	s0,28(sp)
40000be8:	02010413          	addi	s0,sp,32
40000bec:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
40000bf0:	fec42783          	lw	a5,-20(s0)
40000bf4:	00100713          	li	a4,1
40000bf8:	00e7a023          	sw	a4,0(a5)
}
40000bfc:	00000013          	nop
40000c00:	01c12403          	lw	s0,28(sp)
40000c04:	02010113          	addi	sp,sp,32
40000c08:	00008067          	ret

40000c0c <vga_stop>:
static void vga_stop(Vga_Reg *reg){
40000c0c:	fe010113          	addi	sp,sp,-32
40000c10:	00112e23          	sw	ra,28(sp)
40000c14:	00812c23          	sw	s0,24(sp)
40000c18:	02010413          	addi	s0,sp,32
40000c1c:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40000c20:	fec42783          	lw	a5,-20(s0)
40000c24:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40000c28:	00000013          	nop
40000c2c:	fec42503          	lw	a0,-20(s0)
40000c30:	f7dff0ef          	jal	ra,40000bac <vga_isBusy>
40000c34:	00050793          	mv	a5,a0
40000c38:	fe079ae3          	bnez	a5,40000c2c <vga_stop+0x20>
}
40000c3c:	00000013          	nop
40000c40:	00000013          	nop
40000c44:	01c12083          	lw	ra,28(sp)
40000c48:	01812403          	lw	s0,24(sp)
40000c4c:	02010113          	addi	sp,sp,32
40000c50:	00008067          	ret

40000c54 <present_write>:
#include "briey.h"
void present_write(uint32_t iData, uint32_t iAddress)
{
40000c54:	fe010113          	addi	sp,sp,-32
40000c58:	00812e23          	sw	s0,28(sp)
40000c5c:	02010413          	addi	s0,sp,32
40000c60:	fea42623          	sw	a0,-20(s0)
40000c64:	feb42423          	sw	a1,-24(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
40000c68:	f00027b7          	lui	a5,0xf0002
40000c6c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000c70:	fe842703          	lw	a4,-24(s0)
40000c74:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->WRITE_N 		= 0;
40000c78:	f00027b7          	lui	a5,0xf0002
40000c7c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000c80:	0007a223          	sw	zero,4(a5)
	PRESENT_BASE->READ_N 		= 1;
40000c84:	f00027b7          	lui	a5,0xf0002
40000c88:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000c8c:	00100713          	li	a4,1
40000c90:	00e7a423          	sw	a4,8(a5)
	PRESENT_BASE->IDATA			= iData;
40000c94:	f00027b7          	lui	a5,0xf0002
40000c98:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000c9c:	fec42703          	lw	a4,-20(s0)
40000ca0:	00e7a823          	sw	a4,16(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
40000ca4:	f00027b7          	lui	a5,0xf0002
40000ca8:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000cac:	0007a023          	sw	zero,0(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
40000cb0:	f00027b7          	lui	a5,0xf0002
40000cb4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000cb8:	00100713          	li	a4,1
40000cbc:	00e7a023          	sw	a4,0(a5)
}
40000cc0:	00000013          	nop
40000cc4:	01c12403          	lw	s0,28(sp)
40000cc8:	02010113          	addi	sp,sp,32
40000ccc:	00008067          	ret

40000cd0 <present_read>:
uint32_t present_read(uint32_t iAddress)
{
40000cd0:	fd010113          	addi	sp,sp,-48
40000cd4:	02812623          	sw	s0,44(sp)
40000cd8:	03010413          	addi	s0,sp,48
40000cdc:	fca42e23          	sw	a0,-36(s0)
	PRESENT_BASE->ADDRESS		= iAddress;
40000ce0:	f00027b7          	lui	a5,0xf0002
40000ce4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000ce8:	fdc42703          	lw	a4,-36(s0)
40000cec:	00e7a623          	sw	a4,12(a5)
	PRESENT_BASE->READ_N		= 0;
40000cf0:	f00027b7          	lui	a5,0xf0002
40000cf4:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000cf8:	0007a423          	sw	zero,8(a5)
	PRESENT_BASE->WRITE_N		= 1;
40000cfc:	f00027b7          	lui	a5,0xf0002
40000d00:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000d04:	00100713          	li	a4,1
40000d08:	00e7a223          	sw	a4,4(a5)
	PRESENT_BASE->CHIP_SELECT_N	= 0;
40000d0c:	f00027b7          	lui	a5,0xf0002
40000d10:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000d14:	0007a023          	sw	zero,0(a5)
	uint32_t res 				= PRESENT_BASE->ODATA;
40000d18:	f00027b7          	lui	a5,0xf0002
40000d1c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000d20:	0147a783          	lw	a5,20(a5)
40000d24:	fef42623          	sw	a5,-20(s0)
	PRESENT_BASE->CHIP_SELECT_N	= 1;
40000d28:	f00027b7          	lui	a5,0xf0002
40000d2c:	40078793          	addi	a5,a5,1024 # f0002400 <_stack_start+0x70001ac0>
40000d30:	00100713          	li	a4,1
40000d34:	00e7a023          	sw	a4,0(a5)
	return res;
40000d38:	fec42783          	lw	a5,-20(s0)
}
40000d3c:	00078513          	mv	a0,a5
40000d40:	02c12403          	lw	s0,44(sp)
40000d44:	03010113          	addi	sp,sp,48
40000d48:	00008067          	ret

40000d4c <present_cipher>:
void present_cipher(unsigned char operation, uint32_t *key, uint32_t *block, uint32_t *res) {
40000d4c:	fe010113          	addi	sp,sp,-32
40000d50:	00112e23          	sw	ra,28(sp)
40000d54:	00812c23          	sw	s0,24(sp)
40000d58:	00912a23          	sw	s1,20(sp)
40000d5c:	02010413          	addi	s0,sp,32
40000d60:	00050793          	mv	a5,a0
40000d64:	feb42423          	sw	a1,-24(s0)
40000d68:	fec42223          	sw	a2,-28(s0)
40000d6c:	fed42023          	sw	a3,-32(s0)
40000d70:	fef407a3          	sb	a5,-17(s0)

	//EN_OR_DE
	if(operation == PRESENT_OP_EN) present_write(PRESENT_OP_EN,PRESENT_ADDR_EN_OR_DE);
40000d74:	fef44783          	lbu	a5,-17(s0)
40000d78:	00079a63          	bnez	a5,40000d8c <present_cipher+0x40>
40000d7c:	00800593          	li	a1,8
40000d80:	00000513          	li	a0,0
40000d84:	ed1ff0ef          	jal	ra,40000c54 <present_write>
40000d88:	0100006f          	j	40000d98 <present_cipher+0x4c>
	else present_write(PRESENT_OP_DE,PRESENT_ADDR_EN_OR_DE);
40000d8c:	00800593          	li	a1,8
40000d90:	00100513          	li	a0,1
40000d94:	ec1ff0ef          	jal	ra,40000c54 <present_write>

	//PLAIN_TEXT
	present_write(block[1],PRESENT_ADDR_BLOCK_BASE +1);
40000d98:	fe442783          	lw	a5,-28(s0)
40000d9c:	00478793          	addi	a5,a5,4
40000da0:	0007a783          	lw	a5,0(a5)
40000da4:	00500593          	li	a1,5
40000da8:	00078513          	mv	a0,a5
40000dac:	ea9ff0ef          	jal	ra,40000c54 <present_write>
	present_write(block[0],PRESENT_ADDR_BLOCK_BASE);
40000db0:	fe442783          	lw	a5,-28(s0)
40000db4:	0007a783          	lw	a5,0(a5)
40000db8:	00400593          	li	a1,4
40000dbc:	00078513          	mv	a0,a5
40000dc0:	e95ff0ef          	jal	ra,40000c54 <present_write>

	//KEY
	present_write(key[2],PRESENT_ADDR_KEY_BASE +2);
40000dc4:	fe842783          	lw	a5,-24(s0)
40000dc8:	00878793          	addi	a5,a5,8
40000dcc:	0007a783          	lw	a5,0(a5)
40000dd0:	00300593          	li	a1,3
40000dd4:	00078513          	mv	a0,a5
40000dd8:	e7dff0ef          	jal	ra,40000c54 <present_write>
	present_write(key[1],PRESENT_ADDR_KEY_BASE +1);
40000ddc:	fe842783          	lw	a5,-24(s0)
40000de0:	00478793          	addi	a5,a5,4
40000de4:	0007a783          	lw	a5,0(a5)
40000de8:	00200593          	li	a1,2
40000dec:	00078513          	mv	a0,a5
40000df0:	e65ff0ef          	jal	ra,40000c54 <present_write>
	present_write(key[0],PRESENT_ADDR_KEY_BASE);
40000df4:	fe842783          	lw	a5,-24(s0)
40000df8:	0007a783          	lw	a5,0(a5)
40000dfc:	00100593          	li	a1,1
40000e00:	00078513          	mv	a0,a5
40000e04:	e51ff0ef          	jal	ra,40000c54 <present_write>

	//START
	present_write(0x1,PRESENT_ADDR_START);
40000e08:	00000593          	li	a1,0
40000e0c:	00100513          	li	a0,1
40000e10:	e45ff0ef          	jal	ra,40000c54 <present_write>
    while(present_read(PRESENT_ADDR_RESULT_BASE) == 0);
40000e14:	00000013          	nop
40000e18:	00600513          	li	a0,6
40000e1c:	eb5ff0ef          	jal	ra,40000cd0 <present_read>
40000e20:	00050793          	mv	a5,a0
40000e24:	fe078ae3          	beqz	a5,40000e18 <present_cipher+0xcc>

    res[1] = present_read(PRESENT_ADDR_RESULT_BASE +1);
40000e28:	fe042783          	lw	a5,-32(s0)
40000e2c:	00478493          	addi	s1,a5,4
40000e30:	00700513          	li	a0,7
40000e34:	e9dff0ef          	jal	ra,40000cd0 <present_read>
40000e38:	00050793          	mv	a5,a0
40000e3c:	00f4a023          	sw	a5,0(s1)
    res[0] =present_read(PRESENT_ADDR_RESULT_BASE);
40000e40:	00600513          	li	a0,6
40000e44:	e8dff0ef          	jal	ra,40000cd0 <present_read>
40000e48:	00050713          	mv	a4,a0
40000e4c:	fe042783          	lw	a5,-32(s0)
40000e50:	00e7a023          	sw	a4,0(a5)


    //print result to terminal
	if(operation == PRESENT_OP_EN)
40000e54:	fef44783          	lbu	a5,-17(s0)
40000e58:	00079a63          	bnez	a5,40000e6c <present_cipher+0x120>
		print("\r\t===========================PRESENT ENCRYPTTION==============================\r\n");
40000e5c:	400027b7          	lui	a5,0x40002
40000e60:	f0478513          	addi	a0,a5,-252 # 40001f04 <vga_simRes_h160_v120+0x20>
40000e64:	714000ef          	jal	ra,40001578 <print>
40000e68:	0100006f          	j	40000e78 <present_cipher+0x12c>
	else
		print("\r\t===========================PRESENT DECRYPTTION==============================\r\n");
40000e6c:	400027b7          	lui	a5,0x40002
40000e70:	f5878513          	addi	a0,a5,-168 # 40001f58 <vga_simRes_h160_v120+0x74>
40000e74:	704000ef          	jal	ra,40001578 <print>
	print("\r\n");
40000e78:	400027b7          	lui	a5,0x40002
40000e7c:	fac78513          	addi	a0,a5,-84 # 40001fac <vga_simRes_h160_v120+0xc8>
40000e80:	6f8000ef          	jal	ra,40001578 <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
40000e84:	fe442583          	lw	a1,-28(s0)
40000e88:	400027b7          	lui	a5,0x40002
40000e8c:	fb078513          	addi	a0,a5,-80 # 40001fb0 <vga_simRes_h160_v120+0xcc>
40000e90:	151000ef          	jal	ra,400017e0 <print64bit>
	print80bit("KEY (80-bit) : ", key);
40000e94:	fe842583          	lw	a1,-24(s0)
40000e98:	400027b7          	lui	a5,0x40002
40000e9c:	fcc78513          	addi	a0,a5,-52 # 40001fcc <vga_simRes_h160_v120+0xe8>
40000ea0:	249000ef          	jal	ra,400018e8 <print80bit>
	print64bit("RESULT (64-bit) : ", res);
40000ea4:	fe042583          	lw	a1,-32(s0)
40000ea8:	400027b7          	lui	a5,0x40002
40000eac:	fdc78513          	addi	a0,a5,-36 # 40001fdc <vga_simRes_h160_v120+0xf8>
40000eb0:	131000ef          	jal	ra,400017e0 <print64bit>
	//print("\r\n============================================================================\r\n");
}
40000eb4:	00000013          	nop
40000eb8:	01c12083          	lw	ra,28(sp)
40000ebc:	01812403          	lw	s0,24(sp)
40000ec0:	01412483          	lw	s1,20(sp)
40000ec4:	02010113          	addi	sp,sp,32
40000ec8:	00008067          	ret

40000ecc <timer_init>:
static void timer_init(Timer_Reg *reg){
40000ecc:	fe010113          	addi	sp,sp,-32
40000ed0:	00812e23          	sw	s0,28(sp)
40000ed4:	02010413          	addi	s0,sp,32
40000ed8:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000edc:	fec42783          	lw	a5,-20(s0)
40000ee0:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000ee4:	fec42783          	lw	a5,-20(s0)
40000ee8:	0007a423          	sw	zero,8(a5)
}
40000eec:	00000013          	nop
40000ef0:	01c12403          	lw	s0,28(sp)
40000ef4:	02010113          	addi	sp,sp,32
40000ef8:	00008067          	ret

40000efc <prescaler_init>:
static void prescaler_init(Prescaler_Reg* reg){
40000efc:	fe010113          	addi	sp,sp,-32
40000f00:	00812e23          	sw	s0,28(sp)
40000f04:	02010413          	addi	s0,sp,32
40000f08:	fea42623          	sw	a0,-20(s0)
}
40000f0c:	00000013          	nop
40000f10:	01c12403          	lw	s0,28(sp)
40000f14:	02010113          	addi	sp,sp,32
40000f18:	00008067          	ret

40000f1c <interruptCtrl_init>:
static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40000f1c:	fe010113          	addi	sp,sp,-32
40000f20:	00812e23          	sw	s0,28(sp)
40000f24:	02010413          	addi	s0,sp,32
40000f28:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40000f2c:	fec42783          	lw	a5,-20(s0)
40000f30:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40000f34:	fec42783          	lw	a5,-20(s0)
40000f38:	fff00713          	li	a4,-1
40000f3c:	00e7a023          	sw	a4,0(a5)
}
40000f40:	00000013          	nop
40000f44:	01c12403          	lw	s0,28(sp)
40000f48:	02010113          	addi	sp,sp,32
40000f4c:	00008067          	ret

40000f50 <uart_writeAvailability>:
static uint32_t uart_writeAvailability(Uart_Reg *reg){
40000f50:	fe010113          	addi	sp,sp,-32
40000f54:	00812e23          	sw	s0,28(sp)
40000f58:	02010413          	addi	s0,sp,32
40000f5c:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000f60:	fec42783          	lw	a5,-20(s0)
40000f64:	0047a783          	lw	a5,4(a5)
40000f68:	0107d793          	srli	a5,a5,0x10
40000f6c:	0ff7f793          	zext.b	a5,a5
}
40000f70:	00078513          	mv	a0,a5
40000f74:	01c12403          	lw	s0,28(sp)
40000f78:	02010113          	addi	sp,sp,32
40000f7c:	00008067          	ret

40000f80 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
40000f80:	fe010113          	addi	sp,sp,-32
40000f84:	00812e23          	sw	s0,28(sp)
40000f88:	02010413          	addi	s0,sp,32
40000f8c:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
40000f90:	fec42783          	lw	a5,-20(s0)
40000f94:	0047a783          	lw	a5,4(a5)
40000f98:	0187d793          	srli	a5,a5,0x18
}
40000f9c:	00078513          	mv	a0,a5
40000fa0:	01c12403          	lw	s0,28(sp)
40000fa4:	02010113          	addi	sp,sp,32
40000fa8:	00008067          	ret

40000fac <uart_write>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40000fac:	fe010113          	addi	sp,sp,-32
40000fb0:	00112e23          	sw	ra,28(sp)
40000fb4:	00812c23          	sw	s0,24(sp)
40000fb8:	02010413          	addi	s0,sp,32
40000fbc:	fea42623          	sw	a0,-20(s0)
40000fc0:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
40000fc4:	00000013          	nop
40000fc8:	fec42503          	lw	a0,-20(s0)
40000fcc:	f85ff0ef          	jal	ra,40000f50 <uart_writeAvailability>
40000fd0:	00050793          	mv	a5,a0
40000fd4:	fe078ae3          	beqz	a5,40000fc8 <uart_write+0x1c>
	reg->DATA = data;
40000fd8:	fec42783          	lw	a5,-20(s0)
40000fdc:	fe842703          	lw	a4,-24(s0)
40000fe0:	00e7a023          	sw	a4,0(a5)
}
40000fe4:	00000013          	nop
40000fe8:	01c12083          	lw	ra,28(sp)
40000fec:	01812403          	lw	s0,24(sp)
40000ff0:	02010113          	addi	sp,sp,32
40000ff4:	00008067          	ret

40000ff8 <uart_applyConfig>:
static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
40000ff8:	fe010113          	addi	sp,sp,-32
40000ffc:	00812e23          	sw	s0,28(sp)
40001000:	02010413          	addi	s0,sp,32
40001004:	fea42623          	sw	a0,-20(s0)
40001008:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
4000100c:	fe842783          	lw	a5,-24(s0)
40001010:	00c7a703          	lw	a4,12(a5)
40001014:	fec42783          	lw	a5,-20(s0)
40001018:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
4000101c:	fe842783          	lw	a5,-24(s0)
40001020:	0007a783          	lw	a5,0(a5)
40001024:	fff78713          	addi	a4,a5,-1
40001028:	fe842783          	lw	a5,-24(s0)
4000102c:	0047a783          	lw	a5,4(a5)
40001030:	00879793          	slli	a5,a5,0x8
40001034:	00f76733          	or	a4,a4,a5
40001038:	fe842783          	lw	a5,-24(s0)
4000103c:	0087a783          	lw	a5,8(a5)
40001040:	01079793          	slli	a5,a5,0x10
40001044:	00f76733          	or	a4,a4,a5
40001048:	fec42783          	lw	a5,-20(s0)
4000104c:	00e7a623          	sw	a4,12(a5)
}
40001050:	00000013          	nop
40001054:	01c12403          	lw	s0,28(sp)
40001058:	02010113          	addi	sp,sp,32
4000105c:	00008067          	ret

40001060 <vga_isBusy>:
static uint32_t vga_isBusy(Vga_Reg *reg){
40001060:	fe010113          	addi	sp,sp,-32
40001064:	00812e23          	sw	s0,28(sp)
40001068:	02010413          	addi	s0,sp,32
4000106c:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
40001070:	fec42783          	lw	a5,-20(s0)
40001074:	0007a783          	lw	a5,0(a5)
40001078:	0027f793          	andi	a5,a5,2
4000107c:	00f037b3          	snez	a5,a5
40001080:	0ff7f793          	zext.b	a5,a5
}
40001084:	00078513          	mv	a0,a5
40001088:	01c12403          	lw	s0,28(sp)
4000108c:	02010113          	addi	sp,sp,32
40001090:	00008067          	ret

40001094 <vga_run>:
static void vga_run(Vga_Reg *reg){
40001094:	fe010113          	addi	sp,sp,-32
40001098:	00812e23          	sw	s0,28(sp)
4000109c:	02010413          	addi	s0,sp,32
400010a0:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
400010a4:	fec42783          	lw	a5,-20(s0)
400010a8:	00100713          	li	a4,1
400010ac:	00e7a023          	sw	a4,0(a5)
}
400010b0:	00000013          	nop
400010b4:	01c12403          	lw	s0,28(sp)
400010b8:	02010113          	addi	sp,sp,32
400010bc:	00008067          	ret

400010c0 <vga_stop>:
static void vga_stop(Vga_Reg *reg){
400010c0:	fe010113          	addi	sp,sp,-32
400010c4:	00112e23          	sw	ra,28(sp)
400010c8:	00812c23          	sw	s0,24(sp)
400010cc:	02010413          	addi	s0,sp,32
400010d0:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
400010d4:	fec42783          	lw	a5,-20(s0)
400010d8:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
400010dc:	00000013          	nop
400010e0:	fec42503          	lw	a0,-20(s0)
400010e4:	f7dff0ef          	jal	ra,40001060 <vga_isBusy>
400010e8:	00050793          	mv	a5,a0
400010ec:	fe079ae3          	bnez	a5,400010e0 <vga_stop+0x20>
}
400010f0:	00000013          	nop
400010f4:	00000013          	nop
400010f8:	01c12083          	lw	ra,28(sp)
400010fc:	01812403          	lw	s0,24(sp)
40001100:	02010113          	addi	sp,sp,32
40001104:	00008067          	ret

40001108 <dm_present_write>:
#include "briey.h"
void dm_present_write(uint32_t iData, uint32_t iAddress)
{
40001108:	fe010113          	addi	sp,sp,-32
4000110c:	00812e23          	sw	s0,28(sp)
40001110:	02010413          	addi	s0,sp,32
40001114:	fea42623          	sw	a0,-20(s0)
40001118:	feb42423          	sw	a1,-24(s0)
	DMPRESENT_BASE->ADDRESS			= iAddress;
4000111c:	f00037b7          	lui	a5,0xf0003
40001120:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001124:	fe842703          	lw	a4,-24(s0)
40001128:	00e7a623          	sw	a4,12(a5)
	DMPRESENT_BASE->WRITE_N 		= 0;
4000112c:	f00037b7          	lui	a5,0xf0003
40001130:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001134:	0007a223          	sw	zero,4(a5)
	DMPRESENT_BASE->READ_N 			= 1;
40001138:	f00037b7          	lui	a5,0xf0003
4000113c:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001140:	00100713          	li	a4,1
40001144:	00e7a423          	sw	a4,8(a5)
	DMPRESENT_BASE->IDATA			= iData;
40001148:	f00037b7          	lui	a5,0xf0003
4000114c:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001150:	fec42703          	lw	a4,-20(s0)
40001154:	00e7a823          	sw	a4,16(a5)
	DMPRESENT_BASE->CHIP_SELECT_N	= 0;
40001158:	f00037b7          	lui	a5,0xf0003
4000115c:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
40001160:	0007a023          	sw	zero,0(a5)
	DMPRESENT_BASE->CHIP_SELECT_N	= 1;
40001164:	f00037b7          	lui	a5,0xf0003
40001168:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
4000116c:	00100713          	li	a4,1
40001170:	00e7a023          	sw	a4,0(a5)
}
40001174:	00000013          	nop
40001178:	01c12403          	lw	s0,28(sp)
4000117c:	02010113          	addi	sp,sp,32
40001180:	00008067          	ret

40001184 <dm_present_read>:
uint32_t dm_present_read(uint32_t iAddress)
{
40001184:	fd010113          	addi	sp,sp,-48
40001188:	02812623          	sw	s0,44(sp)
4000118c:	03010413          	addi	s0,sp,48
40001190:	fca42e23          	sw	a0,-36(s0)
	DMPRESENT_BASE->ADDRESS			= iAddress;
40001194:	f00037b7          	lui	a5,0xf0003
40001198:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
4000119c:	fdc42703          	lw	a4,-36(s0)
400011a0:	00e7a623          	sw	a4,12(a5)
	DMPRESENT_BASE->READ_N			= 0;
400011a4:	f00037b7          	lui	a5,0xf0003
400011a8:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400011ac:	0007a423          	sw	zero,8(a5)
	DMPRESENT_BASE->WRITE_N			= 1;
400011b0:	f00037b7          	lui	a5,0xf0003
400011b4:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400011b8:	00100713          	li	a4,1
400011bc:	00e7a223          	sw	a4,4(a5)
	DMPRESENT_BASE->CHIP_SELECT_N	= 0;
400011c0:	f00037b7          	lui	a5,0xf0003
400011c4:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400011c8:	0007a023          	sw	zero,0(a5)
	uint32_t res 					= DMPRESENT_BASE->ODATA;
400011cc:	f00037b7          	lui	a5,0xf0003
400011d0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400011d4:	0147a783          	lw	a5,20(a5)
400011d8:	fef42623          	sw	a5,-20(s0)
	DMPRESENT_BASE->CHIP_SELECT_N	= 1;
400011dc:	f00037b7          	lui	a5,0xf0003
400011e0:	80078793          	addi	a5,a5,-2048 # f0002800 <_stack_start+0x70001ec0>
400011e4:	00100713          	li	a4,1
400011e8:	00e7a023          	sw	a4,0(a5)
	return res;
400011ec:	fec42783          	lw	a5,-20(s0)
}
400011f0:	00078513          	mv	a0,a5
400011f4:	02c12403          	lw	s0,44(sp)
400011f8:	03010113          	addi	sp,sp,48
400011fc:	00008067          	ret

40001200 <dm_present_hash>:
void dm_present_hash(uint32_t *key, uint32_t *block, uint32_t *res) {
40001200:	fe010113          	addi	sp,sp,-32
40001204:	00112e23          	sw	ra,28(sp)
40001208:	00812c23          	sw	s0,24(sp)
4000120c:	00912a23          	sw	s1,20(sp)
40001210:	02010413          	addi	s0,sp,32
40001214:	fea42623          	sw	a0,-20(s0)
40001218:	feb42423          	sw	a1,-24(s0)
4000121c:	fec42223          	sw	a2,-28(s0)

	//PLAIN_TEXT
	dm_present_write(block[1],PRESENT_ADDR_BLOCK_BASE +1);
40001220:	fe842783          	lw	a5,-24(s0)
40001224:	00478793          	addi	a5,a5,4
40001228:	0007a783          	lw	a5,0(a5)
4000122c:	00500593          	li	a1,5
40001230:	00078513          	mv	a0,a5
40001234:	ed5ff0ef          	jal	ra,40001108 <dm_present_write>
	dm_present_write(block[0],PRESENT_ADDR_BLOCK_BASE);
40001238:	fe842783          	lw	a5,-24(s0)
4000123c:	0007a783          	lw	a5,0(a5)
40001240:	00400593          	li	a1,4
40001244:	00078513          	mv	a0,a5
40001248:	ec1ff0ef          	jal	ra,40001108 <dm_present_write>

	//KEY
	dm_present_write(key[2],PRESENT_ADDR_KEY_BASE +2);
4000124c:	fec42783          	lw	a5,-20(s0)
40001250:	00878793          	addi	a5,a5,8
40001254:	0007a783          	lw	a5,0(a5)
40001258:	00300593          	li	a1,3
4000125c:	00078513          	mv	a0,a5
40001260:	ea9ff0ef          	jal	ra,40001108 <dm_present_write>
	dm_present_write(key[1],PRESENT_ADDR_KEY_BASE +1);
40001264:	fec42783          	lw	a5,-20(s0)
40001268:	00478793          	addi	a5,a5,4
4000126c:	0007a783          	lw	a5,0(a5)
40001270:	00200593          	li	a1,2
40001274:	00078513          	mv	a0,a5
40001278:	e91ff0ef          	jal	ra,40001108 <dm_present_write>
	dm_present_write(key[0],PRESENT_ADDR_KEY_BASE);
4000127c:	fec42783          	lw	a5,-20(s0)
40001280:	0007a783          	lw	a5,0(a5)
40001284:	00100593          	li	a1,1
40001288:	00078513          	mv	a0,a5
4000128c:	e7dff0ef          	jal	ra,40001108 <dm_present_write>

	//START
	dm_present_write(0x1,PRESENT_ADDR_START);
40001290:	00000593          	li	a1,0
40001294:	00100513          	li	a0,1
40001298:	e71ff0ef          	jal	ra,40001108 <dm_present_write>
    while(dm_present_read(PRESENT_ADDR_RESULT_BASE) == 0);
4000129c:	00000013          	nop
400012a0:	00600513          	li	a0,6
400012a4:	ee1ff0ef          	jal	ra,40001184 <dm_present_read>
400012a8:	00050793          	mv	a5,a0
400012ac:	fe078ae3          	beqz	a5,400012a0 <dm_present_hash+0xa0>

    res[1] = dm_present_read(PRESENT_ADDR_RESULT_BASE +1);
400012b0:	fe442783          	lw	a5,-28(s0)
400012b4:	00478493          	addi	s1,a5,4
400012b8:	00700513          	li	a0,7
400012bc:	ec9ff0ef          	jal	ra,40001184 <dm_present_read>
400012c0:	00050793          	mv	a5,a0
400012c4:	00f4a023          	sw	a5,0(s1)
    res[0] = dm_present_read(PRESENT_ADDR_RESULT_BASE);
400012c8:	00600513          	li	a0,6
400012cc:	eb9ff0ef          	jal	ra,40001184 <dm_present_read>
400012d0:	00050713          	mv	a4,a0
400012d4:	fe442783          	lw	a5,-28(s0)
400012d8:	00e7a023          	sw	a4,0(a5)


    //print result to terminal
	print("\r\t===========================DM_PRESENT HASH==================================\r\n");
400012dc:	400027b7          	lui	a5,0x40002
400012e0:	05078513          	addi	a0,a5,80 # 40002050 <vga_simRes_h160_v120+0x20>
400012e4:	294000ef          	jal	ra,40001578 <print>
	print("\r\n");
400012e8:	400027b7          	lui	a5,0x40002
400012ec:	0a478513          	addi	a0,a5,164 # 400020a4 <vga_simRes_h160_v120+0x74>
400012f0:	288000ef          	jal	ra,40001578 <print>
	print64bit("\r\tPLAIN_TEXT (64-bit) : ", block);
400012f4:	fe842583          	lw	a1,-24(s0)
400012f8:	400027b7          	lui	a5,0x40002
400012fc:	0a878513          	addi	a0,a5,168 # 400020a8 <vga_simRes_h160_v120+0x78>
40001300:	4e0000ef          	jal	ra,400017e0 <print64bit>
	print80bit("KEY (80-bit) : ", key);
40001304:	fec42583          	lw	a1,-20(s0)
40001308:	400027b7          	lui	a5,0x40002
4000130c:	0c478513          	addi	a0,a5,196 # 400020c4 <vga_simRes_h160_v120+0x94>
40001310:	5d8000ef          	jal	ra,400018e8 <print80bit>
	print64bit("RESULT (64-bit) : ", res);
40001314:	fe442583          	lw	a1,-28(s0)
40001318:	400027b7          	lui	a5,0x40002
4000131c:	0d478513          	addi	a0,a5,212 # 400020d4 <vga_simRes_h160_v120+0xa4>
40001320:	4c0000ef          	jal	ra,400017e0 <print64bit>
	//print("\r\n============================================================================\r\n");
}
40001324:	00000013          	nop
40001328:	01c12083          	lw	ra,28(sp)
4000132c:	01812403          	lw	s0,24(sp)
40001330:	01412483          	lw	s1,20(sp)
40001334:	02010113          	addi	sp,sp,32
40001338:	00008067          	ret

4000133c <timer_init>:
4000133c:	fe010113          	addi	sp,sp,-32
40001340:	00812e23          	sw	s0,28(sp)
40001344:	02010413          	addi	s0,sp,32
40001348:	fea42623          	sw	a0,-20(s0)
4000134c:	fec42783          	lw	a5,-20(s0)
40001350:	0007a023          	sw	zero,0(a5)
40001354:	fec42783          	lw	a5,-20(s0)
40001358:	0007a423          	sw	zero,8(a5)
4000135c:	00000013          	nop
40001360:	01c12403          	lw	s0,28(sp)
40001364:	02010113          	addi	sp,sp,32
40001368:	00008067          	ret

4000136c <prescaler_init>:
4000136c:	fe010113          	addi	sp,sp,-32
40001370:	00812e23          	sw	s0,28(sp)
40001374:	02010413          	addi	s0,sp,32
40001378:	fea42623          	sw	a0,-20(s0)
4000137c:	00000013          	nop
40001380:	01c12403          	lw	s0,28(sp)
40001384:	02010113          	addi	sp,sp,32
40001388:	00008067          	ret

4000138c <interruptCtrl_init>:
4000138c:	fe010113          	addi	sp,sp,-32
40001390:	00812e23          	sw	s0,28(sp)
40001394:	02010413          	addi	s0,sp,32
40001398:	fea42623          	sw	a0,-20(s0)
4000139c:	fec42783          	lw	a5,-20(s0)
400013a0:	0007a223          	sw	zero,4(a5)
400013a4:	fec42783          	lw	a5,-20(s0)
400013a8:	fff00713          	li	a4,-1
400013ac:	00e7a023          	sw	a4,0(a5)
400013b0:	00000013          	nop
400013b4:	01c12403          	lw	s0,28(sp)
400013b8:	02010113          	addi	sp,sp,32
400013bc:	00008067          	ret

400013c0 <uart_writeAvailability>:
400013c0:	fe010113          	addi	sp,sp,-32
400013c4:	00812e23          	sw	s0,28(sp)
400013c8:	02010413          	addi	s0,sp,32
400013cc:	fea42623          	sw	a0,-20(s0)
400013d0:	fec42783          	lw	a5,-20(s0)
400013d4:	0047a783          	lw	a5,4(a5)
400013d8:	0107d793          	srli	a5,a5,0x10
400013dc:	0ff7f793          	zext.b	a5,a5
400013e0:	00078513          	mv	a0,a5
400013e4:	01c12403          	lw	s0,28(sp)
400013e8:	02010113          	addi	sp,sp,32
400013ec:	00008067          	ret

400013f0 <uart_readOccupancy>:
400013f0:	fe010113          	addi	sp,sp,-32
400013f4:	00812e23          	sw	s0,28(sp)
400013f8:	02010413          	addi	s0,sp,32
400013fc:	fea42623          	sw	a0,-20(s0)
40001400:	fec42783          	lw	a5,-20(s0)
40001404:	0047a783          	lw	a5,4(a5)
40001408:	0187d793          	srli	a5,a5,0x18
4000140c:	00078513          	mv	a0,a5
40001410:	01c12403          	lw	s0,28(sp)
40001414:	02010113          	addi	sp,sp,32
40001418:	00008067          	ret

4000141c <uart_write>:
4000141c:	fe010113          	addi	sp,sp,-32
40001420:	00112e23          	sw	ra,28(sp)
40001424:	00812c23          	sw	s0,24(sp)
40001428:	02010413          	addi	s0,sp,32
4000142c:	fea42623          	sw	a0,-20(s0)
40001430:	feb42423          	sw	a1,-24(s0)
40001434:	00000013          	nop
40001438:	fec42503          	lw	a0,-20(s0)
4000143c:	f85ff0ef          	jal	ra,400013c0 <uart_writeAvailability>
40001440:	00050793          	mv	a5,a0
40001444:	fe078ae3          	beqz	a5,40001438 <uart_write+0x1c>
40001448:	fec42783          	lw	a5,-20(s0)
4000144c:	fe842703          	lw	a4,-24(s0)
40001450:	00e7a023          	sw	a4,0(a5)
40001454:	00000013          	nop
40001458:	01c12083          	lw	ra,28(sp)
4000145c:	01812403          	lw	s0,24(sp)
40001460:	02010113          	addi	sp,sp,32
40001464:	00008067          	ret

40001468 <uart_applyConfig>:
40001468:	fe010113          	addi	sp,sp,-32
4000146c:	00812e23          	sw	s0,28(sp)
40001470:	02010413          	addi	s0,sp,32
40001474:	fea42623          	sw	a0,-20(s0)
40001478:	feb42423          	sw	a1,-24(s0)
4000147c:	fe842783          	lw	a5,-24(s0)
40001480:	00c7a703          	lw	a4,12(a5)
40001484:	fec42783          	lw	a5,-20(s0)
40001488:	00e7a423          	sw	a4,8(a5)
4000148c:	fe842783          	lw	a5,-24(s0)
40001490:	0007a783          	lw	a5,0(a5)
40001494:	fff78713          	addi	a4,a5,-1
40001498:	fe842783          	lw	a5,-24(s0)
4000149c:	0047a783          	lw	a5,4(a5)
400014a0:	00879793          	slli	a5,a5,0x8
400014a4:	00f76733          	or	a4,a4,a5
400014a8:	fe842783          	lw	a5,-24(s0)
400014ac:	0087a783          	lw	a5,8(a5)
400014b0:	01079793          	slli	a5,a5,0x10
400014b4:	00f76733          	or	a4,a4,a5
400014b8:	fec42783          	lw	a5,-20(s0)
400014bc:	00e7a623          	sw	a4,12(a5)
400014c0:	00000013          	nop
400014c4:	01c12403          	lw	s0,28(sp)
400014c8:	02010113          	addi	sp,sp,32
400014cc:	00008067          	ret

400014d0 <vga_isBusy>:
400014d0:	fe010113          	addi	sp,sp,-32
400014d4:	00812e23          	sw	s0,28(sp)
400014d8:	02010413          	addi	s0,sp,32
400014dc:	fea42623          	sw	a0,-20(s0)
400014e0:	fec42783          	lw	a5,-20(s0)
400014e4:	0007a783          	lw	a5,0(a5)
400014e8:	0027f793          	andi	a5,a5,2
400014ec:	00f037b3          	snez	a5,a5
400014f0:	0ff7f793          	zext.b	a5,a5
400014f4:	00078513          	mv	a0,a5
400014f8:	01c12403          	lw	s0,28(sp)
400014fc:	02010113          	addi	sp,sp,32
40001500:	00008067          	ret

40001504 <vga_run>:
40001504:	fe010113          	addi	sp,sp,-32
40001508:	00812e23          	sw	s0,28(sp)
4000150c:	02010413          	addi	s0,sp,32
40001510:	fea42623          	sw	a0,-20(s0)
40001514:	fec42783          	lw	a5,-20(s0)
40001518:	00100713          	li	a4,1
4000151c:	00e7a023          	sw	a4,0(a5)
40001520:	00000013          	nop
40001524:	01c12403          	lw	s0,28(sp)
40001528:	02010113          	addi	sp,sp,32
4000152c:	00008067          	ret

40001530 <vga_stop>:
40001530:	fe010113          	addi	sp,sp,-32
40001534:	00112e23          	sw	ra,28(sp)
40001538:	00812c23          	sw	s0,24(sp)
4000153c:	02010413          	addi	s0,sp,32
40001540:	fea42623          	sw	a0,-20(s0)
40001544:	fec42783          	lw	a5,-20(s0)
40001548:	0007a023          	sw	zero,0(a5)
4000154c:	00000013          	nop
40001550:	fec42503          	lw	a0,-20(s0)
40001554:	f7dff0ef          	jal	ra,400014d0 <vga_isBusy>
40001558:	00050793          	mv	a5,a0
4000155c:	fe079ae3          	bnez	a5,40001550 <vga_stop+0x20>
40001560:	00000013          	nop
40001564:	00000013          	nop
40001568:	01c12083          	lw	ra,28(sp)
4000156c:	01812403          	lw	s0,24(sp)
40001570:	02010113          	addi	sp,sp,32
40001574:	00008067          	ret

40001578 <print>:
40001578:	fe010113          	addi	sp,sp,-32
4000157c:	00112e23          	sw	ra,28(sp)
40001580:	00812c23          	sw	s0,24(sp)
40001584:	02010413          	addi	s0,sp,32
40001588:	fea42623          	sw	a0,-20(s0)
4000158c:	0200006f          	j	400015ac <print+0x34>
40001590:	fec42783          	lw	a5,-20(s0)
40001594:	00178713          	addi	a4,a5,1
40001598:	fee42623          	sw	a4,-20(s0)
4000159c:	0007c783          	lbu	a5,0(a5)
400015a0:	00078593          	mv	a1,a5
400015a4:	f0010537          	lui	a0,0xf0010
400015a8:	e75ff0ef          	jal	ra,4000141c <uart_write>
400015ac:	fec42783          	lw	a5,-20(s0)
400015b0:	0007c783          	lbu	a5,0(a5)
400015b4:	fc079ee3          	bnez	a5,40001590 <print+0x18>
400015b8:	00000013          	nop
400015bc:	00000013          	nop
400015c0:	01c12083          	lw	ra,28(sp)
400015c4:	01812403          	lw	s0,24(sp)
400015c8:	02010113          	addi	sp,sp,32
400015cc:	00008067          	ret

400015d0 <print16bit>:
400015d0:	fc010113          	addi	sp,sp,-64
400015d4:	02112e23          	sw	ra,60(sp)
400015d8:	02812c23          	sw	s0,56(sp)
400015dc:	04010413          	addi	s0,sp,64
400015e0:	fca42623          	sw	a0,-52(s0)
400015e4:	fe042623          	sw	zero,-20(s0)
400015e8:	fc042e23          	sw	zero,-36(s0)
400015ec:	fe042023          	sw	zero,-32(s0)
400015f0:	fcc42783          	lw	a5,-52(s0)
400015f4:	00f7f793          	andi	a5,a5,15
400015f8:	40002737          	lui	a4,0x40002
400015fc:	14c70713          	addi	a4,a4,332 # 4000214c <vga_simRes_h160_v120+0x24>
40001600:	00f707b3          	add	a5,a4,a5
40001604:	0007c703          	lbu	a4,0(a5)
40001608:	fec42783          	lw	a5,-20(s0)
4000160c:	ff040693          	addi	a3,s0,-16
40001610:	00f687b3          	add	a5,a3,a5
40001614:	fee78623          	sb	a4,-20(a5)
40001618:	fec42783          	lw	a5,-20(s0)
4000161c:	00178793          	addi	a5,a5,1
40001620:	fef42623          	sw	a5,-20(s0)
40001624:	fcc42783          	lw	a5,-52(s0)
40001628:	0047d793          	srli	a5,a5,0x4
4000162c:	fcf42623          	sw	a5,-52(s0)
40001630:	fcc42783          	lw	a5,-52(s0)
40001634:	fa079ee3          	bnez	a5,400015f0 <print16bit+0x20>
40001638:	fec42703          	lw	a4,-20(s0)
4000163c:	00700793          	li	a5,7
40001640:	02e7ce63          	blt	a5,a4,4000167c <print16bit+0xac>
40001644:	00700793          	li	a5,7
40001648:	fef42423          	sw	a5,-24(s0)
4000164c:	0240006f          	j	40001670 <print16bit+0xa0>
40001650:	03000713          	li	a4,48
40001654:	fe842783          	lw	a5,-24(s0)
40001658:	ff040693          	addi	a3,s0,-16
4000165c:	00f687b3          	add	a5,a3,a5
40001660:	fee78623          	sb	a4,-20(a5)
40001664:	fe842783          	lw	a5,-24(s0)
40001668:	fff78793          	addi	a5,a5,-1
4000166c:	fef42423          	sw	a5,-24(s0)
40001670:	fe842703          	lw	a4,-24(s0)
40001674:	fec42783          	lw	a5,-20(s0)
40001678:	fcf75ce3          	bge	a4,a5,40001650 <print16bit+0x80>
4000167c:	00300793          	li	a5,3
40001680:	fef42223          	sw	a5,-28(s0)
40001684:	02c0006f          	j	400016b0 <print16bit+0xe0>
40001688:	fe442783          	lw	a5,-28(s0)
4000168c:	ff040713          	addi	a4,s0,-16
40001690:	00f707b3          	add	a5,a4,a5
40001694:	fec7c783          	lbu	a5,-20(a5)
40001698:	00078593          	mv	a1,a5
4000169c:	f0010537          	lui	a0,0xf0010
400016a0:	d7dff0ef          	jal	ra,4000141c <uart_write>
400016a4:	fe442783          	lw	a5,-28(s0)
400016a8:	fff78793          	addi	a5,a5,-1
400016ac:	fef42223          	sw	a5,-28(s0)
400016b0:	fe442783          	lw	a5,-28(s0)
400016b4:	fc07dae3          	bgez	a5,40001688 <print16bit+0xb8>
400016b8:	400027b7          	lui	a5,0x40002
400016bc:	14878513          	addi	a0,a5,328 # 40002148 <vga_simRes_h160_v120+0x20>
400016c0:	eb9ff0ef          	jal	ra,40001578 <print>
400016c4:	00000013          	nop
400016c8:	03c12083          	lw	ra,60(sp)
400016cc:	03812403          	lw	s0,56(sp)
400016d0:	04010113          	addi	sp,sp,64
400016d4:	00008067          	ret

400016d8 <print32bit>:
400016d8:	fc010113          	addi	sp,sp,-64
400016dc:	02112e23          	sw	ra,60(sp)
400016e0:	02812c23          	sw	s0,56(sp)
400016e4:	04010413          	addi	s0,sp,64
400016e8:	fca42623          	sw	a0,-52(s0)
400016ec:	fe042623          	sw	zero,-20(s0)
400016f0:	fc042e23          	sw	zero,-36(s0)
400016f4:	fe042023          	sw	zero,-32(s0)
400016f8:	fcc42783          	lw	a5,-52(s0)
400016fc:	00f7f793          	andi	a5,a5,15
40001700:	40002737          	lui	a4,0x40002
40001704:	14c70713          	addi	a4,a4,332 # 4000214c <vga_simRes_h160_v120+0x24>
40001708:	00f707b3          	add	a5,a4,a5
4000170c:	0007c703          	lbu	a4,0(a5)
40001710:	fec42783          	lw	a5,-20(s0)
40001714:	ff040693          	addi	a3,s0,-16
40001718:	00f687b3          	add	a5,a3,a5
4000171c:	fee78623          	sb	a4,-20(a5)
40001720:	fec42783          	lw	a5,-20(s0)
40001724:	00178793          	addi	a5,a5,1
40001728:	fef42623          	sw	a5,-20(s0)
4000172c:	fcc42783          	lw	a5,-52(s0)
40001730:	0047d793          	srli	a5,a5,0x4
40001734:	fcf42623          	sw	a5,-52(s0)
40001738:	fcc42783          	lw	a5,-52(s0)
4000173c:	fa079ee3          	bnez	a5,400016f8 <print32bit+0x20>
40001740:	fec42703          	lw	a4,-20(s0)
40001744:	00700793          	li	a5,7
40001748:	02e7ce63          	blt	a5,a4,40001784 <print32bit+0xac>
4000174c:	00700793          	li	a5,7
40001750:	fef42423          	sw	a5,-24(s0)
40001754:	0240006f          	j	40001778 <print32bit+0xa0>
40001758:	03000713          	li	a4,48
4000175c:	fe842783          	lw	a5,-24(s0)
40001760:	ff040693          	addi	a3,s0,-16
40001764:	00f687b3          	add	a5,a3,a5
40001768:	fee78623          	sb	a4,-20(a5)
4000176c:	fe842783          	lw	a5,-24(s0)
40001770:	fff78793          	addi	a5,a5,-1
40001774:	fef42423          	sw	a5,-24(s0)
40001778:	fe842703          	lw	a4,-24(s0)
4000177c:	fec42783          	lw	a5,-20(s0)
40001780:	fcf75ce3          	bge	a4,a5,40001758 <print32bit+0x80>
40001784:	00700793          	li	a5,7
40001788:	fef42223          	sw	a5,-28(s0)
4000178c:	02c0006f          	j	400017b8 <print32bit+0xe0>
40001790:	fe442783          	lw	a5,-28(s0)
40001794:	ff040713          	addi	a4,s0,-16
40001798:	00f707b3          	add	a5,a4,a5
4000179c:	fec7c783          	lbu	a5,-20(a5)
400017a0:	00078593          	mv	a1,a5
400017a4:	f0010537          	lui	a0,0xf0010
400017a8:	c75ff0ef          	jal	ra,4000141c <uart_write>
400017ac:	fe442783          	lw	a5,-28(s0)
400017b0:	fff78793          	addi	a5,a5,-1
400017b4:	fef42223          	sw	a5,-28(s0)
400017b8:	fe442783          	lw	a5,-28(s0)
400017bc:	fc07dae3          	bgez	a5,40001790 <print32bit+0xb8>
400017c0:	400027b7          	lui	a5,0x40002
400017c4:	14878513          	addi	a0,a5,328 # 40002148 <vga_simRes_h160_v120+0x20>
400017c8:	db1ff0ef          	jal	ra,40001578 <print>
400017cc:	00000013          	nop
400017d0:	03c12083          	lw	ra,60(sp)
400017d4:	03812403          	lw	s0,56(sp)
400017d8:	04010113          	addi	sp,sp,64
400017dc:	00008067          	ret

400017e0 <print64bit>:
400017e0:	fe010113          	addi	sp,sp,-32
400017e4:	00112e23          	sw	ra,28(sp)
400017e8:	00812c23          	sw	s0,24(sp)
400017ec:	02010413          	addi	s0,sp,32
400017f0:	fea42623          	sw	a0,-20(s0)
400017f4:	feb42423          	sw	a1,-24(s0)
400017f8:	400027b7          	lui	a5,0x40002
400017fc:	16078513          	addi	a0,a5,352 # 40002160 <vga_simRes_h160_v120+0x38>
40001800:	d79ff0ef          	jal	ra,40001578 <print>
40001804:	fec42503          	lw	a0,-20(s0)
40001808:	d71ff0ef          	jal	ra,40001578 <print>
4000180c:	fe842783          	lw	a5,-24(s0)
40001810:	00478793          	addi	a5,a5,4
40001814:	0007a783          	lw	a5,0(a5)
40001818:	00078513          	mv	a0,a5
4000181c:	ebdff0ef          	jal	ra,400016d8 <print32bit>
40001820:	fe842783          	lw	a5,-24(s0)
40001824:	0007a783          	lw	a5,0(a5)
40001828:	00078513          	mv	a0,a5
4000182c:	eadff0ef          	jal	ra,400016d8 <print32bit>
40001830:	400027b7          	lui	a5,0x40002
40001834:	16478513          	addi	a0,a5,356 # 40002164 <vga_simRes_h160_v120+0x3c>
40001838:	d41ff0ef          	jal	ra,40001578 <print>
4000183c:	00000013          	nop
40001840:	01c12083          	lw	ra,28(sp)
40001844:	01812403          	lw	s0,24(sp)
40001848:	02010113          	addi	sp,sp,32
4000184c:	00008067          	ret

40001850 <print128bit>:
40001850:	fe010113          	addi	sp,sp,-32
40001854:	00112e23          	sw	ra,28(sp)
40001858:	00812c23          	sw	s0,24(sp)
4000185c:	02010413          	addi	s0,sp,32
40001860:	fea42623          	sw	a0,-20(s0)
40001864:	feb42423          	sw	a1,-24(s0)
40001868:	400027b7          	lui	a5,0x40002
4000186c:	16078513          	addi	a0,a5,352 # 40002160 <vga_simRes_h160_v120+0x38>
40001870:	d09ff0ef          	jal	ra,40001578 <print>
40001874:	fec42503          	lw	a0,-20(s0)
40001878:	d01ff0ef          	jal	ra,40001578 <print>
4000187c:	fe842783          	lw	a5,-24(s0)
40001880:	00c78793          	addi	a5,a5,12
40001884:	0007a783          	lw	a5,0(a5)
40001888:	00078513          	mv	a0,a5
4000188c:	e4dff0ef          	jal	ra,400016d8 <print32bit>
40001890:	fe842783          	lw	a5,-24(s0)
40001894:	00878793          	addi	a5,a5,8
40001898:	0007a783          	lw	a5,0(a5)
4000189c:	00078513          	mv	a0,a5
400018a0:	e39ff0ef          	jal	ra,400016d8 <print32bit>
400018a4:	fe842783          	lw	a5,-24(s0)
400018a8:	00478793          	addi	a5,a5,4
400018ac:	0007a783          	lw	a5,0(a5)
400018b0:	00078513          	mv	a0,a5
400018b4:	e25ff0ef          	jal	ra,400016d8 <print32bit>
400018b8:	fe842783          	lw	a5,-24(s0)
400018bc:	0007a783          	lw	a5,0(a5)
400018c0:	00078513          	mv	a0,a5
400018c4:	e15ff0ef          	jal	ra,400016d8 <print32bit>
400018c8:	400027b7          	lui	a5,0x40002
400018cc:	16478513          	addi	a0,a5,356 # 40002164 <vga_simRes_h160_v120+0x3c>
400018d0:	ca9ff0ef          	jal	ra,40001578 <print>
400018d4:	00000013          	nop
400018d8:	01c12083          	lw	ra,28(sp)
400018dc:	01812403          	lw	s0,24(sp)
400018e0:	02010113          	addi	sp,sp,32
400018e4:	00008067          	ret

400018e8 <print80bit>:
400018e8:	fe010113          	addi	sp,sp,-32
400018ec:	00112e23          	sw	ra,28(sp)
400018f0:	00812c23          	sw	s0,24(sp)
400018f4:	02010413          	addi	s0,sp,32
400018f8:	fea42623          	sw	a0,-20(s0)
400018fc:	feb42423          	sw	a1,-24(s0)
40001900:	400027b7          	lui	a5,0x40002
40001904:	16078513          	addi	a0,a5,352 # 40002160 <vga_simRes_h160_v120+0x38>
40001908:	c71ff0ef          	jal	ra,40001578 <print>
4000190c:	fec42503          	lw	a0,-20(s0)
40001910:	c69ff0ef          	jal	ra,40001578 <print>
40001914:	fe842783          	lw	a5,-24(s0)
40001918:	00878793          	addi	a5,a5,8
4000191c:	0007a783          	lw	a5,0(a5)
40001920:	00078513          	mv	a0,a5
40001924:	db5ff0ef          	jal	ra,400016d8 <print32bit>
40001928:	fe842783          	lw	a5,-24(s0)
4000192c:	00478793          	addi	a5,a5,4
40001930:	0007a783          	lw	a5,0(a5)
40001934:	00078513          	mv	a0,a5
40001938:	da1ff0ef          	jal	ra,400016d8 <print32bit>
4000193c:	fe842783          	lw	a5,-24(s0)
40001940:	0007a783          	lw	a5,0(a5)
40001944:	00078513          	mv	a0,a5
40001948:	c89ff0ef          	jal	ra,400015d0 <print16bit>
4000194c:	400027b7          	lui	a5,0x40002
40001950:	16478513          	addi	a0,a5,356 # 40002164 <vga_simRes_h160_v120+0x3c>
40001954:	c25ff0ef          	jal	ra,40001578 <print>
40001958:	00000013          	nop
4000195c:	01c12083          	lw	ra,28(sp)
40001960:	01812403          	lw	s0,24(sp)
40001964:	02010113          	addi	sp,sp,32
40001968:	00008067          	ret

4000196c <print256bit>:
4000196c:	fe010113          	addi	sp,sp,-32
40001970:	00112e23          	sw	ra,28(sp)
40001974:	00812c23          	sw	s0,24(sp)
40001978:	02010413          	addi	s0,sp,32
4000197c:	fea42623          	sw	a0,-20(s0)
40001980:	feb42423          	sw	a1,-24(s0)
40001984:	400027b7          	lui	a5,0x40002
40001988:	16078513          	addi	a0,a5,352 # 40002160 <vga_simRes_h160_v120+0x38>
4000198c:	bedff0ef          	jal	ra,40001578 <print>
40001990:	fec42503          	lw	a0,-20(s0)
40001994:	be5ff0ef          	jal	ra,40001578 <print>
40001998:	fe842783          	lw	a5,-24(s0)
4000199c:	01c78793          	addi	a5,a5,28
400019a0:	0007a783          	lw	a5,0(a5)
400019a4:	00078513          	mv	a0,a5
400019a8:	d31ff0ef          	jal	ra,400016d8 <print32bit>
400019ac:	fe842783          	lw	a5,-24(s0)
400019b0:	01878793          	addi	a5,a5,24
400019b4:	0007a783          	lw	a5,0(a5)
400019b8:	00078513          	mv	a0,a5
400019bc:	d1dff0ef          	jal	ra,400016d8 <print32bit>
400019c0:	fe842783          	lw	a5,-24(s0)
400019c4:	01478793          	addi	a5,a5,20
400019c8:	0007a783          	lw	a5,0(a5)
400019cc:	00078513          	mv	a0,a5
400019d0:	d09ff0ef          	jal	ra,400016d8 <print32bit>
400019d4:	fe842783          	lw	a5,-24(s0)
400019d8:	01078793          	addi	a5,a5,16
400019dc:	0007a783          	lw	a5,0(a5)
400019e0:	00078513          	mv	a0,a5
400019e4:	cf5ff0ef          	jal	ra,400016d8 <print32bit>
400019e8:	fe842783          	lw	a5,-24(s0)
400019ec:	00c78793          	addi	a5,a5,12
400019f0:	0007a783          	lw	a5,0(a5)
400019f4:	00078513          	mv	a0,a5
400019f8:	ce1ff0ef          	jal	ra,400016d8 <print32bit>
400019fc:	fe842783          	lw	a5,-24(s0)
40001a00:	00878793          	addi	a5,a5,8
40001a04:	0007a783          	lw	a5,0(a5)
40001a08:	00078513          	mv	a0,a5
40001a0c:	ccdff0ef          	jal	ra,400016d8 <print32bit>
40001a10:	fe842783          	lw	a5,-24(s0)
40001a14:	00478793          	addi	a5,a5,4
40001a18:	0007a783          	lw	a5,0(a5)
40001a1c:	00078513          	mv	a0,a5
40001a20:	cb9ff0ef          	jal	ra,400016d8 <print32bit>
40001a24:	fe842783          	lw	a5,-24(s0)
40001a28:	0007a783          	lw	a5,0(a5)
40001a2c:	00078513          	mv	a0,a5
40001a30:	ca9ff0ef          	jal	ra,400016d8 <print32bit>
40001a34:	400027b7          	lui	a5,0x40002
40001a38:	16478513          	addi	a0,a5,356 # 40002164 <vga_simRes_h160_v120+0x3c>
40001a3c:	b3dff0ef          	jal	ra,40001578 <print>
40001a40:	00000013          	nop
40001a44:	01c12083          	lw	ra,28(sp)
40001a48:	01812403          	lw	s0,24(sp)
40001a4c:	02010113          	addi	sp,sp,32
40001a50:	00008067          	ret
