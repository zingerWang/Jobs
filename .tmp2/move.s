	.file	"move.cpp"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "  sink \346\224\266\345\210\260\344\270\200\344\270\252 Buffer\12\0"
	.text
	.p2align 4
	.globl	_Z4sink6Buffer
	.def	_Z4sink6Buffer;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z4sink6Buffer
_Z4sink6Buffer:
.LFB1042:
	.seh_endprologue
	leaq	.LC0(%rip), %rcx
	jmp	__mingw_printf
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "vector::_M_realloc_append\0"
	.align 8
.LC2:
	.ascii "  \347\247\273\345\212\250\357\274\210\345\217\252\345\201\267\346\214\207\351\222\210\357\274\214\344\270\215\345\210\206\351\205\215\357\274\211\12\0"
	.section	.text$_ZNSt6vectorI6BufferSaIS0_EE17_M_realloc_appendIJS0_EEEvDpOT_,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt6vectorI6BufferSaIS0_EE17_M_realloc_appendIJS0_EEEvDpOT_
	.def	_ZNSt6vectorI6BufferSaIS0_EE17_M_realloc_appendIJS0_EEEvDpOT_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt6vectorI6BufferSaIS0_EE17_M_realloc_appendIJS0_EEEvDpOT_
_ZNSt6vectorI6BufferSaIS0_EE17_M_realloc_appendIJS0_EEEvDpOT_:
.LFB1097:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	8(%rcx), %r14
	movq	(%rcx), %r13
	movq	%r14, %rsi
	subq	%r13, %rsi
	movq	%rsi, %rax
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movabsq	$576460752303423487, %rdx
	sarq	$4, %rax
	cmpq	%rdx, %rax
	je	.L17
	testq	%rax, %rax
	movl	$1, %edi
	cmovne	%rax, %rdi
	addq	%rax, %rdi
	movabsq	$576460752303423487, %rax
	cmpq	%rax, %rdi
	cmova	%rax, %rdi
	salq	$4, %rdi
	movq	%rdi, %rcx
.LEHB0:
	call	_Znwy
.LEHE0:
	leaq	.LC2(%rip), %rcx
	movq	%rax, %r12
	movq	(%rbx), %rax
	movq	$0, (%rbx)
	movq	%rax, (%r12,%rsi)
	movq	8(%rbx), %rax
	movq	$0, 8(%rbx)
	movq	%rax, 8(%r12,%rsi)
	call	__mingw_printf
	cmpq	%r14, %r13
	je	.L9
	movq	%r13, %rbx
	movq	%r12, %rsi
	.p2align 4
	.p2align 3
.L7:
	movq	(%rbx), %rax
	movq	$0, (%rbx)
	leaq	.LC2(%rip), %rcx
	movq	%rax, (%rsi)
	movq	8(%rbx), %rax
	movq	$0, 8(%rbx)
	movq	%rax, 8(%rsi)
	call	__mingw_printf
	movq	8(%rbx), %rcx
	testq	%rcx, %rcx
	je	.L6
	call	_ZdaPv
.L6:
	addq	$16, %rbx
	addq	$16, %rsi
	cmpq	%r14, %rbx
	jne	.L7
.L5:
	addq	$16, %rsi
	testq	%r13, %r13
	je	.L8
	movq	%r13, %rcx
	call	_ZdlPv
.L8:
	movq	%r12, 0(%rbp)
	addq	%rdi, %r12
	movq	%rsi, 8(%rbp)
	movq	%r12, 16(%rbp)
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	movq	%r12, %rsi
	jmp	.L5
.L17:
	leaq	.LC1(%rip), %rcx
.LEHB1:
	call	_ZSt20__throw_length_errorPKc
	nop
.LEHE1:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA1097:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1097-.LLSDACSB1097
.LLSDACSB1097:
	.uleb128 .LEHB0-.LFB1097
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB1097
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE1097:
	.section	.text$_ZNSt6vectorI6BufferSaIS0_EE17_M_realloc_appendIJS0_EEEvDpOT_,"x"
	.linkonce discard
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "1) \347\233\264\346\216\245\344\274\240\344\270\264\346\227\266\345\257\271\350\261\241\357\274\232\12\0"
.LC4:
	.ascii "  \346\236\204\351\200\240 n=%zu\12\0"
	.align 8
.LC5:
	.ascii "2) \344\274\240\345\205\267\345\220\215\345\257\271\350\261\241\357\274\210\345\267\246\345\200\274\357\274\211\357\274\232\12\0"
	.align 8
