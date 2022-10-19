
helloworld_again:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	f3 0f 1e fa          	endbr64 
  401004:	48 83 ec 08          	sub    rsp,0x8
  401008:	48 8b 05 e9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fe9]        # 403ff8 <__gmon_start__>
  40100f:	48 85 c0             	test   rax,rax
  401012:	74 02                	je     401016 <_init+0x16>
  401014:	ff d0                	call   rax
  401016:	48 83 c4 08          	add    rsp,0x8
  40101a:	c3                   	ret    

Disassembly of section .plt:

0000000000401020 <.plt>:
  401020:	ff 35 e2 2f 00 00    	push   QWORD PTR [rip+0x2fe2]        # 404008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	f2 ff 25 e3 2f 00 00 	bnd jmp QWORD PTR [rip+0x2fe3]        # 404010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102d:	0f 1f 00             	nop    DWORD PTR [rax]
  401030:	f3 0f 1e fa          	endbr64 
  401034:	68 00 00 00 00       	push   0x0
  401039:	f2 e9 e1 ff ff ff    	bnd jmp 401020 <.plt>
  40103f:	90                   	nop
  401040:	f3 0f 1e fa          	endbr64 
  401044:	68 01 00 00 00       	push   0x1
  401049:	f2 e9 d1 ff ff ff    	bnd jmp 401020 <.plt>
  40104f:	90                   	nop
  401050:	f3 0f 1e fa          	endbr64 
  401054:	68 02 00 00 00       	push   0x2
  401059:	f2 e9 c1 ff ff ff    	bnd jmp 401020 <.plt>
  40105f:	90                   	nop
  401060:	f3 0f 1e fa          	endbr64 
  401064:	68 03 00 00 00       	push   0x3
  401069:	f2 e9 b1 ff ff ff    	bnd jmp 401020 <.plt>
  40106f:	90                   	nop
  401070:	f3 0f 1e fa          	endbr64 
  401074:	68 04 00 00 00       	push   0x4
  401079:	f2 e9 a1 ff ff ff    	bnd jmp 401020 <.plt>
  40107f:	90                   	nop
  401080:	f3 0f 1e fa          	endbr64 
  401084:	68 05 00 00 00       	push   0x5
  401089:	f2 e9 91 ff ff ff    	bnd jmp 401020 <.plt>
  40108f:	90                   	nop
  401090:	f3 0f 1e fa          	endbr64 
  401094:	68 06 00 00 00       	push   0x6
  401099:	f2 e9 81 ff ff ff    	bnd jmp 401020 <.plt>
  40109f:	90                   	nop

Disassembly of section .plt.sec:

00000000004010a0 <puts@plt>:
  4010a0:	f3 0f 1e fa          	endbr64 
  4010a4:	f2 ff 25 6d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f6d]        # 404018 <puts@GLIBC_2.2.5>
  4010ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010b0 <strlen@plt>:
  4010b0:	f3 0f 1e fa          	endbr64 
  4010b4:	f2 ff 25 65 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f65]        # 404020 <strlen@GLIBC_2.2.5>
  4010bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010c0 <system@plt>:
  4010c0:	f3 0f 1e fa          	endbr64 
  4010c4:	f2 ff 25 5d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f5d]        # 404028 <system@GLIBC_2.2.5>
  4010cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010d0 <strcmp@plt>:
  4010d0:	f3 0f 1e fa          	endbr64 
  4010d4:	f2 ff 25 55 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f55]        # 404030 <strcmp@GLIBC_2.2.5>
  4010db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010e0 <setvbuf@plt>:
  4010e0:	f3 0f 1e fa          	endbr64 
  4010e4:	f2 ff 25 4d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f4d]        # 404038 <setvbuf@GLIBC_2.2.5>
  4010eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010f0 <__isoc99_scanf@plt>:
  4010f0:	f3 0f 1e fa          	endbr64 
  4010f4:	f2 ff 25 45 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f45]        # 404040 <__isoc99_scanf@GLIBC_2.7>
  4010fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000401100 <exit@plt>:
  401100:	f3 0f 1e fa          	endbr64 
  401104:	f2 ff 25 3d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f3d]        # 404048 <exit@GLIBC_2.2.5>
  40110b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

