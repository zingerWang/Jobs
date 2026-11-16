	.file	"auto.cpp"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "auto\357\274\232a1=%d n=%d a2=%d a3=%d a4=%d a5=%d\12\0"
	.align 8
.LC1:
	.ascii "decltype\357\274\232d1=%d d2=%d d3=%d n=%d\12\0"
	.align 8
.LC2:
	.ascii "decltype((n)) \346\230\257\345\274\225\347\224\250\357\274\214n=%d\12\0"
	.align 8
.LC3:
	.ascii "sizeof(auto)=%zu  sizeof(bool)=%zu\12\0"
	.align 8
.LC4:
	.ascii "auto b = bits[0]; b = true \344\271\213\345\220\216 bits[0]=%d\357\274\210\350\242\253\346\224\271\345\210\260\344\272\206\357\274\211\12\0"
	.align 8
.LC5:
	.ascii "bool c = bits[1]; c = true \344\271\213\345\220\216 bits[1]=%d\357\274\210\346\262\241\346\224\271\345\210\260\357\274\211\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB1052:
	subq	$72, %rsp
	.seh_stackalloc	72
	.seh_endprologue
	call	__main
	movl	$7, %r9d
	movl	$100, %edx
	movl	$200, 48(%rsp)
	movl	$200, 40(%rsp)
	movl	$200, %r8d
	leaq	.LC0(%rip), %rcx
	movl	$9, 32(%rsp)
	call	__mingw_printf
	movl	$300, %r9d
	movl	$2, %r8d
	movl	$300, 32(%rsp)
	movl	$1, %edx
	leaq	.LC1(%rip), %rcx
	call	__mingw_printf
	movl	$400, %edx
	leaq	.LC2(%rip), %rcx
	call	__mingw_printf
	movl	$1, %r8d
	movl	$16, %edx
	leaq	.LC3(%rip), %rcx
	call	__mingw_printf
	movl	$1, %edx
	leaq	.LC4(%rip), %rcx
	call	__mingw_printf
	xorl	%edx, %edx
	leaq	.LC5(%rip), %rcx
	call	__mingw_printf
	xorl	%eax, %eax
	addq	$72, %rsp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev5, Built by MSYS2 project) 16.1.0"
