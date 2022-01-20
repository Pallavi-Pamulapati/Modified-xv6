
user/_strace:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

int main(int argc, char **argv)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	1800                	addi	s0,sp,48
   a:	84ae                	mv	s1,a1
    int pid = fork();
   c:	00000097          	auipc	ra,0x0
  10:	2c4080e7          	jalr	708(ra) # 2d0 <fork>
    if (!pid)
  14:	ed05                	bnez	a0,4c <main+0x4c>
    {
        trace(atoi(argv[1]));
  16:	6488                	ld	a0,8(s1)
  18:	00000097          	auipc	ra,0x0
  1c:	1c0080e7          	jalr	448(ra) # 1d8 <atoi>
  20:	00000097          	auipc	ra,0x0
  24:	360080e7          	jalr	864(ra) # 380 <trace>

        if (exec(argv[2], argv + 2) < 0)
  28:	01048593          	addi	a1,s1,16
  2c:	6888                	ld	a0,16(s1)
  2e:	00000097          	auipc	ra,0x0
  32:	2e2080e7          	jalr	738(ra) # 310 <exec>
  36:	02055163          	bgez	a0,58 <main+0x58>
            printf("Exec error\n");
  3a:	00000517          	auipc	a0,0x0
  3e:	7ce50513          	addi	a0,a0,1998 # 808 <malloc+0xea>
  42:	00000097          	auipc	ra,0x0
  46:	61e080e7          	jalr	1566(ra) # 660 <printf>
  4a:	a039                	j	58 <main+0x58>
    }
    else
    {
        int status;
        wait(&status);
  4c:	fdc40513          	addi	a0,s0,-36
  50:	00000097          	auipc	ra,0x0
  54:	290080e7          	jalr	656(ra) # 2e0 <wait>
    }
    // return 0;
    exit(0);
  58:	4501                	li	a0,0
  5a:	00000097          	auipc	ra,0x0
  5e:	27e080e7          	jalr	638(ra) # 2d8 <exit>

0000000000000062 <strcpy>:
  62:	1141                	addi	sp,sp,-16
  64:	e422                	sd	s0,8(sp)
  66:	0800                	addi	s0,sp,16
  68:	87aa                	mv	a5,a0
  6a:	0585                	addi	a1,a1,1
  6c:	0785                	addi	a5,a5,1
  6e:	fff5c703          	lbu	a4,-1(a1)
  72:	fee78fa3          	sb	a4,-1(a5)
  76:	fb75                	bnez	a4,6a <strcpy+0x8>
  78:	6422                	ld	s0,8(sp)
  7a:	0141                	addi	sp,sp,16
  7c:	8082                	ret

000000000000007e <strcmp>:
  7e:	1141                	addi	sp,sp,-16
  80:	e422                	sd	s0,8(sp)
  82:	0800                	addi	s0,sp,16
  84:	00054783          	lbu	a5,0(a0)
  88:	cb91                	beqz	a5,9c <strcmp+0x1e>
  8a:	0005c703          	lbu	a4,0(a1)
  8e:	00f71763          	bne	a4,a5,9c <strcmp+0x1e>
  92:	0505                	addi	a0,a0,1
  94:	0585                	addi	a1,a1,1
  96:	00054783          	lbu	a5,0(a0)
  9a:	fbe5                	bnez	a5,8a <strcmp+0xc>
  9c:	0005c503          	lbu	a0,0(a1)
  a0:	40a7853b          	subw	a0,a5,a0
  a4:	6422                	ld	s0,8(sp)
  a6:	0141                	addi	sp,sp,16
  a8:	8082                	ret

00000000000000aa <strlen>:
  aa:	1141                	addi	sp,sp,-16
  ac:	e422                	sd	s0,8(sp)
  ae:	0800                	addi	s0,sp,16
  b0:	00054783          	lbu	a5,0(a0)
  b4:	cf91                	beqz	a5,d0 <strlen+0x26>
  b6:	0505                	addi	a0,a0,1
  b8:	87aa                	mv	a5,a0
  ba:	4685                	li	a3,1
  bc:	9e89                	subw	a3,a3,a0
  be:	00f6853b          	addw	a0,a3,a5
  c2:	0785                	addi	a5,a5,1
  c4:	fff7c703          	lbu	a4,-1(a5)
  c8:	fb7d                	bnez	a4,be <strlen+0x14>
  ca:	6422                	ld	s0,8(sp)
  cc:	0141                	addi	sp,sp,16
  ce:	8082                	ret
  d0:	4501                	li	a0,0
  d2:	bfe5                	j	ca <strlen+0x20>

00000000000000d4 <memset>:
  d4:	1141                	addi	sp,sp,-16
  d6:	e422                	sd	s0,8(sp)
  d8:	0800                	addi	s0,sp,16
  da:	ce09                	beqz	a2,f4 <memset+0x20>
  dc:	87aa                	mv	a5,a0
  de:	fff6071b          	addiw	a4,a2,-1
  e2:	1702                	slli	a4,a4,0x20
  e4:	9301                	srli	a4,a4,0x20
  e6:	0705                	addi	a4,a4,1
  e8:	972a                	add	a4,a4,a0
  ea:	00b78023          	sb	a1,0(a5)
  ee:	0785                	addi	a5,a5,1
  f0:	fee79de3          	bne	a5,a4,ea <memset+0x16>
  f4:	6422                	ld	s0,8(sp)
  f6:	0141                	addi	sp,sp,16
  f8:	8082                	ret