.LC6:
	.ascii "  \346\213\267\350\264\235 n=%zu\357\274\210\346\226\260\345\210\206\351\205\215 + memcpy\357\274\211\12\0"
.LC7:
	.ascii "3) std::move(b)\357\274\232\12\0"
	.align 8
.LC8:
	.ascii "4) \345\256\214\347\276\216\350\275\254\345\217\221\357\274\232\345\205\210\344\274\240\345\267\246\345\200\274 c\357\274\214\345\206\215\344\274\240\345\217\263\345\200\274\357\274\232\12\0"
	.align 8
.LC9:
	.ascii "5) vector \346\211\251\345\256\271\357\274\210\347\247\273\345\212\250\346\236\204\351\200\240\345\270\246 noexcept\357\274\211\357\274\232\12\0"
.LC10:
	.ascii "  \350\247\246\345\217\221\346\211\251\345\256\271\357\274\232\12\0"
.LC11:
	.ascii "  \345\256\214\346\210\220\357\274\214size=%zu\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB1044:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$88, %rsp
	.seh_stackalloc	88
	.seh_endprologue
	call	__main
	leaq	.LC3(%rip), %rcx
.LEHB2:
	call	__mingw_printf
	movl	$16, %edx
	leaq	.LC4(%rip), %rcx
	call	__mingw_printf
	leaq	.LC0(%rip), %rcx
	call	__mingw_printf
	leaq	.LC5(%rip), %rcx
	call	__mingw_printf
	movl	$32, %edx
	leaq	.LC4(%rip), %rcx
	call	__mingw_printf
	movl	$32, %edx
	leaq	.LC6(%rip), %rcx
	call	__mingw_printf
	leaq	.LC0(%rip), %rcx
	call	__mingw_printf
	leaq	.LC7(%rip), %rcx
	call	__mingw_printf
.LEHE2:
	leaq	.LC2(%rip), %rcx
	call	__mingw_printf
	leaq	.LC0(%rip), %rcx
.LEHB3:
	call	__mingw_printf
	leaq	.LC8(%rip), %rcx
	call	__mingw_printf
	movl	$64, %edx
	leaq	.LC4(%rip), %rcx
	call	__mingw_printf
	movl	$64, %edx
	leaq	.LC6(%rip), %rcx
	call	__mingw_printf
	leaq	.LC0(%rip), %rcx
	call	__mingw_printf
	movl	$128, %edx
	leaq	.LC4(%rip), %rcx
	call	__mingw_printf
.LEHE3:
	leaq	.LC2(%rip), %rcx
	call	__mingw_printf
	leaq	.LC0(%rip), %rcx
.LEHB4:
	call	__mingw_printf
	leaq	.LC9(%rip), %rcx
	call	__mingw_printf
.LEHE4:
	movl	$256, %ecx
	movq	$256, 32(%rsp)
.LEHB5:
	call	_Znay
	pxor	%xmm0, %xmm0
	movq	%rax, %rbx
	movups	%xmm0, 192(%rax)
	movups	%xmm0, 208(%rax)
	movups	%xmm0, 224(%rax)
	movups	%xmm0, 240(%rax)
	xorl	%eax, %eax
.L19:
	movl	%eax, %edx
	addl	$64, %eax
	movups	%xmm0, (%rbx,%rdx)
	movups	%xmm0, 16(%rbx,%rdx)
	movups	%xmm0, 32(%rbx,%rdx)
	movups	%xmm0, 48(%rbx,%rdx)
	cmpl	$192, %eax
	jb	.L19
	movl	$256, %edx
	leaq	.LC4(%rip), %rcx
	call	__mingw_printf
.LEHE5:
	pxor	%xmm1, %xmm1
	xorl	%eax, %eax
	leaq	32(%rsp), %rdx
	movq	%rbx, 40(%rsp)
	leaq	48(%rsp), %rcx
	movq	%rax, 64(%rsp)
	movups	%xmm1, 48(%rsp)
.LEHB6:
	call	_ZNSt6vectorI6BufferSaIS0_EE17_M_realloc_appendIJS0_EEEvDpOT_
.LEHE6:
	movq	40(%rsp), %rcx
	movq	48(%rsp), %rdi
	movq	56(%rsp), %rsi
	movq	64(%rsp), %rbp
	testq	%rcx, %rcx
	je	.L21
	call	_ZdaPv
.L21:
	leaq	.LC10(%rip), %rcx
