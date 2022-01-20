
user/_setpriority:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
   0:	1101                	addi	sp,sp,-32
   2:	ec06                	sd	ra,24(sp)
   4:	e822                	sd	s0,16(sp)
   6:	e426                	sd	s1,8(sp)
   8:	e04a                	sd	s2,0(sp)
   a:	1000                	addi	s0,sp,32
   c:	84ae                	mv	s1,a1
   e:	4789                	li	a5,2
  10:	02a7d863          	bge	a5,a0,40 <main+0x40>
  14:	6488                	ld	a0,8(s1)
  16:	00000097          	auipc	ra,0x0
  1a:	1b2080e7          	jalr	434(ra) # 1c8 <atoi>
  1e:	892a                	mv	s2,a0
  20:	6888                	ld	a0,16(s1)
  22:	00000097          	auipc	ra,0x0
  26:	1a6080e7          	jalr	422(ra) # 1c8 <atoi>
  2a:	85aa                	mv	a1,a0
  2c:	854a                	mv	a0,s2
  2e:	00000097          	auipc	ra,0x0
  32:	33a080e7          	jalr	826(ra) # 368 <set_priority>
  36:	4501                	li	a0,0
  38:	00000097          	auipc	ra,0x0
  3c:	290080e7          	jalr	656(ra) # 2c8 <exit>
  40:	00000517          	auipc	a0,0x0
  44:	7b850513          	addi	a0,a0,1976 # 7f8 <malloc+0xea>
  48:	00000097          	auipc	ra,0x0
  4c:	608080e7          	jalr	1544(ra) # 650 <printf>
  50:	b7d1                	j	14 <main+0x14>

0000000000000052 <strcpy>:
  52:	1141                	addi	sp,sp,-16
  54:	e422                	sd	s0,8(sp)
  56:	0800                	addi	s0,sp,16
  58:	87aa                	mv	a5,a0
  5a:	0585                	addi	a1,a1,1
  5c:	0785                	addi	a5,a5,1
  5e:	fff5c703          	lbu	a4,-1(a1)
  62:	fee78fa3          	sb	a4,-1(a5)
  66:	fb75                	bnez	a4,5a <strcpy+0x8>
  68:	6422                	ld	s0,8(sp)
  6a:	0141                	addi	sp,sp,16
  6c:	8082                	ret

000000000000006e <strcmp>:
  6e:	1141                	addi	sp,sp,-16
  70:	e422                	sd	s0,8(sp)
  72:	0800                	addi	s0,sp,16
  74:	00054783          	lbu	a5,0(a0)
  78:	cb91                	beqz	a5,8c <strcmp+0x1e>
  7a:	0005c703          	lbu	a4,0(a1)
  7e:	00f71763          	bne	a4,a5,8c <strcmp+0x1e>
  82:	0505                	addi	a0,a0,1
  84:	0585                	addi	a1,a1,1
  86:	00054783          	lbu	a5,0(a0)
  8a:	fbe5                	bnez	a5,7a <strcmp+0xc>
  8c:	0005c503          	lbu	a0,0(a1)
  90:	40a7853b          	subw	a0,a5,a0
  94:	6422                	ld	s0,8(sp)
  96:	0141                	addi	sp,sp,16
  98:	8082                	ret

000000000000009a <strlen>:
  9a:	1141                	addi	sp,sp,-16
  9c:	e422                	sd	s0,8(sp)
  9e:	0800                	addi	s0,sp,16
  a0:	00054783          	lbu	a5,0(a0)
  a4:	cf91                	beqz	a5,c0 <strlen+0x26>
  a6:	0505                	addi	a0,a0,1
  a8:	87aa                	mv	a5,a0
  aa:	4685                	li	a3,1
  ac:	9e89                	subw	a3,a3,a0
  ae:	00f6853b          	addw	a0,a3,a5
  b2:	0785                	addi	a5,a5,1
  b4:	fff7c703          	lbu	a4,-1(a5)
  b8:	fb7d                	bnez	a4,ae <strlen+0x14>
  ba:	6422                	ld	s0,8(sp)
  bc:	0141                	addi	sp,sp,16
  be:	8082                	ret
  c0:	4501                	li	a0,0
  c2:	bfe5                	j	ba <strlen+0x20>

00000000000000c4 <memset>:
  c4:	1141                	addi	sp,sp,-16
  c6:	e422                	sd	s0,8(sp)
  c8:	0800                	addi	s0,sp,16
  ca:	ce09                	beqz	a2,e4 <memset+0x20>
  cc:	87aa                	mv	a5,a0
  ce:	fff6071b          	addiw	a4,a2,-1
  d2:	1702                	slli	a4,a4,0x20
  d4:	9301                	srli	a4,a4,0x20
  d6:	0705                	addi	a4,a4,1
  d8:	972a                	add	a4,a4,a0
  da:	00b78023          	sb	a1,0(a5)
  de:	0785                	addi	a5,a5,1
  e0:	fee79de3          	bne	a5,a4,da <memset+0x16>
  e4:	6422                	ld	s0,8(sp)
  e6:	0141                	addi	sp,sp,16
  e8:	8082                	ret