00000000000000fa <strchr>:
  fa:	1141                	addi	sp,sp,-16
  fc:	e422                	sd	s0,8(sp)
  fe:	0800                	addi	s0,sp,16
 100:	00054783          	lbu	a5,0(a0)
 104:	cb99                	beqz	a5,11a <strchr+0x20>
 106:	00f58763          	beq	a1,a5,114 <strchr+0x1a>
 10a:	0505                	addi	a0,a0,1
 10c:	00054783          	lbu	a5,0(a0)
 110:	fbfd                	bnez	a5,106 <strchr+0xc>
 112:	4501                	li	a0,0
 114:	6422                	ld	s0,8(sp)
 116:	0141                	addi	sp,sp,16
 118:	8082                	ret
 11a:	4501                	li	a0,0
 11c:	bfe5                	j	114 <strchr+0x1a>

000000000000011e <gets>:
 11e:	711d                	addi	sp,sp,-96
 120:	ec86                	sd	ra,88(sp)
 122:	e8a2                	sd	s0,80(sp)
 124:	e4a6                	sd	s1,72(sp)
 126:	e0ca                	sd	s2,64(sp)
 128:	fc4e                	sd	s3,56(sp)
 12a:	f852                	sd	s4,48(sp)
 12c:	f456                	sd	s5,40(sp)
 12e:	f05a                	sd	s6,32(sp)
 130:	ec5e                	sd	s7,24(sp)
 132:	1080                	addi	s0,sp,96
 134:	8baa                	mv	s7,a0
 136:	8a2e                	mv	s4,a1
 138:	892a                	mv	s2,a0
 13a:	4481                	li	s1,0
 13c:	4aa9                	li	s5,10
 13e:	4b35                	li	s6,13
 140:	89a6                	mv	s3,s1
 142:	2485                	addiw	s1,s1,1
 144:	0344d863          	bge	s1,s4,174 <gets+0x56>
 148:	4605                	li	a2,1
 14a:	faf40593          	addi	a1,s0,-81
 14e:	4501                	li	a0,0
 150:	00000097          	auipc	ra,0x0
 154:	1a0080e7          	jalr	416(ra) # 2f0 <read>
 158:	00a05e63          	blez	a0,174 <gets+0x56>
 15c:	faf44783          	lbu	a5,-81(s0)
 160:	00f90023          	sb	a5,0(s2)
 164:	01578763          	beq	a5,s5,172 <gets+0x54>
 168:	0905                	addi	s2,s2,1
 16a:	fd679be3          	bne	a5,s6,140 <gets+0x22>
 16e:	89a6                	mv	s3,s1
 170:	a011                	j	174 <gets+0x56>
 172:	89a6                	mv	s3,s1
 174:	99de                	add	s3,s3,s7
 176:	00098023          	sb	zero,0(s3)
 17a:	855e                	mv	a0,s7
 17c:	60e6                	ld	ra,88(sp)
 17e:	6446                	ld	s0,80(sp)
 180:	64a6                	ld	s1,72(sp)
 182:	6906                	ld	s2,64(sp)
 184:	79e2                	ld	s3,56(sp)
 186:	7a42                	ld	s4,48(sp)
 188:	7aa2                	ld	s5,40(sp)
 18a:	7b02                	ld	s6,32(sp)
 18c:	6be2                	ld	s7,24(sp)
 18e:	6125                	addi	sp,sp,96
 190:	8082                	ret

0000000000000192 <stat>:
 192:	1101                	addi	sp,sp,-32
 194:	ec06                	sd	ra,24(sp)
 196:	e822                	sd	s0,16(sp)
 198:	e426                	sd	s1,8(sp)
 19a:	e04a                	sd	s2,0(sp)
 19c:	1000                	addi	s0,sp,32
 19e:	892e                	mv	s2,a1
 1a0:	4581                	li	a1,0
 1a2:	00000097          	auipc	ra,0x0
 1a6:	176080e7          	jalr	374(ra) # 318 <open>
 1aa:	02054563          	bltz	a0,1d4 <stat+0x42>
 1ae:	84aa                	mv	s1,a0
 1b0:	85ca                	mv	a1,s2
 1b2:	00000097          	auipc	ra,0x0
 1b6:	17e080e7          	jalr	382(ra) # 330 <fstat>
 1ba:	892a                	mv	s2,a0
 1bc:	8526                	mv	a0,s1
 1be:	00000097          	auipc	ra,0x0
 1c2:	142080e7          	jalr	322(ra) # 300 <close>
 1c6:	854a                	mv	a0,s2
 1c8:	60e2                	ld	ra,24(sp)
 1ca:	6442                	ld	s0,16(sp)
 1cc:	64a2                	ld	s1,8(sp)
 1ce:	6902                	ld	s2,0(sp)
 1d0:	6105                	addi	sp,sp,32
 1d2:	8082                	ret
 1d4:	597d                	li	s2,-1
 1d6:	bfc5                	j	1c6 <stat+0x34>