0000000000401110 <_start>:
  401110:	f3 0f 1e fa          	endbr64 
  401114:	31 ed                	xor    ebp,ebp
  401116:	49 89 d1             	mov    r9,rdx
  401119:	5e                   	pop    rsi
  40111a:	48 89 e2             	mov    rdx,rsp
  40111d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  401121:	50                   	push   rax
  401122:	54                   	push   rsp
  401123:	49 c7 c0 a0 14 40 00 	mov    r8,0x4014a0
  40112a:	48 c7 c1 30 14 40 00 	mov    rcx,0x401430
  401131:	48 c7 c7 72 12 40 00 	mov    rdi,0x401272
  401138:	ff 15 b2 2e 00 00    	call   QWORD PTR [rip+0x2eb2]        # 403ff0 <__libc_start_main@GLIBC_2.2.5>
  40113e:	f4                   	hlt    
  40113f:	90                   	nop

0000000000401140 <_dl_relocate_static_pie>:
  401140:	f3 0f 1e fa          	endbr64 
  401144:	c3                   	ret    
  401145:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40114c:	00 00 00 
  40114f:	90                   	nop

0000000000401150 <deregister_tm_clones>:
  401150:	b8 60 40 40 00       	mov    eax,0x404060
  401155:	48 3d 60 40 40 00    	cmp    rax,0x404060
  40115b:	74 13                	je     401170 <deregister_tm_clones+0x20>
  40115d:	b8 00 00 00 00       	mov    eax,0x0
  401162:	48 85 c0             	test   rax,rax
  401165:	74 09                	je     401170 <deregister_tm_clones+0x20>
  401167:	bf 60 40 40 00       	mov    edi,0x404060
  40116c:	ff e0                	jmp    rax
  40116e:	66 90                	xchg   ax,ax
  401170:	c3                   	ret    
  401171:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
  401178:	00 00 00 00 
  40117c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401180 <register_tm_clones>:
  401180:	be 60 40 40 00       	mov    esi,0x404060
  401185:	48 81 ee 60 40 40 00 	sub    rsi,0x404060
  40118c:	48 89 f0             	mov    rax,rsi
  40118f:	48 c1 ee 3f          	shr    rsi,0x3f
  401193:	48 c1 f8 03          	sar    rax,0x3
  401197:	48 01 c6             	add    rsi,rax
  40119a:	48 d1 fe             	sar    rsi,1
  40119d:	74 11                	je     4011b0 <register_tm_clones+0x30>
  40119f:	b8 00 00 00 00       	mov    eax,0x0
  4011a4:	48 85 c0             	test   rax,rax
  4011a7:	74 07                	je     4011b0 <register_tm_clones+0x30>
  4011a9:	bf 60 40 40 00       	mov    edi,0x404060
  4011ae:	ff e0                	jmp    rax
  4011b0:	c3                   	ret    
  4011b1:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
  4011b8:	00 00 00 00 
  4011bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000004011c0 <__do_global_dtors_aux>:
  4011c0:	f3 0f 1e fa          	endbr64 
  4011c4:	80 3d bd 2e 00 00 00 	cmp    BYTE PTR [rip+0x2ebd],0x0        # 404088 <completed.8061>
  4011cb:	75 13                	jne    4011e0 <__do_global_dtors_aux+0x20>
  4011cd:	55                   	push   rbp
  4011ce:	48 89 e5             	mov    rbp,rsp
  4011d1:	e8 7a ff ff ff       	call   401150 <deregister_tm_clones>
  4011d6:	c6 05 ab 2e 00 00 01 	mov    BYTE PTR [rip+0x2eab],0x1        # 404088 <completed.8061>
  4011dd:	5d                   	pop    rbp
  4011de:	c3                   	ret    
  4011df:	90                   	nop
  4011e0:	c3                   	ret    
  4011e1:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
  4011e8:	00 00 00 00 
  4011ec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000004011f0 <frame_dummy>:
  4011f0:	f3 0f 1e fa          	endbr64 
  4011f4:	eb 8a                	jmp    401180 <register_tm_clones>

