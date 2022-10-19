
helloworld:     file format elf64-x86-64


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

Disassembly of section .plt.sec:

0000000000401070 <puts@plt>:
  401070:	f3 0f 1e fa          	endbr64 
  401074:	f2 ff 25 9d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f9d]        # 404018 <puts@GLIBC_2.2.5>
  40107b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000401080 <execve@plt>:
  401080:	f3 0f 1e fa          	endbr64 
  401084:	f2 ff 25 95 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f95]        # 404020 <execve@GLIBC_2.2.5>
  40108b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000401090 <gets@plt>:
  401090:	f3 0f 1e fa          	endbr64 
  401094:	f2 ff 25 8d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f8d]        # 404028 <gets@GLIBC_2.2.5>
  40109b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000004010a0 <setvbuf@plt>:
  4010a0:	f3 0f 1e fa          	endbr64 
  4010a4:	f2 ff 25 85 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f85]        # 404030 <setvbuf@GLIBC_2.2.5>
  4010ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

00000000004010b0 <_start>:
  4010b0:	f3 0f 1e fa          	endbr64 
  4010b4:	31 ed                	xor    ebp,ebp
  4010b6:	49 89 d1             	mov    r9,rdx
  4010b9:	5e                   	pop    rsi
  4010ba:	48 89 e2             	mov    rdx,rsp
  4010bd:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  4010c1:	50                   	push   rax
  4010c2:	54                   	push   rsp
  4010c3:	49 c7 c0 e0 12 40 00 	mov    r8,0x4012e0
  4010ca:	48 c7 c1 70 12 40 00 	mov    rcx,0x401270
  4010d1:	48 c7 c7 1c 12 40 00 	mov    rdi,0x40121c
  4010d8:	ff 15 12 2f 00 00    	call   QWORD PTR [rip+0x2f12]        # 403ff0 <__libc_start_main@GLIBC_2.2.5>
  4010de:	f4                   	hlt    
  4010df:	90                   	nop

00000000004010e0 <_dl_relocate_static_pie>:
  4010e0:	f3 0f 1e fa          	endbr64 
  4010e4:	c3                   	ret    
  4010e5:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  4010ec:	00 00 00 
  4010ef:	90                   	nop

00000000004010f0 <deregister_tm_clones>:
  4010f0:	b8 48 40 40 00       	mov    eax,0x404048
  4010f5:	48 3d 48 40 40 00    	cmp    rax,0x404048
  4010fb:	74 13                	je     401110 <deregister_tm_clones+0x20>
  4010fd:	b8 00 00 00 00       	mov    eax,0x0
  401102:	48 85 c0             	test   rax,rax
  401105:	74 09                	je     401110 <deregister_tm_clones+0x20>
  401107:	bf 48 40 40 00       	mov    edi,0x404048
  40110c:	ff e0                	jmp    rax
  40110e:	66 90                	xchg   ax,ax
  401110:	c3                   	ret    
  401111:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
  401118:	00 00 00 00 
  40111c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401120 <register_tm_clones>:
  401120:	be 48 40 40 00       	mov    esi,0x404048
  401125:	48 81 ee 48 40 40 00 	sub    rsi,0x404048
  40112c:	48 89 f0             	mov    rax,rsi
  40112f:	48 c1 ee 3f          	shr    rsi,0x3f
  401133:	48 c1 f8 03          	sar    rax,0x3
  401137:	48 01 c6             	add    rsi,rax
  40113a:	48 d1 fe             	sar    rsi,1
  40113d:	74 11                	je     401150 <register_tm_clones+0x30>
  40113f:	b8 00 00 00 00       	mov    eax,0x0
  401144:	48 85 c0             	test   rax,rax
  401147:	74 07                	je     401150 <register_tm_clones+0x30>
  401149:	bf 48 40 40 00       	mov    edi,0x404048
  40114e:	ff e0                	jmp    rax
  401150:	c3                   	ret    
  401151:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
  401158:	00 00 00 00 
  40115c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401160 <__do_global_dtors_aux>:
  401160:	f3 0f 1e fa          	endbr64 
  401164:	80 3d 1d 2f 00 00 00 	cmp    BYTE PTR [rip+0x2f1d],0x0        # 404088 <completed.8061>
  40116b:	75 13                	jne    401180 <__do_global_dtors_aux+0x20>
  40116d:	55                   	push   rbp
  40116e:	48 89 e5             	mov    rbp,rsp
  401171:	e8 7a ff ff ff       	call   4010f0 <deregister_tm_clones>
  401176:	c6 05 0b 2f 00 00 01 	mov    BYTE PTR [rip+0x2f0b],0x1        # 404088 <completed.8061>
  40117d:	5d                   	pop    rbp
  40117e:	c3                   	ret    
  40117f:	90                   	nop
  401180:	c3                   	ret    
  401181:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
  401188:	00 00 00 00 
  40118c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401190 <frame_dummy>:
  401190:	f3 0f 1e fa          	endbr64 
  401194:	eb 8a                	jmp    401120 <register_tm_clones>

