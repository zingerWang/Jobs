	.file	"concepts.cpp"
	.text
	.section	.text$_ZNKSt8__format5_SinkIcE13_M_discardingEv,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt8__format5_SinkIcE13_M_discardingEv
	.def	_ZNKSt8__format5_SinkIcE13_M_discardingEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format5_SinkIcE13_M_discardingEv
_ZNKSt8__format5_SinkIcE13_M_discardingEv:
.LFB6503:
	.seh_endprologue
	xorl	%eax, %eax
	ret
	.seh_endproc
	.text
	.p2align 4
	.def	_ZNSt6ranges8__detail16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEENS0_10_Comp_projINS_4lessESt8identityEEEEvT_SD_T0_.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZNSt6ranges8__detail16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEENS0_10_Comp_projINS_4lessESt8identityEEEEvT_SD_T0_.isra.0
_ZNSt6ranges8__detail16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEENS0_10_Comp_projINS_4lessESt8identityEEEEvT_SD_T0_.isra.0:
.LFB6568:
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
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbp
	movq	%rdx, %r13
	cmpq	%rdx, %rcx
	je	.L3
	leaq	4(%rcx), %rsi
	cmpq	%rsi, %rdx
	je	.L3
	movl	$4, %edi
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L15:
	movl	$4, %ecx
	subq	%rdi, %rcx
	addq	%rsi, %rcx
	cmpq	$4, %rdi
	jle	.L6
	movq	%rdi, %r8
	movq	%rbp, %rdx
	call	memmove
.L7:
	addq	$4, %rsi
	movl	%ebx, 0(%rbp)
	addq	$4, %rdi
	cmpq	%rsi, %r13
	je	.L3
.L11:
	movl	(%rsi), %ebx
	movl	0(%rbp), %eax
	cmpl	%eax, %ebx
	jl	.L15
	movl	-4(%rsi), %edx
	cmpl	%edx, %ebx
	jge	.L12
	leaq	-4(%rsi), %rax
	.p2align 5
	.p2align 4
	.p2align 3
.L10:
	movl	%edx, 4(%rax)
	movq	%rax, %rcx
	movl	-4(%rax), %edx
	subq	$4, %rax
	cmpl	%edx, %ebx
	jl	.L10
	movl	%ebx, (%rcx)
.L16:
	addq	$4, %rsi
	addq	$4, %rdi
	cmpq	%rsi, %r13
	jne	.L11
.L3:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
.L6:
	jne	.L7
	movl	%eax, (%rcx)
	jmp	.L7
.L12:
	movq	%rsi, %rcx
	movl	%ebx, (%rcx)
	jmp	.L16
	.seh_endproc
	.align 2
	.p2align 4
	.def	_ZNSt12_Vector_baseIiSaIiEED2Ev.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZNSt12_Vector_baseIiSaIiEED2Ev.isra.0
_ZNSt12_Vector_baseIiSaIiEED2Ev.isra.0:
.LFB6570:
	.seh_endprologue
	testq	%rcx, %rcx
	je	.L17
	subq	%rcx, %rdx
	jmp	_ZdlPvy
.L17:
	ret
	.seh_endproc
	.p2align 4
	.def	_ZNSt6ranges8__detail16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEENS0_10_Comp_projINS_4lessESt8identityEEEEvT_SD_jT0_.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZNSt6ranges8__detail16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEENS0_10_Comp_projINS_4lessESt8identityEEEEvT_SD_jT0_.isra.0
_ZNSt6ranges8__detail16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEENS0_10_Comp_projINS_4lessESt8identityEEEEvT_SD_jT0_.isra.0:
.LFB6571:
	pushq	%r15
	.seh_pushreg	%r15
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
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rdx, %rax
	movq	%rcx, %rsi
	movl	%r8d, %ebp
	movq	%rdx, %r11
	subq	%rcx, %rax
	cmpq	$64, %rax
	jle	.L19
	movq	%rax, %rdi
	sarq	$3, %rax
	sarq	$2, %rdi
	testl	%ebp, %ebp
	je	.L87
.L21:
	movq	(%rsi), %xmm0
	leaq	(%rsi,%rax,4), %r10
	movl	-4(%r11), %r9d
	subl	$1, %ebp
	movl	(%r10), %ecx
	leaq	4(%rsi), %rax
	pshufd	$0xe5, %xmm0, %xmm2
	movd	%xmm2, %r8d
	pshufd	$225, %xmm0, %xmm1
	movd	%xmm0, %edx
	cmpl	%ecx, %r8d
	jge	.L51
	cmpl	%r9d, %ecx
	jl	.L57
	cmpl	%r9d, %r8d
	jl	.L86
.L85:
	movq	%xmm1, (%rsi)
.L53:
	movq	%r11, %r9
	cmpl	%edx, %r8d
	jle	.L75
	.p2align 4
	.p2align 3
.L89:
	addq	$4, %rax
	.p2align 4
	.p2align 4
	.p2align 3
.L59:
	movq	%rax, %rcx
	movl	(%rax), %edx
	addq	$4, %rax
	cmpl	%r8d, %edx
	jl	.L59
	movq	%rcx, %rbx
	movl	-4(%r9), %ecx
	cmpl	%r8d, %ecx
	jle	.L60
.L90:
	leaq	-8(%r9), %rax
	.p2align 4
	.p2align 4
	.p2align 3
.L61:
	movq	%rax, %r9
	movl	(%rax), %ecx
	subq	$4, %rax
	cmpl	%r8d, %ecx
	jg	.L61
	cmpq	%r9, %rbx
	jnb	.L88
.L63:
	movl	%ecx, (%rbx)
	leaq	4(%rbx), %rax
	movl	%edx, (%r9)
	movl	(%rsi), %r8d
	movl	4(%rbx), %edx
	cmpl	%edx, %r8d
	jg	.L89
.L75:
	movl	-4(%r9), %ecx
	movq	%rax, %rbx
	cmpl	%r8d, %ecx
	jg	.L90
	.p2align 4
	.p2align 3
.L60:
	subq	$4, %r9
	cmpq	%r9, %rbx
	jb	.L63
	.p2align 4
	.p2align 3
.L88:
	movl	%ebp, %r8d
	movq	%r11, %rdx
	movq	%rbx, %rcx
	call	_ZNSt6ranges8__detail16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEENS0_10_Comp_projINS_4lessESt8identityEEEEvT_SD_jT0_.isra.0
	movq	%rbx, %rax
	subq	%rsi, %rax
	cmpq	$64, %rax
	jle	.L19
	movq	%rax, %rdi
	movq	%rbx, %r11
	sarq	$3, %rax
	sarq	$2, %rdi
	testl	%ebp, %ebp
	jne	.L21
.L87:
	leaq	-1(%rdi), %r10
	leaq	-4(%rsi,%rax,4), %rbx
	leaq	-1(%rax), %r8
	sarq	%r10
	movl	(%rbx), %r9d
	movq	%rbx, %rcx
	movq	%r8, %rbp
	cmpq	%r10, %r8
	jge	.L91
.L31:
	movq	%r8, %r12
	jmp	.L24
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L68:
	movq	%rax, %r12
.L24:
	leaq	1(%r12), %rdx
	leaq	(%rdx,%rdx), %r13
	leaq	(%rsi,%rdx,8), %r14
	leaq	-1(%r13), %rax
	movl	(%r14), %r15d
	leaq	(%rsi,%rax,4), %rcx
	movl	(%rcx), %edx
	cmpl	%r15d, %edx
	cmovle	%r15d, %edx
	cmovle	%r13, %rax
	cmovle	%r14, %rcx
	movl	%edx, (%rsi,%r12,4)
	cmpq	%r10, %rax
	jl	.L68
	testb	$1, %dil
	jne	.L81
	cmpq	%rax, %rbp
	je	.L27