00000000000001d8 <atoi>:
 1d8:	1141                	addi	sp,sp,-16
 1da:	e422                	sd	s0,8(sp)
 1dc:	0800                	addi	s0,sp,16
 1de:	00054603          	lbu	a2,0(a0)
 1e2:	fd06079b          	addiw	a5,a2,-48
 1e6:	0ff7f793          	andi	a5,a5,255
 1ea:	4725                	li	a4,9
 1ec:	02f76963          	bltu	a4,a5,21e <atoi+0x46>
 1f0:	86aa                	mv	a3,a0
 1f2:	4501                	li	a0,0
 1f4:	45a5                	li	a1,9
 1f6:	0685                	addi	a3,a3,1
 1f8:	0025179b          	slliw	a5,a0,0x2
 1fc:	9fa9                	addw	a5,a5,a0
 1fe:	0017979b          	slliw	a5,a5,0x1
 202:	9fb1                	addw	a5,a5,a2
 204:	fd07851b          	addiw	a0,a5,-48
 208:	0006c603          	lbu	a2,0(a3)
 20c:	fd06071b          	addiw	a4,a2,-48
 210:	0ff77713          	andi	a4,a4,255
 214:	fee5f1e3          	bgeu	a1,a4,1f6 <atoi+0x1e>
 218:	6422                	ld	s0,8(sp)
 21a:	0141                	addi	sp,sp,16
 21c:	8082                	ret
 21e:	4501                	li	a0,0
 220:	bfe5                	j	218 <atoi+0x40>

0000000000000222 <memmove>:
 222:	1141                	addi	sp,sp,-16
 224:	e422                	sd	s0,8(sp)
 226:	0800                	addi	s0,sp,16
 228:	02b57663          	bgeu	a0,a1,254 <memmove+0x32>
 22c:	02c05163          	blez	a2,24e <memmove+0x2c>
 230:	fff6079b          	addiw	a5,a2,-1
 234:	1782                	slli	a5,a5,0x20
 236:	9381                	srli	a5,a5,0x20
 238:	0785                	addi	a5,a5,1
 23a:	97aa                	add	a5,a5,a0
 23c:	872a                	mv	a4,a0
 23e:	0585                	addi	a1,a1,1
 240:	0705                	addi	a4,a4,1
 242:	fff5c683          	lbu	a3,-1(a1)
 246:	fed70fa3          	sb	a3,-1(a4)
 24a:	fee79ae3          	bne	a5,a4,23e <memmove+0x1c>
 24e:	6422                	ld	s0,8(sp)
 250:	0141                	addi	sp,sp,16
 252:	8082                	ret
 254:	00c50733          	add	a4,a0,a2
 258:	95b2                	add	a1,a1,a2
 25a:	fec05ae3          	blez	a2,24e <memmove+0x2c>
 25e:	fff6079b          	addiw	a5,a2,-1
 262:	1782                	slli	a5,a5,0x20
 264:	9381                	srli	a5,a5,0x20
 266:	fff7c793          	not	a5,a5
 26a:	97ba                	add	a5,a5,a4
 26c:	15fd                	addi	a1,a1,-1
 26e:	177d                	addi	a4,a4,-1
 270:	0005c683          	lbu	a3,0(a1)
 274:	00d70023          	sb	a3,0(a4)
 278:	fee79ae3          	bne	a5,a4,26c <memmove+0x4a>
 27c:	bfc9                	j	24e <memmove+0x2c>

000000000000027e <memcmp>:
 27e:	1141                	addi	sp,sp,-16
 280:	e422                	sd	s0,8(sp)
 282:	0800                	addi	s0,sp,16
 284:	ca05                	beqz	a2,2b4 <memcmp+0x36>
 286:	fff6069b          	addiw	a3,a2,-1
 28a:	1682                	slli	a3,a3,0x20
 28c:	9281                	srli	a3,a3,0x20
 28e:	0685                	addi	a3,a3,1
 290:	96aa                	add	a3,a3,a0
 292:	00054783          	lbu	a5,0(a0)
 296:	0005c703          	lbu	a4,0(a1)
 29a:	00e79863          	bne	a5,a4,2aa <memcmp+0x2c>
 29e:	0505                	addi	a0,a0,1
 2a0:	0585                	addi	a1,a1,1
 2a2:	fed518e3          	bne	a0,a3,292 <memcmp+0x14>
 2a6:	4501                	li	a0,0
 2a8:	a019                	j	2ae <memcmp+0x30>
 2aa:	40e7853b          	subw	a0,a5,a4
 2ae:	6422                	ld	s0,8(sp)
 2b0:	0141                	addi	sp,sp,16
 2b2:	8082                	ret
 2b4:	4501                	li	a0,0
 2b6:	bfe5                	j	2ae <memcmp+0x30>

00000000000002b8 <memcpy>:
 2b8:	1141                	addi	sp,sp,-16
 2ba:	e406                	sd	ra,8(sp)
 2bc:	e022                	sd	s0,0(sp)
 2be:	0800                	addi	s0,sp,16
 2c0:	00000097          	auipc	ra,0x0
 2c4:	f62080e7          	jalr	-158(ra) # 222 <memmove>
 2c8:	60a2                	ld	ra,8(sp)
 2ca:	6402                	ld	s0,0(sp)
 2cc:	0141                	addi	sp,sp,16
 2ce:	8082                	ret

00000000000002d0 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 2d0:	4885                	li	a7,1
 ecall
 2d2:	00000073          	ecall
 ret
 2d6:	8082                	ret

00000000000002d8 <exit>:
.global exit
exit:
 li a7, SYS_exit
 2d8:	4889                	li	a7,2
 ecall
 2da:	00000073          	ecall
 ret
 2de:	8082                	ret

00000000000002e0 <wait>:
.global wait
wait:
 li a7, SYS_wait
 2e0:	488d                	li	a7,3
 ecall
 2e2:	00000073          	ecall
 ret
 2e6:	8082                	ret