0000000000401196 <init>:
  401196:	f3 0f 1e fa          	endbr64 
  40119a:	55                   	push   rbp
  40119b:	48 89 e5             	mov    rbp,rsp
  40119e:	48 8b 05 cb 2e 00 00 	mov    rax,QWORD PTR [rip+0x2ecb]        # 404070 <stdin@@GLIBC_2.2.5>
  4011a5:	b9 00 00 00 00       	mov    ecx,0x0
  4011aa:	ba 02 00 00 00       	mov    edx,0x2
  4011af:	be 00 00 00 00       	mov    esi,0x0
  4011b4:	48 89 c7             	mov    rdi,rax
  4011b7:	e8 e4 fe ff ff       	call   4010a0 <setvbuf@plt>
  4011bc:	48 8b 05 9d 2e 00 00 	mov    rax,QWORD PTR [rip+0x2e9d]        # 404060 <stdout@@GLIBC_2.2.5>
  4011c3:	b9 00 00 00 00       	mov    ecx,0x0
  4011c8:	ba 02 00 00 00       	mov    edx,0x2
  4011cd:	be 00 00 00 00       	mov    esi,0x0
  4011d2:	48 89 c7             	mov    rdi,rax
  4011d5:	e8 c6 fe ff ff       	call   4010a0 <setvbuf@plt>
  4011da:	48 8b 05 9f 2e 00 00 	mov    rax,QWORD PTR [rip+0x2e9f]        # 404080 <stderr@@GLIBC_2.2.5>
  4011e1:	b9 00 00 00 00       	mov    ecx,0x0
  4011e6:	ba 02 00 00 00       	mov    edx,0x2
  4011eb:	be 00 00 00 00       	mov    esi,0x0
  4011f0:	48 89 c7             	mov    rdi,rax
  4011f3:	e8 a8 fe ff ff       	call   4010a0 <setvbuf@plt>
  4011f8:	90                   	nop
  4011f9:	5d                   	pop    rbp
  4011fa:	c3                   	ret    

00000000004011fb <helloworld>:
  4011fb:	f3 0f 1e fa          	endbr64 
  4011ff:	55                   	push   rbp
  401200:	48 89 e5             	mov    rbp,rsp
  401203:	ba 00 00 00 00       	mov    edx,0x0
  401208:	be 00 00 00 00       	mov    esi,0x0
  40120d:	48 8d 3d f4 0d 00 00 	lea    rdi,[rip+0xdf4]        # 402008 <_IO_stdin_used+0x8>
  401214:	e8 67 fe ff ff       	call   401080 <execve@plt>
  401219:	90                   	nop
  40121a:	5d                   	pop    rbp
  40121b:	c3                   	ret    