.L81:
	leaq	-1(%rax), %rdx
.L26:
	sarq	%rdx
	cmpq	%rax, %r8
	jl	.L30
	jmp	.L28
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L93:
	movl	%ecx, (%rax)
	leaq	-1(%rdx), %rax
	shrq	$63, %rax
	leaq	-1(%rax,%rdx), %rcx
	movq	%rdx, %rax
	cmpq	%rdx, %r8
	jge	.L92
	movq	%rcx, %rdx
	sarq	%rdx
.L30:
	leaq	(%rsi,%rdx,4), %r12
	leaq	(%rsi,%rax,4), %rax
	movl	(%r12), %ecx
	cmpl	%r9d, %ecx
	jl	.L93
.L29:
	movl	%r9d, (%rax)
	testq	%r8, %r8
	je	.L34
.L33:
	subq	$4, %rbx
	subq	$1, %r8
	movl	(%rbx), %r9d
	movq	%rbx, %rcx
	cmpq	%r10, %r8
	jl	.L31
.L91:
	testb	$1, %dil
	jne	.L82
	cmpq	%rbp, %r8
	je	.L94
.L28:
	movl	%r9d, (%rcx)
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L51:
	cmpl	%r9d, %r8d
	jl	.L85
	cmpl	%r9d, %ecx
	jge	.L57
.L86:
	movl	%r9d, (%rsi)
	movl	%edx, -4(%r11)
	movl	4(%rsi), %edx
	movl	(%rsi), %r8d
	jmp	.L53
.L57:
	movl	%ecx, (%rsi)
	movl	%edx, (%r10)
	movl	4(%rsi), %edx
	movl	(%rsi), %r8d
	jmp	.L53
.L98:
	movl	%r8d, (%rsi)
.L19:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L34:
	movq	%r11, %rax
	subq	%rsi, %rax
	cmpq	$4, %rax
	jle	.L19
	leaq	-4(%r11), %r10
	leaq	-4(%rax), %r9
.L50:
	movl	(%rsi), %eax
	movq	%r9, %r13
	movl	(%r10), %r8d
	sarq	$2, %r13
	movl	%eax, (%r10)
	cmpq	$8, %r9
	jle	.L37
	leaq	-1(%r13), %r12
	xorl	%ebp, %ebp
	sarq	%r12
	jmp	.L39
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L72:
	movq	%rax, %rbp
.L39:
	leaq	1(%rbp), %rdx
	leaq	(%rdx,%rdx), %r11
	leaq	(%rsi,%rdx,8), %rbx
	leaq	-1(%r11), %rax
	movl	(%rbx), %edi
	leaq	(%rsi,%rax,4), %rcx
	movl	(%rcx), %edx
	cmpl	%edx, %edi
	cmovge	%edi, %edx
	cmovge	%r11, %rax
	cmovge	%rbx, %rcx
	movl	%edx, (%rsi,%rbp,4)
	cmpq	%rax, %r12
	jg	.L72
	andl	$1, %r13d
	jne	.L84
	movq	%r9, %rdx
	sarq	$3, %rdx
	subq	$1, %rdx
	cmpq	%rax, %rdx
	je	.L45
.L84:
	leaq	-1(%rax), %rdx
	shrq	$63, %rdx
	leaq	-1(%rax,%rdx), %rdx
	sarq	%rdx
	testq	%rax, %rax
	jne	.L49
	jmp	.L95
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L97:
	movl	%ecx, (%rax)
	leaq	-1(%rdx), %rax
	shrq	$63, %rax
	leaq	-1(%rax,%rdx), %rcx
	movq	%rdx, %rax
	testq	%rdx, %rdx
	je	.L96
	movq	%rcx, %rdx
	sarq	%rdx
.L49:
	leaq	(%rsi,%rdx,4), %r11
	leaq	(%rsi,%rax,4), %rax
	movl	(%r11), %ecx
	cmpl	%ecx, %r8d
	jg	.L97
.L46:
	movl	%r8d, (%rax)
	cmpq	$4, %r9
	jle	.L19
.L83:
	subq	$4, %r10
	subq	$4, %r9
	jmp	.L50
.L96:
	movq	%r11, %rax
	jmp	.L46
.L92:
	movq	%r12, %rax
	jmp	.L29
.L37:
	andl	$1, %r13d
	jne	.L98
	movq	%rsi, %rax
	cmpq	$8, %r9
	jne	.L46
	movq	%rsi, %rcx
	xorl	%eax, %eax
.L45:
	leaq	1(%rax,%rax), %r11
	movl	(%rsi,%r11,4), %edx
	movl	%edx, (%rcx)
	movq	%rax, %rdx
	movq	%r11, %rax
	jmp	.L49
.L94:
	movq	%r8, %rax
.L27:
	leaq	(%rax,%rax), %rdx
	leaq	1(%rdx), %rax
	leaq	(%rsi,%rax,4), %r12
	movl	(%r12), %r13d
	movl	%r13d, (%rcx)
	movq	%r12, %rcx
	jmp	.L26
.L99:
	subq	$2, %r8
	movl	-8(%rax), %r9d
	leaq	-8(%rax), %rbx
	cmpq	%r10, %r8
	jl	.L31
.L82:
	movl	%r9d, (%rbx)
	movq	%rbx, %rax
	leaq	-1(%r8), %rdx
	subq	$4, %rbx
	movl	(%rbx), %r9d
	cmpq	%r10, %rdx
	jge	.L99
	movq	%rdx, %r8
	jmp	.L31
.L95:
	movl	%r8d, (%rcx)
	jmp	.L83
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "basic_string::append\0"
.LC1:
	.ascii "basic_string::_M_create\0"
	.section	.text$_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE11_M_overflowEv,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE11_M_overflowEv
	.def	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE11_M_overflowEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE11_M_overflowEv
_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE11_M_overflowEv:
.LFB5843:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	8(%rcx), %rbp
	movq	24(%rcx), %rdi
	movq	%rcx, %rbx
	subq	%rbp, %rdi
	je	.L100
	movq	296(%rcx), %r8
	movabsq	$9223372036854775806, %rax
	movq	%rax, %rdx
	subq	%r8, %rdx
	cmpq	%rdi, %rdx
	jb	.L131
	movq	288(%rcx), %r9
	leaq	304(%rcx), %r11
	leaq	(%rdi,%r8), %rsi
	cmpq	%r11, %r9
	je	.L132
	movq	304(%rcx), %rdx
	cmpq	%rsi, %rdx
	jb	.L108
.L104:
	leaq	(%r9,%r8), %rcx
	cmpq	$1, %rdi
	je	.L133
	movq	%rdi, %r8
	movq	%rbp, %rdx
	call	memcpy
	movq	288(%rbx), %r10
.L110:
	movb	$0, (%r10,%rsi)
	movq	8(%rbx), %rax
	movq	%rsi, 296(%rbx)
	movq	%rax, 24(%rbx)
.L100:
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L108:
	cmpq	%rsi, %rax
	jb	.L105
	leaq	(%rdx,%rdx), %rcx
	movq	%rcx, %r14
	cmpq	%rcx, %rsi
	jb	.L112
.L107:
	leaq	1(%rsi), %rcx
	movq	%rsi, %r14
.L106:
	movq	%r11, 56(%rsp)
	movq	%r9, 48(%rsp)
	movq	%r8, 40(%rsp)
	call	_Znwy
	movq	40(%rsp), %r8
	movq	48(%rsp), %r9
	movq	56(%rsp), %r11
	movq	%rax, %r10
	testq	%r8, %r8
	jne	.L113
	testq	%rbp, %rbp
	je	.L121
	movq	%rax, %rcx
	cmpq	$1, %rdi
	jne	.L115
	movzbl	0(%rbp), %eax
	movb	%al, (%r10)
	cmpq	%r11, %r9
	jne	.L117
	jmp	.L116
	.p2align 4,,10
	.p2align 3