00000000000002e8 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 2e8:	4891                	li	a7,4
 ecall
 2ea:	00000073          	ecall
 ret
 2ee:	8082                	ret

00000000000002f0 <read>:
.global read
read:
 li a7, SYS_read
 2f0:	4895                	li	a7,5
 ecall
 2f2:	00000073          	ecall
 ret
 2f6:	8082                	ret

00000000000002f8 <write>:
.global write
write:
 li a7, SYS_write
 2f8:	48c1                	li	a7,16
 ecall
 2fa:	00000073          	ecall
 ret
 2fe:	8082                	ret

0000000000000300 <close>:
.global close
close:
 li a7, SYS_close
 300:	48d5                	li	a7,21
 ecall
 302:	00000073          	ecall
 ret
 306:	8082                	ret

0000000000000308 <kill>:
.global kill
kill:
 li a7, SYS_kill
 308:	4899                	li	a7,6
 ecall
 30a:	00000073          	ecall
 ret
 30e:	8082                	ret

0000000000000310 <exec>:
.global exec
exec:
 li a7, SYS_exec
 310:	489d                	li	a7,7
 ecall
 312:	00000073          	ecall
 ret
 316:	8082                	ret

0000000000000318 <open>:
.global open
open:
 li a7, SYS_open
 318:	48bd                	li	a7,15
 ecall
 31a:	00000073          	ecall
 ret
 31e:	8082                	ret

0000000000000320 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 320:	48c5                	li	a7,17
 ecall
 322:	00000073          	ecall
 ret
 326:	8082                	ret

0000000000000328 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 328:	48c9                	li	a7,18
 ecall
 32a:	00000073          	ecall
 ret
 32e:	8082                	ret

0000000000000330 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 330:	48a1                	li	a7,8
 ecall
 332:	00000073          	ecall
 ret
 336:	8082                	ret

0000000000000338 <link>:
.global link
link:
 li a7, SYS_link
 338:	48cd                	li	a7,19
 ecall
 33a:	00000073          	ecall
 ret
 33e:	8082                	ret

0000000000000340 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 340:	48d1                	li	a7,20
 ecall
 342:	00000073          	ecall
 ret
 346:	8082                	ret

0000000000000348 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 348:	48a5                	li	a7,9
 ecall
 34a:	00000073          	ecall
 ret
 34e:	8082                	ret

0000000000000350 <dup>:
.global dup
dup:
 li a7, SYS_dup
 350:	48a9                	li	a7,10
 ecall
 352:	00000073          	ecall
 ret
 356:	8082                	ret

0000000000000358 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 358:	48ad                	li	a7,11
 ecall
 35a:	00000073          	ecall
 ret
 35e:	8082                	ret

0000000000000360 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 360:	48b1                	li	a7,12
 ecall
 362:	00000073          	ecall
 ret
 366:	8082                	ret

0000000000000368 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 368:	48b5                	li	a7,13
 ecall
 36a:	00000073          	ecall
 ret
 36e:	8082                	ret

0000000000000370 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 370:	48b9                	li	a7,14
 ecall
 372:	00000073          	ecall
 ret
 376:	8082                	ret

0000000000000378 <set_priority>:
.global set_priority
set_priority:
 li a7, SYS_set_priority
 378:	48d9                	li	a7,22
 ecall
 37a:	00000073          	ecall
 ret
 37e:	8082                	ret

0000000000000380 <trace>:
.global trace
trace:
 li a7, SYS_trace
 380:	48dd                	li	a7,23
 ecall
 382:	00000073          	ecall
 ret
 386:	8082                	ret

0000000000000388 <putc>:
 388:	1101                	addi	sp,sp,-32
 38a:	ec06                	sd	ra,24(sp)
 38c:	e822                	sd	s0,16(sp)
 38e:	1000                	addi	s0,sp,32
 390:	feb407a3          	sb	a1,-17(s0)
 394:	4605                	li	a2,1
 396:	fef40593          	addi	a1,s0,-17
 39a:	00000097          	auipc	ra,0x0
 39e:	f5e080e7          	jalr	-162(ra) # 2f8 <write>
 3a2:	60e2                	ld	ra,24(sp)
 3a4:	6442                	ld	s0,16(sp)
 3a6:	6105                	addi	sp,sp,32
 3a8:	8082                	ret