00000000000000ea <strchr>:
  ea:	1141                	addi	sp,sp,-16
  ec:	e422                	sd	s0,8(sp)
  ee:	0800                	addi	s0,sp,16
  f0:	00054783          	lbu	a5,0(a0)
  f4:	cb99                	beqz	a5,10a <strchr+0x20>
  f6:	00f58763          	beq	a1,a5,104 <strchr+0x1a>
  fa:	0505                	addi	a0,a0,1
  fc:	00054783          	lbu	a5,0(a0)
 100:	fbfd                	bnez	a5,f6 <strchr+0xc>
 102:	4501                	li	a0,0
 104:	6422                	ld	s0,8(sp)
 106:	0141                	addi	sp,sp,16
 108:	8082                	ret
 10a:	4501                	li	a0,0
 10c:	bfe5                	j	104 <strchr+0x1a>

000000000000010e <gets>:
 10e:	711d                	addi	sp,sp,-96
 110:	ec86                	sd	ra,88(sp)
 112:	e8a2                	sd	s0,80(sp)
 114:	e4a6                	sd	s1,72(sp)
 116:	e0ca                	sd	s2,64(sp)
 118:	fc4e                	sd	s3,56(sp)
 11a:	f852                	sd	s4,48(sp)
 11c:	f456                	sd	s5,40(sp)
 11e:	f05a                	sd	s6,32(sp)
 120:	ec5e                	sd	s7,24(sp)
 122:	1080                	addi	s0,sp,96
 124:	8baa                	mv	s7,a0
 126:	8a2e                	mv	s4,a1
 128:	892a                	mv	s2,a0
 12a:	4481                	li	s1,0
 12c:	4aa9                	li	s5,10
 12e:	4b35                	li	s6,13
 130:	89a6                	mv	s3,s1
 132:	2485                	addiw	s1,s1,1
 134:	0344d863          	bge	s1,s4,164 <gets+0x56>
 138:	4605                	li	a2,1
 13a:	faf40593          	addi	a1,s0,-81
 13e:	4501                	li	a0,0
 140:	00000097          	auipc	ra,0x0
 144:	1a0080e7          	jalr	416(ra) # 2e0 <read>
 148:	00a05e63          	blez	a0,164 <gets+0x56>
 14c:	faf44783          	lbu	a5,-81(s0)
 150:	00f90023          	sb	a5,0(s2)
 154:	01578763          	beq	a5,s5,162 <gets+0x54>
 158:	0905                	addi	s2,s2,1
 15a:	fd679be3          	bne	a5,s6,130 <gets+0x22>
 15e:	89a6                	mv	s3,s1
 160:	a011                	j	164 <gets+0x56>
 162:	89a6                	mv	s3,s1
 164:	99de                	add	s3,s3,s7
 166:	00098023          	sb	zero,0(s3)
 16a:	855e                	mv	a0,s7
 16c:	60e6                	ld	ra,88(sp)
 16e:	6446                	ld	s0,80(sp)
 170:	64a6                	ld	s1,72(sp)
 172:	6906                	ld	s2,64(sp)
 174:	79e2                	ld	s3,56(sp)
 176:	7a42                	ld	s4,48(sp)
 178:	7aa2                	ld	s5,40(sp)
 17a:	7b02                	ld	s6,32(sp)
 17c:	6be2                	ld	s7,24(sp)
 17e:	6125                	addi	sp,sp,96
 180:	8082                	ret

0000000000000182 <stat>:
 182:	1101                	addi	sp,sp,-32
 184:	ec06                	sd	ra,24(sp)
 186:	e822                	sd	s0,16(sp)
 188:	e426                	sd	s1,8(sp)
 18a:	e04a                	sd	s2,0(sp)
 18c:	1000                	addi	s0,sp,32
 18e:	892e                	mv	s2,a1
 190:	4581                	li	a1,0
 192:	00000097          	auipc	ra,0x0
 196:	176080e7          	jalr	374(ra) # 308 <open>
 19a:	02054563          	bltz	a0,1c4 <stat+0x42>
 19e:	84aa                	mv	s1,a0
 1a0:	85ca                	mv	a1,s2
 1a2:	00000097          	auipc	ra,0x0
 1a6:	17e080e7          	jalr	382(ra) # 320 <fstat>
 1aa:	892a                	mv	s2,a0
 1ac:	8526                	mv	a0,s1
 1ae:	00000097          	auipc	ra,0x0
 1b2:	142080e7          	jalr	322(ra) # 2f0 <close>
 1b6:	854a                	mv	a0,s2
 1b8:	60e2                	ld	ra,24(sp)
 1ba:	6442                	ld	s0,16(sp)
 1bc:	64a2                	ld	s1,8(sp)
 1be:	6902                	ld	s2,0(sp)
 1c0:	6105                	addi	sp,sp,32
 1c2:	8082                	ret
 1c4:	597d                	li	s2,-1
 1c6:	bfc5                	j	1b6 <stat+0x34>

