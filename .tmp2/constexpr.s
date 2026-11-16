	.file	"constexpr.cpp"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "square(5)      = %d\357\274\210\347\274\226\350\257\221\346\234\237\345\270\270\351\207\217\357\274\211\12\0"
	.align 8
.LC1:
	.ascii "sum_to(100)    = %d\357\274\210\347\274\226\350\257\221\346\234\237\345\270\270\351\207\217\357\274\211\12\0"
	.align 8
.LC2:
	.ascii "must_be_compile_time(21) = %d\12\0"
.LC3:
	.ascii "f(3) \345\234\250\345\270\270\351\207\217\344\270\212\344\270\213\346\226\207 = %d\12\0"
	.align 8
.LC4:
	.ascii "f(runtime_n) \345\234\250\350\277\220\350\241\214\346\234\237 = %d\12\0"
.LC5:
	.ascii "constinit g_start = %d\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB141:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	call	__main
	movl	$25, %edx
	leaq	.LC0(%rip), %rcx
	call	__mingw_printf
	movl	$5050, %edx
	leaq	.LC1(%rip), %rcx
	call	__mingw_printf
	movl	$42, %edx
	leaq	.LC2(%rip), %rcx
	call	__mingw_printf
	movl	$300, %edx
	leaq	.LC3(%rip), %rcx
	call	__mingw_printf
	movl	$5, %edx
	leaq	.LC4(%rip), %rcx
	call	__mingw_printf
	movl	g_start(%rip), %edx
	leaq	.LC5(%rip), %rcx
	call	__mingw_printf
	xorl	%eax, %eax
	addq	$40, %rsp
	ret
	.seh_endproc
	.globl	g_start
	.data
	.align 4
g_start:
	.long	55
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev5, Built by MSYS2 project) 16.1.0"