00000000000003aa <printint>:
 3aa:	7139                	addi	sp,sp,-64
 3ac:	fc06                	sd	ra,56(sp)
 3ae:	f822                	sd	s0,48(sp)
 3b0:	f426                	sd	s1,40(sp)
 3b2:	f04a                	sd	s2,32(sp)
 3b4:	ec4e                	sd	s3,24(sp)
 3b6:	0080                	addi	s0,sp,64
 3b8:	84aa                	mv	s1,a0
 3ba:	c299                	beqz	a3,3c0 <printint+0x16>
 3bc:	0805c863          	bltz	a1,44c <printint+0xa2>
 3c0:	2581                	sext.w	a1,a1
 3c2:	4881                	li	a7,0
 3c4:	fc040693          	addi	a3,s0,-64
 3c8:	4701                	li	a4,0
 3ca:	2601                	sext.w	a2,a2
 3cc:	00000517          	auipc	a0,0x0
 3d0:	45450513          	addi	a0,a0,1108 # 820 <digits>
 3d4:	883a                	mv	a6,a4
 3d6:	2705                	addiw	a4,a4,1
 3d8:	02c5f7bb          	remuw	a5,a1,a2
 3dc:	1782                	slli	a5,a5,0x20
 3de:	9381                	srli	a5,a5,0x20
 3e0:	97aa                	add	a5,a5,a0
 3e2:	0007c783          	lbu	a5,0(a5)
 3e6:	00f68023          	sb	a5,0(a3)
 3ea:	0005879b          	sext.w	a5,a1
 3ee:	02c5d5bb          	divuw	a1,a1,a2
 3f2:	0685                	addi	a3,a3,1
 3f4:	fec7f0e3          	bgeu	a5,a2,3d4 <printint+0x2a>
 3f8:	00088b63          	beqz	a7,40e <printint+0x64>
 3fc:	fd040793          	addi	a5,s0,-48
 400:	973e                	add	a4,a4,a5
 402:	02d00793          	li	a5,45
 406:	fef70823          	sb	a5,-16(a4)
 40a:	0028071b          	addiw	a4,a6,2
 40e:	02e05863          	blez	a4,43e <printint+0x94>
 412:	fc040793          	addi	a5,s0,-64
 416:	00e78933          	add	s2,a5,a4
 41a:	fff78993          	addi	s3,a5,-1
 41e:	99ba                	add	s3,s3,a4
 420:	377d                	addiw	a4,a4,-1
 422:	1702                	slli	a4,a4,0x20
 424:	9301                	srli	a4,a4,0x20
 426:	40e989b3          	sub	s3,s3,a4
 42a:	fff94583          	lbu	a1,-1(s2)
 42e:	8526                	mv	a0,s1
 430:	00000097          	auipc	ra,0x0
 434:	f58080e7          	jalr	-168(ra) # 388 <putc>
 438:	197d                	addi	s2,s2,-1
 43a:	ff3918e3          	bne	s2,s3,42a <printint+0x80>
 43e:	70e2                	ld	ra,56(sp)
 440:	7442                	ld	s0,48(sp)
 442:	74a2                	ld	s1,40(sp)
 444:	7902                	ld	s2,32(sp)
 446:	69e2                	ld	s3,24(sp)
 448:	6121                	addi	sp,sp,64
 44a:	8082                	ret
 44c:	40b005bb          	negw	a1,a1
 450:	4885                	li	a7,1
 452:	bf8d                	j	3c4 <printint+0x1a>