00000000000001c8 <atoi>:
 1c8:	1141                	addi	sp,sp,-16
 1ca:	e422                	sd	s0,8(sp)
 1cc:	0800                	addi	s0,sp,16
 1ce:	00054603          	lbu	a2,0(a0)
 1d2:	fd06079b          	addiw	a5,a2,-48
 1d6:	0ff7f793          	andi	a5,a5,255
 1da:	4725                	li	a4,9
 1dc:	02f76963          	bltu	a4,a5,20e <atoi+0x46>
 1e0:	86aa                	mv	a3,a0
 1e2:	4501                	li	a0,0
 1e4:	45a5                	li	a1,9
 1e6:	0685                	addi	a3,a3,1
 1e8:	0025179b          	slliw	a5,a0,0x2
 1ec:	9fa9                	addw	a5,a5,a0
 1ee:	0017979b          	slliw	a5,a5,0x1
 1f2:	9fb1                	addw	a5,a5,a2
 1f4:	fd07851b          	addiw	a0,a5,-48
 1f8:	0006c603          	lbu	a2,0(a3)
 1fc:	fd06071b          	addiw	a4,a2,-48
 200:	0ff77713          	andi	a4,a4,255
 204:	fee5f1e3          	bgeu	a1,a4,1e6 <atoi+0x1e>
 208:	6422                	ld	s0,8(sp)
 20a:	0141                	addi	sp,sp,16
 20c:	8082                	ret
 20e:	4501                	li	a0,0
 210:	bfe5                	j	208 <atoi+0x40>

0000000000000212 <memmove>:
 212:	1141                	addi	sp,sp,-16
 214:	e422                	sd	s0,8(sp)
 216:	0800                	addi	s0,sp,16
 218:	02b57663          	bgeu	a0,a1,244 <memmove+0x32>
 21c:	02c05163          	blez	a2,23e <memmove+0x2c>
 220:	fff6079b          	addiw	a5,a2,-1
 224:	1782                	slli	a5,a5,0x20
 226:	9381                	srli	a5,a5,0x20
 228:	0785                	addi	a5,a5,1
 22a:	97aa                	add	a5,a5,a0
 22c:	872a                	mv	a4,a0
 22e:	0585                	addi	a1,a1,1
 230:	0705                	addi	a4,a4,1
 232:	fff5c683          	lbu	a3,-1(a1)
 236:	fed70fa3          	sb	a3,-1(a4)
 23a:	fee79ae3          	bne	a5,a4,22e <memmove+0x1c>
 23e:	6422                	ld	s0,8(sp)
 240:	0141                	addi	sp,sp,16
 242:	8082                	ret
 244:	00c50733          	add	a4,a0,a2
 248:	95b2                	add	a1,a1,a2
 24a:	fec05ae3          	blez	a2,23e <memmove+0x2c>
 24e:	fff6079b          	addiw	a5,a2,-1
 252:	1782                	slli	a5,a5,0x20
 254:	9381                	srli	a5,a5,0x20
 256:	fff7c793          	not	a5,a5
 25a:	97ba                	add	a5,a5,a4
 25c:	15fd                	addi	a1,a1,-1
 25e:	177d                	addi	a4,a4,-1
 260:	0005c683          	lbu	a3,0(a1)
 264:	00d70023          	sb	a3,0(a4)
 268:	fee79ae3          	bne	a5,a4,25c <memmove+0x4a>
 26c:	bfc9                	j	23e <memmove+0x2c>

000000000000026e <memcmp>:
 26e:	1141                	addi	sp,sp,-16
 270:	e422                	sd	s0,8(sp)
 272:	0800                	addi	s0,sp,16
 274:	ca05                	beqz	a2,2a4 <memcmp+0x36>
 276:	fff6069b          	addiw	a3,a2,-1
 27a:	1682                	slli	a3,a3,0x20
 27c:	9281                	srli	a3,a3,0x20
 27e:	0685                	addi	a3,a3,1
 280:	96aa                	add	a3,a3,a0
 282:	00054783          	lbu	a5,0(a0)
 286:	0005c703          	lbu	a4,0(a1)
 28a:	00e79863          	bne	a5,a4,29a <memcmp+0x2c>
 28e:	0505                	addi	a0,a0,1
 290:	0585                	addi	a1,a1,1
 292:	fed518e3          	bne	a0,a3,282 <memcmp+0x14>
 296:	4501                	li	a0,0
 298:	a019                	j	29e <memcmp+0x30>
 29a:	40e7853b          	subw	a0,a5,a4
 29e:	6422                	ld	s0,8(sp)
 2a0:	0141                	addi	sp,sp,16
 2a2:	8082                	ret
 2a4:	4501                	li	a0,0
 2a6:	bfe5                	j	29e <memcmp+0x30>

00000000000002a8 <memcpy>:
 2a8:	1141                	addi	sp,sp,-16
 2aa:	e406                	sd	ra,8(sp)
 2ac:	e022                	sd	s0,0(sp)
 2ae:	0800                	addi	s0,sp,16
 2b0:	00000097          	auipc	ra,0x0
 2b4:	f62080e7          	jalr	-158(ra) # 212 <memmove>
 2b8:	60a2                	ld	ra,8(sp)
 2ba:	6402                	ld	s0,0(sp)
 2bc:	0141                	addi	sp,sp,16
 2be:	8082                	ret

00000000000002c0 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 2c0:	4885                	li	a7,1
 ecall
 2c2:	00000073          	ecall
 ret
 2c6:	8082                	ret

00000000000002c8 <exit>:
.global exit
exit:
 li a7, SYS_exit
 2c8:	4889                	li	a7,2
 ecall
 2ca:	00000073          	ecall
 ret
 2ce:	8082                	ret

00000000000002d0 <wait>:
.global wait
wait:
 li a7, SYS_wait
 2d0:	488d                	li	a7,3
 ecall
 2d2:	00000073          	ecall
 ret
 2d6:	8082                	ret

00000000000002d8 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 2d8:	4891                	li	a7,4
 ecall
 2da:	00000073          	ecall
 ret
 2de:	8082                	ret

