	.file	"variadic.cpp"
	.text
	.section	.text$_ZNK7Counter3addEii,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNK7Counter3addEii
	.def	_ZNK7Counter3addEii;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNK7Counter3addEii
_ZNK7Counter3addEii:
.LFB2519:
	.seh_endprologue
	addl	(%rcx), %edx
	leal	(%rdx,%r8), %eax
	ret
	.seh_endproc
	.section	.text$_Z9vsnprintfPcyPKcS_,"x"
	.linkonce discard
	.p2align 4
	.globl	_Z9vsnprintfPcyPKcS_
	.def	_Z9vsnprintfPcyPKcS_;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9vsnprintfPcyPKcS_
_Z9vsnprintfPcyPKcS_:
.LFB6:
	.seh_endprologue
	jmp	__mingw_vsnprintf
	.seh_endproc
	.section	.text$_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_yPKS8_PcEySB_z,"x"
	.linkonce discard
	.p2align 4
	.globl	_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_yPKS8_PcEySB_z
	.def	_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_yPKS8_PcEySB_z;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_yPKS8_PcEySB_z
_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_yPKS8_PcEySB_z:
.LFB2722:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	leaq	64(%rsp), %rbp
	.seh_setframe	%rbp, 64
	.seh_endprologue
	movq	%rdx, %r10
	movq	%r8, %rdx
	movq	%rcx, %rbx
	movq	%r9, %r8
	leaq	15(%rdx), %rax
	andq	$-16, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	64(%rbp), %r9
	leaq	32(%rsp), %rsi
	movq	%r9, -16(%rbp)
	movq	%rsi, %rcx
	call	*%r10
	leaq	16(%rbx), %rcx
	movq	$0, 8(%rbx)
	movslq	%eax, %r9
	movq	%rcx, (%rbx)
	movq	%r9, -8(%rbp)
	cmpq	$15, %r9
	ja	.L13
	cmpq	$1, %r9
	jne	.L7
	movzbl	(%rsi), %eax
	movb	%al, 16(%rbx)
