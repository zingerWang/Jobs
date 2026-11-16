	.file	"structured.cpp"
	.text
	.section	.text$_ZNKSt18bad_variant_access4whatEv,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt18bad_variant_access4whatEv
	.def	_ZNKSt18bad_variant_access4whatEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt18bad_variant_access4whatEv
_ZNKSt18bad_variant_access4whatEv:
.LFB2187:
	.seh_endprologue
	movq	8(%rcx), %rax
	ret
	.seh_endproc
	.section	.text$_ZNSt18bad_variant_accessD1Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt18bad_variant_accessD1Ev
	.def	_ZNSt18bad_variant_accessD1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt18bad_variant_accessD1Ev
_ZNSt18bad_variant_accessD1Ev:
.LFB2194:
	.seh_endprologue
	leaq	16+_ZTVSt18bad_variant_access(%rip), %rax
	movq	%rax, (%rcx)
	jmp	_ZNSt9exceptionD2Ev
	.seh_endproc
	.section	.text$_ZNSt18bad_variant_accessD0Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt18bad_variant_accessD0Ev
	.def	_ZNSt18bad_variant_accessD0Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt18bad_variant_accessD0Ev
_ZNSt18bad_variant_accessD0Ev:
.LFB2195:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	leaq	16+_ZTVSt18bad_variant_access(%rip), %rax
	movq	%rax, (%rcx)
	movq	%rcx, 40(%rsp)
	call	_ZNSt9exceptionD2Ev
	movq	40(%rsp), %rcx
	movl	$16, %edx
	addq	$56, %rsp
	jmp	_ZdlPvy
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "basic_string: construction from null is not valid\0"
	.text
	.align 2
	.p2align 4
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_.isra.0
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_.isra.0:
.LFB3209:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	leaq	16(%rcx), %rdi
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	movq	%rdi, (%rcx)
	testq	%rdx, %rdx
	je	.L14
	movq	%rdx, %rcx
	call	strlen
	movq	%rax, 56(%rsp)
	movq	%rax, %r9
	cmpq	$15, %rax
	ja	.L15
	cmpq	$1, %rax
	jne	.L9
	movzbl	(%rsi), %eax
	movb	%al, 16(%rbx)
.L10:
	movq	56(%rsp), %rax
	movq	(%rbx), %rdx
	movb	$0, (%rdx,%rax)
	movq	%rax, 8(%rbx)
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
.L9:
	testq	%rax, %rax
	je	.L10
	jmp	.L8