00000000000002e0 <read>:
.global read
read:
 li a7, SYS_read
 2e0:	4895                	li	a7,5
 ecall
 2e2:	00000073          	ecall
 ret
 2e6:	8082                	ret

00000000000002e8 <write>:
.global write
write:
 li a7, SYS_write
 2e8:	48c1                	li	a7,16
 ecall
 2ea:	00000073          	ecall
 ret
 2ee:	8082                	ret

00000000000002f0 <close>:
.global close
close:
 li a7, SYS_close
 2f0:	48d5                	li	a7,21
 ecall
 2f2:	00000073          	ecall
 ret
 2f6:	8082                	ret

00000000000002f8 <kill>:
.global kill
kill:
 li a7, SYS_kill
 2f8:	4899                	li	a7,6
 ecall
 2fa:	00000073          	ecall
 ret
 2fe:	8082                	ret

0000000000000300 <exec>:
.global exec
exec:
 li a7, SYS_exec
 300:	489d                	li	a7,7
 ecall
 302:	00000073          	ecall
 ret
 306:	8082                	ret

0000000000000308 <open>:
.global open
open:
 li a7, SYS_open
 308:	48bd                	li	a7,15
 ecall
 30a:	00000073          	ecall
 ret
 30e:	8082                	ret

0000000000000310 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 310:	48c5                	li	a7,17
 ecall
 312:	00000073          	ecall
 ret
 316:	8082                	ret

0000000000000318 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 318:	48c9                	li	a7,18
 ecall
 31a:	00000073          	ecall
 ret
 31e:	8082                	ret

0000000000000320 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 320:	48a1                	li	a7,8
 ecall
 322:	00000073          	ecall
 ret
 326:	8082                	ret

0000000000000328 <link>:
.global link
link:
 li a7, SYS_link
 328:	48cd                	li	a7,19
 ecall
 32a:	00000073          	ecall
 ret
 32e:	8082                	ret

0000000000000330 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 330:	48d1                	li	a7,20
 ecall
 332:	00000073          	ecall
 ret
 336:	8082                	ret

0000000000000338 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 338:	48a5                	li	a7,9
 ecall
 33a:	00000073          	ecall
 ret
 33e:	8082                	ret

0000000000000340 <dup>:
.global dup
dup:
 li a7, SYS_dup
 340:	48a9                	li	a7,10
 ecall
 342:	00000073          	ecall
 ret
 346:	8082                	ret

0000000000000348 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 348:	48ad                	li	a7,11
 ecall
 34a:	00000073          	ecall
 ret
 34e:	8082                	ret

0000000000000350 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 350:	48b1                	li	a7,12
 ecall
 352:	00000073          	ecall
 ret
 356:	8082                	ret

0000000000000358 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 358:	48b5                	li	a7,13
 ecall
 35a:	00000073          	ecall
 ret
 35e:	8082                	ret

0000000000000360 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 360:	48b9                	li	a7,14
 ecall
 362:	00000073          	ecall
 ret
 366:	8082                	ret

0000000000000368 <set_priority>:
.global set_priority
set_priority:
 li a7, SYS_set_priority
 368:	48d9                	li	a7,22
 ecall
 36a:	00000073          	ecall
 ret
 36e:	8082                	ret

0000000000000370 <trace>:
.global trace
trace:
 li a7, SYS_trace
 370:	48dd                	li	a7,23
 ecall
 372:	00000073          	ecall
 ret
 376:	8082                	ret

0000000000000378 <putc>:
 378:	1101                	addi	sp,sp,-32
 37a:	ec06                	sd	ra,24(sp)
 37c:	e822                	sd	s0,16(sp)
 37e:	1000                	addi	s0,sp,32
 380:	feb407a3          	sb	a1,-17(s0)
 384:	4605                	li	a2,1
 386:	fef40593          	addi	a1,s0,-17
 38a:	00000097          	auipc	ra,0x0
 38e:	f5e080e7          	jalr	-162(ra) # 2e8 <write>
 392:	60e2                	ld	ra,24(sp)
 394:	6442                	ld	s0,16(sp)
 396:	6105                	addi	sp,sp,32
 398:	8082                	ret

