
kernel/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00009117          	auipc	sp,0x9
    80000004:	9e813103          	ld	sp,-1560(sp) # 800089e8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	6505                	lui	a0,0x1
    8000000a:	f14025f3          	csrr	a1,mhartid
    8000000e:	0585                	addi	a1,a1,1
    80000010:	02b50533          	mul	a0,a0,a1
    80000014:	912a                	add	sp,sp,a0
    80000016:	078000ef          	jal	ra,8000008e <start>

000000008000001a <spin>:
    8000001a:	a001                	j	8000001a <spin>

000000008000001c <timerinit>:
    8000001c:	1141                	addi	sp,sp,-16
    8000001e:	e422                	sd	s0,8(sp)
    80000020:	0800                	addi	s0,sp,16
    80000022:	f14027f3          	csrr	a5,mhartid
    80000026:	0007869b          	sext.w	a3,a5
    8000002a:	0037979b          	slliw	a5,a5,0x3
    8000002e:	02004737          	lui	a4,0x2004
    80000032:	97ba                	add	a5,a5,a4
    80000034:	0200c737          	lui	a4,0x200c
    80000038:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000003c:	000f4637          	lui	a2,0xf4
    80000040:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80000044:	95b2                	add	a1,a1,a2
    80000046:	e38c                	sd	a1,0(a5)
    80000048:	00269713          	slli	a4,a3,0x2
    8000004c:	9736                	add	a4,a4,a3
    8000004e:	00371693          	slli	a3,a4,0x3
    80000052:	00009717          	auipc	a4,0x9
    80000056:	fee70713          	addi	a4,a4,-18 # 80009040 <timer_scratch>
    8000005a:	9736                	add	a4,a4,a3
    8000005c:	ef1c                	sd	a5,24(a4)
    8000005e:	f310                	sd	a2,32(a4)
    80000060:	34071073          	csrw	mscratch,a4
    80000064:	00006797          	auipc	a5,0x6
    80000068:	d1c78793          	addi	a5,a5,-740 # 80005d80 <timervec>
    8000006c:	30579073          	csrw	mtvec,a5
    80000070:	300027f3          	csrr	a5,mstatus
    80000074:	0087e793          	ori	a5,a5,8
    80000078:	30079073          	csrw	mstatus,a5
    8000007c:	304027f3          	csrr	a5,mie
    80000080:	0807e793          	ori	a5,a5,128
    80000084:	30479073          	csrw	mie,a5
    80000088:	6422                	ld	s0,8(sp)
    8000008a:	0141                	addi	sp,sp,16
    8000008c:	8082                	ret

000000008000008e <start>:
    8000008e:	1141                	addi	sp,sp,-16
    80000090:	e406                	sd	ra,8(sp)
    80000092:	e022                	sd	s0,0(sp)
    80000094:	0800                	addi	s0,sp,16
    80000096:	300027f3          	csrr	a5,mstatus
    8000009a:	7779                	lui	a4,0xffffe
    8000009c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7ffd87ff>
    800000a0:	8ff9                	and	a5,a5,a4
    800000a2:	6705                	lui	a4,0x1
    800000a4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800000a8:	8fd9                	or	a5,a5,a4
    800000aa:	30079073          	csrw	mstatus,a5
    800000ae:	00001797          	auipc	a5,0x1
    800000b2:	de078793          	addi	a5,a5,-544 # 80000e8e <main>
    800000b6:	34179073          	csrw	mepc,a5
    800000ba:	4781                	li	a5,0
    800000bc:	18079073          	csrw	satp,a5
    800000c0:	67c1                	lui	a5,0x10
    800000c2:	17fd                	addi	a5,a5,-1
    800000c4:	30279073          	csrw	medeleg,a5
    800000c8:	30379073          	csrw	mideleg,a5
    800000cc:	104027f3          	csrr	a5,sie
    800000d0:	2227e793          	ori	a5,a5,546
    800000d4:	10479073          	csrw	sie,a5
    800000d8:	57fd                	li	a5,-1
    800000da:	83a9                	srli	a5,a5,0xa
    800000dc:	3b079073          	csrw	pmpaddr0,a5
    800000e0:	47bd                	li	a5,15
    800000e2:	3a079073          	csrw	pmpcfg0,a5
    800000e6:	00000097          	auipc	ra,0x0
    800000ea:	f36080e7          	jalr	-202(ra) # 8000001c <timerinit>
    800000ee:	f14027f3          	csrr	a5,mhartid
    800000f2:	2781                	sext.w	a5,a5
    800000f4:	823e                	mv	tp,a5
    800000f6:	30200073          	mret
    800000fa:	60a2                	ld	ra,8(sp)
    800000fc:	6402                	ld	s0,0(sp)
    800000fe:	0141                	addi	sp,sp,16
    80000100:	8082                	ret

0000000080000102 <consolewrite>:
    80000102:	715d                	addi	sp,sp,-80
    80000104:	e486                	sd	ra,72(sp)
    80000106:	e0a2                	sd	s0,64(sp)
    80000108:	fc26                	sd	s1,56(sp)
    8000010a:	f84a                	sd	s2,48(sp)
    8000010c:	f44e                	sd	s3,40(sp)
    8000010e:	f052                	sd	s4,32(sp)
    80000110:	ec56                	sd	s5,24(sp)
    80000112:	0880                	addi	s0,sp,80
    80000114:	04c05663          	blez	a2,80000160 <consolewrite+0x5e>
    80000118:	8a2a                	mv	s4,a0
    8000011a:	84ae                	mv	s1,a1
    8000011c:	89b2                	mv	s3,a2
    8000011e:	4901                	li	s2,0
    80000120:	5afd                	li	s5,-1
    80000122:	4685                	li	a3,1
    80000124:	8626                	mv	a2,s1
    80000126:	85d2                	mv	a1,s4
    80000128:	fbf40513          	addi	a0,s0,-65
    8000012c:	00002097          	auipc	ra,0x2
    80000130:	4ea080e7          	jalr	1258(ra) # 80002616 <either_copyin>
    80000134:	01550c63          	beq	a0,s5,8000014c <consolewrite+0x4a>
    80000138:	fbf44503          	lbu	a0,-65(s0)
    8000013c:	00000097          	auipc	ra,0x0
    80000140:	78e080e7          	jalr	1934(ra) # 800008ca <uartputc>
    80000144:	2905                	addiw	s2,s2,1
    80000146:	0485                	addi	s1,s1,1
    80000148:	fd299de3          	bne	s3,s2,80000122 <consolewrite+0x20>
    8000014c:	854a                	mv	a0,s2
    8000014e:	60a6                	ld	ra,72(sp)
    80000150:	6406                	ld	s0,64(sp)
    80000152:	74e2                	ld	s1,56(sp)
    80000154:	7942                	ld	s2,48(sp)
    80000156:	79a2                	ld	s3,40(sp)
    80000158:	7a02                	ld	s4,32(sp)
    8000015a:	6ae2                	ld	s5,24(sp)
    8000015c:	6161                	addi	sp,sp,80
    8000015e:	8082                	ret
    80000160:	4901                	li	s2,0
    80000162:	b7ed                	j	8000014c <consolewrite+0x4a>

0000000080000164 <consoleread>:
    80000164:	7119                	addi	sp,sp,-128
    80000166:	fc86                	sd	ra,120(sp)
    80000168:	f8a2                	sd	s0,112(sp)
    8000016a:	f4a6                	sd	s1,104(sp)
    8000016c:	f0ca                	sd	s2,96(sp)
    8000016e:	ecce                	sd	s3,88(sp)
    80000170:	e8d2                	sd	s4,80(sp)
    80000172:	e4d6                	sd	s5,72(sp)
    80000174:	e0da                	sd	s6,64(sp)
    80000176:	fc5e                	sd	s7,56(sp)
    80000178:	f862                	sd	s8,48(sp)
    8000017a:	f466                	sd	s9,40(sp)
    8000017c:	f06a                	sd	s10,32(sp)
    8000017e:	ec6e                	sd	s11,24(sp)
    80000180:	0100                	addi	s0,sp,128
    80000182:	8b2a                	mv	s6,a0
    80000184:	8aae                	mv	s5,a1
    80000186:	8a32                	mv	s4,a2
    80000188:	00060b9b          	sext.w	s7,a2
    8000018c:	00011517          	auipc	a0,0x11
    80000190:	ff450513          	addi	a0,a0,-12 # 80011180 <cons>
    80000194:	00001097          	auipc	ra,0x1
    80000198:	a50080e7          	jalr	-1456(ra) # 80000be4 <acquire>
    8000019c:	00011497          	auipc	s1,0x11
    800001a0:	fe448493          	addi	s1,s1,-28 # 80011180 <cons>
    800001a4:	89a6                	mv	s3,s1
    800001a6:	00011917          	auipc	s2,0x11
    800001aa:	07290913          	addi	s2,s2,114 # 80011218 <cons+0x98>
    800001ae:	4c91                	li	s9,4
    800001b0:	5d7d                	li	s10,-1
    800001b2:	4da9                	li	s11,10
    800001b4:	07405863          	blez	s4,80000224 <consoleread+0xc0>
    800001b8:	0984a783          	lw	a5,152(s1)
    800001bc:	09c4a703          	lw	a4,156(s1)
    800001c0:	02f71463          	bne	a4,a5,800001e8 <consoleread+0x84>
    800001c4:	00001097          	auipc	ra,0x1
    800001c8:	7ec080e7          	jalr	2028(ra) # 800019b0 <myproc>
    800001cc:	551c                	lw	a5,40(a0)
    800001ce:	e7b5                	bnez	a5,8000023a <consoleread+0xd6>
    800001d0:	85ce                	mv	a1,s3
    800001d2:	854a                	mv	a0,s2
    800001d4:	00002097          	auipc	ra,0x2
    800001d8:	03c080e7          	jalr	60(ra) # 80002210 <sleep>
    800001dc:	0984a783          	lw	a5,152(s1)
    800001e0:	09c4a703          	lw	a4,156(s1)
    800001e4:	fef700e3          	beq	a4,a5,800001c4 <consoleread+0x60>
    800001e8:	0017871b          	addiw	a4,a5,1
    800001ec:	08e4ac23          	sw	a4,152(s1)
    800001f0:	07f7f713          	andi	a4,a5,127
    800001f4:	9726                	add	a4,a4,s1
    800001f6:	01874703          	lbu	a4,24(a4)
    800001fa:	00070c1b          	sext.w	s8,a4
    800001fe:	079c0663          	beq	s8,s9,8000026a <consoleread+0x106>
    80000202:	f8e407a3          	sb	a4,-113(s0)
    80000206:	4685                	li	a3,1
    80000208:	f8f40613          	addi	a2,s0,-113
    8000020c:	85d6                	mv	a1,s5
    8000020e:	855a                	mv	a0,s6
    80000210:	00002097          	auipc	ra,0x2
    80000214:	3b0080e7          	jalr	944(ra) # 800025c0 <either_copyout>
    80000218:	01a50663          	beq	a0,s10,80000224 <consoleread+0xc0>
    8000021c:	0a85                	addi	s5,s5,1
    8000021e:	3a7d                	addiw	s4,s4,-1
    80000220:	f9bc1ae3          	bne	s8,s11,800001b4 <consoleread+0x50>
    80000224:	00011517          	auipc	a0,0x11
    80000228:	f5c50513          	addi	a0,a0,-164 # 80011180 <cons>
    8000022c:	00001097          	auipc	ra,0x1
    80000230:	a6c080e7          	jalr	-1428(ra) # 80000c98 <release>
    80000234:	414b853b          	subw	a0,s7,s4
    80000238:	a811                	j	8000024c <consoleread+0xe8>
    8000023a:	00011517          	auipc	a0,0x11
    8000023e:	f4650513          	addi	a0,a0,-186 # 80011180 <cons>
    80000242:	00001097          	auipc	ra,0x1
    80000246:	a56080e7          	jalr	-1450(ra) # 80000c98 <release>
    8000024a:	557d                	li	a0,-1
    8000024c:	70e6                	ld	ra,120(sp)
    8000024e:	7446                	ld	s0,112(sp)
    80000250:	74a6                	ld	s1,104(sp)
    80000252:	7906                	ld	s2,96(sp)
    80000254:	69e6                	ld	s3,88(sp)
    80000256:	6a46                	ld	s4,80(sp)
    80000258:	6aa6                	ld	s5,72(sp)
    8000025a:	6b06                	ld	s6,64(sp)
    8000025c:	7be2                	ld	s7,56(sp)
    8000025e:	7c42                	ld	s8,48(sp)
    80000260:	7ca2                	ld	s9,40(sp)
    80000262:	7d02                	ld	s10,32(sp)
    80000264:	6de2                	ld	s11,24(sp)
    80000266:	6109                	addi	sp,sp,128
    80000268:	8082                	ret
    8000026a:	000a071b          	sext.w	a4,s4
    8000026e:	fb777be3          	bgeu	a4,s7,80000224 <consoleread+0xc0>
    80000272:	00011717          	auipc	a4,0x11
    80000276:	faf72323          	sw	a5,-90(a4) # 80011218 <cons+0x98>
    8000027a:	b76d                	j	80000224 <consoleread+0xc0>

000000008000027c <consputc>:
    8000027c:	1141                	addi	sp,sp,-16
    8000027e:	e406                	sd	ra,8(sp)
    80000280:	e022                	sd	s0,0(sp)
    80000282:	0800                	addi	s0,sp,16
    80000284:	10000793          	li	a5,256
    80000288:	00f50a63          	beq	a0,a5,8000029c <consputc+0x20>
    8000028c:	00000097          	auipc	ra,0x0
    80000290:	564080e7          	jalr	1380(ra) # 800007f0 <uartputc_sync>
    80000294:	60a2                	ld	ra,8(sp)
    80000296:	6402                	ld	s0,0(sp)
    80000298:	0141                	addi	sp,sp,16
    8000029a:	8082                	ret
    8000029c:	4521                	li	a0,8
    8000029e:	00000097          	auipc	ra,0x0
    800002a2:	552080e7          	jalr	1362(ra) # 800007f0 <uartputc_sync>
    800002a6:	02000513          	li	a0,32
    800002aa:	00000097          	auipc	ra,0x0
    800002ae:	546080e7          	jalr	1350(ra) # 800007f0 <uartputc_sync>
    800002b2:	4521                	li	a0,8
    800002b4:	00000097          	auipc	ra,0x0
    800002b8:	53c080e7          	jalr	1340(ra) # 800007f0 <uartputc_sync>
    800002bc:	bfe1                	j	80000294 <consputc+0x18>

00000000800002be <consoleintr>:
    800002be:	1101                	addi	sp,sp,-32
    800002c0:	ec06                	sd	ra,24(sp)
    800002c2:	e822                	sd	s0,16(sp)
    800002c4:	e426                	sd	s1,8(sp)
    800002c6:	e04a                	sd	s2,0(sp)
    800002c8:	1000                	addi	s0,sp,32
    800002ca:	84aa                	mv	s1,a0
    800002cc:	00011517          	auipc	a0,0x11
    800002d0:	eb450513          	addi	a0,a0,-332 # 80011180 <cons>
    800002d4:	00001097          	auipc	ra,0x1
    800002d8:	910080e7          	jalr	-1776(ra) # 80000be4 <acquire>
    800002dc:	47d5                	li	a5,21
    800002de:	0af48663          	beq	s1,a5,8000038a <consoleintr+0xcc>
    800002e2:	0297ca63          	blt	a5,s1,80000316 <consoleintr+0x58>
    800002e6:	47a1                	li	a5,8
    800002e8:	0ef48763          	beq	s1,a5,800003d6 <consoleintr+0x118>
    800002ec:	47c1                	li	a5,16
    800002ee:	10f49a63          	bne	s1,a5,80000402 <consoleintr+0x144>
    800002f2:	00002097          	auipc	ra,0x2
    800002f6:	37a080e7          	jalr	890(ra) # 8000266c <procdump>
    800002fa:	00011517          	auipc	a0,0x11
    800002fe:	e8650513          	addi	a0,a0,-378 # 80011180 <cons>
    80000302:	00001097          	auipc	ra,0x1
    80000306:	996080e7          	jalr	-1642(ra) # 80000c98 <release>
    8000030a:	60e2                	ld	ra,24(sp)
    8000030c:	6442                	ld	s0,16(sp)
    8000030e:	64a2                	ld	s1,8(sp)
    80000310:	6902                	ld	s2,0(sp)
    80000312:	6105                	addi	sp,sp,32
    80000314:	8082                	ret
    80000316:	07f00793          	li	a5,127
    8000031a:	0af48e63          	beq	s1,a5,800003d6 <consoleintr+0x118>
    8000031e:	00011717          	auipc	a4,0x11
    80000322:	e6270713          	addi	a4,a4,-414 # 80011180 <cons>
    80000326:	0a072783          	lw	a5,160(a4)
    8000032a:	09872703          	lw	a4,152(a4)
    8000032e:	9f99                	subw	a5,a5,a4
    80000330:	07f00713          	li	a4,127
    80000334:	fcf763e3          	bltu	a4,a5,800002fa <consoleintr+0x3c>
    80000338:	47b5                	li	a5,13
    8000033a:	0cf48763          	beq	s1,a5,80000408 <consoleintr+0x14a>
    8000033e:	8526                	mv	a0,s1
    80000340:	00000097          	auipc	ra,0x0
    80000344:	f3c080e7          	jalr	-196(ra) # 8000027c <consputc>
    80000348:	00011797          	auipc	a5,0x11
    8000034c:	e3878793          	addi	a5,a5,-456 # 80011180 <cons>
    80000350:	0a07a703          	lw	a4,160(a5)
    80000354:	0017069b          	addiw	a3,a4,1
    80000358:	0006861b          	sext.w	a2,a3
    8000035c:	0ad7a023          	sw	a3,160(a5)
    80000360:	07f77713          	andi	a4,a4,127
    80000364:	97ba                	add	a5,a5,a4
    80000366:	00978c23          	sb	s1,24(a5)
    8000036a:	47a9                	li	a5,10
    8000036c:	0cf48563          	beq	s1,a5,80000436 <consoleintr+0x178>
    80000370:	4791                	li	a5,4
    80000372:	0cf48263          	beq	s1,a5,80000436 <consoleintr+0x178>
    80000376:	00011797          	auipc	a5,0x11
    8000037a:	ea27a783          	lw	a5,-350(a5) # 80011218 <cons+0x98>
    8000037e:	0807879b          	addiw	a5,a5,128
    80000382:	f6f61ce3          	bne	a2,a5,800002fa <consoleintr+0x3c>
    80000386:	863e                	mv	a2,a5
    80000388:	a07d                	j	80000436 <consoleintr+0x178>
    8000038a:	00011717          	auipc	a4,0x11
    8000038e:	df670713          	addi	a4,a4,-522 # 80011180 <cons>
    80000392:	0a072783          	lw	a5,160(a4)
    80000396:	09c72703          	lw	a4,156(a4)
    8000039a:	00011497          	auipc	s1,0x11
    8000039e:	de648493          	addi	s1,s1,-538 # 80011180 <cons>
    800003a2:	4929                	li	s2,10
    800003a4:	f4f70be3          	beq	a4,a5,800002fa <consoleintr+0x3c>
    800003a8:	37fd                	addiw	a5,a5,-1
    800003aa:	07f7f713          	andi	a4,a5,127
    800003ae:	9726                	add	a4,a4,s1
    800003b0:	01874703          	lbu	a4,24(a4)
    800003b4:	f52703e3          	beq	a4,s2,800002fa <consoleintr+0x3c>
    800003b8:	0af4a023          	sw	a5,160(s1)
    800003bc:	10000513          	li	a0,256
    800003c0:	00000097          	auipc	ra,0x0
    800003c4:	ebc080e7          	jalr	-324(ra) # 8000027c <consputc>
    800003c8:	0a04a783          	lw	a5,160(s1)
    800003cc:	09c4a703          	lw	a4,156(s1)
    800003d0:	fcf71ce3          	bne	a4,a5,800003a8 <consoleintr+0xea>
    800003d4:	b71d                	j	800002fa <consoleintr+0x3c>
    800003d6:	00011717          	auipc	a4,0x11
    800003da:	daa70713          	addi	a4,a4,-598 # 80011180 <cons>
    800003de:	0a072783          	lw	a5,160(a4)
    800003e2:	09c72703          	lw	a4,156(a4)
    800003e6:	f0f70ae3          	beq	a4,a5,800002fa <consoleintr+0x3c>
    800003ea:	37fd                	addiw	a5,a5,-1
    800003ec:	00011717          	auipc	a4,0x11
    800003f0:	e2f72a23          	sw	a5,-460(a4) # 80011220 <cons+0xa0>
    800003f4:	10000513          	li	a0,256
    800003f8:	00000097          	auipc	ra,0x0
    800003fc:	e84080e7          	jalr	-380(ra) # 8000027c <consputc>
    80000400:	bded                	j	800002fa <consoleintr+0x3c>
    80000402:	ee048ce3          	beqz	s1,800002fa <consoleintr+0x3c>
    80000406:	bf21                	j	8000031e <consoleintr+0x60>
    80000408:	4529                	li	a0,10
    8000040a:	00000097          	auipc	ra,0x0
    8000040e:	e72080e7          	jalr	-398(ra) # 8000027c <consputc>
    80000412:	00011797          	auipc	a5,0x11
    80000416:	d6e78793          	addi	a5,a5,-658 # 80011180 <cons>
    8000041a:	0a07a703          	lw	a4,160(a5)
    8000041e:	0017069b          	addiw	a3,a4,1
    80000422:	0006861b          	sext.w	a2,a3
    80000426:	0ad7a023          	sw	a3,160(a5)
    8000042a:	07f77713          	andi	a4,a4,127
    8000042e:	97ba                	add	a5,a5,a4
    80000430:	4729                	li	a4,10
    80000432:	00e78c23          	sb	a4,24(a5)
    80000436:	00011797          	auipc	a5,0x11
    8000043a:	dec7a323          	sw	a2,-538(a5) # 8001121c <cons+0x9c>
    8000043e:	00011517          	auipc	a0,0x11
    80000442:	dda50513          	addi	a0,a0,-550 # 80011218 <cons+0x98>
    80000446:	00002097          	auipc	ra,0x2
    8000044a:	f56080e7          	jalr	-170(ra) # 8000239c <wakeup>
    8000044e:	b575                	j	800002fa <consoleintr+0x3c>

0000000080000450 <consoleinit>:
    80000450:	1141                	addi	sp,sp,-16
    80000452:	e406                	sd	ra,8(sp)
    80000454:	e022                	sd	s0,0(sp)
    80000456:	0800                	addi	s0,sp,16
    80000458:	00008597          	auipc	a1,0x8
    8000045c:	bb858593          	addi	a1,a1,-1096 # 80008010 <etext+0x10>
    80000460:	00011517          	auipc	a0,0x11
    80000464:	d2050513          	addi	a0,a0,-736 # 80011180 <cons>
    80000468:	00000097          	auipc	ra,0x0
    8000046c:	6ec080e7          	jalr	1772(ra) # 80000b54 <initlock>
    80000470:	00000097          	auipc	ra,0x0
    80000474:	330080e7          	jalr	816(ra) # 800007a0 <uartinit>
    80000478:	00021797          	auipc	a5,0x21
    8000047c:	6a078793          	addi	a5,a5,1696 # 80021b18 <devsw>
    80000480:	00000717          	auipc	a4,0x0
    80000484:	ce470713          	addi	a4,a4,-796 # 80000164 <consoleread>
    80000488:	eb98                	sd	a4,16(a5)
    8000048a:	00000717          	auipc	a4,0x0
    8000048e:	c7870713          	addi	a4,a4,-904 # 80000102 <consolewrite>
    80000492:	ef98                	sd	a4,24(a5)
    80000494:	60a2                	ld	ra,8(sp)
    80000496:	6402                	ld	s0,0(sp)
    80000498:	0141                	addi	sp,sp,16
    8000049a:	8082                	ret

000000008000049c <printint>:
    8000049c:	7179                	addi	sp,sp,-48
    8000049e:	f406                	sd	ra,40(sp)
    800004a0:	f022                	sd	s0,32(sp)
    800004a2:	ec26                	sd	s1,24(sp)
    800004a4:	e84a                	sd	s2,16(sp)
    800004a6:	1800                	addi	s0,sp,48
    800004a8:	c219                	beqz	a2,800004ae <printint+0x12>
    800004aa:	08054663          	bltz	a0,80000536 <printint+0x9a>
    800004ae:	2501                	sext.w	a0,a0
    800004b0:	4881                	li	a7,0
    800004b2:	fd040693          	addi	a3,s0,-48
    800004b6:	4701                	li	a4,0
    800004b8:	2581                	sext.w	a1,a1
    800004ba:	00008617          	auipc	a2,0x8
    800004be:	b8660613          	addi	a2,a2,-1146 # 80008040 <digits>
    800004c2:	883a                	mv	a6,a4
    800004c4:	2705                	addiw	a4,a4,1
    800004c6:	02b577bb          	remuw	a5,a0,a1
    800004ca:	1782                	slli	a5,a5,0x20
    800004cc:	9381                	srli	a5,a5,0x20
    800004ce:	97b2                	add	a5,a5,a2
    800004d0:	0007c783          	lbu	a5,0(a5)
    800004d4:	00f68023          	sb	a5,0(a3)
    800004d8:	0005079b          	sext.w	a5,a0
    800004dc:	02b5553b          	divuw	a0,a0,a1
    800004e0:	0685                	addi	a3,a3,1
    800004e2:	feb7f0e3          	bgeu	a5,a1,800004c2 <printint+0x26>
    800004e6:	00088b63          	beqz	a7,800004fc <printint+0x60>
    800004ea:	fe040793          	addi	a5,s0,-32
    800004ee:	973e                	add	a4,a4,a5
    800004f0:	02d00793          	li	a5,45
    800004f4:	fef70823          	sb	a5,-16(a4)
    800004f8:	0028071b          	addiw	a4,a6,2
    800004fc:	02e05763          	blez	a4,8000052a <printint+0x8e>
    80000500:	fd040793          	addi	a5,s0,-48
    80000504:	00e784b3          	add	s1,a5,a4
    80000508:	fff78913          	addi	s2,a5,-1
    8000050c:	993a                	add	s2,s2,a4
    8000050e:	377d                	addiw	a4,a4,-1
    80000510:	1702                	slli	a4,a4,0x20
    80000512:	9301                	srli	a4,a4,0x20
    80000514:	40e90933          	sub	s2,s2,a4
    80000518:	fff4c503          	lbu	a0,-1(s1)
    8000051c:	00000097          	auipc	ra,0x0
    80000520:	d60080e7          	jalr	-672(ra) # 8000027c <consputc>
    80000524:	14fd                	addi	s1,s1,-1
    80000526:	ff2499e3          	bne	s1,s2,80000518 <printint+0x7c>
    8000052a:	70a2                	ld	ra,40(sp)
    8000052c:	7402                	ld	s0,32(sp)
    8000052e:	64e2                	ld	s1,24(sp)
    80000530:	6942                	ld	s2,16(sp)
    80000532:	6145                	addi	sp,sp,48
    80000534:	8082                	ret
    80000536:	40a0053b          	negw	a0,a0
    8000053a:	4885                	li	a7,1
    8000053c:	bf9d                	j	800004b2 <printint+0x16>

000000008000053e <panic>:
    8000053e:	1101                	addi	sp,sp,-32
    80000540:	ec06                	sd	ra,24(sp)
    80000542:	e822                	sd	s0,16(sp)
    80000544:	e426                	sd	s1,8(sp)
    80000546:	1000                	addi	s0,sp,32
    80000548:	84aa                	mv	s1,a0
    8000054a:	00011797          	auipc	a5,0x11
    8000054e:	ce07ab23          	sw	zero,-778(a5) # 80011240 <pr+0x18>
    80000552:	00008517          	auipc	a0,0x8
    80000556:	ac650513          	addi	a0,a0,-1338 # 80008018 <etext+0x18>
    8000055a:	00000097          	auipc	ra,0x0
    8000055e:	02e080e7          	jalr	46(ra) # 80000588 <printf>
    80000562:	8526                	mv	a0,s1
    80000564:	00000097          	auipc	ra,0x0
    80000568:	024080e7          	jalr	36(ra) # 80000588 <printf>
    8000056c:	00008517          	auipc	a0,0x8
    80000570:	b5c50513          	addi	a0,a0,-1188 # 800080c8 <digits+0x88>
    80000574:	00000097          	auipc	ra,0x0
    80000578:	014080e7          	jalr	20(ra) # 80000588 <printf>
    8000057c:	4785                	li	a5,1
    8000057e:	00009717          	auipc	a4,0x9
    80000582:	a8f72123          	sw	a5,-1406(a4) # 80009000 <panicked>
    80000586:	a001                	j	80000586 <panic+0x48>

0000000080000588 <printf>:
    80000588:	7131                	addi	sp,sp,-192
    8000058a:	fc86                	sd	ra,120(sp)
    8000058c:	f8a2                	sd	s0,112(sp)
    8000058e:	f4a6                	sd	s1,104(sp)
    80000590:	f0ca                	sd	s2,96(sp)
    80000592:	ecce                	sd	s3,88(sp)
    80000594:	e8d2                	sd	s4,80(sp)
    80000596:	e4d6                	sd	s5,72(sp)
    80000598:	e0da                	sd	s6,64(sp)
    8000059a:	fc5e                	sd	s7,56(sp)
    8000059c:	f862                	sd	s8,48(sp)
    8000059e:	f466                	sd	s9,40(sp)
    800005a0:	f06a                	sd	s10,32(sp)
    800005a2:	ec6e                	sd	s11,24(sp)
    800005a4:	0100                	addi	s0,sp,128
    800005a6:	8a2a                	mv	s4,a0
    800005a8:	e40c                	sd	a1,8(s0)
    800005aa:	e810                	sd	a2,16(s0)
    800005ac:	ec14                	sd	a3,24(s0)
    800005ae:	f018                	sd	a4,32(s0)
    800005b0:	f41c                	sd	a5,40(s0)
    800005b2:	03043823          	sd	a6,48(s0)
    800005b6:	03143c23          	sd	a7,56(s0)
    800005ba:	00011d97          	auipc	s11,0x11
    800005be:	c86dad83          	lw	s11,-890(s11) # 80011240 <pr+0x18>
    800005c2:	020d9b63          	bnez	s11,800005f8 <printf+0x70>
    800005c6:	040a0263          	beqz	s4,8000060a <printf+0x82>
    800005ca:	00840793          	addi	a5,s0,8
    800005ce:	f8f43423          	sd	a5,-120(s0)
    800005d2:	000a4503          	lbu	a0,0(s4)
    800005d6:	16050263          	beqz	a0,8000073a <printf+0x1b2>
    800005da:	4481                	li	s1,0
    800005dc:	02500a93          	li	s5,37
    800005e0:	07000b13          	li	s6,112
    800005e4:	4d41                	li	s10,16
    800005e6:	00008b97          	auipc	s7,0x8
    800005ea:	a5ab8b93          	addi	s7,s7,-1446 # 80008040 <digits>
    800005ee:	07300c93          	li	s9,115
    800005f2:	06400c13          	li	s8,100
    800005f6:	a82d                	j	80000630 <printf+0xa8>
    800005f8:	00011517          	auipc	a0,0x11
    800005fc:	c3050513          	addi	a0,a0,-976 # 80011228 <pr>
    80000600:	00000097          	auipc	ra,0x0
    80000604:	5e4080e7          	jalr	1508(ra) # 80000be4 <acquire>
    80000608:	bf7d                	j	800005c6 <printf+0x3e>
    8000060a:	00008517          	auipc	a0,0x8
    8000060e:	a1e50513          	addi	a0,a0,-1506 # 80008028 <etext+0x28>
    80000612:	00000097          	auipc	ra,0x0
    80000616:	f2c080e7          	jalr	-212(ra) # 8000053e <panic>
    8000061a:	00000097          	auipc	ra,0x0
    8000061e:	c62080e7          	jalr	-926(ra) # 8000027c <consputc>
    80000622:	2485                	addiw	s1,s1,1
    80000624:	009a07b3          	add	a5,s4,s1
    80000628:	0007c503          	lbu	a0,0(a5)
    8000062c:	10050763          	beqz	a0,8000073a <printf+0x1b2>
    80000630:	ff5515e3          	bne	a0,s5,8000061a <printf+0x92>
    80000634:	2485                	addiw	s1,s1,1
    80000636:	009a07b3          	add	a5,s4,s1
    8000063a:	0007c783          	lbu	a5,0(a5)
    8000063e:	0007891b          	sext.w	s2,a5
    80000642:	cfe5                	beqz	a5,8000073a <printf+0x1b2>
    80000644:	05678a63          	beq	a5,s6,80000698 <printf+0x110>
    80000648:	02fb7663          	bgeu	s6,a5,80000674 <printf+0xec>
    8000064c:	09978963          	beq	a5,s9,800006de <printf+0x156>
    80000650:	07800713          	li	a4,120
    80000654:	0ce79863          	bne	a5,a4,80000724 <printf+0x19c>
    80000658:	f8843783          	ld	a5,-120(s0)
    8000065c:	00878713          	addi	a4,a5,8
    80000660:	f8e43423          	sd	a4,-120(s0)
    80000664:	4605                	li	a2,1
    80000666:	85ea                	mv	a1,s10
    80000668:	4388                	lw	a0,0(a5)
    8000066a:	00000097          	auipc	ra,0x0
    8000066e:	e32080e7          	jalr	-462(ra) # 8000049c <printint>
    80000672:	bf45                	j	80000622 <printf+0x9a>
    80000674:	0b578263          	beq	a5,s5,80000718 <printf+0x190>
    80000678:	0b879663          	bne	a5,s8,80000724 <printf+0x19c>
    8000067c:	f8843783          	ld	a5,-120(s0)
    80000680:	00878713          	addi	a4,a5,8
    80000684:	f8e43423          	sd	a4,-120(s0)
    80000688:	4605                	li	a2,1
    8000068a:	45a9                	li	a1,10
    8000068c:	4388                	lw	a0,0(a5)
    8000068e:	00000097          	auipc	ra,0x0
    80000692:	e0e080e7          	jalr	-498(ra) # 8000049c <printint>
    80000696:	b771                	j	80000622 <printf+0x9a>
    80000698:	f8843783          	ld	a5,-120(s0)
    8000069c:	00878713          	addi	a4,a5,8
    800006a0:	f8e43423          	sd	a4,-120(s0)
    800006a4:	0007b983          	ld	s3,0(a5)
    800006a8:	03000513          	li	a0,48
    800006ac:	00000097          	auipc	ra,0x0
    800006b0:	bd0080e7          	jalr	-1072(ra) # 8000027c <consputc>
    800006b4:	07800513          	li	a0,120
    800006b8:	00000097          	auipc	ra,0x0
    800006bc:	bc4080e7          	jalr	-1084(ra) # 8000027c <consputc>
    800006c0:	896a                	mv	s2,s10
    800006c2:	03c9d793          	srli	a5,s3,0x3c
    800006c6:	97de                	add	a5,a5,s7
    800006c8:	0007c503          	lbu	a0,0(a5)
    800006cc:	00000097          	auipc	ra,0x0
    800006d0:	bb0080e7          	jalr	-1104(ra) # 8000027c <consputc>
    800006d4:	0992                	slli	s3,s3,0x4
    800006d6:	397d                	addiw	s2,s2,-1
    800006d8:	fe0915e3          	bnez	s2,800006c2 <printf+0x13a>
    800006dc:	b799                	j	80000622 <printf+0x9a>
    800006de:	f8843783          	ld	a5,-120(s0)
    800006e2:	00878713          	addi	a4,a5,8
    800006e6:	f8e43423          	sd	a4,-120(s0)
    800006ea:	0007b903          	ld	s2,0(a5)
    800006ee:	00090e63          	beqz	s2,8000070a <printf+0x182>
    800006f2:	00094503          	lbu	a0,0(s2)
    800006f6:	d515                	beqz	a0,80000622 <printf+0x9a>
    800006f8:	00000097          	auipc	ra,0x0
    800006fc:	b84080e7          	jalr	-1148(ra) # 8000027c <consputc>
    80000700:	0905                	addi	s2,s2,1
    80000702:	00094503          	lbu	a0,0(s2)
    80000706:	f96d                	bnez	a0,800006f8 <printf+0x170>
    80000708:	bf29                	j	80000622 <printf+0x9a>
    8000070a:	00008917          	auipc	s2,0x8
    8000070e:	91690913          	addi	s2,s2,-1770 # 80008020 <etext+0x20>
    80000712:	02800513          	li	a0,40
    80000716:	b7cd                	j	800006f8 <printf+0x170>
    80000718:	8556                	mv	a0,s5
    8000071a:	00000097          	auipc	ra,0x0
    8000071e:	b62080e7          	jalr	-1182(ra) # 8000027c <consputc>
    80000722:	b701                	j	80000622 <printf+0x9a>
    80000724:	8556                	mv	a0,s5
    80000726:	00000097          	auipc	ra,0x0
    8000072a:	b56080e7          	jalr	-1194(ra) # 8000027c <consputc>
    8000072e:	854a                	mv	a0,s2
    80000730:	00000097          	auipc	ra,0x0
    80000734:	b4c080e7          	jalr	-1204(ra) # 8000027c <consputc>
    80000738:	b5ed                	j	80000622 <printf+0x9a>
    8000073a:	020d9163          	bnez	s11,8000075c <printf+0x1d4>
    8000073e:	70e6                	ld	ra,120(sp)
    80000740:	7446                	ld	s0,112(sp)
    80000742:	74a6                	ld	s1,104(sp)
    80000744:	7906                	ld	s2,96(sp)
    80000746:	69e6                	ld	s3,88(sp)
    80000748:	6a46                	ld	s4,80(sp)
    8000074a:	6aa6                	ld	s5,72(sp)
    8000074c:	6b06                	ld	s6,64(sp)
    8000074e:	7be2                	ld	s7,56(sp)
    80000750:	7c42                	ld	s8,48(sp)
    80000752:	7ca2                	ld	s9,40(sp)
    80000754:	7d02                	ld	s10,32(sp)
    80000756:	6de2                	ld	s11,24(sp)
    80000758:	6129                	addi	sp,sp,192
    8000075a:	8082                	ret
    8000075c:	00011517          	auipc	a0,0x11
    80000760:	acc50513          	addi	a0,a0,-1332 # 80011228 <pr>
    80000764:	00000097          	auipc	ra,0x0
    80000768:	534080e7          	jalr	1332(ra) # 80000c98 <release>
    8000076c:	bfc9                	j	8000073e <printf+0x1b6>

000000008000076e <printfinit>:
    8000076e:	1101                	addi	sp,sp,-32
    80000770:	ec06                	sd	ra,24(sp)
    80000772:	e822                	sd	s0,16(sp)
    80000774:	e426                	sd	s1,8(sp)
    80000776:	1000                	addi	s0,sp,32
    80000778:	00011497          	auipc	s1,0x11
    8000077c:	ab048493          	addi	s1,s1,-1360 # 80011228 <pr>
    80000780:	00008597          	auipc	a1,0x8
    80000784:	8b858593          	addi	a1,a1,-1864 # 80008038 <etext+0x38>
    80000788:	8526                	mv	a0,s1
    8000078a:	00000097          	auipc	ra,0x0
    8000078e:	3ca080e7          	jalr	970(ra) # 80000b54 <initlock>
    80000792:	4785                	li	a5,1
    80000794:	cc9c                	sw	a5,24(s1)
    80000796:	60e2                	ld	ra,24(sp)
    80000798:	6442                	ld	s0,16(sp)
    8000079a:	64a2                	ld	s1,8(sp)
    8000079c:	6105                	addi	sp,sp,32
    8000079e:	8082                	ret

00000000800007a0 <uartinit>:
    800007a0:	1141                	addi	sp,sp,-16
    800007a2:	e406                	sd	ra,8(sp)
    800007a4:	e022                	sd	s0,0(sp)
    800007a6:	0800                	addi	s0,sp,16
    800007a8:	100007b7          	lui	a5,0x10000
    800007ac:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800007b0:	f8000713          	li	a4,-128
    800007b4:	00e781a3          	sb	a4,3(a5)
    800007b8:	470d                	li	a4,3
    800007ba:	00e78023          	sb	a4,0(a5)
    800007be:	000780a3          	sb	zero,1(a5)
    800007c2:	00e781a3          	sb	a4,3(a5)
    800007c6:	469d                	li	a3,7
    800007c8:	00d78123          	sb	a3,2(a5)
    800007cc:	00e780a3          	sb	a4,1(a5)
    800007d0:	00008597          	auipc	a1,0x8
    800007d4:	88858593          	addi	a1,a1,-1912 # 80008058 <digits+0x18>
    800007d8:	00011517          	auipc	a0,0x11
    800007dc:	a7050513          	addi	a0,a0,-1424 # 80011248 <uart_tx_lock>
    800007e0:	00000097          	auipc	ra,0x0
    800007e4:	374080e7          	jalr	884(ra) # 80000b54 <initlock>
    800007e8:	60a2                	ld	ra,8(sp)
    800007ea:	6402                	ld	s0,0(sp)
    800007ec:	0141                	addi	sp,sp,16
    800007ee:	8082                	ret

00000000800007f0 <uartputc_sync>:
    800007f0:	1101                	addi	sp,sp,-32
    800007f2:	ec06                	sd	ra,24(sp)
    800007f4:	e822                	sd	s0,16(sp)
    800007f6:	e426                	sd	s1,8(sp)
    800007f8:	1000                	addi	s0,sp,32
    800007fa:	84aa                	mv	s1,a0
    800007fc:	00000097          	auipc	ra,0x0
    80000800:	39c080e7          	jalr	924(ra) # 80000b98 <push_off>
    80000804:	00008797          	auipc	a5,0x8
    80000808:	7fc7a783          	lw	a5,2044(a5) # 80009000 <panicked>
    8000080c:	10000737          	lui	a4,0x10000
    80000810:	c391                	beqz	a5,80000814 <uartputc_sync+0x24>
    80000812:	a001                	j	80000812 <uartputc_sync+0x22>
    80000814:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80000818:	0ff7f793          	andi	a5,a5,255
    8000081c:	0207f793          	andi	a5,a5,32
    80000820:	dbf5                	beqz	a5,80000814 <uartputc_sync+0x24>
    80000822:	0ff4f793          	andi	a5,s1,255
    80000826:	10000737          	lui	a4,0x10000
    8000082a:	00f70023          	sb	a5,0(a4) # 10000000 <_entry-0x70000000>
    8000082e:	00000097          	auipc	ra,0x0
    80000832:	40a080e7          	jalr	1034(ra) # 80000c38 <pop_off>
    80000836:	60e2                	ld	ra,24(sp)
    80000838:	6442                	ld	s0,16(sp)
    8000083a:	64a2                	ld	s1,8(sp)
    8000083c:	6105                	addi	sp,sp,32
    8000083e:	8082                	ret

0000000080000840 <uartstart>:
    80000840:	00008717          	auipc	a4,0x8
    80000844:	7c873703          	ld	a4,1992(a4) # 80009008 <uart_tx_r>
    80000848:	00008797          	auipc	a5,0x8
    8000084c:	7c87b783          	ld	a5,1992(a5) # 80009010 <uart_tx_w>
    80000850:	06e78c63          	beq	a5,a4,800008c8 <uartstart+0x88>
    80000854:	7139                	addi	sp,sp,-64
    80000856:	fc06                	sd	ra,56(sp)
    80000858:	f822                	sd	s0,48(sp)
    8000085a:	f426                	sd	s1,40(sp)
    8000085c:	f04a                	sd	s2,32(sp)
    8000085e:	ec4e                	sd	s3,24(sp)
    80000860:	e852                	sd	s4,16(sp)
    80000862:	e456                	sd	s5,8(sp)
    80000864:	0080                	addi	s0,sp,64
    80000866:	10000937          	lui	s2,0x10000
    8000086a:	00011a17          	auipc	s4,0x11
    8000086e:	9dea0a13          	addi	s4,s4,-1570 # 80011248 <uart_tx_lock>
    80000872:	00008497          	auipc	s1,0x8
    80000876:	79648493          	addi	s1,s1,1942 # 80009008 <uart_tx_r>
    8000087a:	00008997          	auipc	s3,0x8
    8000087e:	79698993          	addi	s3,s3,1942 # 80009010 <uart_tx_w>
    80000882:	00594783          	lbu	a5,5(s2) # 10000005 <_entry-0x6ffffffb>
    80000886:	0ff7f793          	andi	a5,a5,255
    8000088a:	0207f793          	andi	a5,a5,32
    8000088e:	c785                	beqz	a5,800008b6 <uartstart+0x76>
    80000890:	01f77793          	andi	a5,a4,31
    80000894:	97d2                	add	a5,a5,s4
    80000896:	0187ca83          	lbu	s5,24(a5)
    8000089a:	0705                	addi	a4,a4,1
    8000089c:	e098                	sd	a4,0(s1)
    8000089e:	8526                	mv	a0,s1
    800008a0:	00002097          	auipc	ra,0x2
    800008a4:	afc080e7          	jalr	-1284(ra) # 8000239c <wakeup>
    800008a8:	01590023          	sb	s5,0(s2)
    800008ac:	6098                	ld	a4,0(s1)
    800008ae:	0009b783          	ld	a5,0(s3)
    800008b2:	fce798e3          	bne	a5,a4,80000882 <uartstart+0x42>
    800008b6:	70e2                	ld	ra,56(sp)
    800008b8:	7442                	ld	s0,48(sp)
    800008ba:	74a2                	ld	s1,40(sp)
    800008bc:	7902                	ld	s2,32(sp)
    800008be:	69e2                	ld	s3,24(sp)
    800008c0:	6a42                	ld	s4,16(sp)
    800008c2:	6aa2                	ld	s5,8(sp)
    800008c4:	6121                	addi	sp,sp,64
    800008c6:	8082                	ret
    800008c8:	8082                	ret

00000000800008ca <uartputc>:
    800008ca:	7179                	addi	sp,sp,-48
    800008cc:	f406                	sd	ra,40(sp)
    800008ce:	f022                	sd	s0,32(sp)
    800008d0:	ec26                	sd	s1,24(sp)
    800008d2:	e84a                	sd	s2,16(sp)
    800008d4:	e44e                	sd	s3,8(sp)
    800008d6:	e052                	sd	s4,0(sp)
    800008d8:	1800                	addi	s0,sp,48
    800008da:	89aa                	mv	s3,a0
    800008dc:	00011517          	auipc	a0,0x11
    800008e0:	96c50513          	addi	a0,a0,-1684 # 80011248 <uart_tx_lock>
    800008e4:	00000097          	auipc	ra,0x0
    800008e8:	300080e7          	jalr	768(ra) # 80000be4 <acquire>
    800008ec:	00008797          	auipc	a5,0x8
    800008f0:	7147a783          	lw	a5,1812(a5) # 80009000 <panicked>
    800008f4:	c391                	beqz	a5,800008f8 <uartputc+0x2e>
    800008f6:	a001                	j	800008f6 <uartputc+0x2c>
    800008f8:	00008797          	auipc	a5,0x8
    800008fc:	7187b783          	ld	a5,1816(a5) # 80009010 <uart_tx_w>
    80000900:	00008717          	auipc	a4,0x8
    80000904:	70873703          	ld	a4,1800(a4) # 80009008 <uart_tx_r>
    80000908:	02070713          	addi	a4,a4,32
    8000090c:	02f71b63          	bne	a4,a5,80000942 <uartputc+0x78>
    80000910:	00011a17          	auipc	s4,0x11
    80000914:	938a0a13          	addi	s4,s4,-1736 # 80011248 <uart_tx_lock>
    80000918:	00008497          	auipc	s1,0x8
    8000091c:	6f048493          	addi	s1,s1,1776 # 80009008 <uart_tx_r>
    80000920:	00008917          	auipc	s2,0x8
    80000924:	6f090913          	addi	s2,s2,1776 # 80009010 <uart_tx_w>
    80000928:	85d2                	mv	a1,s4
    8000092a:	8526                	mv	a0,s1
    8000092c:	00002097          	auipc	ra,0x2
    80000930:	8e4080e7          	jalr	-1820(ra) # 80002210 <sleep>
    80000934:	00093783          	ld	a5,0(s2)
    80000938:	6098                	ld	a4,0(s1)
    8000093a:	02070713          	addi	a4,a4,32
    8000093e:	fef705e3          	beq	a4,a5,80000928 <uartputc+0x5e>
    80000942:	00011497          	auipc	s1,0x11
    80000946:	90648493          	addi	s1,s1,-1786 # 80011248 <uart_tx_lock>
    8000094a:	01f7f713          	andi	a4,a5,31
    8000094e:	9726                	add	a4,a4,s1
    80000950:	01370c23          	sb	s3,24(a4)
    80000954:	0785                	addi	a5,a5,1
    80000956:	00008717          	auipc	a4,0x8
    8000095a:	6af73d23          	sd	a5,1722(a4) # 80009010 <uart_tx_w>
    8000095e:	00000097          	auipc	ra,0x0
    80000962:	ee2080e7          	jalr	-286(ra) # 80000840 <uartstart>
    80000966:	8526                	mv	a0,s1
    80000968:	00000097          	auipc	ra,0x0
    8000096c:	330080e7          	jalr	816(ra) # 80000c98 <release>
    80000970:	70a2                	ld	ra,40(sp)
    80000972:	7402                	ld	s0,32(sp)
    80000974:	64e2                	ld	s1,24(sp)
    80000976:	6942                	ld	s2,16(sp)
    80000978:	69a2                	ld	s3,8(sp)
    8000097a:	6a02                	ld	s4,0(sp)
    8000097c:	6145                	addi	sp,sp,48
    8000097e:	8082                	ret

0000000080000980 <uartgetc>:
    80000980:	1141                	addi	sp,sp,-16
    80000982:	e422                	sd	s0,8(sp)
    80000984:	0800                	addi	s0,sp,16
    80000986:	100007b7          	lui	a5,0x10000
    8000098a:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    8000098e:	8b85                	andi	a5,a5,1
    80000990:	cb91                	beqz	a5,800009a4 <uartgetc+0x24>
    80000992:	100007b7          	lui	a5,0x10000
    80000996:	0007c503          	lbu	a0,0(a5) # 10000000 <_entry-0x70000000>
    8000099a:	0ff57513          	andi	a0,a0,255
    8000099e:	6422                	ld	s0,8(sp)
    800009a0:	0141                	addi	sp,sp,16
    800009a2:	8082                	ret
    800009a4:	557d                	li	a0,-1
    800009a6:	bfe5                	j	8000099e <uartgetc+0x1e>

00000000800009a8 <uartintr>:
    800009a8:	1101                	addi	sp,sp,-32
    800009aa:	ec06                	sd	ra,24(sp)
    800009ac:	e822                	sd	s0,16(sp)
    800009ae:	e426                	sd	s1,8(sp)
    800009b0:	1000                	addi	s0,sp,32
    800009b2:	54fd                	li	s1,-1
    800009b4:	00000097          	auipc	ra,0x0
    800009b8:	fcc080e7          	jalr	-52(ra) # 80000980 <uartgetc>
    800009bc:	00950763          	beq	a0,s1,800009ca <uartintr+0x22>
    800009c0:	00000097          	auipc	ra,0x0
    800009c4:	8fe080e7          	jalr	-1794(ra) # 800002be <consoleintr>
    800009c8:	b7f5                	j	800009b4 <uartintr+0xc>
    800009ca:	00011497          	auipc	s1,0x11
    800009ce:	87e48493          	addi	s1,s1,-1922 # 80011248 <uart_tx_lock>
    800009d2:	8526                	mv	a0,s1
    800009d4:	00000097          	auipc	ra,0x0
    800009d8:	210080e7          	jalr	528(ra) # 80000be4 <acquire>
    800009dc:	00000097          	auipc	ra,0x0
    800009e0:	e64080e7          	jalr	-412(ra) # 80000840 <uartstart>
    800009e4:	8526                	mv	a0,s1
    800009e6:	00000097          	auipc	ra,0x0
    800009ea:	2b2080e7          	jalr	690(ra) # 80000c98 <release>
    800009ee:	60e2                	ld	ra,24(sp)
    800009f0:	6442                	ld	s0,16(sp)
    800009f2:	64a2                	ld	s1,8(sp)
    800009f4:	6105                	addi	sp,sp,32
    800009f6:	8082                	ret

00000000800009f8 <kfree>:
    800009f8:	1101                	addi	sp,sp,-32
    800009fa:	ec06                	sd	ra,24(sp)
    800009fc:	e822                	sd	s0,16(sp)
    800009fe:	e426                	sd	s1,8(sp)
    80000a00:	e04a                	sd	s2,0(sp)
    80000a02:	1000                	addi	s0,sp,32
    80000a04:	03451793          	slli	a5,a0,0x34
    80000a08:	ebb9                	bnez	a5,80000a5e <kfree+0x66>
    80000a0a:	84aa                	mv	s1,a0
    80000a0c:	00025797          	auipc	a5,0x25
    80000a10:	5f478793          	addi	a5,a5,1524 # 80026000 <end>
    80000a14:	04f56563          	bltu	a0,a5,80000a5e <kfree+0x66>
    80000a18:	47c5                	li	a5,17
    80000a1a:	07ee                	slli	a5,a5,0x1b
    80000a1c:	04f57163          	bgeu	a0,a5,80000a5e <kfree+0x66>
    80000a20:	6605                	lui	a2,0x1
    80000a22:	4585                	li	a1,1
    80000a24:	00000097          	auipc	ra,0x0
    80000a28:	2bc080e7          	jalr	700(ra) # 80000ce0 <memset>
    80000a2c:	00011917          	auipc	s2,0x11
    80000a30:	85490913          	addi	s2,s2,-1964 # 80011280 <kmem>
    80000a34:	854a                	mv	a0,s2
    80000a36:	00000097          	auipc	ra,0x0
    80000a3a:	1ae080e7          	jalr	430(ra) # 80000be4 <acquire>
    80000a3e:	01893783          	ld	a5,24(s2)
    80000a42:	e09c                	sd	a5,0(s1)
    80000a44:	00993c23          	sd	s1,24(s2)
    80000a48:	854a                	mv	a0,s2
    80000a4a:	00000097          	auipc	ra,0x0
    80000a4e:	24e080e7          	jalr	590(ra) # 80000c98 <release>
    80000a52:	60e2                	ld	ra,24(sp)
    80000a54:	6442                	ld	s0,16(sp)
    80000a56:	64a2                	ld	s1,8(sp)
    80000a58:	6902                	ld	s2,0(sp)
    80000a5a:	6105                	addi	sp,sp,32
    80000a5c:	8082                	ret
    80000a5e:	00007517          	auipc	a0,0x7
    80000a62:	60250513          	addi	a0,a0,1538 # 80008060 <digits+0x20>
    80000a66:	00000097          	auipc	ra,0x0
    80000a6a:	ad8080e7          	jalr	-1320(ra) # 8000053e <panic>

0000000080000a6e <freerange>:
    80000a6e:	7179                	addi	sp,sp,-48
    80000a70:	f406                	sd	ra,40(sp)
    80000a72:	f022                	sd	s0,32(sp)
    80000a74:	ec26                	sd	s1,24(sp)
    80000a76:	e84a                	sd	s2,16(sp)
    80000a78:	e44e                	sd	s3,8(sp)
    80000a7a:	e052                	sd	s4,0(sp)
    80000a7c:	1800                	addi	s0,sp,48
    80000a7e:	6785                	lui	a5,0x1
    80000a80:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80000a84:	94aa                	add	s1,s1,a0
    80000a86:	757d                	lui	a0,0xfffff
    80000a88:	8ce9                	and	s1,s1,a0
    80000a8a:	94be                	add	s1,s1,a5
    80000a8c:	0095ee63          	bltu	a1,s1,80000aa8 <freerange+0x3a>
    80000a90:	892e                	mv	s2,a1
    80000a92:	7a7d                	lui	s4,0xfffff
    80000a94:	6985                	lui	s3,0x1
    80000a96:	01448533          	add	a0,s1,s4
    80000a9a:	00000097          	auipc	ra,0x0
    80000a9e:	f5e080e7          	jalr	-162(ra) # 800009f8 <kfree>
    80000aa2:	94ce                	add	s1,s1,s3
    80000aa4:	fe9979e3          	bgeu	s2,s1,80000a96 <freerange+0x28>
    80000aa8:	70a2                	ld	ra,40(sp)
    80000aaa:	7402                	ld	s0,32(sp)
    80000aac:	64e2                	ld	s1,24(sp)
    80000aae:	6942                	ld	s2,16(sp)
    80000ab0:	69a2                	ld	s3,8(sp)
    80000ab2:	6a02                	ld	s4,0(sp)
    80000ab4:	6145                	addi	sp,sp,48
    80000ab6:	8082                	ret

0000000080000ab8 <kinit>:
    80000ab8:	1141                	addi	sp,sp,-16
    80000aba:	e406                	sd	ra,8(sp)
    80000abc:	e022                	sd	s0,0(sp)
    80000abe:	0800                	addi	s0,sp,16
    80000ac0:	00007597          	auipc	a1,0x7
    80000ac4:	5a858593          	addi	a1,a1,1448 # 80008068 <digits+0x28>
    80000ac8:	00010517          	auipc	a0,0x10
    80000acc:	7b850513          	addi	a0,a0,1976 # 80011280 <kmem>
    80000ad0:	00000097          	auipc	ra,0x0
    80000ad4:	084080e7          	jalr	132(ra) # 80000b54 <initlock>
    80000ad8:	45c5                	li	a1,17
    80000ada:	05ee                	slli	a1,a1,0x1b
    80000adc:	00025517          	auipc	a0,0x25
    80000ae0:	52450513          	addi	a0,a0,1316 # 80026000 <end>
    80000ae4:	00000097          	auipc	ra,0x0
    80000ae8:	f8a080e7          	jalr	-118(ra) # 80000a6e <freerange>
    80000aec:	60a2                	ld	ra,8(sp)
    80000aee:	6402                	ld	s0,0(sp)
    80000af0:	0141                	addi	sp,sp,16
    80000af2:	8082                	ret

0000000080000af4 <kalloc>:
    80000af4:	1101                	addi	sp,sp,-32
    80000af6:	ec06                	sd	ra,24(sp)
    80000af8:	e822                	sd	s0,16(sp)
    80000afa:	e426                	sd	s1,8(sp)
    80000afc:	1000                	addi	s0,sp,32
    80000afe:	00010497          	auipc	s1,0x10
    80000b02:	78248493          	addi	s1,s1,1922 # 80011280 <kmem>
    80000b06:	8526                	mv	a0,s1
    80000b08:	00000097          	auipc	ra,0x0
    80000b0c:	0dc080e7          	jalr	220(ra) # 80000be4 <acquire>
    80000b10:	6c84                	ld	s1,24(s1)
    80000b12:	c885                	beqz	s1,80000b42 <kalloc+0x4e>
    80000b14:	609c                	ld	a5,0(s1)
    80000b16:	00010517          	auipc	a0,0x10
    80000b1a:	76a50513          	addi	a0,a0,1898 # 80011280 <kmem>
    80000b1e:	ed1c                	sd	a5,24(a0)
    80000b20:	00000097          	auipc	ra,0x0
    80000b24:	178080e7          	jalr	376(ra) # 80000c98 <release>
    80000b28:	6605                	lui	a2,0x1
    80000b2a:	4595                	li	a1,5
    80000b2c:	8526                	mv	a0,s1
    80000b2e:	00000097          	auipc	ra,0x0
    80000b32:	1b2080e7          	jalr	434(ra) # 80000ce0 <memset>
    80000b36:	8526                	mv	a0,s1
    80000b38:	60e2                	ld	ra,24(sp)
    80000b3a:	6442                	ld	s0,16(sp)
    80000b3c:	64a2                	ld	s1,8(sp)
    80000b3e:	6105                	addi	sp,sp,32
    80000b40:	8082                	ret
    80000b42:	00010517          	auipc	a0,0x10
    80000b46:	73e50513          	addi	a0,a0,1854 # 80011280 <kmem>
    80000b4a:	00000097          	auipc	ra,0x0
    80000b4e:	14e080e7          	jalr	334(ra) # 80000c98 <release>
    80000b52:	b7d5                	j	80000b36 <kalloc+0x42>

0000000080000b54 <initlock>:
    80000b54:	1141                	addi	sp,sp,-16
    80000b56:	e422                	sd	s0,8(sp)
    80000b58:	0800                	addi	s0,sp,16
    80000b5a:	e50c                	sd	a1,8(a0)
    80000b5c:	00052023          	sw	zero,0(a0)
    80000b60:	00053823          	sd	zero,16(a0)
    80000b64:	6422                	ld	s0,8(sp)
    80000b66:	0141                	addi	sp,sp,16
    80000b68:	8082                	ret

0000000080000b6a <holding>:
    80000b6a:	411c                	lw	a5,0(a0)
    80000b6c:	e399                	bnez	a5,80000b72 <holding+0x8>
    80000b6e:	4501                	li	a0,0
    80000b70:	8082                	ret
    80000b72:	1101                	addi	sp,sp,-32
    80000b74:	ec06                	sd	ra,24(sp)
    80000b76:	e822                	sd	s0,16(sp)
    80000b78:	e426                	sd	s1,8(sp)
    80000b7a:	1000                	addi	s0,sp,32
    80000b7c:	6904                	ld	s1,16(a0)
    80000b7e:	00001097          	auipc	ra,0x1
    80000b82:	e16080e7          	jalr	-490(ra) # 80001994 <mycpu>
    80000b86:	40a48533          	sub	a0,s1,a0
    80000b8a:	00153513          	seqz	a0,a0
    80000b8e:	60e2                	ld	ra,24(sp)
    80000b90:	6442                	ld	s0,16(sp)
    80000b92:	64a2                	ld	s1,8(sp)
    80000b94:	6105                	addi	sp,sp,32
    80000b96:	8082                	ret

0000000080000b98 <push_off>:
    80000b98:	1101                	addi	sp,sp,-32
    80000b9a:	ec06                	sd	ra,24(sp)
    80000b9c:	e822                	sd	s0,16(sp)
    80000b9e:	e426                	sd	s1,8(sp)
    80000ba0:	1000                	addi	s0,sp,32
    80000ba2:	100024f3          	csrr	s1,sstatus
    80000ba6:	100027f3          	csrr	a5,sstatus
    80000baa:	9bf5                	andi	a5,a5,-3
    80000bac:	10079073          	csrw	sstatus,a5
    80000bb0:	00001097          	auipc	ra,0x1
    80000bb4:	de4080e7          	jalr	-540(ra) # 80001994 <mycpu>
    80000bb8:	5d3c                	lw	a5,120(a0)
    80000bba:	cf89                	beqz	a5,80000bd4 <push_off+0x3c>
    80000bbc:	00001097          	auipc	ra,0x1
    80000bc0:	dd8080e7          	jalr	-552(ra) # 80001994 <mycpu>
    80000bc4:	5d3c                	lw	a5,120(a0)
    80000bc6:	2785                	addiw	a5,a5,1
    80000bc8:	dd3c                	sw	a5,120(a0)
    80000bca:	60e2                	ld	ra,24(sp)
    80000bcc:	6442                	ld	s0,16(sp)
    80000bce:	64a2                	ld	s1,8(sp)
    80000bd0:	6105                	addi	sp,sp,32
    80000bd2:	8082                	ret
    80000bd4:	00001097          	auipc	ra,0x1
    80000bd8:	dc0080e7          	jalr	-576(ra) # 80001994 <mycpu>
    80000bdc:	8085                	srli	s1,s1,0x1
    80000bde:	8885                	andi	s1,s1,1
    80000be0:	dd64                	sw	s1,124(a0)
    80000be2:	bfe9                	j	80000bbc <push_off+0x24>

0000000080000be4 <acquire>:
    80000be4:	1101                	addi	sp,sp,-32
    80000be6:	ec06                	sd	ra,24(sp)
    80000be8:	e822                	sd	s0,16(sp)
    80000bea:	e426                	sd	s1,8(sp)
    80000bec:	1000                	addi	s0,sp,32
    80000bee:	84aa                	mv	s1,a0
    80000bf0:	00000097          	auipc	ra,0x0
    80000bf4:	fa8080e7          	jalr	-88(ra) # 80000b98 <push_off>
    80000bf8:	8526                	mv	a0,s1
    80000bfa:	00000097          	auipc	ra,0x0
    80000bfe:	f70080e7          	jalr	-144(ra) # 80000b6a <holding>
    80000c02:	4705                	li	a4,1
    80000c04:	e115                	bnez	a0,80000c28 <acquire+0x44>
    80000c06:	87ba                	mv	a5,a4
    80000c08:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80000c0c:	2781                	sext.w	a5,a5
    80000c0e:	ffe5                	bnez	a5,80000c06 <acquire+0x22>
    80000c10:	0ff0000f          	fence
    80000c14:	00001097          	auipc	ra,0x1
    80000c18:	d80080e7          	jalr	-640(ra) # 80001994 <mycpu>
    80000c1c:	e888                	sd	a0,16(s1)
    80000c1e:	60e2                	ld	ra,24(sp)
    80000c20:	6442                	ld	s0,16(sp)
    80000c22:	64a2                	ld	s1,8(sp)
    80000c24:	6105                	addi	sp,sp,32
    80000c26:	8082                	ret
    80000c28:	00007517          	auipc	a0,0x7
    80000c2c:	44850513          	addi	a0,a0,1096 # 80008070 <digits+0x30>
    80000c30:	00000097          	auipc	ra,0x0
    80000c34:	90e080e7          	jalr	-1778(ra) # 8000053e <panic>

0000000080000c38 <pop_off>:
    80000c38:	1141                	addi	sp,sp,-16
    80000c3a:	e406                	sd	ra,8(sp)
    80000c3c:	e022                	sd	s0,0(sp)
    80000c3e:	0800                	addi	s0,sp,16
    80000c40:	00001097          	auipc	ra,0x1
    80000c44:	d54080e7          	jalr	-684(ra) # 80001994 <mycpu>
    80000c48:	100027f3          	csrr	a5,sstatus
    80000c4c:	8b89                	andi	a5,a5,2
    80000c4e:	e78d                	bnez	a5,80000c78 <pop_off+0x40>
    80000c50:	5d3c                	lw	a5,120(a0)
    80000c52:	02f05b63          	blez	a5,80000c88 <pop_off+0x50>
    80000c56:	37fd                	addiw	a5,a5,-1
    80000c58:	0007871b          	sext.w	a4,a5
    80000c5c:	dd3c                	sw	a5,120(a0)
    80000c5e:	eb09                	bnez	a4,80000c70 <pop_off+0x38>
    80000c60:	5d7c                	lw	a5,124(a0)
    80000c62:	c799                	beqz	a5,80000c70 <pop_off+0x38>
    80000c64:	100027f3          	csrr	a5,sstatus
    80000c68:	0027e793          	ori	a5,a5,2
    80000c6c:	10079073          	csrw	sstatus,a5
    80000c70:	60a2                	ld	ra,8(sp)
    80000c72:	6402                	ld	s0,0(sp)
    80000c74:	0141                	addi	sp,sp,16
    80000c76:	8082                	ret
    80000c78:	00007517          	auipc	a0,0x7
    80000c7c:	40050513          	addi	a0,a0,1024 # 80008078 <digits+0x38>
    80000c80:	00000097          	auipc	ra,0x0
    80000c84:	8be080e7          	jalr	-1858(ra) # 8000053e <panic>
    80000c88:	00007517          	auipc	a0,0x7
    80000c8c:	40850513          	addi	a0,a0,1032 # 80008090 <digits+0x50>
    80000c90:	00000097          	auipc	ra,0x0
    80000c94:	8ae080e7          	jalr	-1874(ra) # 8000053e <panic>

0000000080000c98 <release>:
    80000c98:	1101                	addi	sp,sp,-32
    80000c9a:	ec06                	sd	ra,24(sp)
    80000c9c:	e822                	sd	s0,16(sp)
    80000c9e:	e426                	sd	s1,8(sp)
    80000ca0:	1000                	addi	s0,sp,32
    80000ca2:	84aa                	mv	s1,a0
    80000ca4:	00000097          	auipc	ra,0x0
    80000ca8:	ec6080e7          	jalr	-314(ra) # 80000b6a <holding>
    80000cac:	c115                	beqz	a0,80000cd0 <release+0x38>
    80000cae:	0004b823          	sd	zero,16(s1)
    80000cb2:	0ff0000f          	fence
    80000cb6:	0f50000f          	fence	iorw,ow
    80000cba:	0804a02f          	amoswap.w	zero,zero,(s1)
    80000cbe:	00000097          	auipc	ra,0x0
    80000cc2:	f7a080e7          	jalr	-134(ra) # 80000c38 <pop_off>
    80000cc6:	60e2                	ld	ra,24(sp)
    80000cc8:	6442                	ld	s0,16(sp)
    80000cca:	64a2                	ld	s1,8(sp)
    80000ccc:	6105                	addi	sp,sp,32
    80000cce:	8082                	ret
    80000cd0:	00007517          	auipc	a0,0x7
    80000cd4:	3c850513          	addi	a0,a0,968 # 80008098 <digits+0x58>
    80000cd8:	00000097          	auipc	ra,0x0
    80000cdc:	866080e7          	jalr	-1946(ra) # 8000053e <panic>

0000000080000ce0 <memset>:
    80000ce0:	1141                	addi	sp,sp,-16
    80000ce2:	e422                	sd	s0,8(sp)
    80000ce4:	0800                	addi	s0,sp,16
    80000ce6:	ce09                	beqz	a2,80000d00 <memset+0x20>
    80000ce8:	87aa                	mv	a5,a0
    80000cea:	fff6071b          	addiw	a4,a2,-1
    80000cee:	1702                	slli	a4,a4,0x20
    80000cf0:	9301                	srli	a4,a4,0x20
    80000cf2:	0705                	addi	a4,a4,1
    80000cf4:	972a                	add	a4,a4,a0
    80000cf6:	00b78023          	sb	a1,0(a5)
    80000cfa:	0785                	addi	a5,a5,1
    80000cfc:	fee79de3          	bne	a5,a4,80000cf6 <memset+0x16>
    80000d00:	6422                	ld	s0,8(sp)
    80000d02:	0141                	addi	sp,sp,16
    80000d04:	8082                	ret

0000000080000d06 <memcmp>:
    80000d06:	1141                	addi	sp,sp,-16
    80000d08:	e422                	sd	s0,8(sp)
    80000d0a:	0800                	addi	s0,sp,16
    80000d0c:	ca05                	beqz	a2,80000d3c <memcmp+0x36>
    80000d0e:	fff6069b          	addiw	a3,a2,-1
    80000d12:	1682                	slli	a3,a3,0x20
    80000d14:	9281                	srli	a3,a3,0x20
    80000d16:	0685                	addi	a3,a3,1
    80000d18:	96aa                	add	a3,a3,a0
    80000d1a:	00054783          	lbu	a5,0(a0)
    80000d1e:	0005c703          	lbu	a4,0(a1)
    80000d22:	00e79863          	bne	a5,a4,80000d32 <memcmp+0x2c>
    80000d26:	0505                	addi	a0,a0,1
    80000d28:	0585                	addi	a1,a1,1
    80000d2a:	fed518e3          	bne	a0,a3,80000d1a <memcmp+0x14>
    80000d2e:	4501                	li	a0,0
    80000d30:	a019                	j	80000d36 <memcmp+0x30>
    80000d32:	40e7853b          	subw	a0,a5,a4
    80000d36:	6422                	ld	s0,8(sp)
    80000d38:	0141                	addi	sp,sp,16
    80000d3a:	8082                	ret
    80000d3c:	4501                	li	a0,0
    80000d3e:	bfe5                	j	80000d36 <memcmp+0x30>

0000000080000d40 <memmove>:
    80000d40:	1141                	addi	sp,sp,-16
    80000d42:	e422                	sd	s0,8(sp)
    80000d44:	0800                	addi	s0,sp,16
    80000d46:	ca0d                	beqz	a2,80000d78 <memmove+0x38>
    80000d48:	00a5f963          	bgeu	a1,a0,80000d5a <memmove+0x1a>
    80000d4c:	02061693          	slli	a3,a2,0x20
    80000d50:	9281                	srli	a3,a3,0x20
    80000d52:	00d58733          	add	a4,a1,a3
    80000d56:	02e56463          	bltu	a0,a4,80000d7e <memmove+0x3e>
    80000d5a:	fff6079b          	addiw	a5,a2,-1
    80000d5e:	1782                	slli	a5,a5,0x20
    80000d60:	9381                	srli	a5,a5,0x20
    80000d62:	0785                	addi	a5,a5,1
    80000d64:	97ae                	add	a5,a5,a1
    80000d66:	872a                	mv	a4,a0
    80000d68:	0585                	addi	a1,a1,1
    80000d6a:	0705                	addi	a4,a4,1
    80000d6c:	fff5c683          	lbu	a3,-1(a1)
    80000d70:	fed70fa3          	sb	a3,-1(a4)
    80000d74:	fef59ae3          	bne	a1,a5,80000d68 <memmove+0x28>
    80000d78:	6422                	ld	s0,8(sp)
    80000d7a:	0141                	addi	sp,sp,16
    80000d7c:	8082                	ret
    80000d7e:	96aa                	add	a3,a3,a0
    80000d80:	fff6079b          	addiw	a5,a2,-1
    80000d84:	1782                	slli	a5,a5,0x20
    80000d86:	9381                	srli	a5,a5,0x20
    80000d88:	fff7c793          	not	a5,a5
    80000d8c:	97ba                	add	a5,a5,a4
    80000d8e:	177d                	addi	a4,a4,-1
    80000d90:	16fd                	addi	a3,a3,-1
    80000d92:	00074603          	lbu	a2,0(a4)
    80000d96:	00c68023          	sb	a2,0(a3)
    80000d9a:	fef71ae3          	bne	a4,a5,80000d8e <memmove+0x4e>
    80000d9e:	bfe9                	j	80000d78 <memmove+0x38>

0000000080000da0 <memcpy>:
    80000da0:	1141                	addi	sp,sp,-16
    80000da2:	e406                	sd	ra,8(sp)
    80000da4:	e022                	sd	s0,0(sp)
    80000da6:	0800                	addi	s0,sp,16
    80000da8:	00000097          	auipc	ra,0x0
    80000dac:	f98080e7          	jalr	-104(ra) # 80000d40 <memmove>
    80000db0:	60a2                	ld	ra,8(sp)
    80000db2:	6402                	ld	s0,0(sp)
    80000db4:	0141                	addi	sp,sp,16
    80000db6:	8082                	ret

0000000080000db8 <strncmp>:
    80000db8:	1141                	addi	sp,sp,-16
    80000dba:	e422                	sd	s0,8(sp)
    80000dbc:	0800                	addi	s0,sp,16
    80000dbe:	ce11                	beqz	a2,80000dda <strncmp+0x22>
    80000dc0:	00054783          	lbu	a5,0(a0)
    80000dc4:	cf89                	beqz	a5,80000dde <strncmp+0x26>
    80000dc6:	0005c703          	lbu	a4,0(a1)
    80000dca:	00f71a63          	bne	a4,a5,80000dde <strncmp+0x26>
    80000dce:	367d                	addiw	a2,a2,-1
    80000dd0:	0505                	addi	a0,a0,1
    80000dd2:	0585                	addi	a1,a1,1
    80000dd4:	f675                	bnez	a2,80000dc0 <strncmp+0x8>
    80000dd6:	4501                	li	a0,0
    80000dd8:	a809                	j	80000dea <strncmp+0x32>
    80000dda:	4501                	li	a0,0
    80000ddc:	a039                	j	80000dea <strncmp+0x32>
    80000dde:	ca09                	beqz	a2,80000df0 <strncmp+0x38>
    80000de0:	00054503          	lbu	a0,0(a0)
    80000de4:	0005c783          	lbu	a5,0(a1)
    80000de8:	9d1d                	subw	a0,a0,a5
    80000dea:	6422                	ld	s0,8(sp)
    80000dec:	0141                	addi	sp,sp,16
    80000dee:	8082                	ret
    80000df0:	4501                	li	a0,0
    80000df2:	bfe5                	j	80000dea <strncmp+0x32>

0000000080000df4 <strncpy>:
    80000df4:	1141                	addi	sp,sp,-16
    80000df6:	e422                	sd	s0,8(sp)
    80000df8:	0800                	addi	s0,sp,16
    80000dfa:	872a                	mv	a4,a0
    80000dfc:	8832                	mv	a6,a2
    80000dfe:	367d                	addiw	a2,a2,-1
    80000e00:	01005963          	blez	a6,80000e12 <strncpy+0x1e>
    80000e04:	0705                	addi	a4,a4,1
    80000e06:	0005c783          	lbu	a5,0(a1)
    80000e0a:	fef70fa3          	sb	a5,-1(a4)
    80000e0e:	0585                	addi	a1,a1,1
    80000e10:	f7f5                	bnez	a5,80000dfc <strncpy+0x8>
    80000e12:	00c05d63          	blez	a2,80000e2c <strncpy+0x38>
    80000e16:	86ba                	mv	a3,a4
    80000e18:	0685                	addi	a3,a3,1
    80000e1a:	fe068fa3          	sb	zero,-1(a3)
    80000e1e:	fff6c793          	not	a5,a3
    80000e22:	9fb9                	addw	a5,a5,a4
    80000e24:	010787bb          	addw	a5,a5,a6
    80000e28:	fef048e3          	bgtz	a5,80000e18 <strncpy+0x24>
    80000e2c:	6422                	ld	s0,8(sp)
    80000e2e:	0141                	addi	sp,sp,16
    80000e30:	8082                	ret

0000000080000e32 <safestrcpy>:
    80000e32:	1141                	addi	sp,sp,-16
    80000e34:	e422                	sd	s0,8(sp)
    80000e36:	0800                	addi	s0,sp,16
    80000e38:	02c05363          	blez	a2,80000e5e <safestrcpy+0x2c>
    80000e3c:	fff6069b          	addiw	a3,a2,-1
    80000e40:	1682                	slli	a3,a3,0x20
    80000e42:	9281                	srli	a3,a3,0x20
    80000e44:	96ae                	add	a3,a3,a1
    80000e46:	87aa                	mv	a5,a0
    80000e48:	00d58963          	beq	a1,a3,80000e5a <safestrcpy+0x28>
    80000e4c:	0585                	addi	a1,a1,1
    80000e4e:	0785                	addi	a5,a5,1
    80000e50:	fff5c703          	lbu	a4,-1(a1)
    80000e54:	fee78fa3          	sb	a4,-1(a5)
    80000e58:	fb65                	bnez	a4,80000e48 <safestrcpy+0x16>
    80000e5a:	00078023          	sb	zero,0(a5)
    80000e5e:	6422                	ld	s0,8(sp)
    80000e60:	0141                	addi	sp,sp,16
    80000e62:	8082                	ret

0000000080000e64 <strlen>:
    80000e64:	1141                	addi	sp,sp,-16
    80000e66:	e422                	sd	s0,8(sp)
    80000e68:	0800                	addi	s0,sp,16
    80000e6a:	00054783          	lbu	a5,0(a0)
    80000e6e:	cf91                	beqz	a5,80000e8a <strlen+0x26>
    80000e70:	0505                	addi	a0,a0,1
    80000e72:	87aa                	mv	a5,a0
    80000e74:	4685                	li	a3,1
    80000e76:	9e89                	subw	a3,a3,a0
    80000e78:	00f6853b          	addw	a0,a3,a5
    80000e7c:	0785                	addi	a5,a5,1
    80000e7e:	fff7c703          	lbu	a4,-1(a5)
    80000e82:	fb7d                	bnez	a4,80000e78 <strlen+0x14>
    80000e84:	6422                	ld	s0,8(sp)
    80000e86:	0141                	addi	sp,sp,16
    80000e88:	8082                	ret
    80000e8a:	4501                	li	a0,0
    80000e8c:	bfe5                	j	80000e84 <strlen+0x20>

0000000080000e8e <main>:
    80000e8e:	1141                	addi	sp,sp,-16
    80000e90:	e406                	sd	ra,8(sp)
    80000e92:	e022                	sd	s0,0(sp)
    80000e94:	0800                	addi	s0,sp,16
    80000e96:	00001097          	auipc	ra,0x1
    80000e9a:	aee080e7          	jalr	-1298(ra) # 80001984 <cpuid>
    80000e9e:	00008717          	auipc	a4,0x8
    80000ea2:	17a70713          	addi	a4,a4,378 # 80009018 <started>
    80000ea6:	c139                	beqz	a0,80000eec <main+0x5e>
    80000ea8:	431c                	lw	a5,0(a4)
    80000eaa:	2781                	sext.w	a5,a5
    80000eac:	dff5                	beqz	a5,80000ea8 <main+0x1a>
    80000eae:	0ff0000f          	fence
    80000eb2:	00001097          	auipc	ra,0x1
    80000eb6:	ad2080e7          	jalr	-1326(ra) # 80001984 <cpuid>
    80000eba:	85aa                	mv	a1,a0
    80000ebc:	00007517          	auipc	a0,0x7
    80000ec0:	1fc50513          	addi	a0,a0,508 # 800080b8 <digits+0x78>
    80000ec4:	fffff097          	auipc	ra,0xfffff
    80000ec8:	6c4080e7          	jalr	1732(ra) # 80000588 <printf>
    80000ecc:	00000097          	auipc	ra,0x0
    80000ed0:	0d8080e7          	jalr	216(ra) # 80000fa4 <kvminithart>
    80000ed4:	00002097          	auipc	ra,0x2
    80000ed8:	8d8080e7          	jalr	-1832(ra) # 800027ac <trapinithart>
    80000edc:	00005097          	auipc	ra,0x5
    80000ee0:	ee4080e7          	jalr	-284(ra) # 80005dc0 <plicinithart>
    80000ee4:	00001097          	auipc	ra,0x1
    80000ee8:	0e8080e7          	jalr	232(ra) # 80001fcc <scheduler>
    80000eec:	fffff097          	auipc	ra,0xfffff
    80000ef0:	564080e7          	jalr	1380(ra) # 80000450 <consoleinit>
    80000ef4:	00000097          	auipc	ra,0x0
    80000ef8:	87a080e7          	jalr	-1926(ra) # 8000076e <printfinit>
    80000efc:	00007517          	auipc	a0,0x7
    80000f00:	1cc50513          	addi	a0,a0,460 # 800080c8 <digits+0x88>
    80000f04:	fffff097          	auipc	ra,0xfffff
    80000f08:	684080e7          	jalr	1668(ra) # 80000588 <printf>
    80000f0c:	00007517          	auipc	a0,0x7
    80000f10:	19450513          	addi	a0,a0,404 # 800080a0 <digits+0x60>
    80000f14:	fffff097          	auipc	ra,0xfffff
    80000f18:	674080e7          	jalr	1652(ra) # 80000588 <printf>
    80000f1c:	00007517          	auipc	a0,0x7
    80000f20:	1ac50513          	addi	a0,a0,428 # 800080c8 <digits+0x88>
    80000f24:	fffff097          	auipc	ra,0xfffff
    80000f28:	664080e7          	jalr	1636(ra) # 80000588 <printf>
    80000f2c:	00000097          	auipc	ra,0x0
    80000f30:	b8c080e7          	jalr	-1140(ra) # 80000ab8 <kinit>
    80000f34:	00000097          	auipc	ra,0x0
    80000f38:	322080e7          	jalr	802(ra) # 80001256 <kvminit>
    80000f3c:	00000097          	auipc	ra,0x0
    80000f40:	068080e7          	jalr	104(ra) # 80000fa4 <kvminithart>
    80000f44:	00001097          	auipc	ra,0x1
    80000f48:	990080e7          	jalr	-1648(ra) # 800018d4 <procinit>
    80000f4c:	00002097          	auipc	ra,0x2
    80000f50:	838080e7          	jalr	-1992(ra) # 80002784 <trapinit>
    80000f54:	00002097          	auipc	ra,0x2
    80000f58:	858080e7          	jalr	-1960(ra) # 800027ac <trapinithart>
    80000f5c:	00005097          	auipc	ra,0x5
    80000f60:	e4e080e7          	jalr	-434(ra) # 80005daa <plicinit>
    80000f64:	00005097          	auipc	ra,0x5
    80000f68:	e5c080e7          	jalr	-420(ra) # 80005dc0 <plicinithart>
    80000f6c:	00002097          	auipc	ra,0x2
    80000f70:	038080e7          	jalr	56(ra) # 80002fa4 <binit>
    80000f74:	00002097          	auipc	ra,0x2
    80000f78:	6c8080e7          	jalr	1736(ra) # 8000363c <iinit>
    80000f7c:	00003097          	auipc	ra,0x3
    80000f80:	672080e7          	jalr	1650(ra) # 800045ee <fileinit>
    80000f84:	00005097          	auipc	ra,0x5
    80000f88:	f5e080e7          	jalr	-162(ra) # 80005ee2 <virtio_disk_init>
    80000f8c:	00001097          	auipc	ra,0x1
    80000f90:	d38080e7          	jalr	-712(ra) # 80001cc4 <userinit>
    80000f94:	0ff0000f          	fence
    80000f98:	4785                	li	a5,1
    80000f9a:	00008717          	auipc	a4,0x8
    80000f9e:	06f72f23          	sw	a5,126(a4) # 80009018 <started>
    80000fa2:	b789                	j	80000ee4 <main+0x56>

0000000080000fa4 <kvminithart>:
    80000fa4:	1141                	addi	sp,sp,-16
    80000fa6:	e422                	sd	s0,8(sp)
    80000fa8:	0800                	addi	s0,sp,16
    80000faa:	00008797          	auipc	a5,0x8
    80000fae:	0767b783          	ld	a5,118(a5) # 80009020 <kernel_pagetable>
    80000fb2:	83b1                	srli	a5,a5,0xc
    80000fb4:	577d                	li	a4,-1
    80000fb6:	177e                	slli	a4,a4,0x3f
    80000fb8:	8fd9                	or	a5,a5,a4
    80000fba:	18079073          	csrw	satp,a5
    80000fbe:	12000073          	sfence.vma
    80000fc2:	6422                	ld	s0,8(sp)
    80000fc4:	0141                	addi	sp,sp,16
    80000fc6:	8082                	ret

0000000080000fc8 <walk>:
    80000fc8:	7139                	addi	sp,sp,-64
    80000fca:	fc06                	sd	ra,56(sp)
    80000fcc:	f822                	sd	s0,48(sp)
    80000fce:	f426                	sd	s1,40(sp)
    80000fd0:	f04a                	sd	s2,32(sp)
    80000fd2:	ec4e                	sd	s3,24(sp)
    80000fd4:	e852                	sd	s4,16(sp)
    80000fd6:	e456                	sd	s5,8(sp)
    80000fd8:	e05a                	sd	s6,0(sp)
    80000fda:	0080                	addi	s0,sp,64
    80000fdc:	84aa                	mv	s1,a0
    80000fde:	89ae                	mv	s3,a1
    80000fe0:	8ab2                	mv	s5,a2
    80000fe2:	57fd                	li	a5,-1
    80000fe4:	83e9                	srli	a5,a5,0x1a
    80000fe6:	4a79                	li	s4,30
    80000fe8:	4b31                	li	s6,12
    80000fea:	04b7f263          	bgeu	a5,a1,8000102e <walk+0x66>
    80000fee:	00007517          	auipc	a0,0x7
    80000ff2:	0e250513          	addi	a0,a0,226 # 800080d0 <digits+0x90>
    80000ff6:	fffff097          	auipc	ra,0xfffff
    80000ffa:	548080e7          	jalr	1352(ra) # 8000053e <panic>
    80000ffe:	060a8663          	beqz	s5,8000106a <walk+0xa2>
    80001002:	00000097          	auipc	ra,0x0
    80001006:	af2080e7          	jalr	-1294(ra) # 80000af4 <kalloc>
    8000100a:	84aa                	mv	s1,a0
    8000100c:	c529                	beqz	a0,80001056 <walk+0x8e>
    8000100e:	6605                	lui	a2,0x1
    80001010:	4581                	li	a1,0
    80001012:	00000097          	auipc	ra,0x0
    80001016:	cce080e7          	jalr	-818(ra) # 80000ce0 <memset>
    8000101a:	00c4d793          	srli	a5,s1,0xc
    8000101e:	07aa                	slli	a5,a5,0xa
    80001020:	0017e793          	ori	a5,a5,1
    80001024:	00f93023          	sd	a5,0(s2)
    80001028:	3a5d                	addiw	s4,s4,-9
    8000102a:	036a0063          	beq	s4,s6,8000104a <walk+0x82>
    8000102e:	0149d933          	srl	s2,s3,s4
    80001032:	1ff97913          	andi	s2,s2,511
    80001036:	090e                	slli	s2,s2,0x3
    80001038:	9926                	add	s2,s2,s1
    8000103a:	00093483          	ld	s1,0(s2)
    8000103e:	0014f793          	andi	a5,s1,1
    80001042:	dfd5                	beqz	a5,80000ffe <walk+0x36>
    80001044:	80a9                	srli	s1,s1,0xa
    80001046:	04b2                	slli	s1,s1,0xc
    80001048:	b7c5                	j	80001028 <walk+0x60>
    8000104a:	00c9d513          	srli	a0,s3,0xc
    8000104e:	1ff57513          	andi	a0,a0,511
    80001052:	050e                	slli	a0,a0,0x3
    80001054:	9526                	add	a0,a0,s1
    80001056:	70e2                	ld	ra,56(sp)
    80001058:	7442                	ld	s0,48(sp)
    8000105a:	74a2                	ld	s1,40(sp)
    8000105c:	7902                	ld	s2,32(sp)
    8000105e:	69e2                	ld	s3,24(sp)
    80001060:	6a42                	ld	s4,16(sp)
    80001062:	6aa2                	ld	s5,8(sp)
    80001064:	6b02                	ld	s6,0(sp)
    80001066:	6121                	addi	sp,sp,64
    80001068:	8082                	ret
    8000106a:	4501                	li	a0,0
    8000106c:	b7ed                	j	80001056 <walk+0x8e>

000000008000106e <walkaddr>:
    8000106e:	57fd                	li	a5,-1
    80001070:	83e9                	srli	a5,a5,0x1a
    80001072:	00b7f463          	bgeu	a5,a1,8000107a <walkaddr+0xc>
    80001076:	4501                	li	a0,0
    80001078:	8082                	ret
    8000107a:	1141                	addi	sp,sp,-16
    8000107c:	e406                	sd	ra,8(sp)
    8000107e:	e022                	sd	s0,0(sp)
    80001080:	0800                	addi	s0,sp,16
    80001082:	4601                	li	a2,0
    80001084:	00000097          	auipc	ra,0x0
    80001088:	f44080e7          	jalr	-188(ra) # 80000fc8 <walk>
    8000108c:	c105                	beqz	a0,800010ac <walkaddr+0x3e>
    8000108e:	611c                	ld	a5,0(a0)
    80001090:	0117f693          	andi	a3,a5,17
    80001094:	4745                	li	a4,17
    80001096:	4501                	li	a0,0
    80001098:	00e68663          	beq	a3,a4,800010a4 <walkaddr+0x36>
    8000109c:	60a2                	ld	ra,8(sp)
    8000109e:	6402                	ld	s0,0(sp)
    800010a0:	0141                	addi	sp,sp,16
    800010a2:	8082                	ret
    800010a4:	00a7d513          	srli	a0,a5,0xa
    800010a8:	0532                	slli	a0,a0,0xc
    800010aa:	bfcd                	j	8000109c <walkaddr+0x2e>
    800010ac:	4501                	li	a0,0
    800010ae:	b7fd                	j	8000109c <walkaddr+0x2e>

00000000800010b0 <mappages>:
    800010b0:	715d                	addi	sp,sp,-80
    800010b2:	e486                	sd	ra,72(sp)
    800010b4:	e0a2                	sd	s0,64(sp)
    800010b6:	fc26                	sd	s1,56(sp)
    800010b8:	f84a                	sd	s2,48(sp)
    800010ba:	f44e                	sd	s3,40(sp)
    800010bc:	f052                	sd	s4,32(sp)
    800010be:	ec56                	sd	s5,24(sp)
    800010c0:	e85a                	sd	s6,16(sp)
    800010c2:	e45e                	sd	s7,8(sp)
    800010c4:	0880                	addi	s0,sp,80
    800010c6:	c205                	beqz	a2,800010e6 <mappages+0x36>
    800010c8:	8aaa                	mv	s5,a0
    800010ca:	8b3a                	mv	s6,a4
    800010cc:	77fd                	lui	a5,0xfffff
    800010ce:	00f5fa33          	and	s4,a1,a5
    800010d2:	15fd                	addi	a1,a1,-1
    800010d4:	00c589b3          	add	s3,a1,a2
    800010d8:	00f9f9b3          	and	s3,s3,a5
    800010dc:	8952                	mv	s2,s4
    800010de:	41468a33          	sub	s4,a3,s4
    800010e2:	6b85                	lui	s7,0x1
    800010e4:	a015                	j	80001108 <mappages+0x58>
    800010e6:	00007517          	auipc	a0,0x7
    800010ea:	ff250513          	addi	a0,a0,-14 # 800080d8 <digits+0x98>
    800010ee:	fffff097          	auipc	ra,0xfffff
    800010f2:	450080e7          	jalr	1104(ra) # 8000053e <panic>
    800010f6:	00007517          	auipc	a0,0x7
    800010fa:	ff250513          	addi	a0,a0,-14 # 800080e8 <digits+0xa8>
    800010fe:	fffff097          	auipc	ra,0xfffff
    80001102:	440080e7          	jalr	1088(ra) # 8000053e <panic>
    80001106:	995e                	add	s2,s2,s7
    80001108:	012a04b3          	add	s1,s4,s2
    8000110c:	4605                	li	a2,1
    8000110e:	85ca                	mv	a1,s2
    80001110:	8556                	mv	a0,s5
    80001112:	00000097          	auipc	ra,0x0
    80001116:	eb6080e7          	jalr	-330(ra) # 80000fc8 <walk>
    8000111a:	cd19                	beqz	a0,80001138 <mappages+0x88>
    8000111c:	611c                	ld	a5,0(a0)
    8000111e:	8b85                	andi	a5,a5,1
    80001120:	fbf9                	bnez	a5,800010f6 <mappages+0x46>
    80001122:	80b1                	srli	s1,s1,0xc
    80001124:	04aa                	slli	s1,s1,0xa
    80001126:	0164e4b3          	or	s1,s1,s6
    8000112a:	0014e493          	ori	s1,s1,1
    8000112e:	e104                	sd	s1,0(a0)
    80001130:	fd391be3          	bne	s2,s3,80001106 <mappages+0x56>
    80001134:	4501                	li	a0,0
    80001136:	a011                	j	8000113a <mappages+0x8a>
    80001138:	557d                	li	a0,-1
    8000113a:	60a6                	ld	ra,72(sp)
    8000113c:	6406                	ld	s0,64(sp)
    8000113e:	74e2                	ld	s1,56(sp)
    80001140:	7942                	ld	s2,48(sp)
    80001142:	79a2                	ld	s3,40(sp)
    80001144:	7a02                	ld	s4,32(sp)
    80001146:	6ae2                	ld	s5,24(sp)
    80001148:	6b42                	ld	s6,16(sp)
    8000114a:	6ba2                	ld	s7,8(sp)
    8000114c:	6161                	addi	sp,sp,80
    8000114e:	8082                	ret

0000000080001150 <kvmmap>:
    80001150:	1141                	addi	sp,sp,-16
    80001152:	e406                	sd	ra,8(sp)
    80001154:	e022                	sd	s0,0(sp)
    80001156:	0800                	addi	s0,sp,16
    80001158:	87b6                	mv	a5,a3
    8000115a:	86b2                	mv	a3,a2
    8000115c:	863e                	mv	a2,a5
    8000115e:	00000097          	auipc	ra,0x0
    80001162:	f52080e7          	jalr	-174(ra) # 800010b0 <mappages>
    80001166:	e509                	bnez	a0,80001170 <kvmmap+0x20>
    80001168:	60a2                	ld	ra,8(sp)
    8000116a:	6402                	ld	s0,0(sp)
    8000116c:	0141                	addi	sp,sp,16
    8000116e:	8082                	ret
    80001170:	00007517          	auipc	a0,0x7
    80001174:	f8850513          	addi	a0,a0,-120 # 800080f8 <digits+0xb8>
    80001178:	fffff097          	auipc	ra,0xfffff
    8000117c:	3c6080e7          	jalr	966(ra) # 8000053e <panic>

0000000080001180 <kvmmake>:
    80001180:	1101                	addi	sp,sp,-32
    80001182:	ec06                	sd	ra,24(sp)
    80001184:	e822                	sd	s0,16(sp)
    80001186:	e426                	sd	s1,8(sp)
    80001188:	e04a                	sd	s2,0(sp)
    8000118a:	1000                	addi	s0,sp,32
    8000118c:	00000097          	auipc	ra,0x0
    80001190:	968080e7          	jalr	-1688(ra) # 80000af4 <kalloc>
    80001194:	84aa                	mv	s1,a0
    80001196:	6605                	lui	a2,0x1
    80001198:	4581                	li	a1,0
    8000119a:	00000097          	auipc	ra,0x0
    8000119e:	b46080e7          	jalr	-1210(ra) # 80000ce0 <memset>
    800011a2:	4719                	li	a4,6
    800011a4:	6685                	lui	a3,0x1
    800011a6:	10000637          	lui	a2,0x10000
    800011aa:	100005b7          	lui	a1,0x10000
    800011ae:	8526                	mv	a0,s1
    800011b0:	00000097          	auipc	ra,0x0
    800011b4:	fa0080e7          	jalr	-96(ra) # 80001150 <kvmmap>
    800011b8:	4719                	li	a4,6
    800011ba:	6685                	lui	a3,0x1
    800011bc:	10001637          	lui	a2,0x10001
    800011c0:	100015b7          	lui	a1,0x10001
    800011c4:	8526                	mv	a0,s1
    800011c6:	00000097          	auipc	ra,0x0
    800011ca:	f8a080e7          	jalr	-118(ra) # 80001150 <kvmmap>
    800011ce:	4719                	li	a4,6
    800011d0:	004006b7          	lui	a3,0x400
    800011d4:	0c000637          	lui	a2,0xc000
    800011d8:	0c0005b7          	lui	a1,0xc000
    800011dc:	8526                	mv	a0,s1
    800011de:	00000097          	auipc	ra,0x0
    800011e2:	f72080e7          	jalr	-142(ra) # 80001150 <kvmmap>
    800011e6:	00007917          	auipc	s2,0x7
    800011ea:	e1a90913          	addi	s2,s2,-486 # 80008000 <etext>
    800011ee:	4729                	li	a4,10
    800011f0:	80007697          	auipc	a3,0x80007
    800011f4:	e1068693          	addi	a3,a3,-496 # 8000 <_entry-0x7fff8000>
    800011f8:	4605                	li	a2,1
    800011fa:	067e                	slli	a2,a2,0x1f
    800011fc:	85b2                	mv	a1,a2
    800011fe:	8526                	mv	a0,s1
    80001200:	00000097          	auipc	ra,0x0
    80001204:	f50080e7          	jalr	-176(ra) # 80001150 <kvmmap>
    80001208:	4719                	li	a4,6
    8000120a:	46c5                	li	a3,17
    8000120c:	06ee                	slli	a3,a3,0x1b
    8000120e:	412686b3          	sub	a3,a3,s2
    80001212:	864a                	mv	a2,s2
    80001214:	85ca                	mv	a1,s2
    80001216:	8526                	mv	a0,s1
    80001218:	00000097          	auipc	ra,0x0
    8000121c:	f38080e7          	jalr	-200(ra) # 80001150 <kvmmap>
    80001220:	4729                	li	a4,10
    80001222:	6685                	lui	a3,0x1
    80001224:	00006617          	auipc	a2,0x6
    80001228:	ddc60613          	addi	a2,a2,-548 # 80007000 <_trampoline>
    8000122c:	040005b7          	lui	a1,0x4000
    80001230:	15fd                	addi	a1,a1,-1
    80001232:	05b2                	slli	a1,a1,0xc
    80001234:	8526                	mv	a0,s1
    80001236:	00000097          	auipc	ra,0x0
    8000123a:	f1a080e7          	jalr	-230(ra) # 80001150 <kvmmap>
    8000123e:	8526                	mv	a0,s1
    80001240:	00000097          	auipc	ra,0x0
    80001244:	5fe080e7          	jalr	1534(ra) # 8000183e <proc_mapstacks>
    80001248:	8526                	mv	a0,s1
    8000124a:	60e2                	ld	ra,24(sp)
    8000124c:	6442                	ld	s0,16(sp)
    8000124e:	64a2                	ld	s1,8(sp)
    80001250:	6902                	ld	s2,0(sp)
    80001252:	6105                	addi	sp,sp,32
    80001254:	8082                	ret

0000000080001256 <kvminit>:
    80001256:	1141                	addi	sp,sp,-16
    80001258:	e406                	sd	ra,8(sp)
    8000125a:	e022                	sd	s0,0(sp)
    8000125c:	0800                	addi	s0,sp,16
    8000125e:	00000097          	auipc	ra,0x0
    80001262:	f22080e7          	jalr	-222(ra) # 80001180 <kvmmake>
    80001266:	00008797          	auipc	a5,0x8
    8000126a:	daa7bd23          	sd	a0,-582(a5) # 80009020 <kernel_pagetable>
    8000126e:	60a2                	ld	ra,8(sp)
    80001270:	6402                	ld	s0,0(sp)
    80001272:	0141                	addi	sp,sp,16
    80001274:	8082                	ret

0000000080001276 <uvmunmap>:
    80001276:	715d                	addi	sp,sp,-80
    80001278:	e486                	sd	ra,72(sp)
    8000127a:	e0a2                	sd	s0,64(sp)
    8000127c:	fc26                	sd	s1,56(sp)
    8000127e:	f84a                	sd	s2,48(sp)
    80001280:	f44e                	sd	s3,40(sp)
    80001282:	f052                	sd	s4,32(sp)
    80001284:	ec56                	sd	s5,24(sp)
    80001286:	e85a                	sd	s6,16(sp)
    80001288:	e45e                	sd	s7,8(sp)
    8000128a:	0880                	addi	s0,sp,80
    8000128c:	03459793          	slli	a5,a1,0x34
    80001290:	e795                	bnez	a5,800012bc <uvmunmap+0x46>
    80001292:	8a2a                	mv	s4,a0
    80001294:	892e                	mv	s2,a1
    80001296:	8ab6                	mv	s5,a3
    80001298:	0632                	slli	a2,a2,0xc
    8000129a:	00b609b3          	add	s3,a2,a1
    8000129e:	4b85                	li	s7,1
    800012a0:	6b05                	lui	s6,0x1
    800012a2:	0735e863          	bltu	a1,s3,80001312 <uvmunmap+0x9c>
    800012a6:	60a6                	ld	ra,72(sp)
    800012a8:	6406                	ld	s0,64(sp)
    800012aa:	74e2                	ld	s1,56(sp)
    800012ac:	7942                	ld	s2,48(sp)
    800012ae:	79a2                	ld	s3,40(sp)
    800012b0:	7a02                	ld	s4,32(sp)
    800012b2:	6ae2                	ld	s5,24(sp)
    800012b4:	6b42                	ld	s6,16(sp)
    800012b6:	6ba2                	ld	s7,8(sp)
    800012b8:	6161                	addi	sp,sp,80
    800012ba:	8082                	ret
    800012bc:	00007517          	auipc	a0,0x7
    800012c0:	e4450513          	addi	a0,a0,-444 # 80008100 <digits+0xc0>
    800012c4:	fffff097          	auipc	ra,0xfffff
    800012c8:	27a080e7          	jalr	634(ra) # 8000053e <panic>
    800012cc:	00007517          	auipc	a0,0x7
    800012d0:	e4c50513          	addi	a0,a0,-436 # 80008118 <digits+0xd8>
    800012d4:	fffff097          	auipc	ra,0xfffff
    800012d8:	26a080e7          	jalr	618(ra) # 8000053e <panic>
    800012dc:	00007517          	auipc	a0,0x7
    800012e0:	e4c50513          	addi	a0,a0,-436 # 80008128 <digits+0xe8>
    800012e4:	fffff097          	auipc	ra,0xfffff
    800012e8:	25a080e7          	jalr	602(ra) # 8000053e <panic>
    800012ec:	00007517          	auipc	a0,0x7
    800012f0:	e5450513          	addi	a0,a0,-428 # 80008140 <digits+0x100>
    800012f4:	fffff097          	auipc	ra,0xfffff
    800012f8:	24a080e7          	jalr	586(ra) # 8000053e <panic>
    800012fc:	8129                	srli	a0,a0,0xa
    800012fe:	0532                	slli	a0,a0,0xc
    80001300:	fffff097          	auipc	ra,0xfffff
    80001304:	6f8080e7          	jalr	1784(ra) # 800009f8 <kfree>
    80001308:	0004b023          	sd	zero,0(s1)
    8000130c:	995a                	add	s2,s2,s6
    8000130e:	f9397ce3          	bgeu	s2,s3,800012a6 <uvmunmap+0x30>
    80001312:	4601                	li	a2,0
    80001314:	85ca                	mv	a1,s2
    80001316:	8552                	mv	a0,s4
    80001318:	00000097          	auipc	ra,0x0
    8000131c:	cb0080e7          	jalr	-848(ra) # 80000fc8 <walk>
    80001320:	84aa                	mv	s1,a0
    80001322:	d54d                	beqz	a0,800012cc <uvmunmap+0x56>
    80001324:	6108                	ld	a0,0(a0)
    80001326:	00157793          	andi	a5,a0,1
    8000132a:	dbcd                	beqz	a5,800012dc <uvmunmap+0x66>
    8000132c:	3ff57793          	andi	a5,a0,1023
    80001330:	fb778ee3          	beq	a5,s7,800012ec <uvmunmap+0x76>
    80001334:	fc0a8ae3          	beqz	s5,80001308 <uvmunmap+0x92>
    80001338:	b7d1                	j	800012fc <uvmunmap+0x86>

000000008000133a <uvmcreate>:
    8000133a:	1101                	addi	sp,sp,-32
    8000133c:	ec06                	sd	ra,24(sp)
    8000133e:	e822                	sd	s0,16(sp)
    80001340:	e426                	sd	s1,8(sp)
    80001342:	1000                	addi	s0,sp,32
    80001344:	fffff097          	auipc	ra,0xfffff
    80001348:	7b0080e7          	jalr	1968(ra) # 80000af4 <kalloc>
    8000134c:	84aa                	mv	s1,a0
    8000134e:	c519                	beqz	a0,8000135c <uvmcreate+0x22>
    80001350:	6605                	lui	a2,0x1
    80001352:	4581                	li	a1,0
    80001354:	00000097          	auipc	ra,0x0
    80001358:	98c080e7          	jalr	-1652(ra) # 80000ce0 <memset>
    8000135c:	8526                	mv	a0,s1
    8000135e:	60e2                	ld	ra,24(sp)
    80001360:	6442                	ld	s0,16(sp)
    80001362:	64a2                	ld	s1,8(sp)
    80001364:	6105                	addi	sp,sp,32
    80001366:	8082                	ret

0000000080001368 <uvminit>:
    80001368:	7179                	addi	sp,sp,-48
    8000136a:	f406                	sd	ra,40(sp)
    8000136c:	f022                	sd	s0,32(sp)
    8000136e:	ec26                	sd	s1,24(sp)
    80001370:	e84a                	sd	s2,16(sp)
    80001372:	e44e                	sd	s3,8(sp)
    80001374:	e052                	sd	s4,0(sp)
    80001376:	1800                	addi	s0,sp,48
    80001378:	6785                	lui	a5,0x1
    8000137a:	04f67863          	bgeu	a2,a5,800013ca <uvminit+0x62>
    8000137e:	8a2a                	mv	s4,a0
    80001380:	89ae                	mv	s3,a1
    80001382:	84b2                	mv	s1,a2
    80001384:	fffff097          	auipc	ra,0xfffff
    80001388:	770080e7          	jalr	1904(ra) # 80000af4 <kalloc>
    8000138c:	892a                	mv	s2,a0
    8000138e:	6605                	lui	a2,0x1
    80001390:	4581                	li	a1,0
    80001392:	00000097          	auipc	ra,0x0
    80001396:	94e080e7          	jalr	-1714(ra) # 80000ce0 <memset>
    8000139a:	4779                	li	a4,30
    8000139c:	86ca                	mv	a3,s2
    8000139e:	6605                	lui	a2,0x1
    800013a0:	4581                	li	a1,0
    800013a2:	8552                	mv	a0,s4
    800013a4:	00000097          	auipc	ra,0x0
    800013a8:	d0c080e7          	jalr	-756(ra) # 800010b0 <mappages>
    800013ac:	8626                	mv	a2,s1
    800013ae:	85ce                	mv	a1,s3
    800013b0:	854a                	mv	a0,s2
    800013b2:	00000097          	auipc	ra,0x0
    800013b6:	98e080e7          	jalr	-1650(ra) # 80000d40 <memmove>
    800013ba:	70a2                	ld	ra,40(sp)
    800013bc:	7402                	ld	s0,32(sp)
    800013be:	64e2                	ld	s1,24(sp)
    800013c0:	6942                	ld	s2,16(sp)
    800013c2:	69a2                	ld	s3,8(sp)
    800013c4:	6a02                	ld	s4,0(sp)
    800013c6:	6145                	addi	sp,sp,48
    800013c8:	8082                	ret
    800013ca:	00007517          	auipc	a0,0x7
    800013ce:	d8e50513          	addi	a0,a0,-626 # 80008158 <digits+0x118>
    800013d2:	fffff097          	auipc	ra,0xfffff
    800013d6:	16c080e7          	jalr	364(ra) # 8000053e <panic>

00000000800013da <uvmdealloc>:
    800013da:	1101                	addi	sp,sp,-32
    800013dc:	ec06                	sd	ra,24(sp)
    800013de:	e822                	sd	s0,16(sp)
    800013e0:	e426                	sd	s1,8(sp)
    800013e2:	1000                	addi	s0,sp,32
    800013e4:	84ae                	mv	s1,a1
    800013e6:	00b67d63          	bgeu	a2,a1,80001400 <uvmdealloc+0x26>
    800013ea:	84b2                	mv	s1,a2
    800013ec:	6785                	lui	a5,0x1
    800013ee:	17fd                	addi	a5,a5,-1
    800013f0:	00f60733          	add	a4,a2,a5
    800013f4:	767d                	lui	a2,0xfffff
    800013f6:	8f71                	and	a4,a4,a2
    800013f8:	97ae                	add	a5,a5,a1
    800013fa:	8ff1                	and	a5,a5,a2
    800013fc:	00f76863          	bltu	a4,a5,8000140c <uvmdealloc+0x32>
    80001400:	8526                	mv	a0,s1
    80001402:	60e2                	ld	ra,24(sp)
    80001404:	6442                	ld	s0,16(sp)
    80001406:	64a2                	ld	s1,8(sp)
    80001408:	6105                	addi	sp,sp,32
    8000140a:	8082                	ret
    8000140c:	8f99                	sub	a5,a5,a4
    8000140e:	83b1                	srli	a5,a5,0xc
    80001410:	4685                	li	a3,1
    80001412:	0007861b          	sext.w	a2,a5
    80001416:	85ba                	mv	a1,a4
    80001418:	00000097          	auipc	ra,0x0
    8000141c:	e5e080e7          	jalr	-418(ra) # 80001276 <uvmunmap>
    80001420:	b7c5                	j	80001400 <uvmdealloc+0x26>

0000000080001422 <uvmalloc>:
    80001422:	0ab66163          	bltu	a2,a1,800014c4 <uvmalloc+0xa2>
    80001426:	7139                	addi	sp,sp,-64
    80001428:	fc06                	sd	ra,56(sp)
    8000142a:	f822                	sd	s0,48(sp)
    8000142c:	f426                	sd	s1,40(sp)
    8000142e:	f04a                	sd	s2,32(sp)
    80001430:	ec4e                	sd	s3,24(sp)
    80001432:	e852                	sd	s4,16(sp)
    80001434:	e456                	sd	s5,8(sp)
    80001436:	0080                	addi	s0,sp,64
    80001438:	8aaa                	mv	s5,a0
    8000143a:	8a32                	mv	s4,a2
    8000143c:	6985                	lui	s3,0x1
    8000143e:	19fd                	addi	s3,s3,-1
    80001440:	95ce                	add	a1,a1,s3
    80001442:	79fd                	lui	s3,0xfffff
    80001444:	0135f9b3          	and	s3,a1,s3
    80001448:	08c9f063          	bgeu	s3,a2,800014c8 <uvmalloc+0xa6>
    8000144c:	894e                	mv	s2,s3
    8000144e:	fffff097          	auipc	ra,0xfffff
    80001452:	6a6080e7          	jalr	1702(ra) # 80000af4 <kalloc>
    80001456:	84aa                	mv	s1,a0
    80001458:	c51d                	beqz	a0,80001486 <uvmalloc+0x64>
    8000145a:	6605                	lui	a2,0x1
    8000145c:	4581                	li	a1,0
    8000145e:	00000097          	auipc	ra,0x0
    80001462:	882080e7          	jalr	-1918(ra) # 80000ce0 <memset>
    80001466:	4779                	li	a4,30
    80001468:	86a6                	mv	a3,s1
    8000146a:	6605                	lui	a2,0x1
    8000146c:	85ca                	mv	a1,s2
    8000146e:	8556                	mv	a0,s5
    80001470:	00000097          	auipc	ra,0x0
    80001474:	c40080e7          	jalr	-960(ra) # 800010b0 <mappages>
    80001478:	e905                	bnez	a0,800014a8 <uvmalloc+0x86>
    8000147a:	6785                	lui	a5,0x1
    8000147c:	993e                	add	s2,s2,a5
    8000147e:	fd4968e3          	bltu	s2,s4,8000144e <uvmalloc+0x2c>
    80001482:	8552                	mv	a0,s4
    80001484:	a809                	j	80001496 <uvmalloc+0x74>
    80001486:	864e                	mv	a2,s3
    80001488:	85ca                	mv	a1,s2
    8000148a:	8556                	mv	a0,s5
    8000148c:	00000097          	auipc	ra,0x0
    80001490:	f4e080e7          	jalr	-178(ra) # 800013da <uvmdealloc>
    80001494:	4501                	li	a0,0
    80001496:	70e2                	ld	ra,56(sp)
    80001498:	7442                	ld	s0,48(sp)
    8000149a:	74a2                	ld	s1,40(sp)
    8000149c:	7902                	ld	s2,32(sp)
    8000149e:	69e2                	ld	s3,24(sp)
    800014a0:	6a42                	ld	s4,16(sp)
    800014a2:	6aa2                	ld	s5,8(sp)
    800014a4:	6121                	addi	sp,sp,64
    800014a6:	8082                	ret
    800014a8:	8526                	mv	a0,s1
    800014aa:	fffff097          	auipc	ra,0xfffff
    800014ae:	54e080e7          	jalr	1358(ra) # 800009f8 <kfree>
    800014b2:	864e                	mv	a2,s3
    800014b4:	85ca                	mv	a1,s2
    800014b6:	8556                	mv	a0,s5
    800014b8:	00000097          	auipc	ra,0x0
    800014bc:	f22080e7          	jalr	-222(ra) # 800013da <uvmdealloc>
    800014c0:	4501                	li	a0,0
    800014c2:	bfd1                	j	80001496 <uvmalloc+0x74>
    800014c4:	852e                	mv	a0,a1
    800014c6:	8082                	ret
    800014c8:	8532                	mv	a0,a2
    800014ca:	b7f1                	j	80001496 <uvmalloc+0x74>

00000000800014cc <freewalk>:
    800014cc:	7179                	addi	sp,sp,-48
    800014ce:	f406                	sd	ra,40(sp)
    800014d0:	f022                	sd	s0,32(sp)
    800014d2:	ec26                	sd	s1,24(sp)
    800014d4:	e84a                	sd	s2,16(sp)
    800014d6:	e44e                	sd	s3,8(sp)
    800014d8:	e052                	sd	s4,0(sp)
    800014da:	1800                	addi	s0,sp,48
    800014dc:	8a2a                	mv	s4,a0
    800014de:	84aa                	mv	s1,a0
    800014e0:	6905                	lui	s2,0x1
    800014e2:	992a                	add	s2,s2,a0
    800014e4:	4985                	li	s3,1
    800014e6:	a821                	j	800014fe <freewalk+0x32>
    800014e8:	8129                	srli	a0,a0,0xa
    800014ea:	0532                	slli	a0,a0,0xc
    800014ec:	00000097          	auipc	ra,0x0
    800014f0:	fe0080e7          	jalr	-32(ra) # 800014cc <freewalk>
    800014f4:	0004b023          	sd	zero,0(s1)
    800014f8:	04a1                	addi	s1,s1,8
    800014fa:	03248163          	beq	s1,s2,8000151c <freewalk+0x50>
    800014fe:	6088                	ld	a0,0(s1)
    80001500:	00f57793          	andi	a5,a0,15
    80001504:	ff3782e3          	beq	a5,s3,800014e8 <freewalk+0x1c>
    80001508:	8905                	andi	a0,a0,1
    8000150a:	d57d                	beqz	a0,800014f8 <freewalk+0x2c>
    8000150c:	00007517          	auipc	a0,0x7
    80001510:	c6c50513          	addi	a0,a0,-916 # 80008178 <digits+0x138>
    80001514:	fffff097          	auipc	ra,0xfffff
    80001518:	02a080e7          	jalr	42(ra) # 8000053e <panic>
    8000151c:	8552                	mv	a0,s4
    8000151e:	fffff097          	auipc	ra,0xfffff
    80001522:	4da080e7          	jalr	1242(ra) # 800009f8 <kfree>
    80001526:	70a2                	ld	ra,40(sp)
    80001528:	7402                	ld	s0,32(sp)
    8000152a:	64e2                	ld	s1,24(sp)
    8000152c:	6942                	ld	s2,16(sp)
    8000152e:	69a2                	ld	s3,8(sp)
    80001530:	6a02                	ld	s4,0(sp)
    80001532:	6145                	addi	sp,sp,48
    80001534:	8082                	ret

0000000080001536 <uvmfree>:
    80001536:	1101                	addi	sp,sp,-32
    80001538:	ec06                	sd	ra,24(sp)
    8000153a:	e822                	sd	s0,16(sp)
    8000153c:	e426                	sd	s1,8(sp)
    8000153e:	1000                	addi	s0,sp,32
    80001540:	84aa                	mv	s1,a0
    80001542:	e999                	bnez	a1,80001558 <uvmfree+0x22>
    80001544:	8526                	mv	a0,s1
    80001546:	00000097          	auipc	ra,0x0
    8000154a:	f86080e7          	jalr	-122(ra) # 800014cc <freewalk>
    8000154e:	60e2                	ld	ra,24(sp)
    80001550:	6442                	ld	s0,16(sp)
    80001552:	64a2                	ld	s1,8(sp)
    80001554:	6105                	addi	sp,sp,32
    80001556:	8082                	ret
    80001558:	6605                	lui	a2,0x1
    8000155a:	167d                	addi	a2,a2,-1
    8000155c:	962e                	add	a2,a2,a1
    8000155e:	4685                	li	a3,1
    80001560:	8231                	srli	a2,a2,0xc
    80001562:	4581                	li	a1,0
    80001564:	00000097          	auipc	ra,0x0
    80001568:	d12080e7          	jalr	-750(ra) # 80001276 <uvmunmap>
    8000156c:	bfe1                	j	80001544 <uvmfree+0xe>

000000008000156e <uvmcopy>:
    8000156e:	c679                	beqz	a2,8000163c <uvmcopy+0xce>
    80001570:	715d                	addi	sp,sp,-80
    80001572:	e486                	sd	ra,72(sp)
    80001574:	e0a2                	sd	s0,64(sp)
    80001576:	fc26                	sd	s1,56(sp)
    80001578:	f84a                	sd	s2,48(sp)
    8000157a:	f44e                	sd	s3,40(sp)
    8000157c:	f052                	sd	s4,32(sp)
    8000157e:	ec56                	sd	s5,24(sp)
    80001580:	e85a                	sd	s6,16(sp)
    80001582:	e45e                	sd	s7,8(sp)
    80001584:	0880                	addi	s0,sp,80
    80001586:	8b2a                	mv	s6,a0
    80001588:	8aae                	mv	s5,a1
    8000158a:	8a32                	mv	s4,a2
    8000158c:	4981                	li	s3,0
    8000158e:	4601                	li	a2,0
    80001590:	85ce                	mv	a1,s3
    80001592:	855a                	mv	a0,s6
    80001594:	00000097          	auipc	ra,0x0
    80001598:	a34080e7          	jalr	-1484(ra) # 80000fc8 <walk>
    8000159c:	c531                	beqz	a0,800015e8 <uvmcopy+0x7a>
    8000159e:	6118                	ld	a4,0(a0)
    800015a0:	00177793          	andi	a5,a4,1
    800015a4:	cbb1                	beqz	a5,800015f8 <uvmcopy+0x8a>
    800015a6:	00a75593          	srli	a1,a4,0xa
    800015aa:	00c59b93          	slli	s7,a1,0xc
    800015ae:	3ff77493          	andi	s1,a4,1023
    800015b2:	fffff097          	auipc	ra,0xfffff
    800015b6:	542080e7          	jalr	1346(ra) # 80000af4 <kalloc>
    800015ba:	892a                	mv	s2,a0
    800015bc:	c939                	beqz	a0,80001612 <uvmcopy+0xa4>
    800015be:	6605                	lui	a2,0x1
    800015c0:	85de                	mv	a1,s7
    800015c2:	fffff097          	auipc	ra,0xfffff
    800015c6:	77e080e7          	jalr	1918(ra) # 80000d40 <memmove>
    800015ca:	8726                	mv	a4,s1
    800015cc:	86ca                	mv	a3,s2
    800015ce:	6605                	lui	a2,0x1
    800015d0:	85ce                	mv	a1,s3
    800015d2:	8556                	mv	a0,s5
    800015d4:	00000097          	auipc	ra,0x0
    800015d8:	adc080e7          	jalr	-1316(ra) # 800010b0 <mappages>
    800015dc:	e515                	bnez	a0,80001608 <uvmcopy+0x9a>
    800015de:	6785                	lui	a5,0x1
    800015e0:	99be                	add	s3,s3,a5
    800015e2:	fb49e6e3          	bltu	s3,s4,8000158e <uvmcopy+0x20>
    800015e6:	a081                	j	80001626 <uvmcopy+0xb8>
    800015e8:	00007517          	auipc	a0,0x7
    800015ec:	ba050513          	addi	a0,a0,-1120 # 80008188 <digits+0x148>
    800015f0:	fffff097          	auipc	ra,0xfffff
    800015f4:	f4e080e7          	jalr	-178(ra) # 8000053e <panic>
    800015f8:	00007517          	auipc	a0,0x7
    800015fc:	bb050513          	addi	a0,a0,-1104 # 800081a8 <digits+0x168>
    80001600:	fffff097          	auipc	ra,0xfffff
    80001604:	f3e080e7          	jalr	-194(ra) # 8000053e <panic>
    80001608:	854a                	mv	a0,s2
    8000160a:	fffff097          	auipc	ra,0xfffff
    8000160e:	3ee080e7          	jalr	1006(ra) # 800009f8 <kfree>
    80001612:	4685                	li	a3,1
    80001614:	00c9d613          	srli	a2,s3,0xc
    80001618:	4581                	li	a1,0
    8000161a:	8556                	mv	a0,s5
    8000161c:	00000097          	auipc	ra,0x0
    80001620:	c5a080e7          	jalr	-934(ra) # 80001276 <uvmunmap>
    80001624:	557d                	li	a0,-1
    80001626:	60a6                	ld	ra,72(sp)
    80001628:	6406                	ld	s0,64(sp)
    8000162a:	74e2                	ld	s1,56(sp)
    8000162c:	7942                	ld	s2,48(sp)
    8000162e:	79a2                	ld	s3,40(sp)
    80001630:	7a02                	ld	s4,32(sp)
    80001632:	6ae2                	ld	s5,24(sp)
    80001634:	6b42                	ld	s6,16(sp)
    80001636:	6ba2                	ld	s7,8(sp)
    80001638:	6161                	addi	sp,sp,80
    8000163a:	8082                	ret
    8000163c:	4501                	li	a0,0
    8000163e:	8082                	ret

0000000080001640 <uvmclear>:
    80001640:	1141                	addi	sp,sp,-16
    80001642:	e406                	sd	ra,8(sp)
    80001644:	e022                	sd	s0,0(sp)
    80001646:	0800                	addi	s0,sp,16
    80001648:	4601                	li	a2,0
    8000164a:	00000097          	auipc	ra,0x0
    8000164e:	97e080e7          	jalr	-1666(ra) # 80000fc8 <walk>
    80001652:	c901                	beqz	a0,80001662 <uvmclear+0x22>
    80001654:	611c                	ld	a5,0(a0)
    80001656:	9bbd                	andi	a5,a5,-17
    80001658:	e11c                	sd	a5,0(a0)
    8000165a:	60a2                	ld	ra,8(sp)
    8000165c:	6402                	ld	s0,0(sp)
    8000165e:	0141                	addi	sp,sp,16
    80001660:	8082                	ret
    80001662:	00007517          	auipc	a0,0x7
    80001666:	b6650513          	addi	a0,a0,-1178 # 800081c8 <digits+0x188>
    8000166a:	fffff097          	auipc	ra,0xfffff
    8000166e:	ed4080e7          	jalr	-300(ra) # 8000053e <panic>

0000000080001672 <copyout>:
    80001672:	c6bd                	beqz	a3,800016e0 <copyout+0x6e>
    80001674:	715d                	addi	sp,sp,-80
    80001676:	e486                	sd	ra,72(sp)
    80001678:	e0a2                	sd	s0,64(sp)
    8000167a:	fc26                	sd	s1,56(sp)
    8000167c:	f84a                	sd	s2,48(sp)
    8000167e:	f44e                	sd	s3,40(sp)
    80001680:	f052                	sd	s4,32(sp)
    80001682:	ec56                	sd	s5,24(sp)
    80001684:	e85a                	sd	s6,16(sp)
    80001686:	e45e                	sd	s7,8(sp)
    80001688:	e062                	sd	s8,0(sp)
    8000168a:	0880                	addi	s0,sp,80
    8000168c:	8b2a                	mv	s6,a0
    8000168e:	8c2e                	mv	s8,a1
    80001690:	8a32                	mv	s4,a2
    80001692:	89b6                	mv	s3,a3
    80001694:	7bfd                	lui	s7,0xfffff
    80001696:	6a85                	lui	s5,0x1
    80001698:	a015                	j	800016bc <copyout+0x4a>
    8000169a:	9562                	add	a0,a0,s8
    8000169c:	0004861b          	sext.w	a2,s1
    800016a0:	85d2                	mv	a1,s4
    800016a2:	41250533          	sub	a0,a0,s2
    800016a6:	fffff097          	auipc	ra,0xfffff
    800016aa:	69a080e7          	jalr	1690(ra) # 80000d40 <memmove>
    800016ae:	409989b3          	sub	s3,s3,s1
    800016b2:	9a26                	add	s4,s4,s1
    800016b4:	01590c33          	add	s8,s2,s5
    800016b8:	02098263          	beqz	s3,800016dc <copyout+0x6a>
    800016bc:	017c7933          	and	s2,s8,s7
    800016c0:	85ca                	mv	a1,s2
    800016c2:	855a                	mv	a0,s6
    800016c4:	00000097          	auipc	ra,0x0
    800016c8:	9aa080e7          	jalr	-1622(ra) # 8000106e <walkaddr>
    800016cc:	cd01                	beqz	a0,800016e4 <copyout+0x72>
    800016ce:	418904b3          	sub	s1,s2,s8
    800016d2:	94d6                	add	s1,s1,s5
    800016d4:	fc99f3e3          	bgeu	s3,s1,8000169a <copyout+0x28>
    800016d8:	84ce                	mv	s1,s3
    800016da:	b7c1                	j	8000169a <copyout+0x28>
    800016dc:	4501                	li	a0,0
    800016de:	a021                	j	800016e6 <copyout+0x74>
    800016e0:	4501                	li	a0,0
    800016e2:	8082                	ret
    800016e4:	557d                	li	a0,-1
    800016e6:	60a6                	ld	ra,72(sp)
    800016e8:	6406                	ld	s0,64(sp)
    800016ea:	74e2                	ld	s1,56(sp)
    800016ec:	7942                	ld	s2,48(sp)
    800016ee:	79a2                	ld	s3,40(sp)
    800016f0:	7a02                	ld	s4,32(sp)
    800016f2:	6ae2                	ld	s5,24(sp)
    800016f4:	6b42                	ld	s6,16(sp)
    800016f6:	6ba2                	ld	s7,8(sp)
    800016f8:	6c02                	ld	s8,0(sp)
    800016fa:	6161                	addi	sp,sp,80
    800016fc:	8082                	ret

00000000800016fe <copyin>:
    800016fe:	c6bd                	beqz	a3,8000176c <copyin+0x6e>
    80001700:	715d                	addi	sp,sp,-80
    80001702:	e486                	sd	ra,72(sp)
    80001704:	e0a2                	sd	s0,64(sp)
    80001706:	fc26                	sd	s1,56(sp)
    80001708:	f84a                	sd	s2,48(sp)
    8000170a:	f44e                	sd	s3,40(sp)
    8000170c:	f052                	sd	s4,32(sp)
    8000170e:	ec56                	sd	s5,24(sp)
    80001710:	e85a                	sd	s6,16(sp)
    80001712:	e45e                	sd	s7,8(sp)
    80001714:	e062                	sd	s8,0(sp)
    80001716:	0880                	addi	s0,sp,80
    80001718:	8b2a                	mv	s6,a0
    8000171a:	8a2e                	mv	s4,a1
    8000171c:	8c32                	mv	s8,a2
    8000171e:	89b6                	mv	s3,a3
    80001720:	7bfd                	lui	s7,0xfffff
    80001722:	6a85                	lui	s5,0x1
    80001724:	a015                	j	80001748 <copyin+0x4a>
    80001726:	9562                	add	a0,a0,s8
    80001728:	0004861b          	sext.w	a2,s1
    8000172c:	412505b3          	sub	a1,a0,s2
    80001730:	8552                	mv	a0,s4
    80001732:	fffff097          	auipc	ra,0xfffff
    80001736:	60e080e7          	jalr	1550(ra) # 80000d40 <memmove>
    8000173a:	409989b3          	sub	s3,s3,s1
    8000173e:	9a26                	add	s4,s4,s1
    80001740:	01590c33          	add	s8,s2,s5
    80001744:	02098263          	beqz	s3,80001768 <copyin+0x6a>
    80001748:	017c7933          	and	s2,s8,s7
    8000174c:	85ca                	mv	a1,s2
    8000174e:	855a                	mv	a0,s6
    80001750:	00000097          	auipc	ra,0x0
    80001754:	91e080e7          	jalr	-1762(ra) # 8000106e <walkaddr>
    80001758:	cd01                	beqz	a0,80001770 <copyin+0x72>
    8000175a:	418904b3          	sub	s1,s2,s8
    8000175e:	94d6                	add	s1,s1,s5
    80001760:	fc99f3e3          	bgeu	s3,s1,80001726 <copyin+0x28>
    80001764:	84ce                	mv	s1,s3
    80001766:	b7c1                	j	80001726 <copyin+0x28>
    80001768:	4501                	li	a0,0
    8000176a:	a021                	j	80001772 <copyin+0x74>
    8000176c:	4501                	li	a0,0
    8000176e:	8082                	ret
    80001770:	557d                	li	a0,-1
    80001772:	60a6                	ld	ra,72(sp)
    80001774:	6406                	ld	s0,64(sp)
    80001776:	74e2                	ld	s1,56(sp)
    80001778:	7942                	ld	s2,48(sp)
    8000177a:	79a2                	ld	s3,40(sp)
    8000177c:	7a02                	ld	s4,32(sp)
    8000177e:	6ae2                	ld	s5,24(sp)
    80001780:	6b42                	ld	s6,16(sp)
    80001782:	6ba2                	ld	s7,8(sp)
    80001784:	6c02                	ld	s8,0(sp)
    80001786:	6161                	addi	sp,sp,80
    80001788:	8082                	ret

000000008000178a <copyinstr>:
    8000178a:	c6c5                	beqz	a3,80001832 <copyinstr+0xa8>
    8000178c:	715d                	addi	sp,sp,-80
    8000178e:	e486                	sd	ra,72(sp)
    80001790:	e0a2                	sd	s0,64(sp)
    80001792:	fc26                	sd	s1,56(sp)
    80001794:	f84a                	sd	s2,48(sp)
    80001796:	f44e                	sd	s3,40(sp)
    80001798:	f052                	sd	s4,32(sp)
    8000179a:	ec56                	sd	s5,24(sp)
    8000179c:	e85a                	sd	s6,16(sp)
    8000179e:	e45e                	sd	s7,8(sp)
    800017a0:	0880                	addi	s0,sp,80
    800017a2:	8a2a                	mv	s4,a0
    800017a4:	8b2e                	mv	s6,a1
    800017a6:	8bb2                	mv	s7,a2
    800017a8:	84b6                	mv	s1,a3
    800017aa:	7afd                	lui	s5,0xfffff
    800017ac:	6985                	lui	s3,0x1
    800017ae:	a035                	j	800017da <copyinstr+0x50>
    800017b0:	00078023          	sb	zero,0(a5) # 1000 <_entry-0x7ffff000>
    800017b4:	4785                	li	a5,1
    800017b6:	0017b793          	seqz	a5,a5
    800017ba:	40f00533          	neg	a0,a5
    800017be:	60a6                	ld	ra,72(sp)
    800017c0:	6406                	ld	s0,64(sp)
    800017c2:	74e2                	ld	s1,56(sp)
    800017c4:	7942                	ld	s2,48(sp)
    800017c6:	79a2                	ld	s3,40(sp)
    800017c8:	7a02                	ld	s4,32(sp)
    800017ca:	6ae2                	ld	s5,24(sp)
    800017cc:	6b42                	ld	s6,16(sp)
    800017ce:	6ba2                	ld	s7,8(sp)
    800017d0:	6161                	addi	sp,sp,80
    800017d2:	8082                	ret
    800017d4:	01390bb3          	add	s7,s2,s3
    800017d8:	c8a9                	beqz	s1,8000182a <copyinstr+0xa0>
    800017da:	015bf933          	and	s2,s7,s5
    800017de:	85ca                	mv	a1,s2
    800017e0:	8552                	mv	a0,s4
    800017e2:	00000097          	auipc	ra,0x0
    800017e6:	88c080e7          	jalr	-1908(ra) # 8000106e <walkaddr>
    800017ea:	c131                	beqz	a0,8000182e <copyinstr+0xa4>
    800017ec:	41790833          	sub	a6,s2,s7
    800017f0:	984e                	add	a6,a6,s3
    800017f2:	0104f363          	bgeu	s1,a6,800017f8 <copyinstr+0x6e>
    800017f6:	8826                	mv	a6,s1
    800017f8:	955e                	add	a0,a0,s7
    800017fa:	41250533          	sub	a0,a0,s2
    800017fe:	fc080be3          	beqz	a6,800017d4 <copyinstr+0x4a>
    80001802:	985a                	add	a6,a6,s6
    80001804:	87da                	mv	a5,s6
    80001806:	41650633          	sub	a2,a0,s6
    8000180a:	14fd                	addi	s1,s1,-1
    8000180c:	9b26                	add	s6,s6,s1
    8000180e:	00f60733          	add	a4,a2,a5
    80001812:	00074703          	lbu	a4,0(a4)
    80001816:	df49                	beqz	a4,800017b0 <copyinstr+0x26>
    80001818:	00e78023          	sb	a4,0(a5)
    8000181c:	40fb04b3          	sub	s1,s6,a5
    80001820:	0785                	addi	a5,a5,1
    80001822:	ff0796e3          	bne	a5,a6,8000180e <copyinstr+0x84>
    80001826:	8b42                	mv	s6,a6
    80001828:	b775                	j	800017d4 <copyinstr+0x4a>
    8000182a:	4781                	li	a5,0
    8000182c:	b769                	j	800017b6 <copyinstr+0x2c>
    8000182e:	557d                	li	a0,-1
    80001830:	b779                	j	800017be <copyinstr+0x34>
    80001832:	4781                	li	a5,0
    80001834:	0017b793          	seqz	a5,a5
    80001838:	40f00533          	neg	a0,a5
    8000183c:	8082                	ret

000000008000183e <proc_mapstacks>:
    8000183e:	7139                	addi	sp,sp,-64
    80001840:	fc06                	sd	ra,56(sp)
    80001842:	f822                	sd	s0,48(sp)
    80001844:	f426                	sd	s1,40(sp)
    80001846:	f04a                	sd	s2,32(sp)
    80001848:	ec4e                	sd	s3,24(sp)
    8000184a:	e852                	sd	s4,16(sp)
    8000184c:	e456                	sd	s5,8(sp)
    8000184e:	e05a                	sd	s6,0(sp)
    80001850:	0080                	addi	s0,sp,64
    80001852:	89aa                	mv	s3,a0
    80001854:	00010497          	auipc	s1,0x10
    80001858:	e7c48493          	addi	s1,s1,-388 # 800116d0 <proc>
    8000185c:	8b26                	mv	s6,s1
    8000185e:	00006a97          	auipc	s5,0x6
    80001862:	7a2a8a93          	addi	s5,s5,1954 # 80008000 <etext>
    80001866:	04000937          	lui	s2,0x4000
    8000186a:	197d                	addi	s2,s2,-1
    8000186c:	0932                	slli	s2,s2,0xc
    8000186e:	00016a17          	auipc	s4,0x16
    80001872:	062a0a13          	addi	s4,s4,98 # 800178d0 <tickslock>
    80001876:	fffff097          	auipc	ra,0xfffff
    8000187a:	27e080e7          	jalr	638(ra) # 80000af4 <kalloc>
    8000187e:	862a                	mv	a2,a0
    80001880:	c131                	beqz	a0,800018c4 <proc_mapstacks+0x86>
    80001882:	416485b3          	sub	a1,s1,s6
    80001886:	858d                	srai	a1,a1,0x3
    80001888:	000ab783          	ld	a5,0(s5)
    8000188c:	02f585b3          	mul	a1,a1,a5
    80001890:	2585                	addiw	a1,a1,1
    80001892:	00d5959b          	slliw	a1,a1,0xd
    80001896:	4719                	li	a4,6
    80001898:	6685                	lui	a3,0x1
    8000189a:	40b905b3          	sub	a1,s2,a1
    8000189e:	854e                	mv	a0,s3
    800018a0:	00000097          	auipc	ra,0x0
    800018a4:	8b0080e7          	jalr	-1872(ra) # 80001150 <kvmmap>
    800018a8:	18848493          	addi	s1,s1,392
    800018ac:	fd4495e3          	bne	s1,s4,80001876 <proc_mapstacks+0x38>
    800018b0:	70e2                	ld	ra,56(sp)
    800018b2:	7442                	ld	s0,48(sp)
    800018b4:	74a2                	ld	s1,40(sp)
    800018b6:	7902                	ld	s2,32(sp)
    800018b8:	69e2                	ld	s3,24(sp)
    800018ba:	6a42                	ld	s4,16(sp)
    800018bc:	6aa2                	ld	s5,8(sp)
    800018be:	6b02                	ld	s6,0(sp)
    800018c0:	6121                	addi	sp,sp,64
    800018c2:	8082                	ret
    800018c4:	00007517          	auipc	a0,0x7
    800018c8:	91450513          	addi	a0,a0,-1772 # 800081d8 <digits+0x198>
    800018cc:	fffff097          	auipc	ra,0xfffff
    800018d0:	c72080e7          	jalr	-910(ra) # 8000053e <panic>

00000000800018d4 <procinit>:
    800018d4:	7139                	addi	sp,sp,-64
    800018d6:	fc06                	sd	ra,56(sp)
    800018d8:	f822                	sd	s0,48(sp)
    800018da:	f426                	sd	s1,40(sp)
    800018dc:	f04a                	sd	s2,32(sp)
    800018de:	ec4e                	sd	s3,24(sp)
    800018e0:	e852                	sd	s4,16(sp)
    800018e2:	e456                	sd	s5,8(sp)
    800018e4:	e05a                	sd	s6,0(sp)
    800018e6:	0080                	addi	s0,sp,64
    800018e8:	00007597          	auipc	a1,0x7
    800018ec:	8f858593          	addi	a1,a1,-1800 # 800081e0 <digits+0x1a0>
    800018f0:	00010517          	auipc	a0,0x10
    800018f4:	9b050513          	addi	a0,a0,-1616 # 800112a0 <pid_lock>
    800018f8:	fffff097          	auipc	ra,0xfffff
    800018fc:	25c080e7          	jalr	604(ra) # 80000b54 <initlock>
    80001900:	00007597          	auipc	a1,0x7
    80001904:	8e858593          	addi	a1,a1,-1816 # 800081e8 <digits+0x1a8>
    80001908:	00010517          	auipc	a0,0x10
    8000190c:	9b050513          	addi	a0,a0,-1616 # 800112b8 <wait_lock>
    80001910:	fffff097          	auipc	ra,0xfffff
    80001914:	244080e7          	jalr	580(ra) # 80000b54 <initlock>
    80001918:	00010497          	auipc	s1,0x10
    8000191c:	db848493          	addi	s1,s1,-584 # 800116d0 <proc>
    80001920:	00007b17          	auipc	s6,0x7
    80001924:	8d8b0b13          	addi	s6,s6,-1832 # 800081f8 <digits+0x1b8>
    80001928:	8aa6                	mv	s5,s1
    8000192a:	00006a17          	auipc	s4,0x6
    8000192e:	6d6a0a13          	addi	s4,s4,1750 # 80008000 <etext>
    80001932:	04000937          	lui	s2,0x4000
    80001936:	197d                	addi	s2,s2,-1
    80001938:	0932                	slli	s2,s2,0xc
    8000193a:	00016997          	auipc	s3,0x16
    8000193e:	f9698993          	addi	s3,s3,-106 # 800178d0 <tickslock>
    80001942:	85da                	mv	a1,s6
    80001944:	8526                	mv	a0,s1
    80001946:	fffff097          	auipc	ra,0xfffff
    8000194a:	20e080e7          	jalr	526(ra) # 80000b54 <initlock>
    8000194e:	415487b3          	sub	a5,s1,s5
    80001952:	878d                	srai	a5,a5,0x3
    80001954:	000a3703          	ld	a4,0(s4)
    80001958:	02e787b3          	mul	a5,a5,a4
    8000195c:	2785                	addiw	a5,a5,1
    8000195e:	00d7979b          	slliw	a5,a5,0xd
    80001962:	40f907b3          	sub	a5,s2,a5
    80001966:	e0bc                	sd	a5,64(s1)
    80001968:	18848493          	addi	s1,s1,392
    8000196c:	fd349be3          	bne	s1,s3,80001942 <procinit+0x6e>
    80001970:	70e2                	ld	ra,56(sp)
    80001972:	7442                	ld	s0,48(sp)
    80001974:	74a2                	ld	s1,40(sp)
    80001976:	7902                	ld	s2,32(sp)
    80001978:	69e2                	ld	s3,24(sp)
    8000197a:	6a42                	ld	s4,16(sp)
    8000197c:	6aa2                	ld	s5,8(sp)
    8000197e:	6b02                	ld	s6,0(sp)
    80001980:	6121                	addi	sp,sp,64
    80001982:	8082                	ret

0000000080001984 <cpuid>:
    80001984:	1141                	addi	sp,sp,-16
    80001986:	e422                	sd	s0,8(sp)
    80001988:	0800                	addi	s0,sp,16
    8000198a:	8512                	mv	a0,tp
    8000198c:	2501                	sext.w	a0,a0
    8000198e:	6422                	ld	s0,8(sp)
    80001990:	0141                	addi	sp,sp,16
    80001992:	8082                	ret

0000000080001994 <mycpu>:
    80001994:	1141                	addi	sp,sp,-16
    80001996:	e422                	sd	s0,8(sp)
    80001998:	0800                	addi	s0,sp,16
    8000199a:	8792                	mv	a5,tp
    8000199c:	2781                	sext.w	a5,a5
    8000199e:	079e                	slli	a5,a5,0x7
    800019a0:	00010517          	auipc	a0,0x10
    800019a4:	93050513          	addi	a0,a0,-1744 # 800112d0 <cpus>
    800019a8:	953e                	add	a0,a0,a5
    800019aa:	6422                	ld	s0,8(sp)
    800019ac:	0141                	addi	sp,sp,16
    800019ae:	8082                	ret

00000000800019b0 <myproc>:
    800019b0:	1101                	addi	sp,sp,-32
    800019b2:	ec06                	sd	ra,24(sp)
    800019b4:	e822                	sd	s0,16(sp)
    800019b6:	e426                	sd	s1,8(sp)
    800019b8:	1000                	addi	s0,sp,32
    800019ba:	fffff097          	auipc	ra,0xfffff
    800019be:	1de080e7          	jalr	478(ra) # 80000b98 <push_off>
    800019c2:	8792                	mv	a5,tp
    800019c4:	2781                	sext.w	a5,a5
    800019c6:	079e                	slli	a5,a5,0x7
    800019c8:	00010717          	auipc	a4,0x10
    800019cc:	8d870713          	addi	a4,a4,-1832 # 800112a0 <pid_lock>
    800019d0:	97ba                	add	a5,a5,a4
    800019d2:	7b84                	ld	s1,48(a5)
    800019d4:	fffff097          	auipc	ra,0xfffff
    800019d8:	264080e7          	jalr	612(ra) # 80000c38 <pop_off>
    800019dc:	8526                	mv	a0,s1
    800019de:	60e2                	ld	ra,24(sp)
    800019e0:	6442                	ld	s0,16(sp)
    800019e2:	64a2                	ld	s1,8(sp)
    800019e4:	6105                	addi	sp,sp,32
    800019e6:	8082                	ret

00000000800019e8 <forkret>:
    800019e8:	1141                	addi	sp,sp,-16
    800019ea:	e406                	sd	ra,8(sp)
    800019ec:	e022                	sd	s0,0(sp)
    800019ee:	0800                	addi	s0,sp,16
    800019f0:	00000097          	auipc	ra,0x0
    800019f4:	fc0080e7          	jalr	-64(ra) # 800019b0 <myproc>
    800019f8:	fffff097          	auipc	ra,0xfffff
    800019fc:	2a0080e7          	jalr	672(ra) # 80000c98 <release>
    80001a00:	00007797          	auipc	a5,0x7
    80001a04:	ed07a783          	lw	a5,-304(a5) # 800088d0 <first.1707>
    80001a08:	eb89                	bnez	a5,80001a1a <forkret+0x32>
    80001a0a:	00001097          	auipc	ra,0x1
    80001a0e:	dba080e7          	jalr	-582(ra) # 800027c4 <usertrapret>
    80001a12:	60a2                	ld	ra,8(sp)
    80001a14:	6402                	ld	s0,0(sp)
    80001a16:	0141                	addi	sp,sp,16
    80001a18:	8082                	ret
    80001a1a:	00007797          	auipc	a5,0x7
    80001a1e:	ea07ab23          	sw	zero,-330(a5) # 800088d0 <first.1707>
    80001a22:	4505                	li	a0,1
    80001a24:	00002097          	auipc	ra,0x2
    80001a28:	b98080e7          	jalr	-1128(ra) # 800035bc <fsinit>
    80001a2c:	bff9                	j	80001a0a <forkret+0x22>

0000000080001a2e <allocpid>:
    80001a2e:	1101                	addi	sp,sp,-32
    80001a30:	ec06                	sd	ra,24(sp)
    80001a32:	e822                	sd	s0,16(sp)
    80001a34:	e426                	sd	s1,8(sp)
    80001a36:	e04a                	sd	s2,0(sp)
    80001a38:	1000                	addi	s0,sp,32
    80001a3a:	00010917          	auipc	s2,0x10
    80001a3e:	86690913          	addi	s2,s2,-1946 # 800112a0 <pid_lock>
    80001a42:	854a                	mv	a0,s2
    80001a44:	fffff097          	auipc	ra,0xfffff
    80001a48:	1a0080e7          	jalr	416(ra) # 80000be4 <acquire>
    80001a4c:	00007797          	auipc	a5,0x7
    80001a50:	e8878793          	addi	a5,a5,-376 # 800088d4 <nextpid>
    80001a54:	4384                	lw	s1,0(a5)
    80001a56:	0014871b          	addiw	a4,s1,1
    80001a5a:	c398                	sw	a4,0(a5)
    80001a5c:	854a                	mv	a0,s2
    80001a5e:	fffff097          	auipc	ra,0xfffff
    80001a62:	23a080e7          	jalr	570(ra) # 80000c98 <release>
    80001a66:	8526                	mv	a0,s1
    80001a68:	60e2                	ld	ra,24(sp)
    80001a6a:	6442                	ld	s0,16(sp)
    80001a6c:	64a2                	ld	s1,8(sp)
    80001a6e:	6902                	ld	s2,0(sp)
    80001a70:	6105                	addi	sp,sp,32
    80001a72:	8082                	ret

0000000080001a74 <proc_pagetable>:
    80001a74:	1101                	addi	sp,sp,-32
    80001a76:	ec06                	sd	ra,24(sp)
    80001a78:	e822                	sd	s0,16(sp)
    80001a7a:	e426                	sd	s1,8(sp)
    80001a7c:	e04a                	sd	s2,0(sp)
    80001a7e:	1000                	addi	s0,sp,32
    80001a80:	892a                	mv	s2,a0
    80001a82:	00000097          	auipc	ra,0x0
    80001a86:	8b8080e7          	jalr	-1864(ra) # 8000133a <uvmcreate>
    80001a8a:	84aa                	mv	s1,a0
    80001a8c:	c121                	beqz	a0,80001acc <proc_pagetable+0x58>
    80001a8e:	4729                	li	a4,10
    80001a90:	00005697          	auipc	a3,0x5
    80001a94:	57068693          	addi	a3,a3,1392 # 80007000 <_trampoline>
    80001a98:	6605                	lui	a2,0x1
    80001a9a:	040005b7          	lui	a1,0x4000
    80001a9e:	15fd                	addi	a1,a1,-1
    80001aa0:	05b2                	slli	a1,a1,0xc
    80001aa2:	fffff097          	auipc	ra,0xfffff
    80001aa6:	60e080e7          	jalr	1550(ra) # 800010b0 <mappages>
    80001aaa:	02054863          	bltz	a0,80001ada <proc_pagetable+0x66>
    80001aae:	4719                	li	a4,6
    80001ab0:	05893683          	ld	a3,88(s2)
    80001ab4:	6605                	lui	a2,0x1
    80001ab6:	020005b7          	lui	a1,0x2000
    80001aba:	15fd                	addi	a1,a1,-1
    80001abc:	05b6                	slli	a1,a1,0xd
    80001abe:	8526                	mv	a0,s1
    80001ac0:	fffff097          	auipc	ra,0xfffff
    80001ac4:	5f0080e7          	jalr	1520(ra) # 800010b0 <mappages>
    80001ac8:	02054163          	bltz	a0,80001aea <proc_pagetable+0x76>
    80001acc:	8526                	mv	a0,s1
    80001ace:	60e2                	ld	ra,24(sp)
    80001ad0:	6442                	ld	s0,16(sp)
    80001ad2:	64a2                	ld	s1,8(sp)
    80001ad4:	6902                	ld	s2,0(sp)
    80001ad6:	6105                	addi	sp,sp,32
    80001ad8:	8082                	ret
    80001ada:	4581                	li	a1,0
    80001adc:	8526                	mv	a0,s1
    80001ade:	00000097          	auipc	ra,0x0
    80001ae2:	a58080e7          	jalr	-1448(ra) # 80001536 <uvmfree>
    80001ae6:	4481                	li	s1,0
    80001ae8:	b7d5                	j	80001acc <proc_pagetable+0x58>
    80001aea:	4681                	li	a3,0
    80001aec:	4605                	li	a2,1
    80001aee:	040005b7          	lui	a1,0x4000
    80001af2:	15fd                	addi	a1,a1,-1
    80001af4:	05b2                	slli	a1,a1,0xc
    80001af6:	8526                	mv	a0,s1
    80001af8:	fffff097          	auipc	ra,0xfffff
    80001afc:	77e080e7          	jalr	1918(ra) # 80001276 <uvmunmap>
    80001b00:	4581                	li	a1,0
    80001b02:	8526                	mv	a0,s1
    80001b04:	00000097          	auipc	ra,0x0
    80001b08:	a32080e7          	jalr	-1486(ra) # 80001536 <uvmfree>
    80001b0c:	4481                	li	s1,0
    80001b0e:	bf7d                	j	80001acc <proc_pagetable+0x58>

0000000080001b10 <proc_freepagetable>:
    80001b10:	1101                	addi	sp,sp,-32
    80001b12:	ec06                	sd	ra,24(sp)
    80001b14:	e822                	sd	s0,16(sp)
    80001b16:	e426                	sd	s1,8(sp)
    80001b18:	e04a                	sd	s2,0(sp)
    80001b1a:	1000                	addi	s0,sp,32
    80001b1c:	84aa                	mv	s1,a0
    80001b1e:	892e                	mv	s2,a1
    80001b20:	4681                	li	a3,0
    80001b22:	4605                	li	a2,1
    80001b24:	040005b7          	lui	a1,0x4000
    80001b28:	15fd                	addi	a1,a1,-1
    80001b2a:	05b2                	slli	a1,a1,0xc
    80001b2c:	fffff097          	auipc	ra,0xfffff
    80001b30:	74a080e7          	jalr	1866(ra) # 80001276 <uvmunmap>
    80001b34:	4681                	li	a3,0
    80001b36:	4605                	li	a2,1
    80001b38:	020005b7          	lui	a1,0x2000
    80001b3c:	15fd                	addi	a1,a1,-1
    80001b3e:	05b6                	slli	a1,a1,0xd
    80001b40:	8526                	mv	a0,s1
    80001b42:	fffff097          	auipc	ra,0xfffff
    80001b46:	734080e7          	jalr	1844(ra) # 80001276 <uvmunmap>
    80001b4a:	85ca                	mv	a1,s2
    80001b4c:	8526                	mv	a0,s1
    80001b4e:	00000097          	auipc	ra,0x0
    80001b52:	9e8080e7          	jalr	-1560(ra) # 80001536 <uvmfree>
    80001b56:	60e2                	ld	ra,24(sp)
    80001b58:	6442                	ld	s0,16(sp)
    80001b5a:	64a2                	ld	s1,8(sp)
    80001b5c:	6902                	ld	s2,0(sp)
    80001b5e:	6105                	addi	sp,sp,32
    80001b60:	8082                	ret

0000000080001b62 <freeproc>:
    80001b62:	1101                	addi	sp,sp,-32
    80001b64:	ec06                	sd	ra,24(sp)
    80001b66:	e822                	sd	s0,16(sp)
    80001b68:	e426                	sd	s1,8(sp)
    80001b6a:	1000                	addi	s0,sp,32
    80001b6c:	84aa                	mv	s1,a0
    80001b6e:	6d28                	ld	a0,88(a0)
    80001b70:	c509                	beqz	a0,80001b7a <freeproc+0x18>
    80001b72:	fffff097          	auipc	ra,0xfffff
    80001b76:	e86080e7          	jalr	-378(ra) # 800009f8 <kfree>
    80001b7a:	0404bc23          	sd	zero,88(s1)
    80001b7e:	68a8                	ld	a0,80(s1)
    80001b80:	c511                	beqz	a0,80001b8c <freeproc+0x2a>
    80001b82:	64ac                	ld	a1,72(s1)
    80001b84:	00000097          	auipc	ra,0x0
    80001b88:	f8c080e7          	jalr	-116(ra) # 80001b10 <proc_freepagetable>
    80001b8c:	0404b823          	sd	zero,80(s1)
    80001b90:	0404b423          	sd	zero,72(s1)
    80001b94:	0204a823          	sw	zero,48(s1)
    80001b98:	0204bc23          	sd	zero,56(s1)
    80001b9c:	14048c23          	sb	zero,344(s1)
    80001ba0:	0204b023          	sd	zero,32(s1)
    80001ba4:	0204a423          	sw	zero,40(s1)
    80001ba8:	0204a623          	sw	zero,44(s1)
    80001bac:	0004ac23          	sw	zero,24(s1)
    80001bb0:	60e2                	ld	ra,24(sp)
    80001bb2:	6442                	ld	s0,16(sp)
    80001bb4:	64a2                	ld	s1,8(sp)
    80001bb6:	6105                	addi	sp,sp,32
    80001bb8:	8082                	ret

0000000080001bba <allocproc>:
    80001bba:	1101                	addi	sp,sp,-32
    80001bbc:	ec06                	sd	ra,24(sp)
    80001bbe:	e822                	sd	s0,16(sp)
    80001bc0:	e426                	sd	s1,8(sp)
    80001bc2:	e04a                	sd	s2,0(sp)
    80001bc4:	1000                	addi	s0,sp,32
    80001bc6:	00010497          	auipc	s1,0x10
    80001bca:	b0a48493          	addi	s1,s1,-1270 # 800116d0 <proc>
    80001bce:	00016917          	auipc	s2,0x16
    80001bd2:	d0290913          	addi	s2,s2,-766 # 800178d0 <tickslock>
    80001bd6:	8526                	mv	a0,s1
    80001bd8:	fffff097          	auipc	ra,0xfffff
    80001bdc:	00c080e7          	jalr	12(ra) # 80000be4 <acquire>
    80001be0:	4c9c                	lw	a5,24(s1)
    80001be2:	cf81                	beqz	a5,80001bfa <allocproc+0x40>
    80001be4:	8526                	mv	a0,s1
    80001be6:	fffff097          	auipc	ra,0xfffff
    80001bea:	0b2080e7          	jalr	178(ra) # 80000c98 <release>
    80001bee:	18848493          	addi	s1,s1,392
    80001bf2:	ff2492e3          	bne	s1,s2,80001bd6 <allocproc+0x1c>
    80001bf6:	4481                	li	s1,0
    80001bf8:	a079                	j	80001c86 <allocproc+0xcc>
    80001bfa:	00000097          	auipc	ra,0x0
    80001bfe:	e34080e7          	jalr	-460(ra) # 80001a2e <allocpid>
    80001c02:	d888                	sw	a0,48(s1)
    80001c04:	4785                	li	a5,1
    80001c06:	cc9c                	sw	a5,24(s1)
    80001c08:	03c00793          	li	a5,60
    80001c0c:	18f4a223          	sw	a5,388(s1)
    80001c10:	fffff097          	auipc	ra,0xfffff
    80001c14:	ee4080e7          	jalr	-284(ra) # 80000af4 <kalloc>
    80001c18:	892a                	mv	s2,a0
    80001c1a:	eca8                	sd	a0,88(s1)
    80001c1c:	cd25                	beqz	a0,80001c94 <allocproc+0xda>
    80001c1e:	8526                	mv	a0,s1
    80001c20:	00000097          	auipc	ra,0x0
    80001c24:	e54080e7          	jalr	-428(ra) # 80001a74 <proc_pagetable>
    80001c28:	892a                	mv	s2,a0
    80001c2a:	e8a8                	sd	a0,80(s1)
    80001c2c:	c141                	beqz	a0,80001cac <allocproc+0xf2>
    80001c2e:	07000613          	li	a2,112
    80001c32:	4581                	li	a1,0
    80001c34:	06048513          	addi	a0,s1,96
    80001c38:	fffff097          	auipc	ra,0xfffff
    80001c3c:	0a8080e7          	jalr	168(ra) # 80000ce0 <memset>
    80001c40:	00000797          	auipc	a5,0x0
    80001c44:	da878793          	addi	a5,a5,-600 # 800019e8 <forkret>
    80001c48:	f0bc                	sd	a5,96(s1)
    80001c4a:	60bc                	ld	a5,64(s1)
    80001c4c:	6705                	lui	a4,0x1
    80001c4e:	97ba                	add	a5,a5,a4
    80001c50:	f4bc                	sd	a5,104(s1)
    80001c52:	1604a623          	sw	zero,364(s1)
    80001c56:	1604a823          	sw	zero,368(s1)
    80001c5a:	00016517          	auipc	a0,0x16
    80001c5e:	c7650513          	addi	a0,a0,-906 # 800178d0 <tickslock>
    80001c62:	fffff097          	auipc	ra,0xfffff
    80001c66:	f82080e7          	jalr	-126(ra) # 80000be4 <acquire>
    80001c6a:	00007797          	auipc	a5,0x7
    80001c6e:	3c67a783          	lw	a5,966(a5) # 80009030 <ticks>
    80001c72:	16f4a423          	sw	a5,360(s1)
    80001c76:	00016517          	auipc	a0,0x16
    80001c7a:	c5a50513          	addi	a0,a0,-934 # 800178d0 <tickslock>
    80001c7e:	fffff097          	auipc	ra,0xfffff
    80001c82:	01a080e7          	jalr	26(ra) # 80000c98 <release>
    80001c86:	8526                	mv	a0,s1
    80001c88:	60e2                	ld	ra,24(sp)
    80001c8a:	6442                	ld	s0,16(sp)
    80001c8c:	64a2                	ld	s1,8(sp)
    80001c8e:	6902                	ld	s2,0(sp)
    80001c90:	6105                	addi	sp,sp,32
    80001c92:	8082                	ret
    80001c94:	8526                	mv	a0,s1
    80001c96:	00000097          	auipc	ra,0x0
    80001c9a:	ecc080e7          	jalr	-308(ra) # 80001b62 <freeproc>
    80001c9e:	8526                	mv	a0,s1
    80001ca0:	fffff097          	auipc	ra,0xfffff
    80001ca4:	ff8080e7          	jalr	-8(ra) # 80000c98 <release>
    80001ca8:	84ca                	mv	s1,s2
    80001caa:	bff1                	j	80001c86 <allocproc+0xcc>
    80001cac:	8526                	mv	a0,s1
    80001cae:	00000097          	auipc	ra,0x0
    80001cb2:	eb4080e7          	jalr	-332(ra) # 80001b62 <freeproc>
    80001cb6:	8526                	mv	a0,s1
    80001cb8:	fffff097          	auipc	ra,0xfffff
    80001cbc:	fe0080e7          	jalr	-32(ra) # 80000c98 <release>
    80001cc0:	84ca                	mv	s1,s2
    80001cc2:	b7d1                	j	80001c86 <allocproc+0xcc>

0000000080001cc4 <userinit>:
    80001cc4:	1101                	addi	sp,sp,-32
    80001cc6:	ec06                	sd	ra,24(sp)
    80001cc8:	e822                	sd	s0,16(sp)
    80001cca:	e426                	sd	s1,8(sp)
    80001ccc:	1000                	addi	s0,sp,32
    80001cce:	00000097          	auipc	ra,0x0
    80001cd2:	eec080e7          	jalr	-276(ra) # 80001bba <allocproc>
    80001cd6:	84aa                	mv	s1,a0
    80001cd8:	00007797          	auipc	a5,0x7
    80001cdc:	34a7b823          	sd	a0,848(a5) # 80009028 <initproc>
    80001ce0:	03400613          	li	a2,52
    80001ce4:	00007597          	auipc	a1,0x7
    80001ce8:	bfc58593          	addi	a1,a1,-1028 # 800088e0 <initcode>
    80001cec:	6928                	ld	a0,80(a0)
    80001cee:	fffff097          	auipc	ra,0xfffff
    80001cf2:	67a080e7          	jalr	1658(ra) # 80001368 <uvminit>
    80001cf6:	6785                	lui	a5,0x1
    80001cf8:	e4bc                	sd	a5,72(s1)
    80001cfa:	6cb8                	ld	a4,88(s1)
    80001cfc:	00073c23          	sd	zero,24(a4) # 1018 <_entry-0x7fffefe8>
    80001d00:	6cb8                	ld	a4,88(s1)
    80001d02:	fb1c                	sd	a5,48(a4)
    80001d04:	4641                	li	a2,16
    80001d06:	00006597          	auipc	a1,0x6
    80001d0a:	4fa58593          	addi	a1,a1,1274 # 80008200 <digits+0x1c0>
    80001d0e:	15848513          	addi	a0,s1,344
    80001d12:	fffff097          	auipc	ra,0xfffff
    80001d16:	120080e7          	jalr	288(ra) # 80000e32 <safestrcpy>
    80001d1a:	00006517          	auipc	a0,0x6
    80001d1e:	4f650513          	addi	a0,a0,1270 # 80008210 <digits+0x1d0>
    80001d22:	00002097          	auipc	ra,0x2
    80001d26:	2c8080e7          	jalr	712(ra) # 80003fea <namei>
    80001d2a:	14a4b823          	sd	a0,336(s1)
    80001d2e:	478d                	li	a5,3
    80001d30:	cc9c                	sw	a5,24(s1)
    80001d32:	8526                	mv	a0,s1
    80001d34:	fffff097          	auipc	ra,0xfffff
    80001d38:	f64080e7          	jalr	-156(ra) # 80000c98 <release>
    80001d3c:	60e2                	ld	ra,24(sp)
    80001d3e:	6442                	ld	s0,16(sp)
    80001d40:	64a2                	ld	s1,8(sp)
    80001d42:	6105                	addi	sp,sp,32
    80001d44:	8082                	ret

0000000080001d46 <growproc>:
    80001d46:	1101                	addi	sp,sp,-32
    80001d48:	ec06                	sd	ra,24(sp)
    80001d4a:	e822                	sd	s0,16(sp)
    80001d4c:	e426                	sd	s1,8(sp)
    80001d4e:	e04a                	sd	s2,0(sp)
    80001d50:	1000                	addi	s0,sp,32
    80001d52:	84aa                	mv	s1,a0
    80001d54:	00000097          	auipc	ra,0x0
    80001d58:	c5c080e7          	jalr	-932(ra) # 800019b0 <myproc>
    80001d5c:	892a                	mv	s2,a0
    80001d5e:	652c                	ld	a1,72(a0)
    80001d60:	0005861b          	sext.w	a2,a1
    80001d64:	00904f63          	bgtz	s1,80001d82 <growproc+0x3c>
    80001d68:	0204cc63          	bltz	s1,80001da0 <growproc+0x5a>
    80001d6c:	1602                	slli	a2,a2,0x20
    80001d6e:	9201                	srli	a2,a2,0x20
    80001d70:	04c93423          	sd	a2,72(s2)
    80001d74:	4501                	li	a0,0
    80001d76:	60e2                	ld	ra,24(sp)
    80001d78:	6442                	ld	s0,16(sp)
    80001d7a:	64a2                	ld	s1,8(sp)
    80001d7c:	6902                	ld	s2,0(sp)
    80001d7e:	6105                	addi	sp,sp,32
    80001d80:	8082                	ret
    80001d82:	9e25                	addw	a2,a2,s1
    80001d84:	1602                	slli	a2,a2,0x20
    80001d86:	9201                	srli	a2,a2,0x20
    80001d88:	1582                	slli	a1,a1,0x20
    80001d8a:	9181                	srli	a1,a1,0x20
    80001d8c:	6928                	ld	a0,80(a0)
    80001d8e:	fffff097          	auipc	ra,0xfffff
    80001d92:	694080e7          	jalr	1684(ra) # 80001422 <uvmalloc>
    80001d96:	0005061b          	sext.w	a2,a0
    80001d9a:	fa69                	bnez	a2,80001d6c <growproc+0x26>
    80001d9c:	557d                	li	a0,-1
    80001d9e:	bfe1                	j	80001d76 <growproc+0x30>
    80001da0:	9e25                	addw	a2,a2,s1
    80001da2:	1602                	slli	a2,a2,0x20
    80001da4:	9201                	srli	a2,a2,0x20
    80001da6:	1582                	slli	a1,a1,0x20
    80001da8:	9181                	srli	a1,a1,0x20
    80001daa:	6928                	ld	a0,80(a0)
    80001dac:	fffff097          	auipc	ra,0xfffff
    80001db0:	62e080e7          	jalr	1582(ra) # 800013da <uvmdealloc>
    80001db4:	0005061b          	sext.w	a2,a0
    80001db8:	bf55                	j	80001d6c <growproc+0x26>

0000000080001dba <fork>:
    80001dba:	7179                	addi	sp,sp,-48
    80001dbc:	f406                	sd	ra,40(sp)
    80001dbe:	f022                	sd	s0,32(sp)
    80001dc0:	ec26                	sd	s1,24(sp)
    80001dc2:	e84a                	sd	s2,16(sp)
    80001dc4:	e44e                	sd	s3,8(sp)
    80001dc6:	e052                	sd	s4,0(sp)
    80001dc8:	1800                	addi	s0,sp,48
    80001dca:	00000097          	auipc	ra,0x0
    80001dce:	be6080e7          	jalr	-1050(ra) # 800019b0 <myproc>
    80001dd2:	892a                	mv	s2,a0
    80001dd4:	00000097          	auipc	ra,0x0
    80001dd8:	de6080e7          	jalr	-538(ra) # 80001bba <allocproc>
    80001ddc:	10050b63          	beqz	a0,80001ef2 <fork+0x138>
    80001de0:	89aa                	mv	s3,a0
    80001de2:	04893603          	ld	a2,72(s2)
    80001de6:	692c                	ld	a1,80(a0)
    80001de8:	05093503          	ld	a0,80(s2)
    80001dec:	fffff097          	auipc	ra,0xfffff
    80001df0:	782080e7          	jalr	1922(ra) # 8000156e <uvmcopy>
    80001df4:	04054663          	bltz	a0,80001e40 <fork+0x86>
    80001df8:	04893783          	ld	a5,72(s2)
    80001dfc:	04f9b423          	sd	a5,72(s3)
    80001e00:	05893683          	ld	a3,88(s2)
    80001e04:	87b6                	mv	a5,a3
    80001e06:	0589b703          	ld	a4,88(s3)
    80001e0a:	12068693          	addi	a3,a3,288
    80001e0e:	0007b803          	ld	a6,0(a5) # 1000 <_entry-0x7ffff000>
    80001e12:	6788                	ld	a0,8(a5)
    80001e14:	6b8c                	ld	a1,16(a5)
    80001e16:	6f90                	ld	a2,24(a5)
    80001e18:	01073023          	sd	a6,0(a4)
    80001e1c:	e708                	sd	a0,8(a4)
    80001e1e:	eb0c                	sd	a1,16(a4)
    80001e20:	ef10                	sd	a2,24(a4)
    80001e22:	02078793          	addi	a5,a5,32
    80001e26:	02070713          	addi	a4,a4,32
    80001e2a:	fed792e3          	bne	a5,a3,80001e0e <fork+0x54>
    80001e2e:	0589b783          	ld	a5,88(s3)
    80001e32:	0607b823          	sd	zero,112(a5)
    80001e36:	0d000493          	li	s1,208
    80001e3a:	15000a13          	li	s4,336
    80001e3e:	a03d                	j	80001e6c <fork+0xb2>
    80001e40:	854e                	mv	a0,s3
    80001e42:	00000097          	auipc	ra,0x0
    80001e46:	d20080e7          	jalr	-736(ra) # 80001b62 <freeproc>
    80001e4a:	854e                	mv	a0,s3
    80001e4c:	fffff097          	auipc	ra,0xfffff
    80001e50:	e4c080e7          	jalr	-436(ra) # 80000c98 <release>
    80001e54:	5a7d                	li	s4,-1
    80001e56:	a069                	j	80001ee0 <fork+0x126>
    80001e58:	00003097          	auipc	ra,0x3
    80001e5c:	828080e7          	jalr	-2008(ra) # 80004680 <filedup>
    80001e60:	009987b3          	add	a5,s3,s1
    80001e64:	e388                	sd	a0,0(a5)
    80001e66:	04a1                	addi	s1,s1,8
    80001e68:	01448763          	beq	s1,s4,80001e76 <fork+0xbc>
    80001e6c:	009907b3          	add	a5,s2,s1
    80001e70:	6388                	ld	a0,0(a5)
    80001e72:	f17d                	bnez	a0,80001e58 <fork+0x9e>
    80001e74:	bfcd                	j	80001e66 <fork+0xac>
    80001e76:	15093503          	ld	a0,336(s2)
    80001e7a:	00002097          	auipc	ra,0x2
    80001e7e:	97c080e7          	jalr	-1668(ra) # 800037f6 <idup>
    80001e82:	14a9b823          	sd	a0,336(s3)
    80001e86:	4641                	li	a2,16
    80001e88:	15890593          	addi	a1,s2,344
    80001e8c:	15898513          	addi	a0,s3,344
    80001e90:	fffff097          	auipc	ra,0xfffff
    80001e94:	fa2080e7          	jalr	-94(ra) # 80000e32 <safestrcpy>
    80001e98:	0309aa03          	lw	s4,48(s3)
    80001e9c:	854e                	mv	a0,s3
    80001e9e:	fffff097          	auipc	ra,0xfffff
    80001ea2:	dfa080e7          	jalr	-518(ra) # 80000c98 <release>
    80001ea6:	0000f497          	auipc	s1,0xf
    80001eaa:	41248493          	addi	s1,s1,1042 # 800112b8 <wait_lock>
    80001eae:	8526                	mv	a0,s1
    80001eb0:	fffff097          	auipc	ra,0xfffff
    80001eb4:	d34080e7          	jalr	-716(ra) # 80000be4 <acquire>
    80001eb8:	0329bc23          	sd	s2,56(s3)
    80001ebc:	8526                	mv	a0,s1
    80001ebe:	fffff097          	auipc	ra,0xfffff
    80001ec2:	dda080e7          	jalr	-550(ra) # 80000c98 <release>
    80001ec6:	854e                	mv	a0,s3
    80001ec8:	fffff097          	auipc	ra,0xfffff
    80001ecc:	d1c080e7          	jalr	-740(ra) # 80000be4 <acquire>
    80001ed0:	478d                	li	a5,3
    80001ed2:	00f9ac23          	sw	a5,24(s3)
    80001ed6:	854e                	mv	a0,s3
    80001ed8:	fffff097          	auipc	ra,0xfffff
    80001edc:	dc0080e7          	jalr	-576(ra) # 80000c98 <release>
    80001ee0:	8552                	mv	a0,s4
    80001ee2:	70a2                	ld	ra,40(sp)
    80001ee4:	7402                	ld	s0,32(sp)
    80001ee6:	64e2                	ld	s1,24(sp)
    80001ee8:	6942                	ld	s2,16(sp)
    80001eea:	69a2                	ld	s3,8(sp)
    80001eec:	6a02                	ld	s4,0(sp)
    80001eee:	6145                	addi	sp,sp,48
    80001ef0:	8082                	ret
    80001ef2:	5a7d                	li	s4,-1
    80001ef4:	b7f5                	j	80001ee0 <fork+0x126>

0000000080001ef6 <update_time>:
    80001ef6:	7179                	addi	sp,sp,-48
    80001ef8:	f406                	sd	ra,40(sp)
    80001efa:	f022                	sd	s0,32(sp)
    80001efc:	ec26                	sd	s1,24(sp)
    80001efe:	e84a                	sd	s2,16(sp)
    80001f00:	e44e                	sd	s3,8(sp)
    80001f02:	e052                	sd	s4,0(sp)
    80001f04:	1800                	addi	s0,sp,48
    80001f06:	0000f497          	auipc	s1,0xf
    80001f0a:	7ca48493          	addi	s1,s1,1994 # 800116d0 <proc>
    80001f0e:	4991                	li	s3,4
    80001f10:	4a09                	li	s4,2
    80001f12:	00016917          	auipc	s2,0x16
    80001f16:	9be90913          	addi	s2,s2,-1602 # 800178d0 <tickslock>
    80001f1a:	a025                	j	80001f42 <update_time+0x4c>
    80001f1c:	16c4a783          	lw	a5,364(s1)
    80001f20:	2785                	addiw	a5,a5,1
    80001f22:	16f4a623          	sw	a5,364(s1)
    80001f26:	17c4a783          	lw	a5,380(s1)
    80001f2a:	2785                	addiw	a5,a5,1
    80001f2c:	16f4ae23          	sw	a5,380(s1)
    80001f30:	8526                	mv	a0,s1
    80001f32:	fffff097          	auipc	ra,0xfffff
    80001f36:	d66080e7          	jalr	-666(ra) # 80000c98 <release>
    80001f3a:	18848493          	addi	s1,s1,392
    80001f3e:	03248263          	beq	s1,s2,80001f62 <update_time+0x6c>
    80001f42:	8526                	mv	a0,s1
    80001f44:	fffff097          	auipc	ra,0xfffff
    80001f48:	ca0080e7          	jalr	-864(ra) # 80000be4 <acquire>
    80001f4c:	4c9c                	lw	a5,24(s1)
    80001f4e:	fd3787e3          	beq	a5,s3,80001f1c <update_time+0x26>
    80001f52:	fd479fe3          	bne	a5,s4,80001f30 <update_time+0x3a>
    80001f56:	1784a783          	lw	a5,376(s1)
    80001f5a:	2785                	addiw	a5,a5,1
    80001f5c:	16f4ac23          	sw	a5,376(s1)
    80001f60:	bfc1                	j	80001f30 <update_time+0x3a>
    80001f62:	70a2                	ld	ra,40(sp)
    80001f64:	7402                	ld	s0,32(sp)
    80001f66:	64e2                	ld	s1,24(sp)
    80001f68:	6942                	ld	s2,16(sp)
    80001f6a:	69a2                	ld	s3,8(sp)
    80001f6c:	6a02                	ld	s4,0(sp)
    80001f6e:	6145                	addi	sp,sp,48
    80001f70:	8082                	ret

0000000080001f72 <dynamic_priority>:
    80001f72:	1141                	addi	sp,sp,-16
    80001f74:	e422                	sd	s0,8(sp)
    80001f76:	0800                	addi	s0,sp,16
    80001f78:	17852703          	lw	a4,376(a0)
    80001f7c:	d21707d3          	fcvt.d.wu	fa5,a4
    80001f80:	17c52783          	lw	a5,380(a0)
    80001f84:	9fb9                	addw	a5,a5,a4
    80001f86:	d2178753          	fcvt.d.wu	fa4,a5
    80001f8a:	1ae7f7d3          	fdiv.d	fa5,fa5,fa4
    80001f8e:	00006797          	auipc	a5,0x6
    80001f92:	07a7b707          	fld	fa4,122(a5) # 80008008 <etext+0x8>
    80001f96:	12e7f7d3          	fmul.d	fa5,fa5,fa4
    80001f9a:	c20797d3          	fcvt.w.d	a5,fa5,rtz
    80001f9e:	18452503          	lw	a0,388(a0)
    80001fa2:	9d1d                	subw	a0,a0,a5
    80001fa4:	0005071b          	sext.w	a4,a0
    80001fa8:	05e00793          	li	a5,94
    80001fac:	00e7cd63          	blt	a5,a4,80001fc6 <dynamic_priority+0x54>
    80001fb0:	2515                	addiw	a0,a0,5
    80001fb2:	0005079b          	sext.w	a5,a0
    80001fb6:	fff7c793          	not	a5,a5
    80001fba:	97fd                	srai	a5,a5,0x3f
    80001fbc:	8d7d                	and	a0,a0,a5
    80001fbe:	2501                	sext.w	a0,a0
    80001fc0:	6422                	ld	s0,8(sp)
    80001fc2:	0141                	addi	sp,sp,16
    80001fc4:	8082                	ret
    80001fc6:	06400513          	li	a0,100
    80001fca:	bfdd                	j	80001fc0 <dynamic_priority+0x4e>

0000000080001fcc <scheduler>:
    80001fcc:	7139                	addi	sp,sp,-64
    80001fce:	fc06                	sd	ra,56(sp)
    80001fd0:	f822                	sd	s0,48(sp)
    80001fd2:	f426                	sd	s1,40(sp)
    80001fd4:	f04a                	sd	s2,32(sp)
    80001fd6:	ec4e                	sd	s3,24(sp)
    80001fd8:	e852                	sd	s4,16(sp)
    80001fda:	e456                	sd	s5,8(sp)
    80001fdc:	e05a                	sd	s6,0(sp)
    80001fde:	0080                	addi	s0,sp,64
    80001fe0:	8792                	mv	a5,tp
    80001fe2:	2781                	sext.w	a5,a5
    80001fe4:	00779a93          	slli	s5,a5,0x7
    80001fe8:	0000f717          	auipc	a4,0xf
    80001fec:	2b870713          	addi	a4,a4,696 # 800112a0 <pid_lock>
    80001ff0:	9756                	add	a4,a4,s5
    80001ff2:	02073823          	sd	zero,48(a4)
    80001ff6:	0000f717          	auipc	a4,0xf
    80001ffa:	2e270713          	addi	a4,a4,738 # 800112d8 <cpus+0x8>
    80001ffe:	9aba                	add	s5,s5,a4
    80002000:	498d                	li	s3,3
    80002002:	4b11                	li	s6,4
    80002004:	079e                	slli	a5,a5,0x7
    80002006:	0000fa17          	auipc	s4,0xf
    8000200a:	29aa0a13          	addi	s4,s4,666 # 800112a0 <pid_lock>
    8000200e:	9a3e                	add	s4,s4,a5
    80002010:	00016917          	auipc	s2,0x16
    80002014:	8c090913          	addi	s2,s2,-1856 # 800178d0 <tickslock>
    80002018:	100027f3          	csrr	a5,sstatus
    8000201c:	0027e793          	ori	a5,a5,2
    80002020:	10079073          	csrw	sstatus,a5
    80002024:	0000f497          	auipc	s1,0xf
    80002028:	6ac48493          	addi	s1,s1,1708 # 800116d0 <proc>
    8000202c:	a03d                	j	8000205a <scheduler+0x8e>
    8000202e:	0164ac23          	sw	s6,24(s1)
    80002032:	029a3823          	sd	s1,48(s4)
    80002036:	06048593          	addi	a1,s1,96
    8000203a:	8556                	mv	a0,s5
    8000203c:	00000097          	auipc	ra,0x0
    80002040:	6de080e7          	jalr	1758(ra) # 8000271a <swtch>
    80002044:	020a3823          	sd	zero,48(s4)
    80002048:	8526                	mv	a0,s1
    8000204a:	fffff097          	auipc	ra,0xfffff
    8000204e:	c4e080e7          	jalr	-946(ra) # 80000c98 <release>
    80002052:	18848493          	addi	s1,s1,392
    80002056:	fd2481e3          	beq	s1,s2,80002018 <scheduler+0x4c>
    8000205a:	8526                	mv	a0,s1
    8000205c:	fffff097          	auipc	ra,0xfffff
    80002060:	b88080e7          	jalr	-1144(ra) # 80000be4 <acquire>
    80002064:	4c9c                	lw	a5,24(s1)
    80002066:	ff3791e3          	bne	a5,s3,80002048 <scheduler+0x7c>
    8000206a:	b7d1                	j	8000202e <scheduler+0x62>

000000008000206c <sched>:
    8000206c:	7179                	addi	sp,sp,-48
    8000206e:	f406                	sd	ra,40(sp)
    80002070:	f022                	sd	s0,32(sp)
    80002072:	ec26                	sd	s1,24(sp)
    80002074:	e84a                	sd	s2,16(sp)
    80002076:	e44e                	sd	s3,8(sp)
    80002078:	1800                	addi	s0,sp,48
    8000207a:	00000097          	auipc	ra,0x0
    8000207e:	936080e7          	jalr	-1738(ra) # 800019b0 <myproc>
    80002082:	84aa                	mv	s1,a0
    80002084:	fffff097          	auipc	ra,0xfffff
    80002088:	ae6080e7          	jalr	-1306(ra) # 80000b6a <holding>
    8000208c:	c93d                	beqz	a0,80002102 <sched+0x96>
    8000208e:	8792                	mv	a5,tp
    80002090:	2781                	sext.w	a5,a5
    80002092:	079e                	slli	a5,a5,0x7
    80002094:	0000f717          	auipc	a4,0xf
    80002098:	20c70713          	addi	a4,a4,524 # 800112a0 <pid_lock>
    8000209c:	97ba                	add	a5,a5,a4
    8000209e:	0a87a703          	lw	a4,168(a5)
    800020a2:	4785                	li	a5,1
    800020a4:	06f71763          	bne	a4,a5,80002112 <sched+0xa6>
    800020a8:	4c98                	lw	a4,24(s1)
    800020aa:	4791                	li	a5,4
    800020ac:	06f70b63          	beq	a4,a5,80002122 <sched+0xb6>
    800020b0:	100027f3          	csrr	a5,sstatus
    800020b4:	8b89                	andi	a5,a5,2
    800020b6:	efb5                	bnez	a5,80002132 <sched+0xc6>
    800020b8:	8792                	mv	a5,tp
    800020ba:	0000f917          	auipc	s2,0xf
    800020be:	1e690913          	addi	s2,s2,486 # 800112a0 <pid_lock>
    800020c2:	2781                	sext.w	a5,a5
    800020c4:	079e                	slli	a5,a5,0x7
    800020c6:	97ca                	add	a5,a5,s2
    800020c8:	0ac7a983          	lw	s3,172(a5)
    800020cc:	8792                	mv	a5,tp
    800020ce:	2781                	sext.w	a5,a5
    800020d0:	079e                	slli	a5,a5,0x7
    800020d2:	0000f597          	auipc	a1,0xf
    800020d6:	20658593          	addi	a1,a1,518 # 800112d8 <cpus+0x8>
    800020da:	95be                	add	a1,a1,a5
    800020dc:	06048513          	addi	a0,s1,96
    800020e0:	00000097          	auipc	ra,0x0
    800020e4:	63a080e7          	jalr	1594(ra) # 8000271a <swtch>
    800020e8:	8792                	mv	a5,tp
    800020ea:	2781                	sext.w	a5,a5
    800020ec:	079e                	slli	a5,a5,0x7
    800020ee:	97ca                	add	a5,a5,s2
    800020f0:	0b37a623          	sw	s3,172(a5)
    800020f4:	70a2                	ld	ra,40(sp)
    800020f6:	7402                	ld	s0,32(sp)
    800020f8:	64e2                	ld	s1,24(sp)
    800020fa:	6942                	ld	s2,16(sp)
    800020fc:	69a2                	ld	s3,8(sp)
    800020fe:	6145                	addi	sp,sp,48
    80002100:	8082                	ret
    80002102:	00006517          	auipc	a0,0x6
    80002106:	11650513          	addi	a0,a0,278 # 80008218 <digits+0x1d8>
    8000210a:	ffffe097          	auipc	ra,0xffffe
    8000210e:	434080e7          	jalr	1076(ra) # 8000053e <panic>
    80002112:	00006517          	auipc	a0,0x6
    80002116:	11650513          	addi	a0,a0,278 # 80008228 <digits+0x1e8>
    8000211a:	ffffe097          	auipc	ra,0xffffe
    8000211e:	424080e7          	jalr	1060(ra) # 8000053e <panic>
    80002122:	00006517          	auipc	a0,0x6
    80002126:	11650513          	addi	a0,a0,278 # 80008238 <digits+0x1f8>
    8000212a:	ffffe097          	auipc	ra,0xffffe
    8000212e:	414080e7          	jalr	1044(ra) # 8000053e <panic>
    80002132:	00006517          	auipc	a0,0x6
    80002136:	11650513          	addi	a0,a0,278 # 80008248 <digits+0x208>
    8000213a:	ffffe097          	auipc	ra,0xffffe
    8000213e:	404080e7          	jalr	1028(ra) # 8000053e <panic>

0000000080002142 <yield>:
    80002142:	1101                	addi	sp,sp,-32
    80002144:	ec06                	sd	ra,24(sp)
    80002146:	e822                	sd	s0,16(sp)
    80002148:	e426                	sd	s1,8(sp)
    8000214a:	1000                	addi	s0,sp,32
    8000214c:	00000097          	auipc	ra,0x0
    80002150:	864080e7          	jalr	-1948(ra) # 800019b0 <myproc>
    80002154:	84aa                	mv	s1,a0
    80002156:	fffff097          	auipc	ra,0xfffff
    8000215a:	a8e080e7          	jalr	-1394(ra) # 80000be4 <acquire>
    8000215e:	478d                	li	a5,3
    80002160:	cc9c                	sw	a5,24(s1)
    80002162:	00000097          	auipc	ra,0x0
    80002166:	f0a080e7          	jalr	-246(ra) # 8000206c <sched>
    8000216a:	8526                	mv	a0,s1
    8000216c:	fffff097          	auipc	ra,0xfffff
    80002170:	b2c080e7          	jalr	-1236(ra) # 80000c98 <release>
    80002174:	60e2                	ld	ra,24(sp)
    80002176:	6442                	ld	s0,16(sp)
    80002178:	64a2                	ld	s1,8(sp)
    8000217a:	6105                	addi	sp,sp,32
    8000217c:	8082                	ret

000000008000217e <set_priority>:
    8000217e:	7179                	addi	sp,sp,-48
    80002180:	f406                	sd	ra,40(sp)
    80002182:	f022                	sd	s0,32(sp)
    80002184:	ec26                	sd	s1,24(sp)
    80002186:	e84a                	sd	s2,16(sp)
    80002188:	e44e                	sd	s3,8(sp)
    8000218a:	e052                	sd	s4,0(sp)
    8000218c:	1800                	addi	s0,sp,48
    8000218e:	8a2a                	mv	s4,a0
    80002190:	892e                	mv	s2,a1
    80002192:	0000f497          	auipc	s1,0xf
    80002196:	53e48493          	addi	s1,s1,1342 # 800116d0 <proc>
    8000219a:	00015997          	auipc	s3,0x15
    8000219e:	73698993          	addi	s3,s3,1846 # 800178d0 <tickslock>
    800021a2:	a811                	j	800021b6 <set_priority+0x38>
    800021a4:	8526                	mv	a0,s1
    800021a6:	fffff097          	auipc	ra,0xfffff
    800021aa:	af2080e7          	jalr	-1294(ra) # 80000c98 <release>
    800021ae:	18848493          	addi	s1,s1,392
    800021b2:	05348663          	beq	s1,s3,800021fe <set_priority+0x80>
    800021b6:	8526                	mv	a0,s1
    800021b8:	fffff097          	auipc	ra,0xfffff
    800021bc:	a2c080e7          	jalr	-1492(ra) # 80000be4 <acquire>
    800021c0:	589c                	lw	a5,48(s1)
    800021c2:	ff2791e3          	bne	a5,s2,800021a4 <set_priority+0x26>
    800021c6:	1604ae23          	sw	zero,380(s1)
    800021ca:	1604ac23          	sw	zero,376(s1)
    800021ce:	1844a903          	lw	s2,388(s1)
    800021d2:	1944a223          	sw	s4,388(s1)
    800021d6:	8526                	mv	a0,s1
    800021d8:	fffff097          	auipc	ra,0xfffff
    800021dc:	ac0080e7          	jalr	-1344(ra) # 80000c98 <release>
    800021e0:	06500793          	li	a5,101
    800021e4:	02f90463          	beq	s2,a5,8000220c <set_priority+0x8e>
    800021e8:	012a4d63          	blt	s4,s2,80002202 <set_priority+0x84>
    800021ec:	854a                	mv	a0,s2
    800021ee:	70a2                	ld	ra,40(sp)
    800021f0:	7402                	ld	s0,32(sp)
    800021f2:	64e2                	ld	s1,24(sp)
    800021f4:	6942                	ld	s2,16(sp)
    800021f6:	69a2                	ld	s3,8(sp)
    800021f8:	6a02                	ld	s4,0(sp)
    800021fa:	6145                	addi	sp,sp,48
    800021fc:	8082                	ret
    800021fe:	597d                	li	s2,-1
    80002200:	b7f5                	j	800021ec <set_priority+0x6e>
    80002202:	00000097          	auipc	ra,0x0
    80002206:	f40080e7          	jalr	-192(ra) # 80002142 <yield>
    8000220a:	b7cd                	j	800021ec <set_priority+0x6e>
    8000220c:	597d                	li	s2,-1
    8000220e:	bff9                	j	800021ec <set_priority+0x6e>

0000000080002210 <sleep>:
    80002210:	7179                	addi	sp,sp,-48
    80002212:	f406                	sd	ra,40(sp)
    80002214:	f022                	sd	s0,32(sp)
    80002216:	ec26                	sd	s1,24(sp)
    80002218:	e84a                	sd	s2,16(sp)
    8000221a:	e44e                	sd	s3,8(sp)
    8000221c:	1800                	addi	s0,sp,48
    8000221e:	89aa                	mv	s3,a0
    80002220:	892e                	mv	s2,a1
    80002222:	fffff097          	auipc	ra,0xfffff
    80002226:	78e080e7          	jalr	1934(ra) # 800019b0 <myproc>
    8000222a:	84aa                	mv	s1,a0
    8000222c:	fffff097          	auipc	ra,0xfffff
    80002230:	9b8080e7          	jalr	-1608(ra) # 80000be4 <acquire>
    80002234:	854a                	mv	a0,s2
    80002236:	fffff097          	auipc	ra,0xfffff
    8000223a:	a62080e7          	jalr	-1438(ra) # 80000c98 <release>
    8000223e:	0334b023          	sd	s3,32(s1)
    80002242:	4789                	li	a5,2
    80002244:	cc9c                	sw	a5,24(s1)
    80002246:	00000097          	auipc	ra,0x0
    8000224a:	e26080e7          	jalr	-474(ra) # 8000206c <sched>
    8000224e:	0204b023          	sd	zero,32(s1)
    80002252:	8526                	mv	a0,s1
    80002254:	fffff097          	auipc	ra,0xfffff
    80002258:	a44080e7          	jalr	-1468(ra) # 80000c98 <release>
    8000225c:	854a                	mv	a0,s2
    8000225e:	fffff097          	auipc	ra,0xfffff
    80002262:	986080e7          	jalr	-1658(ra) # 80000be4 <acquire>
    80002266:	70a2                	ld	ra,40(sp)
    80002268:	7402                	ld	s0,32(sp)
    8000226a:	64e2                	ld	s1,24(sp)
    8000226c:	6942                	ld	s2,16(sp)
    8000226e:	69a2                	ld	s3,8(sp)
    80002270:	6145                	addi	sp,sp,48
    80002272:	8082                	ret

0000000080002274 <wait>:
    80002274:	715d                	addi	sp,sp,-80
    80002276:	e486                	sd	ra,72(sp)
    80002278:	e0a2                	sd	s0,64(sp)
    8000227a:	fc26                	sd	s1,56(sp)
    8000227c:	f84a                	sd	s2,48(sp)
    8000227e:	f44e                	sd	s3,40(sp)
    80002280:	f052                	sd	s4,32(sp)
    80002282:	ec56                	sd	s5,24(sp)
    80002284:	e85a                	sd	s6,16(sp)
    80002286:	e45e                	sd	s7,8(sp)
    80002288:	e062                	sd	s8,0(sp)
    8000228a:	0880                	addi	s0,sp,80
    8000228c:	8b2a                	mv	s6,a0
    8000228e:	fffff097          	auipc	ra,0xfffff
    80002292:	722080e7          	jalr	1826(ra) # 800019b0 <myproc>
    80002296:	892a                	mv	s2,a0
    80002298:	0000f517          	auipc	a0,0xf
    8000229c:	02050513          	addi	a0,a0,32 # 800112b8 <wait_lock>
    800022a0:	fffff097          	auipc	ra,0xfffff
    800022a4:	944080e7          	jalr	-1724(ra) # 80000be4 <acquire>
    800022a8:	4b81                	li	s7,0
    800022aa:	4a15                	li	s4,5
    800022ac:	00015997          	auipc	s3,0x15
    800022b0:	62498993          	addi	s3,s3,1572 # 800178d0 <tickslock>
    800022b4:	4a85                	li	s5,1
    800022b6:	0000fc17          	auipc	s8,0xf
    800022ba:	002c0c13          	addi	s8,s8,2 # 800112b8 <wait_lock>
    800022be:	875e                	mv	a4,s7
    800022c0:	0000f497          	auipc	s1,0xf
    800022c4:	41048493          	addi	s1,s1,1040 # 800116d0 <proc>
    800022c8:	a0bd                	j	80002336 <wait+0xc2>
    800022ca:	0304a983          	lw	s3,48(s1)
    800022ce:	000b0e63          	beqz	s6,800022ea <wait+0x76>
    800022d2:	4691                	li	a3,4
    800022d4:	02c48613          	addi	a2,s1,44
    800022d8:	85da                	mv	a1,s6
    800022da:	05093503          	ld	a0,80(s2)
    800022de:	fffff097          	auipc	ra,0xfffff
    800022e2:	394080e7          	jalr	916(ra) # 80001672 <copyout>
    800022e6:	02054563          	bltz	a0,80002310 <wait+0x9c>
    800022ea:	8526                	mv	a0,s1
    800022ec:	00000097          	auipc	ra,0x0
    800022f0:	876080e7          	jalr	-1930(ra) # 80001b62 <freeproc>
    800022f4:	8526                	mv	a0,s1
    800022f6:	fffff097          	auipc	ra,0xfffff
    800022fa:	9a2080e7          	jalr	-1630(ra) # 80000c98 <release>
    800022fe:	0000f517          	auipc	a0,0xf
    80002302:	fba50513          	addi	a0,a0,-70 # 800112b8 <wait_lock>
    80002306:	fffff097          	auipc	ra,0xfffff
    8000230a:	992080e7          	jalr	-1646(ra) # 80000c98 <release>
    8000230e:	a09d                	j	80002374 <wait+0x100>
    80002310:	8526                	mv	a0,s1
    80002312:	fffff097          	auipc	ra,0xfffff
    80002316:	986080e7          	jalr	-1658(ra) # 80000c98 <release>
    8000231a:	0000f517          	auipc	a0,0xf
    8000231e:	f9e50513          	addi	a0,a0,-98 # 800112b8 <wait_lock>
    80002322:	fffff097          	auipc	ra,0xfffff
    80002326:	976080e7          	jalr	-1674(ra) # 80000c98 <release>
    8000232a:	59fd                	li	s3,-1
    8000232c:	a0a1                	j	80002374 <wait+0x100>
    8000232e:	18848493          	addi	s1,s1,392
    80002332:	03348463          	beq	s1,s3,8000235a <wait+0xe6>
    80002336:	7c9c                	ld	a5,56(s1)
    80002338:	ff279be3          	bne	a5,s2,8000232e <wait+0xba>
    8000233c:	8526                	mv	a0,s1
    8000233e:	fffff097          	auipc	ra,0xfffff
    80002342:	8a6080e7          	jalr	-1882(ra) # 80000be4 <acquire>
    80002346:	4c9c                	lw	a5,24(s1)
    80002348:	f94781e3          	beq	a5,s4,800022ca <wait+0x56>
    8000234c:	8526                	mv	a0,s1
    8000234e:	fffff097          	auipc	ra,0xfffff
    80002352:	94a080e7          	jalr	-1718(ra) # 80000c98 <release>
    80002356:	8756                	mv	a4,s5
    80002358:	bfd9                	j	8000232e <wait+0xba>
    8000235a:	c701                	beqz	a4,80002362 <wait+0xee>
    8000235c:	02892783          	lw	a5,40(s2)
    80002360:	c79d                	beqz	a5,8000238e <wait+0x11a>
    80002362:	0000f517          	auipc	a0,0xf
    80002366:	f5650513          	addi	a0,a0,-170 # 800112b8 <wait_lock>
    8000236a:	fffff097          	auipc	ra,0xfffff
    8000236e:	92e080e7          	jalr	-1746(ra) # 80000c98 <release>
    80002372:	59fd                	li	s3,-1
    80002374:	854e                	mv	a0,s3
    80002376:	60a6                	ld	ra,72(sp)
    80002378:	6406                	ld	s0,64(sp)
    8000237a:	74e2                	ld	s1,56(sp)
    8000237c:	7942                	ld	s2,48(sp)
    8000237e:	79a2                	ld	s3,40(sp)
    80002380:	7a02                	ld	s4,32(sp)
    80002382:	6ae2                	ld	s5,24(sp)
    80002384:	6b42                	ld	s6,16(sp)
    80002386:	6ba2                	ld	s7,8(sp)
    80002388:	6c02                	ld	s8,0(sp)
    8000238a:	6161                	addi	sp,sp,80
    8000238c:	8082                	ret
    8000238e:	85e2                	mv	a1,s8
    80002390:	854a                	mv	a0,s2
    80002392:	00000097          	auipc	ra,0x0
    80002396:	e7e080e7          	jalr	-386(ra) # 80002210 <sleep>
    8000239a:	b715                	j	800022be <wait+0x4a>

000000008000239c <wakeup>:
    8000239c:	7139                	addi	sp,sp,-64
    8000239e:	fc06                	sd	ra,56(sp)
    800023a0:	f822                	sd	s0,48(sp)
    800023a2:	f426                	sd	s1,40(sp)
    800023a4:	f04a                	sd	s2,32(sp)
    800023a6:	ec4e                	sd	s3,24(sp)
    800023a8:	e852                	sd	s4,16(sp)
    800023aa:	e456                	sd	s5,8(sp)
    800023ac:	0080                	addi	s0,sp,64
    800023ae:	8a2a                	mv	s4,a0
    800023b0:	0000f497          	auipc	s1,0xf
    800023b4:	32048493          	addi	s1,s1,800 # 800116d0 <proc>
    800023b8:	4989                	li	s3,2
    800023ba:	4a8d                	li	s5,3
    800023bc:	00015917          	auipc	s2,0x15
    800023c0:	51490913          	addi	s2,s2,1300 # 800178d0 <tickslock>
    800023c4:	a821                	j	800023dc <wakeup+0x40>
    800023c6:	0154ac23          	sw	s5,24(s1)
    800023ca:	8526                	mv	a0,s1
    800023cc:	fffff097          	auipc	ra,0xfffff
    800023d0:	8cc080e7          	jalr	-1844(ra) # 80000c98 <release>
    800023d4:	18848493          	addi	s1,s1,392
    800023d8:	03248463          	beq	s1,s2,80002400 <wakeup+0x64>
    800023dc:	fffff097          	auipc	ra,0xfffff
    800023e0:	5d4080e7          	jalr	1492(ra) # 800019b0 <myproc>
    800023e4:	fea488e3          	beq	s1,a0,800023d4 <wakeup+0x38>
    800023e8:	8526                	mv	a0,s1
    800023ea:	ffffe097          	auipc	ra,0xffffe
    800023ee:	7fa080e7          	jalr	2042(ra) # 80000be4 <acquire>
    800023f2:	4c9c                	lw	a5,24(s1)
    800023f4:	fd379be3          	bne	a5,s3,800023ca <wakeup+0x2e>
    800023f8:	709c                	ld	a5,32(s1)
    800023fa:	fd4798e3          	bne	a5,s4,800023ca <wakeup+0x2e>
    800023fe:	b7e1                	j	800023c6 <wakeup+0x2a>
    80002400:	70e2                	ld	ra,56(sp)
    80002402:	7442                	ld	s0,48(sp)
    80002404:	74a2                	ld	s1,40(sp)
    80002406:	7902                	ld	s2,32(sp)
    80002408:	69e2                	ld	s3,24(sp)
    8000240a:	6a42                	ld	s4,16(sp)
    8000240c:	6aa2                	ld	s5,8(sp)
    8000240e:	6121                	addi	sp,sp,64
    80002410:	8082                	ret

0000000080002412 <reparent>:
    80002412:	7179                	addi	sp,sp,-48
    80002414:	f406                	sd	ra,40(sp)
    80002416:	f022                	sd	s0,32(sp)
    80002418:	ec26                	sd	s1,24(sp)
    8000241a:	e84a                	sd	s2,16(sp)
    8000241c:	e44e                	sd	s3,8(sp)
    8000241e:	e052                	sd	s4,0(sp)
    80002420:	1800                	addi	s0,sp,48
    80002422:	892a                	mv	s2,a0
    80002424:	0000f497          	auipc	s1,0xf
    80002428:	2ac48493          	addi	s1,s1,684 # 800116d0 <proc>
    8000242c:	00007a17          	auipc	s4,0x7
    80002430:	bfca0a13          	addi	s4,s4,-1028 # 80009028 <initproc>
    80002434:	00015997          	auipc	s3,0x15
    80002438:	49c98993          	addi	s3,s3,1180 # 800178d0 <tickslock>
    8000243c:	a029                	j	80002446 <reparent+0x34>
    8000243e:	18848493          	addi	s1,s1,392
    80002442:	01348d63          	beq	s1,s3,8000245c <reparent+0x4a>
    80002446:	7c9c                	ld	a5,56(s1)
    80002448:	ff279be3          	bne	a5,s2,8000243e <reparent+0x2c>
    8000244c:	000a3503          	ld	a0,0(s4)
    80002450:	fc88                	sd	a0,56(s1)
    80002452:	00000097          	auipc	ra,0x0
    80002456:	f4a080e7          	jalr	-182(ra) # 8000239c <wakeup>
    8000245a:	b7d5                	j	8000243e <reparent+0x2c>
    8000245c:	70a2                	ld	ra,40(sp)
    8000245e:	7402                	ld	s0,32(sp)
    80002460:	64e2                	ld	s1,24(sp)
    80002462:	6942                	ld	s2,16(sp)
    80002464:	69a2                	ld	s3,8(sp)
    80002466:	6a02                	ld	s4,0(sp)
    80002468:	6145                	addi	sp,sp,48
    8000246a:	8082                	ret

000000008000246c <exit>:
    8000246c:	7179                	addi	sp,sp,-48
    8000246e:	f406                	sd	ra,40(sp)
    80002470:	f022                	sd	s0,32(sp)
    80002472:	ec26                	sd	s1,24(sp)
    80002474:	e84a                	sd	s2,16(sp)
    80002476:	e44e                	sd	s3,8(sp)
    80002478:	e052                	sd	s4,0(sp)
    8000247a:	1800                	addi	s0,sp,48
    8000247c:	8a2a                	mv	s4,a0
    8000247e:	fffff097          	auipc	ra,0xfffff
    80002482:	532080e7          	jalr	1330(ra) # 800019b0 <myproc>
    80002486:	89aa                	mv	s3,a0
    80002488:	00007797          	auipc	a5,0x7
    8000248c:	ba07b783          	ld	a5,-1120(a5) # 80009028 <initproc>
    80002490:	0d050493          	addi	s1,a0,208
    80002494:	15050913          	addi	s2,a0,336
    80002498:	02a79363          	bne	a5,a0,800024be <exit+0x52>
    8000249c:	00006517          	auipc	a0,0x6
    800024a0:	dc450513          	addi	a0,a0,-572 # 80008260 <digits+0x220>
    800024a4:	ffffe097          	auipc	ra,0xffffe
    800024a8:	09a080e7          	jalr	154(ra) # 8000053e <panic>
    800024ac:	00002097          	auipc	ra,0x2
    800024b0:	226080e7          	jalr	550(ra) # 800046d2 <fileclose>
    800024b4:	0004b023          	sd	zero,0(s1)
    800024b8:	04a1                	addi	s1,s1,8
    800024ba:	01248563          	beq	s1,s2,800024c4 <exit+0x58>
    800024be:	6088                	ld	a0,0(s1)
    800024c0:	f575                	bnez	a0,800024ac <exit+0x40>
    800024c2:	bfdd                	j	800024b8 <exit+0x4c>
    800024c4:	00002097          	auipc	ra,0x2
    800024c8:	d42080e7          	jalr	-702(ra) # 80004206 <begin_op>
    800024cc:	1509b503          	ld	a0,336(s3)
    800024d0:	00001097          	auipc	ra,0x1
    800024d4:	51e080e7          	jalr	1310(ra) # 800039ee <iput>
    800024d8:	00002097          	auipc	ra,0x2
    800024dc:	dae080e7          	jalr	-594(ra) # 80004286 <end_op>
    800024e0:	1409b823          	sd	zero,336(s3)
    800024e4:	0000f497          	auipc	s1,0xf
    800024e8:	dd448493          	addi	s1,s1,-556 # 800112b8 <wait_lock>
    800024ec:	8526                	mv	a0,s1
    800024ee:	ffffe097          	auipc	ra,0xffffe
    800024f2:	6f6080e7          	jalr	1782(ra) # 80000be4 <acquire>
    800024f6:	854e                	mv	a0,s3
    800024f8:	00000097          	auipc	ra,0x0
    800024fc:	f1a080e7          	jalr	-230(ra) # 80002412 <reparent>
    80002500:	0389b503          	ld	a0,56(s3)
    80002504:	00000097          	auipc	ra,0x0
    80002508:	e98080e7          	jalr	-360(ra) # 8000239c <wakeup>
    8000250c:	854e                	mv	a0,s3
    8000250e:	ffffe097          	auipc	ra,0xffffe
    80002512:	6d6080e7          	jalr	1750(ra) # 80000be4 <acquire>
    80002516:	0349a623          	sw	s4,44(s3)
    8000251a:	4795                	li	a5,5
    8000251c:	00f9ac23          	sw	a5,24(s3)
    80002520:	00007797          	auipc	a5,0x7
    80002524:	b107a783          	lw	a5,-1264(a5) # 80009030 <ticks>
    80002528:	16f9a823          	sw	a5,368(s3)
    8000252c:	8526                	mv	a0,s1
    8000252e:	ffffe097          	auipc	ra,0xffffe
    80002532:	76a080e7          	jalr	1898(ra) # 80000c98 <release>
    80002536:	00000097          	auipc	ra,0x0
    8000253a:	b36080e7          	jalr	-1226(ra) # 8000206c <sched>
    8000253e:	00006517          	auipc	a0,0x6
    80002542:	d3250513          	addi	a0,a0,-718 # 80008270 <digits+0x230>
    80002546:	ffffe097          	auipc	ra,0xffffe
    8000254a:	ff8080e7          	jalr	-8(ra) # 8000053e <panic>

000000008000254e <kill>:
    8000254e:	7179                	addi	sp,sp,-48
    80002550:	f406                	sd	ra,40(sp)
    80002552:	f022                	sd	s0,32(sp)
    80002554:	ec26                	sd	s1,24(sp)
    80002556:	e84a                	sd	s2,16(sp)
    80002558:	e44e                	sd	s3,8(sp)
    8000255a:	1800                	addi	s0,sp,48
    8000255c:	892a                	mv	s2,a0
    8000255e:	0000f497          	auipc	s1,0xf
    80002562:	17248493          	addi	s1,s1,370 # 800116d0 <proc>
    80002566:	00015997          	auipc	s3,0x15
    8000256a:	36a98993          	addi	s3,s3,874 # 800178d0 <tickslock>
    8000256e:	8526                	mv	a0,s1
    80002570:	ffffe097          	auipc	ra,0xffffe
    80002574:	674080e7          	jalr	1652(ra) # 80000be4 <acquire>
    80002578:	589c                	lw	a5,48(s1)
    8000257a:	01278d63          	beq	a5,s2,80002594 <kill+0x46>
    8000257e:	8526                	mv	a0,s1
    80002580:	ffffe097          	auipc	ra,0xffffe
    80002584:	718080e7          	jalr	1816(ra) # 80000c98 <release>
    80002588:	18848493          	addi	s1,s1,392
    8000258c:	ff3491e3          	bne	s1,s3,8000256e <kill+0x20>
    80002590:	557d                	li	a0,-1
    80002592:	a829                	j	800025ac <kill+0x5e>
    80002594:	4785                	li	a5,1
    80002596:	d49c                	sw	a5,40(s1)
    80002598:	4c98                	lw	a4,24(s1)
    8000259a:	4789                	li	a5,2
    8000259c:	00f70f63          	beq	a4,a5,800025ba <kill+0x6c>
    800025a0:	8526                	mv	a0,s1
    800025a2:	ffffe097          	auipc	ra,0xffffe
    800025a6:	6f6080e7          	jalr	1782(ra) # 80000c98 <release>
    800025aa:	4501                	li	a0,0
    800025ac:	70a2                	ld	ra,40(sp)
    800025ae:	7402                	ld	s0,32(sp)
    800025b0:	64e2                	ld	s1,24(sp)
    800025b2:	6942                	ld	s2,16(sp)
    800025b4:	69a2                	ld	s3,8(sp)
    800025b6:	6145                	addi	sp,sp,48
    800025b8:	8082                	ret
    800025ba:	478d                	li	a5,3
    800025bc:	cc9c                	sw	a5,24(s1)
    800025be:	b7cd                	j	800025a0 <kill+0x52>

00000000800025c0 <either_copyout>:
    800025c0:	7179                	addi	sp,sp,-48
    800025c2:	f406                	sd	ra,40(sp)
    800025c4:	f022                	sd	s0,32(sp)
    800025c6:	ec26                	sd	s1,24(sp)
    800025c8:	e84a                	sd	s2,16(sp)
    800025ca:	e44e                	sd	s3,8(sp)
    800025cc:	e052                	sd	s4,0(sp)
    800025ce:	1800                	addi	s0,sp,48
    800025d0:	84aa                	mv	s1,a0
    800025d2:	892e                	mv	s2,a1
    800025d4:	89b2                	mv	s3,a2
    800025d6:	8a36                	mv	s4,a3
    800025d8:	fffff097          	auipc	ra,0xfffff
    800025dc:	3d8080e7          	jalr	984(ra) # 800019b0 <myproc>
    800025e0:	c08d                	beqz	s1,80002602 <either_copyout+0x42>
    800025e2:	86d2                	mv	a3,s4
    800025e4:	864e                	mv	a2,s3
    800025e6:	85ca                	mv	a1,s2
    800025e8:	6928                	ld	a0,80(a0)
    800025ea:	fffff097          	auipc	ra,0xfffff
    800025ee:	088080e7          	jalr	136(ra) # 80001672 <copyout>
    800025f2:	70a2                	ld	ra,40(sp)
    800025f4:	7402                	ld	s0,32(sp)
    800025f6:	64e2                	ld	s1,24(sp)
    800025f8:	6942                	ld	s2,16(sp)
    800025fa:	69a2                	ld	s3,8(sp)
    800025fc:	6a02                	ld	s4,0(sp)
    800025fe:	6145                	addi	sp,sp,48
    80002600:	8082                	ret
    80002602:	000a061b          	sext.w	a2,s4
    80002606:	85ce                	mv	a1,s3
    80002608:	854a                	mv	a0,s2
    8000260a:	ffffe097          	auipc	ra,0xffffe
    8000260e:	736080e7          	jalr	1846(ra) # 80000d40 <memmove>
    80002612:	8526                	mv	a0,s1
    80002614:	bff9                	j	800025f2 <either_copyout+0x32>

0000000080002616 <either_copyin>:
    80002616:	7179                	addi	sp,sp,-48
    80002618:	f406                	sd	ra,40(sp)
    8000261a:	f022                	sd	s0,32(sp)
    8000261c:	ec26                	sd	s1,24(sp)
    8000261e:	e84a                	sd	s2,16(sp)
    80002620:	e44e                	sd	s3,8(sp)
    80002622:	e052                	sd	s4,0(sp)
    80002624:	1800                	addi	s0,sp,48
    80002626:	892a                	mv	s2,a0
    80002628:	84ae                	mv	s1,a1
    8000262a:	89b2                	mv	s3,a2
    8000262c:	8a36                	mv	s4,a3
    8000262e:	fffff097          	auipc	ra,0xfffff
    80002632:	382080e7          	jalr	898(ra) # 800019b0 <myproc>
    80002636:	c08d                	beqz	s1,80002658 <either_copyin+0x42>
    80002638:	86d2                	mv	a3,s4
    8000263a:	864e                	mv	a2,s3
    8000263c:	85ca                	mv	a1,s2
    8000263e:	6928                	ld	a0,80(a0)
    80002640:	fffff097          	auipc	ra,0xfffff
    80002644:	0be080e7          	jalr	190(ra) # 800016fe <copyin>
    80002648:	70a2                	ld	ra,40(sp)
    8000264a:	7402                	ld	s0,32(sp)
    8000264c:	64e2                	ld	s1,24(sp)
    8000264e:	6942                	ld	s2,16(sp)
    80002650:	69a2                	ld	s3,8(sp)
    80002652:	6a02                	ld	s4,0(sp)
    80002654:	6145                	addi	sp,sp,48
    80002656:	8082                	ret
    80002658:	000a061b          	sext.w	a2,s4
    8000265c:	85ce                	mv	a1,s3
    8000265e:	854a                	mv	a0,s2
    80002660:	ffffe097          	auipc	ra,0xffffe
    80002664:	6e0080e7          	jalr	1760(ra) # 80000d40 <memmove>
    80002668:	8526                	mv	a0,s1
    8000266a:	bff9                	j	80002648 <either_copyin+0x32>

000000008000266c <procdump>:
    8000266c:	715d                	addi	sp,sp,-80
    8000266e:	e486                	sd	ra,72(sp)
    80002670:	e0a2                	sd	s0,64(sp)
    80002672:	fc26                	sd	s1,56(sp)
    80002674:	f84a                	sd	s2,48(sp)
    80002676:	f44e                	sd	s3,40(sp)
    80002678:	f052                	sd	s4,32(sp)
    8000267a:	ec56                	sd	s5,24(sp)
    8000267c:	e85a                	sd	s6,16(sp)
    8000267e:	e45e                	sd	s7,8(sp)
    80002680:	0880                	addi	s0,sp,80
    80002682:	00006517          	auipc	a0,0x6
    80002686:	a4650513          	addi	a0,a0,-1466 # 800080c8 <digits+0x88>
    8000268a:	ffffe097          	auipc	ra,0xffffe
    8000268e:	efe080e7          	jalr	-258(ra) # 80000588 <printf>
    80002692:	0000f497          	auipc	s1,0xf
    80002696:	19648493          	addi	s1,s1,406 # 80011828 <proc+0x158>
    8000269a:	00015917          	auipc	s2,0x15
    8000269e:	38e90913          	addi	s2,s2,910 # 80017a28 <bcache+0x140>
    800026a2:	4b15                	li	s6,5
    800026a4:	00006997          	auipc	s3,0x6
    800026a8:	bdc98993          	addi	s3,s3,-1060 # 80008280 <digits+0x240>
    800026ac:	00006a97          	auipc	s5,0x6
    800026b0:	bdca8a93          	addi	s5,s5,-1060 # 80008288 <digits+0x248>
    800026b4:	00006a17          	auipc	s4,0x6
    800026b8:	a14a0a13          	addi	s4,s4,-1516 # 800080c8 <digits+0x88>
    800026bc:	00006b97          	auipc	s7,0x6
    800026c0:	c04b8b93          	addi	s7,s7,-1020 # 800082c0 <states.1744>
    800026c4:	a00d                	j	800026e6 <procdump+0x7a>
    800026c6:	ed86a583          	lw	a1,-296(a3)
    800026ca:	8556                	mv	a0,s5
    800026cc:	ffffe097          	auipc	ra,0xffffe
    800026d0:	ebc080e7          	jalr	-324(ra) # 80000588 <printf>
    800026d4:	8552                	mv	a0,s4
    800026d6:	ffffe097          	auipc	ra,0xffffe
    800026da:	eb2080e7          	jalr	-334(ra) # 80000588 <printf>
    800026de:	18848493          	addi	s1,s1,392
    800026e2:	03248163          	beq	s1,s2,80002704 <procdump+0x98>
    800026e6:	86a6                	mv	a3,s1
    800026e8:	ec04a783          	lw	a5,-320(s1)
    800026ec:	dbed                	beqz	a5,800026de <procdump+0x72>
    800026ee:	864e                	mv	a2,s3
    800026f0:	fcfb6be3          	bltu	s6,a5,800026c6 <procdump+0x5a>
    800026f4:	1782                	slli	a5,a5,0x20
    800026f6:	9381                	srli	a5,a5,0x20
    800026f8:	078e                	slli	a5,a5,0x3
    800026fa:	97de                	add	a5,a5,s7
    800026fc:	6390                	ld	a2,0(a5)
    800026fe:	f661                	bnez	a2,800026c6 <procdump+0x5a>
    80002700:	864e                	mv	a2,s3
    80002702:	b7d1                	j	800026c6 <procdump+0x5a>
    80002704:	60a6                	ld	ra,72(sp)
    80002706:	6406                	ld	s0,64(sp)
    80002708:	74e2                	ld	s1,56(sp)
    8000270a:	7942                	ld	s2,48(sp)
    8000270c:	79a2                	ld	s3,40(sp)
    8000270e:	7a02                	ld	s4,32(sp)
    80002710:	6ae2                	ld	s5,24(sp)
    80002712:	6b42                	ld	s6,16(sp)
    80002714:	6ba2                	ld	s7,8(sp)
    80002716:	6161                	addi	sp,sp,80
    80002718:	8082                	ret

000000008000271a <swtch>:
    8000271a:	00153023          	sd	ra,0(a0)
    8000271e:	00253423          	sd	sp,8(a0)
    80002722:	e900                	sd	s0,16(a0)
    80002724:	ed04                	sd	s1,24(a0)
    80002726:	03253023          	sd	s2,32(a0)
    8000272a:	03353423          	sd	s3,40(a0)
    8000272e:	03453823          	sd	s4,48(a0)
    80002732:	03553c23          	sd	s5,56(a0)
    80002736:	05653023          	sd	s6,64(a0)
    8000273a:	05753423          	sd	s7,72(a0)
    8000273e:	05853823          	sd	s8,80(a0)
    80002742:	05953c23          	sd	s9,88(a0)
    80002746:	07a53023          	sd	s10,96(a0)
    8000274a:	07b53423          	sd	s11,104(a0)
    8000274e:	0005b083          	ld	ra,0(a1)
    80002752:	0085b103          	ld	sp,8(a1)
    80002756:	6980                	ld	s0,16(a1)
    80002758:	6d84                	ld	s1,24(a1)
    8000275a:	0205b903          	ld	s2,32(a1)
    8000275e:	0285b983          	ld	s3,40(a1)
    80002762:	0305ba03          	ld	s4,48(a1)
    80002766:	0385ba83          	ld	s5,56(a1)
    8000276a:	0405bb03          	ld	s6,64(a1)
    8000276e:	0485bb83          	ld	s7,72(a1)
    80002772:	0505bc03          	ld	s8,80(a1)
    80002776:	0585bc83          	ld	s9,88(a1)
    8000277a:	0605bd03          	ld	s10,96(a1)
    8000277e:	0685bd83          	ld	s11,104(a1)
    80002782:	8082                	ret

0000000080002784 <trapinit>:
    80002784:	1141                	addi	sp,sp,-16
    80002786:	e406                	sd	ra,8(sp)
    80002788:	e022                	sd	s0,0(sp)
    8000278a:	0800                	addi	s0,sp,16
    8000278c:	00006597          	auipc	a1,0x6
    80002790:	b6458593          	addi	a1,a1,-1180 # 800082f0 <states.1744+0x30>
    80002794:	00015517          	auipc	a0,0x15
    80002798:	13c50513          	addi	a0,a0,316 # 800178d0 <tickslock>
    8000279c:	ffffe097          	auipc	ra,0xffffe
    800027a0:	3b8080e7          	jalr	952(ra) # 80000b54 <initlock>
    800027a4:	60a2                	ld	ra,8(sp)
    800027a6:	6402                	ld	s0,0(sp)
    800027a8:	0141                	addi	sp,sp,16
    800027aa:	8082                	ret

00000000800027ac <trapinithart>:
    800027ac:	1141                	addi	sp,sp,-16
    800027ae:	e422                	sd	s0,8(sp)
    800027b0:	0800                	addi	s0,sp,16
    800027b2:	00003797          	auipc	a5,0x3
    800027b6:	53e78793          	addi	a5,a5,1342 # 80005cf0 <kernelvec>
    800027ba:	10579073          	csrw	stvec,a5
    800027be:	6422                	ld	s0,8(sp)
    800027c0:	0141                	addi	sp,sp,16
    800027c2:	8082                	ret

00000000800027c4 <usertrapret>:
    800027c4:	1141                	addi	sp,sp,-16
    800027c6:	e406                	sd	ra,8(sp)
    800027c8:	e022                	sd	s0,0(sp)
    800027ca:	0800                	addi	s0,sp,16
    800027cc:	fffff097          	auipc	ra,0xfffff
    800027d0:	1e4080e7          	jalr	484(ra) # 800019b0 <myproc>
    800027d4:	100027f3          	csrr	a5,sstatus
    800027d8:	9bf5                	andi	a5,a5,-3
    800027da:	10079073          	csrw	sstatus,a5
    800027de:	00005617          	auipc	a2,0x5
    800027e2:	82260613          	addi	a2,a2,-2014 # 80007000 <_trampoline>
    800027e6:	00005697          	auipc	a3,0x5
    800027ea:	81a68693          	addi	a3,a3,-2022 # 80007000 <_trampoline>
    800027ee:	8e91                	sub	a3,a3,a2
    800027f0:	040007b7          	lui	a5,0x4000
    800027f4:	17fd                	addi	a5,a5,-1
    800027f6:	07b2                	slli	a5,a5,0xc
    800027f8:	96be                	add	a3,a3,a5
    800027fa:	10569073          	csrw	stvec,a3
    800027fe:	6d38                	ld	a4,88(a0)
    80002800:	180026f3          	csrr	a3,satp
    80002804:	e314                	sd	a3,0(a4)
    80002806:	6d38                	ld	a4,88(a0)
    80002808:	6134                	ld	a3,64(a0)
    8000280a:	6585                	lui	a1,0x1
    8000280c:	96ae                	add	a3,a3,a1
    8000280e:	e714                	sd	a3,8(a4)
    80002810:	6d38                	ld	a4,88(a0)
    80002812:	00000697          	auipc	a3,0x0
    80002816:	14668693          	addi	a3,a3,326 # 80002958 <usertrap>
    8000281a:	eb14                	sd	a3,16(a4)
    8000281c:	6d38                	ld	a4,88(a0)
    8000281e:	8692                	mv	a3,tp
    80002820:	f314                	sd	a3,32(a4)
    80002822:	100026f3          	csrr	a3,sstatus
    80002826:	eff6f693          	andi	a3,a3,-257
    8000282a:	0206e693          	ori	a3,a3,32
    8000282e:	10069073          	csrw	sstatus,a3
    80002832:	6d38                	ld	a4,88(a0)
    80002834:	6f18                	ld	a4,24(a4)
    80002836:	14171073          	csrw	sepc,a4
    8000283a:	692c                	ld	a1,80(a0)
    8000283c:	81b1                	srli	a1,a1,0xc
    8000283e:	00005717          	auipc	a4,0x5
    80002842:	85270713          	addi	a4,a4,-1966 # 80007090 <userret>
    80002846:	8f11                	sub	a4,a4,a2
    80002848:	97ba                	add	a5,a5,a4
    8000284a:	577d                	li	a4,-1
    8000284c:	177e                	slli	a4,a4,0x3f
    8000284e:	8dd9                	or	a1,a1,a4
    80002850:	02000537          	lui	a0,0x2000
    80002854:	157d                	addi	a0,a0,-1
    80002856:	0536                	slli	a0,a0,0xd
    80002858:	9782                	jalr	a5
    8000285a:	60a2                	ld	ra,8(sp)
    8000285c:	6402                	ld	s0,0(sp)
    8000285e:	0141                	addi	sp,sp,16
    80002860:	8082                	ret

0000000080002862 <clockintr>:
    80002862:	1101                	addi	sp,sp,-32
    80002864:	ec06                	sd	ra,24(sp)
    80002866:	e822                	sd	s0,16(sp)
    80002868:	e426                	sd	s1,8(sp)
    8000286a:	e04a                	sd	s2,0(sp)
    8000286c:	1000                	addi	s0,sp,32
    8000286e:	00015917          	auipc	s2,0x15
    80002872:	06290913          	addi	s2,s2,98 # 800178d0 <tickslock>
    80002876:	854a                	mv	a0,s2
    80002878:	ffffe097          	auipc	ra,0xffffe
    8000287c:	36c080e7          	jalr	876(ra) # 80000be4 <acquire>
    80002880:	00006497          	auipc	s1,0x6
    80002884:	7b048493          	addi	s1,s1,1968 # 80009030 <ticks>
    80002888:	409c                	lw	a5,0(s1)
    8000288a:	2785                	addiw	a5,a5,1
    8000288c:	c09c                	sw	a5,0(s1)
    8000288e:	fffff097          	auipc	ra,0xfffff
    80002892:	668080e7          	jalr	1640(ra) # 80001ef6 <update_time>
    80002896:	8526                	mv	a0,s1
    80002898:	00000097          	auipc	ra,0x0
    8000289c:	b04080e7          	jalr	-1276(ra) # 8000239c <wakeup>
    800028a0:	854a                	mv	a0,s2
    800028a2:	ffffe097          	auipc	ra,0xffffe
    800028a6:	3f6080e7          	jalr	1014(ra) # 80000c98 <release>
    800028aa:	60e2                	ld	ra,24(sp)
    800028ac:	6442                	ld	s0,16(sp)
    800028ae:	64a2                	ld	s1,8(sp)
    800028b0:	6902                	ld	s2,0(sp)
    800028b2:	6105                	addi	sp,sp,32
    800028b4:	8082                	ret

00000000800028b6 <devintr>:
    800028b6:	1101                	addi	sp,sp,-32
    800028b8:	ec06                	sd	ra,24(sp)
    800028ba:	e822                	sd	s0,16(sp)
    800028bc:	e426                	sd	s1,8(sp)
    800028be:	1000                	addi	s0,sp,32
    800028c0:	14202773          	csrr	a4,scause
    800028c4:	00074d63          	bltz	a4,800028de <devintr+0x28>
    800028c8:	57fd                	li	a5,-1
    800028ca:	17fe                	slli	a5,a5,0x3f
    800028cc:	0785                	addi	a5,a5,1
    800028ce:	4501                	li	a0,0
    800028d0:	06f70363          	beq	a4,a5,80002936 <devintr+0x80>
    800028d4:	60e2                	ld	ra,24(sp)
    800028d6:	6442                	ld	s0,16(sp)
    800028d8:	64a2                	ld	s1,8(sp)
    800028da:	6105                	addi	sp,sp,32
    800028dc:	8082                	ret
    800028de:	0ff77793          	andi	a5,a4,255
    800028e2:	46a5                	li	a3,9
    800028e4:	fed792e3          	bne	a5,a3,800028c8 <devintr+0x12>
    800028e8:	00003097          	auipc	ra,0x3
    800028ec:	510080e7          	jalr	1296(ra) # 80005df8 <plic_claim>
    800028f0:	84aa                	mv	s1,a0
    800028f2:	47a9                	li	a5,10
    800028f4:	02f50763          	beq	a0,a5,80002922 <devintr+0x6c>
    800028f8:	4785                	li	a5,1
    800028fa:	02f50963          	beq	a0,a5,8000292c <devintr+0x76>
    800028fe:	4505                	li	a0,1
    80002900:	d8f1                	beqz	s1,800028d4 <devintr+0x1e>
    80002902:	85a6                	mv	a1,s1
    80002904:	00006517          	auipc	a0,0x6
    80002908:	9f450513          	addi	a0,a0,-1548 # 800082f8 <states.1744+0x38>
    8000290c:	ffffe097          	auipc	ra,0xffffe
    80002910:	c7c080e7          	jalr	-900(ra) # 80000588 <printf>
    80002914:	8526                	mv	a0,s1
    80002916:	00003097          	auipc	ra,0x3
    8000291a:	506080e7          	jalr	1286(ra) # 80005e1c <plic_complete>
    8000291e:	4505                	li	a0,1
    80002920:	bf55                	j	800028d4 <devintr+0x1e>
    80002922:	ffffe097          	auipc	ra,0xffffe
    80002926:	086080e7          	jalr	134(ra) # 800009a8 <uartintr>
    8000292a:	b7ed                	j	80002914 <devintr+0x5e>
    8000292c:	00004097          	auipc	ra,0x4
    80002930:	9d0080e7          	jalr	-1584(ra) # 800062fc <virtio_disk_intr>
    80002934:	b7c5                	j	80002914 <devintr+0x5e>
    80002936:	fffff097          	auipc	ra,0xfffff
    8000293a:	04e080e7          	jalr	78(ra) # 80001984 <cpuid>
    8000293e:	c901                	beqz	a0,8000294e <devintr+0x98>
    80002940:	144027f3          	csrr	a5,sip
    80002944:	9bf5                	andi	a5,a5,-3
    80002946:	14479073          	csrw	sip,a5
    8000294a:	4509                	li	a0,2
    8000294c:	b761                	j	800028d4 <devintr+0x1e>
    8000294e:	00000097          	auipc	ra,0x0
    80002952:	f14080e7          	jalr	-236(ra) # 80002862 <clockintr>
    80002956:	b7ed                	j	80002940 <devintr+0x8a>

0000000080002958 <usertrap>:
    80002958:	1101                	addi	sp,sp,-32
    8000295a:	ec06                	sd	ra,24(sp)
    8000295c:	e822                	sd	s0,16(sp)
    8000295e:	e426                	sd	s1,8(sp)
    80002960:	e04a                	sd	s2,0(sp)
    80002962:	1000                	addi	s0,sp,32
    80002964:	100027f3          	csrr	a5,sstatus
    80002968:	1007f793          	andi	a5,a5,256
    8000296c:	e3ad                	bnez	a5,800029ce <usertrap+0x76>
    8000296e:	00003797          	auipc	a5,0x3
    80002972:	38278793          	addi	a5,a5,898 # 80005cf0 <kernelvec>
    80002976:	10579073          	csrw	stvec,a5
    8000297a:	fffff097          	auipc	ra,0xfffff
    8000297e:	036080e7          	jalr	54(ra) # 800019b0 <myproc>
    80002982:	84aa                	mv	s1,a0
    80002984:	6d3c                	ld	a5,88(a0)
    80002986:	14102773          	csrr	a4,sepc
    8000298a:	ef98                	sd	a4,24(a5)
    8000298c:	14202773          	csrr	a4,scause
    80002990:	47a1                	li	a5,8
    80002992:	04f71c63          	bne	a4,a5,800029ea <usertrap+0x92>
    80002996:	551c                	lw	a5,40(a0)
    80002998:	e3b9                	bnez	a5,800029de <usertrap+0x86>
    8000299a:	6cb8                	ld	a4,88(s1)
    8000299c:	6f1c                	ld	a5,24(a4)
    8000299e:	0791                	addi	a5,a5,4
    800029a0:	ef1c                	sd	a5,24(a4)
    800029a2:	100027f3          	csrr	a5,sstatus
    800029a6:	0027e793          	ori	a5,a5,2
    800029aa:	10079073          	csrw	sstatus,a5
    800029ae:	00000097          	auipc	ra,0x0
    800029b2:	2e0080e7          	jalr	736(ra) # 80002c8e <syscall>
    800029b6:	549c                	lw	a5,40(s1)
    800029b8:	ebc1                	bnez	a5,80002a48 <usertrap+0xf0>
    800029ba:	00000097          	auipc	ra,0x0
    800029be:	e0a080e7          	jalr	-502(ra) # 800027c4 <usertrapret>
    800029c2:	60e2                	ld	ra,24(sp)
    800029c4:	6442                	ld	s0,16(sp)
    800029c6:	64a2                	ld	s1,8(sp)
    800029c8:	6902                	ld	s2,0(sp)
    800029ca:	6105                	addi	sp,sp,32
    800029cc:	8082                	ret
    800029ce:	00006517          	auipc	a0,0x6
    800029d2:	94a50513          	addi	a0,a0,-1718 # 80008318 <states.1744+0x58>
    800029d6:	ffffe097          	auipc	ra,0xffffe
    800029da:	b68080e7          	jalr	-1176(ra) # 8000053e <panic>
    800029de:	557d                	li	a0,-1
    800029e0:	00000097          	auipc	ra,0x0
    800029e4:	a8c080e7          	jalr	-1396(ra) # 8000246c <exit>
    800029e8:	bf4d                	j	8000299a <usertrap+0x42>
    800029ea:	00000097          	auipc	ra,0x0
    800029ee:	ecc080e7          	jalr	-308(ra) # 800028b6 <devintr>
    800029f2:	892a                	mv	s2,a0
    800029f4:	c501                	beqz	a0,800029fc <usertrap+0xa4>
    800029f6:	549c                	lw	a5,40(s1)
    800029f8:	c3a1                	beqz	a5,80002a38 <usertrap+0xe0>
    800029fa:	a815                	j	80002a2e <usertrap+0xd6>
    800029fc:	142025f3          	csrr	a1,scause
    80002a00:	5890                	lw	a2,48(s1)
    80002a02:	00006517          	auipc	a0,0x6
    80002a06:	93650513          	addi	a0,a0,-1738 # 80008338 <states.1744+0x78>
    80002a0a:	ffffe097          	auipc	ra,0xffffe
    80002a0e:	b7e080e7          	jalr	-1154(ra) # 80000588 <printf>
    80002a12:	141025f3          	csrr	a1,sepc
    80002a16:	14302673          	csrr	a2,stval
    80002a1a:	00006517          	auipc	a0,0x6
    80002a1e:	94e50513          	addi	a0,a0,-1714 # 80008368 <states.1744+0xa8>
    80002a22:	ffffe097          	auipc	ra,0xffffe
    80002a26:	b66080e7          	jalr	-1178(ra) # 80000588 <printf>
    80002a2a:	4785                	li	a5,1
    80002a2c:	d49c                	sw	a5,40(s1)
    80002a2e:	557d                	li	a0,-1
    80002a30:	00000097          	auipc	ra,0x0
    80002a34:	a3c080e7          	jalr	-1476(ra) # 8000246c <exit>
    80002a38:	4789                	li	a5,2
    80002a3a:	f8f910e3          	bne	s2,a5,800029ba <usertrap+0x62>
    80002a3e:	fffff097          	auipc	ra,0xfffff
    80002a42:	704080e7          	jalr	1796(ra) # 80002142 <yield>
    80002a46:	bf95                	j	800029ba <usertrap+0x62>
    80002a48:	4901                	li	s2,0
    80002a4a:	b7d5                	j	80002a2e <usertrap+0xd6>

0000000080002a4c <kerneltrap>:
    80002a4c:	7179                	addi	sp,sp,-48
    80002a4e:	f406                	sd	ra,40(sp)
    80002a50:	f022                	sd	s0,32(sp)
    80002a52:	ec26                	sd	s1,24(sp)
    80002a54:	e84a                	sd	s2,16(sp)
    80002a56:	e44e                	sd	s3,8(sp)
    80002a58:	1800                	addi	s0,sp,48
    80002a5a:	14102973          	csrr	s2,sepc
    80002a5e:	100024f3          	csrr	s1,sstatus
    80002a62:	142029f3          	csrr	s3,scause
    80002a66:	1004f793          	andi	a5,s1,256
    80002a6a:	cb85                	beqz	a5,80002a9a <kerneltrap+0x4e>
    80002a6c:	100027f3          	csrr	a5,sstatus
    80002a70:	8b89                	andi	a5,a5,2
    80002a72:	ef85                	bnez	a5,80002aaa <kerneltrap+0x5e>
    80002a74:	00000097          	auipc	ra,0x0
    80002a78:	e42080e7          	jalr	-446(ra) # 800028b6 <devintr>
    80002a7c:	cd1d                	beqz	a0,80002aba <kerneltrap+0x6e>
    80002a7e:	4789                	li	a5,2
    80002a80:	06f50a63          	beq	a0,a5,80002af4 <kerneltrap+0xa8>
    80002a84:	14191073          	csrw	sepc,s2
    80002a88:	10049073          	csrw	sstatus,s1
    80002a8c:	70a2                	ld	ra,40(sp)
    80002a8e:	7402                	ld	s0,32(sp)
    80002a90:	64e2                	ld	s1,24(sp)
    80002a92:	6942                	ld	s2,16(sp)
    80002a94:	69a2                	ld	s3,8(sp)
    80002a96:	6145                	addi	sp,sp,48
    80002a98:	8082                	ret
    80002a9a:	00006517          	auipc	a0,0x6
    80002a9e:	8ee50513          	addi	a0,a0,-1810 # 80008388 <states.1744+0xc8>
    80002aa2:	ffffe097          	auipc	ra,0xffffe
    80002aa6:	a9c080e7          	jalr	-1380(ra) # 8000053e <panic>
    80002aaa:	00006517          	auipc	a0,0x6
    80002aae:	90650513          	addi	a0,a0,-1786 # 800083b0 <states.1744+0xf0>
    80002ab2:	ffffe097          	auipc	ra,0xffffe
    80002ab6:	a8c080e7          	jalr	-1396(ra) # 8000053e <panic>
    80002aba:	85ce                	mv	a1,s3
    80002abc:	00006517          	auipc	a0,0x6
    80002ac0:	91450513          	addi	a0,a0,-1772 # 800083d0 <states.1744+0x110>
    80002ac4:	ffffe097          	auipc	ra,0xffffe
    80002ac8:	ac4080e7          	jalr	-1340(ra) # 80000588 <printf>
    80002acc:	141025f3          	csrr	a1,sepc
    80002ad0:	14302673          	csrr	a2,stval
    80002ad4:	00006517          	auipc	a0,0x6
    80002ad8:	90c50513          	addi	a0,a0,-1780 # 800083e0 <states.1744+0x120>
    80002adc:	ffffe097          	auipc	ra,0xffffe
    80002ae0:	aac080e7          	jalr	-1364(ra) # 80000588 <printf>
    80002ae4:	00006517          	auipc	a0,0x6
    80002ae8:	91450513          	addi	a0,a0,-1772 # 800083f8 <states.1744+0x138>
    80002aec:	ffffe097          	auipc	ra,0xffffe
    80002af0:	a52080e7          	jalr	-1454(ra) # 8000053e <panic>
    80002af4:	fffff097          	auipc	ra,0xfffff
    80002af8:	ebc080e7          	jalr	-324(ra) # 800019b0 <myproc>
    80002afc:	d541                	beqz	a0,80002a84 <kerneltrap+0x38>
    80002afe:	fffff097          	auipc	ra,0xfffff
    80002b02:	eb2080e7          	jalr	-334(ra) # 800019b0 <myproc>
    80002b06:	4d18                	lw	a4,24(a0)
    80002b08:	4791                	li	a5,4
    80002b0a:	f6f71de3          	bne	a4,a5,80002a84 <kerneltrap+0x38>
    80002b0e:	fffff097          	auipc	ra,0xfffff
    80002b12:	634080e7          	jalr	1588(ra) # 80002142 <yield>
    80002b16:	b7bd                	j	80002a84 <kerneltrap+0x38>

0000000080002b18 <argraw>:
  return strlen(buf);
}

static uint64
argraw(int n)
{
    80002b18:	1101                	addi	sp,sp,-32
    80002b1a:	ec06                	sd	ra,24(sp)
    80002b1c:	e822                	sd	s0,16(sp)
    80002b1e:	e426                	sd	s1,8(sp)
    80002b20:	1000                	addi	s0,sp,32
    80002b22:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80002b24:	fffff097          	auipc	ra,0xfffff
    80002b28:	e8c080e7          	jalr	-372(ra) # 800019b0 <myproc>
  switch (n)
    80002b2c:	4795                	li	a5,5
    80002b2e:	0497e163          	bltu	a5,s1,80002b70 <argraw+0x58>
    80002b32:	048a                	slli	s1,s1,0x2
    80002b34:	00006717          	auipc	a4,0x6
    80002b38:	9b470713          	addi	a4,a4,-1612 # 800084e8 <states.1744+0x228>
    80002b3c:	94ba                	add	s1,s1,a4
    80002b3e:	409c                	lw	a5,0(s1)
    80002b40:	97ba                	add	a5,a5,a4
    80002b42:	8782                	jr	a5
  {
  case 0:
    return p->trapframe->a0;
    80002b44:	6d3c                	ld	a5,88(a0)
    80002b46:	7ba8                	ld	a0,112(a5)
  case 5:
    return p->trapframe->a5;
  }
  panic("argraw");
  return -1;
}
    80002b48:	60e2                	ld	ra,24(sp)
    80002b4a:	6442                	ld	s0,16(sp)
    80002b4c:	64a2                	ld	s1,8(sp)
    80002b4e:	6105                	addi	sp,sp,32
    80002b50:	8082                	ret
    return p->trapframe->a1;
    80002b52:	6d3c                	ld	a5,88(a0)
    80002b54:	7fa8                	ld	a0,120(a5)
    80002b56:	bfcd                	j	80002b48 <argraw+0x30>
    return p->trapframe->a2;
    80002b58:	6d3c                	ld	a5,88(a0)
    80002b5a:	63c8                	ld	a0,128(a5)
    80002b5c:	b7f5                	j	80002b48 <argraw+0x30>
    return p->trapframe->a3;
    80002b5e:	6d3c                	ld	a5,88(a0)
    80002b60:	67c8                	ld	a0,136(a5)
    80002b62:	b7dd                	j	80002b48 <argraw+0x30>
    return p->trapframe->a4;
    80002b64:	6d3c                	ld	a5,88(a0)
    80002b66:	6bc8                	ld	a0,144(a5)
    80002b68:	b7c5                	j	80002b48 <argraw+0x30>
    return p->trapframe->a5;
    80002b6a:	6d3c                	ld	a5,88(a0)
    80002b6c:	6fc8                	ld	a0,152(a5)
    80002b6e:	bfe9                	j	80002b48 <argraw+0x30>
  panic("argraw");
    80002b70:	00006517          	auipc	a0,0x6
    80002b74:	89850513          	addi	a0,a0,-1896 # 80008408 <states.1744+0x148>
    80002b78:	ffffe097          	auipc	ra,0xffffe
    80002b7c:	9c6080e7          	jalr	-1594(ra) # 8000053e <panic>

0000000080002b80 <fetchaddr>:
{
    80002b80:	1101                	addi	sp,sp,-32
    80002b82:	ec06                	sd	ra,24(sp)
    80002b84:	e822                	sd	s0,16(sp)
    80002b86:	e426                	sd	s1,8(sp)
    80002b88:	e04a                	sd	s2,0(sp)
    80002b8a:	1000                	addi	s0,sp,32
    80002b8c:	84aa                	mv	s1,a0
    80002b8e:	892e                	mv	s2,a1
  struct proc *p = myproc();
    80002b90:	fffff097          	auipc	ra,0xfffff
    80002b94:	e20080e7          	jalr	-480(ra) # 800019b0 <myproc>
  if (addr >= p->sz || addr + sizeof(uint64) > p->sz)
    80002b98:	653c                	ld	a5,72(a0)
    80002b9a:	02f4f863          	bgeu	s1,a5,80002bca <fetchaddr+0x4a>
    80002b9e:	00848713          	addi	a4,s1,8
    80002ba2:	02e7e663          	bltu	a5,a4,80002bce <fetchaddr+0x4e>
  if (copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    80002ba6:	46a1                	li	a3,8
    80002ba8:	8626                	mv	a2,s1
    80002baa:	85ca                	mv	a1,s2
    80002bac:	6928                	ld	a0,80(a0)
    80002bae:	fffff097          	auipc	ra,0xfffff
    80002bb2:	b50080e7          	jalr	-1200(ra) # 800016fe <copyin>
    80002bb6:	00a03533          	snez	a0,a0
    80002bba:	40a00533          	neg	a0,a0
}
    80002bbe:	60e2                	ld	ra,24(sp)
    80002bc0:	6442                	ld	s0,16(sp)
    80002bc2:	64a2                	ld	s1,8(sp)
    80002bc4:	6902                	ld	s2,0(sp)
    80002bc6:	6105                	addi	sp,sp,32
    80002bc8:	8082                	ret
    return -1;
    80002bca:	557d                	li	a0,-1
    80002bcc:	bfcd                	j	80002bbe <fetchaddr+0x3e>
    80002bce:	557d                	li	a0,-1
    80002bd0:	b7fd                	j	80002bbe <fetchaddr+0x3e>

0000000080002bd2 <fetchstr>:
{
    80002bd2:	7179                	addi	sp,sp,-48
    80002bd4:	f406                	sd	ra,40(sp)
    80002bd6:	f022                	sd	s0,32(sp)
    80002bd8:	ec26                	sd	s1,24(sp)
    80002bda:	e84a                	sd	s2,16(sp)
    80002bdc:	e44e                	sd	s3,8(sp)
    80002bde:	1800                	addi	s0,sp,48
    80002be0:	892a                	mv	s2,a0
    80002be2:	84ae                	mv	s1,a1
    80002be4:	89b2                	mv	s3,a2
  struct proc *p = myproc();
    80002be6:	fffff097          	auipc	ra,0xfffff
    80002bea:	dca080e7          	jalr	-566(ra) # 800019b0 <myproc>
  int err = copyinstr(p->pagetable, buf, addr, max);
    80002bee:	86ce                	mv	a3,s3
    80002bf0:	864a                	mv	a2,s2
    80002bf2:	85a6                	mv	a1,s1
    80002bf4:	6928                	ld	a0,80(a0)
    80002bf6:	fffff097          	auipc	ra,0xfffff
    80002bfa:	b94080e7          	jalr	-1132(ra) # 8000178a <copyinstr>
  if (err < 0)
    80002bfe:	00054763          	bltz	a0,80002c0c <fetchstr+0x3a>
  return strlen(buf);
    80002c02:	8526                	mv	a0,s1
    80002c04:	ffffe097          	auipc	ra,0xffffe
    80002c08:	260080e7          	jalr	608(ra) # 80000e64 <strlen>
}
    80002c0c:	70a2                	ld	ra,40(sp)
    80002c0e:	7402                	ld	s0,32(sp)
    80002c10:	64e2                	ld	s1,24(sp)
    80002c12:	6942                	ld	s2,16(sp)
    80002c14:	69a2                	ld	s3,8(sp)
    80002c16:	6145                	addi	sp,sp,48
    80002c18:	8082                	ret

0000000080002c1a <argint>:

// Fetch the nth 32-bit system call argument.
int argint(int n, int *ip)
{
    80002c1a:	1101                	addi	sp,sp,-32
    80002c1c:	ec06                	sd	ra,24(sp)
    80002c1e:	e822                	sd	s0,16(sp)
    80002c20:	e426                	sd	s1,8(sp)
    80002c22:	1000                	addi	s0,sp,32
    80002c24:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80002c26:	00000097          	auipc	ra,0x0
    80002c2a:	ef2080e7          	jalr	-270(ra) # 80002b18 <argraw>
    80002c2e:	c088                	sw	a0,0(s1)
  return 0;
}
    80002c30:	4501                	li	a0,0
    80002c32:	60e2                	ld	ra,24(sp)
    80002c34:	6442                	ld	s0,16(sp)
    80002c36:	64a2                	ld	s1,8(sp)
    80002c38:	6105                	addi	sp,sp,32
    80002c3a:	8082                	ret

0000000080002c3c <argaddr>:

// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
int argaddr(int n, uint64 *ip)
{
    80002c3c:	1101                	addi	sp,sp,-32
    80002c3e:	ec06                	sd	ra,24(sp)
    80002c40:	e822                	sd	s0,16(sp)
    80002c42:	e426                	sd	s1,8(sp)
    80002c44:	1000                	addi	s0,sp,32
    80002c46:	84ae                	mv	s1,a1
  *ip = argraw(n);
    80002c48:	00000097          	auipc	ra,0x0
    80002c4c:	ed0080e7          	jalr	-304(ra) # 80002b18 <argraw>
    80002c50:	e088                	sd	a0,0(s1)
  return 0;
}
    80002c52:	4501                	li	a0,0
    80002c54:	60e2                	ld	ra,24(sp)
    80002c56:	6442                	ld	s0,16(sp)
    80002c58:	64a2                	ld	s1,8(sp)
    80002c5a:	6105                	addi	sp,sp,32
    80002c5c:	8082                	ret

0000000080002c5e <argstr>:

// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int argstr(int n, char *buf, int max)
{
    80002c5e:	1101                	addi	sp,sp,-32
    80002c60:	ec06                	sd	ra,24(sp)
    80002c62:	e822                	sd	s0,16(sp)
    80002c64:	e426                	sd	s1,8(sp)
    80002c66:	e04a                	sd	s2,0(sp)
    80002c68:	1000                	addi	s0,sp,32
    80002c6a:	84ae                	mv	s1,a1
    80002c6c:	8932                	mv	s2,a2
  *ip = argraw(n);
    80002c6e:	00000097          	auipc	ra,0x0
    80002c72:	eaa080e7          	jalr	-342(ra) # 80002b18 <argraw>
  uint64 addr;
  if (argaddr(n, &addr) < 0)
    return -1;
  return fetchstr(addr, buf, max);
    80002c76:	864a                	mv	a2,s2
    80002c78:	85a6                	mv	a1,s1
    80002c7a:	00000097          	auipc	ra,0x0
    80002c7e:	f58080e7          	jalr	-168(ra) # 80002bd2 <fetchstr>
}
    80002c82:	60e2                	ld	ra,24(sp)
    80002c84:	6442                	ld	s0,16(sp)
    80002c86:	64a2                	ld	s1,8(sp)
    80002c88:	6902                	ld	s2,0(sp)
    80002c8a:	6105                	addi	sp,sp,32
    80002c8c:	8082                	ret

0000000080002c8e <syscall>:
    "trace",
    "set_priority",
};

void syscall(void)
{
    80002c8e:	7179                	addi	sp,sp,-48
    80002c90:	f406                	sd	ra,40(sp)
    80002c92:	f022                	sd	s0,32(sp)
    80002c94:	ec26                	sd	s1,24(sp)
    80002c96:	e84a                	sd	s2,16(sp)
    80002c98:	e44e                	sd	s3,8(sp)
    80002c9a:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    80002c9c:	fffff097          	auipc	ra,0xfffff
    80002ca0:	d14080e7          	jalr	-748(ra) # 800019b0 <myproc>

  num = p->trapframe->a7;
    80002ca4:	05853983          	ld	s3,88(a0)
    80002ca8:	0a89b783          	ld	a5,168(s3)
  if (num > 0 && num < NELEM(syscalls) && syscalls[num])
    80002cac:	fff7869b          	addiw	a3,a5,-1
    80002cb0:	4759                	li	a4,22
    80002cb2:	02d76863          	bltu	a4,a3,80002ce2 <syscall+0x54>
    80002cb6:	84aa                	mv	s1,a0
  num = p->trapframe->a7;
    80002cb8:	0007891b          	sext.w	s2,a5
  if (num > 0 && num < NELEM(syscalls) && syscalls[num])
    80002cbc:	00391713          	slli	a4,s2,0x3
    80002cc0:	00006797          	auipc	a5,0x6
    80002cc4:	84078793          	addi	a5,a5,-1984 # 80008500 <syscalls>
    80002cc8:	97ba                	add	a5,a5,a4
    80002cca:	639c                	ld	a5,0(a5)
    80002ccc:	cb99                	beqz	a5,80002ce2 <syscall+0x54>
  {
    p->trapframe->a0 = syscalls[num]();
    80002cce:	9782                	jalr	a5
    80002cd0:	06a9b823          	sd	a0,112(s3)
    if (p->mask != 0 && (p->mask >> num) & 1)      
    80002cd4:	1744a783          	lw	a5,372(s1)
    80002cd8:	c789                	beqz	a5,80002ce2 <syscall+0x54>
    80002cda:	4127d7bb          	sraw	a5,a5,s2
    80002cde:	8b85                	andi	a5,a5,1
    80002ce0:	eb81                	bnez	a5,80002cf0 <syscall+0x62>
      printf("%d: syscall %s %d\n", p->pid, system_call_name[num], p->trapframe->a0, p->trapframe->a1);      
  }
}
    80002ce2:	70a2                	ld	ra,40(sp)
    80002ce4:	7402                	ld	s0,32(sp)
    80002ce6:	64e2                	ld	s1,24(sp)
    80002ce8:	6942                	ld	s2,16(sp)
    80002cea:	69a2                	ld	s3,8(sp)
    80002cec:	6145                	addi	sp,sp,48
    80002cee:	8082                	ret
      printf("%d: syscall %s %d\n", p->pid, system_call_name[num], p->trapframe->a0, p->trapframe->a1);      
    80002cf0:	6cb4                	ld	a3,88(s1)
    80002cf2:	00391793          	slli	a5,s2,0x3
    80002cf6:	00006917          	auipc	s2,0x6
    80002cfa:	c2290913          	addi	s2,s2,-990 # 80008918 <system_call_name>
    80002cfe:	97ca                	add	a5,a5,s2
    80002d00:	7eb8                	ld	a4,120(a3)
    80002d02:	7ab4                	ld	a3,112(a3)
    80002d04:	6390                	ld	a2,0(a5)
    80002d06:	588c                	lw	a1,48(s1)
    80002d08:	00005517          	auipc	a0,0x5
    80002d0c:	70850513          	addi	a0,a0,1800 # 80008410 <states.1744+0x150>
    80002d10:	ffffe097          	auipc	ra,0xffffe
    80002d14:	878080e7          	jalr	-1928(ra) # 80000588 <printf>
}
    80002d18:	b7e9                	j	80002ce2 <syscall+0x54>

0000000080002d1a <sys_exit>:
#include "spinlock.h"
#include "proc.h"

uint64
sys_exit(void)
{
    80002d1a:	1101                	addi	sp,sp,-32
    80002d1c:	ec06                	sd	ra,24(sp)
    80002d1e:	e822                	sd	s0,16(sp)
    80002d20:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    80002d22:	fec40593          	addi	a1,s0,-20
    80002d26:	4501                	li	a0,0
    80002d28:	00000097          	auipc	ra,0x0
    80002d2c:	ef2080e7          	jalr	-270(ra) # 80002c1a <argint>
    return -1;
    80002d30:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    80002d32:	00054963          	bltz	a0,80002d44 <sys_exit+0x2a>
  exit(n);
    80002d36:	fec42503          	lw	a0,-20(s0)
    80002d3a:	fffff097          	auipc	ra,0xfffff
    80002d3e:	732080e7          	jalr	1842(ra) # 8000246c <exit>
  return 0;  // not reached
    80002d42:	4781                	li	a5,0
}
    80002d44:	853e                	mv	a0,a5
    80002d46:	60e2                	ld	ra,24(sp)
    80002d48:	6442                	ld	s0,16(sp)
    80002d4a:	6105                	addi	sp,sp,32
    80002d4c:	8082                	ret

0000000080002d4e <sys_getpid>:

uint64
sys_getpid(void)
{
    80002d4e:	1141                	addi	sp,sp,-16
    80002d50:	e406                	sd	ra,8(sp)
    80002d52:	e022                	sd	s0,0(sp)
    80002d54:	0800                	addi	s0,sp,16
  return myproc()->pid;
    80002d56:	fffff097          	auipc	ra,0xfffff
    80002d5a:	c5a080e7          	jalr	-934(ra) # 800019b0 <myproc>
}
    80002d5e:	5908                	lw	a0,48(a0)
    80002d60:	60a2                	ld	ra,8(sp)
    80002d62:	6402                	ld	s0,0(sp)
    80002d64:	0141                	addi	sp,sp,16
    80002d66:	8082                	ret

0000000080002d68 <sys_fork>:

uint64
sys_fork(void)
{
    80002d68:	1141                	addi	sp,sp,-16
    80002d6a:	e406                	sd	ra,8(sp)
    80002d6c:	e022                	sd	s0,0(sp)
    80002d6e:	0800                	addi	s0,sp,16
  return fork();
    80002d70:	fffff097          	auipc	ra,0xfffff
    80002d74:	04a080e7          	jalr	74(ra) # 80001dba <fork>
}
    80002d78:	60a2                	ld	ra,8(sp)
    80002d7a:	6402                	ld	s0,0(sp)
    80002d7c:	0141                	addi	sp,sp,16
    80002d7e:	8082                	ret

0000000080002d80 <sys_wait>:

uint64
sys_wait(void)
{
    80002d80:	1101                	addi	sp,sp,-32
    80002d82:	ec06                	sd	ra,24(sp)
    80002d84:	e822                	sd	s0,16(sp)
    80002d86:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    80002d88:	fe840593          	addi	a1,s0,-24
    80002d8c:	4501                	li	a0,0
    80002d8e:	00000097          	auipc	ra,0x0
    80002d92:	eae080e7          	jalr	-338(ra) # 80002c3c <argaddr>
    80002d96:	87aa                	mv	a5,a0
    return -1;
    80002d98:	557d                	li	a0,-1
  if(argaddr(0, &p) < 0)
    80002d9a:	0007c863          	bltz	a5,80002daa <sys_wait+0x2a>
  return wait(p);
    80002d9e:	fe843503          	ld	a0,-24(s0)
    80002da2:	fffff097          	auipc	ra,0xfffff
    80002da6:	4d2080e7          	jalr	1234(ra) # 80002274 <wait>
}
    80002daa:	60e2                	ld	ra,24(sp)
    80002dac:	6442                	ld	s0,16(sp)
    80002dae:	6105                	addi	sp,sp,32
    80002db0:	8082                	ret

0000000080002db2 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    80002db2:	7179                	addi	sp,sp,-48
    80002db4:	f406                	sd	ra,40(sp)
    80002db6:	f022                	sd	s0,32(sp)
    80002db8:	ec26                	sd	s1,24(sp)
    80002dba:	1800                	addi	s0,sp,48
  int addr;
  int n;

  if(argint(0, &n) < 0)
    80002dbc:	fdc40593          	addi	a1,s0,-36
    80002dc0:	4501                	li	a0,0
    80002dc2:	00000097          	auipc	ra,0x0
    80002dc6:	e58080e7          	jalr	-424(ra) # 80002c1a <argint>
    80002dca:	87aa                	mv	a5,a0
    return -1;
    80002dcc:	557d                	li	a0,-1
  if(argint(0, &n) < 0)
    80002dce:	0207c063          	bltz	a5,80002dee <sys_sbrk+0x3c>
  addr = myproc()->sz;
    80002dd2:	fffff097          	auipc	ra,0xfffff
    80002dd6:	bde080e7          	jalr	-1058(ra) # 800019b0 <myproc>
    80002dda:	4524                	lw	s1,72(a0)
  if(growproc(n) < 0)
    80002ddc:	fdc42503          	lw	a0,-36(s0)
    80002de0:	fffff097          	auipc	ra,0xfffff
    80002de4:	f66080e7          	jalr	-154(ra) # 80001d46 <growproc>
    80002de8:	00054863          	bltz	a0,80002df8 <sys_sbrk+0x46>
    return -1;
  return addr;
    80002dec:	8526                	mv	a0,s1
}
    80002dee:	70a2                	ld	ra,40(sp)
    80002df0:	7402                	ld	s0,32(sp)
    80002df2:	64e2                	ld	s1,24(sp)
    80002df4:	6145                	addi	sp,sp,48
    80002df6:	8082                	ret
    return -1;
    80002df8:	557d                	li	a0,-1
    80002dfa:	bfd5                	j	80002dee <sys_sbrk+0x3c>

0000000080002dfc <sys_sleep>:

uint64
sys_sleep(void)
{
    80002dfc:	7139                	addi	sp,sp,-64
    80002dfe:	fc06                	sd	ra,56(sp)
    80002e00:	f822                	sd	s0,48(sp)
    80002e02:	f426                	sd	s1,40(sp)
    80002e04:	f04a                	sd	s2,32(sp)
    80002e06:	ec4e                	sd	s3,24(sp)
    80002e08:	0080                	addi	s0,sp,64
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    80002e0a:	fcc40593          	addi	a1,s0,-52
    80002e0e:	4501                	li	a0,0
    80002e10:	00000097          	auipc	ra,0x0
    80002e14:	e0a080e7          	jalr	-502(ra) # 80002c1a <argint>
    return -1;
    80002e18:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    80002e1a:	06054563          	bltz	a0,80002e84 <sys_sleep+0x88>
  acquire(&tickslock);
    80002e1e:	00015517          	auipc	a0,0x15
    80002e22:	ab250513          	addi	a0,a0,-1358 # 800178d0 <tickslock>
    80002e26:	ffffe097          	auipc	ra,0xffffe
    80002e2a:	dbe080e7          	jalr	-578(ra) # 80000be4 <acquire>
  ticks0 = ticks;
    80002e2e:	00006917          	auipc	s2,0x6
    80002e32:	20292903          	lw	s2,514(s2) # 80009030 <ticks>
  while(ticks - ticks0 < n){
    80002e36:	fcc42783          	lw	a5,-52(s0)
    80002e3a:	cf85                	beqz	a5,80002e72 <sys_sleep+0x76>
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
    80002e3c:	00015997          	auipc	s3,0x15
    80002e40:	a9498993          	addi	s3,s3,-1388 # 800178d0 <tickslock>
    80002e44:	00006497          	auipc	s1,0x6
    80002e48:	1ec48493          	addi	s1,s1,492 # 80009030 <ticks>
    if(myproc()->killed){
    80002e4c:	fffff097          	auipc	ra,0xfffff
    80002e50:	b64080e7          	jalr	-1180(ra) # 800019b0 <myproc>
    80002e54:	551c                	lw	a5,40(a0)
    80002e56:	ef9d                	bnez	a5,80002e94 <sys_sleep+0x98>
    sleep(&ticks, &tickslock);
    80002e58:	85ce                	mv	a1,s3
    80002e5a:	8526                	mv	a0,s1
    80002e5c:	fffff097          	auipc	ra,0xfffff
    80002e60:	3b4080e7          	jalr	948(ra) # 80002210 <sleep>
  while(ticks - ticks0 < n){
    80002e64:	409c                	lw	a5,0(s1)
    80002e66:	412787bb          	subw	a5,a5,s2
    80002e6a:	fcc42703          	lw	a4,-52(s0)
    80002e6e:	fce7efe3          	bltu	a5,a4,80002e4c <sys_sleep+0x50>
  }
  release(&tickslock);
    80002e72:	00015517          	auipc	a0,0x15
    80002e76:	a5e50513          	addi	a0,a0,-1442 # 800178d0 <tickslock>
    80002e7a:	ffffe097          	auipc	ra,0xffffe
    80002e7e:	e1e080e7          	jalr	-482(ra) # 80000c98 <release>
  return 0;
    80002e82:	4781                	li	a5,0
}
    80002e84:	853e                	mv	a0,a5
    80002e86:	70e2                	ld	ra,56(sp)
    80002e88:	7442                	ld	s0,48(sp)
    80002e8a:	74a2                	ld	s1,40(sp)
    80002e8c:	7902                	ld	s2,32(sp)
    80002e8e:	69e2                	ld	s3,24(sp)
    80002e90:	6121                	addi	sp,sp,64
    80002e92:	8082                	ret
      release(&tickslock);
    80002e94:	00015517          	auipc	a0,0x15
    80002e98:	a3c50513          	addi	a0,a0,-1476 # 800178d0 <tickslock>
    80002e9c:	ffffe097          	auipc	ra,0xffffe
    80002ea0:	dfc080e7          	jalr	-516(ra) # 80000c98 <release>
      return -1;
    80002ea4:	57fd                	li	a5,-1
    80002ea6:	bff9                	j	80002e84 <sys_sleep+0x88>

0000000080002ea8 <sys_kill>:

uint64
sys_kill(void)
{
    80002ea8:	1101                	addi	sp,sp,-32
    80002eaa:	ec06                	sd	ra,24(sp)
    80002eac:	e822                	sd	s0,16(sp)
    80002eae:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    80002eb0:	fec40593          	addi	a1,s0,-20
    80002eb4:	4501                	li	a0,0
    80002eb6:	00000097          	auipc	ra,0x0
    80002eba:	d64080e7          	jalr	-668(ra) # 80002c1a <argint>
    80002ebe:	87aa                	mv	a5,a0
    return -1;
    80002ec0:	557d                	li	a0,-1
  if(argint(0, &pid) < 0)
    80002ec2:	0007c863          	bltz	a5,80002ed2 <sys_kill+0x2a>
  return kill(pid);
    80002ec6:	fec42503          	lw	a0,-20(s0)
    80002eca:	fffff097          	auipc	ra,0xfffff
    80002ece:	684080e7          	jalr	1668(ra) # 8000254e <kill>
}
    80002ed2:	60e2                	ld	ra,24(sp)
    80002ed4:	6442                	ld	s0,16(sp)
    80002ed6:	6105                	addi	sp,sp,32
    80002ed8:	8082                	ret

0000000080002eda <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    80002eda:	1101                	addi	sp,sp,-32
    80002edc:	ec06                	sd	ra,24(sp)
    80002ede:	e822                	sd	s0,16(sp)
    80002ee0:	e426                	sd	s1,8(sp)
    80002ee2:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    80002ee4:	00015517          	auipc	a0,0x15
    80002ee8:	9ec50513          	addi	a0,a0,-1556 # 800178d0 <tickslock>
    80002eec:	ffffe097          	auipc	ra,0xffffe
    80002ef0:	cf8080e7          	jalr	-776(ra) # 80000be4 <acquire>
  xticks = ticks;
    80002ef4:	00006497          	auipc	s1,0x6
    80002ef8:	13c4a483          	lw	s1,316(s1) # 80009030 <ticks>
  release(&tickslock);
    80002efc:	00015517          	auipc	a0,0x15
    80002f00:	9d450513          	addi	a0,a0,-1580 # 800178d0 <tickslock>
    80002f04:	ffffe097          	auipc	ra,0xffffe
    80002f08:	d94080e7          	jalr	-620(ra) # 80000c98 <release>
  return xticks;
}
    80002f0c:	02049513          	slli	a0,s1,0x20
    80002f10:	9101                	srli	a0,a0,0x20
    80002f12:	60e2                	ld	ra,24(sp)
    80002f14:	6442                	ld	s0,16(sp)
    80002f16:	64a2                	ld	s1,8(sp)
    80002f18:	6105                	addi	sp,sp,32
    80002f1a:	8082                	ret

0000000080002f1c <sys_set_priority>:

// }

uint64 
sys_set_priority(void)
{
    80002f1c:	1101                	addi	sp,sp,-32
    80002f1e:	ec06                	sd	ra,24(sp)
    80002f20:	e822                	sd	s0,16(sp)
    80002f22:	1000                	addi	s0,sp,32
 int prio;
 int pid;
 
 if(argint(0,&prio)<0)
    80002f24:	fec40593          	addi	a1,s0,-20
    80002f28:	4501                	li	a0,0
    80002f2a:	00000097          	auipc	ra,0x0
    80002f2e:	cf0080e7          	jalr	-784(ra) # 80002c1a <argint>
 return -1;
    80002f32:	57fd                	li	a5,-1
 if(argint(0,&prio)<0)
    80002f34:	02054563          	bltz	a0,80002f5e <sys_set_priority+0x42>
 if(argint(1,&pid)<0)
    80002f38:	fe840593          	addi	a1,s0,-24
    80002f3c:	4505                	li	a0,1
    80002f3e:	00000097          	auipc	ra,0x0
    80002f42:	cdc080e7          	jalr	-804(ra) # 80002c1a <argint>
 return -1;
    80002f46:	57fd                	li	a5,-1
 if(argint(1,&pid)<0)
    80002f48:	00054b63          	bltz	a0,80002f5e <sys_set_priority+0x42>
 
 return set_priority(prio,pid);
    80002f4c:	fe842583          	lw	a1,-24(s0)
    80002f50:	fec42503          	lw	a0,-20(s0)
    80002f54:	fffff097          	auipc	ra,0xfffff
    80002f58:	22a080e7          	jalr	554(ra) # 8000217e <set_priority>
    80002f5c:	87aa                	mv	a5,a0
}
    80002f5e:	853e                	mv	a0,a5
    80002f60:	60e2                	ld	ra,24(sp)
    80002f62:	6442                	ld	s0,16(sp)
    80002f64:	6105                	addi	sp,sp,32
    80002f66:	8082                	ret

0000000080002f68 <sys_trace>:

uint64 sys_trace(void)
{
    80002f68:	1101                	addi	sp,sp,-32
    80002f6a:	ec06                	sd	ra,24(sp)
    80002f6c:	e822                	sd	s0,16(sp)
    80002f6e:	1000                	addi	s0,sp,32
  int mask = 0;
    80002f70:	fe042623          	sw	zero,-20(s0)
  if (argint(0, &mask) < 0)
    80002f74:	fec40593          	addi	a1,s0,-20
    80002f78:	4501                	li	a0,0
    80002f7a:	00000097          	auipc	ra,0x0
    80002f7e:	ca0080e7          	jalr	-864(ra) # 80002c1a <argint>
    return -1;
    80002f82:	57fd                	li	a5,-1
  if (argint(0, &mask) < 0)
    80002f84:	00054b63          	bltz	a0,80002f9a <sys_trace+0x32>
  myproc()->mask = mask;
    80002f88:	fffff097          	auipc	ra,0xfffff
    80002f8c:	a28080e7          	jalr	-1496(ra) # 800019b0 <myproc>
    80002f90:	fec42783          	lw	a5,-20(s0)
    80002f94:	16f52a23          	sw	a5,372(a0)
  return 0;
    80002f98:	4781                	li	a5,0
    80002f9a:	853e                	mv	a0,a5
    80002f9c:	60e2                	ld	ra,24(sp)
    80002f9e:	6442                	ld	s0,16(sp)
    80002fa0:	6105                	addi	sp,sp,32
    80002fa2:	8082                	ret

0000000080002fa4 <binit>:
    80002fa4:	7179                	addi	sp,sp,-48
    80002fa6:	f406                	sd	ra,40(sp)
    80002fa8:	f022                	sd	s0,32(sp)
    80002faa:	ec26                	sd	s1,24(sp)
    80002fac:	e84a                	sd	s2,16(sp)
    80002fae:	e44e                	sd	s3,8(sp)
    80002fb0:	e052                	sd	s4,0(sp)
    80002fb2:	1800                	addi	s0,sp,48
    80002fb4:	00005597          	auipc	a1,0x5
    80002fb8:	60c58593          	addi	a1,a1,1548 # 800085c0 <syscalls+0xc0>
    80002fbc:	00015517          	auipc	a0,0x15
    80002fc0:	92c50513          	addi	a0,a0,-1748 # 800178e8 <bcache>
    80002fc4:	ffffe097          	auipc	ra,0xffffe
    80002fc8:	b90080e7          	jalr	-1136(ra) # 80000b54 <initlock>
    80002fcc:	0001d797          	auipc	a5,0x1d
    80002fd0:	91c78793          	addi	a5,a5,-1764 # 8001f8e8 <bcache+0x8000>
    80002fd4:	0001d717          	auipc	a4,0x1d
    80002fd8:	b7c70713          	addi	a4,a4,-1156 # 8001fb50 <bcache+0x8268>
    80002fdc:	2ae7b823          	sd	a4,688(a5)
    80002fe0:	2ae7bc23          	sd	a4,696(a5)
    80002fe4:	00015497          	auipc	s1,0x15
    80002fe8:	91c48493          	addi	s1,s1,-1764 # 80017900 <bcache+0x18>
    80002fec:	893e                	mv	s2,a5
    80002fee:	89ba                	mv	s3,a4
    80002ff0:	00005a17          	auipc	s4,0x5
    80002ff4:	5d8a0a13          	addi	s4,s4,1496 # 800085c8 <syscalls+0xc8>
    80002ff8:	2b893783          	ld	a5,696(s2)
    80002ffc:	e8bc                	sd	a5,80(s1)
    80002ffe:	0534b423          	sd	s3,72(s1)
    80003002:	85d2                	mv	a1,s4
    80003004:	01048513          	addi	a0,s1,16
    80003008:	00001097          	auipc	ra,0x1
    8000300c:	4bc080e7          	jalr	1212(ra) # 800044c4 <initsleeplock>
    80003010:	2b893783          	ld	a5,696(s2)
    80003014:	e7a4                	sd	s1,72(a5)
    80003016:	2a993c23          	sd	s1,696(s2)
    8000301a:	45848493          	addi	s1,s1,1112
    8000301e:	fd349de3          	bne	s1,s3,80002ff8 <binit+0x54>
    80003022:	70a2                	ld	ra,40(sp)
    80003024:	7402                	ld	s0,32(sp)
    80003026:	64e2                	ld	s1,24(sp)
    80003028:	6942                	ld	s2,16(sp)
    8000302a:	69a2                	ld	s3,8(sp)
    8000302c:	6a02                	ld	s4,0(sp)
    8000302e:	6145                	addi	sp,sp,48
    80003030:	8082                	ret

0000000080003032 <bread>:
    80003032:	7179                	addi	sp,sp,-48
    80003034:	f406                	sd	ra,40(sp)
    80003036:	f022                	sd	s0,32(sp)
    80003038:	ec26                	sd	s1,24(sp)
    8000303a:	e84a                	sd	s2,16(sp)
    8000303c:	e44e                	sd	s3,8(sp)
    8000303e:	1800                	addi	s0,sp,48
    80003040:	89aa                	mv	s3,a0
    80003042:	892e                	mv	s2,a1
    80003044:	00015517          	auipc	a0,0x15
    80003048:	8a450513          	addi	a0,a0,-1884 # 800178e8 <bcache>
    8000304c:	ffffe097          	auipc	ra,0xffffe
    80003050:	b98080e7          	jalr	-1128(ra) # 80000be4 <acquire>
    80003054:	0001d497          	auipc	s1,0x1d
    80003058:	b4c4b483          	ld	s1,-1204(s1) # 8001fba0 <bcache+0x82b8>
    8000305c:	0001d797          	auipc	a5,0x1d
    80003060:	af478793          	addi	a5,a5,-1292 # 8001fb50 <bcache+0x8268>
    80003064:	02f48f63          	beq	s1,a5,800030a2 <bread+0x70>
    80003068:	873e                	mv	a4,a5
    8000306a:	a021                	j	80003072 <bread+0x40>
    8000306c:	68a4                	ld	s1,80(s1)
    8000306e:	02e48a63          	beq	s1,a4,800030a2 <bread+0x70>
    80003072:	449c                	lw	a5,8(s1)
    80003074:	ff379ce3          	bne	a5,s3,8000306c <bread+0x3a>
    80003078:	44dc                	lw	a5,12(s1)
    8000307a:	ff2799e3          	bne	a5,s2,8000306c <bread+0x3a>
    8000307e:	40bc                	lw	a5,64(s1)
    80003080:	2785                	addiw	a5,a5,1
    80003082:	c0bc                	sw	a5,64(s1)
    80003084:	00015517          	auipc	a0,0x15
    80003088:	86450513          	addi	a0,a0,-1948 # 800178e8 <bcache>
    8000308c:	ffffe097          	auipc	ra,0xffffe
    80003090:	c0c080e7          	jalr	-1012(ra) # 80000c98 <release>
    80003094:	01048513          	addi	a0,s1,16
    80003098:	00001097          	auipc	ra,0x1
    8000309c:	466080e7          	jalr	1126(ra) # 800044fe <acquiresleep>
    800030a0:	a8b9                	j	800030fe <bread+0xcc>
    800030a2:	0001d497          	auipc	s1,0x1d
    800030a6:	af64b483          	ld	s1,-1290(s1) # 8001fb98 <bcache+0x82b0>
    800030aa:	0001d797          	auipc	a5,0x1d
    800030ae:	aa678793          	addi	a5,a5,-1370 # 8001fb50 <bcache+0x8268>
    800030b2:	00f48863          	beq	s1,a5,800030c2 <bread+0x90>
    800030b6:	873e                	mv	a4,a5
    800030b8:	40bc                	lw	a5,64(s1)
    800030ba:	cf81                	beqz	a5,800030d2 <bread+0xa0>
    800030bc:	64a4                	ld	s1,72(s1)
    800030be:	fee49de3          	bne	s1,a4,800030b8 <bread+0x86>
    800030c2:	00005517          	auipc	a0,0x5
    800030c6:	50e50513          	addi	a0,a0,1294 # 800085d0 <syscalls+0xd0>
    800030ca:	ffffd097          	auipc	ra,0xffffd
    800030ce:	474080e7          	jalr	1140(ra) # 8000053e <panic>
    800030d2:	0134a423          	sw	s3,8(s1)
    800030d6:	0124a623          	sw	s2,12(s1)
    800030da:	0004a023          	sw	zero,0(s1)
    800030de:	4785                	li	a5,1
    800030e0:	c0bc                	sw	a5,64(s1)
    800030e2:	00015517          	auipc	a0,0x15
    800030e6:	80650513          	addi	a0,a0,-2042 # 800178e8 <bcache>
    800030ea:	ffffe097          	auipc	ra,0xffffe
    800030ee:	bae080e7          	jalr	-1106(ra) # 80000c98 <release>
    800030f2:	01048513          	addi	a0,s1,16
    800030f6:	00001097          	auipc	ra,0x1
    800030fa:	408080e7          	jalr	1032(ra) # 800044fe <acquiresleep>
    800030fe:	409c                	lw	a5,0(s1)
    80003100:	cb89                	beqz	a5,80003112 <bread+0xe0>
    80003102:	8526                	mv	a0,s1
    80003104:	70a2                	ld	ra,40(sp)
    80003106:	7402                	ld	s0,32(sp)
    80003108:	64e2                	ld	s1,24(sp)
    8000310a:	6942                	ld	s2,16(sp)
    8000310c:	69a2                	ld	s3,8(sp)
    8000310e:	6145                	addi	sp,sp,48
    80003110:	8082                	ret
    80003112:	4581                	li	a1,0
    80003114:	8526                	mv	a0,s1
    80003116:	00003097          	auipc	ra,0x3
    8000311a:	f10080e7          	jalr	-240(ra) # 80006026 <virtio_disk_rw>
    8000311e:	4785                	li	a5,1
    80003120:	c09c                	sw	a5,0(s1)
    80003122:	b7c5                	j	80003102 <bread+0xd0>

0000000080003124 <bwrite>:
    80003124:	1101                	addi	sp,sp,-32
    80003126:	ec06                	sd	ra,24(sp)
    80003128:	e822                	sd	s0,16(sp)
    8000312a:	e426                	sd	s1,8(sp)
    8000312c:	1000                	addi	s0,sp,32
    8000312e:	84aa                	mv	s1,a0
    80003130:	0541                	addi	a0,a0,16
    80003132:	00001097          	auipc	ra,0x1
    80003136:	466080e7          	jalr	1126(ra) # 80004598 <holdingsleep>
    8000313a:	cd01                	beqz	a0,80003152 <bwrite+0x2e>
    8000313c:	4585                	li	a1,1
    8000313e:	8526                	mv	a0,s1
    80003140:	00003097          	auipc	ra,0x3
    80003144:	ee6080e7          	jalr	-282(ra) # 80006026 <virtio_disk_rw>
    80003148:	60e2                	ld	ra,24(sp)
    8000314a:	6442                	ld	s0,16(sp)
    8000314c:	64a2                	ld	s1,8(sp)
    8000314e:	6105                	addi	sp,sp,32
    80003150:	8082                	ret
    80003152:	00005517          	auipc	a0,0x5
    80003156:	49650513          	addi	a0,a0,1174 # 800085e8 <syscalls+0xe8>
    8000315a:	ffffd097          	auipc	ra,0xffffd
    8000315e:	3e4080e7          	jalr	996(ra) # 8000053e <panic>

0000000080003162 <brelse>:
    80003162:	1101                	addi	sp,sp,-32
    80003164:	ec06                	sd	ra,24(sp)
    80003166:	e822                	sd	s0,16(sp)
    80003168:	e426                	sd	s1,8(sp)
    8000316a:	e04a                	sd	s2,0(sp)
    8000316c:	1000                	addi	s0,sp,32
    8000316e:	84aa                	mv	s1,a0
    80003170:	01050913          	addi	s2,a0,16
    80003174:	854a                	mv	a0,s2
    80003176:	00001097          	auipc	ra,0x1
    8000317a:	422080e7          	jalr	1058(ra) # 80004598 <holdingsleep>
    8000317e:	c92d                	beqz	a0,800031f0 <brelse+0x8e>
    80003180:	854a                	mv	a0,s2
    80003182:	00001097          	auipc	ra,0x1
    80003186:	3d2080e7          	jalr	978(ra) # 80004554 <releasesleep>
    8000318a:	00014517          	auipc	a0,0x14
    8000318e:	75e50513          	addi	a0,a0,1886 # 800178e8 <bcache>
    80003192:	ffffe097          	auipc	ra,0xffffe
    80003196:	a52080e7          	jalr	-1454(ra) # 80000be4 <acquire>
    8000319a:	40bc                	lw	a5,64(s1)
    8000319c:	37fd                	addiw	a5,a5,-1
    8000319e:	0007871b          	sext.w	a4,a5
    800031a2:	c0bc                	sw	a5,64(s1)
    800031a4:	eb05                	bnez	a4,800031d4 <brelse+0x72>
    800031a6:	68bc                	ld	a5,80(s1)
    800031a8:	64b8                	ld	a4,72(s1)
    800031aa:	e7b8                	sd	a4,72(a5)
    800031ac:	64bc                	ld	a5,72(s1)
    800031ae:	68b8                	ld	a4,80(s1)
    800031b0:	ebb8                	sd	a4,80(a5)
    800031b2:	0001c797          	auipc	a5,0x1c
    800031b6:	73678793          	addi	a5,a5,1846 # 8001f8e8 <bcache+0x8000>
    800031ba:	2b87b703          	ld	a4,696(a5)
    800031be:	e8b8                	sd	a4,80(s1)
    800031c0:	0001d717          	auipc	a4,0x1d
    800031c4:	99070713          	addi	a4,a4,-1648 # 8001fb50 <bcache+0x8268>
    800031c8:	e4b8                	sd	a4,72(s1)
    800031ca:	2b87b703          	ld	a4,696(a5)
    800031ce:	e724                	sd	s1,72(a4)
    800031d0:	2a97bc23          	sd	s1,696(a5)
    800031d4:	00014517          	auipc	a0,0x14
    800031d8:	71450513          	addi	a0,a0,1812 # 800178e8 <bcache>
    800031dc:	ffffe097          	auipc	ra,0xffffe
    800031e0:	abc080e7          	jalr	-1348(ra) # 80000c98 <release>
    800031e4:	60e2                	ld	ra,24(sp)
    800031e6:	6442                	ld	s0,16(sp)
    800031e8:	64a2                	ld	s1,8(sp)
    800031ea:	6902                	ld	s2,0(sp)
    800031ec:	6105                	addi	sp,sp,32
    800031ee:	8082                	ret
    800031f0:	00005517          	auipc	a0,0x5
    800031f4:	40050513          	addi	a0,a0,1024 # 800085f0 <syscalls+0xf0>
    800031f8:	ffffd097          	auipc	ra,0xffffd
    800031fc:	346080e7          	jalr	838(ra) # 8000053e <panic>

0000000080003200 <bpin>:
    80003200:	1101                	addi	sp,sp,-32
    80003202:	ec06                	sd	ra,24(sp)
    80003204:	e822                	sd	s0,16(sp)
    80003206:	e426                	sd	s1,8(sp)
    80003208:	1000                	addi	s0,sp,32
    8000320a:	84aa                	mv	s1,a0
    8000320c:	00014517          	auipc	a0,0x14
    80003210:	6dc50513          	addi	a0,a0,1756 # 800178e8 <bcache>
    80003214:	ffffe097          	auipc	ra,0xffffe
    80003218:	9d0080e7          	jalr	-1584(ra) # 80000be4 <acquire>
    8000321c:	40bc                	lw	a5,64(s1)
    8000321e:	2785                	addiw	a5,a5,1
    80003220:	c0bc                	sw	a5,64(s1)
    80003222:	00014517          	auipc	a0,0x14
    80003226:	6c650513          	addi	a0,a0,1734 # 800178e8 <bcache>
    8000322a:	ffffe097          	auipc	ra,0xffffe
    8000322e:	a6e080e7          	jalr	-1426(ra) # 80000c98 <release>
    80003232:	60e2                	ld	ra,24(sp)
    80003234:	6442                	ld	s0,16(sp)
    80003236:	64a2                	ld	s1,8(sp)
    80003238:	6105                	addi	sp,sp,32
    8000323a:	8082                	ret

000000008000323c <bunpin>:
    8000323c:	1101                	addi	sp,sp,-32
    8000323e:	ec06                	sd	ra,24(sp)
    80003240:	e822                	sd	s0,16(sp)
    80003242:	e426                	sd	s1,8(sp)
    80003244:	1000                	addi	s0,sp,32
    80003246:	84aa                	mv	s1,a0
    80003248:	00014517          	auipc	a0,0x14
    8000324c:	6a050513          	addi	a0,a0,1696 # 800178e8 <bcache>
    80003250:	ffffe097          	auipc	ra,0xffffe
    80003254:	994080e7          	jalr	-1644(ra) # 80000be4 <acquire>
    80003258:	40bc                	lw	a5,64(s1)
    8000325a:	37fd                	addiw	a5,a5,-1
    8000325c:	c0bc                	sw	a5,64(s1)
    8000325e:	00014517          	auipc	a0,0x14
    80003262:	68a50513          	addi	a0,a0,1674 # 800178e8 <bcache>
    80003266:	ffffe097          	auipc	ra,0xffffe
    8000326a:	a32080e7          	jalr	-1486(ra) # 80000c98 <release>
    8000326e:	60e2                	ld	ra,24(sp)
    80003270:	6442                	ld	s0,16(sp)
    80003272:	64a2                	ld	s1,8(sp)
    80003274:	6105                	addi	sp,sp,32
    80003276:	8082                	ret

0000000080003278 <bfree>:
    80003278:	1101                	addi	sp,sp,-32
    8000327a:	ec06                	sd	ra,24(sp)
    8000327c:	e822                	sd	s0,16(sp)
    8000327e:	e426                	sd	s1,8(sp)
    80003280:	e04a                	sd	s2,0(sp)
    80003282:	1000                	addi	s0,sp,32
    80003284:	84ae                	mv	s1,a1
    80003286:	00d5d59b          	srliw	a1,a1,0xd
    8000328a:	0001d797          	auipc	a5,0x1d
    8000328e:	d3a7a783          	lw	a5,-710(a5) # 8001ffc4 <sb+0x1c>
    80003292:	9dbd                	addw	a1,a1,a5
    80003294:	00000097          	auipc	ra,0x0
    80003298:	d9e080e7          	jalr	-610(ra) # 80003032 <bread>
    8000329c:	0074f713          	andi	a4,s1,7
    800032a0:	4785                	li	a5,1
    800032a2:	00e797bb          	sllw	a5,a5,a4
    800032a6:	14ce                	slli	s1,s1,0x33
    800032a8:	90d9                	srli	s1,s1,0x36
    800032aa:	00950733          	add	a4,a0,s1
    800032ae:	05874703          	lbu	a4,88(a4)
    800032b2:	00e7f6b3          	and	a3,a5,a4
    800032b6:	c69d                	beqz	a3,800032e4 <bfree+0x6c>
    800032b8:	892a                	mv	s2,a0
    800032ba:	94aa                	add	s1,s1,a0
    800032bc:	fff7c793          	not	a5,a5
    800032c0:	8ff9                	and	a5,a5,a4
    800032c2:	04f48c23          	sb	a5,88(s1)
    800032c6:	00001097          	auipc	ra,0x1
    800032ca:	118080e7          	jalr	280(ra) # 800043de <log_write>
    800032ce:	854a                	mv	a0,s2
    800032d0:	00000097          	auipc	ra,0x0
    800032d4:	e92080e7          	jalr	-366(ra) # 80003162 <brelse>
    800032d8:	60e2                	ld	ra,24(sp)
    800032da:	6442                	ld	s0,16(sp)
    800032dc:	64a2                	ld	s1,8(sp)
    800032de:	6902                	ld	s2,0(sp)
    800032e0:	6105                	addi	sp,sp,32
    800032e2:	8082                	ret
    800032e4:	00005517          	auipc	a0,0x5
    800032e8:	31450513          	addi	a0,a0,788 # 800085f8 <syscalls+0xf8>
    800032ec:	ffffd097          	auipc	ra,0xffffd
    800032f0:	252080e7          	jalr	594(ra) # 8000053e <panic>

00000000800032f4 <balloc>:
    800032f4:	711d                	addi	sp,sp,-96
    800032f6:	ec86                	sd	ra,88(sp)
    800032f8:	e8a2                	sd	s0,80(sp)
    800032fa:	e4a6                	sd	s1,72(sp)
    800032fc:	e0ca                	sd	s2,64(sp)
    800032fe:	fc4e                	sd	s3,56(sp)
    80003300:	f852                	sd	s4,48(sp)
    80003302:	f456                	sd	s5,40(sp)
    80003304:	f05a                	sd	s6,32(sp)
    80003306:	ec5e                	sd	s7,24(sp)
    80003308:	e862                	sd	s8,16(sp)
    8000330a:	e466                	sd	s9,8(sp)
    8000330c:	1080                	addi	s0,sp,96
    8000330e:	0001d797          	auipc	a5,0x1d
    80003312:	c9e7a783          	lw	a5,-866(a5) # 8001ffac <sb+0x4>
    80003316:	cbd1                	beqz	a5,800033aa <balloc+0xb6>
    80003318:	8baa                	mv	s7,a0
    8000331a:	4a81                	li	s5,0
    8000331c:	0001db17          	auipc	s6,0x1d
    80003320:	c8cb0b13          	addi	s6,s6,-884 # 8001ffa8 <sb>
    80003324:	4c01                	li	s8,0
    80003326:	4985                	li	s3,1
    80003328:	6a09                	lui	s4,0x2
    8000332a:	6c89                	lui	s9,0x2
    8000332c:	a831                	j	80003348 <balloc+0x54>
    8000332e:	854a                	mv	a0,s2
    80003330:	00000097          	auipc	ra,0x0
    80003334:	e32080e7          	jalr	-462(ra) # 80003162 <brelse>
    80003338:	015c87bb          	addw	a5,s9,s5
    8000333c:	00078a9b          	sext.w	s5,a5
    80003340:	004b2703          	lw	a4,4(s6)
    80003344:	06eaf363          	bgeu	s5,a4,800033aa <balloc+0xb6>
    80003348:	41fad79b          	sraiw	a5,s5,0x1f
    8000334c:	0137d79b          	srliw	a5,a5,0x13
    80003350:	015787bb          	addw	a5,a5,s5
    80003354:	40d7d79b          	sraiw	a5,a5,0xd
    80003358:	01cb2583          	lw	a1,28(s6)
    8000335c:	9dbd                	addw	a1,a1,a5
    8000335e:	855e                	mv	a0,s7
    80003360:	00000097          	auipc	ra,0x0
    80003364:	cd2080e7          	jalr	-814(ra) # 80003032 <bread>
    80003368:	892a                	mv	s2,a0
    8000336a:	004b2503          	lw	a0,4(s6)
    8000336e:	000a849b          	sext.w	s1,s5
    80003372:	8662                	mv	a2,s8
    80003374:	faa4fde3          	bgeu	s1,a0,8000332e <balloc+0x3a>
    80003378:	41f6579b          	sraiw	a5,a2,0x1f
    8000337c:	01d7d69b          	srliw	a3,a5,0x1d
    80003380:	00c6873b          	addw	a4,a3,a2
    80003384:	00777793          	andi	a5,a4,7
    80003388:	9f95                	subw	a5,a5,a3
    8000338a:	00f997bb          	sllw	a5,s3,a5
    8000338e:	4037571b          	sraiw	a4,a4,0x3
    80003392:	00e906b3          	add	a3,s2,a4
    80003396:	0586c683          	lbu	a3,88(a3)
    8000339a:	00d7f5b3          	and	a1,a5,a3
    8000339e:	cd91                	beqz	a1,800033ba <balloc+0xc6>
    800033a0:	2605                	addiw	a2,a2,1
    800033a2:	2485                	addiw	s1,s1,1
    800033a4:	fd4618e3          	bne	a2,s4,80003374 <balloc+0x80>
    800033a8:	b759                	j	8000332e <balloc+0x3a>
    800033aa:	00005517          	auipc	a0,0x5
    800033ae:	26650513          	addi	a0,a0,614 # 80008610 <syscalls+0x110>
    800033b2:	ffffd097          	auipc	ra,0xffffd
    800033b6:	18c080e7          	jalr	396(ra) # 8000053e <panic>
    800033ba:	974a                	add	a4,a4,s2
    800033bc:	8fd5                	or	a5,a5,a3
    800033be:	04f70c23          	sb	a5,88(a4)
    800033c2:	854a                	mv	a0,s2
    800033c4:	00001097          	auipc	ra,0x1
    800033c8:	01a080e7          	jalr	26(ra) # 800043de <log_write>
    800033cc:	854a                	mv	a0,s2
    800033ce:	00000097          	auipc	ra,0x0
    800033d2:	d94080e7          	jalr	-620(ra) # 80003162 <brelse>
    800033d6:	85a6                	mv	a1,s1
    800033d8:	855e                	mv	a0,s7
    800033da:	00000097          	auipc	ra,0x0
    800033de:	c58080e7          	jalr	-936(ra) # 80003032 <bread>
    800033e2:	892a                	mv	s2,a0
    800033e4:	40000613          	li	a2,1024
    800033e8:	4581                	li	a1,0
    800033ea:	05850513          	addi	a0,a0,88
    800033ee:	ffffe097          	auipc	ra,0xffffe
    800033f2:	8f2080e7          	jalr	-1806(ra) # 80000ce0 <memset>
    800033f6:	854a                	mv	a0,s2
    800033f8:	00001097          	auipc	ra,0x1
    800033fc:	fe6080e7          	jalr	-26(ra) # 800043de <log_write>
    80003400:	854a                	mv	a0,s2
    80003402:	00000097          	auipc	ra,0x0
    80003406:	d60080e7          	jalr	-672(ra) # 80003162 <brelse>
    8000340a:	8526                	mv	a0,s1
    8000340c:	60e6                	ld	ra,88(sp)
    8000340e:	6446                	ld	s0,80(sp)
    80003410:	64a6                	ld	s1,72(sp)
    80003412:	6906                	ld	s2,64(sp)
    80003414:	79e2                	ld	s3,56(sp)
    80003416:	7a42                	ld	s4,48(sp)
    80003418:	7aa2                	ld	s5,40(sp)
    8000341a:	7b02                	ld	s6,32(sp)
    8000341c:	6be2                	ld	s7,24(sp)
    8000341e:	6c42                	ld	s8,16(sp)
    80003420:	6ca2                	ld	s9,8(sp)
    80003422:	6125                	addi	sp,sp,96
    80003424:	8082                	ret

0000000080003426 <bmap>:
    80003426:	7179                	addi	sp,sp,-48
    80003428:	f406                	sd	ra,40(sp)
    8000342a:	f022                	sd	s0,32(sp)
    8000342c:	ec26                	sd	s1,24(sp)
    8000342e:	e84a                	sd	s2,16(sp)
    80003430:	e44e                	sd	s3,8(sp)
    80003432:	e052                	sd	s4,0(sp)
    80003434:	1800                	addi	s0,sp,48
    80003436:	892a                	mv	s2,a0
    80003438:	47ad                	li	a5,11
    8000343a:	04b7fe63          	bgeu	a5,a1,80003496 <bmap+0x70>
    8000343e:	ff45849b          	addiw	s1,a1,-12
    80003442:	0004871b          	sext.w	a4,s1
    80003446:	0ff00793          	li	a5,255
    8000344a:	0ae7e363          	bltu	a5,a4,800034f0 <bmap+0xca>
    8000344e:	08052583          	lw	a1,128(a0)
    80003452:	c5ad                	beqz	a1,800034bc <bmap+0x96>
    80003454:	00092503          	lw	a0,0(s2)
    80003458:	00000097          	auipc	ra,0x0
    8000345c:	bda080e7          	jalr	-1062(ra) # 80003032 <bread>
    80003460:	8a2a                	mv	s4,a0
    80003462:	05850793          	addi	a5,a0,88
    80003466:	02049593          	slli	a1,s1,0x20
    8000346a:	9181                	srli	a1,a1,0x20
    8000346c:	058a                	slli	a1,a1,0x2
    8000346e:	00b784b3          	add	s1,a5,a1
    80003472:	0004a983          	lw	s3,0(s1)
    80003476:	04098d63          	beqz	s3,800034d0 <bmap+0xaa>
    8000347a:	8552                	mv	a0,s4
    8000347c:	00000097          	auipc	ra,0x0
    80003480:	ce6080e7          	jalr	-794(ra) # 80003162 <brelse>
    80003484:	854e                	mv	a0,s3
    80003486:	70a2                	ld	ra,40(sp)
    80003488:	7402                	ld	s0,32(sp)
    8000348a:	64e2                	ld	s1,24(sp)
    8000348c:	6942                	ld	s2,16(sp)
    8000348e:	69a2                	ld	s3,8(sp)
    80003490:	6a02                	ld	s4,0(sp)
    80003492:	6145                	addi	sp,sp,48
    80003494:	8082                	ret
    80003496:	02059493          	slli	s1,a1,0x20
    8000349a:	9081                	srli	s1,s1,0x20
    8000349c:	048a                	slli	s1,s1,0x2
    8000349e:	94aa                	add	s1,s1,a0
    800034a0:	0504a983          	lw	s3,80(s1)
    800034a4:	fe0990e3          	bnez	s3,80003484 <bmap+0x5e>
    800034a8:	4108                	lw	a0,0(a0)
    800034aa:	00000097          	auipc	ra,0x0
    800034ae:	e4a080e7          	jalr	-438(ra) # 800032f4 <balloc>
    800034b2:	0005099b          	sext.w	s3,a0
    800034b6:	0534a823          	sw	s3,80(s1)
    800034ba:	b7e9                	j	80003484 <bmap+0x5e>
    800034bc:	4108                	lw	a0,0(a0)
    800034be:	00000097          	auipc	ra,0x0
    800034c2:	e36080e7          	jalr	-458(ra) # 800032f4 <balloc>
    800034c6:	0005059b          	sext.w	a1,a0
    800034ca:	08b92023          	sw	a1,128(s2)
    800034ce:	b759                	j	80003454 <bmap+0x2e>
    800034d0:	00092503          	lw	a0,0(s2)
    800034d4:	00000097          	auipc	ra,0x0
    800034d8:	e20080e7          	jalr	-480(ra) # 800032f4 <balloc>
    800034dc:	0005099b          	sext.w	s3,a0
    800034e0:	0134a023          	sw	s3,0(s1)
    800034e4:	8552                	mv	a0,s4
    800034e6:	00001097          	auipc	ra,0x1
    800034ea:	ef8080e7          	jalr	-264(ra) # 800043de <log_write>
    800034ee:	b771                	j	8000347a <bmap+0x54>
    800034f0:	00005517          	auipc	a0,0x5
    800034f4:	13850513          	addi	a0,a0,312 # 80008628 <syscalls+0x128>
    800034f8:	ffffd097          	auipc	ra,0xffffd
    800034fc:	046080e7          	jalr	70(ra) # 8000053e <panic>

0000000080003500 <iget>:
    80003500:	7179                	addi	sp,sp,-48
    80003502:	f406                	sd	ra,40(sp)
    80003504:	f022                	sd	s0,32(sp)
    80003506:	ec26                	sd	s1,24(sp)
    80003508:	e84a                	sd	s2,16(sp)
    8000350a:	e44e                	sd	s3,8(sp)
    8000350c:	e052                	sd	s4,0(sp)
    8000350e:	1800                	addi	s0,sp,48
    80003510:	89aa                	mv	s3,a0
    80003512:	8a2e                	mv	s4,a1
    80003514:	0001d517          	auipc	a0,0x1d
    80003518:	ab450513          	addi	a0,a0,-1356 # 8001ffc8 <itable>
    8000351c:	ffffd097          	auipc	ra,0xffffd
    80003520:	6c8080e7          	jalr	1736(ra) # 80000be4 <acquire>
    80003524:	4901                	li	s2,0
    80003526:	0001d497          	auipc	s1,0x1d
    8000352a:	aba48493          	addi	s1,s1,-1350 # 8001ffe0 <itable+0x18>
    8000352e:	0001e697          	auipc	a3,0x1e
    80003532:	54268693          	addi	a3,a3,1346 # 80021a70 <log>
    80003536:	a039                	j	80003544 <iget+0x44>
    80003538:	02090b63          	beqz	s2,8000356e <iget+0x6e>
    8000353c:	08848493          	addi	s1,s1,136
    80003540:	02d48a63          	beq	s1,a3,80003574 <iget+0x74>
    80003544:	449c                	lw	a5,8(s1)
    80003546:	fef059e3          	blez	a5,80003538 <iget+0x38>
    8000354a:	4098                	lw	a4,0(s1)
    8000354c:	ff3716e3          	bne	a4,s3,80003538 <iget+0x38>
    80003550:	40d8                	lw	a4,4(s1)
    80003552:	ff4713e3          	bne	a4,s4,80003538 <iget+0x38>
    80003556:	2785                	addiw	a5,a5,1
    80003558:	c49c                	sw	a5,8(s1)
    8000355a:	0001d517          	auipc	a0,0x1d
    8000355e:	a6e50513          	addi	a0,a0,-1426 # 8001ffc8 <itable>
    80003562:	ffffd097          	auipc	ra,0xffffd
    80003566:	736080e7          	jalr	1846(ra) # 80000c98 <release>
    8000356a:	8926                	mv	s2,s1
    8000356c:	a03d                	j	8000359a <iget+0x9a>
    8000356e:	f7f9                	bnez	a5,8000353c <iget+0x3c>
    80003570:	8926                	mv	s2,s1
    80003572:	b7e9                	j	8000353c <iget+0x3c>
    80003574:	02090c63          	beqz	s2,800035ac <iget+0xac>
    80003578:	01392023          	sw	s3,0(s2)
    8000357c:	01492223          	sw	s4,4(s2)
    80003580:	4785                	li	a5,1
    80003582:	00f92423          	sw	a5,8(s2)
    80003586:	04092023          	sw	zero,64(s2)
    8000358a:	0001d517          	auipc	a0,0x1d
    8000358e:	a3e50513          	addi	a0,a0,-1474 # 8001ffc8 <itable>
    80003592:	ffffd097          	auipc	ra,0xffffd
    80003596:	706080e7          	jalr	1798(ra) # 80000c98 <release>
    8000359a:	854a                	mv	a0,s2
    8000359c:	70a2                	ld	ra,40(sp)
    8000359e:	7402                	ld	s0,32(sp)
    800035a0:	64e2                	ld	s1,24(sp)
    800035a2:	6942                	ld	s2,16(sp)
    800035a4:	69a2                	ld	s3,8(sp)
    800035a6:	6a02                	ld	s4,0(sp)
    800035a8:	6145                	addi	sp,sp,48
    800035aa:	8082                	ret
    800035ac:	00005517          	auipc	a0,0x5
    800035b0:	09450513          	addi	a0,a0,148 # 80008640 <syscalls+0x140>
    800035b4:	ffffd097          	auipc	ra,0xffffd
    800035b8:	f8a080e7          	jalr	-118(ra) # 8000053e <panic>

00000000800035bc <fsinit>:
    800035bc:	7179                	addi	sp,sp,-48
    800035be:	f406                	sd	ra,40(sp)
    800035c0:	f022                	sd	s0,32(sp)
    800035c2:	ec26                	sd	s1,24(sp)
    800035c4:	e84a                	sd	s2,16(sp)
    800035c6:	e44e                	sd	s3,8(sp)
    800035c8:	1800                	addi	s0,sp,48
    800035ca:	892a                	mv	s2,a0
    800035cc:	4585                	li	a1,1
    800035ce:	00000097          	auipc	ra,0x0
    800035d2:	a64080e7          	jalr	-1436(ra) # 80003032 <bread>
    800035d6:	84aa                	mv	s1,a0
    800035d8:	0001d997          	auipc	s3,0x1d
    800035dc:	9d098993          	addi	s3,s3,-1584 # 8001ffa8 <sb>
    800035e0:	02000613          	li	a2,32
    800035e4:	05850593          	addi	a1,a0,88
    800035e8:	854e                	mv	a0,s3
    800035ea:	ffffd097          	auipc	ra,0xffffd
    800035ee:	756080e7          	jalr	1878(ra) # 80000d40 <memmove>
    800035f2:	8526                	mv	a0,s1
    800035f4:	00000097          	auipc	ra,0x0
    800035f8:	b6e080e7          	jalr	-1170(ra) # 80003162 <brelse>
    800035fc:	0009a703          	lw	a4,0(s3)
    80003600:	102037b7          	lui	a5,0x10203
    80003604:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80003608:	02f71263          	bne	a4,a5,8000362c <fsinit+0x70>
    8000360c:	0001d597          	auipc	a1,0x1d
    80003610:	99c58593          	addi	a1,a1,-1636 # 8001ffa8 <sb>
    80003614:	854a                	mv	a0,s2
    80003616:	00001097          	auipc	ra,0x1
    8000361a:	b4c080e7          	jalr	-1204(ra) # 80004162 <initlog>
    8000361e:	70a2                	ld	ra,40(sp)
    80003620:	7402                	ld	s0,32(sp)
    80003622:	64e2                	ld	s1,24(sp)
    80003624:	6942                	ld	s2,16(sp)
    80003626:	69a2                	ld	s3,8(sp)
    80003628:	6145                	addi	sp,sp,48
    8000362a:	8082                	ret
    8000362c:	00005517          	auipc	a0,0x5
    80003630:	02450513          	addi	a0,a0,36 # 80008650 <syscalls+0x150>
    80003634:	ffffd097          	auipc	ra,0xffffd
    80003638:	f0a080e7          	jalr	-246(ra) # 8000053e <panic>

000000008000363c <iinit>:
    8000363c:	7179                	addi	sp,sp,-48
    8000363e:	f406                	sd	ra,40(sp)
    80003640:	f022                	sd	s0,32(sp)
    80003642:	ec26                	sd	s1,24(sp)
    80003644:	e84a                	sd	s2,16(sp)
    80003646:	e44e                	sd	s3,8(sp)
    80003648:	1800                	addi	s0,sp,48
    8000364a:	00005597          	auipc	a1,0x5
    8000364e:	01e58593          	addi	a1,a1,30 # 80008668 <syscalls+0x168>
    80003652:	0001d517          	auipc	a0,0x1d
    80003656:	97650513          	addi	a0,a0,-1674 # 8001ffc8 <itable>
    8000365a:	ffffd097          	auipc	ra,0xffffd
    8000365e:	4fa080e7          	jalr	1274(ra) # 80000b54 <initlock>
    80003662:	0001d497          	auipc	s1,0x1d
    80003666:	98e48493          	addi	s1,s1,-1650 # 8001fff0 <itable+0x28>
    8000366a:	0001e997          	auipc	s3,0x1e
    8000366e:	41698993          	addi	s3,s3,1046 # 80021a80 <log+0x10>
    80003672:	00005917          	auipc	s2,0x5
    80003676:	ffe90913          	addi	s2,s2,-2 # 80008670 <syscalls+0x170>
    8000367a:	85ca                	mv	a1,s2
    8000367c:	8526                	mv	a0,s1
    8000367e:	00001097          	auipc	ra,0x1
    80003682:	e46080e7          	jalr	-442(ra) # 800044c4 <initsleeplock>
    80003686:	08848493          	addi	s1,s1,136
    8000368a:	ff3498e3          	bne	s1,s3,8000367a <iinit+0x3e>
    8000368e:	70a2                	ld	ra,40(sp)
    80003690:	7402                	ld	s0,32(sp)
    80003692:	64e2                	ld	s1,24(sp)
    80003694:	6942                	ld	s2,16(sp)
    80003696:	69a2                	ld	s3,8(sp)
    80003698:	6145                	addi	sp,sp,48
    8000369a:	8082                	ret

000000008000369c <ialloc>:
    8000369c:	715d                	addi	sp,sp,-80
    8000369e:	e486                	sd	ra,72(sp)
    800036a0:	e0a2                	sd	s0,64(sp)
    800036a2:	fc26                	sd	s1,56(sp)
    800036a4:	f84a                	sd	s2,48(sp)
    800036a6:	f44e                	sd	s3,40(sp)
    800036a8:	f052                	sd	s4,32(sp)
    800036aa:	ec56                	sd	s5,24(sp)
    800036ac:	e85a                	sd	s6,16(sp)
    800036ae:	e45e                	sd	s7,8(sp)
    800036b0:	0880                	addi	s0,sp,80
    800036b2:	0001d717          	auipc	a4,0x1d
    800036b6:	90272703          	lw	a4,-1790(a4) # 8001ffb4 <sb+0xc>
    800036ba:	4785                	li	a5,1
    800036bc:	04e7fa63          	bgeu	a5,a4,80003710 <ialloc+0x74>
    800036c0:	8aaa                	mv	s5,a0
    800036c2:	8bae                	mv	s7,a1
    800036c4:	4485                	li	s1,1
    800036c6:	0001da17          	auipc	s4,0x1d
    800036ca:	8e2a0a13          	addi	s4,s4,-1822 # 8001ffa8 <sb>
    800036ce:	00048b1b          	sext.w	s6,s1
    800036d2:	0044d593          	srli	a1,s1,0x4
    800036d6:	018a2783          	lw	a5,24(s4)
    800036da:	9dbd                	addw	a1,a1,a5
    800036dc:	8556                	mv	a0,s5
    800036de:	00000097          	auipc	ra,0x0
    800036e2:	954080e7          	jalr	-1708(ra) # 80003032 <bread>
    800036e6:	892a                	mv	s2,a0
    800036e8:	05850993          	addi	s3,a0,88
    800036ec:	00f4f793          	andi	a5,s1,15
    800036f0:	079a                	slli	a5,a5,0x6
    800036f2:	99be                	add	s3,s3,a5
    800036f4:	00099783          	lh	a5,0(s3)
    800036f8:	c785                	beqz	a5,80003720 <ialloc+0x84>
    800036fa:	00000097          	auipc	ra,0x0
    800036fe:	a68080e7          	jalr	-1432(ra) # 80003162 <brelse>
    80003702:	0485                	addi	s1,s1,1
    80003704:	00ca2703          	lw	a4,12(s4)
    80003708:	0004879b          	sext.w	a5,s1
    8000370c:	fce7e1e3          	bltu	a5,a4,800036ce <ialloc+0x32>
    80003710:	00005517          	auipc	a0,0x5
    80003714:	f6850513          	addi	a0,a0,-152 # 80008678 <syscalls+0x178>
    80003718:	ffffd097          	auipc	ra,0xffffd
    8000371c:	e26080e7          	jalr	-474(ra) # 8000053e <panic>
    80003720:	04000613          	li	a2,64
    80003724:	4581                	li	a1,0
    80003726:	854e                	mv	a0,s3
    80003728:	ffffd097          	auipc	ra,0xffffd
    8000372c:	5b8080e7          	jalr	1464(ra) # 80000ce0 <memset>
    80003730:	01799023          	sh	s7,0(s3)
    80003734:	854a                	mv	a0,s2
    80003736:	00001097          	auipc	ra,0x1
    8000373a:	ca8080e7          	jalr	-856(ra) # 800043de <log_write>
    8000373e:	854a                	mv	a0,s2
    80003740:	00000097          	auipc	ra,0x0
    80003744:	a22080e7          	jalr	-1502(ra) # 80003162 <brelse>
    80003748:	85da                	mv	a1,s6
    8000374a:	8556                	mv	a0,s5
    8000374c:	00000097          	auipc	ra,0x0
    80003750:	db4080e7          	jalr	-588(ra) # 80003500 <iget>
    80003754:	60a6                	ld	ra,72(sp)
    80003756:	6406                	ld	s0,64(sp)
    80003758:	74e2                	ld	s1,56(sp)
    8000375a:	7942                	ld	s2,48(sp)
    8000375c:	79a2                	ld	s3,40(sp)
    8000375e:	7a02                	ld	s4,32(sp)
    80003760:	6ae2                	ld	s5,24(sp)
    80003762:	6b42                	ld	s6,16(sp)
    80003764:	6ba2                	ld	s7,8(sp)
    80003766:	6161                	addi	sp,sp,80
    80003768:	8082                	ret

000000008000376a <iupdate>:
    8000376a:	1101                	addi	sp,sp,-32
    8000376c:	ec06                	sd	ra,24(sp)
    8000376e:	e822                	sd	s0,16(sp)
    80003770:	e426                	sd	s1,8(sp)
    80003772:	e04a                	sd	s2,0(sp)
    80003774:	1000                	addi	s0,sp,32
    80003776:	84aa                	mv	s1,a0
    80003778:	415c                	lw	a5,4(a0)
    8000377a:	0047d79b          	srliw	a5,a5,0x4
    8000377e:	0001d597          	auipc	a1,0x1d
    80003782:	8425a583          	lw	a1,-1982(a1) # 8001ffc0 <sb+0x18>
    80003786:	9dbd                	addw	a1,a1,a5
    80003788:	4108                	lw	a0,0(a0)
    8000378a:	00000097          	auipc	ra,0x0
    8000378e:	8a8080e7          	jalr	-1880(ra) # 80003032 <bread>
    80003792:	892a                	mv	s2,a0
    80003794:	05850793          	addi	a5,a0,88
    80003798:	40c8                	lw	a0,4(s1)
    8000379a:	893d                	andi	a0,a0,15
    8000379c:	051a                	slli	a0,a0,0x6
    8000379e:	953e                	add	a0,a0,a5
    800037a0:	04449703          	lh	a4,68(s1)
    800037a4:	00e51023          	sh	a4,0(a0)
    800037a8:	04649703          	lh	a4,70(s1)
    800037ac:	00e51123          	sh	a4,2(a0)
    800037b0:	04849703          	lh	a4,72(s1)
    800037b4:	00e51223          	sh	a4,4(a0)
    800037b8:	04a49703          	lh	a4,74(s1)
    800037bc:	00e51323          	sh	a4,6(a0)
    800037c0:	44f8                	lw	a4,76(s1)
    800037c2:	c518                	sw	a4,8(a0)
    800037c4:	03400613          	li	a2,52
    800037c8:	05048593          	addi	a1,s1,80
    800037cc:	0531                	addi	a0,a0,12
    800037ce:	ffffd097          	auipc	ra,0xffffd
    800037d2:	572080e7          	jalr	1394(ra) # 80000d40 <memmove>
    800037d6:	854a                	mv	a0,s2
    800037d8:	00001097          	auipc	ra,0x1
    800037dc:	c06080e7          	jalr	-1018(ra) # 800043de <log_write>
    800037e0:	854a                	mv	a0,s2
    800037e2:	00000097          	auipc	ra,0x0
    800037e6:	980080e7          	jalr	-1664(ra) # 80003162 <brelse>
    800037ea:	60e2                	ld	ra,24(sp)
    800037ec:	6442                	ld	s0,16(sp)
    800037ee:	64a2                	ld	s1,8(sp)
    800037f0:	6902                	ld	s2,0(sp)
    800037f2:	6105                	addi	sp,sp,32
    800037f4:	8082                	ret

00000000800037f6 <idup>:
    800037f6:	1101                	addi	sp,sp,-32
    800037f8:	ec06                	sd	ra,24(sp)
    800037fa:	e822                	sd	s0,16(sp)
    800037fc:	e426                	sd	s1,8(sp)
    800037fe:	1000                	addi	s0,sp,32
    80003800:	84aa                	mv	s1,a0
    80003802:	0001c517          	auipc	a0,0x1c
    80003806:	7c650513          	addi	a0,a0,1990 # 8001ffc8 <itable>
    8000380a:	ffffd097          	auipc	ra,0xffffd
    8000380e:	3da080e7          	jalr	986(ra) # 80000be4 <acquire>
    80003812:	449c                	lw	a5,8(s1)
    80003814:	2785                	addiw	a5,a5,1
    80003816:	c49c                	sw	a5,8(s1)
    80003818:	0001c517          	auipc	a0,0x1c
    8000381c:	7b050513          	addi	a0,a0,1968 # 8001ffc8 <itable>
    80003820:	ffffd097          	auipc	ra,0xffffd
    80003824:	478080e7          	jalr	1144(ra) # 80000c98 <release>
    80003828:	8526                	mv	a0,s1
    8000382a:	60e2                	ld	ra,24(sp)
    8000382c:	6442                	ld	s0,16(sp)
    8000382e:	64a2                	ld	s1,8(sp)
    80003830:	6105                	addi	sp,sp,32
    80003832:	8082                	ret

0000000080003834 <ilock>:
    80003834:	1101                	addi	sp,sp,-32
    80003836:	ec06                	sd	ra,24(sp)
    80003838:	e822                	sd	s0,16(sp)
    8000383a:	e426                	sd	s1,8(sp)
    8000383c:	e04a                	sd	s2,0(sp)
    8000383e:	1000                	addi	s0,sp,32
    80003840:	c115                	beqz	a0,80003864 <ilock+0x30>
    80003842:	84aa                	mv	s1,a0
    80003844:	451c                	lw	a5,8(a0)
    80003846:	00f05f63          	blez	a5,80003864 <ilock+0x30>
    8000384a:	0541                	addi	a0,a0,16
    8000384c:	00001097          	auipc	ra,0x1
    80003850:	cb2080e7          	jalr	-846(ra) # 800044fe <acquiresleep>
    80003854:	40bc                	lw	a5,64(s1)
    80003856:	cf99                	beqz	a5,80003874 <ilock+0x40>
    80003858:	60e2                	ld	ra,24(sp)
    8000385a:	6442                	ld	s0,16(sp)
    8000385c:	64a2                	ld	s1,8(sp)
    8000385e:	6902                	ld	s2,0(sp)
    80003860:	6105                	addi	sp,sp,32
    80003862:	8082                	ret
    80003864:	00005517          	auipc	a0,0x5
    80003868:	e2c50513          	addi	a0,a0,-468 # 80008690 <syscalls+0x190>
    8000386c:	ffffd097          	auipc	ra,0xffffd
    80003870:	cd2080e7          	jalr	-814(ra) # 8000053e <panic>
    80003874:	40dc                	lw	a5,4(s1)
    80003876:	0047d79b          	srliw	a5,a5,0x4
    8000387a:	0001c597          	auipc	a1,0x1c
    8000387e:	7465a583          	lw	a1,1862(a1) # 8001ffc0 <sb+0x18>
    80003882:	9dbd                	addw	a1,a1,a5
    80003884:	4088                	lw	a0,0(s1)
    80003886:	fffff097          	auipc	ra,0xfffff
    8000388a:	7ac080e7          	jalr	1964(ra) # 80003032 <bread>
    8000388e:	892a                	mv	s2,a0
    80003890:	05850593          	addi	a1,a0,88
    80003894:	40dc                	lw	a5,4(s1)
    80003896:	8bbd                	andi	a5,a5,15
    80003898:	079a                	slli	a5,a5,0x6
    8000389a:	95be                	add	a1,a1,a5
    8000389c:	00059783          	lh	a5,0(a1)
    800038a0:	04f49223          	sh	a5,68(s1)
    800038a4:	00259783          	lh	a5,2(a1)
    800038a8:	04f49323          	sh	a5,70(s1)
    800038ac:	00459783          	lh	a5,4(a1)
    800038b0:	04f49423          	sh	a5,72(s1)
    800038b4:	00659783          	lh	a5,6(a1)
    800038b8:	04f49523          	sh	a5,74(s1)
    800038bc:	459c                	lw	a5,8(a1)
    800038be:	c4fc                	sw	a5,76(s1)
    800038c0:	03400613          	li	a2,52
    800038c4:	05b1                	addi	a1,a1,12
    800038c6:	05048513          	addi	a0,s1,80
    800038ca:	ffffd097          	auipc	ra,0xffffd
    800038ce:	476080e7          	jalr	1142(ra) # 80000d40 <memmove>
    800038d2:	854a                	mv	a0,s2
    800038d4:	00000097          	auipc	ra,0x0
    800038d8:	88e080e7          	jalr	-1906(ra) # 80003162 <brelse>
    800038dc:	4785                	li	a5,1
    800038de:	c0bc                	sw	a5,64(s1)
    800038e0:	04449783          	lh	a5,68(s1)
    800038e4:	fbb5                	bnez	a5,80003858 <ilock+0x24>
    800038e6:	00005517          	auipc	a0,0x5
    800038ea:	db250513          	addi	a0,a0,-590 # 80008698 <syscalls+0x198>
    800038ee:	ffffd097          	auipc	ra,0xffffd
    800038f2:	c50080e7          	jalr	-944(ra) # 8000053e <panic>

00000000800038f6 <iunlock>:
    800038f6:	1101                	addi	sp,sp,-32
    800038f8:	ec06                	sd	ra,24(sp)
    800038fa:	e822                	sd	s0,16(sp)
    800038fc:	e426                	sd	s1,8(sp)
    800038fe:	e04a                	sd	s2,0(sp)
    80003900:	1000                	addi	s0,sp,32
    80003902:	c905                	beqz	a0,80003932 <iunlock+0x3c>
    80003904:	84aa                	mv	s1,a0
    80003906:	01050913          	addi	s2,a0,16
    8000390a:	854a                	mv	a0,s2
    8000390c:	00001097          	auipc	ra,0x1
    80003910:	c8c080e7          	jalr	-884(ra) # 80004598 <holdingsleep>
    80003914:	cd19                	beqz	a0,80003932 <iunlock+0x3c>
    80003916:	449c                	lw	a5,8(s1)
    80003918:	00f05d63          	blez	a5,80003932 <iunlock+0x3c>
    8000391c:	854a                	mv	a0,s2
    8000391e:	00001097          	auipc	ra,0x1
    80003922:	c36080e7          	jalr	-970(ra) # 80004554 <releasesleep>
    80003926:	60e2                	ld	ra,24(sp)
    80003928:	6442                	ld	s0,16(sp)
    8000392a:	64a2                	ld	s1,8(sp)
    8000392c:	6902                	ld	s2,0(sp)
    8000392e:	6105                	addi	sp,sp,32
    80003930:	8082                	ret
    80003932:	00005517          	auipc	a0,0x5
    80003936:	d7650513          	addi	a0,a0,-650 # 800086a8 <syscalls+0x1a8>
    8000393a:	ffffd097          	auipc	ra,0xffffd
    8000393e:	c04080e7          	jalr	-1020(ra) # 8000053e <panic>

0000000080003942 <itrunc>:
    80003942:	7179                	addi	sp,sp,-48
    80003944:	f406                	sd	ra,40(sp)
    80003946:	f022                	sd	s0,32(sp)
    80003948:	ec26                	sd	s1,24(sp)
    8000394a:	e84a                	sd	s2,16(sp)
    8000394c:	e44e                	sd	s3,8(sp)
    8000394e:	e052                	sd	s4,0(sp)
    80003950:	1800                	addi	s0,sp,48
    80003952:	89aa                	mv	s3,a0
    80003954:	05050493          	addi	s1,a0,80
    80003958:	08050913          	addi	s2,a0,128
    8000395c:	a021                	j	80003964 <itrunc+0x22>
    8000395e:	0491                	addi	s1,s1,4
    80003960:	01248d63          	beq	s1,s2,8000397a <itrunc+0x38>
    80003964:	408c                	lw	a1,0(s1)
    80003966:	dde5                	beqz	a1,8000395e <itrunc+0x1c>
    80003968:	0009a503          	lw	a0,0(s3)
    8000396c:	00000097          	auipc	ra,0x0
    80003970:	90c080e7          	jalr	-1780(ra) # 80003278 <bfree>
    80003974:	0004a023          	sw	zero,0(s1)
    80003978:	b7dd                	j	8000395e <itrunc+0x1c>
    8000397a:	0809a583          	lw	a1,128(s3)
    8000397e:	e185                	bnez	a1,8000399e <itrunc+0x5c>
    80003980:	0409a623          	sw	zero,76(s3)
    80003984:	854e                	mv	a0,s3
    80003986:	00000097          	auipc	ra,0x0
    8000398a:	de4080e7          	jalr	-540(ra) # 8000376a <iupdate>
    8000398e:	70a2                	ld	ra,40(sp)
    80003990:	7402                	ld	s0,32(sp)
    80003992:	64e2                	ld	s1,24(sp)
    80003994:	6942                	ld	s2,16(sp)
    80003996:	69a2                	ld	s3,8(sp)
    80003998:	6a02                	ld	s4,0(sp)
    8000399a:	6145                	addi	sp,sp,48
    8000399c:	8082                	ret
    8000399e:	0009a503          	lw	a0,0(s3)
    800039a2:	fffff097          	auipc	ra,0xfffff
    800039a6:	690080e7          	jalr	1680(ra) # 80003032 <bread>
    800039aa:	8a2a                	mv	s4,a0
    800039ac:	05850493          	addi	s1,a0,88
    800039b0:	45850913          	addi	s2,a0,1112
    800039b4:	a811                	j	800039c8 <itrunc+0x86>
    800039b6:	0009a503          	lw	a0,0(s3)
    800039ba:	00000097          	auipc	ra,0x0
    800039be:	8be080e7          	jalr	-1858(ra) # 80003278 <bfree>
    800039c2:	0491                	addi	s1,s1,4
    800039c4:	01248563          	beq	s1,s2,800039ce <itrunc+0x8c>
    800039c8:	408c                	lw	a1,0(s1)
    800039ca:	dde5                	beqz	a1,800039c2 <itrunc+0x80>
    800039cc:	b7ed                	j	800039b6 <itrunc+0x74>
    800039ce:	8552                	mv	a0,s4
    800039d0:	fffff097          	auipc	ra,0xfffff
    800039d4:	792080e7          	jalr	1938(ra) # 80003162 <brelse>
    800039d8:	0809a583          	lw	a1,128(s3)
    800039dc:	0009a503          	lw	a0,0(s3)
    800039e0:	00000097          	auipc	ra,0x0
    800039e4:	898080e7          	jalr	-1896(ra) # 80003278 <bfree>
    800039e8:	0809a023          	sw	zero,128(s3)
    800039ec:	bf51                	j	80003980 <itrunc+0x3e>

00000000800039ee <iput>:
    800039ee:	1101                	addi	sp,sp,-32
    800039f0:	ec06                	sd	ra,24(sp)
    800039f2:	e822                	sd	s0,16(sp)
    800039f4:	e426                	sd	s1,8(sp)
    800039f6:	e04a                	sd	s2,0(sp)
    800039f8:	1000                	addi	s0,sp,32
    800039fa:	84aa                	mv	s1,a0
    800039fc:	0001c517          	auipc	a0,0x1c
    80003a00:	5cc50513          	addi	a0,a0,1484 # 8001ffc8 <itable>
    80003a04:	ffffd097          	auipc	ra,0xffffd
    80003a08:	1e0080e7          	jalr	480(ra) # 80000be4 <acquire>
    80003a0c:	4498                	lw	a4,8(s1)
    80003a0e:	4785                	li	a5,1
    80003a10:	02f70363          	beq	a4,a5,80003a36 <iput+0x48>
    80003a14:	449c                	lw	a5,8(s1)
    80003a16:	37fd                	addiw	a5,a5,-1
    80003a18:	c49c                	sw	a5,8(s1)
    80003a1a:	0001c517          	auipc	a0,0x1c
    80003a1e:	5ae50513          	addi	a0,a0,1454 # 8001ffc8 <itable>
    80003a22:	ffffd097          	auipc	ra,0xffffd
    80003a26:	276080e7          	jalr	630(ra) # 80000c98 <release>
    80003a2a:	60e2                	ld	ra,24(sp)
    80003a2c:	6442                	ld	s0,16(sp)
    80003a2e:	64a2                	ld	s1,8(sp)
    80003a30:	6902                	ld	s2,0(sp)
    80003a32:	6105                	addi	sp,sp,32
    80003a34:	8082                	ret
    80003a36:	40bc                	lw	a5,64(s1)
    80003a38:	dff1                	beqz	a5,80003a14 <iput+0x26>
    80003a3a:	04a49783          	lh	a5,74(s1)
    80003a3e:	fbf9                	bnez	a5,80003a14 <iput+0x26>
    80003a40:	01048913          	addi	s2,s1,16
    80003a44:	854a                	mv	a0,s2
    80003a46:	00001097          	auipc	ra,0x1
    80003a4a:	ab8080e7          	jalr	-1352(ra) # 800044fe <acquiresleep>
    80003a4e:	0001c517          	auipc	a0,0x1c
    80003a52:	57a50513          	addi	a0,a0,1402 # 8001ffc8 <itable>
    80003a56:	ffffd097          	auipc	ra,0xffffd
    80003a5a:	242080e7          	jalr	578(ra) # 80000c98 <release>
    80003a5e:	8526                	mv	a0,s1
    80003a60:	00000097          	auipc	ra,0x0
    80003a64:	ee2080e7          	jalr	-286(ra) # 80003942 <itrunc>
    80003a68:	04049223          	sh	zero,68(s1)
    80003a6c:	8526                	mv	a0,s1
    80003a6e:	00000097          	auipc	ra,0x0
    80003a72:	cfc080e7          	jalr	-772(ra) # 8000376a <iupdate>
    80003a76:	0404a023          	sw	zero,64(s1)
    80003a7a:	854a                	mv	a0,s2
    80003a7c:	00001097          	auipc	ra,0x1
    80003a80:	ad8080e7          	jalr	-1320(ra) # 80004554 <releasesleep>
    80003a84:	0001c517          	auipc	a0,0x1c
    80003a88:	54450513          	addi	a0,a0,1348 # 8001ffc8 <itable>
    80003a8c:	ffffd097          	auipc	ra,0xffffd
    80003a90:	158080e7          	jalr	344(ra) # 80000be4 <acquire>
    80003a94:	b741                	j	80003a14 <iput+0x26>

0000000080003a96 <iunlockput>:
    80003a96:	1101                	addi	sp,sp,-32
    80003a98:	ec06                	sd	ra,24(sp)
    80003a9a:	e822                	sd	s0,16(sp)
    80003a9c:	e426                	sd	s1,8(sp)
    80003a9e:	1000                	addi	s0,sp,32
    80003aa0:	84aa                	mv	s1,a0
    80003aa2:	00000097          	auipc	ra,0x0
    80003aa6:	e54080e7          	jalr	-428(ra) # 800038f6 <iunlock>
    80003aaa:	8526                	mv	a0,s1
    80003aac:	00000097          	auipc	ra,0x0
    80003ab0:	f42080e7          	jalr	-190(ra) # 800039ee <iput>
    80003ab4:	60e2                	ld	ra,24(sp)
    80003ab6:	6442                	ld	s0,16(sp)
    80003ab8:	64a2                	ld	s1,8(sp)
    80003aba:	6105                	addi	sp,sp,32
    80003abc:	8082                	ret

0000000080003abe <stati>:
    80003abe:	1141                	addi	sp,sp,-16
    80003ac0:	e422                	sd	s0,8(sp)
    80003ac2:	0800                	addi	s0,sp,16
    80003ac4:	411c                	lw	a5,0(a0)
    80003ac6:	c19c                	sw	a5,0(a1)
    80003ac8:	415c                	lw	a5,4(a0)
    80003aca:	c1dc                	sw	a5,4(a1)
    80003acc:	04451783          	lh	a5,68(a0)
    80003ad0:	00f59423          	sh	a5,8(a1)
    80003ad4:	04a51783          	lh	a5,74(a0)
    80003ad8:	00f59523          	sh	a5,10(a1)
    80003adc:	04c56783          	lwu	a5,76(a0)
    80003ae0:	e99c                	sd	a5,16(a1)
    80003ae2:	6422                	ld	s0,8(sp)
    80003ae4:	0141                	addi	sp,sp,16
    80003ae6:	8082                	ret

0000000080003ae8 <readi>:
    80003ae8:	457c                	lw	a5,76(a0)
    80003aea:	0ed7e963          	bltu	a5,a3,80003bdc <readi+0xf4>
    80003aee:	7159                	addi	sp,sp,-112
    80003af0:	f486                	sd	ra,104(sp)
    80003af2:	f0a2                	sd	s0,96(sp)
    80003af4:	eca6                	sd	s1,88(sp)
    80003af6:	e8ca                	sd	s2,80(sp)
    80003af8:	e4ce                	sd	s3,72(sp)
    80003afa:	e0d2                	sd	s4,64(sp)
    80003afc:	fc56                	sd	s5,56(sp)
    80003afe:	f85a                	sd	s6,48(sp)
    80003b00:	f45e                	sd	s7,40(sp)
    80003b02:	f062                	sd	s8,32(sp)
    80003b04:	ec66                	sd	s9,24(sp)
    80003b06:	e86a                	sd	s10,16(sp)
    80003b08:	e46e                	sd	s11,8(sp)
    80003b0a:	1880                	addi	s0,sp,112
    80003b0c:	8baa                	mv	s7,a0
    80003b0e:	8c2e                	mv	s8,a1
    80003b10:	8ab2                	mv	s5,a2
    80003b12:	84b6                	mv	s1,a3
    80003b14:	8b3a                	mv	s6,a4
    80003b16:	9f35                	addw	a4,a4,a3
    80003b18:	4501                	li	a0,0
    80003b1a:	0ad76063          	bltu	a4,a3,80003bba <readi+0xd2>
    80003b1e:	00e7f463          	bgeu	a5,a4,80003b26 <readi+0x3e>
    80003b22:	40d78b3b          	subw	s6,a5,a3
    80003b26:	0a0b0963          	beqz	s6,80003bd8 <readi+0xf0>
    80003b2a:	4981                	li	s3,0
    80003b2c:	40000d13          	li	s10,1024
    80003b30:	5cfd                	li	s9,-1
    80003b32:	a82d                	j	80003b6c <readi+0x84>
    80003b34:	020a1d93          	slli	s11,s4,0x20
    80003b38:	020ddd93          	srli	s11,s11,0x20
    80003b3c:	05890613          	addi	a2,s2,88
    80003b40:	86ee                	mv	a3,s11
    80003b42:	963a                	add	a2,a2,a4
    80003b44:	85d6                	mv	a1,s5
    80003b46:	8562                	mv	a0,s8
    80003b48:	fffff097          	auipc	ra,0xfffff
    80003b4c:	a78080e7          	jalr	-1416(ra) # 800025c0 <either_copyout>
    80003b50:	05950d63          	beq	a0,s9,80003baa <readi+0xc2>
    80003b54:	854a                	mv	a0,s2
    80003b56:	fffff097          	auipc	ra,0xfffff
    80003b5a:	60c080e7          	jalr	1548(ra) # 80003162 <brelse>
    80003b5e:	013a09bb          	addw	s3,s4,s3
    80003b62:	009a04bb          	addw	s1,s4,s1
    80003b66:	9aee                	add	s5,s5,s11
    80003b68:	0569f763          	bgeu	s3,s6,80003bb6 <readi+0xce>
    80003b6c:	000ba903          	lw	s2,0(s7)
    80003b70:	00a4d59b          	srliw	a1,s1,0xa
    80003b74:	855e                	mv	a0,s7
    80003b76:	00000097          	auipc	ra,0x0
    80003b7a:	8b0080e7          	jalr	-1872(ra) # 80003426 <bmap>
    80003b7e:	0005059b          	sext.w	a1,a0
    80003b82:	854a                	mv	a0,s2
    80003b84:	fffff097          	auipc	ra,0xfffff
    80003b88:	4ae080e7          	jalr	1198(ra) # 80003032 <bread>
    80003b8c:	892a                	mv	s2,a0
    80003b8e:	3ff4f713          	andi	a4,s1,1023
    80003b92:	40ed07bb          	subw	a5,s10,a4
    80003b96:	413b06bb          	subw	a3,s6,s3
    80003b9a:	8a3e                	mv	s4,a5
    80003b9c:	2781                	sext.w	a5,a5
    80003b9e:	0006861b          	sext.w	a2,a3
    80003ba2:	f8f679e3          	bgeu	a2,a5,80003b34 <readi+0x4c>
    80003ba6:	8a36                	mv	s4,a3
    80003ba8:	b771                	j	80003b34 <readi+0x4c>
    80003baa:	854a                	mv	a0,s2
    80003bac:	fffff097          	auipc	ra,0xfffff
    80003bb0:	5b6080e7          	jalr	1462(ra) # 80003162 <brelse>
    80003bb4:	59fd                	li	s3,-1
    80003bb6:	0009851b          	sext.w	a0,s3
    80003bba:	70a6                	ld	ra,104(sp)
    80003bbc:	7406                	ld	s0,96(sp)
    80003bbe:	64e6                	ld	s1,88(sp)
    80003bc0:	6946                	ld	s2,80(sp)
    80003bc2:	69a6                	ld	s3,72(sp)
    80003bc4:	6a06                	ld	s4,64(sp)
    80003bc6:	7ae2                	ld	s5,56(sp)
    80003bc8:	7b42                	ld	s6,48(sp)
    80003bca:	7ba2                	ld	s7,40(sp)
    80003bcc:	7c02                	ld	s8,32(sp)
    80003bce:	6ce2                	ld	s9,24(sp)
    80003bd0:	6d42                	ld	s10,16(sp)
    80003bd2:	6da2                	ld	s11,8(sp)
    80003bd4:	6165                	addi	sp,sp,112
    80003bd6:	8082                	ret
    80003bd8:	89da                	mv	s3,s6
    80003bda:	bff1                	j	80003bb6 <readi+0xce>
    80003bdc:	4501                	li	a0,0
    80003bde:	8082                	ret

0000000080003be0 <writei>:
    80003be0:	457c                	lw	a5,76(a0)
    80003be2:	10d7e863          	bltu	a5,a3,80003cf2 <writei+0x112>
    80003be6:	7159                	addi	sp,sp,-112
    80003be8:	f486                	sd	ra,104(sp)
    80003bea:	f0a2                	sd	s0,96(sp)
    80003bec:	eca6                	sd	s1,88(sp)
    80003bee:	e8ca                	sd	s2,80(sp)
    80003bf0:	e4ce                	sd	s3,72(sp)
    80003bf2:	e0d2                	sd	s4,64(sp)
    80003bf4:	fc56                	sd	s5,56(sp)
    80003bf6:	f85a                	sd	s6,48(sp)
    80003bf8:	f45e                	sd	s7,40(sp)
    80003bfa:	f062                	sd	s8,32(sp)
    80003bfc:	ec66                	sd	s9,24(sp)
    80003bfe:	e86a                	sd	s10,16(sp)
    80003c00:	e46e                	sd	s11,8(sp)
    80003c02:	1880                	addi	s0,sp,112
    80003c04:	8b2a                	mv	s6,a0
    80003c06:	8c2e                	mv	s8,a1
    80003c08:	8ab2                	mv	s5,a2
    80003c0a:	8936                	mv	s2,a3
    80003c0c:	8bba                	mv	s7,a4
    80003c0e:	00e687bb          	addw	a5,a3,a4
    80003c12:	0ed7e263          	bltu	a5,a3,80003cf6 <writei+0x116>
    80003c16:	00043737          	lui	a4,0x43
    80003c1a:	0ef76063          	bltu	a4,a5,80003cfa <writei+0x11a>
    80003c1e:	0c0b8863          	beqz	s7,80003cee <writei+0x10e>
    80003c22:	4a01                	li	s4,0
    80003c24:	40000d13          	li	s10,1024
    80003c28:	5cfd                	li	s9,-1
    80003c2a:	a091                	j	80003c6e <writei+0x8e>
    80003c2c:	02099d93          	slli	s11,s3,0x20
    80003c30:	020ddd93          	srli	s11,s11,0x20
    80003c34:	05848513          	addi	a0,s1,88
    80003c38:	86ee                	mv	a3,s11
    80003c3a:	8656                	mv	a2,s5
    80003c3c:	85e2                	mv	a1,s8
    80003c3e:	953a                	add	a0,a0,a4
    80003c40:	fffff097          	auipc	ra,0xfffff
    80003c44:	9d6080e7          	jalr	-1578(ra) # 80002616 <either_copyin>
    80003c48:	07950263          	beq	a0,s9,80003cac <writei+0xcc>
    80003c4c:	8526                	mv	a0,s1
    80003c4e:	00000097          	auipc	ra,0x0
    80003c52:	790080e7          	jalr	1936(ra) # 800043de <log_write>
    80003c56:	8526                	mv	a0,s1
    80003c58:	fffff097          	auipc	ra,0xfffff
    80003c5c:	50a080e7          	jalr	1290(ra) # 80003162 <brelse>
    80003c60:	01498a3b          	addw	s4,s3,s4
    80003c64:	0129893b          	addw	s2,s3,s2
    80003c68:	9aee                	add	s5,s5,s11
    80003c6a:	057a7663          	bgeu	s4,s7,80003cb6 <writei+0xd6>
    80003c6e:	000b2483          	lw	s1,0(s6)
    80003c72:	00a9559b          	srliw	a1,s2,0xa
    80003c76:	855a                	mv	a0,s6
    80003c78:	fffff097          	auipc	ra,0xfffff
    80003c7c:	7ae080e7          	jalr	1966(ra) # 80003426 <bmap>
    80003c80:	0005059b          	sext.w	a1,a0
    80003c84:	8526                	mv	a0,s1
    80003c86:	fffff097          	auipc	ra,0xfffff
    80003c8a:	3ac080e7          	jalr	940(ra) # 80003032 <bread>
    80003c8e:	84aa                	mv	s1,a0
    80003c90:	3ff97713          	andi	a4,s2,1023
    80003c94:	40ed07bb          	subw	a5,s10,a4
    80003c98:	414b86bb          	subw	a3,s7,s4
    80003c9c:	89be                	mv	s3,a5
    80003c9e:	2781                	sext.w	a5,a5
    80003ca0:	0006861b          	sext.w	a2,a3
    80003ca4:	f8f674e3          	bgeu	a2,a5,80003c2c <writei+0x4c>
    80003ca8:	89b6                	mv	s3,a3
    80003caa:	b749                	j	80003c2c <writei+0x4c>
    80003cac:	8526                	mv	a0,s1
    80003cae:	fffff097          	auipc	ra,0xfffff
    80003cb2:	4b4080e7          	jalr	1204(ra) # 80003162 <brelse>
    80003cb6:	04cb2783          	lw	a5,76(s6)
    80003cba:	0127f463          	bgeu	a5,s2,80003cc2 <writei+0xe2>
    80003cbe:	052b2623          	sw	s2,76(s6)
    80003cc2:	855a                	mv	a0,s6
    80003cc4:	00000097          	auipc	ra,0x0
    80003cc8:	aa6080e7          	jalr	-1370(ra) # 8000376a <iupdate>
    80003ccc:	000a051b          	sext.w	a0,s4
    80003cd0:	70a6                	ld	ra,104(sp)
    80003cd2:	7406                	ld	s0,96(sp)
    80003cd4:	64e6                	ld	s1,88(sp)
    80003cd6:	6946                	ld	s2,80(sp)
    80003cd8:	69a6                	ld	s3,72(sp)
    80003cda:	6a06                	ld	s4,64(sp)
    80003cdc:	7ae2                	ld	s5,56(sp)
    80003cde:	7b42                	ld	s6,48(sp)
    80003ce0:	7ba2                	ld	s7,40(sp)
    80003ce2:	7c02                	ld	s8,32(sp)
    80003ce4:	6ce2                	ld	s9,24(sp)
    80003ce6:	6d42                	ld	s10,16(sp)
    80003ce8:	6da2                	ld	s11,8(sp)
    80003cea:	6165                	addi	sp,sp,112
    80003cec:	8082                	ret
    80003cee:	8a5e                	mv	s4,s7
    80003cf0:	bfc9                	j	80003cc2 <writei+0xe2>
    80003cf2:	557d                	li	a0,-1
    80003cf4:	8082                	ret
    80003cf6:	557d                	li	a0,-1
    80003cf8:	bfe1                	j	80003cd0 <writei+0xf0>
    80003cfa:	557d                	li	a0,-1
    80003cfc:	bfd1                	j	80003cd0 <writei+0xf0>

0000000080003cfe <namecmp>:
    80003cfe:	1141                	addi	sp,sp,-16
    80003d00:	e406                	sd	ra,8(sp)
    80003d02:	e022                	sd	s0,0(sp)
    80003d04:	0800                	addi	s0,sp,16
    80003d06:	4639                	li	a2,14
    80003d08:	ffffd097          	auipc	ra,0xffffd
    80003d0c:	0b0080e7          	jalr	176(ra) # 80000db8 <strncmp>
    80003d10:	60a2                	ld	ra,8(sp)
    80003d12:	6402                	ld	s0,0(sp)
    80003d14:	0141                	addi	sp,sp,16
    80003d16:	8082                	ret

0000000080003d18 <dirlookup>:
    80003d18:	7139                	addi	sp,sp,-64
    80003d1a:	fc06                	sd	ra,56(sp)
    80003d1c:	f822                	sd	s0,48(sp)
    80003d1e:	f426                	sd	s1,40(sp)
    80003d20:	f04a                	sd	s2,32(sp)
    80003d22:	ec4e                	sd	s3,24(sp)
    80003d24:	e852                	sd	s4,16(sp)
    80003d26:	0080                	addi	s0,sp,64
    80003d28:	04451703          	lh	a4,68(a0)
    80003d2c:	4785                	li	a5,1
    80003d2e:	00f71a63          	bne	a4,a5,80003d42 <dirlookup+0x2a>
    80003d32:	892a                	mv	s2,a0
    80003d34:	89ae                	mv	s3,a1
    80003d36:	8a32                	mv	s4,a2
    80003d38:	457c                	lw	a5,76(a0)
    80003d3a:	4481                	li	s1,0
    80003d3c:	4501                	li	a0,0
    80003d3e:	e79d                	bnez	a5,80003d6c <dirlookup+0x54>
    80003d40:	a8a5                	j	80003db8 <dirlookup+0xa0>
    80003d42:	00005517          	auipc	a0,0x5
    80003d46:	96e50513          	addi	a0,a0,-1682 # 800086b0 <syscalls+0x1b0>
    80003d4a:	ffffc097          	auipc	ra,0xffffc
    80003d4e:	7f4080e7          	jalr	2036(ra) # 8000053e <panic>
    80003d52:	00005517          	auipc	a0,0x5
    80003d56:	97650513          	addi	a0,a0,-1674 # 800086c8 <syscalls+0x1c8>
    80003d5a:	ffffc097          	auipc	ra,0xffffc
    80003d5e:	7e4080e7          	jalr	2020(ra) # 8000053e <panic>
    80003d62:	24c1                	addiw	s1,s1,16
    80003d64:	04c92783          	lw	a5,76(s2)
    80003d68:	04f4f763          	bgeu	s1,a5,80003db6 <dirlookup+0x9e>
    80003d6c:	4741                	li	a4,16
    80003d6e:	86a6                	mv	a3,s1
    80003d70:	fc040613          	addi	a2,s0,-64
    80003d74:	4581                	li	a1,0
    80003d76:	854a                	mv	a0,s2
    80003d78:	00000097          	auipc	ra,0x0
    80003d7c:	d70080e7          	jalr	-656(ra) # 80003ae8 <readi>
    80003d80:	47c1                	li	a5,16
    80003d82:	fcf518e3          	bne	a0,a5,80003d52 <dirlookup+0x3a>
    80003d86:	fc045783          	lhu	a5,-64(s0)
    80003d8a:	dfe1                	beqz	a5,80003d62 <dirlookup+0x4a>
    80003d8c:	fc240593          	addi	a1,s0,-62
    80003d90:	854e                	mv	a0,s3
    80003d92:	00000097          	auipc	ra,0x0
    80003d96:	f6c080e7          	jalr	-148(ra) # 80003cfe <namecmp>
    80003d9a:	f561                	bnez	a0,80003d62 <dirlookup+0x4a>
    80003d9c:	000a0463          	beqz	s4,80003da4 <dirlookup+0x8c>
    80003da0:	009a2023          	sw	s1,0(s4)
    80003da4:	fc045583          	lhu	a1,-64(s0)
    80003da8:	00092503          	lw	a0,0(s2)
    80003dac:	fffff097          	auipc	ra,0xfffff
    80003db0:	754080e7          	jalr	1876(ra) # 80003500 <iget>
    80003db4:	a011                	j	80003db8 <dirlookup+0xa0>
    80003db6:	4501                	li	a0,0
    80003db8:	70e2                	ld	ra,56(sp)
    80003dba:	7442                	ld	s0,48(sp)
    80003dbc:	74a2                	ld	s1,40(sp)
    80003dbe:	7902                	ld	s2,32(sp)
    80003dc0:	69e2                	ld	s3,24(sp)
    80003dc2:	6a42                	ld	s4,16(sp)
    80003dc4:	6121                	addi	sp,sp,64
    80003dc6:	8082                	ret

0000000080003dc8 <namex>:
    80003dc8:	711d                	addi	sp,sp,-96
    80003dca:	ec86                	sd	ra,88(sp)
    80003dcc:	e8a2                	sd	s0,80(sp)
    80003dce:	e4a6                	sd	s1,72(sp)
    80003dd0:	e0ca                	sd	s2,64(sp)
    80003dd2:	fc4e                	sd	s3,56(sp)
    80003dd4:	f852                	sd	s4,48(sp)
    80003dd6:	f456                	sd	s5,40(sp)
    80003dd8:	f05a                	sd	s6,32(sp)
    80003dda:	ec5e                	sd	s7,24(sp)
    80003ddc:	e862                	sd	s8,16(sp)
    80003dde:	e466                	sd	s9,8(sp)
    80003de0:	1080                	addi	s0,sp,96
    80003de2:	84aa                	mv	s1,a0
    80003de4:	8b2e                	mv	s6,a1
    80003de6:	8ab2                	mv	s5,a2
    80003de8:	00054703          	lbu	a4,0(a0)
    80003dec:	02f00793          	li	a5,47
    80003df0:	02f70363          	beq	a4,a5,80003e16 <namex+0x4e>
    80003df4:	ffffe097          	auipc	ra,0xffffe
    80003df8:	bbc080e7          	jalr	-1092(ra) # 800019b0 <myproc>
    80003dfc:	15053503          	ld	a0,336(a0)
    80003e00:	00000097          	auipc	ra,0x0
    80003e04:	9f6080e7          	jalr	-1546(ra) # 800037f6 <idup>
    80003e08:	89aa                	mv	s3,a0
    80003e0a:	02f00913          	li	s2,47
    80003e0e:	4b81                	li	s7,0
    80003e10:	4cb5                	li	s9,13
    80003e12:	4c05                	li	s8,1
    80003e14:	a865                	j	80003ecc <namex+0x104>
    80003e16:	4585                	li	a1,1
    80003e18:	4505                	li	a0,1
    80003e1a:	fffff097          	auipc	ra,0xfffff
    80003e1e:	6e6080e7          	jalr	1766(ra) # 80003500 <iget>
    80003e22:	89aa                	mv	s3,a0
    80003e24:	b7dd                	j	80003e0a <namex+0x42>
    80003e26:	854e                	mv	a0,s3
    80003e28:	00000097          	auipc	ra,0x0
    80003e2c:	c6e080e7          	jalr	-914(ra) # 80003a96 <iunlockput>
    80003e30:	4981                	li	s3,0
    80003e32:	854e                	mv	a0,s3
    80003e34:	60e6                	ld	ra,88(sp)
    80003e36:	6446                	ld	s0,80(sp)
    80003e38:	64a6                	ld	s1,72(sp)
    80003e3a:	6906                	ld	s2,64(sp)
    80003e3c:	79e2                	ld	s3,56(sp)
    80003e3e:	7a42                	ld	s4,48(sp)
    80003e40:	7aa2                	ld	s5,40(sp)
    80003e42:	7b02                	ld	s6,32(sp)
    80003e44:	6be2                	ld	s7,24(sp)
    80003e46:	6c42                	ld	s8,16(sp)
    80003e48:	6ca2                	ld	s9,8(sp)
    80003e4a:	6125                	addi	sp,sp,96
    80003e4c:	8082                	ret
    80003e4e:	854e                	mv	a0,s3
    80003e50:	00000097          	auipc	ra,0x0
    80003e54:	aa6080e7          	jalr	-1370(ra) # 800038f6 <iunlock>
    80003e58:	bfe9                	j	80003e32 <namex+0x6a>
    80003e5a:	854e                	mv	a0,s3
    80003e5c:	00000097          	auipc	ra,0x0
    80003e60:	c3a080e7          	jalr	-966(ra) # 80003a96 <iunlockput>
    80003e64:	89d2                	mv	s3,s4
    80003e66:	b7f1                	j	80003e32 <namex+0x6a>
    80003e68:	40b48633          	sub	a2,s1,a1
    80003e6c:	00060a1b          	sext.w	s4,a2
    80003e70:	094cd463          	bge	s9,s4,80003ef8 <namex+0x130>
    80003e74:	4639                	li	a2,14
    80003e76:	8556                	mv	a0,s5
    80003e78:	ffffd097          	auipc	ra,0xffffd
    80003e7c:	ec8080e7          	jalr	-312(ra) # 80000d40 <memmove>
    80003e80:	0004c783          	lbu	a5,0(s1)
    80003e84:	01279763          	bne	a5,s2,80003e92 <namex+0xca>
    80003e88:	0485                	addi	s1,s1,1
    80003e8a:	0004c783          	lbu	a5,0(s1)
    80003e8e:	ff278de3          	beq	a5,s2,80003e88 <namex+0xc0>
    80003e92:	854e                	mv	a0,s3
    80003e94:	00000097          	auipc	ra,0x0
    80003e98:	9a0080e7          	jalr	-1632(ra) # 80003834 <ilock>
    80003e9c:	04499783          	lh	a5,68(s3)
    80003ea0:	f98793e3          	bne	a5,s8,80003e26 <namex+0x5e>
    80003ea4:	000b0563          	beqz	s6,80003eae <namex+0xe6>
    80003ea8:	0004c783          	lbu	a5,0(s1)
    80003eac:	d3cd                	beqz	a5,80003e4e <namex+0x86>
    80003eae:	865e                	mv	a2,s7
    80003eb0:	85d6                	mv	a1,s5
    80003eb2:	854e                	mv	a0,s3
    80003eb4:	00000097          	auipc	ra,0x0
    80003eb8:	e64080e7          	jalr	-412(ra) # 80003d18 <dirlookup>
    80003ebc:	8a2a                	mv	s4,a0
    80003ebe:	dd51                	beqz	a0,80003e5a <namex+0x92>
    80003ec0:	854e                	mv	a0,s3
    80003ec2:	00000097          	auipc	ra,0x0
    80003ec6:	bd4080e7          	jalr	-1068(ra) # 80003a96 <iunlockput>
    80003eca:	89d2                	mv	s3,s4
    80003ecc:	0004c783          	lbu	a5,0(s1)
    80003ed0:	05279763          	bne	a5,s2,80003f1e <namex+0x156>
    80003ed4:	0485                	addi	s1,s1,1
    80003ed6:	0004c783          	lbu	a5,0(s1)
    80003eda:	ff278de3          	beq	a5,s2,80003ed4 <namex+0x10c>
    80003ede:	c79d                	beqz	a5,80003f0c <namex+0x144>
    80003ee0:	85a6                	mv	a1,s1
    80003ee2:	8a5e                	mv	s4,s7
    80003ee4:	865e                	mv	a2,s7
    80003ee6:	01278963          	beq	a5,s2,80003ef8 <namex+0x130>
    80003eea:	dfbd                	beqz	a5,80003e68 <namex+0xa0>
    80003eec:	0485                	addi	s1,s1,1
    80003eee:	0004c783          	lbu	a5,0(s1)
    80003ef2:	ff279ce3          	bne	a5,s2,80003eea <namex+0x122>
    80003ef6:	bf8d                	j	80003e68 <namex+0xa0>
    80003ef8:	2601                	sext.w	a2,a2
    80003efa:	8556                	mv	a0,s5
    80003efc:	ffffd097          	auipc	ra,0xffffd
    80003f00:	e44080e7          	jalr	-444(ra) # 80000d40 <memmove>
    80003f04:	9a56                	add	s4,s4,s5
    80003f06:	000a0023          	sb	zero,0(s4)
    80003f0a:	bf9d                	j	80003e80 <namex+0xb8>
    80003f0c:	f20b03e3          	beqz	s6,80003e32 <namex+0x6a>
    80003f10:	854e                	mv	a0,s3
    80003f12:	00000097          	auipc	ra,0x0
    80003f16:	adc080e7          	jalr	-1316(ra) # 800039ee <iput>
    80003f1a:	4981                	li	s3,0
    80003f1c:	bf19                	j	80003e32 <namex+0x6a>
    80003f1e:	d7fd                	beqz	a5,80003f0c <namex+0x144>
    80003f20:	0004c783          	lbu	a5,0(s1)
    80003f24:	85a6                	mv	a1,s1
    80003f26:	b7d1                	j	80003eea <namex+0x122>

0000000080003f28 <dirlink>:
    80003f28:	7139                	addi	sp,sp,-64
    80003f2a:	fc06                	sd	ra,56(sp)
    80003f2c:	f822                	sd	s0,48(sp)
    80003f2e:	f426                	sd	s1,40(sp)
    80003f30:	f04a                	sd	s2,32(sp)
    80003f32:	ec4e                	sd	s3,24(sp)
    80003f34:	e852                	sd	s4,16(sp)
    80003f36:	0080                	addi	s0,sp,64
    80003f38:	892a                	mv	s2,a0
    80003f3a:	8a2e                	mv	s4,a1
    80003f3c:	89b2                	mv	s3,a2
    80003f3e:	4601                	li	a2,0
    80003f40:	00000097          	auipc	ra,0x0
    80003f44:	dd8080e7          	jalr	-552(ra) # 80003d18 <dirlookup>
    80003f48:	e93d                	bnez	a0,80003fbe <dirlink+0x96>
    80003f4a:	04c92483          	lw	s1,76(s2)
    80003f4e:	c49d                	beqz	s1,80003f7c <dirlink+0x54>
    80003f50:	4481                	li	s1,0
    80003f52:	4741                	li	a4,16
    80003f54:	86a6                	mv	a3,s1
    80003f56:	fc040613          	addi	a2,s0,-64
    80003f5a:	4581                	li	a1,0
    80003f5c:	854a                	mv	a0,s2
    80003f5e:	00000097          	auipc	ra,0x0
    80003f62:	b8a080e7          	jalr	-1142(ra) # 80003ae8 <readi>
    80003f66:	47c1                	li	a5,16
    80003f68:	06f51163          	bne	a0,a5,80003fca <dirlink+0xa2>
    80003f6c:	fc045783          	lhu	a5,-64(s0)
    80003f70:	c791                	beqz	a5,80003f7c <dirlink+0x54>
    80003f72:	24c1                	addiw	s1,s1,16
    80003f74:	04c92783          	lw	a5,76(s2)
    80003f78:	fcf4ede3          	bltu	s1,a5,80003f52 <dirlink+0x2a>
    80003f7c:	4639                	li	a2,14
    80003f7e:	85d2                	mv	a1,s4
    80003f80:	fc240513          	addi	a0,s0,-62
    80003f84:	ffffd097          	auipc	ra,0xffffd
    80003f88:	e70080e7          	jalr	-400(ra) # 80000df4 <strncpy>
    80003f8c:	fd341023          	sh	s3,-64(s0)
    80003f90:	4741                	li	a4,16
    80003f92:	86a6                	mv	a3,s1
    80003f94:	fc040613          	addi	a2,s0,-64
    80003f98:	4581                	li	a1,0
    80003f9a:	854a                	mv	a0,s2
    80003f9c:	00000097          	auipc	ra,0x0
    80003fa0:	c44080e7          	jalr	-956(ra) # 80003be0 <writei>
    80003fa4:	872a                	mv	a4,a0
    80003fa6:	47c1                	li	a5,16
    80003fa8:	4501                	li	a0,0
    80003faa:	02f71863          	bne	a4,a5,80003fda <dirlink+0xb2>
    80003fae:	70e2                	ld	ra,56(sp)
    80003fb0:	7442                	ld	s0,48(sp)
    80003fb2:	74a2                	ld	s1,40(sp)
    80003fb4:	7902                	ld	s2,32(sp)
    80003fb6:	69e2                	ld	s3,24(sp)
    80003fb8:	6a42                	ld	s4,16(sp)
    80003fba:	6121                	addi	sp,sp,64
    80003fbc:	8082                	ret
    80003fbe:	00000097          	auipc	ra,0x0
    80003fc2:	a30080e7          	jalr	-1488(ra) # 800039ee <iput>
    80003fc6:	557d                	li	a0,-1
    80003fc8:	b7dd                	j	80003fae <dirlink+0x86>
    80003fca:	00004517          	auipc	a0,0x4
    80003fce:	70e50513          	addi	a0,a0,1806 # 800086d8 <syscalls+0x1d8>
    80003fd2:	ffffc097          	auipc	ra,0xffffc
    80003fd6:	56c080e7          	jalr	1388(ra) # 8000053e <panic>
    80003fda:	00005517          	auipc	a0,0x5
    80003fde:	80650513          	addi	a0,a0,-2042 # 800087e0 <syscalls+0x2e0>
    80003fe2:	ffffc097          	auipc	ra,0xffffc
    80003fe6:	55c080e7          	jalr	1372(ra) # 8000053e <panic>

0000000080003fea <namei>:
    80003fea:	1101                	addi	sp,sp,-32
    80003fec:	ec06                	sd	ra,24(sp)
    80003fee:	e822                	sd	s0,16(sp)
    80003ff0:	1000                	addi	s0,sp,32
    80003ff2:	fe040613          	addi	a2,s0,-32
    80003ff6:	4581                	li	a1,0
    80003ff8:	00000097          	auipc	ra,0x0
    80003ffc:	dd0080e7          	jalr	-560(ra) # 80003dc8 <namex>
    80004000:	60e2                	ld	ra,24(sp)
    80004002:	6442                	ld	s0,16(sp)
    80004004:	6105                	addi	sp,sp,32
    80004006:	8082                	ret

0000000080004008 <nameiparent>:
    80004008:	1141                	addi	sp,sp,-16
    8000400a:	e406                	sd	ra,8(sp)
    8000400c:	e022                	sd	s0,0(sp)
    8000400e:	0800                	addi	s0,sp,16
    80004010:	862e                	mv	a2,a1
    80004012:	4585                	li	a1,1
    80004014:	00000097          	auipc	ra,0x0
    80004018:	db4080e7          	jalr	-588(ra) # 80003dc8 <namex>
    8000401c:	60a2                	ld	ra,8(sp)
    8000401e:	6402                	ld	s0,0(sp)
    80004020:	0141                	addi	sp,sp,16
    80004022:	8082                	ret

0000000080004024 <write_head>:
    80004024:	1101                	addi	sp,sp,-32
    80004026:	ec06                	sd	ra,24(sp)
    80004028:	e822                	sd	s0,16(sp)
    8000402a:	e426                	sd	s1,8(sp)
    8000402c:	e04a                	sd	s2,0(sp)
    8000402e:	1000                	addi	s0,sp,32
    80004030:	0001e917          	auipc	s2,0x1e
    80004034:	a4090913          	addi	s2,s2,-1472 # 80021a70 <log>
    80004038:	01892583          	lw	a1,24(s2)
    8000403c:	02892503          	lw	a0,40(s2)
    80004040:	fffff097          	auipc	ra,0xfffff
    80004044:	ff2080e7          	jalr	-14(ra) # 80003032 <bread>
    80004048:	84aa                	mv	s1,a0
    8000404a:	02c92683          	lw	a3,44(s2)
    8000404e:	cd34                	sw	a3,88(a0)
    80004050:	02d05763          	blez	a3,8000407e <write_head+0x5a>
    80004054:	0001e797          	auipc	a5,0x1e
    80004058:	a4c78793          	addi	a5,a5,-1460 # 80021aa0 <log+0x30>
    8000405c:	05c50713          	addi	a4,a0,92
    80004060:	36fd                	addiw	a3,a3,-1
    80004062:	1682                	slli	a3,a3,0x20
    80004064:	9281                	srli	a3,a3,0x20
    80004066:	068a                	slli	a3,a3,0x2
    80004068:	0001e617          	auipc	a2,0x1e
    8000406c:	a3c60613          	addi	a2,a2,-1476 # 80021aa4 <log+0x34>
    80004070:	96b2                	add	a3,a3,a2
    80004072:	4390                	lw	a2,0(a5)
    80004074:	c310                	sw	a2,0(a4)
    80004076:	0791                	addi	a5,a5,4
    80004078:	0711                	addi	a4,a4,4
    8000407a:	fed79ce3          	bne	a5,a3,80004072 <write_head+0x4e>
    8000407e:	8526                	mv	a0,s1
    80004080:	fffff097          	auipc	ra,0xfffff
    80004084:	0a4080e7          	jalr	164(ra) # 80003124 <bwrite>
    80004088:	8526                	mv	a0,s1
    8000408a:	fffff097          	auipc	ra,0xfffff
    8000408e:	0d8080e7          	jalr	216(ra) # 80003162 <brelse>
    80004092:	60e2                	ld	ra,24(sp)
    80004094:	6442                	ld	s0,16(sp)
    80004096:	64a2                	ld	s1,8(sp)
    80004098:	6902                	ld	s2,0(sp)
    8000409a:	6105                	addi	sp,sp,32
    8000409c:	8082                	ret

000000008000409e <install_trans>:
    8000409e:	0001e797          	auipc	a5,0x1e
    800040a2:	9fe7a783          	lw	a5,-1538(a5) # 80021a9c <log+0x2c>
    800040a6:	0af05d63          	blez	a5,80004160 <install_trans+0xc2>
    800040aa:	7139                	addi	sp,sp,-64
    800040ac:	fc06                	sd	ra,56(sp)
    800040ae:	f822                	sd	s0,48(sp)
    800040b0:	f426                	sd	s1,40(sp)
    800040b2:	f04a                	sd	s2,32(sp)
    800040b4:	ec4e                	sd	s3,24(sp)
    800040b6:	e852                	sd	s4,16(sp)
    800040b8:	e456                	sd	s5,8(sp)
    800040ba:	e05a                	sd	s6,0(sp)
    800040bc:	0080                	addi	s0,sp,64
    800040be:	8b2a                	mv	s6,a0
    800040c0:	0001ea97          	auipc	s5,0x1e
    800040c4:	9e0a8a93          	addi	s5,s5,-1568 # 80021aa0 <log+0x30>
    800040c8:	4a01                	li	s4,0
    800040ca:	0001e997          	auipc	s3,0x1e
    800040ce:	9a698993          	addi	s3,s3,-1626 # 80021a70 <log>
    800040d2:	a035                	j	800040fe <install_trans+0x60>
    800040d4:	8526                	mv	a0,s1
    800040d6:	fffff097          	auipc	ra,0xfffff
    800040da:	166080e7          	jalr	358(ra) # 8000323c <bunpin>
    800040de:	854a                	mv	a0,s2
    800040e0:	fffff097          	auipc	ra,0xfffff
    800040e4:	082080e7          	jalr	130(ra) # 80003162 <brelse>
    800040e8:	8526                	mv	a0,s1
    800040ea:	fffff097          	auipc	ra,0xfffff
    800040ee:	078080e7          	jalr	120(ra) # 80003162 <brelse>
    800040f2:	2a05                	addiw	s4,s4,1
    800040f4:	0a91                	addi	s5,s5,4
    800040f6:	02c9a783          	lw	a5,44(s3)
    800040fa:	04fa5963          	bge	s4,a5,8000414c <install_trans+0xae>
    800040fe:	0189a583          	lw	a1,24(s3)
    80004102:	014585bb          	addw	a1,a1,s4
    80004106:	2585                	addiw	a1,a1,1
    80004108:	0289a503          	lw	a0,40(s3)
    8000410c:	fffff097          	auipc	ra,0xfffff
    80004110:	f26080e7          	jalr	-218(ra) # 80003032 <bread>
    80004114:	892a                	mv	s2,a0
    80004116:	000aa583          	lw	a1,0(s5)
    8000411a:	0289a503          	lw	a0,40(s3)
    8000411e:	fffff097          	auipc	ra,0xfffff
    80004122:	f14080e7          	jalr	-236(ra) # 80003032 <bread>
    80004126:	84aa                	mv	s1,a0
    80004128:	40000613          	li	a2,1024
    8000412c:	05890593          	addi	a1,s2,88
    80004130:	05850513          	addi	a0,a0,88
    80004134:	ffffd097          	auipc	ra,0xffffd
    80004138:	c0c080e7          	jalr	-1012(ra) # 80000d40 <memmove>
    8000413c:	8526                	mv	a0,s1
    8000413e:	fffff097          	auipc	ra,0xfffff
    80004142:	fe6080e7          	jalr	-26(ra) # 80003124 <bwrite>
    80004146:	f80b1ce3          	bnez	s6,800040de <install_trans+0x40>
    8000414a:	b769                	j	800040d4 <install_trans+0x36>
    8000414c:	70e2                	ld	ra,56(sp)
    8000414e:	7442                	ld	s0,48(sp)
    80004150:	74a2                	ld	s1,40(sp)
    80004152:	7902                	ld	s2,32(sp)
    80004154:	69e2                	ld	s3,24(sp)
    80004156:	6a42                	ld	s4,16(sp)
    80004158:	6aa2                	ld	s5,8(sp)
    8000415a:	6b02                	ld	s6,0(sp)
    8000415c:	6121                	addi	sp,sp,64
    8000415e:	8082                	ret
    80004160:	8082                	ret

0000000080004162 <initlog>:
    80004162:	7179                	addi	sp,sp,-48
    80004164:	f406                	sd	ra,40(sp)
    80004166:	f022                	sd	s0,32(sp)
    80004168:	ec26                	sd	s1,24(sp)
    8000416a:	e84a                	sd	s2,16(sp)
    8000416c:	e44e                	sd	s3,8(sp)
    8000416e:	1800                	addi	s0,sp,48
    80004170:	892a                	mv	s2,a0
    80004172:	89ae                	mv	s3,a1
    80004174:	0001e497          	auipc	s1,0x1e
    80004178:	8fc48493          	addi	s1,s1,-1796 # 80021a70 <log>
    8000417c:	00004597          	auipc	a1,0x4
    80004180:	56c58593          	addi	a1,a1,1388 # 800086e8 <syscalls+0x1e8>
    80004184:	8526                	mv	a0,s1
    80004186:	ffffd097          	auipc	ra,0xffffd
    8000418a:	9ce080e7          	jalr	-1586(ra) # 80000b54 <initlock>
    8000418e:	0149a583          	lw	a1,20(s3)
    80004192:	cc8c                	sw	a1,24(s1)
    80004194:	0109a783          	lw	a5,16(s3)
    80004198:	ccdc                	sw	a5,28(s1)
    8000419a:	0324a423          	sw	s2,40(s1)
    8000419e:	854a                	mv	a0,s2
    800041a0:	fffff097          	auipc	ra,0xfffff
    800041a4:	e92080e7          	jalr	-366(ra) # 80003032 <bread>
    800041a8:	4d3c                	lw	a5,88(a0)
    800041aa:	d4dc                	sw	a5,44(s1)
    800041ac:	02f05563          	blez	a5,800041d6 <initlog+0x74>
    800041b0:	05c50713          	addi	a4,a0,92
    800041b4:	0001e697          	auipc	a3,0x1e
    800041b8:	8ec68693          	addi	a3,a3,-1812 # 80021aa0 <log+0x30>
    800041bc:	37fd                	addiw	a5,a5,-1
    800041be:	1782                	slli	a5,a5,0x20
    800041c0:	9381                	srli	a5,a5,0x20
    800041c2:	078a                	slli	a5,a5,0x2
    800041c4:	06050613          	addi	a2,a0,96
    800041c8:	97b2                	add	a5,a5,a2
    800041ca:	4310                	lw	a2,0(a4)
    800041cc:	c290                	sw	a2,0(a3)
    800041ce:	0711                	addi	a4,a4,4
    800041d0:	0691                	addi	a3,a3,4
    800041d2:	fef71ce3          	bne	a4,a5,800041ca <initlog+0x68>
    800041d6:	fffff097          	auipc	ra,0xfffff
    800041da:	f8c080e7          	jalr	-116(ra) # 80003162 <brelse>
    800041de:	4505                	li	a0,1
    800041e0:	00000097          	auipc	ra,0x0
    800041e4:	ebe080e7          	jalr	-322(ra) # 8000409e <install_trans>
    800041e8:	0001e797          	auipc	a5,0x1e
    800041ec:	8a07aa23          	sw	zero,-1868(a5) # 80021a9c <log+0x2c>
    800041f0:	00000097          	auipc	ra,0x0
    800041f4:	e34080e7          	jalr	-460(ra) # 80004024 <write_head>
    800041f8:	70a2                	ld	ra,40(sp)
    800041fa:	7402                	ld	s0,32(sp)
    800041fc:	64e2                	ld	s1,24(sp)
    800041fe:	6942                	ld	s2,16(sp)
    80004200:	69a2                	ld	s3,8(sp)
    80004202:	6145                	addi	sp,sp,48
    80004204:	8082                	ret

0000000080004206 <begin_op>:
    80004206:	1101                	addi	sp,sp,-32
    80004208:	ec06                	sd	ra,24(sp)
    8000420a:	e822                	sd	s0,16(sp)
    8000420c:	e426                	sd	s1,8(sp)
    8000420e:	e04a                	sd	s2,0(sp)
    80004210:	1000                	addi	s0,sp,32
    80004212:	0001e517          	auipc	a0,0x1e
    80004216:	85e50513          	addi	a0,a0,-1954 # 80021a70 <log>
    8000421a:	ffffd097          	auipc	ra,0xffffd
    8000421e:	9ca080e7          	jalr	-1590(ra) # 80000be4 <acquire>
    80004222:	0001e497          	auipc	s1,0x1e
    80004226:	84e48493          	addi	s1,s1,-1970 # 80021a70 <log>
    8000422a:	4979                	li	s2,30
    8000422c:	a039                	j	8000423a <begin_op+0x34>
    8000422e:	85a6                	mv	a1,s1
    80004230:	8526                	mv	a0,s1
    80004232:	ffffe097          	auipc	ra,0xffffe
    80004236:	fde080e7          	jalr	-34(ra) # 80002210 <sleep>
    8000423a:	50dc                	lw	a5,36(s1)
    8000423c:	fbed                	bnez	a5,8000422e <begin_op+0x28>
    8000423e:	509c                	lw	a5,32(s1)
    80004240:	0017871b          	addiw	a4,a5,1
    80004244:	0007069b          	sext.w	a3,a4
    80004248:	0027179b          	slliw	a5,a4,0x2
    8000424c:	9fb9                	addw	a5,a5,a4
    8000424e:	0017979b          	slliw	a5,a5,0x1
    80004252:	54d8                	lw	a4,44(s1)
    80004254:	9fb9                	addw	a5,a5,a4
    80004256:	00f95963          	bge	s2,a5,80004268 <begin_op+0x62>
    8000425a:	85a6                	mv	a1,s1
    8000425c:	8526                	mv	a0,s1
    8000425e:	ffffe097          	auipc	ra,0xffffe
    80004262:	fb2080e7          	jalr	-78(ra) # 80002210 <sleep>
    80004266:	bfd1                	j	8000423a <begin_op+0x34>
    80004268:	0001e517          	auipc	a0,0x1e
    8000426c:	80850513          	addi	a0,a0,-2040 # 80021a70 <log>
    80004270:	d114                	sw	a3,32(a0)
    80004272:	ffffd097          	auipc	ra,0xffffd
    80004276:	a26080e7          	jalr	-1498(ra) # 80000c98 <release>
    8000427a:	60e2                	ld	ra,24(sp)
    8000427c:	6442                	ld	s0,16(sp)
    8000427e:	64a2                	ld	s1,8(sp)
    80004280:	6902                	ld	s2,0(sp)
    80004282:	6105                	addi	sp,sp,32
    80004284:	8082                	ret

0000000080004286 <end_op>:
    80004286:	7139                	addi	sp,sp,-64
    80004288:	fc06                	sd	ra,56(sp)
    8000428a:	f822                	sd	s0,48(sp)
    8000428c:	f426                	sd	s1,40(sp)
    8000428e:	f04a                	sd	s2,32(sp)
    80004290:	ec4e                	sd	s3,24(sp)
    80004292:	e852                	sd	s4,16(sp)
    80004294:	e456                	sd	s5,8(sp)
    80004296:	0080                	addi	s0,sp,64
    80004298:	0001d497          	auipc	s1,0x1d
    8000429c:	7d848493          	addi	s1,s1,2008 # 80021a70 <log>
    800042a0:	8526                	mv	a0,s1
    800042a2:	ffffd097          	auipc	ra,0xffffd
    800042a6:	942080e7          	jalr	-1726(ra) # 80000be4 <acquire>
    800042aa:	509c                	lw	a5,32(s1)
    800042ac:	37fd                	addiw	a5,a5,-1
    800042ae:	0007891b          	sext.w	s2,a5
    800042b2:	d09c                	sw	a5,32(s1)
    800042b4:	50dc                	lw	a5,36(s1)
    800042b6:	efb9                	bnez	a5,80004314 <end_op+0x8e>
    800042b8:	06091663          	bnez	s2,80004324 <end_op+0x9e>
    800042bc:	0001d497          	auipc	s1,0x1d
    800042c0:	7b448493          	addi	s1,s1,1972 # 80021a70 <log>
    800042c4:	4785                	li	a5,1
    800042c6:	d0dc                	sw	a5,36(s1)
    800042c8:	8526                	mv	a0,s1
    800042ca:	ffffd097          	auipc	ra,0xffffd
    800042ce:	9ce080e7          	jalr	-1586(ra) # 80000c98 <release>
    800042d2:	54dc                	lw	a5,44(s1)
    800042d4:	06f04763          	bgtz	a5,80004342 <end_op+0xbc>
    800042d8:	0001d497          	auipc	s1,0x1d
    800042dc:	79848493          	addi	s1,s1,1944 # 80021a70 <log>
    800042e0:	8526                	mv	a0,s1
    800042e2:	ffffd097          	auipc	ra,0xffffd
    800042e6:	902080e7          	jalr	-1790(ra) # 80000be4 <acquire>
    800042ea:	0204a223          	sw	zero,36(s1)
    800042ee:	8526                	mv	a0,s1
    800042f0:	ffffe097          	auipc	ra,0xffffe
    800042f4:	0ac080e7          	jalr	172(ra) # 8000239c <wakeup>
    800042f8:	8526                	mv	a0,s1
    800042fa:	ffffd097          	auipc	ra,0xffffd
    800042fe:	99e080e7          	jalr	-1634(ra) # 80000c98 <release>
    80004302:	70e2                	ld	ra,56(sp)
    80004304:	7442                	ld	s0,48(sp)
    80004306:	74a2                	ld	s1,40(sp)
    80004308:	7902                	ld	s2,32(sp)
    8000430a:	69e2                	ld	s3,24(sp)
    8000430c:	6a42                	ld	s4,16(sp)
    8000430e:	6aa2                	ld	s5,8(sp)
    80004310:	6121                	addi	sp,sp,64
    80004312:	8082                	ret
    80004314:	00004517          	auipc	a0,0x4
    80004318:	3dc50513          	addi	a0,a0,988 # 800086f0 <syscalls+0x1f0>
    8000431c:	ffffc097          	auipc	ra,0xffffc
    80004320:	222080e7          	jalr	546(ra) # 8000053e <panic>
    80004324:	0001d497          	auipc	s1,0x1d
    80004328:	74c48493          	addi	s1,s1,1868 # 80021a70 <log>
    8000432c:	8526                	mv	a0,s1
    8000432e:	ffffe097          	auipc	ra,0xffffe
    80004332:	06e080e7          	jalr	110(ra) # 8000239c <wakeup>
    80004336:	8526                	mv	a0,s1
    80004338:	ffffd097          	auipc	ra,0xffffd
    8000433c:	960080e7          	jalr	-1696(ra) # 80000c98 <release>
    80004340:	b7c9                	j	80004302 <end_op+0x7c>
    80004342:	0001da97          	auipc	s5,0x1d
    80004346:	75ea8a93          	addi	s5,s5,1886 # 80021aa0 <log+0x30>
    8000434a:	0001da17          	auipc	s4,0x1d
    8000434e:	726a0a13          	addi	s4,s4,1830 # 80021a70 <log>
    80004352:	018a2583          	lw	a1,24(s4)
    80004356:	012585bb          	addw	a1,a1,s2
    8000435a:	2585                	addiw	a1,a1,1
    8000435c:	028a2503          	lw	a0,40(s4)
    80004360:	fffff097          	auipc	ra,0xfffff
    80004364:	cd2080e7          	jalr	-814(ra) # 80003032 <bread>
    80004368:	84aa                	mv	s1,a0
    8000436a:	000aa583          	lw	a1,0(s5)
    8000436e:	028a2503          	lw	a0,40(s4)
    80004372:	fffff097          	auipc	ra,0xfffff
    80004376:	cc0080e7          	jalr	-832(ra) # 80003032 <bread>
    8000437a:	89aa                	mv	s3,a0
    8000437c:	40000613          	li	a2,1024
    80004380:	05850593          	addi	a1,a0,88
    80004384:	05848513          	addi	a0,s1,88
    80004388:	ffffd097          	auipc	ra,0xffffd
    8000438c:	9b8080e7          	jalr	-1608(ra) # 80000d40 <memmove>
    80004390:	8526                	mv	a0,s1
    80004392:	fffff097          	auipc	ra,0xfffff
    80004396:	d92080e7          	jalr	-622(ra) # 80003124 <bwrite>
    8000439a:	854e                	mv	a0,s3
    8000439c:	fffff097          	auipc	ra,0xfffff
    800043a0:	dc6080e7          	jalr	-570(ra) # 80003162 <brelse>
    800043a4:	8526                	mv	a0,s1
    800043a6:	fffff097          	auipc	ra,0xfffff
    800043aa:	dbc080e7          	jalr	-580(ra) # 80003162 <brelse>
    800043ae:	2905                	addiw	s2,s2,1
    800043b0:	0a91                	addi	s5,s5,4
    800043b2:	02ca2783          	lw	a5,44(s4)
    800043b6:	f8f94ee3          	blt	s2,a5,80004352 <end_op+0xcc>
    800043ba:	00000097          	auipc	ra,0x0
    800043be:	c6a080e7          	jalr	-918(ra) # 80004024 <write_head>
    800043c2:	4501                	li	a0,0
    800043c4:	00000097          	auipc	ra,0x0
    800043c8:	cda080e7          	jalr	-806(ra) # 8000409e <install_trans>
    800043cc:	0001d797          	auipc	a5,0x1d
    800043d0:	6c07a823          	sw	zero,1744(a5) # 80021a9c <log+0x2c>
    800043d4:	00000097          	auipc	ra,0x0
    800043d8:	c50080e7          	jalr	-944(ra) # 80004024 <write_head>
    800043dc:	bdf5                	j	800042d8 <end_op+0x52>

00000000800043de <log_write>:
    800043de:	1101                	addi	sp,sp,-32
    800043e0:	ec06                	sd	ra,24(sp)
    800043e2:	e822                	sd	s0,16(sp)
    800043e4:	e426                	sd	s1,8(sp)
    800043e6:	e04a                	sd	s2,0(sp)
    800043e8:	1000                	addi	s0,sp,32
    800043ea:	84aa                	mv	s1,a0
    800043ec:	0001d917          	auipc	s2,0x1d
    800043f0:	68490913          	addi	s2,s2,1668 # 80021a70 <log>
    800043f4:	854a                	mv	a0,s2
    800043f6:	ffffc097          	auipc	ra,0xffffc
    800043fa:	7ee080e7          	jalr	2030(ra) # 80000be4 <acquire>
    800043fe:	02c92603          	lw	a2,44(s2)
    80004402:	47f5                	li	a5,29
    80004404:	06c7c563          	blt	a5,a2,8000446e <log_write+0x90>
    80004408:	0001d797          	auipc	a5,0x1d
    8000440c:	6847a783          	lw	a5,1668(a5) # 80021a8c <log+0x1c>
    80004410:	37fd                	addiw	a5,a5,-1
    80004412:	04f65e63          	bge	a2,a5,8000446e <log_write+0x90>
    80004416:	0001d797          	auipc	a5,0x1d
    8000441a:	67a7a783          	lw	a5,1658(a5) # 80021a90 <log+0x20>
    8000441e:	06f05063          	blez	a5,8000447e <log_write+0xa0>
    80004422:	4781                	li	a5,0
    80004424:	06c05563          	blez	a2,8000448e <log_write+0xb0>
    80004428:	44cc                	lw	a1,12(s1)
    8000442a:	0001d717          	auipc	a4,0x1d
    8000442e:	67670713          	addi	a4,a4,1654 # 80021aa0 <log+0x30>
    80004432:	4781                	li	a5,0
    80004434:	4314                	lw	a3,0(a4)
    80004436:	04b68c63          	beq	a3,a1,8000448e <log_write+0xb0>
    8000443a:	2785                	addiw	a5,a5,1
    8000443c:	0711                	addi	a4,a4,4
    8000443e:	fef61be3          	bne	a2,a5,80004434 <log_write+0x56>
    80004442:	0621                	addi	a2,a2,8
    80004444:	060a                	slli	a2,a2,0x2
    80004446:	0001d797          	auipc	a5,0x1d
    8000444a:	62a78793          	addi	a5,a5,1578 # 80021a70 <log>
    8000444e:	963e                	add	a2,a2,a5
    80004450:	44dc                	lw	a5,12(s1)
    80004452:	ca1c                	sw	a5,16(a2)
    80004454:	8526                	mv	a0,s1
    80004456:	fffff097          	auipc	ra,0xfffff
    8000445a:	daa080e7          	jalr	-598(ra) # 80003200 <bpin>
    8000445e:	0001d717          	auipc	a4,0x1d
    80004462:	61270713          	addi	a4,a4,1554 # 80021a70 <log>
    80004466:	575c                	lw	a5,44(a4)
    80004468:	2785                	addiw	a5,a5,1
    8000446a:	d75c                	sw	a5,44(a4)
    8000446c:	a835                	j	800044a8 <log_write+0xca>
    8000446e:	00004517          	auipc	a0,0x4
    80004472:	29250513          	addi	a0,a0,658 # 80008700 <syscalls+0x200>
    80004476:	ffffc097          	auipc	ra,0xffffc
    8000447a:	0c8080e7          	jalr	200(ra) # 8000053e <panic>
    8000447e:	00004517          	auipc	a0,0x4
    80004482:	29a50513          	addi	a0,a0,666 # 80008718 <syscalls+0x218>
    80004486:	ffffc097          	auipc	ra,0xffffc
    8000448a:	0b8080e7          	jalr	184(ra) # 8000053e <panic>
    8000448e:	00878713          	addi	a4,a5,8
    80004492:	00271693          	slli	a3,a4,0x2
    80004496:	0001d717          	auipc	a4,0x1d
    8000449a:	5da70713          	addi	a4,a4,1498 # 80021a70 <log>
    8000449e:	9736                	add	a4,a4,a3
    800044a0:	44d4                	lw	a3,12(s1)
    800044a2:	cb14                	sw	a3,16(a4)
    800044a4:	faf608e3          	beq	a2,a5,80004454 <log_write+0x76>
    800044a8:	0001d517          	auipc	a0,0x1d
    800044ac:	5c850513          	addi	a0,a0,1480 # 80021a70 <log>
    800044b0:	ffffc097          	auipc	ra,0xffffc
    800044b4:	7e8080e7          	jalr	2024(ra) # 80000c98 <release>
    800044b8:	60e2                	ld	ra,24(sp)
    800044ba:	6442                	ld	s0,16(sp)
    800044bc:	64a2                	ld	s1,8(sp)
    800044be:	6902                	ld	s2,0(sp)
    800044c0:	6105                	addi	sp,sp,32
    800044c2:	8082                	ret

00000000800044c4 <initsleeplock>:
    800044c4:	1101                	addi	sp,sp,-32
    800044c6:	ec06                	sd	ra,24(sp)
    800044c8:	e822                	sd	s0,16(sp)
    800044ca:	e426                	sd	s1,8(sp)
    800044cc:	e04a                	sd	s2,0(sp)
    800044ce:	1000                	addi	s0,sp,32
    800044d0:	84aa                	mv	s1,a0
    800044d2:	892e                	mv	s2,a1
    800044d4:	00004597          	auipc	a1,0x4
    800044d8:	26458593          	addi	a1,a1,612 # 80008738 <syscalls+0x238>
    800044dc:	0521                	addi	a0,a0,8
    800044de:	ffffc097          	auipc	ra,0xffffc
    800044e2:	676080e7          	jalr	1654(ra) # 80000b54 <initlock>
    800044e6:	0324b023          	sd	s2,32(s1)
    800044ea:	0004a023          	sw	zero,0(s1)
    800044ee:	0204a423          	sw	zero,40(s1)
    800044f2:	60e2                	ld	ra,24(sp)
    800044f4:	6442                	ld	s0,16(sp)
    800044f6:	64a2                	ld	s1,8(sp)
    800044f8:	6902                	ld	s2,0(sp)
    800044fa:	6105                	addi	sp,sp,32
    800044fc:	8082                	ret

00000000800044fe <acquiresleep>:
    800044fe:	1101                	addi	sp,sp,-32
    80004500:	ec06                	sd	ra,24(sp)
    80004502:	e822                	sd	s0,16(sp)
    80004504:	e426                	sd	s1,8(sp)
    80004506:	e04a                	sd	s2,0(sp)
    80004508:	1000                	addi	s0,sp,32
    8000450a:	84aa                	mv	s1,a0
    8000450c:	00850913          	addi	s2,a0,8
    80004510:	854a                	mv	a0,s2
    80004512:	ffffc097          	auipc	ra,0xffffc
    80004516:	6d2080e7          	jalr	1746(ra) # 80000be4 <acquire>
    8000451a:	409c                	lw	a5,0(s1)
    8000451c:	cb89                	beqz	a5,8000452e <acquiresleep+0x30>
    8000451e:	85ca                	mv	a1,s2
    80004520:	8526                	mv	a0,s1
    80004522:	ffffe097          	auipc	ra,0xffffe
    80004526:	cee080e7          	jalr	-786(ra) # 80002210 <sleep>
    8000452a:	409c                	lw	a5,0(s1)
    8000452c:	fbed                	bnez	a5,8000451e <acquiresleep+0x20>
    8000452e:	4785                	li	a5,1
    80004530:	c09c                	sw	a5,0(s1)
    80004532:	ffffd097          	auipc	ra,0xffffd
    80004536:	47e080e7          	jalr	1150(ra) # 800019b0 <myproc>
    8000453a:	591c                	lw	a5,48(a0)
    8000453c:	d49c                	sw	a5,40(s1)
    8000453e:	854a                	mv	a0,s2
    80004540:	ffffc097          	auipc	ra,0xffffc
    80004544:	758080e7          	jalr	1880(ra) # 80000c98 <release>
    80004548:	60e2                	ld	ra,24(sp)
    8000454a:	6442                	ld	s0,16(sp)
    8000454c:	64a2                	ld	s1,8(sp)
    8000454e:	6902                	ld	s2,0(sp)
    80004550:	6105                	addi	sp,sp,32
    80004552:	8082                	ret

0000000080004554 <releasesleep>:
    80004554:	1101                	addi	sp,sp,-32
    80004556:	ec06                	sd	ra,24(sp)
    80004558:	e822                	sd	s0,16(sp)
    8000455a:	e426                	sd	s1,8(sp)
    8000455c:	e04a                	sd	s2,0(sp)
    8000455e:	1000                	addi	s0,sp,32
    80004560:	84aa                	mv	s1,a0
    80004562:	00850913          	addi	s2,a0,8
    80004566:	854a                	mv	a0,s2
    80004568:	ffffc097          	auipc	ra,0xffffc
    8000456c:	67c080e7          	jalr	1660(ra) # 80000be4 <acquire>
    80004570:	0004a023          	sw	zero,0(s1)
    80004574:	0204a423          	sw	zero,40(s1)
    80004578:	8526                	mv	a0,s1
    8000457a:	ffffe097          	auipc	ra,0xffffe
    8000457e:	e22080e7          	jalr	-478(ra) # 8000239c <wakeup>
    80004582:	854a                	mv	a0,s2
    80004584:	ffffc097          	auipc	ra,0xffffc
    80004588:	714080e7          	jalr	1812(ra) # 80000c98 <release>
    8000458c:	60e2                	ld	ra,24(sp)
    8000458e:	6442                	ld	s0,16(sp)
    80004590:	64a2                	ld	s1,8(sp)
    80004592:	6902                	ld	s2,0(sp)
    80004594:	6105                	addi	sp,sp,32
    80004596:	8082                	ret

0000000080004598 <holdingsleep>:
    80004598:	7179                	addi	sp,sp,-48
    8000459a:	f406                	sd	ra,40(sp)
    8000459c:	f022                	sd	s0,32(sp)
    8000459e:	ec26                	sd	s1,24(sp)
    800045a0:	e84a                	sd	s2,16(sp)
    800045a2:	e44e                	sd	s3,8(sp)
    800045a4:	1800                	addi	s0,sp,48
    800045a6:	84aa                	mv	s1,a0
    800045a8:	00850913          	addi	s2,a0,8
    800045ac:	854a                	mv	a0,s2
    800045ae:	ffffc097          	auipc	ra,0xffffc
    800045b2:	636080e7          	jalr	1590(ra) # 80000be4 <acquire>
    800045b6:	409c                	lw	a5,0(s1)
    800045b8:	ef99                	bnez	a5,800045d6 <holdingsleep+0x3e>
    800045ba:	4481                	li	s1,0
    800045bc:	854a                	mv	a0,s2
    800045be:	ffffc097          	auipc	ra,0xffffc
    800045c2:	6da080e7          	jalr	1754(ra) # 80000c98 <release>
    800045c6:	8526                	mv	a0,s1
    800045c8:	70a2                	ld	ra,40(sp)
    800045ca:	7402                	ld	s0,32(sp)
    800045cc:	64e2                	ld	s1,24(sp)
    800045ce:	6942                	ld	s2,16(sp)
    800045d0:	69a2                	ld	s3,8(sp)
    800045d2:	6145                	addi	sp,sp,48
    800045d4:	8082                	ret
    800045d6:	0284a983          	lw	s3,40(s1)
    800045da:	ffffd097          	auipc	ra,0xffffd
    800045de:	3d6080e7          	jalr	982(ra) # 800019b0 <myproc>
    800045e2:	5904                	lw	s1,48(a0)
    800045e4:	413484b3          	sub	s1,s1,s3
    800045e8:	0014b493          	seqz	s1,s1
    800045ec:	bfc1                	j	800045bc <holdingsleep+0x24>

00000000800045ee <fileinit>:
    800045ee:	1141                	addi	sp,sp,-16
    800045f0:	e406                	sd	ra,8(sp)
    800045f2:	e022                	sd	s0,0(sp)
    800045f4:	0800                	addi	s0,sp,16
    800045f6:	00004597          	auipc	a1,0x4
    800045fa:	15258593          	addi	a1,a1,338 # 80008748 <syscalls+0x248>
    800045fe:	0001d517          	auipc	a0,0x1d
    80004602:	5ba50513          	addi	a0,a0,1466 # 80021bb8 <ftable>
    80004606:	ffffc097          	auipc	ra,0xffffc
    8000460a:	54e080e7          	jalr	1358(ra) # 80000b54 <initlock>
    8000460e:	60a2                	ld	ra,8(sp)
    80004610:	6402                	ld	s0,0(sp)
    80004612:	0141                	addi	sp,sp,16
    80004614:	8082                	ret

0000000080004616 <filealloc>:
    80004616:	1101                	addi	sp,sp,-32
    80004618:	ec06                	sd	ra,24(sp)
    8000461a:	e822                	sd	s0,16(sp)
    8000461c:	e426                	sd	s1,8(sp)
    8000461e:	1000                	addi	s0,sp,32
    80004620:	0001d517          	auipc	a0,0x1d
    80004624:	59850513          	addi	a0,a0,1432 # 80021bb8 <ftable>
    80004628:	ffffc097          	auipc	ra,0xffffc
    8000462c:	5bc080e7          	jalr	1468(ra) # 80000be4 <acquire>
    80004630:	0001d497          	auipc	s1,0x1d
    80004634:	5a048493          	addi	s1,s1,1440 # 80021bd0 <ftable+0x18>
    80004638:	0001e717          	auipc	a4,0x1e
    8000463c:	53870713          	addi	a4,a4,1336 # 80022b70 <ftable+0xfb8>
    80004640:	40dc                	lw	a5,4(s1)
    80004642:	cf99                	beqz	a5,80004660 <filealloc+0x4a>
    80004644:	02848493          	addi	s1,s1,40
    80004648:	fee49ce3          	bne	s1,a4,80004640 <filealloc+0x2a>
    8000464c:	0001d517          	auipc	a0,0x1d
    80004650:	56c50513          	addi	a0,a0,1388 # 80021bb8 <ftable>
    80004654:	ffffc097          	auipc	ra,0xffffc
    80004658:	644080e7          	jalr	1604(ra) # 80000c98 <release>
    8000465c:	4481                	li	s1,0
    8000465e:	a819                	j	80004674 <filealloc+0x5e>
    80004660:	4785                	li	a5,1
    80004662:	c0dc                	sw	a5,4(s1)
    80004664:	0001d517          	auipc	a0,0x1d
    80004668:	55450513          	addi	a0,a0,1364 # 80021bb8 <ftable>
    8000466c:	ffffc097          	auipc	ra,0xffffc
    80004670:	62c080e7          	jalr	1580(ra) # 80000c98 <release>
    80004674:	8526                	mv	a0,s1
    80004676:	60e2                	ld	ra,24(sp)
    80004678:	6442                	ld	s0,16(sp)
    8000467a:	64a2                	ld	s1,8(sp)
    8000467c:	6105                	addi	sp,sp,32
    8000467e:	8082                	ret

0000000080004680 <filedup>:
    80004680:	1101                	addi	sp,sp,-32
    80004682:	ec06                	sd	ra,24(sp)
    80004684:	e822                	sd	s0,16(sp)
    80004686:	e426                	sd	s1,8(sp)
    80004688:	1000                	addi	s0,sp,32
    8000468a:	84aa                	mv	s1,a0
    8000468c:	0001d517          	auipc	a0,0x1d
    80004690:	52c50513          	addi	a0,a0,1324 # 80021bb8 <ftable>
    80004694:	ffffc097          	auipc	ra,0xffffc
    80004698:	550080e7          	jalr	1360(ra) # 80000be4 <acquire>
    8000469c:	40dc                	lw	a5,4(s1)
    8000469e:	02f05263          	blez	a5,800046c2 <filedup+0x42>
    800046a2:	2785                	addiw	a5,a5,1
    800046a4:	c0dc                	sw	a5,4(s1)
    800046a6:	0001d517          	auipc	a0,0x1d
    800046aa:	51250513          	addi	a0,a0,1298 # 80021bb8 <ftable>
    800046ae:	ffffc097          	auipc	ra,0xffffc
    800046b2:	5ea080e7          	jalr	1514(ra) # 80000c98 <release>
    800046b6:	8526                	mv	a0,s1
    800046b8:	60e2                	ld	ra,24(sp)
    800046ba:	6442                	ld	s0,16(sp)
    800046bc:	64a2                	ld	s1,8(sp)
    800046be:	6105                	addi	sp,sp,32
    800046c0:	8082                	ret
    800046c2:	00004517          	auipc	a0,0x4
    800046c6:	08e50513          	addi	a0,a0,142 # 80008750 <syscalls+0x250>
    800046ca:	ffffc097          	auipc	ra,0xffffc
    800046ce:	e74080e7          	jalr	-396(ra) # 8000053e <panic>

00000000800046d2 <fileclose>:
    800046d2:	7139                	addi	sp,sp,-64
    800046d4:	fc06                	sd	ra,56(sp)
    800046d6:	f822                	sd	s0,48(sp)
    800046d8:	f426                	sd	s1,40(sp)
    800046da:	f04a                	sd	s2,32(sp)
    800046dc:	ec4e                	sd	s3,24(sp)
    800046de:	e852                	sd	s4,16(sp)
    800046e0:	e456                	sd	s5,8(sp)
    800046e2:	0080                	addi	s0,sp,64
    800046e4:	84aa                	mv	s1,a0
    800046e6:	0001d517          	auipc	a0,0x1d
    800046ea:	4d250513          	addi	a0,a0,1234 # 80021bb8 <ftable>
    800046ee:	ffffc097          	auipc	ra,0xffffc
    800046f2:	4f6080e7          	jalr	1270(ra) # 80000be4 <acquire>
    800046f6:	40dc                	lw	a5,4(s1)
    800046f8:	06f05163          	blez	a5,8000475a <fileclose+0x88>
    800046fc:	37fd                	addiw	a5,a5,-1
    800046fe:	0007871b          	sext.w	a4,a5
    80004702:	c0dc                	sw	a5,4(s1)
    80004704:	06e04363          	bgtz	a4,8000476a <fileclose+0x98>
    80004708:	0004a903          	lw	s2,0(s1)
    8000470c:	0094ca83          	lbu	s5,9(s1)
    80004710:	0104ba03          	ld	s4,16(s1)
    80004714:	0184b983          	ld	s3,24(s1)
    80004718:	0004a223          	sw	zero,4(s1)
    8000471c:	0004a023          	sw	zero,0(s1)
    80004720:	0001d517          	auipc	a0,0x1d
    80004724:	49850513          	addi	a0,a0,1176 # 80021bb8 <ftable>
    80004728:	ffffc097          	auipc	ra,0xffffc
    8000472c:	570080e7          	jalr	1392(ra) # 80000c98 <release>
    80004730:	4785                	li	a5,1
    80004732:	04f90d63          	beq	s2,a5,8000478c <fileclose+0xba>
    80004736:	3979                	addiw	s2,s2,-2
    80004738:	4785                	li	a5,1
    8000473a:	0527e063          	bltu	a5,s2,8000477a <fileclose+0xa8>
    8000473e:	00000097          	auipc	ra,0x0
    80004742:	ac8080e7          	jalr	-1336(ra) # 80004206 <begin_op>
    80004746:	854e                	mv	a0,s3
    80004748:	fffff097          	auipc	ra,0xfffff
    8000474c:	2a6080e7          	jalr	678(ra) # 800039ee <iput>
    80004750:	00000097          	auipc	ra,0x0
    80004754:	b36080e7          	jalr	-1226(ra) # 80004286 <end_op>
    80004758:	a00d                	j	8000477a <fileclose+0xa8>
    8000475a:	00004517          	auipc	a0,0x4
    8000475e:	ffe50513          	addi	a0,a0,-2 # 80008758 <syscalls+0x258>
    80004762:	ffffc097          	auipc	ra,0xffffc
    80004766:	ddc080e7          	jalr	-548(ra) # 8000053e <panic>
    8000476a:	0001d517          	auipc	a0,0x1d
    8000476e:	44e50513          	addi	a0,a0,1102 # 80021bb8 <ftable>
    80004772:	ffffc097          	auipc	ra,0xffffc
    80004776:	526080e7          	jalr	1318(ra) # 80000c98 <release>
    8000477a:	70e2                	ld	ra,56(sp)
    8000477c:	7442                	ld	s0,48(sp)
    8000477e:	74a2                	ld	s1,40(sp)
    80004780:	7902                	ld	s2,32(sp)
    80004782:	69e2                	ld	s3,24(sp)
    80004784:	6a42                	ld	s4,16(sp)
    80004786:	6aa2                	ld	s5,8(sp)
    80004788:	6121                	addi	sp,sp,64
    8000478a:	8082                	ret
    8000478c:	85d6                	mv	a1,s5
    8000478e:	8552                	mv	a0,s4
    80004790:	00000097          	auipc	ra,0x0
    80004794:	34c080e7          	jalr	844(ra) # 80004adc <pipeclose>
    80004798:	b7cd                	j	8000477a <fileclose+0xa8>

000000008000479a <filestat>:
    8000479a:	715d                	addi	sp,sp,-80
    8000479c:	e486                	sd	ra,72(sp)
    8000479e:	e0a2                	sd	s0,64(sp)
    800047a0:	fc26                	sd	s1,56(sp)
    800047a2:	f84a                	sd	s2,48(sp)
    800047a4:	f44e                	sd	s3,40(sp)
    800047a6:	0880                	addi	s0,sp,80
    800047a8:	84aa                	mv	s1,a0
    800047aa:	89ae                	mv	s3,a1
    800047ac:	ffffd097          	auipc	ra,0xffffd
    800047b0:	204080e7          	jalr	516(ra) # 800019b0 <myproc>
    800047b4:	409c                	lw	a5,0(s1)
    800047b6:	37f9                	addiw	a5,a5,-2
    800047b8:	4705                	li	a4,1
    800047ba:	04f76763          	bltu	a4,a5,80004808 <filestat+0x6e>
    800047be:	892a                	mv	s2,a0
    800047c0:	6c88                	ld	a0,24(s1)
    800047c2:	fffff097          	auipc	ra,0xfffff
    800047c6:	072080e7          	jalr	114(ra) # 80003834 <ilock>
    800047ca:	fb840593          	addi	a1,s0,-72
    800047ce:	6c88                	ld	a0,24(s1)
    800047d0:	fffff097          	auipc	ra,0xfffff
    800047d4:	2ee080e7          	jalr	750(ra) # 80003abe <stati>
    800047d8:	6c88                	ld	a0,24(s1)
    800047da:	fffff097          	auipc	ra,0xfffff
    800047de:	11c080e7          	jalr	284(ra) # 800038f6 <iunlock>
    800047e2:	46e1                	li	a3,24
    800047e4:	fb840613          	addi	a2,s0,-72
    800047e8:	85ce                	mv	a1,s3
    800047ea:	05093503          	ld	a0,80(s2)
    800047ee:	ffffd097          	auipc	ra,0xffffd
    800047f2:	e84080e7          	jalr	-380(ra) # 80001672 <copyout>
    800047f6:	41f5551b          	sraiw	a0,a0,0x1f
    800047fa:	60a6                	ld	ra,72(sp)
    800047fc:	6406                	ld	s0,64(sp)
    800047fe:	74e2                	ld	s1,56(sp)
    80004800:	7942                	ld	s2,48(sp)
    80004802:	79a2                	ld	s3,40(sp)
    80004804:	6161                	addi	sp,sp,80
    80004806:	8082                	ret
    80004808:	557d                	li	a0,-1
    8000480a:	bfc5                	j	800047fa <filestat+0x60>

000000008000480c <fileread>:
    8000480c:	7179                	addi	sp,sp,-48
    8000480e:	f406                	sd	ra,40(sp)
    80004810:	f022                	sd	s0,32(sp)
    80004812:	ec26                	sd	s1,24(sp)
    80004814:	e84a                	sd	s2,16(sp)
    80004816:	e44e                	sd	s3,8(sp)
    80004818:	1800                	addi	s0,sp,48
    8000481a:	00854783          	lbu	a5,8(a0)
    8000481e:	c3d5                	beqz	a5,800048c2 <fileread+0xb6>
    80004820:	84aa                	mv	s1,a0
    80004822:	89ae                	mv	s3,a1
    80004824:	8932                	mv	s2,a2
    80004826:	411c                	lw	a5,0(a0)
    80004828:	4705                	li	a4,1
    8000482a:	04e78963          	beq	a5,a4,8000487c <fileread+0x70>
    8000482e:	470d                	li	a4,3
    80004830:	04e78d63          	beq	a5,a4,8000488a <fileread+0x7e>
    80004834:	4709                	li	a4,2
    80004836:	06e79e63          	bne	a5,a4,800048b2 <fileread+0xa6>
    8000483a:	6d08                	ld	a0,24(a0)
    8000483c:	fffff097          	auipc	ra,0xfffff
    80004840:	ff8080e7          	jalr	-8(ra) # 80003834 <ilock>
    80004844:	874a                	mv	a4,s2
    80004846:	5094                	lw	a3,32(s1)
    80004848:	864e                	mv	a2,s3
    8000484a:	4585                	li	a1,1
    8000484c:	6c88                	ld	a0,24(s1)
    8000484e:	fffff097          	auipc	ra,0xfffff
    80004852:	29a080e7          	jalr	666(ra) # 80003ae8 <readi>
    80004856:	892a                	mv	s2,a0
    80004858:	00a05563          	blez	a0,80004862 <fileread+0x56>
    8000485c:	509c                	lw	a5,32(s1)
    8000485e:	9fa9                	addw	a5,a5,a0
    80004860:	d09c                	sw	a5,32(s1)
    80004862:	6c88                	ld	a0,24(s1)
    80004864:	fffff097          	auipc	ra,0xfffff
    80004868:	092080e7          	jalr	146(ra) # 800038f6 <iunlock>
    8000486c:	854a                	mv	a0,s2
    8000486e:	70a2                	ld	ra,40(sp)
    80004870:	7402                	ld	s0,32(sp)
    80004872:	64e2                	ld	s1,24(sp)
    80004874:	6942                	ld	s2,16(sp)
    80004876:	69a2                	ld	s3,8(sp)
    80004878:	6145                	addi	sp,sp,48
    8000487a:	8082                	ret
    8000487c:	6908                	ld	a0,16(a0)
    8000487e:	00000097          	auipc	ra,0x0
    80004882:	3c8080e7          	jalr	968(ra) # 80004c46 <piperead>
    80004886:	892a                	mv	s2,a0
    80004888:	b7d5                	j	8000486c <fileread+0x60>
    8000488a:	02451783          	lh	a5,36(a0)
    8000488e:	03079693          	slli	a3,a5,0x30
    80004892:	92c1                	srli	a3,a3,0x30
    80004894:	4725                	li	a4,9
    80004896:	02d76863          	bltu	a4,a3,800048c6 <fileread+0xba>
    8000489a:	0792                	slli	a5,a5,0x4
    8000489c:	0001d717          	auipc	a4,0x1d
    800048a0:	27c70713          	addi	a4,a4,636 # 80021b18 <devsw>
    800048a4:	97ba                	add	a5,a5,a4
    800048a6:	639c                	ld	a5,0(a5)
    800048a8:	c38d                	beqz	a5,800048ca <fileread+0xbe>
    800048aa:	4505                	li	a0,1
    800048ac:	9782                	jalr	a5
    800048ae:	892a                	mv	s2,a0
    800048b0:	bf75                	j	8000486c <fileread+0x60>
    800048b2:	00004517          	auipc	a0,0x4
    800048b6:	eb650513          	addi	a0,a0,-330 # 80008768 <syscalls+0x268>
    800048ba:	ffffc097          	auipc	ra,0xffffc
    800048be:	c84080e7          	jalr	-892(ra) # 8000053e <panic>
    800048c2:	597d                	li	s2,-1
    800048c4:	b765                	j	8000486c <fileread+0x60>
    800048c6:	597d                	li	s2,-1
    800048c8:	b755                	j	8000486c <fileread+0x60>
    800048ca:	597d                	li	s2,-1
    800048cc:	b745                	j	8000486c <fileread+0x60>

00000000800048ce <filewrite>:
    800048ce:	715d                	addi	sp,sp,-80
    800048d0:	e486                	sd	ra,72(sp)
    800048d2:	e0a2                	sd	s0,64(sp)
    800048d4:	fc26                	sd	s1,56(sp)
    800048d6:	f84a                	sd	s2,48(sp)
    800048d8:	f44e                	sd	s3,40(sp)
    800048da:	f052                	sd	s4,32(sp)
    800048dc:	ec56                	sd	s5,24(sp)
    800048de:	e85a                	sd	s6,16(sp)
    800048e0:	e45e                	sd	s7,8(sp)
    800048e2:	e062                	sd	s8,0(sp)
    800048e4:	0880                	addi	s0,sp,80
    800048e6:	00954783          	lbu	a5,9(a0)
    800048ea:	10078663          	beqz	a5,800049f6 <filewrite+0x128>
    800048ee:	892a                	mv	s2,a0
    800048f0:	8aae                	mv	s5,a1
    800048f2:	8a32                	mv	s4,a2
    800048f4:	411c                	lw	a5,0(a0)
    800048f6:	4705                	li	a4,1
    800048f8:	02e78263          	beq	a5,a4,8000491c <filewrite+0x4e>
    800048fc:	470d                	li	a4,3
    800048fe:	02e78663          	beq	a5,a4,8000492a <filewrite+0x5c>
    80004902:	4709                	li	a4,2
    80004904:	0ee79163          	bne	a5,a4,800049e6 <filewrite+0x118>
    80004908:	0ac05d63          	blez	a2,800049c2 <filewrite+0xf4>
    8000490c:	4981                	li	s3,0
    8000490e:	6b05                	lui	s6,0x1
    80004910:	c00b0b13          	addi	s6,s6,-1024 # c00 <_entry-0x7ffff400>
    80004914:	6b85                	lui	s7,0x1
    80004916:	c00b8b9b          	addiw	s7,s7,-1024
    8000491a:	a861                	j	800049b2 <filewrite+0xe4>
    8000491c:	6908                	ld	a0,16(a0)
    8000491e:	00000097          	auipc	ra,0x0
    80004922:	22e080e7          	jalr	558(ra) # 80004b4c <pipewrite>
    80004926:	8a2a                	mv	s4,a0
    80004928:	a045                	j	800049c8 <filewrite+0xfa>
    8000492a:	02451783          	lh	a5,36(a0)
    8000492e:	03079693          	slli	a3,a5,0x30
    80004932:	92c1                	srli	a3,a3,0x30
    80004934:	4725                	li	a4,9
    80004936:	0cd76263          	bltu	a4,a3,800049fa <filewrite+0x12c>
    8000493a:	0792                	slli	a5,a5,0x4
    8000493c:	0001d717          	auipc	a4,0x1d
    80004940:	1dc70713          	addi	a4,a4,476 # 80021b18 <devsw>
    80004944:	97ba                	add	a5,a5,a4
    80004946:	679c                	ld	a5,8(a5)
    80004948:	cbdd                	beqz	a5,800049fe <filewrite+0x130>
    8000494a:	4505                	li	a0,1
    8000494c:	9782                	jalr	a5
    8000494e:	8a2a                	mv	s4,a0
    80004950:	a8a5                	j	800049c8 <filewrite+0xfa>
    80004952:	00048c1b          	sext.w	s8,s1
    80004956:	00000097          	auipc	ra,0x0
    8000495a:	8b0080e7          	jalr	-1872(ra) # 80004206 <begin_op>
    8000495e:	01893503          	ld	a0,24(s2)
    80004962:	fffff097          	auipc	ra,0xfffff
    80004966:	ed2080e7          	jalr	-302(ra) # 80003834 <ilock>
    8000496a:	8762                	mv	a4,s8
    8000496c:	02092683          	lw	a3,32(s2)
    80004970:	01598633          	add	a2,s3,s5
    80004974:	4585                	li	a1,1
    80004976:	01893503          	ld	a0,24(s2)
    8000497a:	fffff097          	auipc	ra,0xfffff
    8000497e:	266080e7          	jalr	614(ra) # 80003be0 <writei>
    80004982:	84aa                	mv	s1,a0
    80004984:	00a05763          	blez	a0,80004992 <filewrite+0xc4>
    80004988:	02092783          	lw	a5,32(s2)
    8000498c:	9fa9                	addw	a5,a5,a0
    8000498e:	02f92023          	sw	a5,32(s2)
    80004992:	01893503          	ld	a0,24(s2)
    80004996:	fffff097          	auipc	ra,0xfffff
    8000499a:	f60080e7          	jalr	-160(ra) # 800038f6 <iunlock>
    8000499e:	00000097          	auipc	ra,0x0
    800049a2:	8e8080e7          	jalr	-1816(ra) # 80004286 <end_op>
    800049a6:	009c1f63          	bne	s8,s1,800049c4 <filewrite+0xf6>
    800049aa:	013489bb          	addw	s3,s1,s3
    800049ae:	0149db63          	bge	s3,s4,800049c4 <filewrite+0xf6>
    800049b2:	413a07bb          	subw	a5,s4,s3
    800049b6:	84be                	mv	s1,a5
    800049b8:	2781                	sext.w	a5,a5
    800049ba:	f8fb5ce3          	bge	s6,a5,80004952 <filewrite+0x84>
    800049be:	84de                	mv	s1,s7
    800049c0:	bf49                	j	80004952 <filewrite+0x84>
    800049c2:	4981                	li	s3,0
    800049c4:	013a1f63          	bne	s4,s3,800049e2 <filewrite+0x114>
    800049c8:	8552                	mv	a0,s4
    800049ca:	60a6                	ld	ra,72(sp)
    800049cc:	6406                	ld	s0,64(sp)
    800049ce:	74e2                	ld	s1,56(sp)
    800049d0:	7942                	ld	s2,48(sp)
    800049d2:	79a2                	ld	s3,40(sp)
    800049d4:	7a02                	ld	s4,32(sp)
    800049d6:	6ae2                	ld	s5,24(sp)
    800049d8:	6b42                	ld	s6,16(sp)
    800049da:	6ba2                	ld	s7,8(sp)
    800049dc:	6c02                	ld	s8,0(sp)
    800049de:	6161                	addi	sp,sp,80
    800049e0:	8082                	ret
    800049e2:	5a7d                	li	s4,-1
    800049e4:	b7d5                	j	800049c8 <filewrite+0xfa>
    800049e6:	00004517          	auipc	a0,0x4
    800049ea:	d9250513          	addi	a0,a0,-622 # 80008778 <syscalls+0x278>
    800049ee:	ffffc097          	auipc	ra,0xffffc
    800049f2:	b50080e7          	jalr	-1200(ra) # 8000053e <panic>
    800049f6:	5a7d                	li	s4,-1
    800049f8:	bfc1                	j	800049c8 <filewrite+0xfa>
    800049fa:	5a7d                	li	s4,-1
    800049fc:	b7f1                	j	800049c8 <filewrite+0xfa>
    800049fe:	5a7d                	li	s4,-1
    80004a00:	b7e1                	j	800049c8 <filewrite+0xfa>

0000000080004a02 <pipealloc>:
    80004a02:	7179                	addi	sp,sp,-48
    80004a04:	f406                	sd	ra,40(sp)
    80004a06:	f022                	sd	s0,32(sp)
    80004a08:	ec26                	sd	s1,24(sp)
    80004a0a:	e84a                	sd	s2,16(sp)
    80004a0c:	e44e                	sd	s3,8(sp)
    80004a0e:	e052                	sd	s4,0(sp)
    80004a10:	1800                	addi	s0,sp,48
    80004a12:	84aa                	mv	s1,a0
    80004a14:	8a2e                	mv	s4,a1
    80004a16:	0005b023          	sd	zero,0(a1)
    80004a1a:	00053023          	sd	zero,0(a0)
    80004a1e:	00000097          	auipc	ra,0x0
    80004a22:	bf8080e7          	jalr	-1032(ra) # 80004616 <filealloc>
    80004a26:	e088                	sd	a0,0(s1)
    80004a28:	c551                	beqz	a0,80004ab4 <pipealloc+0xb2>
    80004a2a:	00000097          	auipc	ra,0x0
    80004a2e:	bec080e7          	jalr	-1044(ra) # 80004616 <filealloc>
    80004a32:	00aa3023          	sd	a0,0(s4)
    80004a36:	c92d                	beqz	a0,80004aa8 <pipealloc+0xa6>
    80004a38:	ffffc097          	auipc	ra,0xffffc
    80004a3c:	0bc080e7          	jalr	188(ra) # 80000af4 <kalloc>
    80004a40:	892a                	mv	s2,a0
    80004a42:	c125                	beqz	a0,80004aa2 <pipealloc+0xa0>
    80004a44:	4985                	li	s3,1
    80004a46:	23352023          	sw	s3,544(a0)
    80004a4a:	23352223          	sw	s3,548(a0)
    80004a4e:	20052e23          	sw	zero,540(a0)
    80004a52:	20052c23          	sw	zero,536(a0)
    80004a56:	00004597          	auipc	a1,0x4
    80004a5a:	9ea58593          	addi	a1,a1,-1558 # 80008440 <states.1744+0x180>
    80004a5e:	ffffc097          	auipc	ra,0xffffc
    80004a62:	0f6080e7          	jalr	246(ra) # 80000b54 <initlock>
    80004a66:	609c                	ld	a5,0(s1)
    80004a68:	0137a023          	sw	s3,0(a5)
    80004a6c:	609c                	ld	a5,0(s1)
    80004a6e:	01378423          	sb	s3,8(a5)
    80004a72:	609c                	ld	a5,0(s1)
    80004a74:	000784a3          	sb	zero,9(a5)
    80004a78:	609c                	ld	a5,0(s1)
    80004a7a:	0127b823          	sd	s2,16(a5)
    80004a7e:	000a3783          	ld	a5,0(s4)
    80004a82:	0137a023          	sw	s3,0(a5)
    80004a86:	000a3783          	ld	a5,0(s4)
    80004a8a:	00078423          	sb	zero,8(a5)
    80004a8e:	000a3783          	ld	a5,0(s4)
    80004a92:	013784a3          	sb	s3,9(a5)
    80004a96:	000a3783          	ld	a5,0(s4)
    80004a9a:	0127b823          	sd	s2,16(a5)
    80004a9e:	4501                	li	a0,0
    80004aa0:	a025                	j	80004ac8 <pipealloc+0xc6>
    80004aa2:	6088                	ld	a0,0(s1)
    80004aa4:	e501                	bnez	a0,80004aac <pipealloc+0xaa>
    80004aa6:	a039                	j	80004ab4 <pipealloc+0xb2>
    80004aa8:	6088                	ld	a0,0(s1)
    80004aaa:	c51d                	beqz	a0,80004ad8 <pipealloc+0xd6>
    80004aac:	00000097          	auipc	ra,0x0
    80004ab0:	c26080e7          	jalr	-986(ra) # 800046d2 <fileclose>
    80004ab4:	000a3783          	ld	a5,0(s4)
    80004ab8:	557d                	li	a0,-1
    80004aba:	c799                	beqz	a5,80004ac8 <pipealloc+0xc6>
    80004abc:	853e                	mv	a0,a5
    80004abe:	00000097          	auipc	ra,0x0
    80004ac2:	c14080e7          	jalr	-1004(ra) # 800046d2 <fileclose>
    80004ac6:	557d                	li	a0,-1
    80004ac8:	70a2                	ld	ra,40(sp)
    80004aca:	7402                	ld	s0,32(sp)
    80004acc:	64e2                	ld	s1,24(sp)
    80004ace:	6942                	ld	s2,16(sp)
    80004ad0:	69a2                	ld	s3,8(sp)
    80004ad2:	6a02                	ld	s4,0(sp)
    80004ad4:	6145                	addi	sp,sp,48
    80004ad6:	8082                	ret
    80004ad8:	557d                	li	a0,-1
    80004ada:	b7fd                	j	80004ac8 <pipealloc+0xc6>

0000000080004adc <pipeclose>:
    80004adc:	1101                	addi	sp,sp,-32
    80004ade:	ec06                	sd	ra,24(sp)
    80004ae0:	e822                	sd	s0,16(sp)
    80004ae2:	e426                	sd	s1,8(sp)
    80004ae4:	e04a                	sd	s2,0(sp)
    80004ae6:	1000                	addi	s0,sp,32
    80004ae8:	84aa                	mv	s1,a0
    80004aea:	892e                	mv	s2,a1
    80004aec:	ffffc097          	auipc	ra,0xffffc
    80004af0:	0f8080e7          	jalr	248(ra) # 80000be4 <acquire>
    80004af4:	02090d63          	beqz	s2,80004b2e <pipeclose+0x52>
    80004af8:	2204a223          	sw	zero,548(s1)
    80004afc:	21848513          	addi	a0,s1,536
    80004b00:	ffffe097          	auipc	ra,0xffffe
    80004b04:	89c080e7          	jalr	-1892(ra) # 8000239c <wakeup>
    80004b08:	2204b783          	ld	a5,544(s1)
    80004b0c:	eb95                	bnez	a5,80004b40 <pipeclose+0x64>
    80004b0e:	8526                	mv	a0,s1
    80004b10:	ffffc097          	auipc	ra,0xffffc
    80004b14:	188080e7          	jalr	392(ra) # 80000c98 <release>
    80004b18:	8526                	mv	a0,s1
    80004b1a:	ffffc097          	auipc	ra,0xffffc
    80004b1e:	ede080e7          	jalr	-290(ra) # 800009f8 <kfree>
    80004b22:	60e2                	ld	ra,24(sp)
    80004b24:	6442                	ld	s0,16(sp)
    80004b26:	64a2                	ld	s1,8(sp)
    80004b28:	6902                	ld	s2,0(sp)
    80004b2a:	6105                	addi	sp,sp,32
    80004b2c:	8082                	ret
    80004b2e:	2204a023          	sw	zero,544(s1)
    80004b32:	21c48513          	addi	a0,s1,540
    80004b36:	ffffe097          	auipc	ra,0xffffe
    80004b3a:	866080e7          	jalr	-1946(ra) # 8000239c <wakeup>
    80004b3e:	b7e9                	j	80004b08 <pipeclose+0x2c>
    80004b40:	8526                	mv	a0,s1
    80004b42:	ffffc097          	auipc	ra,0xffffc
    80004b46:	156080e7          	jalr	342(ra) # 80000c98 <release>
    80004b4a:	bfe1                	j	80004b22 <pipeclose+0x46>

0000000080004b4c <pipewrite>:
    80004b4c:	7159                	addi	sp,sp,-112
    80004b4e:	f486                	sd	ra,104(sp)
    80004b50:	f0a2                	sd	s0,96(sp)
    80004b52:	eca6                	sd	s1,88(sp)
    80004b54:	e8ca                	sd	s2,80(sp)
    80004b56:	e4ce                	sd	s3,72(sp)
    80004b58:	e0d2                	sd	s4,64(sp)
    80004b5a:	fc56                	sd	s5,56(sp)
    80004b5c:	f85a                	sd	s6,48(sp)
    80004b5e:	f45e                	sd	s7,40(sp)
    80004b60:	f062                	sd	s8,32(sp)
    80004b62:	ec66                	sd	s9,24(sp)
    80004b64:	1880                	addi	s0,sp,112
    80004b66:	84aa                	mv	s1,a0
    80004b68:	8aae                	mv	s5,a1
    80004b6a:	8a32                	mv	s4,a2
    80004b6c:	ffffd097          	auipc	ra,0xffffd
    80004b70:	e44080e7          	jalr	-444(ra) # 800019b0 <myproc>
    80004b74:	89aa                	mv	s3,a0
    80004b76:	8526                	mv	a0,s1
    80004b78:	ffffc097          	auipc	ra,0xffffc
    80004b7c:	06c080e7          	jalr	108(ra) # 80000be4 <acquire>
    80004b80:	0d405163          	blez	s4,80004c42 <pipewrite+0xf6>
    80004b84:	8ba6                	mv	s7,s1
    80004b86:	4901                	li	s2,0
    80004b88:	5b7d                	li	s6,-1
    80004b8a:	21848c93          	addi	s9,s1,536
    80004b8e:	21c48c13          	addi	s8,s1,540
    80004b92:	a08d                	j	80004bf4 <pipewrite+0xa8>
    80004b94:	8526                	mv	a0,s1
    80004b96:	ffffc097          	auipc	ra,0xffffc
    80004b9a:	102080e7          	jalr	258(ra) # 80000c98 <release>
    80004b9e:	597d                	li	s2,-1
    80004ba0:	854a                	mv	a0,s2
    80004ba2:	70a6                	ld	ra,104(sp)
    80004ba4:	7406                	ld	s0,96(sp)
    80004ba6:	64e6                	ld	s1,88(sp)
    80004ba8:	6946                	ld	s2,80(sp)
    80004baa:	69a6                	ld	s3,72(sp)
    80004bac:	6a06                	ld	s4,64(sp)
    80004bae:	7ae2                	ld	s5,56(sp)
    80004bb0:	7b42                	ld	s6,48(sp)
    80004bb2:	7ba2                	ld	s7,40(sp)
    80004bb4:	7c02                	ld	s8,32(sp)
    80004bb6:	6ce2                	ld	s9,24(sp)
    80004bb8:	6165                	addi	sp,sp,112
    80004bba:	8082                	ret
    80004bbc:	8566                	mv	a0,s9
    80004bbe:	ffffd097          	auipc	ra,0xffffd
    80004bc2:	7de080e7          	jalr	2014(ra) # 8000239c <wakeup>
    80004bc6:	85de                	mv	a1,s7
    80004bc8:	8562                	mv	a0,s8
    80004bca:	ffffd097          	auipc	ra,0xffffd
    80004bce:	646080e7          	jalr	1606(ra) # 80002210 <sleep>
    80004bd2:	a839                	j	80004bf0 <pipewrite+0xa4>
    80004bd4:	21c4a783          	lw	a5,540(s1)
    80004bd8:	0017871b          	addiw	a4,a5,1
    80004bdc:	20e4ae23          	sw	a4,540(s1)
    80004be0:	1ff7f793          	andi	a5,a5,511
    80004be4:	97a6                	add	a5,a5,s1
    80004be6:	f9f44703          	lbu	a4,-97(s0)
    80004bea:	00e78c23          	sb	a4,24(a5)
    80004bee:	2905                	addiw	s2,s2,1
    80004bf0:	03495d63          	bge	s2,s4,80004c2a <pipewrite+0xde>
    80004bf4:	2204a783          	lw	a5,544(s1)
    80004bf8:	dfd1                	beqz	a5,80004b94 <pipewrite+0x48>
    80004bfa:	0289a783          	lw	a5,40(s3)
    80004bfe:	fbd9                	bnez	a5,80004b94 <pipewrite+0x48>
    80004c00:	2184a783          	lw	a5,536(s1)
    80004c04:	21c4a703          	lw	a4,540(s1)
    80004c08:	2007879b          	addiw	a5,a5,512
    80004c0c:	faf708e3          	beq	a4,a5,80004bbc <pipewrite+0x70>
    80004c10:	4685                	li	a3,1
    80004c12:	01590633          	add	a2,s2,s5
    80004c16:	f9f40593          	addi	a1,s0,-97
    80004c1a:	0509b503          	ld	a0,80(s3)
    80004c1e:	ffffd097          	auipc	ra,0xffffd
    80004c22:	ae0080e7          	jalr	-1312(ra) # 800016fe <copyin>
    80004c26:	fb6517e3          	bne	a0,s6,80004bd4 <pipewrite+0x88>
    80004c2a:	21848513          	addi	a0,s1,536
    80004c2e:	ffffd097          	auipc	ra,0xffffd
    80004c32:	76e080e7          	jalr	1902(ra) # 8000239c <wakeup>
    80004c36:	8526                	mv	a0,s1
    80004c38:	ffffc097          	auipc	ra,0xffffc
    80004c3c:	060080e7          	jalr	96(ra) # 80000c98 <release>
    80004c40:	b785                	j	80004ba0 <pipewrite+0x54>
    80004c42:	4901                	li	s2,0
    80004c44:	b7dd                	j	80004c2a <pipewrite+0xde>

0000000080004c46 <piperead>:
    80004c46:	715d                	addi	sp,sp,-80
    80004c48:	e486                	sd	ra,72(sp)
    80004c4a:	e0a2                	sd	s0,64(sp)
    80004c4c:	fc26                	sd	s1,56(sp)
    80004c4e:	f84a                	sd	s2,48(sp)
    80004c50:	f44e                	sd	s3,40(sp)
    80004c52:	f052                	sd	s4,32(sp)
    80004c54:	ec56                	sd	s5,24(sp)
    80004c56:	e85a                	sd	s6,16(sp)
    80004c58:	0880                	addi	s0,sp,80
    80004c5a:	84aa                	mv	s1,a0
    80004c5c:	892e                	mv	s2,a1
    80004c5e:	8ab2                	mv	s5,a2
    80004c60:	ffffd097          	auipc	ra,0xffffd
    80004c64:	d50080e7          	jalr	-688(ra) # 800019b0 <myproc>
    80004c68:	8a2a                	mv	s4,a0
    80004c6a:	8b26                	mv	s6,s1
    80004c6c:	8526                	mv	a0,s1
    80004c6e:	ffffc097          	auipc	ra,0xffffc
    80004c72:	f76080e7          	jalr	-138(ra) # 80000be4 <acquire>
    80004c76:	2184a703          	lw	a4,536(s1)
    80004c7a:	21c4a783          	lw	a5,540(s1)
    80004c7e:	21848993          	addi	s3,s1,536
    80004c82:	02f71463          	bne	a4,a5,80004caa <piperead+0x64>
    80004c86:	2244a783          	lw	a5,548(s1)
    80004c8a:	c385                	beqz	a5,80004caa <piperead+0x64>
    80004c8c:	028a2783          	lw	a5,40(s4)
    80004c90:	ebc1                	bnez	a5,80004d20 <piperead+0xda>
    80004c92:	85da                	mv	a1,s6
    80004c94:	854e                	mv	a0,s3
    80004c96:	ffffd097          	auipc	ra,0xffffd
    80004c9a:	57a080e7          	jalr	1402(ra) # 80002210 <sleep>
    80004c9e:	2184a703          	lw	a4,536(s1)
    80004ca2:	21c4a783          	lw	a5,540(s1)
    80004ca6:	fef700e3          	beq	a4,a5,80004c86 <piperead+0x40>
    80004caa:	09505263          	blez	s5,80004d2e <piperead+0xe8>
    80004cae:	4981                	li	s3,0
    80004cb0:	5b7d                	li	s6,-1
    80004cb2:	2184a783          	lw	a5,536(s1)
    80004cb6:	21c4a703          	lw	a4,540(s1)
    80004cba:	02f70d63          	beq	a4,a5,80004cf4 <piperead+0xae>
    80004cbe:	0017871b          	addiw	a4,a5,1
    80004cc2:	20e4ac23          	sw	a4,536(s1)
    80004cc6:	1ff7f793          	andi	a5,a5,511
    80004cca:	97a6                	add	a5,a5,s1
    80004ccc:	0187c783          	lbu	a5,24(a5)
    80004cd0:	faf40fa3          	sb	a5,-65(s0)
    80004cd4:	4685                	li	a3,1
    80004cd6:	fbf40613          	addi	a2,s0,-65
    80004cda:	85ca                	mv	a1,s2
    80004cdc:	050a3503          	ld	a0,80(s4)
    80004ce0:	ffffd097          	auipc	ra,0xffffd
    80004ce4:	992080e7          	jalr	-1646(ra) # 80001672 <copyout>
    80004ce8:	01650663          	beq	a0,s6,80004cf4 <piperead+0xae>
    80004cec:	2985                	addiw	s3,s3,1
    80004cee:	0905                	addi	s2,s2,1
    80004cf0:	fd3a91e3          	bne	s5,s3,80004cb2 <piperead+0x6c>
    80004cf4:	21c48513          	addi	a0,s1,540
    80004cf8:	ffffd097          	auipc	ra,0xffffd
    80004cfc:	6a4080e7          	jalr	1700(ra) # 8000239c <wakeup>
    80004d00:	8526                	mv	a0,s1
    80004d02:	ffffc097          	auipc	ra,0xffffc
    80004d06:	f96080e7          	jalr	-106(ra) # 80000c98 <release>
    80004d0a:	854e                	mv	a0,s3
    80004d0c:	60a6                	ld	ra,72(sp)
    80004d0e:	6406                	ld	s0,64(sp)
    80004d10:	74e2                	ld	s1,56(sp)
    80004d12:	7942                	ld	s2,48(sp)
    80004d14:	79a2                	ld	s3,40(sp)
    80004d16:	7a02                	ld	s4,32(sp)
    80004d18:	6ae2                	ld	s5,24(sp)
    80004d1a:	6b42                	ld	s6,16(sp)
    80004d1c:	6161                	addi	sp,sp,80
    80004d1e:	8082                	ret
    80004d20:	8526                	mv	a0,s1
    80004d22:	ffffc097          	auipc	ra,0xffffc
    80004d26:	f76080e7          	jalr	-138(ra) # 80000c98 <release>
    80004d2a:	59fd                	li	s3,-1
    80004d2c:	bff9                	j	80004d0a <piperead+0xc4>
    80004d2e:	4981                	li	s3,0
    80004d30:	b7d1                	j	80004cf4 <piperead+0xae>

0000000080004d32 <exec>:
    80004d32:	df010113          	addi	sp,sp,-528
    80004d36:	20113423          	sd	ra,520(sp)
    80004d3a:	20813023          	sd	s0,512(sp)
    80004d3e:	ffa6                	sd	s1,504(sp)
    80004d40:	fbca                	sd	s2,496(sp)
    80004d42:	f7ce                	sd	s3,488(sp)
    80004d44:	f3d2                	sd	s4,480(sp)
    80004d46:	efd6                	sd	s5,472(sp)
    80004d48:	ebda                	sd	s6,464(sp)
    80004d4a:	e7de                	sd	s7,456(sp)
    80004d4c:	e3e2                	sd	s8,448(sp)
    80004d4e:	ff66                	sd	s9,440(sp)
    80004d50:	fb6a                	sd	s10,432(sp)
    80004d52:	f76e                	sd	s11,424(sp)
    80004d54:	0c00                	addi	s0,sp,528
    80004d56:	84aa                	mv	s1,a0
    80004d58:	dea43c23          	sd	a0,-520(s0)
    80004d5c:	e0b43023          	sd	a1,-512(s0)
    80004d60:	ffffd097          	auipc	ra,0xffffd
    80004d64:	c50080e7          	jalr	-944(ra) # 800019b0 <myproc>
    80004d68:	892a                	mv	s2,a0
    80004d6a:	fffff097          	auipc	ra,0xfffff
    80004d6e:	49c080e7          	jalr	1180(ra) # 80004206 <begin_op>
    80004d72:	8526                	mv	a0,s1
    80004d74:	fffff097          	auipc	ra,0xfffff
    80004d78:	276080e7          	jalr	630(ra) # 80003fea <namei>
    80004d7c:	c92d                	beqz	a0,80004dee <exec+0xbc>
    80004d7e:	84aa                	mv	s1,a0
    80004d80:	fffff097          	auipc	ra,0xfffff
    80004d84:	ab4080e7          	jalr	-1356(ra) # 80003834 <ilock>
    80004d88:	04000713          	li	a4,64
    80004d8c:	4681                	li	a3,0
    80004d8e:	e5040613          	addi	a2,s0,-432
    80004d92:	4581                	li	a1,0
    80004d94:	8526                	mv	a0,s1
    80004d96:	fffff097          	auipc	ra,0xfffff
    80004d9a:	d52080e7          	jalr	-686(ra) # 80003ae8 <readi>
    80004d9e:	04000793          	li	a5,64
    80004da2:	00f51a63          	bne	a0,a5,80004db6 <exec+0x84>
    80004da6:	e5042703          	lw	a4,-432(s0)
    80004daa:	464c47b7          	lui	a5,0x464c4
    80004dae:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    80004db2:	04f70463          	beq	a4,a5,80004dfa <exec+0xc8>
    80004db6:	8526                	mv	a0,s1
    80004db8:	fffff097          	auipc	ra,0xfffff
    80004dbc:	cde080e7          	jalr	-802(ra) # 80003a96 <iunlockput>
    80004dc0:	fffff097          	auipc	ra,0xfffff
    80004dc4:	4c6080e7          	jalr	1222(ra) # 80004286 <end_op>
    80004dc8:	557d                	li	a0,-1
    80004dca:	20813083          	ld	ra,520(sp)
    80004dce:	20013403          	ld	s0,512(sp)
    80004dd2:	74fe                	ld	s1,504(sp)
    80004dd4:	795e                	ld	s2,496(sp)
    80004dd6:	79be                	ld	s3,488(sp)
    80004dd8:	7a1e                	ld	s4,480(sp)
    80004dda:	6afe                	ld	s5,472(sp)
    80004ddc:	6b5e                	ld	s6,464(sp)
    80004dde:	6bbe                	ld	s7,456(sp)
    80004de0:	6c1e                	ld	s8,448(sp)
    80004de2:	7cfa                	ld	s9,440(sp)
    80004de4:	7d5a                	ld	s10,432(sp)
    80004de6:	7dba                	ld	s11,424(sp)
    80004de8:	21010113          	addi	sp,sp,528
    80004dec:	8082                	ret
    80004dee:	fffff097          	auipc	ra,0xfffff
    80004df2:	498080e7          	jalr	1176(ra) # 80004286 <end_op>
    80004df6:	557d                	li	a0,-1
    80004df8:	bfc9                	j	80004dca <exec+0x98>
    80004dfa:	854a                	mv	a0,s2
    80004dfc:	ffffd097          	auipc	ra,0xffffd
    80004e00:	c78080e7          	jalr	-904(ra) # 80001a74 <proc_pagetable>
    80004e04:	8baa                	mv	s7,a0
    80004e06:	d945                	beqz	a0,80004db6 <exec+0x84>
    80004e08:	e7042983          	lw	s3,-400(s0)
    80004e0c:	e8845783          	lhu	a5,-376(s0)
    80004e10:	c7ad                	beqz	a5,80004e7a <exec+0x148>
    80004e12:	4901                	li	s2,0
    80004e14:	4b01                	li	s6,0
    80004e16:	6c85                	lui	s9,0x1
    80004e18:	fffc8793          	addi	a5,s9,-1 # fff <_entry-0x7ffff001>
    80004e1c:	def43823          	sd	a5,-528(s0)
    80004e20:	a42d                	j	8000504a <exec+0x318>
    80004e22:	00004517          	auipc	a0,0x4
    80004e26:	96650513          	addi	a0,a0,-1690 # 80008788 <syscalls+0x288>
    80004e2a:	ffffb097          	auipc	ra,0xffffb
    80004e2e:	714080e7          	jalr	1812(ra) # 8000053e <panic>
    80004e32:	8756                	mv	a4,s5
    80004e34:	012d86bb          	addw	a3,s11,s2
    80004e38:	4581                	li	a1,0
    80004e3a:	8526                	mv	a0,s1
    80004e3c:	fffff097          	auipc	ra,0xfffff
    80004e40:	cac080e7          	jalr	-852(ra) # 80003ae8 <readi>
    80004e44:	2501                	sext.w	a0,a0
    80004e46:	1aaa9963          	bne	s5,a0,80004ff8 <exec+0x2c6>
    80004e4a:	6785                	lui	a5,0x1
    80004e4c:	0127893b          	addw	s2,a5,s2
    80004e50:	77fd                	lui	a5,0xfffff
    80004e52:	01478a3b          	addw	s4,a5,s4
    80004e56:	1f897163          	bgeu	s2,s8,80005038 <exec+0x306>
    80004e5a:	02091593          	slli	a1,s2,0x20
    80004e5e:	9181                	srli	a1,a1,0x20
    80004e60:	95ea                	add	a1,a1,s10
    80004e62:	855e                	mv	a0,s7
    80004e64:	ffffc097          	auipc	ra,0xffffc
    80004e68:	20a080e7          	jalr	522(ra) # 8000106e <walkaddr>
    80004e6c:	862a                	mv	a2,a0
    80004e6e:	d955                	beqz	a0,80004e22 <exec+0xf0>
    80004e70:	8ae6                	mv	s5,s9
    80004e72:	fd9a70e3          	bgeu	s4,s9,80004e32 <exec+0x100>
    80004e76:	8ad2                	mv	s5,s4
    80004e78:	bf6d                	j	80004e32 <exec+0x100>
    80004e7a:	4901                	li	s2,0
    80004e7c:	8526                	mv	a0,s1
    80004e7e:	fffff097          	auipc	ra,0xfffff
    80004e82:	c18080e7          	jalr	-1000(ra) # 80003a96 <iunlockput>
    80004e86:	fffff097          	auipc	ra,0xfffff
    80004e8a:	400080e7          	jalr	1024(ra) # 80004286 <end_op>
    80004e8e:	ffffd097          	auipc	ra,0xffffd
    80004e92:	b22080e7          	jalr	-1246(ra) # 800019b0 <myproc>
    80004e96:	8aaa                	mv	s5,a0
    80004e98:	04853d03          	ld	s10,72(a0)
    80004e9c:	6785                	lui	a5,0x1
    80004e9e:	17fd                	addi	a5,a5,-1
    80004ea0:	993e                	add	s2,s2,a5
    80004ea2:	757d                	lui	a0,0xfffff
    80004ea4:	00a977b3          	and	a5,s2,a0
    80004ea8:	e0f43423          	sd	a5,-504(s0)
    80004eac:	6609                	lui	a2,0x2
    80004eae:	963e                	add	a2,a2,a5
    80004eb0:	85be                	mv	a1,a5
    80004eb2:	855e                	mv	a0,s7
    80004eb4:	ffffc097          	auipc	ra,0xffffc
    80004eb8:	56e080e7          	jalr	1390(ra) # 80001422 <uvmalloc>
    80004ebc:	8b2a                	mv	s6,a0
    80004ebe:	4481                	li	s1,0
    80004ec0:	12050c63          	beqz	a0,80004ff8 <exec+0x2c6>
    80004ec4:	75f9                	lui	a1,0xffffe
    80004ec6:	95aa                	add	a1,a1,a0
    80004ec8:	855e                	mv	a0,s7
    80004eca:	ffffc097          	auipc	ra,0xffffc
    80004ece:	776080e7          	jalr	1910(ra) # 80001640 <uvmclear>
    80004ed2:	7c7d                	lui	s8,0xfffff
    80004ed4:	9c5a                	add	s8,s8,s6
    80004ed6:	e0043783          	ld	a5,-512(s0)
    80004eda:	6388                	ld	a0,0(a5)
    80004edc:	c535                	beqz	a0,80004f48 <exec+0x216>
    80004ede:	e9040993          	addi	s3,s0,-368
    80004ee2:	f9040c93          	addi	s9,s0,-112
    80004ee6:	895a                	mv	s2,s6
    80004ee8:	ffffc097          	auipc	ra,0xffffc
    80004eec:	f7c080e7          	jalr	-132(ra) # 80000e64 <strlen>
    80004ef0:	2505                	addiw	a0,a0,1
    80004ef2:	40a90933          	sub	s2,s2,a0
    80004ef6:	ff097913          	andi	s2,s2,-16
    80004efa:	13896363          	bltu	s2,s8,80005020 <exec+0x2ee>
    80004efe:	e0043d83          	ld	s11,-512(s0)
    80004f02:	000dba03          	ld	s4,0(s11)
    80004f06:	8552                	mv	a0,s4
    80004f08:	ffffc097          	auipc	ra,0xffffc
    80004f0c:	f5c080e7          	jalr	-164(ra) # 80000e64 <strlen>
    80004f10:	0015069b          	addiw	a3,a0,1
    80004f14:	8652                	mv	a2,s4
    80004f16:	85ca                	mv	a1,s2
    80004f18:	855e                	mv	a0,s7
    80004f1a:	ffffc097          	auipc	ra,0xffffc
    80004f1e:	758080e7          	jalr	1880(ra) # 80001672 <copyout>
    80004f22:	10054363          	bltz	a0,80005028 <exec+0x2f6>
    80004f26:	0129b023          	sd	s2,0(s3)
    80004f2a:	0485                	addi	s1,s1,1
    80004f2c:	008d8793          	addi	a5,s11,8
    80004f30:	e0f43023          	sd	a5,-512(s0)
    80004f34:	008db503          	ld	a0,8(s11)
    80004f38:	c911                	beqz	a0,80004f4c <exec+0x21a>
    80004f3a:	09a1                	addi	s3,s3,8
    80004f3c:	fb3c96e3          	bne	s9,s3,80004ee8 <exec+0x1b6>
    80004f40:	e1643423          	sd	s6,-504(s0)
    80004f44:	4481                	li	s1,0
    80004f46:	a84d                	j	80004ff8 <exec+0x2c6>
    80004f48:	895a                	mv	s2,s6
    80004f4a:	4481                	li	s1,0
    80004f4c:	00349793          	slli	a5,s1,0x3
    80004f50:	f9040713          	addi	a4,s0,-112
    80004f54:	97ba                	add	a5,a5,a4
    80004f56:	f007b023          	sd	zero,-256(a5) # f00 <_entry-0x7ffff100>
    80004f5a:	00148693          	addi	a3,s1,1
    80004f5e:	068e                	slli	a3,a3,0x3
    80004f60:	40d90933          	sub	s2,s2,a3
    80004f64:	ff097913          	andi	s2,s2,-16
    80004f68:	01897663          	bgeu	s2,s8,80004f74 <exec+0x242>
    80004f6c:	e1643423          	sd	s6,-504(s0)
    80004f70:	4481                	li	s1,0
    80004f72:	a059                	j	80004ff8 <exec+0x2c6>
    80004f74:	e9040613          	addi	a2,s0,-368
    80004f78:	85ca                	mv	a1,s2
    80004f7a:	855e                	mv	a0,s7
    80004f7c:	ffffc097          	auipc	ra,0xffffc
    80004f80:	6f6080e7          	jalr	1782(ra) # 80001672 <copyout>
    80004f84:	0a054663          	bltz	a0,80005030 <exec+0x2fe>
    80004f88:	058ab783          	ld	a5,88(s5)
    80004f8c:	0727bc23          	sd	s2,120(a5)
    80004f90:	df843783          	ld	a5,-520(s0)
    80004f94:	0007c703          	lbu	a4,0(a5)
    80004f98:	cf11                	beqz	a4,80004fb4 <exec+0x282>
    80004f9a:	0785                	addi	a5,a5,1
    80004f9c:	02f00693          	li	a3,47
    80004fa0:	a039                	j	80004fae <exec+0x27c>
    80004fa2:	def43c23          	sd	a5,-520(s0)
    80004fa6:	0785                	addi	a5,a5,1
    80004fa8:	fff7c703          	lbu	a4,-1(a5)
    80004fac:	c701                	beqz	a4,80004fb4 <exec+0x282>
    80004fae:	fed71ce3          	bne	a4,a3,80004fa6 <exec+0x274>
    80004fb2:	bfc5                	j	80004fa2 <exec+0x270>
    80004fb4:	4641                	li	a2,16
    80004fb6:	df843583          	ld	a1,-520(s0)
    80004fba:	158a8513          	addi	a0,s5,344
    80004fbe:	ffffc097          	auipc	ra,0xffffc
    80004fc2:	e74080e7          	jalr	-396(ra) # 80000e32 <safestrcpy>
    80004fc6:	050ab503          	ld	a0,80(s5)
    80004fca:	057ab823          	sd	s7,80(s5)
    80004fce:	056ab423          	sd	s6,72(s5)
    80004fd2:	058ab783          	ld	a5,88(s5)
    80004fd6:	e6843703          	ld	a4,-408(s0)
    80004fda:	ef98                	sd	a4,24(a5)
    80004fdc:	058ab783          	ld	a5,88(s5)
    80004fe0:	0327b823          	sd	s2,48(a5)
    80004fe4:	85ea                	mv	a1,s10
    80004fe6:	ffffd097          	auipc	ra,0xffffd
    80004fea:	b2a080e7          	jalr	-1238(ra) # 80001b10 <proc_freepagetable>
    80004fee:	0004851b          	sext.w	a0,s1
    80004ff2:	bbe1                	j	80004dca <exec+0x98>
    80004ff4:	e1243423          	sd	s2,-504(s0)
    80004ff8:	e0843583          	ld	a1,-504(s0)
    80004ffc:	855e                	mv	a0,s7
    80004ffe:	ffffd097          	auipc	ra,0xffffd
    80005002:	b12080e7          	jalr	-1262(ra) # 80001b10 <proc_freepagetable>
    80005006:	da0498e3          	bnez	s1,80004db6 <exec+0x84>
    8000500a:	557d                	li	a0,-1
    8000500c:	bb7d                	j	80004dca <exec+0x98>
    8000500e:	e1243423          	sd	s2,-504(s0)
    80005012:	b7dd                	j	80004ff8 <exec+0x2c6>
    80005014:	e1243423          	sd	s2,-504(s0)
    80005018:	b7c5                	j	80004ff8 <exec+0x2c6>
    8000501a:	e1243423          	sd	s2,-504(s0)
    8000501e:	bfe9                	j	80004ff8 <exec+0x2c6>
    80005020:	e1643423          	sd	s6,-504(s0)
    80005024:	4481                	li	s1,0
    80005026:	bfc9                	j	80004ff8 <exec+0x2c6>
    80005028:	e1643423          	sd	s6,-504(s0)
    8000502c:	4481                	li	s1,0
    8000502e:	b7e9                	j	80004ff8 <exec+0x2c6>
    80005030:	e1643423          	sd	s6,-504(s0)
    80005034:	4481                	li	s1,0
    80005036:	b7c9                	j	80004ff8 <exec+0x2c6>
    80005038:	e0843903          	ld	s2,-504(s0)
    8000503c:	2b05                	addiw	s6,s6,1
    8000503e:	0389899b          	addiw	s3,s3,56
    80005042:	e8845783          	lhu	a5,-376(s0)
    80005046:	e2fb5be3          	bge	s6,a5,80004e7c <exec+0x14a>
    8000504a:	2981                	sext.w	s3,s3
    8000504c:	03800713          	li	a4,56
    80005050:	86ce                	mv	a3,s3
    80005052:	e1840613          	addi	a2,s0,-488
    80005056:	4581                	li	a1,0
    80005058:	8526                	mv	a0,s1
    8000505a:	fffff097          	auipc	ra,0xfffff
    8000505e:	a8e080e7          	jalr	-1394(ra) # 80003ae8 <readi>
    80005062:	03800793          	li	a5,56
    80005066:	f8f517e3          	bne	a0,a5,80004ff4 <exec+0x2c2>
    8000506a:	e1842783          	lw	a5,-488(s0)
    8000506e:	4705                	li	a4,1
    80005070:	fce796e3          	bne	a5,a4,8000503c <exec+0x30a>
    80005074:	e4043603          	ld	a2,-448(s0)
    80005078:	e3843783          	ld	a5,-456(s0)
    8000507c:	f8f669e3          	bltu	a2,a5,8000500e <exec+0x2dc>
    80005080:	e2843783          	ld	a5,-472(s0)
    80005084:	963e                	add	a2,a2,a5
    80005086:	f8f667e3          	bltu	a2,a5,80005014 <exec+0x2e2>
    8000508a:	85ca                	mv	a1,s2
    8000508c:	855e                	mv	a0,s7
    8000508e:	ffffc097          	auipc	ra,0xffffc
    80005092:	394080e7          	jalr	916(ra) # 80001422 <uvmalloc>
    80005096:	e0a43423          	sd	a0,-504(s0)
    8000509a:	d141                	beqz	a0,8000501a <exec+0x2e8>
    8000509c:	e2843d03          	ld	s10,-472(s0)
    800050a0:	df043783          	ld	a5,-528(s0)
    800050a4:	00fd77b3          	and	a5,s10,a5
    800050a8:	fba1                	bnez	a5,80004ff8 <exec+0x2c6>
    800050aa:	e2042d83          	lw	s11,-480(s0)
    800050ae:	e3842c03          	lw	s8,-456(s0)
    800050b2:	f80c03e3          	beqz	s8,80005038 <exec+0x306>
    800050b6:	8a62                	mv	s4,s8
    800050b8:	4901                	li	s2,0
    800050ba:	b345                	j	80004e5a <exec+0x128>

00000000800050bc <argfd>:
    800050bc:	7179                	addi	sp,sp,-48
    800050be:	f406                	sd	ra,40(sp)
    800050c0:	f022                	sd	s0,32(sp)
    800050c2:	ec26                	sd	s1,24(sp)
    800050c4:	e84a                	sd	s2,16(sp)
    800050c6:	1800                	addi	s0,sp,48
    800050c8:	892e                	mv	s2,a1
    800050ca:	84b2                	mv	s1,a2
    800050cc:	fdc40593          	addi	a1,s0,-36
    800050d0:	ffffe097          	auipc	ra,0xffffe
    800050d4:	b4a080e7          	jalr	-1206(ra) # 80002c1a <argint>
    800050d8:	04054063          	bltz	a0,80005118 <argfd+0x5c>
    800050dc:	fdc42703          	lw	a4,-36(s0)
    800050e0:	47bd                	li	a5,15
    800050e2:	02e7ed63          	bltu	a5,a4,8000511c <argfd+0x60>
    800050e6:	ffffd097          	auipc	ra,0xffffd
    800050ea:	8ca080e7          	jalr	-1846(ra) # 800019b0 <myproc>
    800050ee:	fdc42703          	lw	a4,-36(s0)
    800050f2:	01a70793          	addi	a5,a4,26
    800050f6:	078e                	slli	a5,a5,0x3
    800050f8:	953e                	add	a0,a0,a5
    800050fa:	611c                	ld	a5,0(a0)
    800050fc:	c395                	beqz	a5,80005120 <argfd+0x64>
    800050fe:	00090463          	beqz	s2,80005106 <argfd+0x4a>
    80005102:	00e92023          	sw	a4,0(s2)
    80005106:	4501                	li	a0,0
    80005108:	c091                	beqz	s1,8000510c <argfd+0x50>
    8000510a:	e09c                	sd	a5,0(s1)
    8000510c:	70a2                	ld	ra,40(sp)
    8000510e:	7402                	ld	s0,32(sp)
    80005110:	64e2                	ld	s1,24(sp)
    80005112:	6942                	ld	s2,16(sp)
    80005114:	6145                	addi	sp,sp,48
    80005116:	8082                	ret
    80005118:	557d                	li	a0,-1
    8000511a:	bfcd                	j	8000510c <argfd+0x50>
    8000511c:	557d                	li	a0,-1
    8000511e:	b7fd                	j	8000510c <argfd+0x50>
    80005120:	557d                	li	a0,-1
    80005122:	b7ed                	j	8000510c <argfd+0x50>

0000000080005124 <fdalloc>:
    80005124:	1101                	addi	sp,sp,-32
    80005126:	ec06                	sd	ra,24(sp)
    80005128:	e822                	sd	s0,16(sp)
    8000512a:	e426                	sd	s1,8(sp)
    8000512c:	1000                	addi	s0,sp,32
    8000512e:	84aa                	mv	s1,a0
    80005130:	ffffd097          	auipc	ra,0xffffd
    80005134:	880080e7          	jalr	-1920(ra) # 800019b0 <myproc>
    80005138:	862a                	mv	a2,a0
    8000513a:	0d050793          	addi	a5,a0,208 # fffffffffffff0d0 <end+0xffffffff7ffd90d0>
    8000513e:	4501                	li	a0,0
    80005140:	46c1                	li	a3,16
    80005142:	6398                	ld	a4,0(a5)
    80005144:	cb19                	beqz	a4,8000515a <fdalloc+0x36>
    80005146:	2505                	addiw	a0,a0,1
    80005148:	07a1                	addi	a5,a5,8
    8000514a:	fed51ce3          	bne	a0,a3,80005142 <fdalloc+0x1e>
    8000514e:	557d                	li	a0,-1
    80005150:	60e2                	ld	ra,24(sp)
    80005152:	6442                	ld	s0,16(sp)
    80005154:	64a2                	ld	s1,8(sp)
    80005156:	6105                	addi	sp,sp,32
    80005158:	8082                	ret
    8000515a:	01a50793          	addi	a5,a0,26
    8000515e:	078e                	slli	a5,a5,0x3
    80005160:	963e                	add	a2,a2,a5
    80005162:	e204                	sd	s1,0(a2)
    80005164:	b7f5                	j	80005150 <fdalloc+0x2c>

0000000080005166 <create>:
    80005166:	715d                	addi	sp,sp,-80
    80005168:	e486                	sd	ra,72(sp)
    8000516a:	e0a2                	sd	s0,64(sp)
    8000516c:	fc26                	sd	s1,56(sp)
    8000516e:	f84a                	sd	s2,48(sp)
    80005170:	f44e                	sd	s3,40(sp)
    80005172:	f052                	sd	s4,32(sp)
    80005174:	ec56                	sd	s5,24(sp)
    80005176:	0880                	addi	s0,sp,80
    80005178:	89ae                	mv	s3,a1
    8000517a:	8ab2                	mv	s5,a2
    8000517c:	8a36                	mv	s4,a3
    8000517e:	fb040593          	addi	a1,s0,-80
    80005182:	fffff097          	auipc	ra,0xfffff
    80005186:	e86080e7          	jalr	-378(ra) # 80004008 <nameiparent>
    8000518a:	892a                	mv	s2,a0
    8000518c:	12050f63          	beqz	a0,800052ca <create+0x164>
    80005190:	ffffe097          	auipc	ra,0xffffe
    80005194:	6a4080e7          	jalr	1700(ra) # 80003834 <ilock>
    80005198:	4601                	li	a2,0
    8000519a:	fb040593          	addi	a1,s0,-80
    8000519e:	854a                	mv	a0,s2
    800051a0:	fffff097          	auipc	ra,0xfffff
    800051a4:	b78080e7          	jalr	-1160(ra) # 80003d18 <dirlookup>
    800051a8:	84aa                	mv	s1,a0
    800051aa:	c921                	beqz	a0,800051fa <create+0x94>
    800051ac:	854a                	mv	a0,s2
    800051ae:	fffff097          	auipc	ra,0xfffff
    800051b2:	8e8080e7          	jalr	-1816(ra) # 80003a96 <iunlockput>
    800051b6:	8526                	mv	a0,s1
    800051b8:	ffffe097          	auipc	ra,0xffffe
    800051bc:	67c080e7          	jalr	1660(ra) # 80003834 <ilock>
    800051c0:	2981                	sext.w	s3,s3
    800051c2:	4789                	li	a5,2
    800051c4:	02f99463          	bne	s3,a5,800051ec <create+0x86>
    800051c8:	0444d783          	lhu	a5,68(s1)
    800051cc:	37f9                	addiw	a5,a5,-2
    800051ce:	17c2                	slli	a5,a5,0x30
    800051d0:	93c1                	srli	a5,a5,0x30
    800051d2:	4705                	li	a4,1
    800051d4:	00f76c63          	bltu	a4,a5,800051ec <create+0x86>
    800051d8:	8526                	mv	a0,s1
    800051da:	60a6                	ld	ra,72(sp)
    800051dc:	6406                	ld	s0,64(sp)
    800051de:	74e2                	ld	s1,56(sp)
    800051e0:	7942                	ld	s2,48(sp)
    800051e2:	79a2                	ld	s3,40(sp)
    800051e4:	7a02                	ld	s4,32(sp)
    800051e6:	6ae2                	ld	s5,24(sp)
    800051e8:	6161                	addi	sp,sp,80
    800051ea:	8082                	ret
    800051ec:	8526                	mv	a0,s1
    800051ee:	fffff097          	auipc	ra,0xfffff
    800051f2:	8a8080e7          	jalr	-1880(ra) # 80003a96 <iunlockput>
    800051f6:	4481                	li	s1,0
    800051f8:	b7c5                	j	800051d8 <create+0x72>
    800051fa:	85ce                	mv	a1,s3
    800051fc:	00092503          	lw	a0,0(s2)
    80005200:	ffffe097          	auipc	ra,0xffffe
    80005204:	49c080e7          	jalr	1180(ra) # 8000369c <ialloc>
    80005208:	84aa                	mv	s1,a0
    8000520a:	c529                	beqz	a0,80005254 <create+0xee>
    8000520c:	ffffe097          	auipc	ra,0xffffe
    80005210:	628080e7          	jalr	1576(ra) # 80003834 <ilock>
    80005214:	05549323          	sh	s5,70(s1)
    80005218:	05449423          	sh	s4,72(s1)
    8000521c:	4785                	li	a5,1
    8000521e:	04f49523          	sh	a5,74(s1)
    80005222:	8526                	mv	a0,s1
    80005224:	ffffe097          	auipc	ra,0xffffe
    80005228:	546080e7          	jalr	1350(ra) # 8000376a <iupdate>
    8000522c:	2981                	sext.w	s3,s3
    8000522e:	4785                	li	a5,1
    80005230:	02f98a63          	beq	s3,a5,80005264 <create+0xfe>
    80005234:	40d0                	lw	a2,4(s1)
    80005236:	fb040593          	addi	a1,s0,-80
    8000523a:	854a                	mv	a0,s2
    8000523c:	fffff097          	auipc	ra,0xfffff
    80005240:	cec080e7          	jalr	-788(ra) # 80003f28 <dirlink>
    80005244:	06054b63          	bltz	a0,800052ba <create+0x154>
    80005248:	854a                	mv	a0,s2
    8000524a:	fffff097          	auipc	ra,0xfffff
    8000524e:	84c080e7          	jalr	-1972(ra) # 80003a96 <iunlockput>
    80005252:	b759                	j	800051d8 <create+0x72>
    80005254:	00003517          	auipc	a0,0x3
    80005258:	55450513          	addi	a0,a0,1364 # 800087a8 <syscalls+0x2a8>
    8000525c:	ffffb097          	auipc	ra,0xffffb
    80005260:	2e2080e7          	jalr	738(ra) # 8000053e <panic>
    80005264:	04a95783          	lhu	a5,74(s2)
    80005268:	2785                	addiw	a5,a5,1
    8000526a:	04f91523          	sh	a5,74(s2)
    8000526e:	854a                	mv	a0,s2
    80005270:	ffffe097          	auipc	ra,0xffffe
    80005274:	4fa080e7          	jalr	1274(ra) # 8000376a <iupdate>
    80005278:	40d0                	lw	a2,4(s1)
    8000527a:	00003597          	auipc	a1,0x3
    8000527e:	53e58593          	addi	a1,a1,1342 # 800087b8 <syscalls+0x2b8>
    80005282:	8526                	mv	a0,s1
    80005284:	fffff097          	auipc	ra,0xfffff
    80005288:	ca4080e7          	jalr	-860(ra) # 80003f28 <dirlink>
    8000528c:	00054f63          	bltz	a0,800052aa <create+0x144>
    80005290:	00492603          	lw	a2,4(s2)
    80005294:	00003597          	auipc	a1,0x3
    80005298:	52c58593          	addi	a1,a1,1324 # 800087c0 <syscalls+0x2c0>
    8000529c:	8526                	mv	a0,s1
    8000529e:	fffff097          	auipc	ra,0xfffff
    800052a2:	c8a080e7          	jalr	-886(ra) # 80003f28 <dirlink>
    800052a6:	f80557e3          	bgez	a0,80005234 <create+0xce>
    800052aa:	00003517          	auipc	a0,0x3
    800052ae:	51e50513          	addi	a0,a0,1310 # 800087c8 <syscalls+0x2c8>
    800052b2:	ffffb097          	auipc	ra,0xffffb
    800052b6:	28c080e7          	jalr	652(ra) # 8000053e <panic>
    800052ba:	00003517          	auipc	a0,0x3
    800052be:	51e50513          	addi	a0,a0,1310 # 800087d8 <syscalls+0x2d8>
    800052c2:	ffffb097          	auipc	ra,0xffffb
    800052c6:	27c080e7          	jalr	636(ra) # 8000053e <panic>
    800052ca:	84aa                	mv	s1,a0
    800052cc:	b731                	j	800051d8 <create+0x72>

00000000800052ce <sys_dup>:
    800052ce:	7179                	addi	sp,sp,-48
    800052d0:	f406                	sd	ra,40(sp)
    800052d2:	f022                	sd	s0,32(sp)
    800052d4:	ec26                	sd	s1,24(sp)
    800052d6:	1800                	addi	s0,sp,48
    800052d8:	fd840613          	addi	a2,s0,-40
    800052dc:	4581                	li	a1,0
    800052de:	4501                	li	a0,0
    800052e0:	00000097          	auipc	ra,0x0
    800052e4:	ddc080e7          	jalr	-548(ra) # 800050bc <argfd>
    800052e8:	57fd                	li	a5,-1
    800052ea:	02054363          	bltz	a0,80005310 <sys_dup+0x42>
    800052ee:	fd843503          	ld	a0,-40(s0)
    800052f2:	00000097          	auipc	ra,0x0
    800052f6:	e32080e7          	jalr	-462(ra) # 80005124 <fdalloc>
    800052fa:	84aa                	mv	s1,a0
    800052fc:	57fd                	li	a5,-1
    800052fe:	00054963          	bltz	a0,80005310 <sys_dup+0x42>
    80005302:	fd843503          	ld	a0,-40(s0)
    80005306:	fffff097          	auipc	ra,0xfffff
    8000530a:	37a080e7          	jalr	890(ra) # 80004680 <filedup>
    8000530e:	87a6                	mv	a5,s1
    80005310:	853e                	mv	a0,a5
    80005312:	70a2                	ld	ra,40(sp)
    80005314:	7402                	ld	s0,32(sp)
    80005316:	64e2                	ld	s1,24(sp)
    80005318:	6145                	addi	sp,sp,48
    8000531a:	8082                	ret

000000008000531c <sys_read>:
    8000531c:	7179                	addi	sp,sp,-48
    8000531e:	f406                	sd	ra,40(sp)
    80005320:	f022                	sd	s0,32(sp)
    80005322:	1800                	addi	s0,sp,48
    80005324:	fe840613          	addi	a2,s0,-24
    80005328:	4581                	li	a1,0
    8000532a:	4501                	li	a0,0
    8000532c:	00000097          	auipc	ra,0x0
    80005330:	d90080e7          	jalr	-624(ra) # 800050bc <argfd>
    80005334:	57fd                	li	a5,-1
    80005336:	04054163          	bltz	a0,80005378 <sys_read+0x5c>
    8000533a:	fe440593          	addi	a1,s0,-28
    8000533e:	4509                	li	a0,2
    80005340:	ffffe097          	auipc	ra,0xffffe
    80005344:	8da080e7          	jalr	-1830(ra) # 80002c1a <argint>
    80005348:	57fd                	li	a5,-1
    8000534a:	02054763          	bltz	a0,80005378 <sys_read+0x5c>
    8000534e:	fd840593          	addi	a1,s0,-40
    80005352:	4505                	li	a0,1
    80005354:	ffffe097          	auipc	ra,0xffffe
    80005358:	8e8080e7          	jalr	-1816(ra) # 80002c3c <argaddr>
    8000535c:	57fd                	li	a5,-1
    8000535e:	00054d63          	bltz	a0,80005378 <sys_read+0x5c>
    80005362:	fe442603          	lw	a2,-28(s0)
    80005366:	fd843583          	ld	a1,-40(s0)
    8000536a:	fe843503          	ld	a0,-24(s0)
    8000536e:	fffff097          	auipc	ra,0xfffff
    80005372:	49e080e7          	jalr	1182(ra) # 8000480c <fileread>
    80005376:	87aa                	mv	a5,a0
    80005378:	853e                	mv	a0,a5
    8000537a:	70a2                	ld	ra,40(sp)
    8000537c:	7402                	ld	s0,32(sp)
    8000537e:	6145                	addi	sp,sp,48
    80005380:	8082                	ret

0000000080005382 <sys_write>:
    80005382:	7179                	addi	sp,sp,-48
    80005384:	f406                	sd	ra,40(sp)
    80005386:	f022                	sd	s0,32(sp)
    80005388:	1800                	addi	s0,sp,48
    8000538a:	fe840613          	addi	a2,s0,-24
    8000538e:	4581                	li	a1,0
    80005390:	4501                	li	a0,0
    80005392:	00000097          	auipc	ra,0x0
    80005396:	d2a080e7          	jalr	-726(ra) # 800050bc <argfd>
    8000539a:	57fd                	li	a5,-1
    8000539c:	04054163          	bltz	a0,800053de <sys_write+0x5c>
    800053a0:	fe440593          	addi	a1,s0,-28
    800053a4:	4509                	li	a0,2
    800053a6:	ffffe097          	auipc	ra,0xffffe
    800053aa:	874080e7          	jalr	-1932(ra) # 80002c1a <argint>
    800053ae:	57fd                	li	a5,-1
    800053b0:	02054763          	bltz	a0,800053de <sys_write+0x5c>
    800053b4:	fd840593          	addi	a1,s0,-40
    800053b8:	4505                	li	a0,1
    800053ba:	ffffe097          	auipc	ra,0xffffe
    800053be:	882080e7          	jalr	-1918(ra) # 80002c3c <argaddr>
    800053c2:	57fd                	li	a5,-1
    800053c4:	00054d63          	bltz	a0,800053de <sys_write+0x5c>
    800053c8:	fe442603          	lw	a2,-28(s0)
    800053cc:	fd843583          	ld	a1,-40(s0)
    800053d0:	fe843503          	ld	a0,-24(s0)
    800053d4:	fffff097          	auipc	ra,0xfffff
    800053d8:	4fa080e7          	jalr	1274(ra) # 800048ce <filewrite>
    800053dc:	87aa                	mv	a5,a0
    800053de:	853e                	mv	a0,a5
    800053e0:	70a2                	ld	ra,40(sp)
    800053e2:	7402                	ld	s0,32(sp)
    800053e4:	6145                	addi	sp,sp,48
    800053e6:	8082                	ret

00000000800053e8 <sys_close>:
    800053e8:	1101                	addi	sp,sp,-32
    800053ea:	ec06                	sd	ra,24(sp)
    800053ec:	e822                	sd	s0,16(sp)
    800053ee:	1000                	addi	s0,sp,32
    800053f0:	fe040613          	addi	a2,s0,-32
    800053f4:	fec40593          	addi	a1,s0,-20
    800053f8:	4501                	li	a0,0
    800053fa:	00000097          	auipc	ra,0x0
    800053fe:	cc2080e7          	jalr	-830(ra) # 800050bc <argfd>
    80005402:	57fd                	li	a5,-1
    80005404:	02054463          	bltz	a0,8000542c <sys_close+0x44>
    80005408:	ffffc097          	auipc	ra,0xffffc
    8000540c:	5a8080e7          	jalr	1448(ra) # 800019b0 <myproc>
    80005410:	fec42783          	lw	a5,-20(s0)
    80005414:	07e9                	addi	a5,a5,26
    80005416:	078e                	slli	a5,a5,0x3
    80005418:	97aa                	add	a5,a5,a0
    8000541a:	0007b023          	sd	zero,0(a5)
    8000541e:	fe043503          	ld	a0,-32(s0)
    80005422:	fffff097          	auipc	ra,0xfffff
    80005426:	2b0080e7          	jalr	688(ra) # 800046d2 <fileclose>
    8000542a:	4781                	li	a5,0
    8000542c:	853e                	mv	a0,a5
    8000542e:	60e2                	ld	ra,24(sp)
    80005430:	6442                	ld	s0,16(sp)
    80005432:	6105                	addi	sp,sp,32
    80005434:	8082                	ret

0000000080005436 <sys_fstat>:
    80005436:	1101                	addi	sp,sp,-32
    80005438:	ec06                	sd	ra,24(sp)
    8000543a:	e822                	sd	s0,16(sp)
    8000543c:	1000                	addi	s0,sp,32
    8000543e:	fe840613          	addi	a2,s0,-24
    80005442:	4581                	li	a1,0
    80005444:	4501                	li	a0,0
    80005446:	00000097          	auipc	ra,0x0
    8000544a:	c76080e7          	jalr	-906(ra) # 800050bc <argfd>
    8000544e:	57fd                	li	a5,-1
    80005450:	02054563          	bltz	a0,8000547a <sys_fstat+0x44>
    80005454:	fe040593          	addi	a1,s0,-32
    80005458:	4505                	li	a0,1
    8000545a:	ffffd097          	auipc	ra,0xffffd
    8000545e:	7e2080e7          	jalr	2018(ra) # 80002c3c <argaddr>
    80005462:	57fd                	li	a5,-1
    80005464:	00054b63          	bltz	a0,8000547a <sys_fstat+0x44>
    80005468:	fe043583          	ld	a1,-32(s0)
    8000546c:	fe843503          	ld	a0,-24(s0)
    80005470:	fffff097          	auipc	ra,0xfffff
    80005474:	32a080e7          	jalr	810(ra) # 8000479a <filestat>
    80005478:	87aa                	mv	a5,a0
    8000547a:	853e                	mv	a0,a5
    8000547c:	60e2                	ld	ra,24(sp)
    8000547e:	6442                	ld	s0,16(sp)
    80005480:	6105                	addi	sp,sp,32
    80005482:	8082                	ret

0000000080005484 <sys_link>:
    80005484:	7169                	addi	sp,sp,-304
    80005486:	f606                	sd	ra,296(sp)
    80005488:	f222                	sd	s0,288(sp)
    8000548a:	ee26                	sd	s1,280(sp)
    8000548c:	ea4a                	sd	s2,272(sp)
    8000548e:	1a00                	addi	s0,sp,304
    80005490:	08000613          	li	a2,128
    80005494:	ed040593          	addi	a1,s0,-304
    80005498:	4501                	li	a0,0
    8000549a:	ffffd097          	auipc	ra,0xffffd
    8000549e:	7c4080e7          	jalr	1988(ra) # 80002c5e <argstr>
    800054a2:	57fd                	li	a5,-1
    800054a4:	10054e63          	bltz	a0,800055c0 <sys_link+0x13c>
    800054a8:	08000613          	li	a2,128
    800054ac:	f5040593          	addi	a1,s0,-176
    800054b0:	4505                	li	a0,1
    800054b2:	ffffd097          	auipc	ra,0xffffd
    800054b6:	7ac080e7          	jalr	1964(ra) # 80002c5e <argstr>
    800054ba:	57fd                	li	a5,-1
    800054bc:	10054263          	bltz	a0,800055c0 <sys_link+0x13c>
    800054c0:	fffff097          	auipc	ra,0xfffff
    800054c4:	d46080e7          	jalr	-698(ra) # 80004206 <begin_op>
    800054c8:	ed040513          	addi	a0,s0,-304
    800054cc:	fffff097          	auipc	ra,0xfffff
    800054d0:	b1e080e7          	jalr	-1250(ra) # 80003fea <namei>
    800054d4:	84aa                	mv	s1,a0
    800054d6:	c551                	beqz	a0,80005562 <sys_link+0xde>
    800054d8:	ffffe097          	auipc	ra,0xffffe
    800054dc:	35c080e7          	jalr	860(ra) # 80003834 <ilock>
    800054e0:	04449703          	lh	a4,68(s1)
    800054e4:	4785                	li	a5,1
    800054e6:	08f70463          	beq	a4,a5,8000556e <sys_link+0xea>
    800054ea:	04a4d783          	lhu	a5,74(s1)
    800054ee:	2785                	addiw	a5,a5,1
    800054f0:	04f49523          	sh	a5,74(s1)
    800054f4:	8526                	mv	a0,s1
    800054f6:	ffffe097          	auipc	ra,0xffffe
    800054fa:	274080e7          	jalr	628(ra) # 8000376a <iupdate>
    800054fe:	8526                	mv	a0,s1
    80005500:	ffffe097          	auipc	ra,0xffffe
    80005504:	3f6080e7          	jalr	1014(ra) # 800038f6 <iunlock>
    80005508:	fd040593          	addi	a1,s0,-48
    8000550c:	f5040513          	addi	a0,s0,-176
    80005510:	fffff097          	auipc	ra,0xfffff
    80005514:	af8080e7          	jalr	-1288(ra) # 80004008 <nameiparent>
    80005518:	892a                	mv	s2,a0
    8000551a:	c935                	beqz	a0,8000558e <sys_link+0x10a>
    8000551c:	ffffe097          	auipc	ra,0xffffe
    80005520:	318080e7          	jalr	792(ra) # 80003834 <ilock>
    80005524:	00092703          	lw	a4,0(s2)
    80005528:	409c                	lw	a5,0(s1)
    8000552a:	04f71d63          	bne	a4,a5,80005584 <sys_link+0x100>
    8000552e:	40d0                	lw	a2,4(s1)
    80005530:	fd040593          	addi	a1,s0,-48
    80005534:	854a                	mv	a0,s2
    80005536:	fffff097          	auipc	ra,0xfffff
    8000553a:	9f2080e7          	jalr	-1550(ra) # 80003f28 <dirlink>
    8000553e:	04054363          	bltz	a0,80005584 <sys_link+0x100>
    80005542:	854a                	mv	a0,s2
    80005544:	ffffe097          	auipc	ra,0xffffe
    80005548:	552080e7          	jalr	1362(ra) # 80003a96 <iunlockput>
    8000554c:	8526                	mv	a0,s1
    8000554e:	ffffe097          	auipc	ra,0xffffe
    80005552:	4a0080e7          	jalr	1184(ra) # 800039ee <iput>
    80005556:	fffff097          	auipc	ra,0xfffff
    8000555a:	d30080e7          	jalr	-720(ra) # 80004286 <end_op>
    8000555e:	4781                	li	a5,0
    80005560:	a085                	j	800055c0 <sys_link+0x13c>
    80005562:	fffff097          	auipc	ra,0xfffff
    80005566:	d24080e7          	jalr	-732(ra) # 80004286 <end_op>
    8000556a:	57fd                	li	a5,-1
    8000556c:	a891                	j	800055c0 <sys_link+0x13c>
    8000556e:	8526                	mv	a0,s1
    80005570:	ffffe097          	auipc	ra,0xffffe
    80005574:	526080e7          	jalr	1318(ra) # 80003a96 <iunlockput>
    80005578:	fffff097          	auipc	ra,0xfffff
    8000557c:	d0e080e7          	jalr	-754(ra) # 80004286 <end_op>
    80005580:	57fd                	li	a5,-1
    80005582:	a83d                	j	800055c0 <sys_link+0x13c>
    80005584:	854a                	mv	a0,s2
    80005586:	ffffe097          	auipc	ra,0xffffe
    8000558a:	510080e7          	jalr	1296(ra) # 80003a96 <iunlockput>
    8000558e:	8526                	mv	a0,s1
    80005590:	ffffe097          	auipc	ra,0xffffe
    80005594:	2a4080e7          	jalr	676(ra) # 80003834 <ilock>
    80005598:	04a4d783          	lhu	a5,74(s1)
    8000559c:	37fd                	addiw	a5,a5,-1
    8000559e:	04f49523          	sh	a5,74(s1)
    800055a2:	8526                	mv	a0,s1
    800055a4:	ffffe097          	auipc	ra,0xffffe
    800055a8:	1c6080e7          	jalr	454(ra) # 8000376a <iupdate>
    800055ac:	8526                	mv	a0,s1
    800055ae:	ffffe097          	auipc	ra,0xffffe
    800055b2:	4e8080e7          	jalr	1256(ra) # 80003a96 <iunlockput>
    800055b6:	fffff097          	auipc	ra,0xfffff
    800055ba:	cd0080e7          	jalr	-816(ra) # 80004286 <end_op>
    800055be:	57fd                	li	a5,-1
    800055c0:	853e                	mv	a0,a5
    800055c2:	70b2                	ld	ra,296(sp)
    800055c4:	7412                	ld	s0,288(sp)
    800055c6:	64f2                	ld	s1,280(sp)
    800055c8:	6952                	ld	s2,272(sp)
    800055ca:	6155                	addi	sp,sp,304
    800055cc:	8082                	ret

00000000800055ce <sys_unlink>:
    800055ce:	7151                	addi	sp,sp,-240
    800055d0:	f586                	sd	ra,232(sp)
    800055d2:	f1a2                	sd	s0,224(sp)
    800055d4:	eda6                	sd	s1,216(sp)
    800055d6:	e9ca                	sd	s2,208(sp)
    800055d8:	e5ce                	sd	s3,200(sp)
    800055da:	1980                	addi	s0,sp,240
    800055dc:	08000613          	li	a2,128
    800055e0:	f3040593          	addi	a1,s0,-208
    800055e4:	4501                	li	a0,0
    800055e6:	ffffd097          	auipc	ra,0xffffd
    800055ea:	678080e7          	jalr	1656(ra) # 80002c5e <argstr>
    800055ee:	18054163          	bltz	a0,80005770 <sys_unlink+0x1a2>
    800055f2:	fffff097          	auipc	ra,0xfffff
    800055f6:	c14080e7          	jalr	-1004(ra) # 80004206 <begin_op>
    800055fa:	fb040593          	addi	a1,s0,-80
    800055fe:	f3040513          	addi	a0,s0,-208
    80005602:	fffff097          	auipc	ra,0xfffff
    80005606:	a06080e7          	jalr	-1530(ra) # 80004008 <nameiparent>
    8000560a:	84aa                	mv	s1,a0
    8000560c:	c979                	beqz	a0,800056e2 <sys_unlink+0x114>
    8000560e:	ffffe097          	auipc	ra,0xffffe
    80005612:	226080e7          	jalr	550(ra) # 80003834 <ilock>
    80005616:	00003597          	auipc	a1,0x3
    8000561a:	1a258593          	addi	a1,a1,418 # 800087b8 <syscalls+0x2b8>
    8000561e:	fb040513          	addi	a0,s0,-80
    80005622:	ffffe097          	auipc	ra,0xffffe
    80005626:	6dc080e7          	jalr	1756(ra) # 80003cfe <namecmp>
    8000562a:	14050a63          	beqz	a0,8000577e <sys_unlink+0x1b0>
    8000562e:	00003597          	auipc	a1,0x3
    80005632:	19258593          	addi	a1,a1,402 # 800087c0 <syscalls+0x2c0>
    80005636:	fb040513          	addi	a0,s0,-80
    8000563a:	ffffe097          	auipc	ra,0xffffe
    8000563e:	6c4080e7          	jalr	1732(ra) # 80003cfe <namecmp>
    80005642:	12050e63          	beqz	a0,8000577e <sys_unlink+0x1b0>
    80005646:	f2c40613          	addi	a2,s0,-212
    8000564a:	fb040593          	addi	a1,s0,-80
    8000564e:	8526                	mv	a0,s1
    80005650:	ffffe097          	auipc	ra,0xffffe
    80005654:	6c8080e7          	jalr	1736(ra) # 80003d18 <dirlookup>
    80005658:	892a                	mv	s2,a0
    8000565a:	12050263          	beqz	a0,8000577e <sys_unlink+0x1b0>
    8000565e:	ffffe097          	auipc	ra,0xffffe
    80005662:	1d6080e7          	jalr	470(ra) # 80003834 <ilock>
    80005666:	04a91783          	lh	a5,74(s2)
    8000566a:	08f05263          	blez	a5,800056ee <sys_unlink+0x120>
    8000566e:	04491703          	lh	a4,68(s2)
    80005672:	4785                	li	a5,1
    80005674:	08f70563          	beq	a4,a5,800056fe <sys_unlink+0x130>
    80005678:	4641                	li	a2,16
    8000567a:	4581                	li	a1,0
    8000567c:	fc040513          	addi	a0,s0,-64
    80005680:	ffffb097          	auipc	ra,0xffffb
    80005684:	660080e7          	jalr	1632(ra) # 80000ce0 <memset>
    80005688:	4741                	li	a4,16
    8000568a:	f2c42683          	lw	a3,-212(s0)
    8000568e:	fc040613          	addi	a2,s0,-64
    80005692:	4581                	li	a1,0
    80005694:	8526                	mv	a0,s1
    80005696:	ffffe097          	auipc	ra,0xffffe
    8000569a:	54a080e7          	jalr	1354(ra) # 80003be0 <writei>
    8000569e:	47c1                	li	a5,16
    800056a0:	0af51563          	bne	a0,a5,8000574a <sys_unlink+0x17c>
    800056a4:	04491703          	lh	a4,68(s2)
    800056a8:	4785                	li	a5,1
    800056aa:	0af70863          	beq	a4,a5,8000575a <sys_unlink+0x18c>
    800056ae:	8526                	mv	a0,s1
    800056b0:	ffffe097          	auipc	ra,0xffffe
    800056b4:	3e6080e7          	jalr	998(ra) # 80003a96 <iunlockput>
    800056b8:	04a95783          	lhu	a5,74(s2)
    800056bc:	37fd                	addiw	a5,a5,-1
    800056be:	04f91523          	sh	a5,74(s2)
    800056c2:	854a                	mv	a0,s2
    800056c4:	ffffe097          	auipc	ra,0xffffe
    800056c8:	0a6080e7          	jalr	166(ra) # 8000376a <iupdate>
    800056cc:	854a                	mv	a0,s2
    800056ce:	ffffe097          	auipc	ra,0xffffe
    800056d2:	3c8080e7          	jalr	968(ra) # 80003a96 <iunlockput>
    800056d6:	fffff097          	auipc	ra,0xfffff
    800056da:	bb0080e7          	jalr	-1104(ra) # 80004286 <end_op>
    800056de:	4501                	li	a0,0
    800056e0:	a84d                	j	80005792 <sys_unlink+0x1c4>
    800056e2:	fffff097          	auipc	ra,0xfffff
    800056e6:	ba4080e7          	jalr	-1116(ra) # 80004286 <end_op>
    800056ea:	557d                	li	a0,-1
    800056ec:	a05d                	j	80005792 <sys_unlink+0x1c4>
    800056ee:	00003517          	auipc	a0,0x3
    800056f2:	0fa50513          	addi	a0,a0,250 # 800087e8 <syscalls+0x2e8>
    800056f6:	ffffb097          	auipc	ra,0xffffb
    800056fa:	e48080e7          	jalr	-440(ra) # 8000053e <panic>
    800056fe:	04c92703          	lw	a4,76(s2)
    80005702:	02000793          	li	a5,32
    80005706:	f6e7f9e3          	bgeu	a5,a4,80005678 <sys_unlink+0xaa>
    8000570a:	02000993          	li	s3,32
    8000570e:	4741                	li	a4,16
    80005710:	86ce                	mv	a3,s3
    80005712:	f1840613          	addi	a2,s0,-232
    80005716:	4581                	li	a1,0
    80005718:	854a                	mv	a0,s2
    8000571a:	ffffe097          	auipc	ra,0xffffe
    8000571e:	3ce080e7          	jalr	974(ra) # 80003ae8 <readi>
    80005722:	47c1                	li	a5,16
    80005724:	00f51b63          	bne	a0,a5,8000573a <sys_unlink+0x16c>
    80005728:	f1845783          	lhu	a5,-232(s0)
    8000572c:	e7a1                	bnez	a5,80005774 <sys_unlink+0x1a6>
    8000572e:	29c1                	addiw	s3,s3,16
    80005730:	04c92783          	lw	a5,76(s2)
    80005734:	fcf9ede3          	bltu	s3,a5,8000570e <sys_unlink+0x140>
    80005738:	b781                	j	80005678 <sys_unlink+0xaa>
    8000573a:	00003517          	auipc	a0,0x3
    8000573e:	0c650513          	addi	a0,a0,198 # 80008800 <syscalls+0x300>
    80005742:	ffffb097          	auipc	ra,0xffffb
    80005746:	dfc080e7          	jalr	-516(ra) # 8000053e <panic>
    8000574a:	00003517          	auipc	a0,0x3
    8000574e:	0ce50513          	addi	a0,a0,206 # 80008818 <syscalls+0x318>
    80005752:	ffffb097          	auipc	ra,0xffffb
    80005756:	dec080e7          	jalr	-532(ra) # 8000053e <panic>
    8000575a:	04a4d783          	lhu	a5,74(s1)
    8000575e:	37fd                	addiw	a5,a5,-1
    80005760:	04f49523          	sh	a5,74(s1)
    80005764:	8526                	mv	a0,s1
    80005766:	ffffe097          	auipc	ra,0xffffe
    8000576a:	004080e7          	jalr	4(ra) # 8000376a <iupdate>
    8000576e:	b781                	j	800056ae <sys_unlink+0xe0>
    80005770:	557d                	li	a0,-1
    80005772:	a005                	j	80005792 <sys_unlink+0x1c4>
    80005774:	854a                	mv	a0,s2
    80005776:	ffffe097          	auipc	ra,0xffffe
    8000577a:	320080e7          	jalr	800(ra) # 80003a96 <iunlockput>
    8000577e:	8526                	mv	a0,s1
    80005780:	ffffe097          	auipc	ra,0xffffe
    80005784:	316080e7          	jalr	790(ra) # 80003a96 <iunlockput>
    80005788:	fffff097          	auipc	ra,0xfffff
    8000578c:	afe080e7          	jalr	-1282(ra) # 80004286 <end_op>
    80005790:	557d                	li	a0,-1
    80005792:	70ae                	ld	ra,232(sp)
    80005794:	740e                	ld	s0,224(sp)
    80005796:	64ee                	ld	s1,216(sp)
    80005798:	694e                	ld	s2,208(sp)
    8000579a:	69ae                	ld	s3,200(sp)
    8000579c:	616d                	addi	sp,sp,240
    8000579e:	8082                	ret

00000000800057a0 <sys_open>:
    800057a0:	7131                	addi	sp,sp,-192
    800057a2:	fd06                	sd	ra,184(sp)
    800057a4:	f922                	sd	s0,176(sp)
    800057a6:	f526                	sd	s1,168(sp)
    800057a8:	f14a                	sd	s2,160(sp)
    800057aa:	ed4e                	sd	s3,152(sp)
    800057ac:	0180                	addi	s0,sp,192
    800057ae:	08000613          	li	a2,128
    800057b2:	f5040593          	addi	a1,s0,-176
    800057b6:	4501                	li	a0,0
    800057b8:	ffffd097          	auipc	ra,0xffffd
    800057bc:	4a6080e7          	jalr	1190(ra) # 80002c5e <argstr>
    800057c0:	54fd                	li	s1,-1
    800057c2:	0c054163          	bltz	a0,80005884 <sys_open+0xe4>
    800057c6:	f4c40593          	addi	a1,s0,-180
    800057ca:	4505                	li	a0,1
    800057cc:	ffffd097          	auipc	ra,0xffffd
    800057d0:	44e080e7          	jalr	1102(ra) # 80002c1a <argint>
    800057d4:	0a054863          	bltz	a0,80005884 <sys_open+0xe4>
    800057d8:	fffff097          	auipc	ra,0xfffff
    800057dc:	a2e080e7          	jalr	-1490(ra) # 80004206 <begin_op>
    800057e0:	f4c42783          	lw	a5,-180(s0)
    800057e4:	2007f793          	andi	a5,a5,512
    800057e8:	cbdd                	beqz	a5,8000589e <sys_open+0xfe>
    800057ea:	4681                	li	a3,0
    800057ec:	4601                	li	a2,0
    800057ee:	4589                	li	a1,2
    800057f0:	f5040513          	addi	a0,s0,-176
    800057f4:	00000097          	auipc	ra,0x0
    800057f8:	972080e7          	jalr	-1678(ra) # 80005166 <create>
    800057fc:	892a                	mv	s2,a0
    800057fe:	c959                	beqz	a0,80005894 <sys_open+0xf4>
    80005800:	04491703          	lh	a4,68(s2)
    80005804:	478d                	li	a5,3
    80005806:	00f71763          	bne	a4,a5,80005814 <sys_open+0x74>
    8000580a:	04695703          	lhu	a4,70(s2)
    8000580e:	47a5                	li	a5,9
    80005810:	0ce7ec63          	bltu	a5,a4,800058e8 <sys_open+0x148>
    80005814:	fffff097          	auipc	ra,0xfffff
    80005818:	e02080e7          	jalr	-510(ra) # 80004616 <filealloc>
    8000581c:	89aa                	mv	s3,a0
    8000581e:	10050263          	beqz	a0,80005922 <sys_open+0x182>
    80005822:	00000097          	auipc	ra,0x0
    80005826:	902080e7          	jalr	-1790(ra) # 80005124 <fdalloc>
    8000582a:	84aa                	mv	s1,a0
    8000582c:	0e054663          	bltz	a0,80005918 <sys_open+0x178>
    80005830:	04491703          	lh	a4,68(s2)
    80005834:	478d                	li	a5,3
    80005836:	0cf70463          	beq	a4,a5,800058fe <sys_open+0x15e>
    8000583a:	4789                	li	a5,2
    8000583c:	00f9a023          	sw	a5,0(s3)
    80005840:	0209a023          	sw	zero,32(s3)
    80005844:	0129bc23          	sd	s2,24(s3)
    80005848:	f4c42783          	lw	a5,-180(s0)
    8000584c:	0017c713          	xori	a4,a5,1
    80005850:	8b05                	andi	a4,a4,1
    80005852:	00e98423          	sb	a4,8(s3)
    80005856:	0037f713          	andi	a4,a5,3
    8000585a:	00e03733          	snez	a4,a4
    8000585e:	00e984a3          	sb	a4,9(s3)
    80005862:	4007f793          	andi	a5,a5,1024
    80005866:	c791                	beqz	a5,80005872 <sys_open+0xd2>
    80005868:	04491703          	lh	a4,68(s2)
    8000586c:	4789                	li	a5,2
    8000586e:	08f70f63          	beq	a4,a5,8000590c <sys_open+0x16c>
    80005872:	854a                	mv	a0,s2
    80005874:	ffffe097          	auipc	ra,0xffffe
    80005878:	082080e7          	jalr	130(ra) # 800038f6 <iunlock>
    8000587c:	fffff097          	auipc	ra,0xfffff
    80005880:	a0a080e7          	jalr	-1526(ra) # 80004286 <end_op>
    80005884:	8526                	mv	a0,s1
    80005886:	70ea                	ld	ra,184(sp)
    80005888:	744a                	ld	s0,176(sp)
    8000588a:	74aa                	ld	s1,168(sp)
    8000588c:	790a                	ld	s2,160(sp)
    8000588e:	69ea                	ld	s3,152(sp)
    80005890:	6129                	addi	sp,sp,192
    80005892:	8082                	ret
    80005894:	fffff097          	auipc	ra,0xfffff
    80005898:	9f2080e7          	jalr	-1550(ra) # 80004286 <end_op>
    8000589c:	b7e5                	j	80005884 <sys_open+0xe4>
    8000589e:	f5040513          	addi	a0,s0,-176
    800058a2:	ffffe097          	auipc	ra,0xffffe
    800058a6:	748080e7          	jalr	1864(ra) # 80003fea <namei>
    800058aa:	892a                	mv	s2,a0
    800058ac:	c905                	beqz	a0,800058dc <sys_open+0x13c>
    800058ae:	ffffe097          	auipc	ra,0xffffe
    800058b2:	f86080e7          	jalr	-122(ra) # 80003834 <ilock>
    800058b6:	04491703          	lh	a4,68(s2)
    800058ba:	4785                	li	a5,1
    800058bc:	f4f712e3          	bne	a4,a5,80005800 <sys_open+0x60>
    800058c0:	f4c42783          	lw	a5,-180(s0)
    800058c4:	dba1                	beqz	a5,80005814 <sys_open+0x74>
    800058c6:	854a                	mv	a0,s2
    800058c8:	ffffe097          	auipc	ra,0xffffe
    800058cc:	1ce080e7          	jalr	462(ra) # 80003a96 <iunlockput>
    800058d0:	fffff097          	auipc	ra,0xfffff
    800058d4:	9b6080e7          	jalr	-1610(ra) # 80004286 <end_op>
    800058d8:	54fd                	li	s1,-1
    800058da:	b76d                	j	80005884 <sys_open+0xe4>
    800058dc:	fffff097          	auipc	ra,0xfffff
    800058e0:	9aa080e7          	jalr	-1622(ra) # 80004286 <end_op>
    800058e4:	54fd                	li	s1,-1
    800058e6:	bf79                	j	80005884 <sys_open+0xe4>
    800058e8:	854a                	mv	a0,s2
    800058ea:	ffffe097          	auipc	ra,0xffffe
    800058ee:	1ac080e7          	jalr	428(ra) # 80003a96 <iunlockput>
    800058f2:	fffff097          	auipc	ra,0xfffff
    800058f6:	994080e7          	jalr	-1644(ra) # 80004286 <end_op>
    800058fa:	54fd                	li	s1,-1
    800058fc:	b761                	j	80005884 <sys_open+0xe4>
    800058fe:	00f9a023          	sw	a5,0(s3)
    80005902:	04691783          	lh	a5,70(s2)
    80005906:	02f99223          	sh	a5,36(s3)
    8000590a:	bf2d                	j	80005844 <sys_open+0xa4>
    8000590c:	854a                	mv	a0,s2
    8000590e:	ffffe097          	auipc	ra,0xffffe
    80005912:	034080e7          	jalr	52(ra) # 80003942 <itrunc>
    80005916:	bfb1                	j	80005872 <sys_open+0xd2>
    80005918:	854e                	mv	a0,s3
    8000591a:	fffff097          	auipc	ra,0xfffff
    8000591e:	db8080e7          	jalr	-584(ra) # 800046d2 <fileclose>
    80005922:	854a                	mv	a0,s2
    80005924:	ffffe097          	auipc	ra,0xffffe
    80005928:	172080e7          	jalr	370(ra) # 80003a96 <iunlockput>
    8000592c:	fffff097          	auipc	ra,0xfffff
    80005930:	95a080e7          	jalr	-1702(ra) # 80004286 <end_op>
    80005934:	54fd                	li	s1,-1
    80005936:	b7b9                	j	80005884 <sys_open+0xe4>

0000000080005938 <sys_mkdir>:
    80005938:	7175                	addi	sp,sp,-144
    8000593a:	e506                	sd	ra,136(sp)
    8000593c:	e122                	sd	s0,128(sp)
    8000593e:	0900                	addi	s0,sp,144
    80005940:	fffff097          	auipc	ra,0xfffff
    80005944:	8c6080e7          	jalr	-1850(ra) # 80004206 <begin_op>
    80005948:	08000613          	li	a2,128
    8000594c:	f7040593          	addi	a1,s0,-144
    80005950:	4501                	li	a0,0
    80005952:	ffffd097          	auipc	ra,0xffffd
    80005956:	30c080e7          	jalr	780(ra) # 80002c5e <argstr>
    8000595a:	02054963          	bltz	a0,8000598c <sys_mkdir+0x54>
    8000595e:	4681                	li	a3,0
    80005960:	4601                	li	a2,0
    80005962:	4585                	li	a1,1
    80005964:	f7040513          	addi	a0,s0,-144
    80005968:	fffff097          	auipc	ra,0xfffff
    8000596c:	7fe080e7          	jalr	2046(ra) # 80005166 <create>
    80005970:	cd11                	beqz	a0,8000598c <sys_mkdir+0x54>
    80005972:	ffffe097          	auipc	ra,0xffffe
    80005976:	124080e7          	jalr	292(ra) # 80003a96 <iunlockput>
    8000597a:	fffff097          	auipc	ra,0xfffff
    8000597e:	90c080e7          	jalr	-1780(ra) # 80004286 <end_op>
    80005982:	4501                	li	a0,0
    80005984:	60aa                	ld	ra,136(sp)
    80005986:	640a                	ld	s0,128(sp)
    80005988:	6149                	addi	sp,sp,144
    8000598a:	8082                	ret
    8000598c:	fffff097          	auipc	ra,0xfffff
    80005990:	8fa080e7          	jalr	-1798(ra) # 80004286 <end_op>
    80005994:	557d                	li	a0,-1
    80005996:	b7fd                	j	80005984 <sys_mkdir+0x4c>

0000000080005998 <sys_mknod>:
    80005998:	7135                	addi	sp,sp,-160
    8000599a:	ed06                	sd	ra,152(sp)
    8000599c:	e922                	sd	s0,144(sp)
    8000599e:	1100                	addi	s0,sp,160
    800059a0:	fffff097          	auipc	ra,0xfffff
    800059a4:	866080e7          	jalr	-1946(ra) # 80004206 <begin_op>
    800059a8:	08000613          	li	a2,128
    800059ac:	f7040593          	addi	a1,s0,-144
    800059b0:	4501                	li	a0,0
    800059b2:	ffffd097          	auipc	ra,0xffffd
    800059b6:	2ac080e7          	jalr	684(ra) # 80002c5e <argstr>
    800059ba:	04054a63          	bltz	a0,80005a0e <sys_mknod+0x76>
    800059be:	f6c40593          	addi	a1,s0,-148
    800059c2:	4505                	li	a0,1
    800059c4:	ffffd097          	auipc	ra,0xffffd
    800059c8:	256080e7          	jalr	598(ra) # 80002c1a <argint>
    800059cc:	04054163          	bltz	a0,80005a0e <sys_mknod+0x76>
    800059d0:	f6840593          	addi	a1,s0,-152
    800059d4:	4509                	li	a0,2
    800059d6:	ffffd097          	auipc	ra,0xffffd
    800059da:	244080e7          	jalr	580(ra) # 80002c1a <argint>
    800059de:	02054863          	bltz	a0,80005a0e <sys_mknod+0x76>
    800059e2:	f6841683          	lh	a3,-152(s0)
    800059e6:	f6c41603          	lh	a2,-148(s0)
    800059ea:	458d                	li	a1,3
    800059ec:	f7040513          	addi	a0,s0,-144
    800059f0:	fffff097          	auipc	ra,0xfffff
    800059f4:	776080e7          	jalr	1910(ra) # 80005166 <create>
    800059f8:	c919                	beqz	a0,80005a0e <sys_mknod+0x76>
    800059fa:	ffffe097          	auipc	ra,0xffffe
    800059fe:	09c080e7          	jalr	156(ra) # 80003a96 <iunlockput>
    80005a02:	fffff097          	auipc	ra,0xfffff
    80005a06:	884080e7          	jalr	-1916(ra) # 80004286 <end_op>
    80005a0a:	4501                	li	a0,0
    80005a0c:	a031                	j	80005a18 <sys_mknod+0x80>
    80005a0e:	fffff097          	auipc	ra,0xfffff
    80005a12:	878080e7          	jalr	-1928(ra) # 80004286 <end_op>
    80005a16:	557d                	li	a0,-1
    80005a18:	60ea                	ld	ra,152(sp)
    80005a1a:	644a                	ld	s0,144(sp)
    80005a1c:	610d                	addi	sp,sp,160
    80005a1e:	8082                	ret

0000000080005a20 <sys_chdir>:
    80005a20:	7135                	addi	sp,sp,-160
    80005a22:	ed06                	sd	ra,152(sp)
    80005a24:	e922                	sd	s0,144(sp)
    80005a26:	e526                	sd	s1,136(sp)
    80005a28:	e14a                	sd	s2,128(sp)
    80005a2a:	1100                	addi	s0,sp,160
    80005a2c:	ffffc097          	auipc	ra,0xffffc
    80005a30:	f84080e7          	jalr	-124(ra) # 800019b0 <myproc>
    80005a34:	892a                	mv	s2,a0
    80005a36:	ffffe097          	auipc	ra,0xffffe
    80005a3a:	7d0080e7          	jalr	2000(ra) # 80004206 <begin_op>
    80005a3e:	08000613          	li	a2,128
    80005a42:	f6040593          	addi	a1,s0,-160
    80005a46:	4501                	li	a0,0
    80005a48:	ffffd097          	auipc	ra,0xffffd
    80005a4c:	216080e7          	jalr	534(ra) # 80002c5e <argstr>
    80005a50:	04054b63          	bltz	a0,80005aa6 <sys_chdir+0x86>
    80005a54:	f6040513          	addi	a0,s0,-160
    80005a58:	ffffe097          	auipc	ra,0xffffe
    80005a5c:	592080e7          	jalr	1426(ra) # 80003fea <namei>
    80005a60:	84aa                	mv	s1,a0
    80005a62:	c131                	beqz	a0,80005aa6 <sys_chdir+0x86>
    80005a64:	ffffe097          	auipc	ra,0xffffe
    80005a68:	dd0080e7          	jalr	-560(ra) # 80003834 <ilock>
    80005a6c:	04449703          	lh	a4,68(s1)
    80005a70:	4785                	li	a5,1
    80005a72:	04f71063          	bne	a4,a5,80005ab2 <sys_chdir+0x92>
    80005a76:	8526                	mv	a0,s1
    80005a78:	ffffe097          	auipc	ra,0xffffe
    80005a7c:	e7e080e7          	jalr	-386(ra) # 800038f6 <iunlock>
    80005a80:	15093503          	ld	a0,336(s2)
    80005a84:	ffffe097          	auipc	ra,0xffffe
    80005a88:	f6a080e7          	jalr	-150(ra) # 800039ee <iput>
    80005a8c:	ffffe097          	auipc	ra,0xffffe
    80005a90:	7fa080e7          	jalr	2042(ra) # 80004286 <end_op>
    80005a94:	14993823          	sd	s1,336(s2)
    80005a98:	4501                	li	a0,0
    80005a9a:	60ea                	ld	ra,152(sp)
    80005a9c:	644a                	ld	s0,144(sp)
    80005a9e:	64aa                	ld	s1,136(sp)
    80005aa0:	690a                	ld	s2,128(sp)
    80005aa2:	610d                	addi	sp,sp,160
    80005aa4:	8082                	ret
    80005aa6:	ffffe097          	auipc	ra,0xffffe
    80005aaa:	7e0080e7          	jalr	2016(ra) # 80004286 <end_op>
    80005aae:	557d                	li	a0,-1
    80005ab0:	b7ed                	j	80005a9a <sys_chdir+0x7a>
    80005ab2:	8526                	mv	a0,s1
    80005ab4:	ffffe097          	auipc	ra,0xffffe
    80005ab8:	fe2080e7          	jalr	-30(ra) # 80003a96 <iunlockput>
    80005abc:	ffffe097          	auipc	ra,0xffffe
    80005ac0:	7ca080e7          	jalr	1994(ra) # 80004286 <end_op>
    80005ac4:	557d                	li	a0,-1
    80005ac6:	bfd1                	j	80005a9a <sys_chdir+0x7a>

0000000080005ac8 <sys_exec>:
    80005ac8:	7145                	addi	sp,sp,-464
    80005aca:	e786                	sd	ra,456(sp)
    80005acc:	e3a2                	sd	s0,448(sp)
    80005ace:	ff26                	sd	s1,440(sp)
    80005ad0:	fb4a                	sd	s2,432(sp)
    80005ad2:	f74e                	sd	s3,424(sp)
    80005ad4:	f352                	sd	s4,416(sp)
    80005ad6:	ef56                	sd	s5,408(sp)
    80005ad8:	0b80                	addi	s0,sp,464
    80005ada:	08000613          	li	a2,128
    80005ade:	f4040593          	addi	a1,s0,-192
    80005ae2:	4501                	li	a0,0
    80005ae4:	ffffd097          	auipc	ra,0xffffd
    80005ae8:	17a080e7          	jalr	378(ra) # 80002c5e <argstr>
    80005aec:	597d                	li	s2,-1
    80005aee:	0c054a63          	bltz	a0,80005bc2 <sys_exec+0xfa>
    80005af2:	e3840593          	addi	a1,s0,-456
    80005af6:	4505                	li	a0,1
    80005af8:	ffffd097          	auipc	ra,0xffffd
    80005afc:	144080e7          	jalr	324(ra) # 80002c3c <argaddr>
    80005b00:	0c054163          	bltz	a0,80005bc2 <sys_exec+0xfa>
    80005b04:	10000613          	li	a2,256
    80005b08:	4581                	li	a1,0
    80005b0a:	e4040513          	addi	a0,s0,-448
    80005b0e:	ffffb097          	auipc	ra,0xffffb
    80005b12:	1d2080e7          	jalr	466(ra) # 80000ce0 <memset>
    80005b16:	e4040493          	addi	s1,s0,-448
    80005b1a:	89a6                	mv	s3,s1
    80005b1c:	4901                	li	s2,0
    80005b1e:	02000a13          	li	s4,32
    80005b22:	00090a9b          	sext.w	s5,s2
    80005b26:	00391513          	slli	a0,s2,0x3
    80005b2a:	e3040593          	addi	a1,s0,-464
    80005b2e:	e3843783          	ld	a5,-456(s0)
    80005b32:	953e                	add	a0,a0,a5
    80005b34:	ffffd097          	auipc	ra,0xffffd
    80005b38:	04c080e7          	jalr	76(ra) # 80002b80 <fetchaddr>
    80005b3c:	02054a63          	bltz	a0,80005b70 <sys_exec+0xa8>
    80005b40:	e3043783          	ld	a5,-464(s0)
    80005b44:	c3b9                	beqz	a5,80005b8a <sys_exec+0xc2>
    80005b46:	ffffb097          	auipc	ra,0xffffb
    80005b4a:	fae080e7          	jalr	-82(ra) # 80000af4 <kalloc>
    80005b4e:	85aa                	mv	a1,a0
    80005b50:	00a9b023          	sd	a0,0(s3)
    80005b54:	cd11                	beqz	a0,80005b70 <sys_exec+0xa8>
    80005b56:	6605                	lui	a2,0x1
    80005b58:	e3043503          	ld	a0,-464(s0)
    80005b5c:	ffffd097          	auipc	ra,0xffffd
    80005b60:	076080e7          	jalr	118(ra) # 80002bd2 <fetchstr>
    80005b64:	00054663          	bltz	a0,80005b70 <sys_exec+0xa8>
    80005b68:	0905                	addi	s2,s2,1
    80005b6a:	09a1                	addi	s3,s3,8
    80005b6c:	fb491be3          	bne	s2,s4,80005b22 <sys_exec+0x5a>
    80005b70:	10048913          	addi	s2,s1,256
    80005b74:	6088                	ld	a0,0(s1)
    80005b76:	c529                	beqz	a0,80005bc0 <sys_exec+0xf8>
    80005b78:	ffffb097          	auipc	ra,0xffffb
    80005b7c:	e80080e7          	jalr	-384(ra) # 800009f8 <kfree>
    80005b80:	04a1                	addi	s1,s1,8
    80005b82:	ff2499e3          	bne	s1,s2,80005b74 <sys_exec+0xac>
    80005b86:	597d                	li	s2,-1
    80005b88:	a82d                	j	80005bc2 <sys_exec+0xfa>
    80005b8a:	0a8e                	slli	s5,s5,0x3
    80005b8c:	fc040793          	addi	a5,s0,-64
    80005b90:	9abe                	add	s5,s5,a5
    80005b92:	e80ab023          	sd	zero,-384(s5)
    80005b96:	e4040593          	addi	a1,s0,-448
    80005b9a:	f4040513          	addi	a0,s0,-192
    80005b9e:	fffff097          	auipc	ra,0xfffff
    80005ba2:	194080e7          	jalr	404(ra) # 80004d32 <exec>
    80005ba6:	892a                	mv	s2,a0
    80005ba8:	10048993          	addi	s3,s1,256
    80005bac:	6088                	ld	a0,0(s1)
    80005bae:	c911                	beqz	a0,80005bc2 <sys_exec+0xfa>
    80005bb0:	ffffb097          	auipc	ra,0xffffb
    80005bb4:	e48080e7          	jalr	-440(ra) # 800009f8 <kfree>
    80005bb8:	04a1                	addi	s1,s1,8
    80005bba:	ff3499e3          	bne	s1,s3,80005bac <sys_exec+0xe4>
    80005bbe:	a011                	j	80005bc2 <sys_exec+0xfa>
    80005bc0:	597d                	li	s2,-1
    80005bc2:	854a                	mv	a0,s2
    80005bc4:	60be                	ld	ra,456(sp)
    80005bc6:	641e                	ld	s0,448(sp)
    80005bc8:	74fa                	ld	s1,440(sp)
    80005bca:	795a                	ld	s2,432(sp)
    80005bcc:	79ba                	ld	s3,424(sp)
    80005bce:	7a1a                	ld	s4,416(sp)
    80005bd0:	6afa                	ld	s5,408(sp)
    80005bd2:	6179                	addi	sp,sp,464
    80005bd4:	8082                	ret

0000000080005bd6 <sys_pipe>:
    80005bd6:	7139                	addi	sp,sp,-64
    80005bd8:	fc06                	sd	ra,56(sp)
    80005bda:	f822                	sd	s0,48(sp)
    80005bdc:	f426                	sd	s1,40(sp)
    80005bde:	0080                	addi	s0,sp,64
    80005be0:	ffffc097          	auipc	ra,0xffffc
    80005be4:	dd0080e7          	jalr	-560(ra) # 800019b0 <myproc>
    80005be8:	84aa                	mv	s1,a0
    80005bea:	fd840593          	addi	a1,s0,-40
    80005bee:	4501                	li	a0,0
    80005bf0:	ffffd097          	auipc	ra,0xffffd
    80005bf4:	04c080e7          	jalr	76(ra) # 80002c3c <argaddr>
    80005bf8:	57fd                	li	a5,-1
    80005bfa:	0e054063          	bltz	a0,80005cda <sys_pipe+0x104>
    80005bfe:	fc840593          	addi	a1,s0,-56
    80005c02:	fd040513          	addi	a0,s0,-48
    80005c06:	fffff097          	auipc	ra,0xfffff
    80005c0a:	dfc080e7          	jalr	-516(ra) # 80004a02 <pipealloc>
    80005c0e:	57fd                	li	a5,-1
    80005c10:	0c054563          	bltz	a0,80005cda <sys_pipe+0x104>
    80005c14:	fcf42223          	sw	a5,-60(s0)
    80005c18:	fd043503          	ld	a0,-48(s0)
    80005c1c:	fffff097          	auipc	ra,0xfffff
    80005c20:	508080e7          	jalr	1288(ra) # 80005124 <fdalloc>
    80005c24:	fca42223          	sw	a0,-60(s0)
    80005c28:	08054c63          	bltz	a0,80005cc0 <sys_pipe+0xea>
    80005c2c:	fc843503          	ld	a0,-56(s0)
    80005c30:	fffff097          	auipc	ra,0xfffff
    80005c34:	4f4080e7          	jalr	1268(ra) # 80005124 <fdalloc>
    80005c38:	fca42023          	sw	a0,-64(s0)
    80005c3c:	06054863          	bltz	a0,80005cac <sys_pipe+0xd6>
    80005c40:	4691                	li	a3,4
    80005c42:	fc440613          	addi	a2,s0,-60
    80005c46:	fd843583          	ld	a1,-40(s0)
    80005c4a:	68a8                	ld	a0,80(s1)
    80005c4c:	ffffc097          	auipc	ra,0xffffc
    80005c50:	a26080e7          	jalr	-1498(ra) # 80001672 <copyout>
    80005c54:	02054063          	bltz	a0,80005c74 <sys_pipe+0x9e>
    80005c58:	4691                	li	a3,4
    80005c5a:	fc040613          	addi	a2,s0,-64
    80005c5e:	fd843583          	ld	a1,-40(s0)
    80005c62:	0591                	addi	a1,a1,4
    80005c64:	68a8                	ld	a0,80(s1)
    80005c66:	ffffc097          	auipc	ra,0xffffc
    80005c6a:	a0c080e7          	jalr	-1524(ra) # 80001672 <copyout>
    80005c6e:	4781                	li	a5,0
    80005c70:	06055563          	bgez	a0,80005cda <sys_pipe+0x104>
    80005c74:	fc442783          	lw	a5,-60(s0)
    80005c78:	07e9                	addi	a5,a5,26
    80005c7a:	078e                	slli	a5,a5,0x3
    80005c7c:	97a6                	add	a5,a5,s1
    80005c7e:	0007b023          	sd	zero,0(a5)
    80005c82:	fc042503          	lw	a0,-64(s0)
    80005c86:	0569                	addi	a0,a0,26
    80005c88:	050e                	slli	a0,a0,0x3
    80005c8a:	9526                	add	a0,a0,s1
    80005c8c:	00053023          	sd	zero,0(a0)
    80005c90:	fd043503          	ld	a0,-48(s0)
    80005c94:	fffff097          	auipc	ra,0xfffff
    80005c98:	a3e080e7          	jalr	-1474(ra) # 800046d2 <fileclose>
    80005c9c:	fc843503          	ld	a0,-56(s0)
    80005ca0:	fffff097          	auipc	ra,0xfffff
    80005ca4:	a32080e7          	jalr	-1486(ra) # 800046d2 <fileclose>
    80005ca8:	57fd                	li	a5,-1
    80005caa:	a805                	j	80005cda <sys_pipe+0x104>
    80005cac:	fc442783          	lw	a5,-60(s0)
    80005cb0:	0007c863          	bltz	a5,80005cc0 <sys_pipe+0xea>
    80005cb4:	01a78513          	addi	a0,a5,26
    80005cb8:	050e                	slli	a0,a0,0x3
    80005cba:	9526                	add	a0,a0,s1
    80005cbc:	00053023          	sd	zero,0(a0)
    80005cc0:	fd043503          	ld	a0,-48(s0)
    80005cc4:	fffff097          	auipc	ra,0xfffff
    80005cc8:	a0e080e7          	jalr	-1522(ra) # 800046d2 <fileclose>
    80005ccc:	fc843503          	ld	a0,-56(s0)
    80005cd0:	fffff097          	auipc	ra,0xfffff
    80005cd4:	a02080e7          	jalr	-1534(ra) # 800046d2 <fileclose>
    80005cd8:	57fd                	li	a5,-1
    80005cda:	853e                	mv	a0,a5
    80005cdc:	70e2                	ld	ra,56(sp)
    80005cde:	7442                	ld	s0,48(sp)
    80005ce0:	74a2                	ld	s1,40(sp)
    80005ce2:	6121                	addi	sp,sp,64
    80005ce4:	8082                	ret
	...

0000000080005cf0 <kernelvec>:
    80005cf0:	7111                	addi	sp,sp,-256
    80005cf2:	e006                	sd	ra,0(sp)
    80005cf4:	e40a                	sd	sp,8(sp)
    80005cf6:	e80e                	sd	gp,16(sp)
    80005cf8:	ec12                	sd	tp,24(sp)
    80005cfa:	f016                	sd	t0,32(sp)
    80005cfc:	f41a                	sd	t1,40(sp)
    80005cfe:	f81e                	sd	t2,48(sp)
    80005d00:	fc22                	sd	s0,56(sp)
    80005d02:	e0a6                	sd	s1,64(sp)
    80005d04:	e4aa                	sd	a0,72(sp)
    80005d06:	e8ae                	sd	a1,80(sp)
    80005d08:	ecb2                	sd	a2,88(sp)
    80005d0a:	f0b6                	sd	a3,96(sp)
    80005d0c:	f4ba                	sd	a4,104(sp)
    80005d0e:	f8be                	sd	a5,112(sp)
    80005d10:	fcc2                	sd	a6,120(sp)
    80005d12:	e146                	sd	a7,128(sp)
    80005d14:	e54a                	sd	s2,136(sp)
    80005d16:	e94e                	sd	s3,144(sp)
    80005d18:	ed52                	sd	s4,152(sp)
    80005d1a:	f156                	sd	s5,160(sp)
    80005d1c:	f55a                	sd	s6,168(sp)
    80005d1e:	f95e                	sd	s7,176(sp)
    80005d20:	fd62                	sd	s8,184(sp)
    80005d22:	e1e6                	sd	s9,192(sp)
    80005d24:	e5ea                	sd	s10,200(sp)
    80005d26:	e9ee                	sd	s11,208(sp)
    80005d28:	edf2                	sd	t3,216(sp)
    80005d2a:	f1f6                	sd	t4,224(sp)
    80005d2c:	f5fa                	sd	t5,232(sp)
    80005d2e:	f9fe                	sd	t6,240(sp)
    80005d30:	d1dfc0ef          	jal	ra,80002a4c <kerneltrap>
    80005d34:	6082                	ld	ra,0(sp)
    80005d36:	6122                	ld	sp,8(sp)
    80005d38:	61c2                	ld	gp,16(sp)
    80005d3a:	7282                	ld	t0,32(sp)
    80005d3c:	7322                	ld	t1,40(sp)
    80005d3e:	73c2                	ld	t2,48(sp)
    80005d40:	7462                	ld	s0,56(sp)
    80005d42:	6486                	ld	s1,64(sp)
    80005d44:	6526                	ld	a0,72(sp)
    80005d46:	65c6                	ld	a1,80(sp)
    80005d48:	6666                	ld	a2,88(sp)
    80005d4a:	7686                	ld	a3,96(sp)
    80005d4c:	7726                	ld	a4,104(sp)
    80005d4e:	77c6                	ld	a5,112(sp)
    80005d50:	7866                	ld	a6,120(sp)
    80005d52:	688a                	ld	a7,128(sp)
    80005d54:	692a                	ld	s2,136(sp)
    80005d56:	69ca                	ld	s3,144(sp)
    80005d58:	6a6a                	ld	s4,152(sp)
    80005d5a:	7a8a                	ld	s5,160(sp)
    80005d5c:	7b2a                	ld	s6,168(sp)
    80005d5e:	7bca                	ld	s7,176(sp)
    80005d60:	7c6a                	ld	s8,184(sp)
    80005d62:	6c8e                	ld	s9,192(sp)
    80005d64:	6d2e                	ld	s10,200(sp)
    80005d66:	6dce                	ld	s11,208(sp)
    80005d68:	6e6e                	ld	t3,216(sp)
    80005d6a:	7e8e                	ld	t4,224(sp)
    80005d6c:	7f2e                	ld	t5,232(sp)
    80005d6e:	7fce                	ld	t6,240(sp)
    80005d70:	6111                	addi	sp,sp,256
    80005d72:	10200073          	sret
    80005d76:	00000013          	nop
    80005d7a:	00000013          	nop
    80005d7e:	0001                	nop

0000000080005d80 <timervec>:
    80005d80:	34051573          	csrrw	a0,mscratch,a0
    80005d84:	e10c                	sd	a1,0(a0)
    80005d86:	e510                	sd	a2,8(a0)
    80005d88:	e914                	sd	a3,16(a0)
    80005d8a:	6d0c                	ld	a1,24(a0)
    80005d8c:	7110                	ld	a2,32(a0)
    80005d8e:	6194                	ld	a3,0(a1)
    80005d90:	96b2                	add	a3,a3,a2
    80005d92:	e194                	sd	a3,0(a1)
    80005d94:	4589                	li	a1,2
    80005d96:	14459073          	csrw	sip,a1
    80005d9a:	6914                	ld	a3,16(a0)
    80005d9c:	6510                	ld	a2,8(a0)
    80005d9e:	610c                	ld	a1,0(a0)
    80005da0:	34051573          	csrrw	a0,mscratch,a0
    80005da4:	30200073          	mret
	...

0000000080005daa <plicinit>:
    80005daa:	1141                	addi	sp,sp,-16
    80005dac:	e422                	sd	s0,8(sp)
    80005dae:	0800                	addi	s0,sp,16
    80005db0:	0c0007b7          	lui	a5,0xc000
    80005db4:	4705                	li	a4,1
    80005db6:	d798                	sw	a4,40(a5)
    80005db8:	c3d8                	sw	a4,4(a5)
    80005dba:	6422                	ld	s0,8(sp)
    80005dbc:	0141                	addi	sp,sp,16
    80005dbe:	8082                	ret

0000000080005dc0 <plicinithart>:
    80005dc0:	1141                	addi	sp,sp,-16
    80005dc2:	e406                	sd	ra,8(sp)
    80005dc4:	e022                	sd	s0,0(sp)
    80005dc6:	0800                	addi	s0,sp,16
    80005dc8:	ffffc097          	auipc	ra,0xffffc
    80005dcc:	bbc080e7          	jalr	-1092(ra) # 80001984 <cpuid>
    80005dd0:	0085171b          	slliw	a4,a0,0x8
    80005dd4:	0c0027b7          	lui	a5,0xc002
    80005dd8:	97ba                	add	a5,a5,a4
    80005dda:	40200713          	li	a4,1026
    80005dde:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005de2:	00d5151b          	slliw	a0,a0,0xd
    80005de6:	0c2017b7          	lui	a5,0xc201
    80005dea:	953e                	add	a0,a0,a5
    80005dec:	00052023          	sw	zero,0(a0)
    80005df0:	60a2                	ld	ra,8(sp)
    80005df2:	6402                	ld	s0,0(sp)
    80005df4:	0141                	addi	sp,sp,16
    80005df6:	8082                	ret

0000000080005df8 <plic_claim>:
    80005df8:	1141                	addi	sp,sp,-16
    80005dfa:	e406                	sd	ra,8(sp)
    80005dfc:	e022                	sd	s0,0(sp)
    80005dfe:	0800                	addi	s0,sp,16
    80005e00:	ffffc097          	auipc	ra,0xffffc
    80005e04:	b84080e7          	jalr	-1148(ra) # 80001984 <cpuid>
    80005e08:	00d5179b          	slliw	a5,a0,0xd
    80005e0c:	0c201537          	lui	a0,0xc201
    80005e10:	953e                	add	a0,a0,a5
    80005e12:	4148                	lw	a0,4(a0)
    80005e14:	60a2                	ld	ra,8(sp)
    80005e16:	6402                	ld	s0,0(sp)
    80005e18:	0141                	addi	sp,sp,16
    80005e1a:	8082                	ret

0000000080005e1c <plic_complete>:
    80005e1c:	1101                	addi	sp,sp,-32
    80005e1e:	ec06                	sd	ra,24(sp)
    80005e20:	e822                	sd	s0,16(sp)
    80005e22:	e426                	sd	s1,8(sp)
    80005e24:	1000                	addi	s0,sp,32
    80005e26:	84aa                	mv	s1,a0
    80005e28:	ffffc097          	auipc	ra,0xffffc
    80005e2c:	b5c080e7          	jalr	-1188(ra) # 80001984 <cpuid>
    80005e30:	00d5151b          	slliw	a0,a0,0xd
    80005e34:	0c2017b7          	lui	a5,0xc201
    80005e38:	97aa                	add	a5,a5,a0
    80005e3a:	c3c4                	sw	s1,4(a5)
    80005e3c:	60e2                	ld	ra,24(sp)
    80005e3e:	6442                	ld	s0,16(sp)
    80005e40:	64a2                	ld	s1,8(sp)
    80005e42:	6105                	addi	sp,sp,32
    80005e44:	8082                	ret

0000000080005e46 <free_desc>:
    80005e46:	1141                	addi	sp,sp,-16
    80005e48:	e406                	sd	ra,8(sp)
    80005e4a:	e022                	sd	s0,0(sp)
    80005e4c:	0800                	addi	s0,sp,16
    80005e4e:	479d                	li	a5,7
    80005e50:	06a7c963          	blt	a5,a0,80005ec2 <free_desc+0x7c>
    80005e54:	0001d797          	auipc	a5,0x1d
    80005e58:	1ac78793          	addi	a5,a5,428 # 80023000 <disk>
    80005e5c:	00a78733          	add	a4,a5,a0
    80005e60:	6789                	lui	a5,0x2
    80005e62:	97ba                	add	a5,a5,a4
    80005e64:	0187c783          	lbu	a5,24(a5) # 2018 <_entry-0x7fffdfe8>
    80005e68:	e7ad                	bnez	a5,80005ed2 <free_desc+0x8c>
    80005e6a:	00451793          	slli	a5,a0,0x4
    80005e6e:	0001f717          	auipc	a4,0x1f
    80005e72:	19270713          	addi	a4,a4,402 # 80025000 <disk+0x2000>
    80005e76:	6314                	ld	a3,0(a4)
    80005e78:	96be                	add	a3,a3,a5
    80005e7a:	0006b023          	sd	zero,0(a3)
    80005e7e:	6314                	ld	a3,0(a4)
    80005e80:	96be                	add	a3,a3,a5
    80005e82:	0006a423          	sw	zero,8(a3)
    80005e86:	6314                	ld	a3,0(a4)
    80005e88:	96be                	add	a3,a3,a5
    80005e8a:	00069623          	sh	zero,12(a3)
    80005e8e:	6318                	ld	a4,0(a4)
    80005e90:	97ba                	add	a5,a5,a4
    80005e92:	00079723          	sh	zero,14(a5)
    80005e96:	0001d797          	auipc	a5,0x1d
    80005e9a:	16a78793          	addi	a5,a5,362 # 80023000 <disk>
    80005e9e:	97aa                	add	a5,a5,a0
    80005ea0:	6509                	lui	a0,0x2
    80005ea2:	953e                	add	a0,a0,a5
    80005ea4:	4785                	li	a5,1
    80005ea6:	00f50c23          	sb	a5,24(a0) # 2018 <_entry-0x7fffdfe8>
    80005eaa:	0001f517          	auipc	a0,0x1f
    80005eae:	16e50513          	addi	a0,a0,366 # 80025018 <disk+0x2018>
    80005eb2:	ffffc097          	auipc	ra,0xffffc
    80005eb6:	4ea080e7          	jalr	1258(ra) # 8000239c <wakeup>
    80005eba:	60a2                	ld	ra,8(sp)
    80005ebc:	6402                	ld	s0,0(sp)
    80005ebe:	0141                	addi	sp,sp,16
    80005ec0:	8082                	ret
    80005ec2:	00003517          	auipc	a0,0x3
    80005ec6:	96650513          	addi	a0,a0,-1690 # 80008828 <syscalls+0x328>
    80005eca:	ffffa097          	auipc	ra,0xffffa
    80005ece:	674080e7          	jalr	1652(ra) # 8000053e <panic>
    80005ed2:	00003517          	auipc	a0,0x3
    80005ed6:	96650513          	addi	a0,a0,-1690 # 80008838 <syscalls+0x338>
    80005eda:	ffffa097          	auipc	ra,0xffffa
    80005ede:	664080e7          	jalr	1636(ra) # 8000053e <panic>

0000000080005ee2 <virtio_disk_init>:
    80005ee2:	1101                	addi	sp,sp,-32
    80005ee4:	ec06                	sd	ra,24(sp)
    80005ee6:	e822                	sd	s0,16(sp)
    80005ee8:	e426                	sd	s1,8(sp)
    80005eea:	1000                	addi	s0,sp,32
    80005eec:	00003597          	auipc	a1,0x3
    80005ef0:	95c58593          	addi	a1,a1,-1700 # 80008848 <syscalls+0x348>
    80005ef4:	0001f517          	auipc	a0,0x1f
    80005ef8:	23450513          	addi	a0,a0,564 # 80025128 <disk+0x2128>
    80005efc:	ffffb097          	auipc	ra,0xffffb
    80005f00:	c58080e7          	jalr	-936(ra) # 80000b54 <initlock>
    80005f04:	100017b7          	lui	a5,0x10001
    80005f08:	4398                	lw	a4,0(a5)
    80005f0a:	2701                	sext.w	a4,a4
    80005f0c:	747277b7          	lui	a5,0x74727
    80005f10:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80005f14:	0ef71163          	bne	a4,a5,80005ff6 <virtio_disk_init+0x114>
    80005f18:	100017b7          	lui	a5,0x10001
    80005f1c:	43dc                	lw	a5,4(a5)
    80005f1e:	2781                	sext.w	a5,a5
    80005f20:	4705                	li	a4,1
    80005f22:	0ce79a63          	bne	a5,a4,80005ff6 <virtio_disk_init+0x114>
    80005f26:	100017b7          	lui	a5,0x10001
    80005f2a:	479c                	lw	a5,8(a5)
    80005f2c:	2781                	sext.w	a5,a5
    80005f2e:	4709                	li	a4,2
    80005f30:	0ce79363          	bne	a5,a4,80005ff6 <virtio_disk_init+0x114>
    80005f34:	100017b7          	lui	a5,0x10001
    80005f38:	47d8                	lw	a4,12(a5)
    80005f3a:	2701                	sext.w	a4,a4
    80005f3c:	554d47b7          	lui	a5,0x554d4
    80005f40:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80005f44:	0af71963          	bne	a4,a5,80005ff6 <virtio_disk_init+0x114>
    80005f48:	100017b7          	lui	a5,0x10001
    80005f4c:	4705                	li	a4,1
    80005f4e:	dbb8                	sw	a4,112(a5)
    80005f50:	470d                	li	a4,3
    80005f52:	dbb8                	sw	a4,112(a5)
    80005f54:	4b94                	lw	a3,16(a5)
    80005f56:	c7ffe737          	lui	a4,0xc7ffe
    80005f5a:	75f70713          	addi	a4,a4,1887 # ffffffffc7ffe75f <end+0xffffffff47fd875f>
    80005f5e:	8f75                	and	a4,a4,a3
    80005f60:	2701                	sext.w	a4,a4
    80005f62:	d398                	sw	a4,32(a5)
    80005f64:	472d                	li	a4,11
    80005f66:	dbb8                	sw	a4,112(a5)
    80005f68:	473d                	li	a4,15
    80005f6a:	dbb8                	sw	a4,112(a5)
    80005f6c:	6705                	lui	a4,0x1
    80005f6e:	d798                	sw	a4,40(a5)
    80005f70:	0207a823          	sw	zero,48(a5) # 10001030 <_entry-0x6fffefd0>
    80005f74:	5bdc                	lw	a5,52(a5)
    80005f76:	2781                	sext.w	a5,a5
    80005f78:	c7d9                	beqz	a5,80006006 <virtio_disk_init+0x124>
    80005f7a:	471d                	li	a4,7
    80005f7c:	08f77d63          	bgeu	a4,a5,80006016 <virtio_disk_init+0x134>
    80005f80:	100014b7          	lui	s1,0x10001
    80005f84:	47a1                	li	a5,8
    80005f86:	dc9c                	sw	a5,56(s1)
    80005f88:	6609                	lui	a2,0x2
    80005f8a:	4581                	li	a1,0
    80005f8c:	0001d517          	auipc	a0,0x1d
    80005f90:	07450513          	addi	a0,a0,116 # 80023000 <disk>
    80005f94:	ffffb097          	auipc	ra,0xffffb
    80005f98:	d4c080e7          	jalr	-692(ra) # 80000ce0 <memset>
    80005f9c:	0001d717          	auipc	a4,0x1d
    80005fa0:	06470713          	addi	a4,a4,100 # 80023000 <disk>
    80005fa4:	00c75793          	srli	a5,a4,0xc
    80005fa8:	2781                	sext.w	a5,a5
    80005faa:	c0bc                	sw	a5,64(s1)
    80005fac:	0001f797          	auipc	a5,0x1f
    80005fb0:	05478793          	addi	a5,a5,84 # 80025000 <disk+0x2000>
    80005fb4:	e398                	sd	a4,0(a5)
    80005fb6:	0001d717          	auipc	a4,0x1d
    80005fba:	0ca70713          	addi	a4,a4,202 # 80023080 <disk+0x80>
    80005fbe:	e798                	sd	a4,8(a5)
    80005fc0:	0001e717          	auipc	a4,0x1e
    80005fc4:	04070713          	addi	a4,a4,64 # 80024000 <disk+0x1000>
    80005fc8:	eb98                	sd	a4,16(a5)
    80005fca:	4705                	li	a4,1
    80005fcc:	00e78c23          	sb	a4,24(a5)
    80005fd0:	00e78ca3          	sb	a4,25(a5)
    80005fd4:	00e78d23          	sb	a4,26(a5)
    80005fd8:	00e78da3          	sb	a4,27(a5)
    80005fdc:	00e78e23          	sb	a4,28(a5)
    80005fe0:	00e78ea3          	sb	a4,29(a5)
    80005fe4:	00e78f23          	sb	a4,30(a5)
    80005fe8:	00e78fa3          	sb	a4,31(a5)
    80005fec:	60e2                	ld	ra,24(sp)
    80005fee:	6442                	ld	s0,16(sp)
    80005ff0:	64a2                	ld	s1,8(sp)
    80005ff2:	6105                	addi	sp,sp,32
    80005ff4:	8082                	ret
    80005ff6:	00003517          	auipc	a0,0x3
    80005ffa:	86250513          	addi	a0,a0,-1950 # 80008858 <syscalls+0x358>
    80005ffe:	ffffa097          	auipc	ra,0xffffa
    80006002:	540080e7          	jalr	1344(ra) # 8000053e <panic>
    80006006:	00003517          	auipc	a0,0x3
    8000600a:	87250513          	addi	a0,a0,-1934 # 80008878 <syscalls+0x378>
    8000600e:	ffffa097          	auipc	ra,0xffffa
    80006012:	530080e7          	jalr	1328(ra) # 8000053e <panic>
    80006016:	00003517          	auipc	a0,0x3
    8000601a:	88250513          	addi	a0,a0,-1918 # 80008898 <syscalls+0x398>
    8000601e:	ffffa097          	auipc	ra,0xffffa
    80006022:	520080e7          	jalr	1312(ra) # 8000053e <panic>

0000000080006026 <virtio_disk_rw>:
    80006026:	7159                	addi	sp,sp,-112
    80006028:	f486                	sd	ra,104(sp)
    8000602a:	f0a2                	sd	s0,96(sp)
    8000602c:	eca6                	sd	s1,88(sp)
    8000602e:	e8ca                	sd	s2,80(sp)
    80006030:	e4ce                	sd	s3,72(sp)
    80006032:	e0d2                	sd	s4,64(sp)
    80006034:	fc56                	sd	s5,56(sp)
    80006036:	f85a                	sd	s6,48(sp)
    80006038:	f45e                	sd	s7,40(sp)
    8000603a:	f062                	sd	s8,32(sp)
    8000603c:	ec66                	sd	s9,24(sp)
    8000603e:	e86a                	sd	s10,16(sp)
    80006040:	1880                	addi	s0,sp,112
    80006042:	892a                	mv	s2,a0
    80006044:	8d2e                	mv	s10,a1
    80006046:	00c52c83          	lw	s9,12(a0)
    8000604a:	001c9c9b          	slliw	s9,s9,0x1
    8000604e:	1c82                	slli	s9,s9,0x20
    80006050:	020cdc93          	srli	s9,s9,0x20
    80006054:	0001f517          	auipc	a0,0x1f
    80006058:	0d450513          	addi	a0,a0,212 # 80025128 <disk+0x2128>
    8000605c:	ffffb097          	auipc	ra,0xffffb
    80006060:	b88080e7          	jalr	-1144(ra) # 80000be4 <acquire>
    80006064:	4981                	li	s3,0
    80006066:	4c21                	li	s8,8
    80006068:	0001db97          	auipc	s7,0x1d
    8000606c:	f98b8b93          	addi	s7,s7,-104 # 80023000 <disk>
    80006070:	6b09                	lui	s6,0x2
    80006072:	4a8d                	li	s5,3
    80006074:	8a4e                	mv	s4,s3
    80006076:	a051                	j	800060fa <virtio_disk_rw+0xd4>
    80006078:	00fb86b3          	add	a3,s7,a5
    8000607c:	96da                	add	a3,a3,s6
    8000607e:	00068c23          	sb	zero,24(a3)
    80006082:	c21c                	sw	a5,0(a2)
    80006084:	0207c563          	bltz	a5,800060ae <virtio_disk_rw+0x88>
    80006088:	2485                	addiw	s1,s1,1
    8000608a:	0711                	addi	a4,a4,4
    8000608c:	25548063          	beq	s1,s5,800062cc <virtio_disk_rw+0x2a6>
    80006090:	863a                	mv	a2,a4
    80006092:	0001f697          	auipc	a3,0x1f
    80006096:	f8668693          	addi	a3,a3,-122 # 80025018 <disk+0x2018>
    8000609a:	87d2                	mv	a5,s4
    8000609c:	0006c583          	lbu	a1,0(a3)
    800060a0:	fde1                	bnez	a1,80006078 <virtio_disk_rw+0x52>
    800060a2:	2785                	addiw	a5,a5,1
    800060a4:	0685                	addi	a3,a3,1
    800060a6:	ff879be3          	bne	a5,s8,8000609c <virtio_disk_rw+0x76>
    800060aa:	57fd                	li	a5,-1
    800060ac:	c21c                	sw	a5,0(a2)
    800060ae:	02905a63          	blez	s1,800060e2 <virtio_disk_rw+0xbc>
    800060b2:	f9042503          	lw	a0,-112(s0)
    800060b6:	00000097          	auipc	ra,0x0
    800060ba:	d90080e7          	jalr	-624(ra) # 80005e46 <free_desc>
    800060be:	4785                	li	a5,1
    800060c0:	0297d163          	bge	a5,s1,800060e2 <virtio_disk_rw+0xbc>
    800060c4:	f9442503          	lw	a0,-108(s0)
    800060c8:	00000097          	auipc	ra,0x0
    800060cc:	d7e080e7          	jalr	-642(ra) # 80005e46 <free_desc>
    800060d0:	4789                	li	a5,2
    800060d2:	0097d863          	bge	a5,s1,800060e2 <virtio_disk_rw+0xbc>
    800060d6:	f9842503          	lw	a0,-104(s0)
    800060da:	00000097          	auipc	ra,0x0
    800060de:	d6c080e7          	jalr	-660(ra) # 80005e46 <free_desc>
    800060e2:	0001f597          	auipc	a1,0x1f
    800060e6:	04658593          	addi	a1,a1,70 # 80025128 <disk+0x2128>
    800060ea:	0001f517          	auipc	a0,0x1f
    800060ee:	f2e50513          	addi	a0,a0,-210 # 80025018 <disk+0x2018>
    800060f2:	ffffc097          	auipc	ra,0xffffc
    800060f6:	11e080e7          	jalr	286(ra) # 80002210 <sleep>
    800060fa:	f9040713          	addi	a4,s0,-112
    800060fe:	84ce                	mv	s1,s3
    80006100:	bf41                	j	80006090 <virtio_disk_rw+0x6a>
    80006102:	20058713          	addi	a4,a1,512
    80006106:	00471693          	slli	a3,a4,0x4
    8000610a:	0001d717          	auipc	a4,0x1d
    8000610e:	ef670713          	addi	a4,a4,-266 # 80023000 <disk>
    80006112:	9736                	add	a4,a4,a3
    80006114:	4685                	li	a3,1
    80006116:	0ad72423          	sw	a3,168(a4)
    8000611a:	20058713          	addi	a4,a1,512
    8000611e:	00471693          	slli	a3,a4,0x4
    80006122:	0001d717          	auipc	a4,0x1d
    80006126:	ede70713          	addi	a4,a4,-290 # 80023000 <disk>
    8000612a:	9736                	add	a4,a4,a3
    8000612c:	0a072623          	sw	zero,172(a4)
    80006130:	0b973823          	sd	s9,176(a4)
    80006134:	7679                	lui	a2,0xffffe
    80006136:	963e                	add	a2,a2,a5
    80006138:	0001f697          	auipc	a3,0x1f
    8000613c:	ec868693          	addi	a3,a3,-312 # 80025000 <disk+0x2000>
    80006140:	6298                	ld	a4,0(a3)
    80006142:	9732                	add	a4,a4,a2
    80006144:	e308                	sd	a0,0(a4)
    80006146:	6298                	ld	a4,0(a3)
    80006148:	9732                	add	a4,a4,a2
    8000614a:	4541                	li	a0,16
    8000614c:	c708                	sw	a0,8(a4)
    8000614e:	6298                	ld	a4,0(a3)
    80006150:	9732                	add	a4,a4,a2
    80006152:	4505                	li	a0,1
    80006154:	00a71623          	sh	a0,12(a4)
    80006158:	f9442703          	lw	a4,-108(s0)
    8000615c:	6288                	ld	a0,0(a3)
    8000615e:	962a                	add	a2,a2,a0
    80006160:	00e61723          	sh	a4,14(a2) # ffffffffffffe00e <end+0xffffffff7ffd800e>
    80006164:	0712                	slli	a4,a4,0x4
    80006166:	6290                	ld	a2,0(a3)
    80006168:	963a                	add	a2,a2,a4
    8000616a:	05890513          	addi	a0,s2,88
    8000616e:	e208                	sd	a0,0(a2)
    80006170:	6294                	ld	a3,0(a3)
    80006172:	96ba                	add	a3,a3,a4
    80006174:	40000613          	li	a2,1024
    80006178:	c690                	sw	a2,8(a3)
    8000617a:	140d0063          	beqz	s10,800062ba <virtio_disk_rw+0x294>
    8000617e:	0001f697          	auipc	a3,0x1f
    80006182:	e826b683          	ld	a3,-382(a3) # 80025000 <disk+0x2000>
    80006186:	96ba                	add	a3,a3,a4
    80006188:	00069623          	sh	zero,12(a3)
    8000618c:	0001d817          	auipc	a6,0x1d
    80006190:	e7480813          	addi	a6,a6,-396 # 80023000 <disk>
    80006194:	0001f517          	auipc	a0,0x1f
    80006198:	e6c50513          	addi	a0,a0,-404 # 80025000 <disk+0x2000>
    8000619c:	6114                	ld	a3,0(a0)
    8000619e:	96ba                	add	a3,a3,a4
    800061a0:	00c6d603          	lhu	a2,12(a3)
    800061a4:	00166613          	ori	a2,a2,1
    800061a8:	00c69623          	sh	a2,12(a3)
    800061ac:	f9842683          	lw	a3,-104(s0)
    800061b0:	6110                	ld	a2,0(a0)
    800061b2:	9732                	add	a4,a4,a2
    800061b4:	00d71723          	sh	a3,14(a4)
    800061b8:	20058613          	addi	a2,a1,512
    800061bc:	0612                	slli	a2,a2,0x4
    800061be:	9642                	add	a2,a2,a6
    800061c0:	577d                	li	a4,-1
    800061c2:	02e60823          	sb	a4,48(a2)
    800061c6:	00469713          	slli	a4,a3,0x4
    800061ca:	6114                	ld	a3,0(a0)
    800061cc:	96ba                	add	a3,a3,a4
    800061ce:	03078793          	addi	a5,a5,48
    800061d2:	97c2                	add	a5,a5,a6
    800061d4:	e29c                	sd	a5,0(a3)
    800061d6:	611c                	ld	a5,0(a0)
    800061d8:	97ba                	add	a5,a5,a4
    800061da:	4685                	li	a3,1
    800061dc:	c794                	sw	a3,8(a5)
    800061de:	611c                	ld	a5,0(a0)
    800061e0:	97ba                	add	a5,a5,a4
    800061e2:	4809                	li	a6,2
    800061e4:	01079623          	sh	a6,12(a5)
    800061e8:	611c                	ld	a5,0(a0)
    800061ea:	973e                	add	a4,a4,a5
    800061ec:	00071723          	sh	zero,14(a4)
    800061f0:	00d92223          	sw	a3,4(s2)
    800061f4:	03263423          	sd	s2,40(a2)
    800061f8:	6518                	ld	a4,8(a0)
    800061fa:	00275783          	lhu	a5,2(a4)
    800061fe:	8b9d                	andi	a5,a5,7
    80006200:	0786                	slli	a5,a5,0x1
    80006202:	97ba                	add	a5,a5,a4
    80006204:	00b79223          	sh	a1,4(a5)
    80006208:	0ff0000f          	fence
    8000620c:	6518                	ld	a4,8(a0)
    8000620e:	00275783          	lhu	a5,2(a4)
    80006212:	2785                	addiw	a5,a5,1
    80006214:	00f71123          	sh	a5,2(a4)
    80006218:	0ff0000f          	fence
    8000621c:	100017b7          	lui	a5,0x10001
    80006220:	0407a823          	sw	zero,80(a5) # 10001050 <_entry-0x6fffefb0>
    80006224:	00492703          	lw	a4,4(s2)
    80006228:	4785                	li	a5,1
    8000622a:	02f71163          	bne	a4,a5,8000624c <virtio_disk_rw+0x226>
    8000622e:	0001f997          	auipc	s3,0x1f
    80006232:	efa98993          	addi	s3,s3,-262 # 80025128 <disk+0x2128>
    80006236:	4485                	li	s1,1
    80006238:	85ce                	mv	a1,s3
    8000623a:	854a                	mv	a0,s2
    8000623c:	ffffc097          	auipc	ra,0xffffc
    80006240:	fd4080e7          	jalr	-44(ra) # 80002210 <sleep>
    80006244:	00492783          	lw	a5,4(s2)
    80006248:	fe9788e3          	beq	a5,s1,80006238 <virtio_disk_rw+0x212>
    8000624c:	f9042903          	lw	s2,-112(s0)
    80006250:	20090793          	addi	a5,s2,512
    80006254:	00479713          	slli	a4,a5,0x4
    80006258:	0001d797          	auipc	a5,0x1d
    8000625c:	da878793          	addi	a5,a5,-600 # 80023000 <disk>
    80006260:	97ba                	add	a5,a5,a4
    80006262:	0207b423          	sd	zero,40(a5)
    80006266:	0001f997          	auipc	s3,0x1f
    8000626a:	d9a98993          	addi	s3,s3,-614 # 80025000 <disk+0x2000>
    8000626e:	00491713          	slli	a4,s2,0x4
    80006272:	0009b783          	ld	a5,0(s3)
    80006276:	97ba                	add	a5,a5,a4
    80006278:	00c7d483          	lhu	s1,12(a5)
    8000627c:	854a                	mv	a0,s2
    8000627e:	00e7d903          	lhu	s2,14(a5)
    80006282:	00000097          	auipc	ra,0x0
    80006286:	bc4080e7          	jalr	-1084(ra) # 80005e46 <free_desc>
    8000628a:	8885                	andi	s1,s1,1
    8000628c:	f0ed                	bnez	s1,8000626e <virtio_disk_rw+0x248>
    8000628e:	0001f517          	auipc	a0,0x1f
    80006292:	e9a50513          	addi	a0,a0,-358 # 80025128 <disk+0x2128>
    80006296:	ffffb097          	auipc	ra,0xffffb
    8000629a:	a02080e7          	jalr	-1534(ra) # 80000c98 <release>
    8000629e:	70a6                	ld	ra,104(sp)
    800062a0:	7406                	ld	s0,96(sp)
    800062a2:	64e6                	ld	s1,88(sp)
    800062a4:	6946                	ld	s2,80(sp)
    800062a6:	69a6                	ld	s3,72(sp)
    800062a8:	6a06                	ld	s4,64(sp)
    800062aa:	7ae2                	ld	s5,56(sp)
    800062ac:	7b42                	ld	s6,48(sp)
    800062ae:	7ba2                	ld	s7,40(sp)
    800062b0:	7c02                	ld	s8,32(sp)
    800062b2:	6ce2                	ld	s9,24(sp)
    800062b4:	6d42                	ld	s10,16(sp)
    800062b6:	6165                	addi	sp,sp,112
    800062b8:	8082                	ret
    800062ba:	0001f697          	auipc	a3,0x1f
    800062be:	d466b683          	ld	a3,-698(a3) # 80025000 <disk+0x2000>
    800062c2:	96ba                	add	a3,a3,a4
    800062c4:	4609                	li	a2,2
    800062c6:	00c69623          	sh	a2,12(a3)
    800062ca:	b5c9                	j	8000618c <virtio_disk_rw+0x166>
    800062cc:	f9042583          	lw	a1,-112(s0)
    800062d0:	20058793          	addi	a5,a1,512
    800062d4:	0792                	slli	a5,a5,0x4
    800062d6:	0001d517          	auipc	a0,0x1d
    800062da:	dd250513          	addi	a0,a0,-558 # 800230a8 <disk+0xa8>
    800062de:	953e                	add	a0,a0,a5
    800062e0:	e20d11e3          	bnez	s10,80006102 <virtio_disk_rw+0xdc>
    800062e4:	20058713          	addi	a4,a1,512
    800062e8:	00471693          	slli	a3,a4,0x4
    800062ec:	0001d717          	auipc	a4,0x1d
    800062f0:	d1470713          	addi	a4,a4,-748 # 80023000 <disk>
    800062f4:	9736                	add	a4,a4,a3
    800062f6:	0a072423          	sw	zero,168(a4)
    800062fa:	b505                	j	8000611a <virtio_disk_rw+0xf4>

00000000800062fc <virtio_disk_intr>:
    800062fc:	1101                	addi	sp,sp,-32
    800062fe:	ec06                	sd	ra,24(sp)
    80006300:	e822                	sd	s0,16(sp)
    80006302:	e426                	sd	s1,8(sp)
    80006304:	e04a                	sd	s2,0(sp)
    80006306:	1000                	addi	s0,sp,32
    80006308:	0001f517          	auipc	a0,0x1f
    8000630c:	e2050513          	addi	a0,a0,-480 # 80025128 <disk+0x2128>
    80006310:	ffffb097          	auipc	ra,0xffffb
    80006314:	8d4080e7          	jalr	-1836(ra) # 80000be4 <acquire>
    80006318:	10001737          	lui	a4,0x10001
    8000631c:	533c                	lw	a5,96(a4)
    8000631e:	8b8d                	andi	a5,a5,3
    80006320:	d37c                	sw	a5,100(a4)
    80006322:	0ff0000f          	fence
    80006326:	0001f797          	auipc	a5,0x1f
    8000632a:	cda78793          	addi	a5,a5,-806 # 80025000 <disk+0x2000>
    8000632e:	6b94                	ld	a3,16(a5)
    80006330:	0207d703          	lhu	a4,32(a5)
    80006334:	0026d783          	lhu	a5,2(a3)
    80006338:	06f70163          	beq	a4,a5,8000639a <virtio_disk_intr+0x9e>
    8000633c:	0001d917          	auipc	s2,0x1d
    80006340:	cc490913          	addi	s2,s2,-828 # 80023000 <disk>
    80006344:	0001f497          	auipc	s1,0x1f
    80006348:	cbc48493          	addi	s1,s1,-836 # 80025000 <disk+0x2000>
    8000634c:	0ff0000f          	fence
    80006350:	6898                	ld	a4,16(s1)
    80006352:	0204d783          	lhu	a5,32(s1)
    80006356:	8b9d                	andi	a5,a5,7
    80006358:	078e                	slli	a5,a5,0x3
    8000635a:	97ba                	add	a5,a5,a4
    8000635c:	43dc                	lw	a5,4(a5)
    8000635e:	20078713          	addi	a4,a5,512
    80006362:	0712                	slli	a4,a4,0x4
    80006364:	974a                	add	a4,a4,s2
    80006366:	03074703          	lbu	a4,48(a4) # 10001030 <_entry-0x6fffefd0>
    8000636a:	e731                	bnez	a4,800063b6 <virtio_disk_intr+0xba>
    8000636c:	20078793          	addi	a5,a5,512
    80006370:	0792                	slli	a5,a5,0x4
    80006372:	97ca                	add	a5,a5,s2
    80006374:	7788                	ld	a0,40(a5)
    80006376:	00052223          	sw	zero,4(a0)
    8000637a:	ffffc097          	auipc	ra,0xffffc
    8000637e:	022080e7          	jalr	34(ra) # 8000239c <wakeup>
    80006382:	0204d783          	lhu	a5,32(s1)
    80006386:	2785                	addiw	a5,a5,1
    80006388:	17c2                	slli	a5,a5,0x30
    8000638a:	93c1                	srli	a5,a5,0x30
    8000638c:	02f49023          	sh	a5,32(s1)
    80006390:	6898                	ld	a4,16(s1)
    80006392:	00275703          	lhu	a4,2(a4)
    80006396:	faf71be3          	bne	a4,a5,8000634c <virtio_disk_intr+0x50>
    8000639a:	0001f517          	auipc	a0,0x1f
    8000639e:	d8e50513          	addi	a0,a0,-626 # 80025128 <disk+0x2128>
    800063a2:	ffffb097          	auipc	ra,0xffffb
    800063a6:	8f6080e7          	jalr	-1802(ra) # 80000c98 <release>
    800063aa:	60e2                	ld	ra,24(sp)
    800063ac:	6442                	ld	s0,16(sp)
    800063ae:	64a2                	ld	s1,8(sp)
    800063b0:	6902                	ld	s2,0(sp)
    800063b2:	6105                	addi	sp,sp,32
    800063b4:	8082                	ret
    800063b6:	00002517          	auipc	a0,0x2
    800063ba:	50250513          	addi	a0,a0,1282 # 800088b8 <syscalls+0x3b8>
    800063be:	ffffa097          	auipc	ra,0xffffa
    800063c2:	180080e7          	jalr	384(ra) # 8000053e <panic>
	...

0000000080007000 <_trampoline>:
    80007000:	14051573          	csrrw	a0,sscratch,a0
    80007004:	02153423          	sd	ra,40(a0)
    80007008:	02253823          	sd	sp,48(a0)
    8000700c:	02353c23          	sd	gp,56(a0)
    80007010:	04453023          	sd	tp,64(a0)
    80007014:	04553423          	sd	t0,72(a0)
    80007018:	04653823          	sd	t1,80(a0)
    8000701c:	04753c23          	sd	t2,88(a0)
    80007020:	f120                	sd	s0,96(a0)
    80007022:	f524                	sd	s1,104(a0)
    80007024:	fd2c                	sd	a1,120(a0)
    80007026:	e150                	sd	a2,128(a0)
    80007028:	e554                	sd	a3,136(a0)
    8000702a:	e958                	sd	a4,144(a0)
    8000702c:	ed5c                	sd	a5,152(a0)
    8000702e:	0b053023          	sd	a6,160(a0)
    80007032:	0b153423          	sd	a7,168(a0)
    80007036:	0b253823          	sd	s2,176(a0)
    8000703a:	0b353c23          	sd	s3,184(a0)
    8000703e:	0d453023          	sd	s4,192(a0)
    80007042:	0d553423          	sd	s5,200(a0)
    80007046:	0d653823          	sd	s6,208(a0)
    8000704a:	0d753c23          	sd	s7,216(a0)
    8000704e:	0f853023          	sd	s8,224(a0)
    80007052:	0f953423          	sd	s9,232(a0)
    80007056:	0fa53823          	sd	s10,240(a0)
    8000705a:	0fb53c23          	sd	s11,248(a0)
    8000705e:	11c53023          	sd	t3,256(a0)
    80007062:	11d53423          	sd	t4,264(a0)
    80007066:	11e53823          	sd	t5,272(a0)
    8000706a:	11f53c23          	sd	t6,280(a0)
    8000706e:	140022f3          	csrr	t0,sscratch
    80007072:	06553823          	sd	t0,112(a0)
    80007076:	00853103          	ld	sp,8(a0)
    8000707a:	02053203          	ld	tp,32(a0)
    8000707e:	01053283          	ld	t0,16(a0)
    80007082:	00053303          	ld	t1,0(a0)
    80007086:	18031073          	csrw	satp,t1
    8000708a:	12000073          	sfence.vma
    8000708e:	8282                	jr	t0

0000000080007090 <userret>:
    80007090:	18059073          	csrw	satp,a1
    80007094:	12000073          	sfence.vma
    80007098:	07053283          	ld	t0,112(a0)
    8000709c:	14029073          	csrw	sscratch,t0
    800070a0:	02853083          	ld	ra,40(a0)
    800070a4:	03053103          	ld	sp,48(a0)
    800070a8:	03853183          	ld	gp,56(a0)
    800070ac:	04053203          	ld	tp,64(a0)
    800070b0:	04853283          	ld	t0,72(a0)
    800070b4:	05053303          	ld	t1,80(a0)
    800070b8:	05853383          	ld	t2,88(a0)
    800070bc:	7120                	ld	s0,96(a0)
    800070be:	7524                	ld	s1,104(a0)
    800070c0:	7d2c                	ld	a1,120(a0)
    800070c2:	6150                	ld	a2,128(a0)
    800070c4:	6554                	ld	a3,136(a0)
    800070c6:	6958                	ld	a4,144(a0)
    800070c8:	6d5c                	ld	a5,152(a0)
    800070ca:	0a053803          	ld	a6,160(a0)
    800070ce:	0a853883          	ld	a7,168(a0)
    800070d2:	0b053903          	ld	s2,176(a0)
    800070d6:	0b853983          	ld	s3,184(a0)
    800070da:	0c053a03          	ld	s4,192(a0)
    800070de:	0c853a83          	ld	s5,200(a0)
    800070e2:	0d053b03          	ld	s6,208(a0)
    800070e6:	0d853b83          	ld	s7,216(a0)
    800070ea:	0e053c03          	ld	s8,224(a0)
    800070ee:	0e853c83          	ld	s9,232(a0)
    800070f2:	0f053d03          	ld	s10,240(a0)
    800070f6:	0f853d83          	ld	s11,248(a0)
    800070fa:	10053e03          	ld	t3,256(a0)
    800070fe:	10853e83          	ld	t4,264(a0)
    80007102:	11053f03          	ld	t5,272(a0)
    80007106:	11853f83          	ld	t6,280(a0)
    8000710a:	14051573          	csrrw	a0,sscratch,a0
    8000710e:	10200073          	sret
	...