.L133:
	movzbl	0(%rbp), %eax
	movb	%al, (%rcx)
	movq	288(%rbx), %r10
	jmp	.L110
	.p2align 4,,10
	.p2align 3
.L113:
	cmpq	$1, %r8
	je	.L134
	movq	%r9, %rdx
	movq	%rax, %rcx
	movq	%r11, 48(%rsp)
	movq	%r9, 40(%rsp)
	movq	%r8, 56(%rsp)
	call	memcpy
	testq	%rbp, %rbp
	movq	40(%rsp), %r9
	movq	48(%rsp), %r11
	movq	%rax, %r10
	jne	.L135
.L121:
	cmpq	%r11, %r9
	je	.L116
.L117:
	movq	304(%rbx), %rax
	movq	%r9, %rcx
	movq	%r10, 40(%rsp)
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	40(%rsp), %r10
.L116:
	movq	%r10, 288(%rbx)
	movq	%r14, 304(%rbx)
	jmp	.L110
	.p2align 4,,10
	.p2align 3
.L132:
	cmpq	$15, %rsi
	jbe	.L104
	cmpq	%rsi, %rax
	jb	.L105
	cmpq	$29, %rsi
	ja	.L107
	movl	$30, %r14d
	movl	$31, %ecx
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L112:
	leaq	1(%rcx), %rcx
	cmpq	%r14, %rax
	jnb	.L106
	movabsq	$9223372036854775807, %rcx
	movq	%rax, %r14
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L135:
	movq	56(%rsp), %r8
	leaq	(%rax,%r8), %rcx
	cmpq	$1, %rdi
	je	.L136
.L115:
	movq	%rdi, %r8
	movq	%rbp, %rdx
	movq	%r10, 56(%rsp)
	movq	%r11, 48(%rsp)
	movq	%r9, 40(%rsp)
	call	memcpy
	movq	56(%rsp), %r10
	movq	48(%rsp), %r11
	movq	40(%rsp), %r9
	jmp	.L121
	.p2align 4,,10
	.p2align 3
.L134:
	movzbl	(%r9), %eax
	movb	%al, (%r10)
	testq	%rbp, %rbp
	je	.L121
	leaq	1(%r10), %rcx
	cmpq	$1, %rdi
	jne	.L115
	movzbl	0(%rbp), %eax
	movb	%al, 1(%r10)
	cmpq	%r11, %r9
	jne	.L117
	jmp	.L116
	.p2align 4,,10
	.p2align 3
.L136:
	movzbl	0(%rbp), %eax
	movb	%al, (%rcx)
	jmp	.L121