000000000000039a <printint>:
 39a:	7139                	addi	sp,sp,-64
 39c:	fc06                	sd	ra,56(sp)
 39e:	f822                	sd	s0,48(sp)
 3a0:	f426                	sd	s1,40(sp)
 3a2:	f04a                	sd	s2,32(sp)
 3a4:	ec4e                	sd	s3,24(sp)
 3a6:	0080                	addi	s0,sp,64
 3a8:	84aa                	mv	s1,a0
 3aa:	c299                	beqz	a3,3b0 <printint+0x16>
 3ac:	0805c863          	bltz	a1,43c <printint+0xa2>
 3b0:	2581                	sext.w	a1,a1
 3b2:	4881                	li	a7,0
 3b4:	fc040693          	addi	a3,s0,-64
 3b8:	4701                	li	a4,0
 3ba:	2601                	sext.w	a2,a2
 3bc:	00000517          	auipc	a0,0x0
 3c0:	46450513          	addi	a0,a0,1124 # 820 <digits>
 3c4:	883a                	mv	a6,a4
 3c6:	2705                	addiw	a4,a4,1
 3c8:	02c5f7bb          	remuw	a5,a1,a2
 3cc:	1782                	slli	a5,a5,0x20
 3ce:	9381                	srli	a5,a5,0x20
 3d0:	97aa                	add	a5,a5,a0
 3d2:	0007c783          	lbu	a5,0(a5)
 3d6:	00f68023          	sb	a5,0(a3)
 3da:	0005879b          	sext.w	a5,a1
 3de:	02c5d5bb          	divuw	a1,a1,a2
 3e2:	0685                	addi	a3,a3,1
 3e4:	fec7f0e3          	bgeu	a5,a2,3c4 <printint+0x2a>
 3e8:	00088b63          	beqz	a7,3fe <printint+0x64>
 3ec:	fd040793          	addi	a5,s0,-48
 3f0:	973e                	add	a4,a4,a5
 3f2:	02d00793          	li	a5,45
 3f6:	fef70823          	sb	a5,-16(a4)
 3fa:	0028071b          	addiw	a4,a6,2
 3fe:	02e05863          	blez	a4,42e <printint+0x94>
 402:	fc040793          	addi	a5,s0,-64
 406:	00e78933          	add	s2,a5,a4
 40a:	fff78993          	addi	s3,a5,-1
 40e:	99ba                	add	s3,s3,a4
 410:	377d                	addiw	a4,a4,-1
 412:	1702                	slli	a4,a4,0x20
 414:	9301                	srli	a4,a4,0x20
 416:	40e989b3          	sub	s3,s3,a4
 41a:	fff94583          	lbu	a1,-1(s2)
 41e:	8526                	mv	a0,s1
 420:	00000097          	auipc	ra,0x0
 424:	f58080e7          	jalr	-168(ra) # 378 <putc>
 428:	197d                	addi	s2,s2,-1
 42a:	ff3918e3          	bne	s2,s3,41a <printint+0x80>
 42e:	70e2                	ld	ra,56(sp)
 430:	7442                	ld	s0,48(sp)
 432:	74a2                	ld	s1,40(sp)
 434:	7902                	ld	s2,32(sp)
 436:	69e2                	ld	s3,24(sp)
 438:	6121                	addi	sp,sp,64
 43a:	8082                	ret
 43c:	40b005bb          	negw	a1,a1
 440:	4885                	li	a7,1
 442:	bf8d                	j	3b4 <printint+0x1a>