0000000000000454 <vprintf>:
 454:	7119                	addi	sp,sp,-128
 456:	fc86                	sd	ra,120(sp)
 458:	f8a2                	sd	s0,112(sp)
 45a:	f4a6                	sd	s1,104(sp)
 45c:	f0ca                	sd	s2,96(sp)
 45e:	ecce                	sd	s3,88(sp)
 460:	e8d2                	sd	s4,80(sp)
 462:	e4d6                	sd	s5,72(sp)
 464:	e0da                	sd	s6,64(sp)
 466:	fc5e                	sd	s7,56(sp)
 468:	f862                	sd	s8,48(sp)
 46a:	f466                	sd	s9,40(sp)
 46c:	f06a                	sd	s10,32(sp)
 46e:	ec6e                	sd	s11,24(sp)
 470:	0100                	addi	s0,sp,128
 472:	0005c903          	lbu	s2,0(a1)
 476:	18090f63          	beqz	s2,614 <vprintf+0x1c0>
 47a:	8aaa                	mv	s5,a0
 47c:	8b32                	mv	s6,a2
 47e:	00158493          	addi	s1,a1,1
 482:	4981                	li	s3,0
 484:	02500a13          	li	s4,37
 488:	06400c13          	li	s8,100
 48c:	06c00c93          	li	s9,108
 490:	07800d13          	li	s10,120
 494:	07000d93          	li	s11,112
 498:	00000b97          	auipc	s7,0x0
 49c:	388b8b93          	addi	s7,s7,904 # 820 <digits>
 4a0:	a839                	j	4be <vprintf+0x6a>
 4a2:	85ca                	mv	a1,s2
 4a4:	8556                	mv	a0,s5
 4a6:	00000097          	auipc	ra,0x0
 4aa:	ee2080e7          	jalr	-286(ra) # 388 <putc>
 4ae:	a019                	j	4b4 <vprintf+0x60>
 4b0:	01498f63          	beq	s3,s4,4ce <vprintf+0x7a>
 4b4:	0485                	addi	s1,s1,1
 4b6:	fff4c903          	lbu	s2,-1(s1)
 4ba:	14090d63          	beqz	s2,614 <vprintf+0x1c0>
 4be:	0009079b          	sext.w	a5,s2
 4c2:	fe0997e3          	bnez	s3,4b0 <vprintf+0x5c>
 4c6:	fd479ee3          	bne	a5,s4,4a2 <vprintf+0x4e>
 4ca:	89be                	mv	s3,a5
 4cc:	b7e5                	j	4b4 <vprintf+0x60>
 4ce:	05878063          	beq	a5,s8,50e <vprintf+0xba>
 4d2:	05978c63          	beq	a5,s9,52a <vprintf+0xd6>
 4d6:	07a78863          	beq	a5,s10,546 <vprintf+0xf2>
 4da:	09b78463          	beq	a5,s11,562 <vprintf+0x10e>
 4de:	07300713          	li	a4,115
 4e2:	0ce78663          	beq	a5,a4,5ae <vprintf+0x15a>
 4e6:	06300713          	li	a4,99
 4ea:	0ee78e63          	beq	a5,a4,5e6 <vprintf+0x192>
 4ee:	11478863          	beq	a5,s4,5fe <vprintf+0x1aa>
 4f2:	85d2                	mv	a1,s4
 4f4:	8556                	mv	a0,s5
 4f6:	00000097          	auipc	ra,0x0
 4fa:	e92080e7          	jalr	-366(ra) # 388 <putc>
 4fe:	85ca                	mv	a1,s2
 500:	8556                	mv	a0,s5
 502:	00000097          	auipc	ra,0x0
 506:	e86080e7          	jalr	-378(ra) # 388 <putc>
 50a:	4981                	li	s3,0
 50c:	b765                	j	4b4 <vprintf+0x60>
 50e:	008b0913          	addi	s2,s6,8
 512:	4685                	li	a3,1
 514:	4629                	li	a2,10
 516:	000b2583          	lw	a1,0(s6)
 51a:	8556                	mv	a0,s5
 51c:	00000097          	auipc	ra,0x0
 520:	e8e080e7          	jalr	-370(ra) # 3aa <printint>
 524:	8b4a                	mv	s6,s2
 526:	4981                	li	s3,0
 528:	b771                	j	4b4 <vprintf+0x60>
 52a:	008b0913          	addi	s2,s6,8
 52e:	4681                	li	a3,0
 530:	4629                	li	a2,10
 532:	000b2583          	lw	a1,0(s6)
 536:	8556                	mv	a0,s5
 538:	00000097          	auipc	ra,0x0
 53c:	e72080e7          	jalr	-398(ra) # 3aa <printint>
 540:	8b4a                	mv	s6,s2
 542:	4981                	li	s3,0
 544:	bf85                	j	4b4 <vprintf+0x60>
 546:	008b0913          	addi	s2,s6,8
 54a:	4681                	li	a3,0
 54c:	4641                	li	a2,16
 54e:	000b2583          	lw	a1,0(s6)
 552:	8556                	mv	a0,s5
 554:	00000097          	auipc	ra,0x0
 558:	e56080e7          	jalr	-426(ra) # 3aa <printint>
 55c:	8b4a                	mv	s6,s2
 55e:	4981                	li	s3,0
 560:	bf91                	j	4b4 <vprintf+0x60>
 562:	008b0793          	addi	a5,s6,8
 566:	f8f43423          	sd	a5,-120(s0)
 56a:	000b3983          	ld	s3,0(s6)
 56e:	03000593          	li	a1,48
 572:	8556                	mv	a0,s5
 574:	00000097          	auipc	ra,0x0
 578:	e14080e7          	jalr	-492(ra) # 388 <putc>
 57c:	85ea                	mv	a1,s10
 57e:	8556                	mv	a0,s5
 580:	00000097          	auipc	ra,0x0
 584:	e08080e7          	jalr	-504(ra) # 388 <putc>
 588:	4941                	li	s2,16
 58a:	03c9d793          	srli	a5,s3,0x3c
 58e:	97de                	add	a5,a5,s7
 590:	0007c583          	lbu	a1,0(a5)
 594:	8556                	mv	a0,s5
 596:	00000097          	auipc	ra,0x0
 59a:	df2080e7          	jalr	-526(ra) # 388 <putc>
 59e:	0992                	slli	s3,s3,0x4
 5a0:	397d                	addiw	s2,s2,-1
 5a2:	fe0914e3          	bnez	s2,58a <vprintf+0x136>
 5a6:	f8843b03          	ld	s6,-120(s0)
 5aa:	4981                	li	s3,0
 5ac:	b721                	j	4b4 <vprintf+0x60>
 5ae:	008b0993          	addi	s3,s6,8
 5b2:	000b3903          	ld	s2,0(s6)
 5b6:	02090163          	beqz	s2,5d8 <vprintf+0x184>
 5ba:	00094583          	lbu	a1,0(s2)
 5be:	c9a1                	beqz	a1,60e <vprintf+0x1ba>
 5c0:	8556                	mv	a0,s5
 5c2:	00000097          	auipc	ra,0x0
 5c6:	dc6080e7          	jalr	-570(ra) # 388 <putc>
 5ca:	0905                	addi	s2,s2,1
 5cc:	00094583          	lbu	a1,0(s2)
 5d0:	f9e5                	bnez	a1,5c0 <vprintf+0x16c>
 5d2:	8b4e                	mv	s6,s3
 5d4:	4981                	li	s3,0
 5d6:	bdf9                	j	4b4 <vprintf+0x60>
 5d8:	00000917          	auipc	s2,0x0
 5dc:	24090913          	addi	s2,s2,576 # 818 <malloc+0xfa>
 5e0:	02800593          	li	a1,40
 5e4:	bff1                	j	5c0 <vprintf+0x16c>
 5e6:	008b0913          	addi	s2,s6,8
 5ea:	000b4583          	lbu	a1,0(s6)
 5ee:	8556                	mv	a0,s5
 5f0:	00000097          	auipc	ra,0x0
 5f4:	d98080e7          	jalr	-616(ra) # 388 <putc>
 5f8:	8b4a                	mv	s6,s2
 5fa:	4981                	li	s3,0
 5fc:	bd65                	j	4b4 <vprintf+0x60>
 5fe:	85d2                	mv	a1,s4
 600:	8556                	mv	a0,s5
 602:	00000097          	auipc	ra,0x0
 606:	d86080e7          	jalr	-634(ra) # 388 <putc>
 60a:	4981                	li	s3,0
 60c:	b565                	j	4b4 <vprintf+0x60>
 60e:	8b4e                	mv	s6,s3
 610:	4981                	li	s3,0
 612:	b54d                	j	4b4 <vprintf+0x60>
 614:	70e6                	ld	ra,120(sp)
 616:	7446                	ld	s0,112(sp)
 618:	74a6                	ld	s1,104(sp)
 61a:	7906                	ld	s2,96(sp)
 61c:	69e6                	ld	s3,88(sp)
 61e:	6a46                	ld	s4,80(sp)
 620:	6aa6                	ld	s5,72(sp)
 622:	6b06                	ld	s6,64(sp)
 624:	7be2                	ld	s7,56(sp)
 626:	7c42                	ld	s8,48(sp)
 628:	7ca2                	ld	s9,40(sp)
 62a:	7d02                	ld	s10,32(sp)
 62c:	6de2                	ld	s11,24(sp)
 62e:	6109                	addi	sp,sp,128
 630:	8082                	ret