00000000004011f6 <init>:
  4011f6:	f3 0f 1e fa          	endbr64 
  4011fa:	55                   	push   rbp
  4011fb:	48 89 e5             	mov    rbp,rsp
  4011fe:	48 8b 05 6b 2e 00 00 	mov    rax,QWORD PTR [rip+0x2e6b]        # 404070 <stdin@@GLIBC_2.2.5>
  401205:	b9 00 00 00 00       	mov    ecx,0x0
  40120a:	ba 02 00 00 00       	mov    edx,0x2
  40120f:	be 00 00 00 00       	mov    esi,0x0
  401214:	48 89 c7             	mov    rdi,rax
  401217:	e8 c4 fe ff ff       	call   4010e0 <setvbuf@plt>
  40121c:	48 8b 05 3d 2e 00 00 	mov    rax,QWORD PTR [rip+0x2e3d]        # 404060 <stdout@@GLIBC_2.2.5>
  401223:	b9 00 00 00 00       	mov    ecx,0x0
  401228:	ba 02 00 00 00       	mov    edx,0x2
  40122d:	be 00 00 00 00       	mov    esi,0x0
  401232:	48 89 c7             	mov    rdi,rax
  401235:	e8 a6 fe ff ff       	call   4010e0 <setvbuf@plt>
  40123a:	48 8b 05 3f 2e 00 00 	mov    rax,QWORD PTR [rip+0x2e3f]        # 404080 <stderr@@GLIBC_2.2.5>
  401241:	b9 00 00 00 00       	mov    ecx,0x0
  401246:	ba 02 00 00 00       	mov    edx,0x2
  40124b:	be 00 00 00 00       	mov    esi,0x0
  401250:	48 89 c7             	mov    rdi,rax
  401253:	e8 88 fe ff ff       	call   4010e0 <setvbuf@plt>
  401258:	90                   	nop
  401259:	5d                   	pop    rbp
  40125a:	c3                   	ret    

000000000040125b <helloworld>:
  40125b:	f3 0f 1e fa          	endbr64 
  40125f:	55                   	push   rbp
  401260:	48 89 e5             	mov    rbp,rsp
  401263:	48 8d 3d 9e 0d 00 00 	lea    rdi,[rip+0xd9e]        # 402008 <_IO_stdin_used+0x8>
  40126a:	e8 51 fe ff ff       	call   4010c0 <system@plt>
  40126f:	90                   	nop
  401270:	5d                   	pop    rbp
  401271:	c3                   	ret    