0000000000000444 <vprintf>:
 444:	7119                	addi	sp,sp,-128
 446:	fc86                	sd	ra,120(sp)
 448:	f8a2                	sd	s0,112(sp)
 44a:	f4a6                	sd	s1,104(sp)
 44c:	f0ca                	sd	s2,96(sp)
 44e:	ecce                	sd	s3,88(sp)
 450:	e8d2                	sd	s4,80(sp)
 452:	e4d6                	sd	s5,72(sp)
 454:	e0da                	sd	s6,64(sp)
 456:	fc5e                	sd	s7,56(sp)
 458:	f862                	sd	s8,48(sp)
 45a:	f466                	sd	s9,40(sp)
 45c:	f06a                	sd	s10,32(sp)
 45e:	ec6e                	sd	s11,24(sp)
 460:	0100                	addi	s0,sp,128
 462:	0005c903          	lbu	s2,0(a1)
 466:	18090f63          	beqz	s2,604 <vprintf+0x1c0>
 46a:	8aaa                	mv	s5,a0
 46c:	8b32                	mv	s6,a2
 46e:	00158493          	addi	s1,a1,1
 472:	4981                	li	s3,0
 474:	02500a13          	li	s4,37
 478:	06400c13          	li	s8,100
 47c:	06c00c93          	li	s9,108
 480:	07800d13          	li	s10,120
 484:	07000d93          	li	s11,112
 488:	00000b97          	auipc	s7,0x0
 48c:	398b8b93          	addi	s7,s7,920 # 820 <digits>
 490:	a839                	j	4ae <vprintf+0x6a>
 492:	85ca                	mv	a1,s2
 494:	8556                	mv	a0,s5
 496:	00000097          	auipc	ra,0x0
 49a:	ee2080e7          	jalr	-286(ra) # 378 <putc>
 49e:	a019                	j	4a4 <vprintf+0x60>
 4a0:	01498f63          	beq	s3,s4,4be <vprintf+0x7a>
 4a4:	0485                	addi	s1,s1,1
 4a6:	fff4c903          	lbu	s2,-1(s1)
 4aa:	14090d63          	beqz	s2,604 <vprintf+0x1c0>
 4ae:	0009079b          	sext.w	a5,s2
 4b2:	fe0997e3          	bnez	s3,4a0 <vprintf+0x5c>
 4b6:	fd479ee3          	bne	a5,s4,492 <vprintf+0x4e>
 4ba:	89be                	mv	s3,a5
 4bc:	b7e5                	j	4a4 <vprintf+0x60>
 4be:	05878063          	beq	a5,s8,4fe <vprintf+0xba>
 4c2:	05978c63          	beq	a5,s9,51a <vprintf+0xd6>
 4c6:	07a78863          	beq	a5,s10,536 <vprintf+0xf2>
 4ca:	09b78463          	beq	a5,s11,552 <vprintf+0x10e>
 4ce:	07300713          	li	a4,115
 4d2:	0ce78663          	beq	a5,a4,59e <vprintf+0x15a>
 4d6:	06300713          	li	a4,99
 4da:	0ee78e63          	beq	a5,a4,5d6 <vprintf+0x192>
 4de:	11478863          	beq	a5,s4,5ee <vprintf+0x1aa>
 4e2:	85d2                	mv	a1,s4
 4e4:	8556                	mv	a0,s5
 4e6:	00000097          	auipc	ra,0x0
 4ea:	e92080e7          	jalr	-366(ra) # 378 <putc>
 4ee:	85ca                	mv	a1,s2
 4f0:	8556                	mv	a0,s5
 4f2:	00000097          	auipc	ra,0x0
 4f6:	e86080e7          	jalr	-378(ra) # 378 <putc>
 4fa:	4981                	li	s3,0
 4fc:	b765                	j	4a4 <vprintf+0x60>
 4fe:	008b0913          	addi	s2,s6,8
 502:	4685                	li	a3,1
 504:	4629                	li	a2,10
 506:	000b2583          	lw	a1,0(s6)
 50a:	8556                	mv	a0,s5
 50c:	00000097          	auipc	ra,0x0
 510:	e8e080e7          	jalr	-370(ra) # 39a <printint>
 514:	8b4a                	mv	s6,s2
 516:	4981                	li	s3,0
 518:	b771                	j	4a4 <vprintf+0x60>
 51a:	008b0913          	addi	s2,s6,8
 51e:	4681                	li	a3,0
 520:	4629                	li	a2,10
 522:	000b2583          	lw	a1,0(s6)
 526:	8556                	mv	a0,s5
 528:	00000097          	auipc	ra,0x0
 52c:	e72080e7          	jalr	-398(ra) # 39a <printint>
 530:	8b4a                	mv	s6,s2
 532:	4981                	li	s3,0
 534:	bf85                	j	4a4 <vprintf+0x60>
 536:	008b0913          	addi	s2,s6,8
 53a:	4681                	li	a3,0
 53c:	4641                	li	a2,16
 53e:	000b2583          	lw	a1,0(s6)
 542:	8556                	mv	a0,s5
 544:	00000097          	auipc	ra,0x0
 548:	e56080e7          	jalr	-426(ra) # 39a <printint>
 54c:	8b4a                	mv	s6,s2
 54e:	4981                	li	s3,0
 550:	bf91                	j	4a4 <vprintf+0x60>
 552:	008b0793          	addi	a5,s6,8
 556:	f8f43423          	sd	a5,-120(s0)
 55a:	000b3983          	ld	s3,0(s6)
 55e:	03000593          	li	a1,48
 562:	8556                	mv	a0,s5
 564:	00000097          	auipc	ra,0x0
 568:	e14080e7          	jalr	-492(ra) # 378 <putc>
 56c:	85ea                	mv	a1,s10
 56e:	8556                	mv	a0,s5
 570:	00000097          	auipc	ra,0x0
 574:	e08080e7          	jalr	-504(ra) # 378 <putc>
 578:	4941                	li	s2,16
 57a:	03c9d793          	srli	a5,s3,0x3c
 57e:	97de                	add	a5,a5,s7
 580:	0007c583          	lbu	a1,0(a5)
 584:	8556                	mv	a0,s5
 586:	00000097          	auipc	ra,0x0
 58a:	df2080e7          	jalr	-526(ra) # 378 <putc>
 58e:	0992                	slli	s3,s3,0x4
 590:	397d                	addiw	s2,s2,-1
 592:	fe0914e3          	bnez	s2,57a <vprintf+0x136>
 596:	f8843b03          	ld	s6,-120(s0)
 59a:	4981                	li	s3,0
 59c:	b721                	j	4a4 <vprintf+0x60>
 59e:	008b0993          	addi	s3,s6,8
 5a2:	000b3903          	ld	s2,0(s6)
 5a6:	02090163          	beqz	s2,5c8 <vprintf+0x184>
 5aa:	00094583          	lbu	a1,0(s2)
 5ae:	c9a1                	beqz	a1,5fe <vprintf+0x1ba>
 5b0:	8556                	mv	a0,s5
 5b2:	00000097          	auipc	ra,0x0
 5b6:	dc6080e7          	jalr	-570(ra) # 378 <putc>
 5ba:	0905                	addi	s2,s2,1
 5bc:	00094583          	lbu	a1,0(s2)
 5c0:	f9e5                	bnez	a1,5b0 <vprintf+0x16c>
 5c2:	8b4e                	mv	s6,s3
 5c4:	4981                	li	s3,0
 5c6:	bdf9                	j	4a4 <vprintf+0x60>
 5c8:	00000917          	auipc	s2,0x0
 5cc:	25090913          	addi	s2,s2,592 # 818 <malloc+0x10a>
 5d0:	02800593          	li	a1,40
 5d4:	bff1                	j	5b0 <vprintf+0x16c>
 5d6:	008b0913          	addi	s2,s6,8
 5da:	000b4583          	lbu	a1,0(s6)
 5de:	8556                	mv	a0,s5
 5e0:	00000097          	auipc	ra,0x0
 5e4:	d98080e7          	jalr	-616(ra) # 378 <putc>
 5e8:	8b4a                	mv	s6,s2
 5ea:	4981                	li	s3,0
 5ec:	bd65                	j	4a4 <vprintf+0x60>
 5ee:	85d2                	mv	a1,s4
 5f0:	8556                	mv	a0,s5
 5f2:	00000097          	auipc	ra,0x0
 5f6:	d86080e7          	jalr	-634(ra) # 378 <putc>
 5fa:	4981                	li	s3,0
 5fc:	b565                	j	4a4 <vprintf+0x60>
 5fe:	8b4e                	mv	s6,s3
 600:	4981                	li	s3,0
 602:	b54d                	j	4a4 <vprintf+0x60>
 604:	70e6                	ld	ra,120(sp)
 606:	7446                	ld	s0,112(sp)
 608:	74a6                	ld	s1,104(sp)
 60a:	7906                	ld	s2,96(sp)
 60c:	69e6                	ld	s3,88(sp)
 60e:	6a46                	ld	s4,80(sp)
 610:	6aa6                	ld	s5,72(sp)
 612:	6b06                	ld	s6,64(sp)
 614:	7be2                	ld	s7,56(sp)
 616:	7c42                	ld	s8,48(sp)
 618:	7ca2                	ld	s9,40(sp)
 61a:	7d02                	ld	s10,32(sp)
 61c:	6de2                	ld	s11,24(sp)
 61e:	6109                	addi	sp,sp,128
 620:	8082                	ret