0000000000000632 <fprintf>:
 632:	715d                	addi	sp,sp,-80
 634:	ec06                	sd	ra,24(sp)
 636:	e822                	sd	s0,16(sp)
 638:	1000                	addi	s0,sp,32
 63a:	e010                	sd	a2,0(s0)
 63c:	e414                	sd	a3,8(s0)
 63e:	e818                	sd	a4,16(s0)
 640:	ec1c                	sd	a5,24(s0)
 642:	03043023          	sd	a6,32(s0)
 646:	03143423          	sd	a7,40(s0)
 64a:	fe843423          	sd	s0,-24(s0)
 64e:	8622                	mv	a2,s0
 650:	00000097          	auipc	ra,0x0
 654:	e04080e7          	jalr	-508(ra) # 454 <vprintf>
 658:	60e2                	ld	ra,24(sp)
 65a:	6442                	ld	s0,16(sp)
 65c:	6161                	addi	sp,sp,80
 65e:	8082                	ret

0000000000000660 <printf>:
 660:	711d                	addi	sp,sp,-96
 662:	ec06                	sd	ra,24(sp)
 664:	e822                	sd	s0,16(sp)
 666:	1000                	addi	s0,sp,32
 668:	e40c                	sd	a1,8(s0)
 66a:	e810                	sd	a2,16(s0)
 66c:	ec14                	sd	a3,24(s0)
 66e:	f018                	sd	a4,32(s0)
 670:	f41c                	sd	a5,40(s0)
 672:	03043823          	sd	a6,48(s0)
 676:	03143c23          	sd	a7,56(s0)
 67a:	00840613          	addi	a2,s0,8
 67e:	fec43423          	sd	a2,-24(s0)
 682:	85aa                	mv	a1,a0
 684:	4505                	li	a0,1
 686:	00000097          	auipc	ra,0x0
 68a:	dce080e7          	jalr	-562(ra) # 454 <vprintf>
 68e:	60e2                	ld	ra,24(sp)
 690:	6442                	ld	s0,16(sp)
 692:	6125                	addi	sp,sp,96
 694:	8082                	ret

0000000000000696 <free>:
 696:	1141                	addi	sp,sp,-16
 698:	e422                	sd	s0,8(sp)
 69a:	0800                	addi	s0,sp,16
 69c:	ff050693          	addi	a3,a0,-16
 6a0:	00000797          	auipc	a5,0x0
 6a4:	1987b783          	ld	a5,408(a5) # 838 <freep>
 6a8:	a805                	j	6d8 <free+0x42>
 6aa:	4618                	lw	a4,8(a2)
 6ac:	9db9                	addw	a1,a1,a4
 6ae:	feb52c23          	sw	a1,-8(a0)
 6b2:	6398                	ld	a4,0(a5)
 6b4:	6318                	ld	a4,0(a4)
 6b6:	fee53823          	sd	a4,-16(a0)
 6ba:	a091                	j	6fe <free+0x68>
 6bc:	ff852703          	lw	a4,-8(a0)
 6c0:	9e39                	addw	a2,a2,a4
 6c2:	c790                	sw	a2,8(a5)
 6c4:	ff053703          	ld	a4,-16(a0)
 6c8:	e398                	sd	a4,0(a5)
 6ca:	a099                	j	710 <free+0x7a>
 6cc:	6398                	ld	a4,0(a5)
 6ce:	00e7e463          	bltu	a5,a4,6d6 <free+0x40>
 6d2:	00e6ea63          	bltu	a3,a4,6e6 <free+0x50>
 6d6:	87ba                	mv	a5,a4
 6d8:	fed7fae3          	bgeu	a5,a3,6cc <free+0x36>
 6dc:	6398                	ld	a4,0(a5)
 6de:	00e6e463          	bltu	a3,a4,6e6 <free+0x50>
 6e2:	fee7eae3          	bltu	a5,a4,6d6 <free+0x40>
 6e6:	ff852583          	lw	a1,-8(a0)
 6ea:	6390                	ld	a2,0(a5)
 6ec:	02059713          	slli	a4,a1,0x20
 6f0:	9301                	srli	a4,a4,0x20
 6f2:	0712                	slli	a4,a4,0x4
 6f4:	9736                	add	a4,a4,a3
 6f6:	fae60ae3          	beq	a2,a4,6aa <free+0x14>
 6fa:	fec53823          	sd	a2,-16(a0)
 6fe:	4790                	lw	a2,8(a5)
 700:	02061713          	slli	a4,a2,0x20
 704:	9301                	srli	a4,a4,0x20
 706:	0712                	slli	a4,a4,0x4
 708:	973e                	add	a4,a4,a5
 70a:	fae689e3          	beq	a3,a4,6bc <free+0x26>
 70e:	e394                	sd	a3,0(a5)
 710:	00000717          	auipc	a4,0x0
 714:	12f73423          	sd	a5,296(a4) # 838 <freep>
 718:	6422                	ld	s0,8(sp)
 71a:	0141                	addi	sp,sp,16
 71c:	8082                	ret