.L15:
	leaq	56(%rsp), %rdx
	xorl	%r8d, %r8d
	movq	%rbx, %rcx
	movq	%rax, 40(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	40(%rsp), %r9
	movq	%rax, (%rbx)
	movq	%rax, %rdi
	movq	56(%rsp), %rax
	movq	%rax, 16(%rbx)
.L8:
	movq	%r9, %r8
	movq	%rsi, %rdx
	movq	%rdi, %rcx
	call	memcpy
	jmp	.L10
.L14:
	leaq	.LC0(%rip), %rcx
	call	_ZSt19__throw_logic_errorPKc
	nop
	.seh_endproc
	.align 2
	.p2align 4
	.def	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE24_M_get_insert_unique_posERS7_.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE24_M_get_insert_unique_posERS7_.isra.0
_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE24_M_get_insert_unique_posERS7_.isra.0:
.LFB3211:
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
	movq	16(%rdx), %r13
	movq	%rcx, %rdi
	movq	%rdx, %rbp
	movq	%r8, %rsi
	movq	%r9, %r12
	testq	%r13, %r13
	je	.L40
	movq	32(%r13), %rdx
	movq	40(%r13), %rbx
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L22:
	movq	24(%r13), %rax
	xorl	%edx, %edx
	testq	%rax, %rax
	je	.L41
.L25:
	movq	32(%rax), %rdx
	movq	40(%rax), %rbx
	movq	%rax, %r13
.L19:
	cmpq	%r12, %rbx
	movq	%r12, %r8
	cmovbe	%rbx, %r8
	testq	%r8, %r8
	je	.L20
	movq	%rsi, %rcx
	call	memcmp
	testl	%eax, %eax
	jne	.L21
.L20:
	movq	%r12, %rax
	subq	%rbx, %rax
	cmpq	$2147483647, %rax
	jg	.L22
	cmpq	$-2147483648, %rax
	jl	.L23
.L21:
	testl	%eax, %eax
	jns	.L22
.L23:
	movq	16(%r13), %rax
	movl	$1, %edx
	testq	%rax, %rax
	jne	.L25
.L41:
	testb	%dl, %dl
	jne	.L18
	movq	32(%r13), %rcx
	movq	40(%r13), %rbx
	movq	%r13, %rbp
.L33:
	cmpq	%r12, %rbx
	movq	%r12, %r8
	cmovbe	%rbx, %r8
	testq	%r8, %r8
	je	.L29
	movq	%rsi, %rdx
	call	memcmp
	testl	%eax, %eax
	jne	.L30
.L29:
	subq	%r12, %rbx
	cmpq	$2147483647, %rbx
	jg	.L31
	cmpq	$-2147483648, %rbx
	jl	.L32
	movl	%ebx, %eax
.L30:
	testl	%eax, %eax
	js	.L32
.L31:
	movq	%rdi, %rax
	movq	%r13, (%rdi)
	movq	$0, 8(%rdi)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L40:
	leaq	8(%rdx), %r13
.L18:
	cmpq	%r13, 24(%rbp)
	je	.L42
	movq	%r13, %rcx
	movq	%r13, %rbp
	call	_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base
	movq	32(%rax), %rcx
	movq	40(%rax), %rbx
	movq	%rax, %r13
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L32:
	movq	%rdi, %rax
	movq	$0, (%rdi)
	movq	%rbp, 8(%rdi)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L42:
	movq	%rdi, %rax
	movq	$0, (%rdi)
	movq	%r13, 8(%rdi)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.def	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE8_M_eraseEPSt13_Rb_tree_nodeIS8_E.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE8_M_eraseEPSt13_Rb_tree_nodeIS8_E.isra.0
_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE8_M_eraseEPSt13_Rb_tree_nodeIS8_E.isra.0:
.LFB3213:
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
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, 128(%rsp)
	testq	%rcx, %rcx
	je	.L43
.L70:
	movq	128(%rsp), %rax
	movq	24(%rax), %rax
	movq	%rax, 32(%rsp)
	testq	%rax, %rax
	je	.L45
.L68:
	movq	32(%rsp), %rax
	movq	24(%rax), %r14
	testq	%r14, %r14
	je	.L46
.L66:
	movq	24(%r14), %r15
	testq	%r15, %r15
	je	.L47
.L64:
	movq	24(%r15), %r12
	testq	%r12, %r12
	je	.L48
.L62:
	movq	24(%r12), %rbp
	testq	%rbp, %rbp
	je	.L49
.L60:
	movq	24(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L50
.L58:
	movq	24(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L51
.L56:
	movq	24(%rbx), %rsi
	testq	%rsi, %rsi
	je	.L52
.L54:
	movq	24(%rsi), %rcx
	movq	%rsi, %r13
	call	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE8_M_eraseEPSt13_Rb_tree_nodeIS8_E.isra.0
	movq	32(%r13), %rcx
	leaq	48(%r13), %rdx
	movq	16(%rsi), %rsi
	cmpq	%rdx, %rcx
	je	.L53
	movq	48(%r13), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L53:
	movl	$72, %edx
	movq	%r13, %rcx
	call	_ZdlPvy
	testq	%rsi, %rsi
	jne	.L54
.L52:
	movq	32(%rbx), %rcx
	leaq	48(%rbx), %rax
	movq	16(%rbx), %rsi
	cmpq	%rax, %rcx
	je	.L55
	movq	48(%rbx), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L55:
	movl	$72, %edx
	movq	%rbx, %rcx
	call	_ZdlPvy
	testq	%rsi, %rsi
	je	.L51
	movq	%rsi, %rbx
	jmp	.L56
	.p2align 4,,10
	.p2align 3
.L51:
	movq	32(%rdi), %rcx
	leaq	48(%rdi), %rax
	movq	16(%rdi), %rbx
	cmpq	%rax, %rcx
	je	.L57
	movq	48(%rdi), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L57:
	movl	$72, %edx
	movq	%rdi, %rcx
	call	_ZdlPvy
	testq	%rbx, %rbx
	je	.L50
	movq	%rbx, %rdi
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L50:
	movq	32(%rbp), %rcx
	leaq	48(%rbp), %rax
	movq	16(%rbp), %rbx
	cmpq	%rax, %rcx
	je	.L59
	movq	48(%rbp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L59:
	movl	$72, %edx
	movq	%rbp, %rcx
	call	_ZdlPvy
	testq	%rbx, %rbx
	je	.L49
	movq	%rbx, %rbp
	jmp	.L60
.L49:
	movq	32(%r12), %rcx
	leaq	48(%r12), %rax
	movq	16(%r12), %rbx
	cmpq	%rax, %rcx
	je	.L61
	movq	48(%r12), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L61:
	movl	$72, %edx
	movq	%r12, %rcx
	call	_ZdlPvy
	testq	%rbx, %rbx
	je	.L48
	movq	%rbx, %r12
	jmp	.L62
.L48:
	movq	32(%r15), %rcx
	leaq	48(%r15), %rax
	movq	16(%r15), %rbx
	cmpq	%rax, %rcx
	je	.L63
	movq	48(%r15), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L63:
	movl	$72, %edx
	movq	%r15, %rcx
	call	_ZdlPvy
	testq	%rbx, %rbx
	je	.L47
	movq	%rbx, %r15
	jmp	.L64
.L47:
	movq	32(%r14), %rcx
	leaq	48(%r14), %rax
	movq	16(%r14), %rbx
	cmpq	%rax, %rcx
	je	.L65
	movq	48(%r14), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L65:
	movl	$72, %edx
	movq	%r14, %rcx
	call	_ZdlPvy
	testq	%rbx, %rbx
	je	.L46
	movq	%rbx, %r14
	jmp	.L66
.L46:
	movq	32(%rsp), %rdi
	movq	32(%rdi), %rcx
	leaq	48(%rdi), %rax
	movq	16(%rdi), %rbx
	cmpq	%rax, %rcx
	je	.L67
	movq	48(%rdi), %rax
	leaq	1(%rax), %rdx
	movq	%rax, 40(%rsp)
	call	_ZdlPvy
.L67:
	movq	32(%rsp), %rcx
	movl	$72, %edx
	call	_ZdlPvy
	testq	%rbx, %rbx
	je	.L45
	movq	%rbx, 32(%rsp)
	jmp	.L68
.L45:
	movq	128(%rsp), %rax
	movq	32(%rax), %rcx
	movq	16(%rax), %rbx
	addq	$48, %rax
	cmpq	%rax, %rcx
	je	.L69
	movq	128(%rsp), %rax
	movq	48(%rax), %rax
	leaq	1(%rax), %rdx
	movq	%rax, 32(%rsp)
	call	_ZdlPvy
.L69:
	movq	128(%rsp), %rcx
	movl	$72, %edx
	call	_ZdlPvy
	testq	%rbx, %rbx
	je	.L43
	movq	%rbx, 128(%rsp)
	jmp	.L70
.L43:
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.seh_endproc
	.section	.text$_ZSt26__throw_bad_variant_accessj,"x"
	.linkonce discard
	.globl	_ZSt26__throw_bad_variant_accessj
	.def	_ZSt26__throw_bad_variant_accessj;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZSt26__throw_bad_variant_accessj
_ZSt26__throw_bad_variant_accessj:
.LFB2191:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, %ebx
	movl	$16, %ecx
	call	__cxa_allocate_exception
	andl	$3, %ebx
	leaq	_ZZSt26__throw_bad_variant_accessjE9__reasons(%rip), %rdx
	leaq	_ZNSt18bad_variant_accessD1Ev(%rip), %r8
	movq	(%rdx,%rbx,8), %rdx
	leaq	16+_ZTVSt18bad_variant_access(%rip), %rbx
	movq	%rax, %rcx
	movq	%rbx, (%rax)
	movq	%rdx, 8(%rax)
	leaq	_ZTISt18bad_variant_access(%rip), %rdx
	call	__cxa_throw
	nop
	.seh_endproc
	.section	.text$_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructILb1EEEvPKcy,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructILb1EEEvPKcy
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructILb1EEEvPKcy;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructILb1EEEvPKcy
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructILb1EEEvPKcy:
.LFB2848:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%r8, 64(%rsp)
	movq	%rcx, %rbx
	movq	%rdx, %r9
	cmpq	$15, %r8
	ja	.L109
	movq	(%rcx), %rcx
	leaq	1(%r8), %rax
	testq	%r8, %r8
	je	.L110
.L111:
	movq	%r9, %rdx
	movq	%rax, %r8
	call	memcpy
	movq	64(%rsp), %rdx
	movq	%rdx, 8(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L110:
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	movq	64(%rsp), %rdx
	movq	%rdx, 8(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L109:
	xorl	%r8d, %r8d
	movq	%rdx, 56(%rsp)
	leaq	64(%rsp), %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy
	movq	64(%rsp), %r8
	movq	56(%rsp), %r9
	movq	%rax, (%rbx)
	movq	%rax, %rcx
	testq	%r8, %r8
	movq	%r8, 16(%rbx)
	je	.L110
	movq	%r8, %rax
	movq	$-1, %rdx
	addq	$1, %rax
	jne	.L111
	movq	%rdx, 8(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "apple\0"
.LC3:
	.ascii "SKU-1\0"
	.align 8
.LC5:
	.ascii "pair: %d %s | tuple: %d %.1f %d | array: %d %d\12\0"
	.align 8
.LC7:
	.ascii "struct: %d %s %.1f\357\274\210\345\216\237\345\257\271\350\261\241 amount \345\267\262\350\242\253\346\224\271\357\274\211\12\0"
.LC8:
	.ascii "pear\0"
.LC9:
	.ascii "  %s -> %d\12\0"
.LC10:
	.ascii "two\0"
.LC11:
	.ascii "CTAD pair: %d %.1f\12\0"
.LC12:
	.ascii "\346\227\240\0"
.LC13:
	.ascii "optional \346\234\211\345\200\274\345\220\227\357\274\232%s\12\0"
.LC14:
	.ascii "value_or = %d\12\0"
.LC15:
	.ascii "hello\0"
	.align 8
.LC16:
	.ascii "variant \345\275\223\345\211\215\346\214\201\346\234\211 string\357\274\232%s\12\0"
.LC17:
	.ascii "view \344\270\215\346\213\267\350\264\235\345\255\227\347\254\246\0"
	.align 8
.LC18:
	.ascii "string_view[0..4] = %.*s\357\274\214size=%zu\12\0"
.LC19:
	.ascii "variant \345\210\207\345\210\260 int\357\274\232%d\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB2221:
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
	subq	$456, %rsp
	.seh_stackalloc	456
	movups	%xmm6, 432(%rsp)
	.seh_savexmm	%xmm6, 432
	.seh_endprologue
	pxor	%xmm6, %xmm6
	call	__main
	leaq	312(%rsp), %r13
	leaq	.LC1(%rip), %rdx
	movl	$7, 112(%rsp)
	movq	%r13, %xmm1
	leaq	120(%rsp), %rcx
	punpcklqdq	%xmm1, %xmm6
.LEHB0:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_.isra.0
.LEHE0:
	movl	112(%rsp), %eax
	movq	128(%rsp), %r8
	leaq	168(%rsp), %rcx
	movq	120(%rsp), %rdx
	movl	%eax, 160(%rsp)
	leaq	184(%rsp), %rax
	movq	%rax, 168(%rsp)
.LEHB1:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructILb1EEEvPKcy
.LEHE1:
	movq	.LC2(%rip), %rax
	pxor	%xmm0, %xmm0
	leaq	.LC3(%rip), %rdx
	leaq	264(%rsp), %rcx
	movl	$0, 292(%rsp)
	movl	$42, 256(%rsp)
	movq	%rax, 296(%rsp)
	movups	%xmm0, 260(%rsp)
	movups	%xmm0, 276(%rsp)
.LEHB2:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_.isra.0
.LEHE2:
	movq	.LC4(%rip), %rax
	movl	$20, 56(%rsp)
	movl	$1, %r9d
	leaq	.LC5(%rip), %rcx
	movl	$10, 48(%rsp)
	movq	168(%rsp), %r8
	movq	%rax, 296(%rsp)
	movq	.LC6(%rip), %rax
	movl	$3, 40(%rsp)
	movl	160(%rsp), %edx
	movq	%rax, 32(%rsp)
.LEHB3:
	call	__mingw_printf
	movsd	296(%rsp), %xmm3
	movq	264(%rsp), %r8
	leaq	.LC7(%rip), %rcx
	movl	256(%rsp), %edx
	movq	%xmm3, %r9
	call	__mingw_printf
.LEHE3:
	leaq	352(%rsp), %rbp
	leaq	.LC1(%rip), %rdx
	movq	%rbp, %rcx
.LEHB4:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_.isra.0
.LEHE4:
	leaq	.LC8(%rip), %rdx
	leaq	392(%rsp), %rcx
	movl	$3, 384(%rsp)
.LEHB5:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_.isra.0
.LEHE5:
	movl	$5, 424(%rsp)
	xorl	%eax, %eax
	movq	%rbp, %rbx
	movl	$0, 312(%rsp)
	movq	%r13, 336(%rsp)
	movq	$0, 344(%rsp)
	movups	%xmm6, 320(%rsp)
	.p2align 4
	.p2align 3
.L142:
	movq	(%rbx), %r15
	movq	8(%rbx), %r12
	testq	%rax, %rax
	je	.L124
	movq	336(%rsp), %r14
	movq	40(%r14), %rsi
	cmpq	%rsi, %r12
	movq	%rsi, %r8
	cmovbe	%r12, %r8
	testq	%r8, %r8
	je	.L125
	movq	32(%r14), %rcx
	movq	%r15, %rdx
	call	memcmp
	testl	%eax, %eax
	jne	.L213
	movq	%rsi, %rax
	subq	%r12, %rax
	cmpq	$2147483647, %rax
	jg	.L124
	cmpq	$-2147483648, %rax
	jl	.L127
	testl	%eax, %eax
.L213:
	js	.L127
	.p2align 4
	.p2align 3
.L124:
	movq	%r12, %r9
	movq	%r15, %r8
	leaq	64(%rsp), %rcx
	leaq	304(%rsp), %rdx
	call	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE24_M_get_insert_unique_posERS7_.isra.0
	movq	64(%rsp), %rax
	movq	72(%rsp), %r14
.L129:
	testq	%r14, %r14
	je	.L131
	cmpq	%r13, %r14
	sete	%dil
	testq	%rax, %rax
	setne	%al
	orb	%al, %dil
	je	.L215
	movl	$72, %ecx
.LEHB6:
	call	_Znwy
.LEHE6:
	movq	%rax, %rsi
	leaq	32(%rax), %rcx
	leaq	48(%rax), %rax
	movq	%rax, 32(%rsi)
.L137:
	movq	%r12, %r8
	movq	%r15, %rdx
.LEHB7:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructILb1EEEvPKcy
.LEHE7:
	movl	32(%rbx), %eax
	movzbl	%dil, %ecx
	movq	%r13, %r9
	movq	%r14, %r8
	movq	%rsi, %rdx
	movl	%eax, 64(%rsi)
	call	_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_
	addq	$1, 344(%rsp)
.L131:
	addq	$40, %rbx
	leaq	432(%rsp), %rax
	cmpq	%rax, %rbx
	je	.L141
	movq	344(%rsp), %rax
	jmp	.L142
	.p2align 4,,10
	.p2align 3
.L141:
	subq	$40, %rbx
	movq	(%rbx), %rcx
	leaq	16(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L144
	movq	16(%rbx), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L144:
	cmpq	%rbp, %rbx
	jne	.L141
	movq	328(%rsp), %rbx
	cmpq	%r13, %rbx
	je	.L145
	.p2align 4
	.p2align 3
.L146:
	movq	32(%rbx), %rdx
	movl	64(%rbx), %r8d
	leaq	.LC9(%rip), %rcx
.LEHB8:
	call	__mingw_printf
	movq	%rbx, %rcx
	call	_ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base
	movq	%rax, %rbx
	cmpq	%r13, %rax
	jne	.L146
.L145:
	leaq	.LC10(%rip), %rdx
	movq	%rbp, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_.isra.0
.LEHE8:
	movq	352(%rsp), %rax
	leaq	224(%rsp), %r13
	leaq	368(%rsp), %rbx
	movq	360(%rsp), %rdx
	movq	%r13, 208(%rsp)
	cmpq	%rbx, %rax
	je	.L216
	movq	%rax, 208(%rsp)
	movq	368(%rsp), %rax
	movq	%rax, 224(%rsp)
.L148:
	movsd	.LC21(%rip), %xmm2
	movq	%rdx, 216(%rsp)
	movabsq	$0x4004000000000000, %r8
	movl	$1, %edx
	leaq	.LC11(%rip), %rcx
	movl	$1, 240(%rsp)
.LEHB9:
	call	__mingw_printf
	leaq	.LC12(%rip), %rdx
	leaq	.LC13(%rip), %rcx
	call	__mingw_printf
	movl	$5, %edx
	leaq	.LC14(%rip), %rcx
	call	__mingw_printf
	leaq	80(%rsp), %rcx
	leaq	.LC15(%rip), %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_.isra.0
.LEHE9:
	movq	80(%rsp), %rdx
	leaq	96(%rsp), %rcx
	movq	88(%rsp), %rax
	movq	%rbx, 352(%rsp)
	cmpq	%rcx, %rdx
	je	.L217
	movq	96(%rsp), %rcx
	movq	%rdx, 352(%rsp)
	movq	%rcx, 368(%rsp)
.L150:
	leaq	.LC16(%rip), %rcx
	movq	%rax, 360(%rsp)
	movb	$1, 384(%rsp)
.LEHB10:
	call	__mingw_printf
	cmpb	$0, 384(%rsp)
	jne	.L151
	movl	$42, 352(%rsp)
.L152:
	movl	$42, %edx
	leaq	.LC19(%rip), %rcx
	call	__mingw_printf
	movl	$20, %r9d
	leaq	.LC17(%rip), %r8
	movl	$4, %edx
	leaq	.LC18(%rip), %rcx
	call	__mingw_printf
.LEHE10:
	cmpb	$0, 384(%rsp)
	jne	.L218
.L153:
	movq	208(%rsp), %rcx
	cmpq	%r13, %rcx
	je	.L154
	movq	224(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L154:
	movq	320(%rsp), %rbx
	testq	%rbx, %rbx
	je	.L155
.L157:
	movq	24(%rbx), %rcx
	movq	%rbx, %rsi
	call	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE8_M_eraseEPSt13_Rb_tree_nodeIS8_E.isra.0
	movq	32(%rsi), %rcx
	leaq	48(%rsi), %rax
	movq	16(%rbx), %rbx
	cmpq	%rax, %rcx
	je	.L156
	movq	48(%rsi), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L156:
	movl	$72, %edx
	movq	%rsi, %rcx
	call	_ZdlPvy
	testq	%rbx, %rbx
	jne	.L157
.L155:
	movq	264(%rsp), %rcx
	leaq	280(%rsp), %rax
	cmpq	%rax, %rcx
	je	.L158
	movq	280(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L158:
	movq	168(%rsp), %rcx
	leaq	184(%rsp), %rax
	cmpq	%rax, %rcx
	je	.L159
	movq	184(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L159:
	movq	120(%rsp), %rcx
	leaq	136(%rsp), %rax
	cmpq	%rax, %rcx
	je	.L191
	movq	136(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	nop
.L191:
	movups	432(%rsp), %xmm6
	xorl	%eax, %eax
	addq	$456, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L215:
	movq	40(%r14), %rsi
.L172:
	cmpq	%rsi, %r12
	movq	%rsi, %r8
	cmovbe	%r12, %r8
	testq	%r8, %r8
	je	.L133
	movq	32(%r14), %rdx
	movq	%r15, %rcx
	call	memcmp
	testl	%eax, %eax
	jne	.L134
.L133:
	movq	%r12, %rax
	subq	%rsi, %rax
	cmpq	$2147483647, %rax
	jg	.L135
	cmpq	$-2147483648, %rax
	jl	.L173
.L134:
	testl	%eax, %eax
	js	.L173
.L135:
	movl	$72, %ecx
.LEHB11:
	call	_Znwy
	movq	%rax, %rsi
	leaq	32(%rax), %rcx
	leaq	48(%rax), %rax
	xorl	%edi, %edi
	movq	%rax, 32(%rsi)
	jmp	.L137
.L127:
	cmpq	%r13, %r14
	jne	.L172
.L173:
	movl	$72, %ecx
	call	_Znwy
.LEHE11:
	movq	%rax, %rsi
	leaq	32(%rax), %rcx
	leaq	48(%rax), %rax
	movl	$1, %edi
	movq	%rax, 32(%rsi)
	jmp	.L137
.L125:
	subq	%r12, %rsi
	cmpq	$2147483647, %rsi
	jg	.L124
	cmpq	$-2147483648, %rsi
	jl	.L130
	testl	%esi, %esi
	jns	.L124
.L130:
	xorl	%eax, %eax
	jmp	.L129
.L218:
	movq	352(%rsp), %rcx
	cmpq	%rbx, %rcx
	je	.L153
	movq	368(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	jmp	.L153
.L151:
	movq	%rbp, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movb	$0, 384(%rsp)
	movl	$42, 352(%rsp)
	jmp	.L152
.L216:
	leal	1(%rdx), %ecx
	movq	%r13, %rdi
	movq	%rbx, %rsi
	rep movsb
	jmp	.L148
.L217:
	movq	%rdx, %rsi
	leal	1(%rax), %ecx
	movq	%rbx, %rdi
	movq	%rbx, %rdx
	rep movsb
	jmp	.L150
.L179:
	movq	%rax, %rsi
	cmpb	$0, 384(%rsp)
	je	.L163
	movq	352(%rsp), %rcx
	cmpq	%rbx, %rcx
	jne	.L219
.L163:
	movq	%rsi, %rbx
.L164:
	leaq	208(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L165:
	movq	320(%rsp), %rcx
	call	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE8_M_eraseEPSt13_Rb_tree_nodeIS8_E.isra.0
.L143:
	leaq	264(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L166:
	leaq	168(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L167:
	leaq	120(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rcx
.LEHB12:
	call	_Unwind_Resume
.LEHE12:
.L178:
	movq	%rax, %rbx
	jmp	.L164
.L219:
	movq	368(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	jmp	.L163
.L177:
	movq	%rax, %rbx
	jmp	.L165
.L182:
	movq	%rax, %rcx
	call	__cxa_begin_catch
	movl	$72, %edx
	movq	%rsi, %rcx
	call	_ZdlPvy
.LEHB13:
	call	__cxa_rethrow
.LEHE13:
.L181:
	movq	%rax, %rbx
	jmp	.L140
.L184:
	movq	%rax, %rbx
	movl	$1, %eax
.L123:
	subq	$1, %rax
	andl	$40, %eax
	je	.L143
	leaq	0(%rbp,%rax), %rsi
.L161:
	subq	$40, %rsi
	movq	%rsi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	cmpq	%rbp, %rsi
	je	.L143
	jmp	.L161
.L183:
	movq	%rax, %rbx
	call	__cxa_end_catch
.L140:
	movq	320(%rsp), %rcx
	call	_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_iESt10_Select1stIS8_ESt4lessIS5_ESaIS8_EE8_M_eraseEPSt13_Rb_tree_nodeIS8_E.isra.0
	leaq	392(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbp, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L143
.L176:
	movq	%rax, %rbx
	jmp	.L143
.L180:
	movq	%rax, %rbx
	jmp	.L167
.L185:
	movq	%rax, %rbx
	xorl	%eax, %eax
	jmp	.L123
.L175:
	movq	%rax, %rbx
	jmp	.L166
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
	.align 4
.LLSDA2221:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT2221-.LLSDATTD2221
.LLSDATTD2221:
	.byte	0x1
	.uleb128 .LLSDACSE2221-.LLSDACSB2221
.LLSDACSB2221:
	.uleb128 .LEHB0-.LFB2221
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB2221
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L180-.LFB2221
	.uleb128 0
	.uleb128 .LEHB2-.LFB2221
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L175-.LFB2221
	.uleb128 0
	.uleb128 .LEHB3-.LFB2221
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L176-.LFB2221
	.uleb128 0
	.uleb128 .LEHB4-.LFB2221
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L184-.LFB2221
	.uleb128 0
	.uleb128 .LEHB5-.LFB2221
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L185-.LFB2221
	.uleb128 0
	.uleb128 .LEHB6-.LFB2221
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L181-.LFB2221
	.uleb128 0
	.uleb128 .LEHB7-.LFB2221
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L182-.LFB2221
	.uleb128 0x1
	.uleb128 .LEHB8-.LFB2221
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L177-.LFB2221
	.uleb128 0
	.uleb128 .LEHB9-.LFB2221
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L178-.LFB2221
	.uleb128 0
	.uleb128 .LEHB10-.LFB2221
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L179-.LFB2221
	.uleb128 0
	.uleb128 .LEHB11-.LFB2221
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L181-.LFB2221
	.uleb128 0
	.uleb128 .LEHB12-.LFB2221
	.uleb128 .LEHE12-.LEHB12
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB13-.LFB2221
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L183-.LFB2221
	.uleb128 0
.LLSDACSE2221:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT2221:
	.section	.text.startup,"x"
	.seh_endproc
	.globl	_ZTSSt9exception
	.section	.rdata$_ZTSSt9exception,"dr"
	.linkonce same_size
	.align 8
_ZTSSt9exception:
	.ascii "St9exception\0"
	.globl	_ZTISt9exception
	.section	.rdata$_ZTISt9exception,"dr"
	.linkonce same_size
	.align 8
_ZTISt9exception:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTSSt9exception
	.globl	_ZTSSt18bad_variant_access
	.section	.rdata$_ZTSSt18bad_variant_access,"dr"
	.linkonce same_size
	.align 16
_ZTSSt18bad_variant_access:
	.ascii "St18bad_variant_access\0"
	.globl	_ZTISt18bad_variant_access
	.section	.rdata$_ZTISt18bad_variant_access,"dr"
	.linkonce same_size
	.align 8
_ZTISt18bad_variant_access:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSSt18bad_variant_access
	.quad	_ZTISt9exception
	.globl	_ZTVSt18bad_variant_access
	.section	.rdata$_ZTVSt18bad_variant_access,"dr"
	.linkonce same_size
	.align 8
_ZTVSt18bad_variant_access:
	.quad	0
	.quad	_ZTISt18bad_variant_access
	.quad	_ZNSt18bad_variant_accessD1Ev
	.quad	_ZNSt18bad_variant_accessD0Ev
	.quad	_ZNKSt18bad_variant_access4whatEv
	.globl	_ZZSt26__throw_bad_variant_accessjE9__reasons
	.section .rdata,"dr"
	.align 8
.LC22:
	.ascii "std::get: wrong index for variant\0"
	.align 8
.LC23:
	.ascii "std::get: variant is valueless\0"
	.align 8
.LC24:
	.ascii "std::visit: variant is valueless\0"
	.align 8
.LC25:
	.ascii "std::visit<R>: variant is valueless\0"
	.section	.rdata$_ZZSt26__throw_bad_variant_accessjE9__reasons,"dr"
	.linkonce same_size
	.align 32
_ZZSt26__throw_bad_variant_accessjE9__reasons:
	.quad	.LC22
	.quad	.LC23
	.quad	.LC24
	.quad	.LC25
	.section .rdata,"dr"
	.align 8
.LC2:
	.long	1717986918
	.long	1077143142
	.align 8
.LC4:
	.long	1717986918
	.long	1077798502
	.align 8
.LC6:
	.long	-858993459
	.long	1076088012
	.align 8
.LC21:
	.long	0
	.long	1074003968
	.def	__gxx_personality_seh0;	.scl	2;	.type	32;	.endef
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev5, Built by MSYS2 project) 16.1.0"
	.def	_ZNSt9exceptionD2Ev;	.scl	2;	.type	32;	.endef
	.def	_ZdlPvy;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERyy;	.scl	2;	.type	32;	.endef
	.def	memcpy;	.scl	2;	.type	32;	.endef
	.def	_ZSt19__throw_logic_errorPKc;	.scl	2;	.type	32;	.endef
	.def	memcmp;	.scl	2;	.type	32;	.endef
	.def	_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base;	.scl	2;	.type	32;	.endef
	.def	__cxa_allocate_exception;	.scl	2;	.type	32;	.endef
	.def	__cxa_throw;	.scl	2;	.type	32;	.endef
	.def	_Znwy;	.scl	2;	.type	32;	.endef
	.def	_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_;	.scl	2;	.type	32;	.endef
	.def	_ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
	.def	__cxa_begin_catch;	.scl	2;	.type	32;	.endef
	.def	__cxa_rethrow;	.scl	2;	.type	32;	.endef
	.def	__cxa_end_catch;	.scl	2;	.type	32;	.endef