0000000000000622 <fprintf>:
 622:	715d                	addi	sp,sp,-80
 624:	ec06                	sd	ra,24(sp)
 626:	e822                	sd	s0,16(sp)
 628:	1000                	addi	s0,sp,32
 62a:	e010                	sd	a2,0(s0)
 62c:	e414                	sd	a3,8(s0)
 62e:	e818                	sd	a4,16(s0)
 630:	ec1c                	sd	a5,24(s0)
 632:	03043023          	sd	a6,32(s0)
 636:	03143423          	sd	a7,40(s0)
 63a:	fe843423          	sd	s0,-24(s0)
 63e:	8622                	mv	a2,s0
 640:	00000097          	auipc	ra,0x0
 644:	e04080e7          	jalr	-508(ra) # 444 <vprintf>
 648:	60e2                	ld	ra,24(sp)
 64a:	6442                	ld	s0,16(sp)
 64c:	6161                	addi	sp,sp,80
 64e:	8082                	ret

0000000000000650 <printf>:
 650:	711d                	addi	sp,sp,-96
 652:	ec06                	sd	ra,24(sp)
 654:	e822                	sd	s0,16(sp)
 656:	1000                	addi	s0,sp,32
 658:	e40c                	sd	a1,8(s0)
 65a:	e810                	sd	a2,16(s0)
 65c:	ec14                	sd	a3,24(s0)
 65e:	f018                	sd	a4,32(s0)
 660:	f41c                	sd	a5,40(s0)
 662:	03043823          	sd	a6,48(s0)
 666:	03143c23          	sd	a7,56(s0)
 66a:	00840613          	addi	a2,s0,8
 66e:	fec43423          	sd	a2,-24(s0)
 672:	85aa                	mv	a1,a0
 674:	4505                	li	a0,1
 676:	00000097          	auipc	ra,0x0
 67a:	dce080e7          	jalr	-562(ra) # 444 <vprintf>
 67e:	60e2                	ld	ra,24(sp)
 680:	6442                	ld	s0,16(sp)
 682:	6125                	addi	sp,sp,96
 684:	8082                	ret

0000000000000686 <free>:
 686:	1141                	addi	sp,sp,-16
 688:	e422                	sd	s0,8(sp)
 68a:	0800                	addi	s0,sp,16
 68c:	ff050693          	addi	a3,a0,-16
 690:	00000797          	auipc	a5,0x0
 694:	1a87b783          	ld	a5,424(a5) # 838 <freep>
 698:	a805                	j	6c8 <free+0x42>
 69a:	4618                	lw	a4,8(a2)
 69c:	9db9                	addw	a1,a1,a4
 69e:	feb52c23          	sw	a1,-8(a0)
 6a2:	6398                	ld	a4,0(a5)
 6a4:	6318                	ld	a4,0(a4)
 6a6:	fee53823          	sd	a4,-16(a0)
 6aa:	a091                	j	6ee <free+0x68>
 6ac:	ff852703          	lw	a4,-8(a0)
 6b0:	9e39                	addw	a2,a2,a4
 6b2:	c790                	sw	a2,8(a5)
 6b4:	ff053703          	ld	a4,-16(a0)
 6b8:	e398                	sd	a4,0(a5)
 6ba:	a099                	j	700 <free+0x7a>
 6bc:	6398                	ld	a4,0(a5)
 6be:	00e7e463          	bltu	a5,a4,6c6 <free+0x40>
 6c2:	00e6ea63          	bltu	a3,a4,6d6 <free+0x50>
 6c6:	87ba                	mv	a5,a4
 6c8:	fed7fae3          	bgeu	a5,a3,6bc <free+0x36>
 6cc:	6398                	ld	a4,0(a5)
 6ce:	00e6e463          	bltu	a3,a4,6d6 <free+0x50>
 6d2:	fee7eae3          	bltu	a5,a4,6c6 <free+0x40>
 6d6:	ff852583          	lw	a1,-8(a0)
 6da:	6390                	ld	a2,0(a5)
 6dc:	02059713          	slli	a4,a1,0x20
 6e0:	9301                	srli	a4,a4,0x20
 6e2:	0712                	slli	a4,a4,0x4
 6e4:	9736                	add	a4,a4,a3
 6e6:	fae60ae3          	beq	a2,a4,69a <free+0x14>
 6ea:	fec53823          	sd	a2,-16(a0)
 6ee:	4790                	lw	a2,8(a5)
 6f0:	02061713          	slli	a4,a2,0x20
 6f4:	9301                	srli	a4,a4,0x20
 6f6:	0712                	slli	a4,a4,0x4
 6f8:	973e                	add	a4,a4,a5
 6fa:	fae689e3          	beq	a3,a4,6ac <free+0x26>
 6fe:	e394                	sd	a3,0(a5)
 700:	00000717          	auipc	a4,0x0
 704:	12f73c23          	sd	a5,312(a4) # 838 <freep>
 708:	6422                	ld	s0,8(sp)
 70a:	0141                	addi	sp,sp,16
 70c:	8082                	ret