.LEHB7:
	call	__mingw_printf
	movq	$512, 32(%rsp)
	movl	$512, %ecx
	call	_Znay
	xorl	%edx, %edx
	movq	%rax, %rcx
	movl	$512, %r8d
	movq	%rax, %rbx
	call	memset
	movl	$512, %edx
	leaq	.LC4(%rip), %rcx
	call	__mingw_printf
.LEHE7:
	cmpq	%rsi, %rbp
	je	.L25
	movq	%rbx, 8(%rsi)
	leaq	.LC2(%rip), %rcx
	addq	$16, %rsi
	movq	$512, -16(%rsi)
	call	__mingw_printf
.L26:
	movq	%rsi, %rdx
	leaq	.LC11(%rip), %rcx
	subq	%rdi, %rdx
	sarq	$4, %rdx
.LEHB8:
	call	__mingw_printf
.LEHE8:
	cmpq	%rdi, %rsi
	je	.L29
	movq	%rdi, %rbx
	.p2align 4
	.p2align 3
.L31:
	movq	8(%rbx), %rcx
	testq	%rcx, %rcx
	je	.L30
	call	_ZdaPv
.L30:
	addq	$16, %rbx
	cmpq	%rbx, %rsi
	jne	.L31
.L29:
	testq	%rdi, %rdi
	je	.L56
	movq	%rdi, %rcx
	call	_ZdlPv
.L56:
	xorl	%eax, %eax
	addq	$88, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	ret
.L25:
	leaq	32(%rsp), %rdx
	leaq	48(%rsp), %rcx
	movq	%rbx, 40(%rsp)
.LEHB9:
	call	_ZNSt6vectorI6BufferSaIS0_EE17_M_realloc_appendIJS0_EEEvDpOT_
.LEHE9:
	movq	40(%rsp), %rcx
	movq	48(%rsp), %rdi
	movq	56(%rsp), %rsi
	testq	%rcx, %rcx
	je	.L26
	call	_ZdaPv
	jmp	.L26
.L44:
.L78:
	movq	40(%rsp), %rcx
	movq	48(%rsp), %rdi
	movq	%rax, %rbx
	movq	56(%rsp), %rsi
	testq	%rcx, %rcx
	je	.L24
	call	_ZdaPv
.L24:
	cmpq	%rdi, %rsi
	je	.L38
	movq	%rdi, %rbp
.L37:
	movq	8(%rbp), %rcx
	testq	%rcx, %rcx
	je	.L39
	call	_ZdaPv
.L39:
	addq	$16, %rbp
	cmpq	%rbp, %rsi
	jne	.L37
.L38:
	testq	%rdi, %rdi
	je	.L41
	movq	%rdi, %rcx
	call	_ZdlPv
.L41:
	movq	%rbx, %rcx
.LEHB10:
	call	_Unwind_Resume
.LEHE10:
.L48:
.L76:
	movq	%rax, %rbx
	jmp	.L24
.L46:
	jmp	.L78
.L45:
	jmp	.L76
.L47:
	movq	%rax, %rbx
	jmp	.L41
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA1044:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1044-.LLSDACSB1044
.LLSDACSB1044:
	.uleb128 .LEHB2-.LFB1044
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB3-.LFB1044
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB4-.LFB1044
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB5-.LFB1044
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L47-.LFB1044
	.uleb128 0
	.uleb128 .LEHB6-.LFB1044
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L44-.LFB1044
	.uleb128 0
	.uleb128 .LEHB7-.LFB1044
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L48-.LFB1044
	.uleb128 0
	.uleb128 .LEHB8-.LFB1044
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L45-.LFB1044
	.uleb128 0
	.uleb128 .LEHB9-.LFB1044
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L46-.LFB1044
	.uleb128 0
	.uleb128 .LEHB10-.LFB1044
	.uleb128 .LEHE10-.LEHB10
	.uleb128 0
	.uleb128 0
.LLSDACSE1044:
	.section	.text.startup,"x"
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.def	__gxx_personality_seh0;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev5, Built by MSYS2 project) 16.1.0"
	.def	_Znwy;	.scl	2;	.type	32;	.endef
	.def	_ZdaPv;	.scl	2;	.type	32;	.endef
	.def	_ZdlPv;	.scl	2;	.type	32;	.endef
	.def	_ZSt20__throw_length_errorPKc;	.scl	2;	.type	32;	.endef
	.def	_Znay;	.scl	2;	.type	32;	.endef
	.def	memset;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