000000000040121c <main>:
  40121c:	f3 0f 1e fa          	endbr64 
  401220:	55                   	push   rbp
  401221:	48 89 e5             	mov    rbp,rsp
  401224:	48 83 ec 20          	sub    rsp,0x20
  401228:	b8 00 00 00 00       	mov    eax,0x0
  40122d:	e8 64 ff ff ff       	call   401196 <init>
  401232:	48 8d 3d d7 0d 00 00 	lea    rdi,[rip+0xdd7]        # 402010 <_IO_stdin_used+0x10>
  401239:	e8 32 fe ff ff       	call   401070 <puts@plt>
  40123e:	48 8d 3d e3 0d 00 00 	lea    rdi,[rip+0xde3]        # 402028 <_IO_stdin_used+0x28>
  401245:	e8 26 fe ff ff       	call   401070 <puts@plt>
  40124a:	48 8d 45 e0          	lea    rax,[rbp-0x20]
  40124e:	48 89 c7             	mov    rdi,rax
  401251:	b8 00 00 00 00       	mov    eax,0x0
  401256:	e8 35 fe ff ff       	call   401090 <gets@plt>
  40125b:	b8 00 00 00 00       	mov    eax,0x0
  401260:	c9                   	leave  
  401261:	c3                   	ret    
  401262:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  401269:	00 00 00 
  40126c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401270 <__libc_csu_init>:
  401270:	f3 0f 1e fa          	endbr64 
  401274:	41 57                	push   r15
  401276:	4c 8d 3d 93 2b 00 00 	lea    r15,[rip+0x2b93]        # 403e10 <__frame_dummy_init_array_entry>
  40127d:	41 56                	push   r14
  40127f:	49 89 d6             	mov    r14,rdx
  401282:	41 55                	push   r13
  401284:	49 89 f5             	mov    r13,rsi
  401287:	41 54                	push   r12
  401289:	41 89 fc             	mov    r12d,edi
  40128c:	55                   	push   rbp
  40128d:	48 8d 2d 84 2b 00 00 	lea    rbp,[rip+0x2b84]        # 403e18 <__do_global_dtors_aux_fini_array_entry>
  401294:	53                   	push   rbx
  401295:	4c 29 fd             	sub    rbp,r15
  401298:	48 83 ec 08          	sub    rsp,0x8
  40129c:	e8 5f fd ff ff       	call   401000 <_init>
  4012a1:	48 c1 fd 03          	sar    rbp,0x3
  4012a5:	74 1f                	je     4012c6 <__libc_csu_init+0x56>
  4012a7:	31 db                	xor    ebx,ebx
  4012a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4012b0:	4c 89 f2             	mov    rdx,r14
  4012b3:	4c 89 ee             	mov    rsi,r13
  4012b6:	44 89 e7             	mov    edi,r12d
  4012b9:	41 ff 14 df          	call   QWORD PTR [r15+rbx*8]
  4012bd:	48 83 c3 01          	add    rbx,0x1
  4012c1:	48 39 dd             	cmp    rbp,rbx
  4012c4:	75 ea                	jne    4012b0 <__libc_csu_init+0x40>
  4012c6:	48 83 c4 08          	add    rsp,0x8
  4012ca:	5b                   	pop    rbx
  4012cb:	5d                   	pop    rbp
  4012cc:	41 5c                	pop    r12
  4012ce:	41 5d                	pop    r13
  4012d0:	41 5e                	pop    r14
  4012d2:	41 5f                	pop    r15
  4012d4:	c3                   	ret    
  4012d5:	66 66 2e 0f 1f 84 00 	data16 nop WORD PTR cs:[rax+rax*1+0x0]
  4012dc:	00 00 00 00 

00000000004012e0 <__libc_csu_fini>:
  4012e0:	f3 0f 1e fa          	endbr64 
  4012e4:	c3                   	ret    

Disassembly of section .fini:

00000000004012e8 <_fini>:
  4012e8:	f3 0f 1e fa          	endbr64 
  4012ec:	48 83 ec 08          	sub    rsp,0x8
  4012f0:	48 83 c4 08          	add    rsp,0x8
  4012f4:	c3                   	ret    