000000000000070e <malloc>:
 70e:	7139                	addi	sp,sp,-64
 710:	fc06                	sd	ra,56(sp)
 712:	f822                	sd	s0,48(sp)
 714:	f426                	sd	s1,40(sp)
 716:	f04a                	sd	s2,32(sp)
 718:	ec4e                	sd	s3,24(sp)
 71a:	e852                	sd	s4,16(sp)
 71c:	e456                	sd	s5,8(sp)
 71e:	e05a                	sd	s6,0(sp)
 720:	0080                	addi	s0,sp,64
 722:	02051493          	slli	s1,a0,0x20
 726:	9081                	srli	s1,s1,0x20
 728:	04bd                	addi	s1,s1,15
 72a:	8091                	srli	s1,s1,0x4
 72c:	0014899b          	addiw	s3,s1,1
 730:	0485                	addi	s1,s1,1
 732:	00000517          	auipc	a0,0x0
 736:	10653503          	ld	a0,262(a0) # 838 <freep>
 73a:	c515                	beqz	a0,766 <malloc+0x58>
 73c:	611c                	ld	a5,0(a0)
 73e:	4798                	lw	a4,8(a5)
 740:	02977f63          	bgeu	a4,s1,77e <malloc+0x70>
 744:	8a4e                	mv	s4,s3
 746:	0009871b          	sext.w	a4,s3
 74a:	6685                	lui	a3,0x1
 74c:	00d77363          	bgeu	a4,a3,752 <malloc+0x44>
 750:	6a05                	lui	s4,0x1
 752:	000a0b1b          	sext.w	s6,s4
 756:	004a1a1b          	slliw	s4,s4,0x4
 75a:	00000917          	auipc	s2,0x0
 75e:	0de90913          	addi	s2,s2,222 # 838 <freep>
 762:	5afd                	li	s5,-1
 764:	a88d                	j	7d6 <malloc+0xc8>
 766:	00000797          	auipc	a5,0x0
 76a:	0da78793          	addi	a5,a5,218 # 840 <base>
 76e:	00000717          	auipc	a4,0x0
 772:	0cf73523          	sd	a5,202(a4) # 838 <freep>
 776:	e39c                	sd	a5,0(a5)
 778:	0007a423          	sw	zero,8(a5)
 77c:	b7e1                	j	744 <malloc+0x36>
 77e:	02e48b63          	beq	s1,a4,7b4 <malloc+0xa6>
 782:	4137073b          	subw	a4,a4,s3
 786:	c798                	sw	a4,8(a5)
 788:	1702                	slli	a4,a4,0x20
 78a:	9301                	srli	a4,a4,0x20
 78c:	0712                	slli	a4,a4,0x4
 78e:	97ba                	add	a5,a5,a4
 790:	0137a423          	sw	s3,8(a5)
 794:	00000717          	auipc	a4,0x0
 798:	0aa73223          	sd	a0,164(a4) # 838 <freep>
 79c:	01078513          	addi	a0,a5,16
 7a0:	70e2                	ld	ra,56(sp)
 7a2:	7442                	ld	s0,48(sp)
 7a4:	74a2                	ld	s1,40(sp)
 7a6:	7902                	ld	s2,32(sp)
 7a8:	69e2                	ld	s3,24(sp)
 7aa:	6a42                	ld	s4,16(sp)
 7ac:	6aa2                	ld	s5,8(sp)
 7ae:	6b02                	ld	s6,0(sp)
 7b0:	6121                	addi	sp,sp,64
 7b2:	8082                	ret
 7b4:	6398                	ld	a4,0(a5)
 7b6:	e118                	sd	a4,0(a0)
 7b8:	bff1                	j	794 <malloc+0x86>
 7ba:	01652423          	sw	s6,8(a0)
 7be:	0541                	addi	a0,a0,16
 7c0:	00000097          	auipc	ra,0x0
 7c4:	ec6080e7          	jalr	-314(ra) # 686 <free>
 7c8:	00093503          	ld	a0,0(s2)
 7cc:	d971                	beqz	a0,7a0 <malloc+0x92>
 7ce:	611c                	ld	a5,0(a0)
 7d0:	4798                	lw	a4,8(a5)
 7d2:	fa9776e3          	bgeu	a4,s1,77e <malloc+0x70>
 7d6:	00093703          	ld	a4,0(s2)
 7da:	853e                	mv	a0,a5
 7dc:	fef719e3          	bne	a4,a5,7ce <malloc+0xc0>
 7e0:	8552                	mv	a0,s4
 7e2:	00000097          	auipc	ra,0x0
 7e6:	b6e080e7          	jalr	-1170(ra) # 350 <sbrk>
 7ea:	fd5518e3          	bne	a0,s5,7ba <malloc+0xac>
 7ee:	4501                	li	a0,0
 7f0:	bf45                	j	7a0 <malloc+0x92>