.L105:
	leaq	.LC1(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L131:
	leaq	.LC0(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
	nop
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "basic_string::_M_replace_aux\0"
	.section	.text$_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE7_M_bumpEy,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE7_M_bumpEy
	.def	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE7_M_bumpEy;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE7_M_bumpEy
_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE7_M_bumpEy:
.LFB6502:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	24(%rcx), %r10
	movq	296(%rcx), %r8
	subq	8(%rcx), %r10
	addq	%rdx, %r10
	movq	%rcx, %r9
	cmpq	%r10, %r8
	jb	.L171
	cmpq	%r8, %r10
	jnb	.L156
.L168:
	movq	288(%r9), %rax
	movb	$0, (%rax,%r10)
	movq	%r10, 296(%r9)
.L156:
	leaq	32(%r9), %rax
	movq	$256, 16(%r9)
	movq	%rax, 8(%r9)
	movq	%rax, 24(%r9)
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L171:
	movabsq	$9223372036854775806, %rdx
	movq	%r10, %rcx
	movq	%rdx, %rax
	subq	%r8, %rcx
	subq	%r8, %rax
	movq	%rcx, %rbx
	cmpq	%rcx, %rax
	jb	.L172
	movq	288(%r9), %r11
	leaq	304(%r9), %rax
	movq	%rax, %rdi
	cmpq	%rax, %r11
	je	.L173
	movq	304(%r9), %rax
	movq	%rax, %rsi
	cmpq	%r10, %rax
	jb	.L174
.L141:
	leaq	(%r11,%r8), %rcx
	cmpq	$1, %rbx
	je	.L175
	movq	%rbx, %r8
	xorl	%edx, %edx
	movq	%r9, 112(%rsp)
	movq	%r10, 40(%rsp)
	call	memset
	movq	112(%rsp), %r9
	movq	40(%rsp), %r10
	jmp	.L168
	.p2align 4,,10
	.p2align 3
.L174:
	cmpq	%r10, %rdx
	jb	.L142
	leaq	(%rax,%rax), %rax
	movq	%rax, %r15
	cmpq	%rax, %r10
	jnb	.L144
	movq	%r9, 112(%rsp)
	movq	%r11, 56(%rsp)
	movq	%r8, 48(%rsp)
	movq	%r10, 40(%rsp)
	cmpq	%rax, %rdx
	jnb	.L176
	movabsq	$9223372036854775807, %rcx
	call	_Znwy
	movq	48(%rsp), %r8
	movq	40(%rsp), %r10
	movabsq	$9223372036854775806, %rdx
	movq	56(%rsp), %r11
	movq	112(%rsp), %r9
	movq	%rax, %r14
	testq	%r8, %r8
	jne	.L157
	movq	%rdx, %r15
	jmp	.L153
	.p2align 4,,10
	.p2align 3
.L144:
	leaq	1(%r10), %rcx
	movq	%r9, 112(%rsp)
	movq	%r11, 56(%rsp)
	movq	%r8, 48(%rsp)
	movq	%r10, 40(%rsp)
	call	_Znwy
	movq	48(%rsp), %r8
	movq	40(%rsp), %r10
	movq	56(%rsp), %r11
	movq	112(%rsp), %r9
	movq	%rax, %r14
	testq	%r8, %r8
	movq	%r10, %r15
	je	.L170
.L147:
	cmpq	$1, %r8
	je	.L177
.L152:
	movq	%r11, %rdx
	movq	%r14, %rcx
	movq	%r9, 112(%rsp)
	movq	%r10, 56(%rsp)
	movq	%r8, 48(%rsp)
	movq	%r11, 40(%rsp)
	call	memcpy
	movq	40(%rsp), %r11
	movq	48(%rsp), %r8
	movq	56(%rsp), %r10
	movq	112(%rsp), %r9
	cmpq	%rdi, %r11
	je	.L164
.L150:
	movq	304(%r9), %rsi
.L153:
	movq	%r11, %rcx
	leaq	1(%rsi), %rdx
	movq	%r9, 112(%rsp)
	movq	%r8, 48(%rsp)
	movq	%r10, 40(%rsp)
	call	_ZdlPvy
	movq	40(%rsp), %r10
	movq	48(%rsp), %r8
	movq	%r14, %r11
	movq	112(%rsp), %r9
.L151:
	movq	%r14, 288(%r9)
	movq	%r15, 304(%r9)
	jmp	.L141
	.p2align 4,,10
	.p2align 3
.L175:
	movb	$0, (%rcx)
	jmp	.L168
	.p2align 4,,10
	.p2align 3
.L173:
	cmpq	$15, %r10
	jbe	.L141
	cmpq	%r10, %rdx
	jb	.L142
	cmpq	$29, %r10
	ja	.L144
	movl	$31, %ecx
	movq	%r9, 112(%rsp)
	movq	%r11, 56(%rsp)
	movq	%r8, 48(%rsp)
	movq	%r10, 40(%rsp)
	call	_Znwy
	movq	48(%rsp), %r8
	movq	40(%rsp), %r10
	movq	56(%rsp), %r11
	movq	112(%rsp), %r9
	movq	%rax, %r14
	testq	%r8, %r8
	jne	.L165
	movq	%rax, %r11
	movl	$30, %r15d
	jmp	.L151
	.p2align 4,,10
	.p2align 3
.L177:
	movzbl	(%r11), %eax
	movb	%al, (%r14)
.L170:
	cmpq	%rdi, %r11
	jne	.L150
.L164:
	movq	%r14, %r11
	jmp	.L151
.L157:
	movq	%rdx, %r15
	cmpq	$1, %r8
	jne	.L152
	movzbl	(%r11), %eax
	movq	%rdx, %r15
	movb	%al, (%r14)
	jmp	.L150
.L165:
	movl	$30, %r15d
	jmp	.L147
.L176:
	leaq	1(%rax), %rcx
	call	_Znwy
	movq	48(%rsp), %r8
	movq	40(%rsp), %r10
	movq	56(%rsp), %r11
	movq	112(%rsp), %r9
	movq	%rax, %r14
	testq	%r8, %r8
	je	.L150
	jmp	.L147
.L142:
	leaq	.LC1(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L172:
	leaq	.LC2(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE10_M_reserveEy,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE10_M_reserveEy
	.def	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE10_M_reserveEy;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE10_M_reserveEy
_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE10_M_reserveEy:
.LFB6484:
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
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	8(%rcx), %r9
	movq	24(%rcx), %r8
	movq	296(%rcx), %rbp
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	leaq	304(%rcx), %r12
	cmpq	%r9, %r8
	jne	.L241
.L216:
	movq	288(%rbx), %r13
	addq	%rbp, %rsi
	cmpq	%r13, %r12
	je	.L242
	movq	304(%rbx), %rdx
	cmpq	%rsi, %rdx
	jb	.L243
.L202:
	movb	$0, 0(%r13,%rsi)
	movq	288(%rbx), %rdi
	movq	%rsi, 296(%rbx)
.L213:
	movq	%rdi, 8(%rbx)
	movq	%rbx, %rax
	addq	%rbp, %rdi
	movq	%rsi, 16(%rbx)
	movq	%rdi, 24(%rbx)
	addq	$48, %rsp
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
.L243:
	movabsq	$9223372036854775806, %r9
	cmpq	%rsi, %r9
	jb	.L189
	leaq	(%rdx,%rdx), %r14
	cmpq	%r14, %rsi
	jnb	.L204
	cmpq	%r14, %r9
	jnb	.L244
	movabsq	$9223372036854775807, %rcx
	movq	%rdx, 32(%rsp)
	call	_Znwy
	testq	%rbp, %rbp
	movq	32(%rsp), %rdx
	movq	%rax, %rdi
	je	.L214
	leaq	1(%rbp), %r8
	movq	%r13, %rdx
	movq	%rax, %rcx
	movabsq	$9223372036854775806, %r14
	call	memcpy
	.p2align 4
	.p2align 3
.L211:
	movq	304(%rbx), %rdx
.L212:
	addq	$1, %rdx
	movq	%r13, %rcx
	call	_ZdlPvy
.L210:
	movq	%rdi, 288(%rbx)
	movq	%r14, 304(%rbx)
	movb	$0, (%rdi,%rsi)
	movq	%rsi, 296(%rbx)
	jmp	.L213
	.p2align 4,,10
	.p2align 3
.L242:
	cmpq	$15, %rsi
	jbe	.L202
	movabsq	$9223372036854775806, %rax
	cmpq	%rsi, %rax
	jb	.L189
	cmpq	$29, %rsi
	jbe	.L203
.L204:
	leaq	1(%rsi), %rcx
	movq	%rsi, %r14
	call	_Znwy
	leaq	1(%rbp), %r8
	movq	%rax, %rdi
	testq	%rbp, %rbp
	je	.L206
.L207:
	movq	%r13, %rdx
	movq	%rdi, %rcx
	call	memcpy
	cmpq	%r13, %r12
	jne	.L211
	jmp	.L210
	.p2align 4,,10
	.p2align 3
.L248:
	movl	$30, %r14d
	.p2align 4
	.p2align 3
.L206:
	movzbl	0(%r13), %eax
	movb	%al, (%rdi)
	cmpq	%r13, %r12
	jne	.L211
	jmp	.L210
	.p2align 4,,10
	.p2align 3
.L241:
	movabsq	$9223372036854775806, %rax
	movq	%r8, %rdi
	movq	%rax, %rdx
	subq	%r9, %rdi
	subq	%rbp, %rdx
	cmpq	%rdi, %rdx
	jb	.L245
	movq	288(%rcx), %r10
	leaq	0(%rbp,%rdi), %r13
	cmpq	%r12, %r10
	je	.L246
	movq	304(%rcx), %r14
	cmpq	%r13, %r14
	jb	.L186
.L182:
	leaq	(%r10,%rbp), %rcx
	cmpq	$1, %rdi
	je	.L247
	movq	%rdi, %r8
	movq	%r9, %rdx
	call	memcpy
	movq	288(%rbx), %rax
.L188:
	movb	$0, (%rax,%r13)
	movq	8(%rbx), %rax
	movq	%r13, 296(%rbx)
	movq	%rax, 24(%rbx)
.L200:
	movq	%r13, %rbp
	jmp	.L216
	.p2align 4,,10
	.p2align 3
.L203:
	movl	$31, %ecx
	call	_Znwy
	movq	%rax, %rdi
	leaq	1(%rbp), %rax
	testq	%rbp, %rbp
	je	.L248
	cmpl	$64, %eax
	jnb	.L217
	testb	$32, %al
	jne	.L249
	testb	$16, %al
	jne	.L250
	testb	$8, %al
	jne	.L251
	testb	$4, %al
	jne	.L252
	testl	%eax, %eax
	je	.L218
	movzbl	(%r12), %edx
	movb	%dl, (%rdi)
	testb	$2, %al
	jne	.L253
.L218:
	movl	$30, %r14d
	jmp	.L210
	.p2align 4,,10
	.p2align 3
.L186:
	cmpq	%r13, %rax
	jb	.L189
	addq	%r14, %r14
	cmpq	%r14, %r13
	jnb	.L185
	leaq	1(%r14), %rcx
	cmpq	%r14, %rax
	jnb	.L184
	movabsq	$9223372036854775807, %rcx
	movq	%rax, %r14
.L184:
	movq	%r10, 40(%rsp)
	movq	%r9, 32(%rsp)
	call	_Znwy
	testq	%rbp, %rbp
	movq	32(%rsp), %r9
	movq	40(%rsp), %r10
	movq	%rax, %r11
	jne	.L191
	testq	%r9, %r9
	je	.L199
	movq	%rax, %rcx
	cmpq	$1, %rdi
	je	.L254
.L193:
	movq	%rdi, %r8
	movq	%r9, %rdx
	movq	%r11, 40(%rsp)
	movq	%r10, 32(%rsp)
	call	memcpy
	movq	40(%rsp), %r11
	movq	32(%rsp), %r10
.L199:
	cmpq	%r12, %r10
	je	.L194
.L195:
	movq	304(%rbx), %rax
	movq	%r10, %rcx
	movq	%r11, 32(%rsp)
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	32(%rsp), %r11
.L194:
	movq	%r11, 288(%rbx)
	movq	%r14, 304(%rbx)
	movb	$0, (%r11,%r13)
	movq	8(%rbx), %rax
	movq	%r13, 296(%rbx)
	movq	%rax, 24(%rbx)
	jmp	.L200
	.p2align 4,,10
	.p2align 3
.L214:
	movabsq	$9223372036854775806, %r14
	movzbl	0(%r13), %eax
	movb	%al, (%rdi)
	jmp	.L212
	.p2align 4,,10
	.p2align 3
.L244:
	leaq	1(%r14), %rcx
	call	_Znwy
	leaq	1(%rbp), %r8
	movq	%rax, %rdi
	testq	%rbp, %rbp
	jne	.L207
	movzbl	0(%r13), %eax
	movb	%al, (%rdi)
	jmp	.L211
	.p2align 4,,10
	.p2align 3
.L246:
	cmpq	$15, %r13
	jbe	.L182
	cmpq	%r13, %rax
	jb	.L189
	cmpq	$29, %r13
	ja	.L185
	movl	$30, %r14d
	movl	$31, %ecx
	jmp	.L184
	.p2align 4,,10
	.p2align 3
.L217:
	movl	%eax, %edx
	subl	$1, %eax
	leaq	(%rdi,%rdx), %rcx
	addq	%r12, %rdx
	movdqu	-64(%rdx), %xmm0
	movups	%xmm0, -64(%rcx)
	movdqu	-48(%rdx), %xmm0
	movups	%xmm0, -48(%rcx)
	movdqu	-32(%rdx), %xmm0
	movups	%xmm0, -32(%rcx)
	movdqu	-16(%rdx), %xmm0
	movups	%xmm0, -16(%rcx)
	cmpl	$64, %eax
	jb	.L218
	andl	$-64, %eax
	xorl	%ecx, %ecx
.L224:
	movl	%ecx, %edx
	addl	$64, %ecx
	movdqu	(%r12,%rdx), %xmm3
	movdqu	16(%r12,%rdx), %xmm2
	movdqu	32(%r12,%rdx), %xmm1
	movdqu	48(%r12,%rdx), %xmm0
	movups	%xmm3, (%rdi,%rdx)
	movups	%xmm2, 16(%rdi,%rdx)
	movups	%xmm1, 32(%rdi,%rdx)
	movups	%xmm0, 48(%rdi,%rdx)
	cmpl	%eax, %ecx
	jb	.L224
	jmp	.L218
	.p2align 4,,10
	.p2align 3
.L191:
	cmpq	$1, %rbp
	je	.L255
	movq	%r10, %rdx
	movq	%rbp, %r8
	movq	%rax, %rcx
	movq	%r9, 40(%rsp)
	movq	%r10, 32(%rsp)
	call	memcpy
	movq	40(%rsp), %r9
	movq	32(%rsp), %r10
	movq	%rax, %r11
	testq	%r9, %r9
	je	.L199
	leaq	(%rax,%rbp), %rcx
	cmpq	$1, %rdi
	jne	.L193
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	jmp	.L199
	.p2align 4,,10
	.p2align 3
.L247:
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	movq	288(%rbx), %rax
	jmp	.L188
.L185:
	leaq	1(%r13), %rcx
	movq	%r13, %r14
	jmp	.L184
.L255:
	movzbl	(%r10), %eax
	movb	%al, (%r11)
	testq	%r9, %r9
	je	.L199
	leaq	1(%r11), %rcx
	cmpq	$1, %rdi
	jne	.L193
	movzbl	(%r9), %eax
	movb	%al, 1(%r11)
	cmpq	%r12, %r10
	jne	.L195
	jmp	.L194
	.p2align 4,,10
	.p2align 3
.L254:
	movzbl	(%r9), %eax
	movb	%al, (%r11)
	cmpq	%r12, %r10
	jne	.L195
	jmp	.L194
.L249:
	movdqu	(%r12), %xmm0
	movl	%eax, %eax
	leaq	32(%rdi,%rax), %rdx
	leaq	32(%r12,%rax), %rax
	movups	%xmm0, (%rdi)
	movdqu	16(%r12), %xmm0
	movups	%xmm0, 16(%rdi)
	movdqu	-64(%rax), %xmm0
	movups	%xmm0, -64(%rdx)
	movdqu	-48(%rax), %xmm0
	movups	%xmm0, -48(%rdx)
	jmp	.L218
.L250:
	movdqu	(%r12), %xmm0
	movl	%eax, %eax
	movups	%xmm0, (%rdi)
	movdqu	-16(%r12,%rax), %xmm0
	movups	%xmm0, -16(%rdi,%rax)
	jmp	.L218
.L251:
	movq	(%r12), %rdx
	movl	%eax, %eax
	movq	%rdx, (%rdi)
	movq	-8(%r12,%rax), %rdx
	movq	%rdx, -8(%rdi,%rax)
	jmp	.L218
.L252:
	movl	(%r12), %edx
	movl	%eax, %eax
	movl	%edx, (%rdi)
	movl	-4(%r12,%rax), %edx
	movl	%edx, -4(%rdi,%rax)
	jmp	.L218
.L253:
	movl	%eax, %eax
	movzwl	-2(%r12,%rax), %edx
	movw	%dx, -2(%rdi,%rax)
	jmp	.L218
.L189:
	leaq	.LC1(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L245:
	leaq	.LC0(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE,"x"
	.linkonce discard
	.p2align 4
	.globl	_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE
	.def	_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE
_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE:
.LFB3899:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$448, %rsp
	.seh_stackalloc	448
	.seh_endprologue
	movq	.LC3(%rip), %xmm1
	movdqu	(%r8), %xmm0
	movq	(%rdx), %r10
	movq	8(%rdx), %r11
	leaq	160(%rsp), %rax
	movq	%rcx, %rbx
	leaq	64(%rsp), %rdx
	movq	$256, 144(%rsp)
	movq	%rax, %xmm4
	leaq	80(%rsp), %r8
	leaq	128(%rsp), %rcx
	movq	%rax, 152(%rsp)
	punpcklqdq	%xmm4, %xmm1
	leaq	432(%rsp), %rsi
	movb	$0, 432(%rsp)
	movq	%rsi, 416(%rsp)
	movq	$0, 424(%rsp)
	movq	%rcx, 96(%rsp)
	movb	$0, 104(%rsp)
	movb	$0, 112(%rsp)
	movq	%r10, 64(%rsp)
	movq	%r11, 72(%rsp)
	movups	%xmm1, 128(%rsp)
	movups	%xmm0, 80(%rsp)
.LEHB0:
	call	_ZNSt8__format15__do_vformat_toIcLj1EEENS_10_Sink_iterIT_EES3_St17basic_string_viewIS2_St11char_traitsIS2_EERSt20basic_format_contextIS3_S2_E
.LEHE0:
	cmpb	$0, 112(%rsp)
	jne	.L310
	movq	136(%rsp), %r11
	movq	152(%rsp), %r9
	cmpq	%r9, %r11
	je	.L259
.L258:
	movq	424(%rsp), %r8
	subq	%r11, %r9
	movabsq	$9223372036854775806, %rax
	movq	%rax, %rdx
	subq	%r8, %rdx
	cmpq	%r9, %rdx
	jb	.L311
	movq	416(%rsp), %rdi
	leaq	(%r9,%r8), %r10
	cmpq	%rsi, %rdi
	je	.L312
	movq	432(%rsp), %rdx
	cmpq	%r10, %rdx
	jb	.L269
.L265:
	leaq	(%rdi,%r8), %rcx
	cmpq	$1, %r9
	je	.L313
	movq	%r9, %r8
	movq	%r11, %rdx
	movq	%r10, 32(%rsp)
	call	memcpy
	movq	416(%rsp), %r14
	movq	32(%rsp), %r10
.L271:
	movb	$0, (%r14,%r10)
	movq	416(%rsp), %rax
	leaq	16(%rbx), %rdx
	movq	%rdx, (%rbx)
	cmpq	%rsi, %rax
	jne	.L294
.L283:
	leaq	1(%r10), %rax
	cmpl	$64, %eax
	jnb	.L285
	testb	$32, %al
	jne	.L314
	testb	$16, %al
	jne	.L315
	testb	$8, %al
	jne	.L316
	testb	$4, %al
	jne	.L317
	testl	%eax, %eax
	je	.L284
	movzbl	432(%rsp), %ecx
	movb	%cl, (%rdx)
	testb	$2, %al
	je	.L284
	movl	%eax, %eax
	movzwl	-2(%rsi,%rax), %ecx
	movw	%cx, -2(%rdx,%rax)
	jmp	.L284
	.p2align 4,,10
	.p2align 3
.L310:
	leaq	104(%rsp), %rcx
	call	_ZNSt6localeD1Ev
	movq	136(%rsp), %r11
	movq	152(%rsp), %r9
	cmpq	%r9, %r11
	jne	.L258
.L259:
	movq	416(%rsp), %rax
	leaq	16(%rbx), %rdx
	movq	424(%rsp), %r10
	movq	%rdx, (%rbx)
	cmpq	%rsi, %rax
	je	.L283
.L294:
	movq	%rax, (%rbx)
	movq	432(%rsp), %rax
	movq	%rax, 16(%rbx)
.L284:
	movq	%rbx, %rax
	movq	%r10, 8(%rbx)
	addq	$448, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L312:
	cmpq	$15, %r10
	jbe	.L265
	cmpq	%r10, %rax
	jb	.L266
	cmpq	$29, %r10
	ja	.L268
	movl	$30, %r15d
	movl	$31, %ecx
	.p2align 4
	.p2align 3
.L267:
	movq	%r8, 56(%rsp)
	movq	%r11, 48(%rsp)
	movq	%r10, 40(%rsp)
	movq	%r9, 32(%rsp)
.LEHB1:
	call	_Znwy
	movq	56(%rsp), %r8
	movq	32(%rsp), %r9
	movq	%rax, %r14
	movq	40(%rsp), %r10
	movq	48(%rsp), %r11
	testq	%r8, %r8
	jne	.L274
	testq	%r11, %r11
	je	.L282
	movq	%rax, %rcx
	cmpq	$1, %r9
	je	.L318
.L276:
	movq	%r9, %r8
	movq	%r11, %rdx
	movq	%r10, 32(%rsp)
	call	memcpy
	movq	32(%rsp), %r10
.L282:
	cmpq	%rsi, %rdi
	je	.L277
.L278:
	movq	432(%rsp), %rax
	movq	%rdi, %rcx
	movq	%r10, 32(%rsp)
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	32(%rsp), %r10
.L277:
	movq	%r14, 416(%rsp)
	movq	%r15, 432(%rsp)
	jmp	.L271
	.p2align 4,,10
	.p2align 3
.L313:
	movzbl	(%r11), %eax
	movb	%al, (%rcx)
	movq	416(%rsp), %r14
	jmp	.L271
	.p2align 4,,10
	.p2align 3
.L269:
	cmpq	%r10, %rax
	jb	.L266
	leaq	(%rdx,%rdx), %rcx
	movq	%rcx, %r15
	cmpq	%rcx, %r10
	jnb	.L268
	leaq	1(%rcx), %rcx
	cmpq	%r15, %rax
	jnb	.L267
	movabsq	$9223372036854775807, %rcx
	movq	%rax, %r15
	jmp	.L267
	.p2align 4,,10
	.p2align 3
.L285:
	movl	%eax, %ecx
	subl	$1, %eax
	leaq	(%rdx,%rcx), %r8
	addq	%rsi, %rcx
	movdqu	-64(%rcx), %xmm0
	movups	%xmm0, -64(%r8)
	movdqu	-48(%rcx), %xmm0
	movups	%xmm0, -48(%r8)
	movdqu	-32(%rcx), %xmm0
	movups	%xmm0, -32(%r8)
	movdqu	-16(%rcx), %xmm0
	movups	%xmm0, -16(%r8)
	cmpl	$64, %eax
	jb	.L284
	andl	$-64, %eax
	xorl	%r8d, %r8d
.L292:
	movl	%r8d, %ecx
	addl	$64, %r8d
	movdqu	(%rsi,%rcx), %xmm3
	movdqu	16(%rsi,%rcx), %xmm2
	movdqu	32(%rsi,%rcx), %xmm1
	movdqu	48(%rsi,%rcx), %xmm0
	movups	%xmm3, (%rdx,%rcx)
	movups	%xmm2, 16(%rdx,%rcx)
	movups	%xmm1, 32(%rdx,%rcx)
	movups	%xmm0, 48(%rdx,%rcx)
	cmpl	%eax, %r8d
	jb	.L292
	jmp	.L284
	.p2align 4,,10
	.p2align 3
.L268:
	leaq	1(%r10), %rcx
	movq	%r10, %r15
	jmp	.L267
	.p2align 4,,10
	.p2align 3
.L274:
	cmpq	$1, %r8
	je	.L319
	movq	%rdi, %rdx
	movq	%rax, %rcx
	movq	%r11, 40(%rsp)
	movq	%r10, 32(%rsp)
	movq	%r9, 56(%rsp)
	movq	%r8, 48(%rsp)
	call	memcpy
	movq	40(%rsp), %r11
	movq	32(%rsp), %r10
	testq	%r11, %r11
	je	.L282
	movq	48(%rsp), %r8
	movq	56(%rsp), %r9
	leaq	(%r14,%r8), %rcx
	cmpq	$1, %r9
	jne	.L276
	movzbl	(%r11), %eax
	movb	%al, (%rcx)
	jmp	.L282
	.p2align 4,,10
	.p2align 3
.L319:
	movzbl	(%rdi), %eax
	movb	%al, (%r14)
	testq	%r11, %r11
	je	.L282
	leaq	1(%r14), %rcx
	cmpq	$1, %r9
	jne	.L276
	movzbl	(%r11), %eax
	movb	%al, 1(%r14)
	cmpq	%rsi, %rdi
	jne	.L278
	jmp	.L277
	.p2align 4,,10
	.p2align 3
.L318:
	movzbl	(%r11), %eax
	movb	%al, (%r14)
	cmpq	%rsi, %rdi
	jne	.L278
	jmp	.L277
.L314:
	movdqu	432(%rsp), %xmm0
	movl	%eax, %eax
	movups	%xmm0, (%rdx)
	movdqu	448(%rsp), %xmm0
	movups	%xmm0, 16(%rdx)
	leaq	32(%rdx,%rax), %rdx
	leaq	32(%rsi,%rax), %rax
	movdqu	-64(%rax), %xmm0
	movups	%xmm0, -64(%rdx)
	movdqu	-48(%rax), %xmm0
	movups	%xmm0, -48(%rdx)
	jmp	.L284
.L315:
	movdqu	432(%rsp), %xmm0
	movl	%eax, %eax
	movups	%xmm0, (%rdx)
	movdqu	-16(%rsi,%rax), %xmm0
	movups	%xmm0, -16(%rdx,%rax)
	jmp	.L284
.L316:
	movq	432(%rsp), %rcx
	movl	%eax, %eax
	movq	%rcx, (%rdx)
	movq	-8(%rsi,%rax), %rcx
	movq	%rcx, -8(%rdx,%rax)
	jmp	.L284
.L317:
	movl	432(%rsp), %ecx
	movl	%eax, %eax
	movl	%ecx, (%rdx)
	movl	-4(%rsi,%rax), %ecx
	movl	%ecx, -4(%rdx,%rax)
	jmp	.L284
.L311:
	leaq	.LC0(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.LEHE1:
.L301:
	movq	%rax, %rbx
	cmpb	$0, 112(%rsp)
	je	.L262
	leaq	104(%rsp), %rcx
	call	_ZNSt6localeD1Ev
.L262:
	leaq	16+_ZTVNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE(%rip), %rax
	leaq	416(%rsp), %rcx
	movq	%rax, 128(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rcx
.LEHB2:
	call	_Unwind_Resume
.LEHE2:
.L300:
	movq	%rax, %rbx
	jmp	.L262
.L266:
	leaq	.LC1(%rip), %rcx
.LEHB3:
	call	_ZSt20__throw_length_errorPKc
	nop
.LEHE3:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA3899:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE3899-.LLSDACSB3899
.LLSDACSB3899:
	.uleb128 .LEHB0-.LFB3899
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L301-.LFB3899
	.uleb128 0
	.uleb128 .LEHB1-.LFB3899
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L300-.LFB3899
	.uleb128 0
	.uleb128 .LEHB2-.LFB3899
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB3-.LFB3899
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L300-.LFB3899
	.uleb128 0
.LLSDACSE3899:
	.section	.text$_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE,"x"
	.linkonce discard
	.seh_endproc
	.section .rdata,"dr"
.LC4:
	.ascii "twice(21) = \0"
.LC5:
	.ascii "\346\225\264\346\225\260 {}\0"
.LC6:
	.ascii "  int \345\272\217\345\210\227\357\274\232\0"
.LC7:
	.ascii "\345\245\207\346\225\260\345\271\263\346\226\271\345\217\226\345\211\215\344\270\244\344\270\252\357\274\232\0"
.LC8:
	.ascii "ranges::sort \344\271\213\345\220\216\357\274\232\0"
.LC9:
	.ascii "1.9 < 2.0 ? {}\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB4926:
	pushq	%r15
	.seh_pushreg	%r15
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
	subq	$152, %rsp
	.seh_stackalloc	152
	.seh_endprologue
	call	__main
	movq	.refptr._ZSt4cout(%rip), %rbx
	movl	$12, %r8d
	leaq	.LC4(%rip), %rdx
	movq	%rbx, %rcx
.LEHB4:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$42, %edx
	movq	%rbx, %rcx
	call	_ZNSolsEi
	movb	$10, 112(%rsp)
	movq	(%rax), %rdx
	movq	-24(%rdx), %rdx
	cmpq	$0, 16(%rax,%rdx)
	je	.L321
	leaq	112(%rsp), %r12
	movl	$1, %r8d
	movq	%rax, %rcx
	movq	%r12, %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.L322:
	leaq	.LC5(%rip), %rax
	leaq	48(%rsp), %r8
	movq	%r12, %rcx
	movl	$7, 96(%rsp)
	leaq	64(%rsp), %rdx
	leaq	96(%rsp), %r13
	movq	%rax, 72(%rsp)
	movq	$9, 64(%rsp)
	movq	$49, 48(%rsp)
	movq	%r13, 56(%rsp)
	call	_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE
.LEHE4:
	movq	120(%rsp), %r8
	movq	112(%rsp), %rdx
	movq	%rbx, %rcx
.LEHB5:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movb	$10, 96(%rsp)
	movq	(%rax), %rdx
	movq	-24(%rdx), %rdx
	cmpq	$0, 16(%rax,%rdx)
	je	.L323
	movl	$1, %r8d
	movq	%r13, %rdx
	movq	%rax, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE5:
.L326:
	movq	112(%rsp), %rcx
	leaq	128(%rsp), %r14
	cmpq	%r14, %rcx
	je	.L324
	movq	128(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L324:
	movl	$24, %ecx
.LEHB6:
	call	_Znwy
.LEHE6:
	movq	%rax, %rbp
	leaq	24(%rax), %rdi
	movl	$15, %r8d
	movq	%rbx, %rcx
	movdqu	.LC10(%rip), %xmm0
	leaq	.LC6(%rip), %rdx
	movups	%xmm0, (%rax)
	movabsq	$8589934601, %rax
	movq	%rax, 16(%rbp)
.LEHB7:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rbp, %rsi
	movq	%rbp, %r15
	jmp	.L330
	.p2align 4,,10
	.p2align 3
.L383:
	movl	$1, %r8d
	leaq	91(%rsp), %rdx
	movq	%rax, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	addq	$4, %r15
	cmpq	%rdi, %r15
	je	.L382
.L330:
	movl	(%r15), %edx
	movq	%rbx, %rcx
	call	_ZNSolsEi
	movq	(%rax), %rdx
	movb	$32, 91(%rsp)
	movq	-24(%rdx), %rdx
	cmpq	$0, 16(%rax,%rdx)
	jne	.L383
	movl	$32, %edx
	movq	%rax, %rcx
	call	_ZNSo3putEc
	addq	$4, %r15
	cmpq	%rdi, %r15
	jne	.L330
.L382:
	movq	(%rbx), %rax
	movb	$10, 92(%rsp)
	movq	-24(%rax), %rax
	cmpq	$0, 16(%rbx,%rax)
	je	.L333
	leaq	92(%rsp), %rdx
	movl	$1, %r8d
	movq	%rbx, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.L335:
	movl	$27, %r8d
	leaq	.LC7(%rip), %rdx
	movq	%rbx, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	%rbp, %r15
	jmp	.L334
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L384:
	addq	$4, %r15
	cmpq	%r15, %rdi
	je	.L337
.L334:
	movl	(%r15), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	cmpl	$1, %eax
	jne	.L384
	movq	$2, 40(%rsp)
.L336:
	cmpq	%rdi, %r15
	je	.L337
	movl	(%r15), %edx
	movq	%rbx, %rcx
	imull	%edx, %edx
	call	_ZNSolsEi
	movq	(%rax), %rdx
	movb	$32, 93(%rsp)
	movq	-24(%rdx), %rdx
	cmpq	$0, 16(%rax,%rdx)
	je	.L338
	movl	$1, %r8d
	leaq	93(%rsp), %rdx
	movq	%rax, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	jmp	.L381
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L339:
	movl	(%r15), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	cmpl	$1, %eax
	je	.L340
.L381:
	addq	$4, %r15
	cmpq	%r15, %rdi
	jne	.L339
.L340:
	cmpq	$1, 40(%rsp)
	je	.L337
	movq	$1, 40(%rsp)
	jmp	.L336
	.p2align 4,,10
	.p2align 3
.L337:
	movq	(%rbx), %rax
	movb	$10, 94(%rsp)
	movq	-24(%rax), %rax
	cmpq	$0, 16(%rbx,%rax)
	je	.L343
	leaq	94(%rsp), %rdx
	movl	$1, %r8d
	movq	%rbx, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.L345:
	movl	$4, %r8d
	movq	%rdi, %rdx
	movq	%rbp, %rcx
	call	_ZNSt6ranges8__detail16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEENS0_10_Comp_projINS_4lessESt8identityEEEEvT_SD_jT0_.isra.0
	movq	%rdi, %rdx
	movq	%rbp, %rcx
	call	_ZNSt6ranges8__detail16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEENS0_10_Comp_projINS_4lessESt8identityEEEEvT_SD_T0_.isra.0
	movl	$22, %r8d
	leaq	.LC8(%rip), %rdx
	movq	%rbx, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	jmp	.L344
	.p2align 4,,10
	.p2align 3
.L386:
	movl	$1, %r8d
	leaq	95(%rsp), %rdx
	movq	%rax, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	addq	$4, %rsi
	cmpq	%rdi, %rsi
	je	.L385
.L344:
	movl	(%rsi), %edx
	movq	%rbx, %rcx
	call	_ZNSolsEi
	movq	(%rax), %rdx
	movb	$32, 95(%rsp)
	movq	-24(%rdx), %rdx
	cmpq	$0, 16(%rax,%rdx)
	jne	.L386
	movl	$32, %edx
	movq	%rax, %rcx
	call	_ZNSo3putEc
	addq	$4, %rsi
	cmpq	%rdi, %rsi
	jne	.L344
.L385:
	movq	(%rbx), %rax
	movb	$10, 112(%rsp)
	movq	-24(%rax), %rax
	cmpq	$0, 16(%rbx,%rax)
	je	.L349
	movl	$1, %r8d
	movq	%r12, %rdx
	movq	%rbx, %rcx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.L351:
	leaq	.LC9(%rip), %rax
	leaq	48(%rsp), %r8
	movq	%r12, %rcx
	movb	$1, 96(%rsp)
	leaq	64(%rsp), %rdx
	movq	%rax, 72(%rsp)
	movq	$15, 64(%rsp)
	movq	$17, 48(%rsp)
	movq	%r13, 56(%rsp)
	call	_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE
.LEHE7:
	movq	120(%rsp), %r8
	movq	112(%rsp), %rdx
	movq	%rbx, %rcx
.LEHB8:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
.LEHE8:
	movq	112(%rsp), %rcx
	cmpq	%r14, %rcx
	je	.L352
	movq	128(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L352:
	movq	%rdi, %rdx
	movq	%rbp, %rcx
	call	_ZNSt12_Vector_baseIiSaIiEED2Ev.isra.0
	xorl	%eax, %eax
	addq	$152, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L349:
	movl	$10, %edx
	movq	%rbx, %rcx
.LEHB9:
	call	_ZNSo3putEc
	jmp	.L351
.L343:
	movl	$10, %edx
	movq	%rbx, %rcx
	call	_ZNSo3putEc
	jmp	.L345
.L333:
	movl	$10, %edx
	movq	%rbx, %rcx
	call	_ZNSo3putEc
.LEHE9:
	jmp	.L335
.L323:
	movl	$10, %edx
	movq	%rax, %rcx
.LEHB10:
	call	_ZNSo3putEc
.LEHE10:
	jmp	.L326
.L321:
	movl	$10, %edx
	movq	%rax, %rcx
	leaq	112(%rsp), %r12
.LEHB11:
	call	_ZNSo3putEc
.LEHE11:
	jmp	.L322
.L338:
	movl	$32, %edx
	movq	%rax, %rcx
.LEHB12:
	call	_ZNSo3putEc
.LEHE12:
	jmp	.L381
.L360:
	movq	%r12, %rcx
	movq	%rax, %rbx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L355:
	movq	%rbp, %rcx
	movq	%rdi, %rdx
	call	_ZNSt12_Vector_baseIiSaIiEED2Ev.isra.0
	movq	%rbx, %rcx
.LEHB13:
	call	_Unwind_Resume
.L359:
	movq	%rax, %rbx
	jmp	.L355
.L361:
	movq	%rax, %rbx
	xorl	%ecx, %ecx
	xorl	%edx, %edx
	call	_ZNSt12_Vector_baseIiSaIiEED2Ev.isra.0
	movq	%rbx, %rcx
	call	_Unwind_Resume
.L358:
	movq	%rax, %rbx
	movq	%r12, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rcx
	call	_Unwind_Resume
	nop
.LEHE13:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA4926:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4926-.LLSDACSB4926
.LLSDACSB4926:
	.uleb128 .LEHB4-.LFB4926
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB5-.LFB4926
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L358-.LFB4926
	.uleb128 0
	.uleb128 .LEHB6-.LFB4926
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L361-.LFB4926
	.uleb128 0
	.uleb128 .LEHB7-.LFB4926
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L359-.LFB4926
	.uleb128 0
	.uleb128 .LEHB8-.LFB4926
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L360-.LFB4926
	.uleb128 0
	.uleb128 .LEHB9-.LFB4926
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L359-.LFB4926
	.uleb128 0
	.uleb128 .LEHB10-.LFB4926
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L358-.LFB4926
	.uleb128 0
	.uleb128 .LEHB11-.LFB4926
	.uleb128 .LEHE11-.LEHB11
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB12-.LFB4926
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L359-.LFB4926
	.uleb128 0
	.uleb128 .LEHB13-.LFB4926
	.uleb128 .LEHE13-.LEHB13
	.uleb128 0
	.uleb128 0
.LLSDACSE4926:
	.section	.text.startup,"x"
	.seh_endproc
	.globl	_ZTSNSt8__format5_SinkIcEE
	.section	.rdata$_ZTSNSt8__format5_SinkIcEE,"dr"
	.linkonce same_size
	.align 16
_ZTSNSt8__format5_SinkIcEE:
	.ascii "NSt8__format5_SinkIcEE\0"
	.globl	_ZTINSt8__format5_SinkIcEE
	.section	.rdata$_ZTINSt8__format5_SinkIcEE,"dr"
	.linkonce same_size
	.align 8
_ZTINSt8__format5_SinkIcEE:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTSNSt8__format5_SinkIcEE
	.globl	_ZTSNSt8__format9_Buf_sinkIcEE
	.section	.rdata$_ZTSNSt8__format9_Buf_sinkIcEE,"dr"
	.linkonce same_size
	.align 16
_ZTSNSt8__format9_Buf_sinkIcEE:
	.ascii "NSt8__format9_Buf_sinkIcEE\0"
	.globl	_ZTINSt8__format9_Buf_sinkIcEE
	.section	.rdata$_ZTINSt8__format9_Buf_sinkIcEE,"dr"
	.linkonce same_size
	.align 8
_ZTINSt8__format9_Buf_sinkIcEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt8__format9_Buf_sinkIcEE
	.quad	_ZTINSt8__format5_SinkIcEE
	.globl	_ZTSNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE
	.section	.rdata$_ZTSNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE,"dr"
	.linkonce same_size
	.align 32
_ZTSNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE:
	.ascii "NSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE\0"
	.globl	_ZTINSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE
	.section	.rdata$_ZTINSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE,"dr"
	.linkonce same_size
	.align 8
_ZTINSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE
	.quad	_ZTINSt8__format9_Buf_sinkIcEE
	.globl	_ZTVNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE
	.section	.rdata$_ZTVNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE,"dr"
	.linkonce same_size
	.align 8
_ZTVNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE:
	.quad	0
	.quad	_ZTINSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE
	.quad	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE11_M_overflowEv
	.quad	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE10_M_reserveEy
	.quad	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE7_M_bumpEy
	.quad	_ZNKSt8__format5_SinkIcE13_M_discardingEv
	.section .rdata,"dr"
	.align 8
.LC3:
	.quad	_ZTVNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE+16
	.align 16
.LC10:
	.quad	12884901893
	.quad	4294967304
	.def	__main;	.scl	2;	.type	32;	.endef
	.def	__gxx_personality_seh0;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev5, Built by MSYS2 project) 16.1.0"
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	_ZdlPvy;	.scl	2;	.type	32;	.endef
	.def	memcpy;	.scl	2;	.type	32;	.endef
	.def	_Znwy;	.scl	2;	.type	32;	.endef
	.def	_ZSt20__throw_length_errorPKc;	.scl	2;	.type	32;	.endef
	.def	memset;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8__format15__do_vformat_toIcLj1EEENS_10_Sink_iterIT_EES3_St17basic_string_viewIS2_St11char_traitsIS2_EERSt20basic_format_contextIS3_S2_E;	.scl	2;	.type	32;	.endef
	.def	_ZNSt6localeD1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEi;	.scl	2;	.type	32;	.endef
	.def	_ZNSo3putEc;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.p2align	3, 0
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