0000000000401272 <main>:
  401272:	f3 0f 1e fa          	endbr64 
  401276:	55                   	push   rbp
  401277:	48 89 e5             	mov    rbp,rsp
  40127a:	48 83 ec 20          	sub    rsp,0x20
  40127e:	b8 00 00 00 00       	mov    eax,0x0
  401283:	e8 6e ff ff ff       	call   4011f6 <init>
  401288:	48 8d 3d 81 0d 00 00 	lea    rdi,[rip+0xd81]        # 402010 <_IO_stdin_used+0x10>
  40128f:	e8 0c fe ff ff       	call   4010a0 <puts@plt>
  401294:	48 8d 45 e0          	lea    rax,[rbp-0x20]
  401298:	48 89 c6             	mov    rsi,rax
  40129b:	48 8d 3d 86 0d 00 00 	lea    rdi,[rip+0xd86]        # 402028 <_IO_stdin_used+0x28>
  4012a2:	b8 00 00 00 00       	mov    eax,0x0
  4012a7:	e8 44 fe ff ff       	call   4010f0 <__isoc99_scanf@plt>
  4012ac:	48 8d 45 e0          	lea    rax,[rbp-0x20]
  4012b0:	48 89 c7             	mov    rdi,rax
  4012b3:	e8 f8 fd ff ff       	call   4010b0 <strlen@plt>
  4012b8:	48 83 f8 20          	cmp    rax,0x20
  4012bc:	0f 86 36 01 00 00    	jbe    4013f8 <main+0x186>
  4012c2:	48 8d 3d 67 0d 00 00 	lea    rdi,[rip+0xd67]        # 402030 <_IO_stdin_used+0x30>
  4012c9:	e8 d2 fd ff ff       	call   4010a0 <puts@plt>
  4012ce:	48 8d 3d 93 0d 00 00 	lea    rdi,[rip+0xd93]        # 402068 <_IO_stdin_used+0x68>
  4012d5:	e8 c6 fd ff ff       	call   4010a0 <puts@plt>
  4012da:	48 8d 3d bf 0d 00 00 	lea    rdi,[rip+0xdbf]        # 4020a0 <_IO_stdin_used+0xa0>
  4012e1:	e8 ba fd ff ff       	call   4010a0 <puts@plt>
  4012e6:	48 8d 3d eb 0d 00 00 	lea    rdi,[rip+0xdeb]        # 4020d8 <_IO_stdin_used+0xd8>
  4012ed:	e8 ae fd ff ff       	call   4010a0 <puts@plt>
  4012f2:	48 8d 3d 17 0e 00 00 	lea    rdi,[rip+0xe17]        # 402110 <_IO_stdin_used+0x110>
  4012f9:	e8 a2 fd ff ff       	call   4010a0 <puts@plt>
  4012fe:	48 8d 3d 43 0e 00 00 	lea    rdi,[rip+0xe43]        # 402148 <_IO_stdin_used+0x148>
  401305:	e8 96 fd ff ff       	call   4010a0 <puts@plt>
  40130a:	48 8d 3d 6f 0e 00 00 	lea    rdi,[rip+0xe6f]        # 402180 <_IO_stdin_used+0x180>
  401311:	e8 8a fd ff ff       	call   4010a0 <puts@plt>
  401316:	48 8d 3d 9b 0e 00 00 	lea    rdi,[rip+0xe9b]        # 4021b8 <_IO_stdin_used+0x1b8>
  40131d:	e8 7e fd ff ff       	call   4010a0 <puts@plt>
  401322:	48 8d 3d c7 0e 00 00 	lea    rdi,[rip+0xec7]        # 4021f0 <_IO_stdin_used+0x1f0>
  401329:	e8 72 fd ff ff       	call   4010a0 <puts@plt>
  40132e:	48 8d 3d f3 0e 00 00 	lea    rdi,[rip+0xef3]        # 402228 <_IO_stdin_used+0x228>
  401335:	e8 66 fd ff ff       	call   4010a0 <puts@plt>
  40133a:	48 8d 3d 57 0f 00 00 	lea    rdi,[rip+0xf57]        # 402298 <_IO_stdin_used+0x298>
  401341:	e8 5a fd ff ff       	call   4010a0 <puts@plt>
  401346:	48 8d 3d 83 0f 00 00 	lea    rdi,[rip+0xf83]        # 4022d0 <_IO_stdin_used+0x2d0>
  40134d:	e8 4e fd ff ff       	call   4010a0 <puts@plt>
  401352:	48 8d 3d af 0f 00 00 	lea    rdi,[rip+0xfaf]        # 402308 <_IO_stdin_used+0x308>
  401359:	e8 42 fd ff ff       	call   4010a0 <puts@plt>
  40135e:	48 8d 3d db 0f 00 00 	lea    rdi,[rip+0xfdb]        # 402340 <_IO_stdin_used+0x340>
  401365:	e8 36 fd ff ff       	call   4010a0 <puts@plt>
  40136a:	48 8d 3d 07 10 00 00 	lea    rdi,[rip+0x1007]        # 402378 <_IO_stdin_used+0x378>
  401371:	e8 2a fd ff ff       	call   4010a0 <puts@plt>
  401376:	48 8d 3d 33 10 00 00 	lea    rdi,[rip+0x1033]        # 4023b0 <_IO_stdin_used+0x3b0>
  40137d:	e8 1e fd ff ff       	call   4010a0 <puts@plt>
  401382:	48 8d 3d 97 10 00 00 	lea    rdi,[rip+0x1097]        # 402420 <_IO_stdin_used+0x420>
  401389:	e8 12 fd ff ff       	call   4010a0 <puts@plt>
  40138e:	48 8d 3d c3 10 00 00 	lea    rdi,[rip+0x10c3]        # 402458 <_IO_stdin_used+0x458>
  401395:	e8 06 fd ff ff       	call   4010a0 <puts@plt>
  40139a:	48 8d 3d ef 10 00 00 	lea    rdi,[rip+0x10ef]        # 402490 <_IO_stdin_used+0x490>
  4013a1:	e8 fa fc ff ff       	call   4010a0 <puts@plt>
  4013a6:	48 8d 3d 1b 11 00 00 	lea    rdi,[rip+0x111b]        # 4024c8 <_IO_stdin_used+0x4c8>
  4013ad:	e8 ee fc ff ff       	call   4010a0 <puts@plt>
  4013b2:	48 8d 3d 57 0d 00 00 	lea    rdi,[rip+0xd57]        # 402110 <_IO_stdin_used+0x110>
  4013b9:	e8 e2 fc ff ff       	call   4010a0 <puts@plt>
  4013be:	48 8d 3d 13 0d 00 00 	lea    rdi,[rip+0xd13]        # 4020d8 <_IO_stdin_used+0xd8>
  4013c5:	e8 d6 fc ff ff       	call   4010a0 <puts@plt>
  4013ca:	48 8d 3d 2f 11 00 00 	lea    rdi,[rip+0x112f]        # 402500 <_IO_stdin_used+0x500>
  4013d1:	e8 ca fc ff ff       	call   4010a0 <puts@plt>
  4013d6:	48 8d 3d 8b 0c 00 00 	lea    rdi,[rip+0xc8b]        # 402068 <_IO_stdin_used+0x68>
  4013dd:	e8 be fc ff ff       	call   4010a0 <puts@plt>
  4013e2:	48 8d 3d 4f 11 00 00 	lea    rdi,[rip+0x114f]        # 402538 <_IO_stdin_used+0x538>
  4013e9:	e8 b2 fc ff ff       	call   4010a0 <puts@plt>
  4013ee:	bf 00 00 00 00       	mov    edi,0x0
  4013f3:	e8 08 fd ff ff       	call   401100 <exit@plt>
  4013f8:	48 8d 45 e0          	lea    rax,[rbp-0x20]
  4013fc:	48 8d 35 68 11 00 00 	lea    rsi,[rip+0x1168]        # 40256b <_IO_stdin_used+0x56b>
  401403:	48 89 c7             	mov    rdi,rax
  401406:	e8 c5 fc ff ff       	call   4010d0 <strcmp@plt>
  40140b:	85 c0                	test   eax,eax
  40140d:	74 16                	je     401425 <main+0x1b3>
  40140f:	48 8d 3d 62 11 00 00 	lea    rdi,[rip+0x1162]        # 402578 <_IO_stdin_used+0x578>
  401416:	e8 85 fc ff ff       	call   4010a0 <puts@plt>
  40141b:	bf 00 00 00 00       	mov    edi,0x0
  401420:	e8 db fc ff ff       	call   401100 <exit@plt>
  401425:	b8 00 00 00 00       	mov    eax,0x0
  40142a:	c9                   	leave  
  40142b:	c3                   	ret    
  40142c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401430 <__libc_csu_init>:
  401430:	f3 0f 1e fa          	endbr64 
  401434:	41 57                	push   r15
  401436:	4c 8d 3d d3 29 00 00 	lea    r15,[rip+0x29d3]        # 403e10 <__frame_dummy_init_array_entry>
  40143d:	41 56                	push   r14
  40143f:	49 89 d6             	mov    r14,rdx
  401442:	41 55                	push   r13
  401444:	49 89 f5             	mov    r13,rsi
  401447:	41 54                	push   r12
  401449:	41 89 fc             	mov    r12d,edi
  40144c:	55                   	push   rbp
  40144d:	48 8d 2d c4 29 00 00 	lea    rbp,[rip+0x29c4]        # 403e18 <__do_global_dtors_aux_fini_array_entry>
  401454:	53                   	push   rbx
  401455:	4c 29 fd             	sub    rbp,r15
  401458:	48 83 ec 08          	sub    rsp,0x8
  40145c:	e8 9f fb ff ff       	call   401000 <_init>
  401461:	48 c1 fd 03          	sar    rbp,0x3
  401465:	74 1f                	je     401486 <__libc_csu_init+0x56>
  401467:	31 db                	xor    ebx,ebx
  401469:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401470:	4c 89 f2             	mov    rdx,r14
  401473:	4c 89 ee             	mov    rsi,r13
  401476:	44 89 e7             	mov    edi,r12d
  401479:	41 ff 14 df          	call   QWORD PTR [r15+rbx*8]
  40147d:	48 83 c3 01          	add    rbx,0x1
  401481:	48 39 dd             	cmp    rbp,rbx
  401484:	75 ea                	jne    401470 <__libc_csu_init+0x40>
  401486:	48 83 c4 08          	add    rsp,0x8
  40148a:	5b                   	pop    rbx
  40148b:	5d                   	pop    rbp
  40148c:	41 5c                	pop    r12
  40148e:	41 5d                	pop    r13
  401490:	41 5e                	pop    r14
  401492:	41 5f                	pop    r15
  401494:	c3                   	ret    
  401495:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
  40149c:	00 00 00 00 

00000000004014a0 <__libc_csu_fini>:
  4014a0:	f3 0f 1e fa          	endbr64 
  4014a4:	c3                   	ret    

Disassembly of section .fini:

00000000004014a8 <_fini>:
  4014a8:	f3 0f 1e fa          	endbr64 
  4014ac:	48 83 ec 08          	sub    rsp,0x8
  4014b0:	48 83 c4 08          	add    rsp,0x8
  4014b4:	c3                   	ret    