.L8:
	movq	%rbx, %rax
	movb	$0, (%rcx,%r9)
	movq	%r9, 8(%rbx)
	movq	%rbp, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	testq	%r9, %r9
	je	.L8
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L13:
	movq	%rbx, %rcx
	leaq	-8(%rbp), %rdx
	xorl	%r8d, %r8d
	movq	%r9, -24(%rbp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	-24(%rbp), %r9
	movq	%rax, (%rbx)
	movq	%rax, %rcx
	movq	-8(%rbp), %rax
	movq	%rax, 16(%rbx)
.L6:
	movq	%r9, %r8
	movq	%rsi, %rdx
	call	memcpy
	movq	-8(%rbp), %r9
	movq	(%rbx), %rcx
	jmp	.L8
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "sum_all(1,2,3,4) = %d\12\0"
.LC1:
	.ascii "sum_all()        = %d\12\0"
.LC2:
	.ascii "%s \0"
.LC3:
	.ascii "%f\0"
.LC5:
	.ascii "\12\0"
.LC6:
	.ascii "apply(sum_all, (3,4)) = %d\12\0"
	.align 8
.LC7:
	.ascii "invoke(&Counter::add, c, 1, 2) = %d\12\0"
	.align 8
.LC8:
	.ascii "invoke(&Counter::base, c)     = %d\12\0"
	.align 8
.LC9:
	.ascii "invoke(lambda, 10)            = %d\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB2520:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$152, %rsp
	.seh_stackalloc	152
	.seh_endprologue
	call	__main
	movl	$10, %edx
	leaq	64(%rsp), %rbx
	leaq	.LC0(%rip), %rcx
.LEHB0:
	call	__mingw_printf
	xorl	%edx, %edx
	leaq	.LC1(%rip), %rcx
	call	__mingw_printf
.LEHE0:
	movl	$1, %edx
	leaq	48(%rsp), %rcx
	movq	%rbx, 48(%rsp)
	movb	$0, 64(%rsp)
	movq	$0, 56(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEy
	movq	48(%rsp), %rax
	leaq	.LC2(%rip), %rcx
	movb	$49, (%rax)
	movq	48(%rsp), %rax
	movb	$0, 1(%rax)
	movq	48(%rsp), %rdx
	movq	$1, 56(%rsp)
.LEHB1:
	call	__mingw_printf
	movq	.LC4(%rip), %rax
	leaq	.LC3(%rip), %r9
	movl	$328, %r8d
	leaq	_Z9vsnprintfPcyPKcS_(%rip), %rdx
	leaq	80(%rsp), %rcx
	movq	%rax, 32(%rsp)
	call	_ZN9__gnu_cxx12__to_xstringINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEcEET_PFiPT0_yPKS8_PcEySB_z
.LEHE1:
	movq	80(%rsp), %rdx
	leaq	.LC2(%rip), %rcx
.LEHB2:
	call	__mingw_printf
.LEHE2:
	movl	$1, %edx
	leaq	112(%rsp), %rcx
	leaq	128(%rsp), %rsi
	movb	$0, 128(%rsp)
	movq	%rsi, 112(%rsp)
	movq	$0, 120(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEy
	movq	112(%rsp), %rax
	leaq	.LC2(%rip), %rcx
	movb	$51, (%rax)
	movq	112(%rsp), %rax
	movb	$0, 1(%rax)
	movq	112(%rsp), %rdx
	movq	$1, 120(%rsp)
.LEHB3:
	call	__mingw_printf
.LEHE3:
	movq	112(%rsp), %rcx
	cmpq	%rsi, %rcx
	je	.L15
	movq	128(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L15:
	movq	80(%rsp), %rcx
	leaq	96(%rsp), %rax
	cmpq	%rax, %rcx
	je	.L16
	movq	96(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L16:
	movq	48(%rsp), %rcx
	cmpq	%rbx, %rcx
	je	.L17
	movq	64(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L17:
	leaq	.LC5(%rip), %rcx
.LEHB4:
	call	__mingw_printf
	movl	$7, %edx
	leaq	.LC6(%rip), %rcx
	call	__mingw_printf
	movl	$103, %edx
	leaq	.LC7(%rip), %rcx
	call	__mingw_printf
	movl	$100, %edx
	leaq	.LC8(%rip), %rcx
	call	__mingw_printf
	movl	$100, %edx
	leaq	.LC9(%rip), %rcx
	call	__mingw_printf
	xorl	%eax, %eax
	addq	$152, %rsp
	popq	%rbx
	popq	%rsi
	ret
.L23:
	leaq	112(%rsp), %rcx
	movq	%rax, %rbx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L19:
	leaq	80(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L20:
	leaq	48(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rcx
	call	_Unwind_Resume
.LEHE4:
.L22:
	movq	%rax, %rbx
	jmp	.L19
.L21:
	movq	%rax, %rbx
	jmp	.L20
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA2520:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE2520-.LLSDACSB2520
.LLSDACSB2520:
	.uleb128 .LEHB0-.LFB2520
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB2520
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L21-.LFB2520
	.uleb128 0
	.uleb128 .LEHB2-.LFB2520
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L22-.LFB2520
	.uleb128 0
	.uleb128 .LEHB3-.LFB2520
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L23-.LFB2520
	.uleb128 0
	.uleb128 .LEHB4-.LFB2520
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
.LLSDACSE2520:
	.section	.text.startup,"x"
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC4:
	.long	0
	.long	1074003968
	.def	__gxx_personality_seh0;	.scl	2;	.type	32;	.endef
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev5, Built by MSYS2 project) 16.1.0"
	.def	__mingw_vsnprintf;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy;	.scl	2;	.type	32;	.endef
	.def	memcpy;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEy;	.scl	2;	.type	32;	.endef
	.def	_ZdlPvy;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