000000000000071e <malloc>:
 71e:	7139                	addi	sp,sp,-64
 720:	fc06                	sd	ra,56(sp)
 722:	f822                	sd	s0,48(sp)
 724:	f426                	sd	s1,40(sp)
 726:	f04a                	sd	s2,32(sp)
 728:	ec4e                	sd	s3,24(sp)
 72a:	e852                	sd	s4,16(sp)
 72c:	e456                	sd	s5,8(sp)
 72e:	e05a                	sd	s6,0(sp)
 730:	0080                	addi	s0,sp,64
 732:	02051493          	slli	s1,a0,0x20
 736:	9081                	srli	s1,s1,0x20
 738:	04bd                	addi	s1,s1,15
 73a:	8091                	srli	s1,s1,0x4
 73c:	0014899b          	addiw	s3,s1,1
 740:	0485                	addi	s1,s1,1
 742:	00000517          	auipc	a0,0x0
 746:	0f653503          	ld	a0,246(a0) # 838 <freep>
 74a:	c515                	beqz	a0,776 <malloc+0x58>
 74c:	611c                	ld	a5,0(a0)
 74e:	4798                	lw	a4,8(a5)
 750:	02977f63          	bgeu	a4,s1,78e <malloc+0x70>
 754:	8a4e                	mv	s4,s3
 756:	0009871b          	sext.w	a4,s3
 75a:	6685                	lui	a3,0x1
 75c:	00d77363          	bgeu	a4,a3,762 <malloc+0x44>
 760:	6a05                	lui	s4,0x1
 762:	000a0b1b          	sext.w	s6,s4
 766:	004a1a1b          	slliw	s4,s4,0x4
 76a:	00000917          	auipc	s2,0x0
 76e:	0ce90913          	addi	s2,s2,206 # 838 <freep>
 772:	5afd                	li	s5,-1
 774:	a88d                	j	7e6 <malloc+0xc8>
 776:	00000797          	auipc	a5,0x0
 77a:	0ca78793          	addi	a5,a5,202 # 840 <base>
 77e:	00000717          	auipc	a4,0x0
 782:	0af73d23          	sd	a5,186(a4) # 838 <freep>
 786:	e39c                	sd	a5,0(a5)
 788:	0007a423          	sw	zero,8(a5)
 78c:	b7e1                	j	754 <malloc+0x36>
 78e:	02e48b63          	beq	s1,a4,7c4 <malloc+0xa6>
 792:	4137073b          	subw	a4,a4,s3
 796:	c798                	sw	a4,8(a5)
 798:	1702                	slli	a4,a4,0x20
 79a:	9301                	srli	a4,a4,0x20
 79c:	0712                	slli	a4,a4,0x4
 79e:	97ba                	add	a5,a5,a4
 7a0:	0137a423          	sw	s3,8(a5)
 7a4:	00000717          	auipc	a4,0x0
 7a8:	08a73a23          	sd	a0,148(a4) # 838 <freep>
 7ac:	01078513          	addi	a0,a5,16
 7b0:	70e2                	ld	ra,56(sp)
 7b2:	7442                	ld	s0,48(sp)
 7b4:	74a2                	ld	s1,40(sp)
 7b6:	7902                	ld	s2,32(sp)
 7b8:	69e2                	ld	s3,24(sp)
 7ba:	6a42                	ld	s4,16(sp)
 7bc:	6aa2                	ld	s5,8(sp)
 7be:	6b02                	ld	s6,0(sp)
 7c0:	6121                	addi	sp,sp,64
 7c2:	8082                	ret
 7c4:	6398                	ld	a4,0(a5)
 7c6:	e118                	sd	a4,0(a0)
 7c8:	bff1                	j	7a4 <malloc+0x86>
 7ca:	01652423          	sw	s6,8(a0)
 7ce:	0541                	addi	a0,a0,16
 7d0:	00000097          	auipc	ra,0x0
 7d4:	ec6080e7          	jalr	-314(ra) # 696 <free>
 7d8:	00093503          	ld	a0,0(s2)
 7dc:	d971                	beqz	a0,7b0 <malloc+0x92>
 7de:	611c                	ld	a5,0(a0)
 7e0:	4798                	lw	a4,8(a5)
 7e2:	fa9776e3          	bgeu	a4,s1,78e <malloc+0x70>
 7e6:	00093703          	ld	a4,0(s2)
 7ea:	853e                	mv	a0,a5
 7ec:	fef719e3          	bne	a4,a5,7de <malloc+0xc0>
 7f0:	8552                	mv	a0,s4
 7f2:	00000097          	auipc	ra,0x0
 7f6:	b6e080e7          	jalr	-1170(ra) # 360 <sbrk>
 7fa:	fd5518e3          	bne	a0,s5,7ca <malloc+0xac>
 7fe:	4501                	li	a0,0
 800:	bf45                	j	7b0 <malloc+0x92>
