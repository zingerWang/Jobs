	.file	"modern23.cpp"
	.text
	.section	.text$_ZNSt8__format5_SinkIcE7_M_bumpEy,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format5_SinkIcE7_M_bumpEy
	.def	_ZNSt8__format5_SinkIcE7_M_bumpEy;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format5_SinkIcE7_M_bumpEy
_ZNSt8__format5_SinkIcE7_M_bumpEy:
.LFB7168:
	.seh_endprologue
	addq	%rdx, 24(%rcx)
	ret
	.seh_endproc
	.section	.text$_ZNKSt8__format5_SinkIcE13_M_discardingEv,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt8__format5_SinkIcE13_M_discardingEv
	.def	_ZNKSt8__format5_SinkIcE13_M_discardingEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format5_SinkIcE13_M_discardingEv
_ZNKSt8__format5_SinkIcE13_M_discardingEv:
.LFB7498:
	.seh_endprologue
	xorl	%eax, %eax
	ret
	.seh_endproc
	.section	.text$_ZNKSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE13_M_discardingEv,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE13_M_discardingEv
	.def	_ZNKSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE13_M_discardingEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE13_M_discardingEv
_ZNKSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE13_M_discardingEv:
.LFB8305:
	.seh_endprologue
	movq	328(%rcx), %rax
	cmpq	%rax, 344(%rcx)
	setnb	%al
	ret
	.seh_endproc
	.section	.text$_ZNSt8__format14_Fixedbuf_sinkIcE11_M_overflowEv,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format14_Fixedbuf_sinkIcE11_M_overflowEv
	.def	_ZNSt8__format14_Fixedbuf_sinkIcE11_M_overflowEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format14_Fixedbuf_sinkIcE11_M_overflowEv
_ZNSt8__format14_Fixedbuf_sinkIcE11_M_overflowEv:
.LFB8311:
	.seh_endprologue
	movq	8(%rcx), %rax
	movq	%rax, 24(%rcx)
	ret
	.seh_endproc
	.section	.text$_ZNSt12format_errorD1Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt12format_errorD1Ev
	.def	_ZNSt12format_errorD1Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt12format_errorD1Ev
_ZNSt12format_errorD1Ev:
.LFB4880:
	.seh_endprologue
	leaq	16+_ZTVSt12format_error(%rip), %rax
	movq	%rax, (%rcx)
	jmp	_ZNSt13runtime_errorD2Ev
	.seh_endproc
	.section	.text$_ZNSt12format_errorD0Ev,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt12format_errorD0Ev
	.def	_ZNSt12format_errorD0Ev;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt12format_errorD0Ev
_ZNSt12format_errorD0Ev:
.LFB4881:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	leaq	16+_ZTVSt12format_error(%rip), %rax
	movq	%rax, (%rcx)
	movq	%rcx, 40(%rsp)
	call	_ZNSt13runtime_errorD2Ev
	movq	40(%rsp), %rcx
	movl	$16, %edx
	addq	$56, %rsp
	jmp	_ZdlPvy
	.seh_endproc
	.text
	.align 2
	.p2align 4
	.def	_ZNSt9__unicode13_Utf_iteratorIcDiPKcS2_NS_5_ReplEE12_M_read_utf8Ev.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZNSt9__unicode13_Utf_iteratorIcDiPKcS2_NS_5_ReplEE12_M_read_utf8Ev.isra.0
_ZNSt9__unicode13_Utf_iteratorIcDiPKcS2_NS_5_ReplEE12_M_read_utf8Ev.isra.0:
.LFB8359:
	.seh_endprologue
	movq	8(%rcx), %r8
	movq	%rcx, %rax
	leaq	1(%r8), %rcx
	movq	%rcx, 8(%rax)
	movsbl	(%r8), %edx
	testb	%dl, %dl
	js	.L9
	movl	$1, %ecx
.L10:
	movl	%edx, 24(%rax)
	movl	$256, %edx
	movb	%cl, 30(%rax)
	movw	%dx, 28(%rax)
	movq	%r8, 8(%rax)
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	cmpb	$-63, %dl
	jbe	.L25
	movq	16(%rax), %r9
	cmpq	%r9, %rcx
	je	.L25
	cmpb	$-33, %dl
	jbe	.L29
	cmpb	$-17, %dl
	ja	.L14
	cmpb	$-32, %dl
	je	.L20
	cmpb	$-19, %dl
	movl	$-65, %r10d
	movl	$-97, %ecx
	movl	$-128, %r11d
	cmove	%ecx, %r10d
.L15:
	movzbl	1(%r8), %ecx
	cmpb	%r11b, %cl
	jb	.L25
	cmpb	%cl, %r10b
	jb	.L25
	leaq	2(%r8), %r10
	movq	%r10, 8(%rax)
	cmpq	%r10, %r9
	je	.L26
	movzbl	2(%r8), %r9d
	leal	-128(%r9), %r10d
	cmpb	$63, %r10b
	ja	.L26
	andl	$15, %edx
	andl	$63, %ecx
	andl	$63, %r9d
	sall	$6, %edx
	orl	%edx, %ecx
	movl	%r9d, %edx
	sall	$6, %ecx
	orl	%ecx, %edx
	movl	$3, %ecx
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L29:
	movzbl	1(%r8), %ecx
	leal	-128(%rcx), %r9d
	cmpb	$63, %r9b
	ja	.L25
	andl	$31, %edx
	andl	$63, %ecx
	sall	$6, %edx
	orl	%ecx, %edx
	movl	$2, %ecx
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L25:
	movl	$1, %ecx
	movl	$65533, %edx
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L14:
	cmpb	$-12, %dl
	ja	.L25
	cmpb	$-16, %dl
	je	.L23
	cmpb	$-12, %dl
	movl	$-65, %r10d
	movl	$-113, %ecx
	movl	$-128, %r11d
	cmove	%ecx, %r10d
.L17:
	movzbl	1(%r8), %ecx
	cmpb	%r11b, %cl
	jb	.L25
	cmpb	%cl, %r10b
	jb	.L25
	leaq	2(%r8), %r10
	movq	%r10, 8(%rax)
	cmpq	%r10, %r9
	je	.L26
	movzbl	2(%r8), %r10d
	leal	-128(%r10), %r11d
	cmpb	$63, %r11b
	ja	.L26
	leaq	3(%r8), %r11
	movq	%r11, 8(%rax)
	cmpq	%r11, %r9
	je	.L28
	movzbl	3(%r8), %r9d
	leal	-128(%r9), %r11d
	cmpb	$63, %r11b
	ja	.L28
	andl	$7, %edx
	andl	$63, %ecx
	andl	$63, %r10d
	andl	$63, %r9d
	sall	$6, %edx
	orl	%edx, %ecx
	movl	%r9d, %edx
	sall	$6, %ecx
	orl	%ecx, %r10d
	movl	$4, %ecx
	sall	$6, %r10d
	orl	%r10d, %edx
	jmp	.L10
.L20:
	movl	$-96, %r11d
	movl	$-65, %r10d
	jmp	.L15
.L26:
	movl	$2, %ecx
	movl	$65533, %edx
	jmp	.L10
.L23:
	movl	$-112, %r11d
	movl	$-65, %r10d
	jmp	.L17
.L28:
	movl	$3, %ecx
	movl	$65533, %edx
	jmp	.L10
	.seh_endproc
	.align 2
	.p2align 4
	.def	_ZNSt12_Vector_baseIiSaIiEED2Ev.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZNSt12_Vector_baseIiSaIiEED2Ev.isra.0
_ZNSt12_Vector_baseIiSaIiEED2Ev.isra.0:
.LFB8360:
	.seh_endprologue
	testq	%rcx, %rcx
	je	.L30
	subq	%rcx, %rdx
	jmp	_ZdlPvy
.L30:
	ret
	.seh_endproc
	.section	.text$_ZSt20__throw_format_errorPKc,"x"
	.linkonce discard
	.globl	_ZSt20__throw_format_errorPKc
	.def	_ZSt20__throw_format_errorPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZSt20__throw_format_errorPKc
_ZSt20__throw_format_errorPKc:
.LFB4877:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rsi
	movl	$16, %ecx
	call	__cxa_allocate_exception
	movq	%rsi, %rdx
	movq	%rax, %rcx
	movq	%rax, %rbx
.LEHB0:
	call	_ZNSt13runtime_errorC2EPKc
.LEHE0:
	leaq	16+_ZTVSt12format_error(%rip), %rax
	leaq	_ZNSt12format_errorD1Ev(%rip), %r8
	movq	%rbx, %rcx
	movq	%rax, (%rbx)
	leaq	_ZTISt12format_error(%rip), %rdx
.LEHB1:
	call	__cxa_throw
.L34:
	movq	%rax, %rsi
	movq	%rbx, %rcx
	call	__cxa_free_exception
	movq	%rsi, %rcx
	call	_Unwind_Resume
	nop
.LEHE1:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA4877:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4877-.LLSDACSB4877
.LLSDACSB4877:
	.uleb128 .LEHB0-.LFB4877
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L34-.LFB4877
	.uleb128 0
	.uleb128 .LEHB1-.LFB4877
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSE4877:
	.section	.text$_ZSt20__throw_format_errorPKc,"x"
	.linkonce discard
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "format error: conflicting indexing style in format string\0"
	.section	.text$_ZNSt8__format39__conflicting_indexing_in_format_stringEv,"x"
	.linkonce discard
	.globl	_ZNSt8__format39__conflicting_indexing_in_format_stringEv
	.def	_ZNSt8__format39__conflicting_indexing_in_format_stringEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format39__conflicting_indexing_in_format_stringEv
_ZNSt8__format39__conflicting_indexing_in_format_stringEv:
.LFB4884:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	leaq	.LC1(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	nop
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "format error: invalid arg-id in format string\0"
	.section	.text$_ZNSt8__format33__invalid_arg_id_in_format_stringEv,"x"
	.linkonce discard
	.globl	_ZNSt8__format33__invalid_arg_id_in_format_stringEv
	.def	_ZNSt8__format33__invalid_arg_id_in_format_stringEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format33__invalid_arg_id_in_format_stringEv
_ZNSt8__format33__invalid_arg_id_in_format_stringEv:
.LFB4885:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	leaq	.LC2(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	nop
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "format error: argument used for width or precision must be a non-negative integer\0"
	.text
	.align 2
	.p2align 4
	.def	_ZNKSt8__format5_SpecIcE16_M_get_precisionISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format5_SpecIcE16_M_get_precisionISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
_ZNKSt8__format5_SpecIcE16_M_get_precisionISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0:
.LFB8361:
	subq	$104, %rsp
	.seh_stackalloc	104
	.seh_endprologue
	movzwl	%cx, %eax
	movzbl	(%rdx), %ecx
	movq	%rcx, %r8
	andl	$15, %r8d
	cmpq	%r8, %rax
	jnb	.L38
	movq	(%rdx), %r8
	leaq	(%rax,%rax,4), %rcx
	salq	$4, %rax
	addq	8(%rdx), %rax
	movdqu	(%rax), %xmm0
	shrq	$4, %r8
	shrq	%cl, %r8
	movups	%xmm0, 32(%rsp)
	movq	%r8, %rcx
	andl	$31, %ecx
.L39:
	leaq	.L43(%rip), %rdx
	movb	%cl, 48(%rsp)
	movzbl	%cl, %ecx
	movdqu	32(%rsp), %xmm0
	movslq	(%rdx,%rcx,4), %rax
	movups	%xmm0, 64(%rsp)
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L43:
	.long	.L40-.L43
	.long	.L48-.L43
	.long	.L48-.L43
	.long	.L47-.L43
	.long	.L46-.L43
	.long	.L45-.L43
	.long	.L44-.L43
	.long	.L48-.L43
	.long	.L48-.L43
	.long	.L48-.L43
	.long	.L48-.L43
	.long	.L48-.L43
	.long	.L48-.L43
	.long	.L48-.L43
	.long	.L48-.L43
	.long	.L48-.L43
	.long	.L48-.L43
	.long	.L48-.L43
	.long	.L48-.L43
	.long	.L48-.L43
	.long	.L48-.L43
	.text
	.p2align 4,,10
	.p2align 3
.L38:
	andl	$15, %ecx
	jne	.L40
	movq	(%rdx), %rcx
	shrq	$4, %rcx
	cmpq	%rcx, %rax
	jnb	.L40
	salq	$5, %rax
	addq	8(%rdx), %rax
	movdqu	(%rax), %xmm0
	movzbl	16(%rax), %ecx
	movups	%xmm0, 32(%rsp)
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L45:
	movq	64(%rsp), %rax
	testq	%rax, %rax
	js	.L48
.L37:
	addq	$104, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L46:
	movl	64(%rsp), %eax
	addq	$104, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L47:
	movl	64(%rsp), %eax
	testl	%eax, %eax
	jns	.L37
.L48:
	leaq	.LC3(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	.p2align 4,,10
	.p2align 3
.L44:
	movq	64(%rsp), %rax
	addq	$104, %rsp
	ret
.L40:
	call	_ZNSt8__format33__invalid_arg_id_in_format_stringEv
	nop
	.seh_endproc
	.align 2
	.p2align 4
	.def	_ZNKSt8__format5_SpecIcE12_M_get_widthISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format5_SpecIcE12_M_get_widthISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
_ZNKSt8__format5_SpecIcE12_M_get_widthISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0:
.LFB8363:
	subq	$104, %rsp
	.seh_stackalloc	104
	.seh_endprologue
	movzwl	%cx, %eax
	movzbl	(%rdx), %ecx
	movq	%rcx, %r8
	andl	$15, %r8d
	cmpq	%r8, %rax
	jnb	.L51
	movq	(%rdx), %r8
	leaq	(%rax,%rax,4), %rcx
	salq	$4, %rax
	addq	8(%rdx), %rax
	movdqu	(%rax), %xmm0
	shrq	$4, %r8
	shrq	%cl, %r8
	movups	%xmm0, 32(%rsp)
	movq	%r8, %rcx
	andl	$31, %ecx
.L52:
	leaq	.L56(%rip), %rdx
	movb	%cl, 48(%rsp)
	movzbl	%cl, %ecx
	movdqu	32(%rsp), %xmm0
	movslq	(%rdx,%rcx,4), %rax
	movups	%xmm0, 64(%rsp)
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L56:
	.long	.L53-.L56
	.long	.L61-.L56
	.long	.L61-.L56
	.long	.L60-.L56
	.long	.L59-.L56
	.long	.L58-.L56
	.long	.L57-.L56
	.long	.L61-.L56
	.long	.L61-.L56
	.long	.L61-.L56
	.long	.L61-.L56
	.long	.L61-.L56
	.long	.L61-.L56
	.long	.L61-.L56
	.long	.L61-.L56
	.long	.L61-.L56
	.long	.L61-.L56
	.long	.L61-.L56
	.long	.L61-.L56
	.long	.L61-.L56
	.long	.L61-.L56
	.text
	.p2align 4,,10
	.p2align 3
.L51:
	andl	$15, %ecx
	jne	.L53
	movq	(%rdx), %rcx
	shrq	$4, %rcx
	cmpq	%rcx, %rax
	jnb	.L53
	salq	$5, %rax
	addq	8(%rdx), %rax
	movdqu	(%rax), %xmm0
	movzbl	16(%rax), %ecx
	movups	%xmm0, 32(%rsp)
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L58:
	movq	64(%rsp), %rax
	testq	%rax, %rax
	js	.L61
.L50:
	addq	$104, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L59:
	movl	64(%rsp), %eax
	addq	$104, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L60:
	movl	64(%rsp), %eax
	testl	%eax, %eax
	jns	.L50
.L61:
	leaq	.LC3(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	.p2align 4,,10
	.p2align 3
.L57:
	movq	64(%rsp), %rax
	addq	$104, %rsp
	ret
.L53:
	call	_ZNSt8__format33__invalid_arg_id_in_format_stringEv
	nop
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "format error: failed to parse format-spec\0"
	.section	.text$_ZNSt8__format29__failed_to_parse_format_specEv,"x"
	.linkonce discard
	.globl	_ZNSt8__format29__failed_to_parse_format_specEv
	.def	_ZNSt8__format29__failed_to_parse_format_specEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format29__failed_to_parse_format_specEv
_ZNSt8__format29__failed_to_parse_format_specEv:
.LFB4886:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	leaq	.LC4(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	nop
	.seh_endproc
	.text
	.p2align 4
	.globl	_Z8safe_divii
	.def	_Z8safe_divii;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z8safe_divii
_Z8safe_divii:
.LFB5656:
	.seh_endprologue
	movl	%ecx, %eax
	movl	%edx, %ecx
	testl	%edx, %edx
	jne	.L65
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L65:
	cltd
	idivl	%ecx
	btsq	$32, %rax
	ret
	.seh_endproc
	.section	.text$_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv:
.LFB6379:
	.seh_endprologue
	movq	(%rcx), %rax
	leaq	16(%rcx), %rdx
	cmpq	%rdx, %rax
	je	.L67
	movq	16(%rcx), %rdx
	movq	%rax, %rcx
	addq	$1, %rdx
	jmp	_ZdlPvy
	.p2align 4,,10
	.p2align 3
.L67:
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "format error: invalid width or precision in format-spec\0"
	.align 8
.LC6:
	.ascii "format error: unmatched '{' in format string\0"
	.section	.text$_ZNSt8__format5_SpecIcE27_S_parse_width_or_precisionEPKcS3_RtRbRSt26basic_format_parse_contextIcE,"x"
	.linkonce discard
	.p2align 4
	.globl	_ZNSt8__format5_SpecIcE27_S_parse_width_or_precisionEPKcS3_RtRbRSt26basic_format_parse_contextIcE
	.def	_ZNSt8__format5_SpecIcE27_S_parse_width_or_precisionEPKcS3_RtRbRSt26basic_format_parse_contextIcE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format5_SpecIcE27_S_parse_width_or_precisionEPKcS3_RtRbRSt26basic_format_parse_contextIcE
_ZNSt8__format5_SpecIcE27_S_parse_width_or_precisionEPKcS3_RtRbRSt26basic_format_parse_contextIcE:
.LFB6719:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rdx, %r11
	movzbl	(%rcx), %edx
	movq	%rcx, %rbx
	leaq	_ZNSt8__detail31__from_chars_alnum_to_val_tableILb0EE5valueE(%rip), %rcx
	movq	%rbx, %r10
	cmpb	$9, (%rcx,%rdx)
	ja	.L70
	xorl	%eax, %eax
	movl	$16, %r9d
	jmp	.L79
	.p2align 4,,10
	.p2align 3
.L104:
	leal	(%rax,%rax,4), %eax
	movzbl	%cl, %ecx
	addq	$1, %r10
	leal	(%rcx,%rax,2), %eax
	cmpq	%r10, %r11
	je	.L80
.L79:
	movzbl	(%r10), %edx
	leal	-48(%rdx), %ecx
	cmpb	$9, %cl
	ja	.L71
	subl	$4, %r9d
	jns	.L104
	movl	$10, %edx
	mulw	%dx
	jo	.L76
	movzbl	%cl, %ecx
	addw	%ax, %cx
	jc	.L76
	addq	$1, %r10
	movl	%ecx, %eax
	cmpq	%r10, %r11
	jne	.L79
	.p2align 4
	.p2align 3
.L80:
	movw	%ax, (%r8)
.L69:
	movq	%r10, %rax
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L70:
	cmpb	$123, %dl
	jne	.L69
	leaq	1(%rbx), %r10
	movb	$1, (%r9)
	cmpq	%r11, %r10
	je	.L105
	movsbw	1(%rbx), %ax
	cmpb	$125, %al
	je	.L106
	cmpb	$48, %al
	je	.L107
	leal	-49(%rax), %edx
	cmpb	$8, %dl
	ja	.L88
	leaq	2(%rbx), %rcx
	cmpq	%rcx, %r11
	je	.L88
	movzbl	2(%rbx), %edx
	subl	$48, %edx
	cmpb	$9, %dl
	jbe	.L101
	subl	$48, %eax
	movq	%rcx, %r10
	.p2align 4
	.p2align 3
.L90:
	cmpb	$125, (%r10)
	jne	.L88
	movq	80(%rsp), %rbx
	cmpl	$2, 16(%rbx)
	je	.L99
	movl	$1, 16(%rbx)
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L71:
	cmpq	%r10, %rbx
	jne	.L80
.L76:
	leaq	.LC5(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	.p2align 4,,10
	.p2align 3
.L106:
	movq	80(%rsp), %rax
	cmpl	$1, 16(%rax)
	je	.L99
	movq	80(%rsp), %rax
	movq	80(%rsp), %rbx
	movl	$2, 16(%rax)
	movq	24(%rax), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, 24(%rbx)
.L85:
	addq	$1, %r10
	movw	%ax, (%r8)
	movq	%r10, %rax
	addq	$32, %rsp
	popq	%rbx
	ret
.L107:
	leaq	2(%rbx), %r10
	xorl	%eax, %eax
.L87:
	cmpq	%r10, %r11
	jne	.L90
.L88:
	call	_ZNSt8__format33__invalid_arg_id_in_format_stringEv
	.p2align 4,,10
	.p2align 3
.L101:
	movq	%r10, %r9
	xorl	%eax, %eax
	movl	$16, %ebx
	jmp	.L89
	.p2align 4,,10
	.p2align 3
.L109:
	leal	(%rax,%rax,4), %eax
	movzbl	%cl, %ecx
	leal	(%rcx,%rax,2), %eax
.L93:
	addq	$1, %r9
	cmpq	%r9, %r11
	je	.L108
.L89:
	movzbl	(%r9), %edx
	leal	-48(%rdx), %ecx
	cmpb	$9, %cl
	ja	.L91
	subl	$4, %ebx
	jns	.L109
	movl	$10, %edx
	mulw	%dx
	jo	.L88
	movzbl	%cl, %ecx
	addw	%ax, %cx
	jc	.L88
	movl	%ecx, %eax
	jmp	.L93
.L91:
	cmpq	%r9, %r10
	je	.L88
	movq	%r9, %r10
	jmp	.L87
.L108:
	movq	%r11, %r10
	jmp	.L87
.L105:
	leaq	.LC6(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
.L99:
	call	_ZNSt8__format39__conflicting_indexing_in_format_stringEv
	nop
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "format error: width must be non-zero in format string\0"
	.section	.text$_ZNSt8__format15__formatter_intIcE11_M_do_parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format15__formatter_intIcE11_M_do_parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE
	.def	_ZNSt8__format15__formatter_intIcE11_M_do_parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format15__formatter_intIcE11_M_do_parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE
_ZNSt8__format15__formatter_intIcE11_M_do_parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE:
.LFB5931:
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
	subq	$176, %rsp
	.seh_stackalloc	176
	.seh_endprologue
	pxor	%xmm0, %xmm0
	movq	8(%rdx), %rsi
	movups	%xmm0, 80(%rsp)
	movl	%r8d, %edi
	movq	%rcx, %r11
	movl	%r8d, %ebx
	movups	%xmm0, 96(%rsp)
	movdqu	(%rdx), %xmm0
	andl	$15, %edi
	movq	%xmm0, %r10
	cmpq	%r10, %rsi
	je	.L111
	movzbl	(%r10), %eax
	cmpb	$125, %al
	je	.L111
	cmpb	$123, %al
	je	.L127
	movq	%rcx, 224(%rsp)
	leaq	112(%rsp), %rcx
	movb	%al, 56(%rsp)
	xorl	%eax, %eax
	movq	%xmm0, 64(%rsp)
	punpcklqdq	%xmm0, %xmm0
	movq	%rdx, 232(%rsp)
	movw	%ax, 140(%rsp)
	movups	%xmm0, 112(%rsp)
	movq	%rsi, 128(%rsp)
	movb	$0, 142(%rsp)
	call	_ZNSt9__unicode13_Utf_iteratorIcDiPKcS2_NS_5_ReplEE12_M_read_utf8Ev.isra.0
	movdqu	112(%rsp), %xmm0
	movq	120(%rsp), %r8
	movzbl	140(%rsp), %ecx
	movq	64(%rsp), %r10
	movups	%xmm0, 144(%rsp)
	movq	224(%rsp), %r11
	movdqu	128(%rsp), %xmm0
	leal	1(%rcx), %eax
	movl	%ecx, %r9d
	movzbl	141(%rsp), %ecx
	movzbl	142(%rsp), %r14d
	movq	232(%rsp), %rdx
	movups	%xmm0, 160(%rsp)
	cmpl	%ecx, %eax
	movzbl	56(%rsp), %eax
	jge	.L193
.L116:
	movzbl	%r9b, %ecx
	movl	168(%rsp,%rcx,4), %r9d
	cmpl	$55295, %r9d
	ja	.L194
.L119:
	cmpq	%r8, %rsi
	je	.L121
	movzbl	(%r8), %ecx
	cmpb	$62, %cl
	je	.L162
	cmpb	$94, %cl
	je	.L163
	movl	$1, %r14d
	cmpb	$60, %cl
	jne	.L121
.L122:
	leaq	1(%r8), %r10
	jmp	.L123
	.p2align 4,,10
	.p2align 3
.L111:
	movzbl	104(%rsp), %eax
	movl	$32, 84(%rsp)
	andl	$-16, %eax
	orl	%edi, %eax
	movb	%al, 104(%rsp)
.L113:
	movdqu	80(%rsp), %xmm0
	movq	%r10, %rax
	movups	%xmm0, (%r11)
	movdqu	96(%rsp), %xmm0
	movups	%xmm0, 16(%r11)
	addq	$176, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L121:
	cmpb	$62, %al
	je	.L124
	cmpb	$94, %al
	je	.L125
	cmpb	$60, %al
	je	.L126
	.p2align 4
	.p2align 3
.L127:
	movl	$32, %r9d
	xorl	%r14d, %r14d
.L115:
	movzbl	(%r10), %eax
	cmpb	$125, %al
	je	.L128
.L129:
	leal	-32(%rax), %ecx
	cmpb	$13, %cl
	jbe	.L195
	xorl	%r8d, %r8d
	xorl	%ecx, %ecx
.L130:
	cmpb	$48, %al
	je	.L135
.L161:
	movb	$0, 144(%rsp)
	xorl	%r15d, %r15d
.L136:
	movzbl	%cl, %eax
	movl	%r9d, 84(%rsp)
	movzbl	%r14b, %r9d
	salq	$32, %r8
	salq	$2, %rax
	movzbl	%r15b, %ecx
	movq	%rdx, 32(%rsp)
	movq	%rsi, %rdx
	orq	%r9, %rax
	salq	$34, %rcx
	movq	%r10, 56(%rsp)
	leaq	144(%rsp), %r9
	orq	%r8, %rax
	leaq	80(%rsp), %r8
	movq	%r11, 224(%rsp)
	orq	%rcx, %rax
	movabsq	$-30064771088, %rcx
	andq	88(%rsp), %rcx
	orq	%rcx, %rax
	movq	%r10, %rcx
	movq	%rax, 88(%rsp)
	movabsq	$-4294967300, %rax
	andq	%rax, 96(%rsp)
	movzbl	104(%rsp), %eax
	andl	$-16, %eax
	orl	%edi, %eax
	movb	%al, 104(%rsp)
	call	_ZNSt8__format5_SpecIcE27_S_parse_width_or_precisionEPKcS3_RtRbRSt26basic_format_parse_contextIcE
	xorl	%edx, %edx
	cmpq	%rax, 56(%rsp)
	movq	224(%rsp), %r11
	je	.L139
	movzbl	144(%rsp), %edx
	addl	$1, %edx
	andl	$3, %edx
.L139:
	cmpq	%rax, %rsi
	je	.L140
	movzbl	(%rax), %ecx
	cmpb	$125, %cl
	je	.L140
	xorl	%r8d, %r8d
	cmpb	$76, %cl
	je	.L196
.L142:
	subl	$63, %ecx
	cmpb	$57, %cl
	ja	.L172
	leaq	.L159(%rip), %r9
	movzbl	%cl, %ecx
	movslq	(%r9,%rcx,4), %rcx
	addq	%r9, %rcx
	jmp	*%rcx
	.section .rdata,"dr"
	.align 4
.L159:
	.long	.L154-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L146-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L152-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L144-.L159
	.long	.L147-.L159
	.long	.L149-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L150-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L153-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L172-.L159
	.long	.L151-.L159
	.section	.text$_ZNSt8__format15__formatter_intIcE11_M_do_parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L195:
	movzbl	%cl, %ecx
	leaq	CSWTCH.794(%rip), %r8
	movzbl	(%r8,%rcx), %r8d
	testb	%r8b, %r8b
	jne	.L197
	cmpb	$35, %al
	je	.L173
	xorl	%ecx, %ecx
	xorl	%r8d, %r8d
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L193:
	cmpq	%r8, %rsi
	je	.L118
	movzbl	%r14b, %ecx
	addq	%r8, %rcx
	cmpq	%rcx, %rsi
	je	.L118
	movq	%rcx, 120(%rsp)
	leaq	112(%rsp), %rcx
	movq	%r10, 72(%rsp)
	movb	%r9b, 64(%rsp)
	call	_ZNSt9__unicode13_Utf_iteratorIcDiPKcS2_NS_5_ReplEE12_M_read_utf8Ev.isra.0
	movq	120(%rsp), %r8
	movq	72(%rsp), %r10
	movq	232(%rsp), %rdx
	movq	224(%rsp), %r11
	movzbl	64(%rsp), %r9d
	movzbl	56(%rsp), %eax
	jmp	.L116
	.p2align 4,,10
	.p2align 3
.L126:
	movl	$1, %r14d
.L158:
	addq	$1, %r10
	movl	$32, %r9d
.L123:
	cmpq	%r10, %rsi
	jne	.L115
.L128:
	movabsq	$-30064771088, %rax
	movl	%r9d, 84(%rsp)
	movq	%r14, %r9
	andq	88(%rsp), %rax
	andl	$3, %r9d
	orq	%rax, %r9
	movq	%r9, 88(%rsp)
.L191:
	movabsq	$-4294967300, %rax
	andq	%rax, 96(%rsp)
	movzbl	104(%rsp), %eax
	andl	$-16, %eax
	orl	%edi, %eax
	movb	%al, 104(%rsp)
	jmp	.L113
	.p2align 4,,10
	.p2align 3
.L197:
	movl	%r8d, %ecx
	leaq	1(%r10), %rax
	andl	$3, %ecx
	movq	%rax, %r15
	cmpq	%rax, %rsi
	jne	.L198
.L132:
	movzbl	%r8b, %eax
	movl	%r9d, 84(%rsp)
	movzbl	%r14b, %r9d
	salq	$2, %rax
	orq	%r9, %rax
	andl	$15, %eax
.L192:
	movabsq	$-30064771088, %rdx
	andq	88(%rsp), %rdx
	movq	%r15, %r10
	orq	%rdx, %rax
	movq	%rax, 88(%rsp)
	movabsq	$-4294967300, %rax
	andq	%rax, 96(%rsp)
	movzbl	104(%rsp), %eax
	andl	$-16, %eax
	orl	%edi, %eax
	movb	%al, 104(%rsp)
	jmp	.L113
	.p2align 4,,10
	.p2align 3
.L118:
	movzbl	%r9b, %ecx
	movl	168(%rsp,%rcx,4), %ecx
	cmpl	$55295, %ecx
	jbe	.L121
	subl	$57344, %ecx
	cmpl	$1056767, %ecx
	jbe	.L121
.L120:
	cmpb	$62, %al
	je	.L124
	cmpb	$94, %al
	je	.L125
	cmpb	$60, %al
	je	.L126
	movl	$32, %r9d
	xorl	%r14d, %r14d
	jmp	.L129
	.p2align 4,,10
	.p2align 3
.L163:
	movl	$3, %r14d
	jmp	.L122
.L173:
	movq	%r10, %r15
	xorl	%ecx, %ecx
.L160:
	leaq	1(%r15), %r10
	cmpq	%r10, %rsi
	jne	.L199
.L134:
	movl	%r9d, 84(%rsp)
	movzbl	%cl, %eax
	movzbl	%r14b, %r9d
	movabsq	$-30064771088, %rdx
	salq	$2, %rax
	btsq	$32, %r9
	andq	88(%rsp), %rdx
	orq	%r9, %rax
	orq	%rdx, %rax
	movq	%rax, 88(%rsp)
	jmp	.L191
.L140:
	movzbl	96(%rsp), %ecx
	andl	$3, %edx
	movq	%rax, %r10
	andl	$-4, %ecx
	orl	%ecx, %edx
	movb	%dl, 96(%rsp)
	jmp	.L113
.L172:
	xorl	%ecx, %ecx
.L156:
	cmpb	$125, (%rax)
	je	.L200
.L148:
	call	_ZNSt8__format29__failed_to_parse_format_specEv
	.p2align 4,,10
	.p2align 3
.L150:
	leaq	1(%rax), %r10
	movl	$6, %edi
	xorl	%ecx, %ecx
.L145:
	cmpq	%r10, %rsi
	jne	.L201
.L155:
	movzbl	%dl, %eax
	movzbl	%r8b, %edx
	addq	%rdx, %rdx
	salq	$32, %rax
	orq	%rdx, %rax
	movabsq	$12884901890, %rdx
	andq	%rdx, %rax
	movabsq	$-12884901891, %rdx
	andq	92(%rsp), %rdx
	orq	%rdx, %rax
	movabsq	$-64424509442, %rdx
	andq	100(%rsp), %rdx
	movq	%rax, 92(%rsp)
	movzbl	%dil, %eax
	salq	$32, %rax
	orq	%rcx, %rax
	orq	%rdx, %rax
	movq	%rax, 100(%rsp)
	jmp	.L113
.L151:
	leaq	1(%rax), %r10
	movl	$3, %edi
	xorl	%ecx, %ecx
	jmp	.L145
.L149:
	leaq	1(%rax), %r10
	movl	$5, %edi
	xorl	%ecx, %ecx
	jmp	.L145
.L144:
	leaq	1(%rax), %r10
	movl	$7, %edi
	xorl	%ecx, %ecx
	jmp	.L145
.L152:
	leaq	1(%rax), %r10
	movl	$4, %edi
	xorl	%ecx, %ecx
	jmp	.L145
.L146:
	leaq	1(%rax), %r10
	movl	$8, %edi
	xorl	%ecx, %ecx
	jmp	.L145
.L154:
	cmpb	$2, %bl
	jne	.L148
	leaq	1(%rax), %r10
	movl	$2, %edi
	movl	$1, %ecx
	jmp	.L145
.L147:
	subb	$1, %bl
	je	.L148
	leaq	1(%rax), %r10
	movl	$2, %edi
	xorl	%ecx, %ecx
	jmp	.L145
.L153:
	subb	$1, %bl
	jne	.L148
	leaq	1(%rax), %r10
	movl	$1, %edi
	xorl	%ecx, %ecx
	jmp	.L145
	.p2align 4,,10
	.p2align 3
.L135:
	leaq	1(%r10), %rax
	movq	%rax, %r15
	cmpq	%rax, %rsi
	jne	.L202
.L137:
	movl	%r9d, 84(%rsp)
	movzbl	%cl, %eax
	movzbl	%r14b, %r9d
	salq	$32, %r8
	salq	$2, %rax
	btsq	$34, %r9
	orq	%r9, %rax
	orq	%r8, %rax
	jmp	.L192
	.p2align 4,,10
	.p2align 3
.L125:
	movl	$3, %r14d
	jmp	.L158
	.p2align 4,,10
	.p2align 3
.L124:
	movl	$2, %r14d
	jmp	.L158
.L199:
	movzbl	1(%r15), %eax
	movl	$1, %r8d
	cmpb	$125, %al
	jne	.L130
	jmp	.L134
.L162:
	movl	$2, %r14d
	jmp	.L122
.L202:
	movzbl	1(%r10), %eax
	cmpb	$125, %al
	je	.L137
	movb	$0, 144(%rsp)
	cmpb	$48, %al
	je	.L203
	movq	%r15, %r10
	movl	$1, %r15d
	jmp	.L136
.L196:
	leaq	1(%rax), %r10
	cmpq	%r10, %rsi
	jne	.L204
.L143:
	movzbl	96(%rsp), %eax
	andl	$3, %edx
	orb	$2, 92(%rsp)
	andl	$-4, %eax
	orl	%edx, %eax
	movb	%al, 96(%rsp)
	jmp	.L113
.L204:
	movzbl	1(%rax), %ecx
	cmpb	$125, %cl
	je	.L143
	movq	%r10, %rax
	movl	$1, %r8d
	jmp	.L142
	.p2align 4,,10
	.p2align 3
.L194:
	leal	-57344(%r9), %ecx
	cmpl	$1056767, %ecx
	ja	.L120
	jmp	.L119
.L200:
	movq	%rax, %r10
	jmp	.L155
.L198:
	movzbl	1(%r10), %eax
	cmpb	$125, %al
	je	.L132
	cmpb	$35, %al
	je	.L160
	movq	%r15, %r10
	xorl	%r8d, %r8d
	jmp	.L130
.L201:
	movq	%r10, %rax
	jmp	.L156
.L203:
	leaq	.LC7(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	nop
	.seh_endproc
	.section .rdata,"dr"
.LC8:
	.ascii "basic_string::_M_create\0"
	.section	.text$_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy:
.LFB7124:
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
	movq	144(%rsp), %rdi
	movq	8(%rcx), %r13
	movq	(%rcx), %r15
	subq	%r8, %rdi
	leaq	16(%rcx), %r12
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	addq	%r13, %rdi
	cmpq	%r15, %r12
	je	.L235
	movabsq	$9223372036854775806, %rdx
	movq	16(%rcx), %rax
	cmpq	%rdi, %rdx
	jb	.L207
	leaq	1(%rdi), %rcx
	cmpq	%rdi, %rax
	jnb	.L208
	addq	%rax, %rax
	cmpq	%rax, %rdi
	jnb	.L208
	leaq	1(%rax), %rcx
	movq	%rax, %rdi
	cmpq	%rax, %rdx
	jnb	.L208
	movabsq	$9223372036854775807, %rcx
	movq	%rdx, %rdi
	.p2align 4
	.p2align 3
.L208:
	leaq	(%rsi,%r8), %rbp
	movq	%r9, 136(%rsp)
	call	_Znwy
	subq	%rbp, %r13
	testq	%rsi, %rsi
	movq	136(%rsp), %r9
	movq	%rax, %r14
	je	.L213
	cmpq	$1, %rsi
	je	.L236
	movq	%rsi, %r8
	movq	%r15, %rdx
	movq	%rax, %rcx
	movq	%r9, 136(%rsp)
	call	memcpy
	movq	136(%rsp), %r9
	.p2align 4
	.p2align 3
.L213:
	testq	%r9, %r9
	je	.L215
	cmpq	$0, 144(%rsp)
	je	.L215
	leaq	(%r14,%rsi), %rcx
	cmpq	$1, 144(%rsp)
	je	.L237
	movq	144(%rsp), %r8
	movq	%r9, %rdx
	call	memcpy
.L215:
	testq	%r13, %r13
	jne	.L238
.L217:
	cmpq	%r15, %r12
	je	.L219
	movq	16(%rbx), %rax
	movq	%r15, %rcx
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L219:
	movq	%r14, (%rbx)
	movq	%rdi, 16(%rbx)
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
	.p2align 4,,10
	.p2align 3
.L238:
	addq	144(%rsp), %rsi
	leaq	(%r15,%rbp), %rdx
	leaq	(%r14,%rsi), %rcx
	cmpq	$1, %r13
	je	.L239
	movq	%r13, %r8
	call	memcpy
	jmp	.L217
	.p2align 4,,10
	.p2align 3
.L235:
	movabsq	$9223372036854775806, %rax
	cmpq	%rdi, %rax
	jb	.L207
	leaq	-16(%rdi), %rax
	leaq	1(%rdi), %rcx
	cmpq	$13, %rax
	ja	.L208
	movl	$30, %edi
	movl	$31, %ecx
	jmp	.L208
	.p2align 4,,10
	.p2align 3
.L236:
	movzbl	(%r15), %eax
	movb	%al, (%r14)
	jmp	.L213
	.p2align 4,,10
	.p2align 3
.L237:
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	testq	%r13, %r13
	je	.L217
	jmp	.L238
	.p2align 4,,10
	.p2align 3
.L239:
	movzbl	(%rdx), %eax
	movb	%al, (%rcx)
	jmp	.L217
.L207:
	leaq	.LC8(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
	nop
	.seh_endproc
	.section .rdata,"dr"
.LC9:
	.ascii "basic_string::append\0"
	.section	.text$_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE11_M_overflowEv,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE11_M_overflowEv
	.def	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE11_M_overflowEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE11_M_overflowEv
_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE11_M_overflowEv:
.LFB6597:
	subq	$72, %rsp
	.seh_stackalloc	72
	.seh_endprologue
	movq	8(%rcx), %r9
	movq	24(%rcx), %r8
	movq	%rcx, %r10
	subq	%r9, %r8
	je	.L240
	movq	296(%rcx), %rdx
	movabsq	$9223372036854775806, %rax
	subq	%rdx, %rax
	cmpq	%r8, %rax
	jb	.L251
	movq	288(%rcx), %rcx
	leaq	304(%r10), %rax
	cmpq	%rax, %rcx
	je	.L247
	movq	304(%r10), %rax
.L243:
	leaq	(%r8,%rdx), %r11
	cmpq	%r11, %rax
	jb	.L244
	addq	%rdx, %rcx
	cmpq	$1, %r8
	je	.L252
	movq	%r9, %rdx
	movq	%r10, 80(%rsp)
	movq	%r11, 56(%rsp)
	call	memcpy
	movq	56(%rsp), %r11
	movq	80(%rsp), %r10
	jmp	.L246
	.p2align 4,,10
	.p2align 3
.L244:
	movq	%r8, 32(%rsp)
	leaq	288(%r10), %rcx
	xorl	%r8d, %r8d
	movq	%r11, 56(%rsp)
	movq	%r10, 80(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	movq	56(%rsp), %r11
	movq	80(%rsp), %r10
.L246:
	movq	288(%r10), %rax
	movb	$0, (%rax,%r11)
	movq	8(%r10), %rax
	movq	%r11, 296(%r10)
	movq	%rax, 24(%r10)
.L240:
	addq	$72, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L252:
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	jmp	.L246
	.p2align 4,,10
	.p2align 3
.L247:
	movl	$15, %eax
	jmp	.L243
.L251:
	leaq	.LC9(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
	nop
	.seh_endproc
	.section .rdata,"dr"
.LC10:
	.ascii "basic_string::_M_replace_aux\0"
	.section	.text$_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE7_M_bumpEy,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE7_M_bumpEy
	.def	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE7_M_bumpEy;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE7_M_bumpEy
_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE7_M_bumpEy:
.LFB7497:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	24(%rcx), %r11
	movq	296(%rcx), %rax
	subq	8(%rcx), %r11
	addq	%rdx, %r11
	movq	%rcx, %r10
	cmpq	%r11, %rax
	jb	.L263
	cmpq	%rax, %r11
	jnb	.L260
.L262:
	movq	288(%r10), %rax
	movb	$0, (%rax,%r11)
	movq	%r11, 296(%r10)
.L260:
	leaq	32(%r10), %rax
	movq	$256, 16(%r10)
	movq	%rax, 8(%r10)
	movq	%rax, 24(%r10)
	addq	$64, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L263:
	movabsq	$9223372036854775806, %rdx
	movq	%r11, %rcx
	subq	%rax, %rcx
	subq	%rax, %rdx
	movq	%rcx, %rbx
	cmpq	%rcx, %rdx
	jb	.L264
	movq	288(%r10), %rcx
	leaq	304(%r10), %rdx
	cmpq	%rdx, %rcx
	je	.L261
	movq	304(%r10), %rdx
.L256:
	cmpq	%r11, %rdx
	jb	.L265
.L257:
	addq	%rax, %rcx
	cmpq	$1, %rbx
	je	.L266
	movq	%rbx, %r8
	xorl	%edx, %edx
	movq	%r10, 80(%rsp)
	movq	%r11, 48(%rsp)
	call	memset
	movq	80(%rsp), %r10
	movq	48(%rsp), %r11
	jmp	.L262
	.p2align 4,,10
	.p2align 3
.L266:
	movb	$0, (%rcx)
	jmp	.L262
	.p2align 4,,10
	.p2align 3
.L265:
	movq	%rbx, 32(%rsp)
	movq	%rax, %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	leaq	288(%r10), %rcx
	movq	%r11, 56(%rsp)
	movq	%r10, 80(%rsp)
	movq	%rax, 48(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	movq	80(%rsp), %r10
	movq	56(%rsp), %r11
	movq	48(%rsp), %rax
	movq	288(%r10), %rcx
	jmp	.L257
	.p2align 4,,10
	.p2align 3
.L261:
	movl	$15, %edx
	jmp	.L256
.L264:
	leaq	.LC10(%rip), %rcx
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
.LFB7481:
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
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	8(%rcx), %r9
	movq	24(%rcx), %r8
	movq	296(%rcx), %rbp
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	leaq	304(%rcx), %r12
	cmpq	%r9, %r8
	jne	.L312
.L292:
	movq	288(%rbx), %r13
	addq	%rbp, %rsi
	cmpq	%r13, %r12
	je	.L313
	movq	304(%rbx), %rdx
	cmpq	%rsi, %rdx
	jb	.L314
.L276:
	movb	$0, 0(%r13,%rsi)
	movq	288(%rbx), %rdi
	movq	%rsi, 296(%rbx)
.L289:
	movq	%rdi, 8(%rbx)
	movq	%rbx, %rax
	addq	%rbp, %rdi
	movq	%rsi, 16(%rbx)
	movq	%rdi, 24(%rbx)
	addq	$64, %rsp
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
.L314:
	movabsq	$9223372036854775806, %r9
	cmpq	%rsi, %r9
	jb	.L277
	leaq	(%rdx,%rdx), %r14
	cmpq	%r14, %rsi
	jnb	.L279
	cmpq	%r14, %r9
	jnb	.L315
	movabsq	$9223372036854775807, %rcx
	movq	%rdx, 56(%rsp)
	call	_Znwy
	testq	%rbp, %rbp
	movq	56(%rsp), %rdx
	movq	%rax, %rdi
	je	.L290
	leaq	1(%rbp), %r8
	movq	%r13, %rdx
	movq	%rax, %rcx
	movabsq	$9223372036854775806, %r14
	call	memcpy
	.p2align 4
	.p2align 3
.L287:
	movq	304(%rbx), %rdx
.L288:
	addq	$1, %rdx
	movq	%r13, %rcx
	call	_ZdlPvy
.L286:
	movq	%rdi, 288(%rbx)
	movq	%r14, 304(%rbx)
	movb	$0, (%rdi,%rsi)
	movq	%rsi, 296(%rbx)
	jmp	.L289
	.p2align 4,,10
	.p2align 3
.L313:
	cmpq	$15, %rsi
	jbe	.L276
	movabsq	$9223372036854775806, %rax
	cmpq	%rsi, %rax
	jb	.L277
	cmpq	$29, %rsi
	jbe	.L278
.L279:
	leaq	1(%rsi), %rcx
	movq	%rsi, %r14
	call	_Znwy
	leaq	1(%rbp), %r8
	movq	%rax, %rdi
	testq	%rbp, %rbp
	je	.L282
.L283:
	movq	%r13, %rdx
	movq	%rdi, %rcx
	call	memcpy
	cmpq	%r13, %r12
	jne	.L287
	jmp	.L286
	.p2align 4,,10
	.p2align 3
.L318:
	movl	$30, %r14d
	.p2align 4
	.p2align 3
.L282:
	movzbl	0(%r13), %eax
	movb	%al, (%rdi)
	cmpq	%r13, %r12
	jne	.L287
	jmp	.L286
	.p2align 4,,10
	.p2align 3
.L312:
	movabsq	$9223372036854775806, %rax
	subq	%r9, %r8
	subq	%rbp, %rax
	cmpq	%r8, %rax
	jb	.L316
	movq	288(%rcx), %rcx
	cmpq	%r12, %rcx
	je	.L303
	movq	304(%rbx), %rax
.L270:
	leaq	0(%rbp,%r8), %rdi
	cmpq	%rdi, %rax
	jb	.L271
	addq	%rbp, %rcx
	cmpq	$1, %r8
	je	.L317
	movq	%r9, %rdx
	call	memcpy
	jmp	.L273
	.p2align 4,,10
	.p2align 3
.L271:
	movq	%r8, 32(%rsp)
	leaq	288(%rbx), %rcx
	xorl	%r8d, %r8d
	movq	%rbp, %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
.L273:
	movq	288(%rbx), %rax
	movq	%rdi, %rbp
	movb	$0, (%rax,%rdi)
	movq	8(%rbx), %rax
	movq	%rdi, 296(%rbx)
	movq	%rax, 24(%rbx)
	jmp	.L292
	.p2align 4,,10
	.p2align 3
.L278:
	movl	$31, %ecx
	call	_Znwy
	movq	%rax, %rdi
	leaq	1(%rbp), %rax
	testq	%rbp, %rbp
	je	.L318
	cmpl	$64, %eax
	jnb	.L293
	testb	$32, %al
	jne	.L319
	testb	$16, %al
	jne	.L320
	testb	$8, %al
	jne	.L321
	testb	$4, %al
	jne	.L322
	testl	%eax, %eax
	je	.L294
	movzbl	(%r12), %edx
	movb	%dl, (%rdi)
	testb	$2, %al
	jne	.L323
.L294:
	movl	$30, %r14d
	jmp	.L286
	.p2align 4,,10
	.p2align 3
.L290:
	movabsq	$9223372036854775806, %r14
	movzbl	0(%r13), %eax
	movb	%al, (%rdi)
	jmp	.L288
	.p2align 4,,10
	.p2align 3
.L317:
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	jmp	.L273
	.p2align 4,,10
	.p2align 3
.L315:
	leaq	1(%r14), %rcx
	call	_Znwy
	leaq	1(%rbp), %r8
	movq	%rax, %rdi
	testq	%rbp, %rbp
	jne	.L283
	movzbl	0(%r13), %eax
	movb	%al, (%rdi)
	jmp	.L287
	.p2align 4,,10
	.p2align 3
.L303:
	movl	$15, %eax
	jmp	.L270
	.p2align 4,,10
	.p2align 3
.L293:
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
	jb	.L294
	andl	$-64, %eax
	xorl	%ecx, %ecx
.L300:
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
	jb	.L300
	jmp	.L294
.L319:
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
	jmp	.L294
.L320:
	movdqu	(%r12), %xmm0
	movl	%eax, %eax
	movups	%xmm0, (%rdi)
	movdqu	-16(%r12,%rax), %xmm0
	movups	%xmm0, -16(%rdi,%rax)
	jmp	.L294
.L321:
	movq	(%r12), %rdx
	movl	%eax, %eax
	movq	%rdx, (%rdi)
	movq	-8(%r12,%rax), %rdx
	movq	%rdx, -8(%rdi,%rax)
	jmp	.L294
.L322:
	movl	(%r12), %edx
	movl	%eax, %eax
	movl	%edx, (%rdi)
	movl	-4(%r12,%rax), %edx
	movl	%edx, -4(%rdi,%rax)
	jmp	.L294
.L323:
	movl	%eax, %eax
	movzwl	-2(%r12,%rax), %edx
	movw	%dx, -2(%rdi,%rax)
	jmp	.L294
.L277:
	leaq	.LC8(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L316:
	leaq	.LC9(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZNSt8__format5_SinkIcE10_M_reserveEy,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format5_SinkIcE10_M_reserveEy
	.def	_ZNSt8__format5_SinkIcE10_M_reserveEy;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format5_SinkIcE10_M_reserveEy
_ZNSt8__format5_SinkIcE10_M_reserveEy:
.LFB7052:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	8(%rcx), %r9
	movq	24(%rcx), %r8
	subq	%r9, %r8
	movq	%rdx, %r11
	movq	16(%rcx), %rdx
	movq	%rcx, %r10
	subq	%r8, %rdx
	cmpq	%r11, %rdx
	jnb	.L326
	cmpq	%r11, 16(%rcx)
	jb	.L336
	movq	(%rcx), %rax
	leaq	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE11_M_overflowEv(%rip), %rdx
	movq	(%rax), %rax
	cmpq	%rdx, %rax
	je	.L341
	leaq	_ZNSt8__format14_Fixedbuf_sinkIcE11_M_overflowEv(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L342
	movq	%r11, 72(%rsp)
	movq	%rcx, 64(%rsp)
	call	*%rax
	movq	64(%rsp), %r10
	movq	72(%rsp), %r11
	movq	16(%r10), %rax
	movq	24(%r10), %rdx
	subq	8(%r10), %rdx
	subq	%rdx, %rax
.L334:
	cmpq	%r11, %rax
	movl	$0, %eax
	cmovb	%rax, %r10
.L326:
	movq	%r10, %rax
	addq	$48, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L336:
	xorl	%r10d, %r10d
	movq	%r10, %rax
	addq	$48, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L342:
	movq	%r9, 24(%rcx)
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L341:
	testq	%r8, %r8
	je	.L326
	movq	296(%rcx), %rdx
	movabsq	$9223372036854775806, %rax
	subq	%rdx, %rax
	cmpq	%r8, %rax
	jb	.L343
	movq	288(%rcx), %rax
	leaq	304(%rcx), %rcx
	cmpq	%rcx, %rax
	je	.L337
	movq	304(%r10), %rcx
.L330:
	leaq	(%r8,%rdx), %rbx
	cmpq	%rbx, %rcx
	jb	.L331
	leaq	(%rax,%rdx), %rcx
	cmpq	$1, %r8
	je	.L344
	movq	%r9, %rdx
	movq	%r11, 72(%rsp)
	movq	%r10, 64(%rsp)
	call	memcpy
	movq	64(%rsp), %r10
	movq	72(%rsp), %r11
	.p2align 4
	.p2align 3
.L333:
	movq	288(%r10), %rax
	movb	$0, (%rax,%rbx)
	movq	8(%r10), %rax
	movq	%rbx, 296(%r10)
	movq	%rax, 24(%r10)
	movq	16(%r10), %rax
	jmp	.L334
	.p2align 4,,10
	.p2align 3
.L331:
	movq	%r8, 32(%rsp)
	leaq	288(%r10), %rcx
	xorl	%r8d, %r8d
	movq	%r11, 72(%rsp)
	movq	%r10, 64(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	movq	72(%rsp), %r11
	movq	64(%rsp), %r10
	jmp	.L333
.L337:
	movl	$15, %ecx
	jmp	.L330
.L344:
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	jmp	.L333
.L343:
	leaq	.LC9(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
	nop
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "format error: missing precision after '.' in format string\0"
	.section	.text$_ZNSt8__format14__formatter_fpIcE5parseERSt26basic_format_parse_contextIcE,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format14__formatter_fpIcE5parseERSt26basic_format_parse_contextIcE
	.def	_ZNSt8__format14__formatter_fpIcE5parseERSt26basic_format_parse_contextIcE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format14__formatter_fpIcE5parseERSt26basic_format_parse_contextIcE
_ZNSt8__format14__formatter_fpIcE5parseERSt26basic_format_parse_contextIcE:
.LFB7700:
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
	subq	$184, %rsp
	.seh_stackalloc	184
	.seh_endprologue
	pxor	%xmm0, %xmm0
	movq	%rdx, %r11
	movups	%xmm0, 80(%rsp)
	movq	8(%rdx), %rdx
	movq	%rcx, %rbx
	movups	%xmm0, 96(%rsp)
	movdqu	(%r11), %xmm0
	movq	%xmm0, %r10
	cmpq	%r10, %rdx
	je	.L346
	movzbl	(%r10), %eax
	cmpb	$125, %al
	je	.L346
	cmpb	$123, %al
	je	.L362
	movb	%al, 56(%rsp)
	leaq	112(%rsp), %rcx
	xorl	%eax, %eax
	movq	%xmm0, 64(%rsp)
	punpcklqdq	%xmm0, %xmm0
	movq	%r11, 264(%rsp)
	movq	%rdx, 128(%rsp)
	movq	%rdx, 48(%rsp)
	movw	%ax, 140(%rsp)
	movups	%xmm0, 112(%rsp)
	movb	$0, 142(%rsp)
	call	_ZNSt9__unicode13_Utf_iteratorIcDiPKcS2_NS_5_ReplEE12_M_read_utf8Ev.isra.0
	movdqu	112(%rsp), %xmm0
	movzbl	140(%rsp), %ecx
	movq	120(%rsp), %r9
	movzbl	142(%rsp), %esi
	leal	1(%rcx), %eax
	movq	%rcx, %r8
	movq	48(%rsp), %rdx
	movq	64(%rsp), %r10
	movzbl	141(%rsp), %ecx
	movups	%xmm0, 144(%rsp)
	movdqu	128(%rsp), %xmm0
	movq	264(%rsp), %r11
	cmpl	%ecx, %eax
	movups	%xmm0, 160(%rsp)
	movzbl	56(%rsp), %eax
	jge	.L443
.L351:
	movl	168(%rsp,%r8,4), %esi
	movl	%esi, %edi
	cmpl	$55295, %esi
	ja	.L444
.L354:
	cmpq	%r9, %rdx
	je	.L356
	movzbl	(%r9), %ecx
	cmpb	$62, %cl
	je	.L404
	cmpb	$94, %cl
	je	.L405
	movl	$1, %r14d
	cmpb	$60, %cl
	jne	.L356
.L357:
	leaq	1(%r9), %r10
	jmp	.L358
	.p2align 4,,10
	.p2align 3
.L346:
	movl	$32, 84(%rsp)
.L348:
	movdqu	80(%rsp), %xmm0
	movq	%r10, %rax
	movups	%xmm0, (%rbx)
	movdqu	96(%rsp), %xmm0
	movups	%xmm0, 16(%rbx)
	addq	$184, %rsp
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
.L356:
	cmpb	$62, %al
	je	.L359
	cmpb	$94, %al
	je	.L360
	cmpb	$60, %al
	je	.L361
	.p2align 4
	.p2align 3
.L362:
	movl	$32, %edi
	xorl	%r14d, %r14d
.L350:
	movzbl	(%r10), %eax
	cmpb	$125, %al
	je	.L363
.L364:
	leal	-32(%rax), %ecx
	cmpb	$13, %cl
	jbe	.L445
	xorl	%r15d, %r15d
	xorl	%ebp, %ebp
.L365:
	cmpb	$48, %al
	je	.L370
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	cmpb	$46, %al
	jne	.L403
.L371:
	leaq	1(%r10), %rcx
	movb	$0, 144(%rsp)
	cmpq	%rcx, %rdx
	je	.L378
	movzbl	88(%rsp), %eax
	leal	0(,%r15,4), %r8d
	movq	%r11, 32(%rsp)
	leaq	144(%rsp), %r9
	andb	$-16, 104(%rsp)
	andl	$-16, %eax
	movq	%rdx, 56(%rsp)
	orl	%r14d, %eax
	movl	%edi, 84(%rsp)
	orl	%r8d, %eax
	leal	0(,%r13,4), %r8d
	movq	%rcx, 48(%rsp)
	movb	%al, 88(%rsp)
	movzbl	92(%rsp), %eax
	andl	$-8, %eax
	orl	%ebp, %eax
	orl	%r8d, %eax
	movl	%r12d, %r8d
	movb	%al, 92(%rsp)
	movzbl	96(%rsp), %eax
	andl	$3, %r8d
	andl	$-16, %eax
	orl	%r8d, %eax
	leaq	82(%rsp), %r8
	movb	%al, 96(%rsp)
	call	_ZNSt8__format5_SpecIcE27_S_parse_width_or_precisionEPKcS3_RtRbRSt26basic_format_parse_contextIcE
	cmpq	%rax, 48(%rsp)
	movq	56(%rsp), %rdx
	movq	%rax, %r10
	je	.L378
	movzbl	144(%rsp), %eax
	addl	$1, %eax
	andl	$3, %eax
	cmpq	%r10, %rdx
	je	.L380
	movzbl	(%r10), %ecx
	cmpb	$125, %cl
	je	.L380
	cmpb	$76, %cl
	je	.L446
	subl	$65, %ecx
	cmpb	$38, %cl
	ja	.L418
	leaq	.L401(%rip), %r8
	movzbl	%cl, %ecx
	movslq	(%r8,%rcx,4), %rcx
	addq	%r8, %rcx
	jmp	*%rcx
	.section .rdata,"dr"
	.align 4
.L401:
	.long	.L419-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L420-.L401
	.long	.L421-.L401
	.long	.L422-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L423-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L418-.L401
	.long	.L424-.L401
	.long	.L425-.L401
	.long	.L426-.L401
	.section	.text$_ZNSt8__format14__formatter_fpIcE5parseERSt26basic_format_parse_contextIcE,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L445:
	movzbl	%cl, %ecx
	leaq	CSWTCH.794(%rip), %r8
	movzbl	(%r8,%rcx), %ecx
	testb	%cl, %cl
	jne	.L447
	cmpb	$35, %al
	je	.L427
	xorl	%ebp, %ebp
	xorl	%r15d, %r15d
.L403:
	movb	$0, 144(%rsp)
	xorl	%r13d, %r13d
.L372:
	movzbl	%r15b, %eax
	movzbl	%r14b, %ecx
	movq	%r11, 32(%rsp)
	xorl	%r12d, %r12d
	salq	$2, %rax
	leaq	80(%rsp), %r8
	andb	$-16, 96(%rsp)
	orq	%rcx, %rax
	movzbl	%bpl, %ecx
	leaq	144(%rsp), %r9
	andb	$-16, 104(%rsp)
	salq	$32, %rcx
	movq	%r11, 264(%rsp)
	orq	%rcx, %rax
	movzbl	%r13b, %ecx
	movq	%rdx, 56(%rsp)
	salq	$34, %rcx
	movl	%edi, 84(%rsp)
	orq	%rcx, %rax
	movq	%r10, 48(%rsp)
	movabsq	$-30064771088, %rcx
	andq	88(%rsp), %rcx
	orq	%rcx, %rax
	movq	%r10, %rcx
	movq	%rax, 88(%rsp)
	call	_ZNSt8__format5_SpecIcE27_S_parse_width_or_precisionEPKcS3_RtRbRSt26basic_format_parse_contextIcE
	cmpq	48(%rsp), %rax
	movq	56(%rsp), %rdx
	movq	264(%rsp), %r11
	movq	%rax, %rcx
	je	.L375
	movzbl	144(%rsp), %eax
	addl	$1, %eax
	andl	$3, %eax
	movl	%eax, %r12d
.L375:
	cmpq	%rcx, %rdx
	je	.L376
	movzbl	(%rcx), %r8d
	cmpb	$125, %r8b
	je	.L376
	cmpb	$46, %r8b
	je	.L415
	cmpb	$76, %r8b
	je	.L416
	xorl	%r9d, %r9d
	xorl	%eax, %eax
.L384:
	subl	$65, %r8d
	cmpb	$38, %r8b
	ja	.L414
	leaq	.L387(%rip), %r10
	movzbl	%r8b, %r8d
	movslq	(%r10,%r8,4), %r8
	addq	%r10, %r8
	jmp	*%r8
	.section .rdata,"dr"
	.align 4
.L387:
	.long	.L394-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L393-.L387
	.long	.L392-.L387
	.long	.L391-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L390-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L414-.L387
	.long	.L389-.L387
	.long	.L388-.L387
	.long	.L386-.L387
	.section	.text$_ZNSt8__format14__formatter_fpIcE5parseERSt26basic_format_parse_contextIcE,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L443:
	cmpq	%r9, %rdx
	je	.L353
	movzbl	%sil, %ecx
	addq	%r9, %rcx
	cmpq	%rcx, %rdx
	je	.L353
	movq	%rcx, 120(%rsp)
	leaq	112(%rsp), %rcx
	movq	%r10, 72(%rsp)
	movb	%al, 64(%rsp)
	movb	%r8b, 56(%rsp)
	call	_ZNSt9__unicode13_Utf_iteratorIcDiPKcS2_NS_5_ReplEE12_M_read_utf8Ev.isra.0
	movq	120(%rsp), %r9
	movq	72(%rsp), %r10
	movq	264(%rsp), %r11
	movzbl	64(%rsp), %eax
	movzbl	56(%rsp), %r8d
	movq	48(%rsp), %rdx
	jmp	.L351
	.p2align 4,,10
	.p2align 3
.L361:
	movl	$1, %r14d
.L400:
	addq	$1, %r10
	movl	$32, %edi
.L358:
	cmpq	%r10, %rdx
	jne	.L350
.L363:
	movq	%r14, %rdx
	andb	$-16, 96(%rsp)
	movabsq	$-30064771088, %rax
	andq	88(%rsp), %rax
	andl	$3, %edx
	andb	$-16, 104(%rsp)
	orq	%rdx, %rax
	movl	%edi, 84(%rsp)
	movq	%rax, 88(%rsp)
	jmp	.L348
	.p2align 4,,10
	.p2align 3
.L447:
	movl	%ecx, %eax
	leaq	1(%r10), %r8
	andl	$3, %eax
	movl	%eax, %r15d
	cmpq	%r8, %rdx
	jne	.L448
.L367:
	movzbl	%cl, %eax
	movzbl	%r14b, %edx
	andb	$-16, 96(%rsp)
	movq	%r8, %r10
	salq	$2, %rax
	andb	$-16, 104(%rsp)
	orq	%rdx, %rax
	movl	%edi, 84(%rsp)
	movabsq	$-30064771088, %rdx
	andq	88(%rsp), %rdx
	andl	$15, %eax
	orq	%rdx, %rax
	movq	%rax, 88(%rsp)
	jmp	.L348
	.p2align 4,,10
	.p2align 3
.L353:
	movl	168(%rsp,%r8,4), %ecx
	cmpl	$55295, %ecx
	jbe	.L356
	subl	$57344, %ecx
	cmpl	$1056767, %ecx
	jbe	.L356
.L355:
	cmpb	$62, %al
	je	.L359
	cmpb	$94, %al
	je	.L360
	cmpb	$60, %al
	je	.L361
	movl	$32, %edi
	xorl	%r14d, %r14d
	jmp	.L364
	.p2align 4,,10
	.p2align 3
.L405:
	movl	$3, %r14d
	jmp	.L357
.L427:
	movq	%r10, %r8
	xorl	%r15d, %r15d
.L402:
	leaq	1(%r8), %r10
	cmpq	%r10, %rdx
	jne	.L449
.L369:
	movzbl	%r15b, %eax
	movzbl	%r14b, %edx
	andb	$-16, 96(%rsp)
	btsq	$32, %rdx
	salq	$2, %rax
	andb	$-16, 104(%rsp)
	orq	%rdx, %rax
	movl	%edi, 84(%rsp)
	movabsq	$-30064771088, %rdx
	andq	88(%rsp), %rdx
	orq	%rdx, %rax
	movq	%rax, 88(%rsp)
	jmp	.L348
.L414:
	xorl	%r8d, %r8d
.L385:
	movq	%rcx, %r10
	cmpq	%rcx, %rdx
	je	.L395
.L396:
	cmpb	$125, (%r10)
	je	.L450
	call	_ZNSt8__format29__failed_to_parse_format_specEv
	.p2align 4,,10
	.p2align 3
.L418:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	jmp	.L396
.L426:
	movq	%r10, %rcx
	xorl	%r9d, %r9d
.L386:
	addq	$1, %rcx
	movl	$1, %r8d
	jmp	.L385
.L425:
	movq	%r10, %rcx
	xorl	%r9d, %r9d
.L388:
	addq	$1, %rcx
	movl	$7, %r8d
	jmp	.L385
.L424:
	movq	%r10, %rcx
	xorl	%r9d, %r9d
.L389:
	addq	$1, %rcx
	movl	$5, %r8d
	jmp	.L385
.L423:
	movq	%r10, %rcx
	xorl	%r9d, %r9d
.L390:
	addq	$1, %rcx
	movl	$3, %r8d
	jmp	.L385
.L422:
	movq	%r10, %rcx
	xorl	%r9d, %r9d
.L391:
	addq	$1, %rcx
	movl	$2, %r8d
	jmp	.L385
.L421:
	movq	%r10, %rcx
	xorl	%r9d, %r9d
.L392:
	addq	$1, %rcx
	movl	$8, %r8d
	jmp	.L385
.L420:
	movq	%r10, %rcx
	xorl	%r9d, %r9d
.L393:
	addq	$1, %rcx
	movl	$6, %r8d
	jmp	.L385
.L419:
	movq	%r10, %rcx
	xorl	%r9d, %r9d
.L394:
	addq	$1, %rcx
	movl	$4, %r8d
	jmp	.L385
	.p2align 4,,10
	.p2align 3
.L370:
	leaq	1(%r10), %rcx
	cmpq	%rcx, %rdx
	jne	.L451
.L373:
	movzbl	%r15b, %eax
	movzbl	%r14b, %edx
	andb	$-16, 96(%rsp)
	movq	%rcx, %r10
	btsq	$34, %rdx
	salq	$2, %rax
	andb	$-16, 104(%rsp)
	orq	%rdx, %rax
	movzbl	%bpl, %edx
	movl	%edi, 84(%rsp)
	salq	$32, %rdx
	orq	%rdx, %rax
	movabsq	$-30064771088, %rdx
	andq	88(%rsp), %rdx
	orq	%rdx, %rax
	movq	%rax, 88(%rsp)
	jmp	.L348
	.p2align 4,,10
	.p2align 3
.L360:
	movl	$3, %r14d
	jmp	.L400
	.p2align 4,,10
	.p2align 3
.L359:
	movl	$2, %r14d
	jmp	.L400
.L449:
	movzbl	1(%r8), %eax
	movl	$1, %ebp
	cmpb	$125, %al
	jne	.L365
	jmp	.L369
.L380:
	andl	$3, %eax
	andb	$-3, 92(%rsp)
	leal	0(,%rax,4), %edx
	movzbl	96(%rsp), %eax
	andb	$-16, 104(%rsp)
	andl	$-13, %eax
	orl	%edx, %eax
	movb	%al, 96(%rsp)
	jmp	.L348
.L404:
	movl	$2, %r14d
	jmp	.L357
.L451:
	movzbl	1(%r10), %eax
	cmpb	$125, %al
	je	.L373
	cmpb	$46, %al
	je	.L410
	movb	$0, 144(%rsp)
	cmpb	$48, %al
	je	.L452
	movq	%rcx, %r10
	movl	$1, %r13d
	jmp	.L372
.L376:
	movzbl	96(%rsp), %eax
	movl	%r12d, %edx
	movq	%rcx, %r10
	andl	$3, %edx
	andl	$-4, %eax
	orl	%edx, %eax
	movb	%al, 96(%rsp)
	jmp	.L348
.L416:
	xorl	%eax, %eax
.L398:
	leaq	1(%rcx), %r10
	cmpq	%r10, %rdx
	jne	.L453
.L383:
	movzbl	88(%rsp), %edx
	andl	$3, %eax
	movl	%r12d, %r8d
	andb	$-16, 104(%rsp)
	leal	0(,%r15,4), %ecx
	andl	$3, %r8d
	movl	%edi, 84(%rsp)
	andl	$-16, %edx
	orl	%r14d, %edx
	orl	%ecx, %edx
	leal	0(,%r13,4), %ecx
	movb	%dl, 88(%rsp)
	movzbl	92(%rsp), %edx
	andl	$-2, %edx
	orl	%ebp, %edx
	orl	$2, %edx
	andl	$-5, %edx
	orl	%ecx, %edx
	leal	0(,%rax,4), %ecx
	movb	%dl, 92(%rsp)
	movzbl	96(%rsp), %edx
	andl	$-16, %edx
	movl	%edx, %eax
	orl	%r8d, %eax
	orl	%ecx, %eax
	movb	%al, 96(%rsp)
	jmp	.L348
.L410:
	movq	%rcx, %r10
	movl	$1, %r13d
	xorl	%r12d, %r12d
	jmp	.L371
.L450:
	movq	%r10, %rcx
.L395:
	movzbl	%r15b, %edx
	movzbl	%r14b, %r10d
	salq	$33, %r9
	movl	%edi, 84(%rsp)
	salq	$2, %rdx
	sall	$2, %eax
	orq	%r10, %rdx
	movzbl	%bpl, %r10d
	orl	%r12d, %eax
	salq	$32, %r10
	andl	$15, %eax
	orq	%r10, %rdx
	movq	%rcx, %r10
	orq	%r9, %rdx
	movzbl	%r13b, %r9d
	salq	$34, %r9
	orq	%r9, %rdx
	movabsq	$-30064771088, %r9
	andq	88(%rsp), %r9
	orq	%r9, %rdx
	movq	%rdx, 88(%rsp)
	movzbl	96(%rsp), %edx
	andl	$-16, %edx
	orl	%edx, %eax
	movb	%al, 96(%rsp)
	movzbl	104(%rsp), %eax
	andl	$-16, %eax
	orl	%r8d, %eax
	movb	%al, 104(%rsp)
	jmp	.L348
.L453:
	movzbl	1(%rcx), %r8d
	cmpb	$125, %r8b
	je	.L383
	movq	%r10, %rcx
	movl	$1, %r9d
	jmp	.L384
	.p2align 4,,10
	.p2align 3
.L446:
	movq	%r10, %rcx
	jmp	.L398
.L444:
	leal	-57344(%rsi), %ecx
	cmpl	$1056767, %ecx
	ja	.L355
	jmp	.L354
.L415:
	movq	%rcx, %r10
	jmp	.L371
.L448:
	movzbl	1(%r10), %eax
	cmpb	$125, %al
	je	.L367
	cmpb	$35, %al
	je	.L402
	movq	%r8, %r10
	xorl	%ebp, %ebp
	jmp	.L365
.L378:
	leaq	.LC11(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
.L452:
	leaq	.LC7(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZNSt8__format15__formatter_strIcE5parseERSt26basic_format_parse_contextIcE,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format15__formatter_strIcE5parseERSt26basic_format_parse_contextIcE
	.def	_ZNSt8__format15__formatter_strIcE5parseERSt26basic_format_parse_contextIcE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format15__formatter_strIcE5parseERSt26basic_format_parse_contextIcE
_ZNSt8__format15__formatter_strIcE5parseERSt26basic_format_parse_contextIcE:
.LFB7715:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$184, %rsp
	.seh_stackalloc	184
	.seh_endprologue
	pxor	%xmm1, %xmm1
	movdqu	(%rdx), %xmm0
	movq	%xmm0, %r10
	movq	%rdx, %r11
	movq	8(%rdx), %rdx
	movq	%rcx, %rbx
	movups	%xmm1, 80(%rsp)
	movups	%xmm1, 96(%rsp)
	cmpq	%r10, %rdx
	je	.L455
	movzbl	(%r10), %eax
	cmpb	$125, %al
	je	.L455
	cmpb	$123, %al
	je	.L471
	movb	%al, 56(%rsp)
	leaq	112(%rsp), %rcx
	xorl	%eax, %eax
	movq	%xmm0, 64(%rsp)
	punpcklqdq	%xmm0, %xmm0
	movq	%r11, 216(%rsp)
	movq	%rdx, 128(%rsp)
	movq	%rdx, 48(%rsp)
	movw	%ax, 140(%rsp)
	movups	%xmm0, 112(%rsp)
	movb	$0, 142(%rsp)
	call	_ZNSt9__unicode13_Utf_iteratorIcDiPKcS2_NS_5_ReplEE12_M_read_utf8Ev.isra.0
	movdqu	112(%rsp), %xmm0
	movzbl	140(%rsp), %ecx
	movq	120(%rsp), %r9
	movzbl	142(%rsp), %esi
	leal	1(%rcx), %eax
	movq	%rcx, %r8
	movq	48(%rsp), %rdx
	movq	64(%rsp), %r10
	movzbl	141(%rsp), %ecx
	movups	%xmm0, 144(%rsp)
	movdqu	128(%rsp), %xmm0
	movq	216(%rsp), %r11
	cmpl	%ecx, %eax
	movups	%xmm0, 160(%rsp)
	movzbl	56(%rsp), %eax
	jge	.L512
.L460:
	movl	168(%rsp,%r8,4), %ecx
	cmpl	$55295, %ecx
	ja	.L513
.L463:
	cmpq	%rdx, %r9
	je	.L464
	movzbl	(%r9), %r8d
	cmpb	$62, %r8b
	je	.L491
	cmpb	$94, %r8b
	je	.L492
	cmpb	$60, %r8b
	jne	.L466
	movl	$1, %r8d
.L465:
	leaq	1(%r9), %r10
.L467:
	cmpq	%r10, %rdx
	jne	.L459
.L472:
	movzbl	88(%rsp), %eax
	movl	%ecx, 84(%rsp)
	andl	$-4, %eax
	orl	%r8d, %eax
	movb	%al, 88(%rsp)
	jmp	.L457
	.p2align 4,,10
	.p2align 3
.L455:
	movl	$32, 84(%rsp)
.L457:
	movdqu	80(%rsp), %xmm0
	movq	%r10, %rax
	movups	%xmm0, (%rbx)
	movdqu	96(%rsp), %xmm0
	movups	%xmm0, 16(%rbx)
	addq	$184, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L471:
	movl	$32, %ecx
	xorl	%r8d, %r8d
.L459:
	movzbl	(%r10), %eax
	cmpb	$125, %al
	je	.L472
.L473:
	movb	$0, 144(%rsp)
	cmpb	$48, %al
	je	.L514
	movzbl	88(%rsp), %eax
	movq	%r11, 32(%rsp)
	xorl	%esi, %esi
	leaq	144(%rsp), %r9
	movl	%ecx, 84(%rsp)
	movq	%r10, %rcx
	andl	$-4, %eax
	andb	$-16, 104(%rsp)
	orl	%r8d, %eax
	leaq	80(%rsp), %r8
	movq	%rdx, 56(%rsp)
	movb	%al, 88(%rsp)
	movabsq	$-4294967312, %rax
	movq	%r11, 216(%rsp)
	andq	%rax, 96(%rsp)
	movq	%r10, 48(%rsp)
	call	_ZNSt8__format5_SpecIcE27_S_parse_width_or_precisionEPKcS3_RtRbRSt26basic_format_parse_contextIcE
	cmpq	48(%rsp), %rax
	movq	56(%rsp), %rdx
	movq	216(%rsp), %r11
	je	.L475
	movzbl	144(%rsp), %ecx
	addl	$1, %ecx
	andl	$3, %ecx
	movl	%ecx, %esi
.L475:
	cmpq	%rax, %rdx
	je	.L476
	movzbl	(%rax), %ecx
	cmpb	$125, %cl
	je	.L476
	cmpb	$46, %cl
	je	.L478
	cmpb	$115, %cl
	je	.L515
	cmpb	$63, %cl
	jne	.L486
	xorl	%ecx, %ecx
.L485:
	leaq	1(%rax), %r10
	xorl	%r9d, %r9d
	movl	$1, %r8d
.L487:
	cmpq	%r10, %rdx
	je	.L488
	cmpb	$125, (%r10)
	jne	.L486
.L488:
	movzbl	%cl, %eax
	salq	$32, %r8
	leaq	0(,%rax,4), %rdx
	movzbl	%sil, %eax
	orq	%rdx, %rax
	movabsq	$-4294967312, %rdx
	andq	96(%rsp), %rdx
	andl	$15, %eax
	orq	%r8, %rax
	orq	%rdx, %rax
	movq	%rax, 96(%rsp)
	movzbl	104(%rsp), %eax
	andl	$-16, %eax
	orl	%r9d, %eax
	movb	%al, 104(%rsp)
	jmp	.L457
	.p2align 4,,10
	.p2align 3
.L512:
	cmpq	%r9, %rdx
	je	.L464
	movzbl	%sil, %ecx
	addq	%r9, %rcx
	cmpq	%rcx, %rdx
	je	.L464
	movq	%rcx, 120(%rsp)
	leaq	112(%rsp), %rcx
	movb	%r8b, 79(%rsp)
	call	_ZNSt9__unicode13_Utf_iteratorIcDiPKcS2_NS_5_ReplEE12_M_read_utf8Ev.isra.0
	movq	120(%rsp), %r9
	movzbl	79(%rsp), %r8d
	movq	216(%rsp), %r11
	movq	64(%rsp), %r10
	movzbl	56(%rsp), %eax
	movq	48(%rsp), %rdx
	jmp	.L460
	.p2align 4,,10
	.p2align 3
.L476:
	movzbl	96(%rsp), %edx
	movl	%esi, %ecx
	movq	%rax, %r10
	andl	$3, %ecx
	andl	$-4, %edx
	orl	%ecx, %edx
	movb	%dl, 96(%rsp)
	jmp	.L457
	.p2align 4,,10
	.p2align 3
.L478:
	leaq	1(%rax), %rcx
	movb	$0, 144(%rsp)
	cmpq	%rcx, %rdx
	je	.L481
	movzbl	96(%rsp), %eax
	movq	%r11, 32(%rsp)
	movl	%esi, %r8d
	leaq	144(%rsp), %r9
	andl	$3, %r8d
	movq	%rdx, 56(%rsp)
	andl	$-4, %eax
	movq	%rcx, 48(%rsp)
	orl	%r8d, %eax
	leaq	82(%rsp), %r8
	movb	%al, 96(%rsp)
	call	_ZNSt8__format5_SpecIcE27_S_parse_width_or_precisionEPKcS3_RtRbRSt26basic_format_parse_contextIcE
	cmpq	%rax, 48(%rsp)
	movq	56(%rsp), %rdx
	movq	%rax, %r10
	je	.L481
	movzbl	144(%rsp), %eax
	leal	1(%rax), %ecx
	andl	$3, %ecx
	cmpq	%r10, %rdx
	je	.L483
	movzbl	(%r10), %eax
	cmpb	$125, %al
	je	.L483
	cmpb	$115, %al
	je	.L495
	cmpb	$63, %al
	je	.L516
.L486:
	call	_ZNSt8__format29__failed_to_parse_format_specEv
	.p2align 4,,10
	.p2align 3
.L513:
	leal	-57344(%rcx), %r8d
	cmpl	$1056767, %r8d
	jbe	.L463
	.p2align 4
	.p2align 3
.L464:
	cmpb	$62, %al
	je	.L468
	cmpb	$94, %al
	je	.L469
	cmpb	$60, %al
	je	.L470
	movl	$32, %ecx
	xorl	%r8d, %r8d
	jmp	.L473
.L492:
	movl	$3, %r8d
	jmp	.L465
.L466:
	cmpb	$62, %al
	je	.L468
	cmpb	$94, %al
	je	.L469
	cmpb	$60, %al
	jne	.L471
.L470:
	movl	$1, %r8d
.L490:
	addq	$1, %r10
	movl	$32, %ecx
	jmp	.L467
.L483:
	movzbl	96(%rsp), %edx
	andl	$3, %ecx
	leal	0(,%rcx,4), %eax
	andl	$-13, %edx
	orl	%edx, %eax
	movb	%al, 96(%rsp)
	jmp	.L457
	.p2align 4,,10
	.p2align 3
.L469:
	movl	$3, %r8d
	jmp	.L490
	.p2align 4,,10
	.p2align 3
.L468:
	movl	$2, %r8d
	jmp	.L490
.L515:
	xorl	%ecx, %ecx
.L479:
	leaq	1(%rax), %r10
	movl	$1, %r9d
	xorl	%r8d, %r8d
	jmp	.L487
.L491:
	movl	$2, %r8d
	jmp	.L465
.L495:
	movq	%r10, %rax
	jmp	.L479
.L516:
	movq	%r10, %rax
	jmp	.L485
.L514:
	leaq	.LC7(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
.L481:
	leaq	.LC11(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZNSt8__format15__formatter_ptrIcE5parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format15__formatter_ptrIcE5parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE
	.def	_ZNSt8__format15__formatter_ptrIcE5parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format15__formatter_ptrIcE5parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE
_ZNSt8__format15__formatter_ptrIcE5parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE:
.LFB7719:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$176, %rsp
	.seh_stackalloc	176
	.seh_endprologue
	pxor	%xmm0, %xmm0
	movq	8(%rdx), %rsi
	movups	%xmm0, 80(%rsp)
	movq	%rcx, %r11
	movl	%r8d, %ebx
	movups	%xmm0, 96(%rsp)
	movdqu	(%rdx), %xmm0
	movq	%xmm0, %r10
	cmpq	%r10, %rsi
	je	.L518
	movzbl	(%r10), %eax
	cmpb	$125, %al
	je	.L518
	cmpb	$123, %al
	je	.L534
	movq	%rcx, 208(%rsp)
	leaq	112(%rsp), %rcx
	movb	%al, 56(%rsp)
	xorl	%eax, %eax
	movq	%xmm0, 64(%rsp)
	punpcklqdq	%xmm0, %xmm0
	movq	%rdx, 216(%rsp)
	movw	%ax, 140(%rsp)
	movups	%xmm0, 112(%rsp)
	movq	%rsi, 128(%rsp)
	movb	$0, 142(%rsp)
	call	_ZNSt9__unicode13_Utf_iteratorIcDiPKcS2_NS_5_ReplEE12_M_read_utf8Ev.isra.0
	movdqu	112(%rsp), %xmm0
	movzbl	140(%rsp), %ecx
	movq	120(%rsp), %r9
	movzbl	142(%rsp), %edi
	leal	1(%rcx), %eax
	movq	%rcx, %r8
	movzbl	141(%rsp), %ecx
	movups	%xmm0, 144(%rsp)
	movdqu	128(%rsp), %xmm0
	movq	64(%rsp), %r10
	cmpl	%ecx, %eax
	movq	208(%rsp), %r11
	movzbl	56(%rsp), %eax
	movq	216(%rsp), %rdx
	movups	%xmm0, 160(%rsp)
	jge	.L604
.L523:
	movl	168(%rsp,%r8,4), %ecx
	cmpl	$55295, %ecx
	ja	.L605
.L526:
	cmpq	%r9, %rsi
	je	.L528
	movzbl	(%r9), %r8d
	cmpb	$62, %r8b
	je	.L560
	cmpb	$94, %r8b
	je	.L561
	cmpb	$60, %r8b
	jne	.L528
	movl	$1, %r8d
.L529:
	leaq	1(%r9), %r10
	jmp	.L530
	.p2align 4,,10
	.p2align 3
.L518:
	movl	$32, 84(%rsp)
	movdqu	80(%rsp), %xmm0
	movups	%xmm0, (%r11)
	movdqu	96(%rsp), %xmm0
	movups	%xmm0, 16(%r11)
	testb	%bl, %bl
	jne	.L606
.L517:
	movq	%r10, %rax
	addq	$176, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L528:
	cmpb	$62, %al
	je	.L531
	cmpb	$94, %al
	je	.L532
	cmpb	$60, %al
	je	.L533
	.p2align 4
	.p2align 3
.L534:
	movl	$32, %ecx
	xorl	%r8d, %r8d
.L522:
	movzbl	(%r10), %eax
	cmpb	$125, %al
	je	.L535
.L536:
	cmpb	$48, %al
	je	.L607
	movb	$0, 144(%rsp)
.L545:
	movzbl	88(%rsp), %eax
	movq	%rdx, 32(%rsp)
	movq	%rsi, %rdx
	leaq	144(%rsp), %r9
	movl	%ecx, 84(%rsp)
	movq	%r10, %rcx
	andl	$-4, %eax
	andb	$-4, 96(%rsp)
	orl	%r8d, %eax
	leaq	80(%rsp), %r8
	andb	$-16, 104(%rsp)
	movq	%r11, 208(%rsp)
	movb	%al, 88(%rsp)
	movq	%r10, 56(%rsp)
	call	_ZNSt8__format5_SpecIcE27_S_parse_width_or_precisionEPKcS3_RtRbRSt26basic_format_parse_contextIcE
	movq	208(%rsp), %r11
	movq	%rax, %rdx
	xorl	%eax, %eax
	cmpq	%rdx, 56(%rsp)
	je	.L546
	movzbl	144(%rsp), %eax
	addl	$1, %eax
	andl	$3, %eax
.L546:
	cmpq	%rdx, %rsi
	je	.L547
	movzbl	(%rdx), %ecx
	cmpb	$125, %cl
	je	.L547
	cmpb	$112, %cl
	je	.L552
	cmpb	$80, %cl
	jne	.L554
	movzbl	92(%rsp), %ecx
	leaq	1(%rdx), %r10
	movl	$4, %r8d
	notl	%ecx
	andl	$1, %ecx
.L555:
	movzbl	92(%rsp), %edx
	andl	$1, %ecx
	andl	$-2, %edx
	orl	%ecx, %edx
	movb	%dl, 92(%rsp)
	cmpq	%r10, %rsi
	je	.L556
	cmpb	$125, (%r10)
	je	.L556
.L554:
	call	_ZNSt8__format29__failed_to_parse_format_specEv
	.p2align 4,,10
	.p2align 3
.L604:
	cmpq	%r9, %rsi
	je	.L525
	movzbl	%dil, %ecx
	addq	%r9, %rcx
	cmpq	%rcx, %rsi
	je	.L525
	movq	%rcx, 120(%rsp)
	leaq	112(%rsp), %rcx
	movq	%r10, 72(%rsp)
	movb	%r8b, 64(%rsp)
	call	_ZNSt9__unicode13_Utf_iteratorIcDiPKcS2_NS_5_ReplEE12_M_read_utf8Ev.isra.0
	movq	120(%rsp), %r9
	movq	72(%rsp), %r10
	movq	216(%rsp), %rdx
	movq	208(%rsp), %r11
	movzbl	64(%rsp), %r8d
	movzbl	56(%rsp), %eax
	jmp	.L523
	.p2align 4,,10
	.p2align 3
.L533:
	movl	$1, %r8d
.L559:
	addq	$1, %r10
	movl	$32, %ecx
.L530:
	cmpq	%r10, %rsi
	jne	.L522
.L535:
	movzbl	88(%rsp), %eax
	andb	$-4, 96(%rsp)
	andb	$-16, 104(%rsp)
	andl	$-4, %eax
	movl	%ecx, 84(%rsp)
	orl	%r8d, %eax
	movb	%al, 88(%rsp)
.L603:
	movdqu	80(%rsp), %xmm0
	movups	%xmm0, (%r11)
	movdqu	96(%rsp), %xmm0
	movups	%xmm0, 16(%r11)
	movzbl	24(%r11), %eax
	testb	$15, %al
	jne	.L517
	testb	%bl, %bl
	je	.L517
	andl	$15, %ebx
	andl	$-16, %eax
	orl	%ebx, %eax
	movb	%al, 24(%r11)
	movzbl	12(%r11), %eax
	movl	%eax, %edx
	andl	$-2, %eax
	notl	%edx
	andl	$1, %edx
	orl	%edx, %eax
	movb	%al, 12(%r11)
	jmp	.L517
	.p2align 4,,10
	.p2align 3
.L607:
	leaq	1(%r10), %r9
	orb	$4, 92(%rsp)
	cmpq	%r9, %rsi
	je	.L540
	movzbl	1(%r10), %eax
	cmpb	$125, %al
	jne	.L541
.L540:
	movzbl	88(%rsp), %eax
	movl	%ecx, 84(%rsp)
	andb	$-4, 96(%rsp)
	andl	$-4, %eax
	andb	$-16, 104(%rsp)
	orl	%r8d, %eax
	movb	%al, 88(%rsp)
	movdqu	80(%rsp), %xmm0
	movups	%xmm0, (%r11)
	movdqu	96(%rsp), %xmm0
	movups	%xmm0, 16(%r11)
	movzbl	24(%r11), %eax
	testb	$15, %al
	jne	.L544
	testb	%bl, %bl
	jne	.L542
.L544:
	movq	%r9, %r10
	jmp	.L517
	.p2align 4,,10
	.p2align 3
.L606:
	movzbl	24(%r11), %eax
	andl	$15, %ebx
	orb	$1, 12(%r11)
	movl	%ebx, %r8d
	andl	$-16, %eax
	orl	%eax, %r8d
	movb	%r8b, 24(%r11)
	jmp	.L517
.L541:
	movb	$0, 144(%rsp)
	movq	%r9, %r10
	cmpb	$48, %al
	jne	.L545
	leaq	.LC7(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	.p2align 4,,10
	.p2align 3
.L525:
	movl	168(%rsp,%r8,4), %ecx
	cmpl	$55295, %ecx
	jbe	.L528
	subl	$57344, %ecx
	cmpl	$1056767, %ecx
	jbe	.L528
.L527:
	cmpb	$62, %al
	je	.L531
	cmpb	$94, %al
	je	.L532
	cmpb	$60, %al
	je	.L533
	xorl	%r8d, %r8d
	movl	$32, %ecx
	jmp	.L536
	.p2align 4,,10
	.p2align 3
.L542:
	andl	$15, %ebx
	andl	$-16, %eax
	orl	%ebx, %eax
	movb	%al, 24(%r11)
	movzbl	12(%r11), %eax
	movl	%eax, %edx
	andl	$-2, %eax
	notl	%edx
	andl	$1, %edx
	orl	%edx, %eax
	movb	%al, 12(%r11)
	jmp	.L544
.L561:
	movl	$3, %r8d
	jmp	.L529
	.p2align 4,,10
	.p2align 3
.L532:
	movl	$3, %r8d
	jmp	.L559
	.p2align 4,,10
	.p2align 3
.L531:
	movl	$2, %r8d
	jmp	.L559
	.p2align 4,,10
	.p2align 3
.L547:
	movzbl	96(%rsp), %ecx
	movdqu	80(%rsp), %xmm0
	andl	$3, %eax
	andl	$-4, %ecx
	orl	%ecx, %eax
	movb	%al, 96(%rsp)
	movups	%xmm0, (%r11)
	movdqu	96(%rsp), %xmm0
	movups	%xmm0, 16(%r11)
	movzbl	24(%r11), %eax
	testb	$15, %al
	jne	.L551
	testb	%bl, %bl
	je	.L551
	andl	$15, %ebx
	andl	$-16, %eax
	orl	%ebx, %eax
	movb	%al, 24(%r11)
	movzbl	12(%r11), %eax
	movl	%eax, %ecx
	andl	$-2, %eax
	notl	%ecx
	andl	$1, %ecx
	orl	%ecx, %eax
	movb	%al, 12(%r11)
.L551:
	movq	%rdx, %r10
	jmp	.L517
.L552:
	movzbl	92(%rsp), %ecx
	leaq	1(%rdx), %r10
	movl	$3, %r8d
	notl	%ecx
	andl	$1, %ecx
	jmp	.L555
.L556:
	movzbl	96(%rsp), %edx
	andl	$3, %eax
	andl	$-4, %edx
	orl	%edx, %eax
	movb	%al, 96(%rsp)
	movzbl	104(%rsp), %eax
	andl	$-16, %eax
	orl	%r8d, %eax
	movb	%al, 104(%rsp)
	jmp	.L603
.L560:
	movl	$2, %r8d
	jmp	.L529
.L605:
	leal	-57344(%rcx), %r8d
	cmpl	$1056767, %r8d
	ja	.L527
	jmp	.L526
	.seh_endproc
	.section	.text$_ZSt14__add_groupingIcEPT_S1_S0_PKcyPKS0_S5_,"x"
	.linkonce discard
	.p2align 4
	.globl	_ZSt14__add_groupingIcEPT_S1_S0_PKcyPKS0_S5_
	.def	_ZSt14__add_groupingIcEPT_S1_S0_PKcyPKS0_S5_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZSt14__add_groupingIcEPT_S1_S0_PKcyPKS0_S5_
_ZSt14__add_groupingIcEPT_S1_S0_PKcyPKS0_S5_:
.LFB8001:
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
	.seh_endprologue
	xorl	%r13d, %r13d
	xorl	%ebx, %ebx
	movsbq	(%r8), %r10
	movq	%r10, %rax
	movq	%rcx, %r12
	movq	96(%rsp), %rcx
	leaq	-1(%r9), %rsi
	movl	%edx, %r11d
	movq	88(%rsp), %r9
	movq	%r8, %rdi
	movq	%rcx, %rdx
	subq	%r9, %rdx
	cmpq	%r10, %rdx
	jg	.L609
	jmp	.L644
	.p2align 4,,10
	.p2align 3
.L645:
	addq	$1, %rbx
.L612:
	leaq	(%r8,%rbx), %rdi
	movq	%rcx, %rdx
	movsbq	(%rdi), %r10
	subq	%r9, %rdx
	movq	%r10, %rax
	cmpq	%r10, %rdx
	jle	.L613
.L609:
	subl	$1, %eax
	cmpb	$125, %al
	ja	.L613
	subq	%r10, %rcx
	cmpq	%rsi, %rbx
	jb	.L645
	addq	$1, %r13
	jmp	.L612
.L613:
	leaq	-1(%r13), %rbp
	leaq	-1(%rbx), %rsi
	movq	%r12, %rdx
	cmpq	%rcx, %r9
	je	.L616
.L614:
	movq	%rcx, %r10
	xorl	%eax, %eax
	subq	%r9, %r10
	.p2align 5
	.p2align 4
	.p2align 3
.L618:
	movzbl	(%r9,%rax), %edx
	movb	%dl, (%r12,%rax)
	addq	$1, %rax
	cmpq	%r10, %rax
	jne	.L618
	movq	%r12, %rdx
	subq	%r9, %rdx
	addq	%rcx, %rdx
.L616:
	testq	%r13, %r13
	je	.L619
	.p2align 4
	.p2align 3
.L622:
	movb	%r11b, (%rdx)
	movzbl	(%rdi), %r10d
	leaq	1(%rdx), %r12
	testb	%r10b, %r10b
	jle	.L628
	xorl	%eax, %eax
	.p2align 5
	.p2align 4
	.p2align 3
.L621:
	movzbl	(%rcx,%rax), %r9d
	movb	%r9b, 1(%rdx,%rax)
	addq	$1, %rax
	cmpq	%r10, %rax
	jne	.L621
	leaq	(%r12,%rax), %rdx
	addq	%rax, %rcx
.L620:
	subq	$1, %rbp
	jnb	.L622
.L619:
	testq	%rbx, %rbx
	je	.L608
	.p2align 4
	.p2align 3
.L625:
	movb	%r11b, (%rdx)
	movzbl	(%r8,%rsi), %r10d
	leaq	1(%rdx), %rdi
	testb	%r10b, %r10b
	jle	.L629
	leal	-1(%r10), %ebx
	xorl	%eax, %eax
	movzbl	%bl, %ebx
	.p2align 5
	.p2align 4
	.p2align 3
.L624:
	movzbl	(%rcx,%rax), %r9d
	movb	%r9b, 1(%rdx,%rax)
	addq	$1, %rax
	cmpq	%r10, %rax
	jne	.L624
	leaq	1(%rdi,%rbx), %rdx
	leaq	1(%rcx,%rbx), %rcx
.L623:
	subq	$1, %rsi
	jnb	.L625
.L608:
	movq	%rdx, %rax
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	ret
	.p2align 4,,10
	.p2align 3
.L629:
	movq	%rdi, %rdx
	jmp	.L623
	.p2align 4,,10
	.p2align 3
.L628:
	movq	%r12, %rdx
	jmp	.L620
.L644:
	movq	$-1, %rsi
	movq	$-1, %rbp
	movq	%r12, %rdx
	cmpq	%r9, %rcx
	jne	.L614
	jmp	.L608
	.seh_endproc
	.text
	.align 2
	.p2align 4
	.def	_ZNKSt8__format14__formatter_fpIcE11_M_localizeB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEEcRKSt6locale.isra.0;	.scl	3;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format14__formatter_fpIcE11_M_localizeB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEEcRKSt6locale.isra.0
_ZNKSt8__format14__formatter_fpIcE11_M_localizeB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEEcRKSt6locale.isra.0:
.LFB8381:
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
	subq	$136, %rsp
	.seh_stackalloc	136
	.seh_endprologue
	movq	(%rdx), %rdi
	movq	8(%rdx), %rsi
	leaq	16(%rcx), %rbp
	movb	$0, 16(%rcx)
	movq	%rcx, %rbx
	movq	%r9, %r12
	movq	%rbp, (%rcx)
	movq	$0, 8(%rcx)
	movb	%r8b, 224(%rsp)
.LEHB2:
	call	_ZNSt6locale7classicEv
	movq	%rax, %rdx
	movq	%r12, %rcx
	call	_ZNKSt6localeeqERKS_
	testb	%al, %al
	je	.L705
.L646:
	movq	%rbx, %rax
	addq	$136, %rsp
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
.L705:
	movq	.refptr._ZNSt7__cxx118numpunctIcE2idE(%rip), %rcx
	call	_ZNKSt6locale2id5_M_idEv
	movq	%rax, %rdx
	movq	(%r12), %rax
	movq	8(%rax), %rax
	movq	(%rax,%rdx,8), %r12
	testq	%r12, %r12
	je	.L648
	movq	(%r12), %rax
	movq	%r12, %rcx
	call	*16(%rax)
	movb	%al, 55(%rsp)
	movq	(%r12), %rax
	movq	%r12, %rdx
	leaq	96(%rsp), %rcx
	call	*32(%rax)
.LEHE2:
	cmpq	$0, 104(%rsp)
	jne	.L688
	cmpb	$46, 55(%rsp)
	jne	.L688
	movq	96(%rsp), %rcx
	leaq	112(%rsp), %rax
	cmpq	%rax, %rcx
	jne	.L675
	jmp	.L646
	.p2align 4,,10
	.p2align 3
.L688:
	testq	%rdi, %rdi
	je	.L706
	movq	%rdi, %r8
	movl	$46, %edx
	movq	%rsi, %rcx
	call	memchr
	movsbl	224(%rsp), %edx
	movq	%rdi, %r8
	movq	%rsi, %rcx
	movq	%rax, 56(%rsp)
	call	memchr
	movq	56(%rsp), %r9
	testq	%r9, %r9
	je	.L654
	subq	%rsi, %r9
	movq	%r9, 56(%rsp)
	testq	%rax, %rax
	je	.L680
.L679:
	movq	56(%rsp), %rdx
	subq	%rsi, %rax
	cmpq	%rdx, %rax
	cmova	%rdx, %rax
	movq	%rax, %r14
.L655:
	cmpq	$-1, %r14
	je	.L681
	movq	%rdi, %rdx
	subq	%r14, %rdx
	movq	%rdx, %r13
.L656:
	movq	(%rbx), %r10
	leaq	0(%r13,%r14,2), %r9
	cmpq	%r10, %rbp
	je	.L707
	movq	16(%rbx), %rax
	cmpq	%r9, %rax
	jnb	.L662
	movabsq	$9223372036854775806, %rdx
	cmpq	%r9, %rdx
	jb	.L659
	addq	%rax, %rax
	cmpq	%rax, %r9
	jb	.L664
.L661:
	leaq	1(%r9), %rcx
.L660:
	movq	%r10, 72(%rsp)
	movq	%r9, 64(%rsp)
.LEHB3:
	call	_Znwy
.LEHE3:
	movq	%rax, %r15
	movq	8(%rbx), %rax
	movq	64(%rsp), %r9
	movq	72(%rsp), %r10
	testq	%rax, %rax
	leaq	1(%rax), %r8
	je	.L708
	movq	%r10, %rdx
	movq	%r15, %rcx
	movq	%r9, 72(%rsp)
	movq	%r10, 64(%rsp)
	call	memcpy
	movq	64(%rsp), %r10
	movq	72(%rsp), %r9
	cmpq	%r10, %rbp
	je	.L666
.L667:
	movq	16(%rbx), %rax
	movq	%r10, %rcx
	movq	%r9, 64(%rsp)
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	64(%rsp), %r9
.L666:
	movq	%r15, (%rbx)
	movq	%r9, 16(%rbx)
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L706:
	movq	$-1, 56(%rsp)
	movq	(%rbx), %r15
	xorl	%r14d, %r14d
	xorl	%r13d, %r13d
.L653:
	movzbl	(%rsi), %edx
	leal	-32(%rdx), %eax
	cmpb	$13, %al
	ja	.L670
	movl	$10241, %ecx
	btq	%rax, %rcx
	jnc	.L670
	movb	%dl, (%r15)
	leaq	1(%rsi), %r10
	movq	$1, 64(%rsp)
.L669:
	movq	104(%rsp), %r9
	movq	(%r12), %rax
	leaq	(%rsi,%r14), %rbp
	movq	%r12, %rcx
	movq	96(%rsp), %r8
	movq	%r10, 88(%rsp)
	movq	%r9, 80(%rsp)
	movq	%r8, 72(%rsp)
.LEHB4:
	call	*24(%rax)
.LEHE4:
	movq	88(%rsp), %r10
	movq	64(%rsp), %rcx
	movq	%rbp, 40(%rsp)
	movsbl	%al, %edx
	movq	80(%rsp), %r9
	movq	72(%rsp), %r8
	movq	%r10, 32(%rsp)
	addq	%r15, %rcx
	call	_ZSt14__add_groupingIcEPT_S1_S0_PKcyPKS0_S5_
	movq	%rax, %rcx
	testq	%r13, %r13
	je	.L671
	cmpq	$-1, 56(%rsp)
	je	.L672
	movzbl	55(%rsp), %eax
	addq	$1, %rcx
	movb	%al, -1(%rcx)
	leaq	1(%r14), %rax
	subq	%rax, %rdi
	movq	%rdi, %r13
	jne	.L709
.L673:
	addq	%r13, %rcx
.L671:
	movq	(%rbx), %rax
	subq	%r15, %rcx
	movb	$0, (%rax,%rcx)
	leaq	112(%rsp), %rax
	movq	%rcx, 8(%rbx)
	movq	96(%rsp), %rcx
	cmpq	%rax, %rcx
	je	.L646
.L675:
	movq	112(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	jmp	.L646
	.p2align 4,,10
	.p2align 3
.L670:
	movq	$0, 64(%rsp)
	movq	%rsi, %r10
	jmp	.L669
	.p2align 4,,10
	.p2align 3
.L709:
	leaq	(%rsi,%rax), %rbp
.L672:
	movq	%r13, %r8
	movq	%rbp, %rdx
	call	memcpy
	movq	%rax, %rcx
	jmp	.L673
	.p2align 4,,10
	.p2align 3
.L664:
	cmpq	%rax, %rdx
	leaq	1(%rax), %r8
	movabsq	$9223372036854775807, %rcx
	cmovb	%rdx, %rax
	cmovnb	%r8, %rcx
	movq	%rax, %r9
	jmp	.L660
	.p2align 4,,10
	.p2align 3
.L662:
	movq	%r10, %r15
	jmp	.L653
	.p2align 4,,10
	.p2align 3
.L708:
	movzbl	(%r10), %eax
	movb	%al, (%r15)
	cmpq	%r10, %rbp
	jne	.L667
	jmp	.L666
	.p2align 4,,10
	.p2align 3
.L654:
	movq	$-1, 56(%rsp)
	testq	%rax, %rax
	jne	.L679
.L681:
	movq	%rdi, %r14
	xorl	%r13d, %r13d
	jmp	.L656
	.p2align 4,,10
	.p2align 3
.L707:
	cmpq	$15, %r9
	jbe	.L662
	movabsq	$9223372036854775806, %rax
	cmpq	%r9, %rax
	jb	.L659
	cmpq	$29, %r9
	ja	.L661
	movl	$30, %r9d
	movl	$31, %ecx
	jmp	.L660
	.p2align 4,,10
	.p2align 3
.L680:
	movq	56(%rsp), %r14
	jmp	.L655
.L687:
	movq	(%rbx), %rdx
	movq	%rax, %rsi
	movb	$0, (%rdx)
	xorl	%edx, %edx
	movq	%rdx, 8(%rbx)
.L677:
	leaq	96(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L678:
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rsi, %rcx
.LEHB5:
	call	_Unwind_Resume
.LEHE5:
.L659:
	leaq	.LC8(%rip), %rcx
.LEHB6:
	call	_ZSt20__throw_length_errorPKc
.LEHE6:
.L685:
	movq	%rax, %rsi
	jmp	.L678
.L648:
.LEHB7:
	call	_ZSt16__throw_bad_castv
.LEHE7:
.L686:
	movq	%rax, %rsi
	jmp	.L677
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA8381:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8381-.LLSDACSB8381
.LLSDACSB8381:
	.uleb128 .LEHB2-.LFB8381
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L685-.LFB8381
	.uleb128 0
	.uleb128 .LEHB3-.LFB8381
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L686-.LFB8381
	.uleb128 0
	.uleb128 .LEHB4-.LFB8381
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L687-.LFB8381
	.uleb128 0
	.uleb128 .LEHB5-.LFB8381
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB6-.LFB8381
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L686-.LFB8381
	.uleb128 0
	.uleb128 .LEHB7-.LFB8381
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L685-.LFB8381
	.uleb128 0
.LLSDACSE8381:
	.text
	.seh_endproc
	.section	.text$_ZNKSt9__unicode9__v16_0_022_Grapheme_cluster_viewISt17basic_string_viewIcSt11char_traitsIcEEE9_Iterator11_M_is_breakENS0_13_Gcb_propertyES8_NS_13_Utf_iteratorIcDiPKcSB_NS_5_ReplEEE,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt9__unicode9__v16_0_022_Grapheme_cluster_viewISt17basic_string_viewIcSt11char_traitsIcEEE9_Iterator11_M_is_breakENS0_13_Gcb_propertyES8_NS_13_Utf_iteratorIcDiPKcSB_NS_5_ReplEEE
	.def	_ZNKSt9__unicode9__v16_0_022_Grapheme_cluster_viewISt17basic_string_viewIcSt11char_traitsIcEEE9_Iterator11_M_is_breakENS0_13_Gcb_propertyES8_NS_13_Utf_iteratorIcDiPKcSB_NS_5_ReplEEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt9__unicode9__v16_0_022_Grapheme_cluster_viewISt17basic_string_viewIcSt11char_traitsIcEEE9_Iterator11_M_is_breakENS0_13_Gcb_propertyES8_NS_13_Utf_iteratorIcDiPKcSB_NS_5_ReplEEE
_ZNKSt9__unicode9__v16_0_022_Grapheme_cluster_viewISt17basic_string_viewIcSt11char_traitsIcEEE9_Iterator11_M_is_breakENS0_13_Gcb_propertyES8_NS_13_Utf_iteratorIcDiPKcSB_NS_5_ReplEEE:
.LFB8214:
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
	subq	$88, %rsp
	.seh_stackalloc	88
	.seh_endprologue
	movl	%edx, %eax
	leal	-1(%rdx), %edx
	movq	%rcx, %r10
	cmpl	$1, %edx
	jbe	.L711
	cmpl	$2, %r8d
	setne	%dl
	cmpl	$3, %eax
	je	.L710
	leal	-1(%r8), %edx
	cmpl	$2, %edx
	jbe	.L711
	leal	-7(%rax), %edx
	cmpl	$5, %edx
	ja	.L714
	leaq	.L716(%rip), %rcx
	movslq	(%rcx,%rdx,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section .rdata,"dr"
	.align 4
.L716:
	.long	.L718-.L716
	.long	.L717-.L716
	.long	.L715-.L716
	.long	.L714-.L716
	.long	.L717-.L716
	.long	.L715-.L716
	.section	.text$_ZNKSt9__unicode9__v16_0_022_Grapheme_cluster_viewISt17basic_string_viewIcSt11char_traitsIcEEE9_Iterator11_M_is_breakENS0_13_Gcb_propertyES8_NS_13_Utf_iteratorIcDiPKcSB_NS_5_ReplEEE,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L711:
	movl	$1, %edx
.L710:
	movl	%edx, %eax
	addq	$88, %rsp
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
.L715:
	cmpl	$9, %r8d
	setne	%dl
	jmp	.L710
	.p2align 4,,10
	.p2align 3
.L717:
	subl	$8, %r8d
	cmpl	$1, %r8d
	seta	%dl
	jmp	.L710
	.p2align 4,,10
	.p2align 3
.L718:
	cmpl	$8, %r8d
	jg	.L719
	cmpl	$6, %r8d
	setle	%dl
	jmp	.L710
	.p2align 4,,10
	.p2align 3
.L714:
	movl	%r8d, %edx
	andl	$-3, %edx
	cmpl	$4, %edx
	sete	%dl
	cmpl	$5, %eax
	sete	%cl
	orl	%ecx, %edx
	cmpl	$10, %r8d
	sete	%cl
	orb	%cl, %dl
	je	.L761
	xorl	%edx, %edx
	jmp	.L710
	.p2align 4,,10
	.p2align 3
.L719:
	subl	$11, %r8d
	cmpl	$1, %r8d
	seta	%dl
	jmp	.L710
	.p2align 4,,10
	.p2align 3
.L761:
	movzbl	10(%r10), %ecx
	movl	%ecx, %r14d
	testb	%cl, %cl
	je	.L720
	movl	(%r10), %ebx
	leal	0(,%rbx,4), %ecx
	cmpl	$3073, %ecx
	ja	.L762
.L720:
	cmpl	$10, %eax
	je	.L763
	cmpl	$13, %eax
	jne	.L711
	cmpl	%r8d, %eax
	jne	.L711
	movzbl	9(%r10), %edx
	notl	%edx
	andl	$1, %edx
	jmp	.L710
	.p2align 4,,10
	.p2align 3
.L763:
	cmpb	$2, 8(%r10)
	setne	%dl
	jmp	.L710
.L762:
	orl	$3, %ecx
	leaq	_ZNSt9__unicode9__v16_0_012__incb_edgesE(%rip), %rdi
	movl	$879, %r11d
	movl	%ecx, %r15d
	jmp	.L722
.L765:
	subq	%rcx, %r11
	leaq	4(%rdi,%rcx,4), %rdi
	subq	$1, %r11
.L721:
	testq	%r11, %r11
	jle	.L764
.L722:
	movq	%r11, %rcx
	sarq	%rcx
	cmpl	%r15d, (%rdi,%rcx,4)
	jb	.L765
	movq	%rcx, %r11
	jmp	.L721
.L764:
	movl	-4(%rdi), %ecx
	andl	$3, %ecx
	cmpl	$1, %ecx
	jne	.L720
	movzbl	28(%r9), %ecx
	movl	%ecx, %ebp
	movl	24(%r9,%rcx,4), %ecx
	sall	$2, %ecx
	cmpl	$3073, %ecx
	jbe	.L720
	orl	$3, %ecx
	leaq	_ZNSt9__unicode9__v16_0_012__incb_edgesE(%rip), %rdi
	movl	$879, %r11d
	movl	%ecx, %ebx
	jmp	.L724
.L767:
	subq	%rcx, %r11
	leaq	4(%rdi,%rcx,4), %rdi
	subq	$1, %r11
.L723:
	testq	%r11, %r11
	jle	.L766
.L724:
	movq	%r11, %rcx
	sarq	%rcx
	cmpl	%ebx, (%rdi,%rcx,4)
	jb	.L767
	movq	%rcx, %r11
	jmp	.L723
.L766:
	movl	-4(%rdi), %ecx
	andl	$3, %ecx
	subl	$1, %ecx
	jne	.L720
	movdqu	16(%r10), %xmm0
	movq	8(%r9), %r12
	xorl	%r13d, %r13d
	movups	%xmm0, 48(%rsp)
	movdqu	32(%r10), %xmm0
	movq	56(%rsp), %r15
	movups	%xmm0, 64(%rsp)
	movzbl	76(%rsp), %edi
	.p2align 4
	.p2align 3
.L725:
	movzbl	%dil, %ecx
	movzbl	77(%rsp), %r9d
	addl	$1, %ecx
	cmpl	%r9d, %ecx
	jge	.L733
	leal	1(%rdi), %r11d
	movb	%r11b, 76(%rsp)
	movl	%r11d, %edi
.L734:
	cmpq	%r12, %r15
	sete	%r9b
	cmpb	%dil, %bpl
	sete	%cl
	testb	%cl, %r9b
	jne	.L736
	movzbl	%dil, %ecx
	movl	72(%rsp,%rcx,4), %r11d
	leaq	_ZNSt9__unicode9__v16_0_014__incb_linkersE(%rip), %rcx
	.p2align 4
	.p2align 3
.L727:
	cmpl	%r11d, (%rcx)
	je	.L726
	leaq	4(%rcx), %r9
	movq	%r9, %rcx
	cmpl	%r11d, (%r9)
	je	.L726
	addq	$4, %rcx
	cmpl	%r11d, (%rcx)
	je	.L726
	leaq	8(%r9), %rcx
	cmpl	%r11d, 8(%r9)
	je	.L726
	leaq	12(%r9), %rcx
	leaq	80+_ZNSt9__unicode9__v16_0_014__incb_linkersE(%rip), %r9
	cmpq	%r9, %rcx
	jne	.L727
.L728:
	sall	$2, %r11d
	cmpl	$3073, %r11d
	jbe	.L720
	orl	$3, %r11d
	leaq	_ZNSt9__unicode9__v16_0_012__incb_edgesE(%rip), %rbx
	movl	$879, %ecx
	movl	%r11d, 44(%rsp)
	jmp	.L732
.L769:
	subq	%r9, %rcx
	leaq	4(%rbx,%r9,4), %rbx
	subq	$1, %rcx
.L731:
	testq	%rcx, %rcx
	jle	.L768
.L732:
	movq	%rcx, %r9
	movl	44(%rsp), %esi
	sarq	%r9
	cmpl	%esi, (%rbx,%r9,4)
	jb	.L769
	movq	%r9, %rcx
	jmp	.L731
	.p2align 4,,10
	.p2align 3
.L726:
	leaq	80+_ZNSt9__unicode9__v16_0_014__incb_linkersE(%rip), %rsi
	cmpq	%rsi, %rcx
	je	.L728
	movl	%r14d, %r13d
	jmp	.L725
.L733:
	movq	64(%rsp), %rcx
	cmpq	%r15, %rcx
	je	.L734
	movzbl	78(%rsp), %r9d
	leaq	(%r15,%r9), %rbx
	movq	%rbx, 56(%rsp)
	movq	%rbx, %r15
	cmpq	%rbx, %rcx
	je	.L770
	leaq	48(%rsp), %rcx
	movl	%r8d, 176(%rsp)
	movl	%eax, 168(%rsp)
	movq	%r10, 160(%rsp)
	movb	%dl, 44(%rsp)
	call	_ZNSt9__unicode13_Utf_iteratorIcDiPKcS2_NS_5_ReplEE12_M_read_utf8Ev.isra.0
	movq	56(%rsp), %r15
	movzbl	76(%rsp), %edi
	movl	176(%rsp), %r8d
	movl	168(%rsp), %eax
	movq	160(%rsp), %r10
	movzbl	44(%rsp), %edx
	jmp	.L734
.L770:
	movb	$0, 76(%rsp)
	xorl	%edi, %edi
	jmp	.L734
.L768:
	movl	-4(%rbx), %ecx
	andl	$3, %ecx
	cmpl	$1, %ecx
	je	.L746
	cmpl	$2, %ecx
	je	.L725
	jmp	.L720
	.p2align 4,,10
	.p2align 3
.L746:
	xorl	%r13d, %r13d
	jmp	.L725
.L736:
	testb	%r13b, %r13b
	jne	.L710
	jmp	.L720
	.seh_endproc
	.section	.text$_ZNSt9__unicode9__v16_0_022_Grapheme_cluster_viewISt17basic_string_viewIcSt11char_traitsIcEEE9_IteratorppEv,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt9__unicode9__v16_0_022_Grapheme_cluster_viewISt17basic_string_viewIcSt11char_traitsIcEEE9_IteratorppEv
	.def	_ZNSt9__unicode9__v16_0_022_Grapheme_cluster_viewISt17basic_string_viewIcSt11char_traitsIcEEE9_IteratorppEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt9__unicode9__v16_0_022_Grapheme_cluster_viewISt17basic_string_viewIcSt11char_traitsIcEEE9_IteratorppEv
_ZNSt9__unicode9__v16_0_022_Grapheme_cluster_viewISt17basic_string_viewIcSt11char_traitsIcEEE9_IteratorppEv:
.LFB8043:
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
	subq	$104, %rsp
	.seh_stackalloc	104
	.seh_endprologue
	movq	32(%rcx), %rdi
	movq	24(%rcx), %r13
	movq	%rcx, %rsi
	cmpq	%r13, %rdi
	je	.L772
	movdqu	16(%rcx), %xmm0
	movl	4(%rcx), %r14d
	leaq	_ZNSt9__unicode9__v16_0_011__gcb_edgesE(%rip), %rbp
	movups	%xmm0, 64(%rsp)
	movdqu	32(%rcx), %xmm0
	movups	%xmm0, 80(%rsp)
	movzbl	92(%rsp), %r12d
	movzbl	93(%rsp), %edx
	movzbl	%r12b, %eax
	addl	$1, %eax
	cmpl	%edx, %eax
	jge	.L794
	.p2align 4
	.p2align 3
.L823:
	addl	$1, %r12d
	movb	%r12b, 92(%rsp)
.L795:
	cmpq	%r13, %rdi
	je	.L793
	movzbl	92(%rsp), %eax
	movq	%rbp, %r8
	movl	88(%rsp,%rax,4), %ebx
	movq	%rax, %r12
	movl	$1734, %eax
	movl	%ebx, %r9d
	sall	$4, %r9d
	orl	$15, %r9d
	jmp	.L775
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L820:
	subq	%rdx, %rax
	leaq	4(%r8,%rdx,4), %r8
	subq	$1, %rax
	testq	%rax, %rax
	jle	.L819
.L775:
	movq	%rax, %rdx
	sarq	%rdx
	cmpl	%r9d, (%r8,%rdx,4)
	jb	.L820
	movq	%rdx, %rax
	testq	%rax, %rax
	jg	.L775
.L819:
	movl	-4(%r8), %r15d
	movzbl	8(%rsi), %eax
	andl	$15, %r15d
	cmpb	$3, %al
	je	.L776
	cmpb	$1, %al
	je	.L777
	cmpl	$10, %r15d
	je	.L821
	cmpl	$4, %r15d
	je	.L783
.L784:
	movb	$3, 8(%rsi)
.L776:
	cmpl	$13, %r15d
	jne	.L783
	movzbl	9(%rsi), %eax
	addl	$1, %eax
.L789:
	movb	%al, 9(%rsi)
	leaq	_ZNSt9__unicode9__v16_0_014__incb_linkersE(%rip), %rax
	leaq	80(%rax), %rcx
	.p2align 4
	.p2align 3
.L791:
	cmpl	%ebx, (%rax)
	je	.L790
	leaq	4(%rax), %rdx
	movq	%rdx, %rax
	cmpl	%ebx, (%rdx)
	je	.L790
	addq	$4, %rax
	cmpl	%ebx, (%rax)
	je	.L790
	leaq	8(%rdx), %rax
	cmpl	%ebx, 8(%rdx)
	je	.L790
	leaq	12(%rdx), %rax
	cmpq	%rcx, %rax
	jne	.L791
.L792:
	movdqu	64(%rsp), %xmm0
	movl	%r15d, %r8d
	movl	%r14d, %edx
	movq	%rsi, %rcx
	leaq	32(%rsp), %r9
	movups	%xmm0, 32(%rsp)
	movdqu	80(%rsp), %xmm0
	movups	%xmm0, 48(%rsp)
	call	_ZNKSt9__unicode9__v16_0_022_Grapheme_cluster_viewISt17basic_string_viewIcSt11char_traitsIcEEE9_Iterator11_M_is_breakENS0_13_Gcb_propertyES8_NS_13_Utf_iteratorIcDiPKcSB_NS_5_ReplEEE
	testb	%al, %al
	jne	.L822
	movzbl	%r12b, %eax
	movzbl	93(%rsp), %edx
	movl	%r15d, %r14d
	addl	$1, %eax
	cmpl	%edx, %eax
	jl	.L823
.L794:
	cmpq	%r13, %rdi
	je	.L793
	movzbl	94(%rsp), %eax
	addq	%r13, %rax
	movq	%rax, 72(%rsp)
	cmpq	%rax, %rdi
	je	.L824
	leaq	64(%rsp), %rcx
	call	_ZNSt9__unicode13_Utf_iteratorIcDiPKcS2_NS_5_ReplEE12_M_read_utf8Ev.isra.0
	movq	72(%rsp), %r13
	jmp	.L795
	.p2align 4,,10
	.p2align 3
.L790:
	cmpq	%rcx, %rax
	je	.L792
	movb	$1, 10(%rsi)
	jmp	.L792
	.p2align 4,,10
	.p2align 3
.L777:
	testl	%r15d, %r15d
	jne	.L784
	cmpl	$168, %ebx
	ja	.L825
.L780:
	movb	$3, 8(%rsi)
.L783:
	xorl	%eax, %eax
	jmp	.L789
	.p2align 4,,10
	.p2align 3
.L821:
	cmpb	$2, %al
	je	.L779
	movl	(%rsi), %edx
	cmpl	$168, %edx
	jbe	.L780
	leaq	_ZNSt9__unicode9__v16_0_014__xpicto_edgesE(%rip), %rcx
	movl	$312, %eax
	movq	%rcx, %r10
	jmp	.L782
.L827:
	subq	%r8, %rax
	leaq	4(%r10,%r8,4), %r10
	subq	$1, %rax
.L781:
	testq	%rax, %rax
	jle	.L826
.L782:
	movq	%rax, %r8
	sarq	%r8
	cmpl	(%r10,%r8,4), %edx
	jnb	.L827
	movq	%r8, %rax
	jmp	.L781
	.p2align 4,,10
	.p2align 3
.L824:
	movb	$0, 92(%rsp)
.L793:
	movdqu	64(%rsp), %xmm0
	movups	%xmm0, 16(%rsi)
	movdqu	79(%rsp), %xmm0
	movups	%xmm0, 31(%rsi)
.L772:
	movq	%rsi, %rax
	addq	$104, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L826:
	subq	%rcx, %r10
	andl	$4, %r10d
	je	.L780
.L779:
	movb	$1, 8(%rsi)
	xorl	%eax, %eax
	jmp	.L789
.L822:
	xorl	%eax, %eax
	movl	%ebx, (%rsi)
	movl	%r15d, 4(%rsi)
	movw	%ax, 8(%rsi)
	movb	$0, 10(%rsi)
	jmp	.L793
.L825:
	leaq	_ZNSt9__unicode9__v16_0_014__xpicto_edgesE(%rip), %rcx
	movl	$312, %eax
	movq	%rcx, %r9
	jmp	.L786
.L829:
	subq	%rdx, %rax
	leaq	4(%r9,%rdx,4), %r9
	subq	$1, %rax
.L785:
	testq	%rax, %rax
	jle	.L828
.L786:
	movq	%rax, %rdx
	sarq	%rdx
	cmpl	(%r9,%rdx,4), %ebx
	jnb	.L829
	movq	%rdx, %rax
	jmp	.L785
.L828:
	subq	%rcx, %r9
	andl	$4, %r9d
	je	.L780
	movb	$2, 8(%rsi)
	xorl	%eax, %eax
	jmp	.L789
	.seh_endproc
	.section	.text$_ZNSt8__format10__truncateIcEEyRSt17basic_string_viewIT_St11char_traitsIS2_EEy,"x"
	.linkonce discard
	.p2align 4
	.globl	_ZNSt8__format10__truncateIcEEyRSt17basic_string_viewIT_St11char_traitsIS2_EEy
	.def	_ZNSt8__format10__truncateIcEEyRSt17basic_string_viewIT_St11char_traitsIS2_EEy;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format10__truncateIcEEyRSt17basic_string_viewIT_St11char_traitsIS2_EEy
_ZNSt8__format10__truncateIcEEyRSt17basic_string_viewIT_St11char_traitsIS2_EEy:
.LFB7905:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
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
	subq	$208, %rsp
	.seh_stackalloc	208
	.seh_endprologue
	movq	(%rcx), %rbx
	movq	%rcx, %rbp
	movq	%rdx, %rdi
	cmpq	$-1, %rdx
	jne	.L883
	testq	%rbx, %rbx
	je	.L830
	movq	8(%rcx), %rax
	xorl	%edx, %edx
	leaq	80(%rsp), %rcx
	movb	$0, 110(%rsp)
	movw	%dx, 108(%rsp)
	movq	%rax, %xmm0
	leaq	(%rax,%rbx), %rdi
	punpcklqdq	%xmm0, %xmm0
	movq	%rdi, 96(%rsp)
	movups	%xmm0, 80(%rsp)
	call	_ZNSt9__unicode13_Utf_iteratorIcDiPKcS2_NS_5_ReplEE12_M_read_utf8Ev.isra.0
	movdqu	80(%rsp), %xmm1
	movdqu	96(%rsp), %xmm0
	movups	%xmm1, 160(%rsp)
	movups	%xmm0, 176(%rsp)
	movups	%xmm1, 128(%rsp)
	movups	%xmm0, 144(%rsp)
	cmpq	%rdi, 88(%rsp)
	je	.L847
	movzbl	188(%rsp), %eax
	leaq	_ZNSt9__unicode9__v16_0_011__gcb_edgesE(%rip), %r8
	movl	184(%rsp,%rax,4), %esi
	movl	$1734, %eax
	movl	%esi, %r9d
	sall	$4, %r9d
	orl	$15, %r9d
	jmp	.L849
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L885:
	subq	%rdx, %rax
	leaq	4(%r8,%rdx,4), %r8
	subq	$1, %rax
	testq	%rax, %rax
	jle	.L884
.L849:
	movq	%rax, %rdx
	sarq	%rdx
	cmpl	%r9d, (%r8,%rdx,4)
	jb	.L885
	movq	%rdx, %rax
	testq	%rax, %rax
	jg	.L849
.L884:
	movl	-4(%r8), %r12d
	andl	$15, %r12d
.L847:
	xorl	%eax, %eax
	movl	%esi, 112(%rsp)
	movl	$1, %ebx
	movl	%r12d, 116(%rsp)
	movw	%ax, 120(%rsp)
	movb	$0, 122(%rsp)
	movdqu	112(%rsp), %xmm0
	movups	%xmm0, 160(%rsp)
	movdqu	128(%rsp), %xmm0
	movups	%xmm0, 176(%rsp)
	movdqu	144(%rsp), %xmm0
	movups	%xmm0, 192(%rsp)
	cmpl	$4351, %esi
	jbe	.L853
	jmp	.L886
	.p2align 4,,10
	.p2align 3
.L857:
	movl	160(%rsp), %edx
	movl	$1, %eax
	cmpl	$4351, %edx
	ja	.L887
.L854:
	addq	%rax, %rbx
.L853:
	leaq	160(%rsp), %rcx
	call	_ZNSt9__unicode9__v16_0_022_Grapheme_cluster_viewISt17basic_string_viewIcSt11char_traitsIcEEE9_IteratorppEv
	cmpq	%rdi, 24(%rax)
	jne	.L857
.L830:
	movq	%rbx, %rax
	addq	$208, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L883:
	testq	%rbx, %rbx
	je	.L830
	movq	8(%rcx), %rax
	xorl	%r8d, %r8d
	leaq	48(%rsp), %rcx
	movl	%r10d, 44(%rsp)
	movw	%r8w, 76(%rsp)
	movq	%rax, %xmm2
	leaq	(%rax,%rbx), %r12
	movb	$0, 78(%rsp)
	movq	%rax, %r15
	movddup	%xmm2, %xmm0
	movq	%r12, 64(%rsp)
	movups	%xmm0, 48(%rsp)
	call	_ZNSt9__unicode13_Utf_iteratorIcDiPKcS2_NS_5_ReplEE12_M_read_utf8Ev.isra.0
	movdqu	48(%rsp), %xmm1
	movdqu	64(%rsp), %xmm0
	cmpq	56(%rsp), %r12
	movl	44(%rsp), %r10d
	movups	%xmm1, 160(%rsp)
	movups	%xmm0, 176(%rsp)
	movups	%xmm1, 128(%rsp)
	movups	%xmm0, 144(%rsp)
	je	.L833
	movzbl	188(%rsp), %eax
	leaq	_ZNSt9__unicode9__v16_0_011__gcb_edgesE(%rip), %r8
	movl	184(%rsp,%rax,4), %r10d
	movl	$1734, %eax
	movl	%r10d, %r9d
	sall	$4, %r9d
	orl	$15, %r9d
	jmp	.L835
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L889:
	subq	%rdx, %rax
	leaq	4(%r8,%rdx,4), %r8
	subq	$1, %rax
	testq	%rax, %rax
	jle	.L888
.L835:
	movq	%rax, %rdx
	sarq	%rdx
	cmpl	%r9d, (%r8,%rdx,4)
	jb	.L889
	movq	%rdx, %rax
	testq	%rax, %rax
	jg	.L835
.L888:
	movl	-4(%r8), %eax
	andl	$15, %eax
	movl	%eax, %r14d
.L833:
	xorl	%ecx, %ecx
	movl	%r10d, 112(%rsp)
	movl	$1, %ebx
	movl	%r14d, 116(%rsp)
	movw	%cx, 120(%rsp)
	movb	$0, 122(%rsp)
	movdqu	112(%rsp), %xmm0
	movups	%xmm0, 160(%rsp)
	movdqu	128(%rsp), %xmm0
	movups	%xmm0, 176(%rsp)
	movdqu	144(%rsp), %xmm0
	movups	%xmm0, 192(%rsp)
	cmpl	$4351, %r10d
	ja	.L890
.L836:
	cmpq	%rbx, %rdi
	jnb	.L839
	jmp	.L891
	.p2align 4,,10
	.p2align 3
.L840:
	addq	%rbx, %rax
	cmpq	%rax, %rdi
	jb	.L892
.L863:
	movq	%rax, %rbx
.L839:
	leaq	160(%rsp), %rcx
	call	_ZNSt9__unicode9__v16_0_022_Grapheme_cluster_viewISt17basic_string_viewIcSt11char_traitsIcEEE9_IteratorppEv
	cmpq	%r12, 24(%rax)
	je	.L830
	movl	160(%rsp), %edx
	movl	$1, %eax
	cmpl	$4351, %edx
	jbe	.L840
	leaq	_ZNSt9__unicode9__v16_0_013__width_edgesE(%rip), %r9
	movl	$208, %eax
	movq	%r9, %r10
	jmp	.L842
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L894:
	subq	%rcx, %rax
	leaq	4(%r10,%rcx,4), %r10
	subq	$1, %rax
	testq	%rax, %rax
	jle	.L893
.L842:
	movq	%rax, %rcx
	sarq	%rcx
	cmpl	(%r10,%rcx,4), %edx
	jnb	.L894
	movq	%rcx, %rax
	testq	%rax, %rax
	jg	.L842
.L893:
	subq	%r9, %r10
	movq	%r10, %rax
	shrq	$63, %r10
	sarq	$2, %rax
	addq	%r10, %rax
	andl	$1, %eax
	subq	%r10, %rax
	addl	$1, %eax
	addq	%rbx, %rax
	cmpq	%rax, %rdi
	jnb	.L863
	.p2align 4
	.p2align 3
.L892:
	movq	184(%rsp), %rax
	subq	%r15, %rax
	movq	%rax, 0(%rbp)
	jmp	.L830
	.p2align 4,,10
	.p2align 3
.L887:
	leaq	_ZNSt9__unicode9__v16_0_013__width_edgesE(%rip), %r9
	movl	$208, %eax
	movq	%r9, %r10
	jmp	.L856
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L896:
	subq	%rcx, %rax
	leaq	4(%r10,%rcx,4), %r10
	subq	$1, %rax
	testq	%rax, %rax
	jle	.L895
.L856:
	movq	%rax, %rcx
	sarq	%rcx
	cmpl	(%r10,%rcx,4), %edx
	jnb	.L896
	movq	%rcx, %rax
	testq	%rax, %rax
	jg	.L856
.L895:
	subq	%r9, %r10
	movq	%r10, %rax
	shrq	$63, %r10
	sarq	$2, %rax
	addq	%r10, %rax
	andl	$1, %eax
	subq	%r10, %rax
	addl	$1, %eax
	jmp	.L854
	.p2align 4,,10
	.p2align 3
.L891:
	movq	$0, 0(%rbp)
	xorl	%ebx, %ebx
	movq	$0, 8(%rbp)
	jmp	.L830
	.p2align 4,,10
	.p2align 3
.L886:
	leaq	_ZNSt9__unicode9__v16_0_013__width_edgesE(%rip), %r9
	movl	$208, %eax
	movq	%r9, %r8
	jmp	.L852
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L898:
	subq	%rdx, %rax
	leaq	4(%r8,%rdx,4), %r8
	subq	$1, %rax
.L851:
	testq	%rax, %rax
	jle	.L897
.L852:
	movq	%rax, %rdx
	sarq	%rdx
	cmpl	(%r8,%rdx,4), %esi
	jnb	.L898
	movq	%rdx, %rax
	jmp	.L851
	.p2align 4,,10
	.p2align 3
.L897:
	subq	%r9, %r8
	movq	%r8, %rax
	shrq	$63, %r8
	sarq	$2, %rax
	addq	%r8, %rax
	andl	$1, %eax
	subq	%r8, %rax
	leal	1(%rax), %ebx
	jmp	.L853
	.p2align 4,,10
	.p2align 3
.L890:
	leaq	_ZNSt9__unicode9__v16_0_013__width_edgesE(%rip), %r9
	movl	$208, %eax
	movq	%r9, %r8
	jmp	.L838
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L900:
	subq	%rdx, %rax
	leaq	4(%r8,%rdx,4), %r8
	subq	$1, %rax
.L837:
	testq	%rax, %rax
	jle	.L899
.L838:
	movq	%rax, %rdx
	sarq	%rdx
	cmpl	(%r8,%rdx,4), %r10d
	jnb	.L900
	movq	%rdx, %rax
	jmp	.L837
	.p2align 4,,10
	.p2align 3
.L899:
	subq	%r9, %r8
	movq	%r8, %rax
	shrq	$63, %r8
	sarq	$2, %rax
	addq	%r8, %rax
	andl	$1, %eax
	subq	%r8, %rax
	leal	1(%rax), %ebx
	jmp	.L836
	.seh_endproc
	.section	.text$_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE15_M_force_updateEv,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE15_M_force_updateEv
	.def	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE15_M_force_updateEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE15_M_force_updateEv
_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE15_M_force_updateEv:
.LFB8192:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$104, %rsp
	.seh_stackalloc	104
	.seh_endprologue
	movq	8(%rcx), %r9
	movq	24(%rcx), %r8
	movq	296(%rcx), %rdx
	subq	%r9, %r8
	movq	%rcx, %rbx
	testq	%rdx, %rdx
	je	.L902
	testq	%r8, %r8
	jne	.L938
	movq	288(%rcx), %r9
	movq	%rdx, %r8
.L902:
	movq	328(%rbx), %rsi
	leaq	80(%rsp), %rcx
	movq	%r8, 80(%rsp)
	movq	%r9, 88(%rsp)
	movq	%rsi, %rdx
	call	_ZNSt8__format10__truncateIcEEyRSt17basic_string_viewIT_St11char_traitsIS2_EEy
	movq	80(%rsp), %r10
	movq	88(%rsp), %rdx
	movq	%rax, 344(%rbx)
	cmpq	%rsi, %rax
	jnb	.L939
.L909:
	cmpq	320(%rbx), %rax
	jb	.L924
	movq	328(%rbx), %rdx
	cmpq	%rdx, %rax
	setb	%al
	cmpq	$-1, %rdx
	setne	%dl
	andb	%dl, %al
	jne	.L901
.L925:
	movq	336(%rbx), %rsi
	testq	%r10, %r10
	jne	.L940
.L920:
	movq	(%rsi), %rax
	leaq	_ZNKSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE13_M_discardingEv(%rip), %rdx
	movq	%rsi, 336(%rbx)
	movq	24(%rax), %rax
	cmpq	%rdx, %rax
	je	.L941
	leaq	_ZNKSt8__format5_SinkIcE13_M_discardingEv(%rip), %rdx
	cmpq	%rdx, %rax
	jne	.L942
.L923:
	movq	$256, 16(%rbx)
	leaq	32(%rbx), %rax
	movq	%rax, 8(%rbx)
	movq	%rax, 24(%rbx)
	xorl	%eax, %eax
.L901:
	addq	$104, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L939:
	movq	288(%rbx), %rcx
	cmpq	%rcx, %rdx
	je	.L943
	leaq	32(%rbx), %rdx
	movq	$256, 16(%rbx)
	movq	%rdx, 8(%rbx)
	addq	%r10, %rdx
	movq	%rdx, 24(%rbx)
.L917:
	cmpq	320(%rbx), %rax
	jnb	.L925
.L924:
	movl	$1, %eax
	addq	$104, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L938:
	movabsq	$9223372036854775806, %rax
	subq	%rdx, %rax
	cmpq	%r8, %rax
	jb	.L944
	movq	288(%rcx), %rcx
	leaq	304(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L926
	movq	304(%rbx), %rax
.L905:
	leaq	(%r8,%rdx), %rsi
	cmpq	%rsi, %rax
	jb	.L906
	addq	%rdx, %rcx
	cmpq	$1, %r8
	je	.L945
	movq	%r9, %rdx
	call	memcpy
	jmp	.L937
	.p2align 4,,10
	.p2align 3
.L942:
	movq	%rsi, %rcx
	call	*%rax
	testb	%al, %al
	je	.L923
.L922:
	movq	344(%rbx), %rax
	movq	%rax, 328(%rbx)
	jmp	.L923
	.p2align 4,,10
	.p2align 3
.L940:
	movdqu	80(%rsp), %xmm0
	leaq	64(%rsp), %rdx
	movq	%rsi, %rcx
	movups	%xmm0, 64(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	jmp	.L920
	.p2align 4,,10
	.p2align 3
.L906:
	movq	%r8, 32(%rsp)
	leaq	288(%rbx), %rcx
	xorl	%r8d, %r8d
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
.L937:
	movq	288(%rbx), %rax
	movq	%rsi, %r8
	movb	$0, (%rax,%rsi)
	movq	8(%rbx), %rax
	movq	%rsi, 296(%rbx)
	movq	288(%rbx), %r9
	movq	%rax, 24(%rbx)
	jmp	.L902
	.p2align 4,,10
	.p2align 3
.L941:
	movq	328(%rsi), %rax
	cmpq	%rax, 344(%rsi)
	jnb	.L922
	jmp	.L923
	.p2align 4,,10
	.p2align 3
.L943:
	movq	296(%rbx), %rsi
	cmpq	%r10, %rsi
	jb	.L946
	cmpq	%rsi, %r10
	jnb	.L917
	movb	$0, (%rdx,%r10)
	movq	344(%rbx), %rax
	movq	%r10, 296(%rbx)
	jmp	.L909
	.p2align 4,,10
	.p2align 3
.L946:
	movabsq	$9223372036854775806, %rax
	movq	%r10, %r11
	subq	%rsi, %r11
	subq	%rsi, %rax
	cmpq	%r11, %rax
	jb	.L947
	leaq	304(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L927
	movq	304(%rbx), %rax
.L913:
	cmpq	%r10, %rax
	jb	.L948
.L914:
	addq	%rsi, %rcx
	cmpq	$1, %r11
	je	.L949
	movq	%r11, %r8
	xorl	%edx, %edx
	movq	%r10, 48(%rsp)
	call	memset
	movq	48(%rsp), %r10
.L916:
	movq	288(%rbx), %rax
	movb	$0, (%rax,%r10)
	movq	344(%rbx), %rax
	movq	%r10, 296(%rbx)
	jmp	.L909
	.p2align 4,,10
	.p2align 3
.L945:
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	jmp	.L937
	.p2align 4,,10
	.p2align 3
.L926:
	movl	$15, %eax
	jmp	.L905
.L949:
	movb	$0, (%rcx)
	jmp	.L916
.L948:
	movq	%r11, 32(%rsp)
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movq	%rsi, %rdx
	leaq	288(%rbx), %rcx
	movq	%r10, 56(%rsp)
	movq	%r11, 48(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	movq	56(%rsp), %r10
	movq	48(%rsp), %r11
	movq	288(%rbx), %rcx
	jmp	.L914
.L927:
	movl	$15, %eax
	jmp	.L913
.L944:
	leaq	.LC9(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L947:
	leaq	.LC10(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE7_M_bumpEy,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE7_M_bumpEy
	.def	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE7_M_bumpEy;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE7_M_bumpEy
_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE7_M_bumpEy:
.LFB8304:
	.seh_endprologue
	movq	344(%rcx), %r8
	movq	328(%rcx), %rax
	cmpq	%rax, %r8
	jnb	.L950
	movq	320(%rcx), %r9
	addq	%rdx, 24(%rcx)
	cmpq	%r9, %r8
	jb	.L953
	cmpq	$-1, %rax
	je	.L950
.L953:
	addq	%r8, %rdx
	cmpq	%r9, %rax
	cmova	%r9, %rax
	movq	%rdx, 344(%rcx)
	cmpq	%rax, %rdx
	jb	.L950
	jmp	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE15_M_force_updateEv
	.p2align 4,,10
	.p2align 3
.L950:
	ret
	.seh_endproc
	.section	.text$_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	.def	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE:
.LFB7851:
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
	subq	$88, %rsp
	.seh_stackalloc	88
	.seh_endprologue
	movq	(%rdx), %rdi
	movq	8(%rdx), %r15
	movq	%rcx, %rbx
	movq	24(%rcx), %rcx
	movq	16(%rbx), %rsi
	movq	%rcx, %rax
	subq	8(%rbx), %rax
	subq	%rax, %rsi
	cmpq	%rsi, %rdi
	jb	.L958
	leaq	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE11_M_overflowEv(%rip), %rbp
	leaq	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE11_M_overflowEv(%rip), %r12
	leaq	_ZNSt8__format14_Fixedbuf_sinkIcE11_M_overflowEv(%rip), %r13
	jmp	.L983
	.p2align 4,,10
	.p2align 3
.L982:
	movq	%rbx, %rcx
	call	*%rax
	movq	24(%rbx), %rcx
	movq	%rcx, %r8
	subq	8(%rbx), %r8
.L962:
	addq	%rsi, %r15
	subq	%rsi, %rdi
	movq	16(%rbx), %rsi
	subq	%r8, %rsi
	cmpq	%rsi, %rdi
	jb	.L958
.L983:
	testq	%rsi, %rsi
	je	.L959
	movq	%rsi, %r8
	movq	%r15, %rdx
	call	memcpy
.L959:
	movq	(%rbx), %rax
	movq	24(%rbx), %r10
	movq	(%rax), %rax
	addq	%rsi, %r10
	movq	%r10, 24(%rbx)
	cmpq	%rbp, %rax
	je	.L1007
	cmpq	%r12, %rax
	je	.L1008
	cmpq	%r13, %rax
	jne	.L982
.L1006:
	movq	8(%rbx), %rcx
.L1005:
	movq	%rcx, 24(%rbx)
	xorl	%r8d, %r8d
	jmp	.L962
	.p2align 4,,10
	.p2align 3
.L1008:
	movq	8(%rbx), %r9
	movq	%r10, %r8
	subq	%r9, %r8
	je	.L990
	movq	296(%rbx), %rdx
	movabsq	$9223372036854775806, %rax
	subq	%rdx, %rax
	cmpq	%r8, %rax
	jb	.L977
	movq	288(%rbx), %rcx
	leaq	304(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L989
	movq	304(%rbx), %rax
.L978:
	leaq	(%r8,%rdx), %r10
	cmpq	%r10, %rax
	jb	.L979
	addq	%rdx, %rcx
	cmpq	$1, %r8
	je	.L1009
	movq	%r9, %rdx
	movq	%r10, 56(%rsp)
	call	memcpy
	movq	56(%rsp), %r10
	jmp	.L981
	.p2align 4,,10
	.p2align 3
.L1007:
	movq	344(%rbx), %rax
	movq	328(%rbx), %rdx
	movq	8(%rbx), %rcx
	cmpq	%rdx, %rax
	jnb	.L1005
	movq	320(%rbx), %r9
	movq	%r10, %r8
	subq	%rcx, %r8
	cmpq	%r9, %rax
	jb	.L963
	cmpq	$-1, %rdx
	je	.L1010
.L963:
	addq	%r8, %rax
	cmpq	%r9, %rdx
	cmova	%r9, %rdx
	movq	%rax, 344(%rbx)
	cmpq	%rdx, %rax
	jb	.L968
	movq	%rbx, %rcx
	call	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE15_M_force_updateEv
	movq	24(%rbx), %rcx
	movq	8(%rbx), %r9
	movq	%rcx, %r8
	subq	%r9, %r8
	testb	%al, %al
	je	.L962
	testq	%r8, %r8
	je	.L962
	movq	296(%rbx), %rdx
	leaq	288(%rbx), %rax
	movq	%r9, %rcx
	jmp	.L985
	.p2align 4,,10
	.p2align 3
.L958:
	testq	%rdi, %rdi
	jne	.L1011
.L957:
	addq	$88, %rsp
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
.L979:
	movq	%r8, 32(%rsp)
	leaq	288(%rbx), %rcx
	xorl	%r8d, %r8d
	movq	%r10, 56(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	movq	56(%rsp), %r10
.L981:
	movq	288(%rbx), %rax
	movb	$0, (%rax,%r10)
	movq	%r10, 296(%rbx)
	jmp	.L1006
	.p2align 4,,10
	.p2align 3
.L1011:
	movq	%rdi, %r8
	movq	%r15, %rdx
	call	memcpy
	addq	%rdi, 24(%rbx)
	jmp	.L957
	.p2align 4,,10
	.p2align 3
.L989:
	movl	$15, %eax
	jmp	.L978
	.p2align 4,,10
	.p2align 3
.L1010:
	movq	336(%rbx), %rax
	cmpq	%rcx, %r10
	jne	.L1012
.L964:
	movq	(%rax), %rdx
	leaq	_ZNKSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE13_M_discardingEv(%rip), %rcx
	movq	%rax, 336(%rbx)
	movq	24(%rdx), %rdx
	cmpq	%rcx, %rdx
	je	.L1013
	leaq	_ZNKSt8__format5_SinkIcE13_M_discardingEv(%rip), %rcx
	cmpq	%rcx, %rdx
	je	.L1006
	movq	%rax, %rcx
	call	*%rdx
	testb	%al, %al
	je	.L1006
.L966:
	movq	344(%rbx), %rax
	movq	%rax, 328(%rbx)
	jmp	.L1006
	.p2align 4,,10
	.p2align 3
.L1009:
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	jmp	.L981
	.p2align 4,,10
	.p2align 3
.L990:
	movq	%r10, %rcx
	jmp	.L962
	.p2align 4,,10
	.p2align 3
.L968:
	testq	%r8, %r8
	je	.L990
	movq	296(%rbx), %rdx
	leaq	288(%rbx), %rax
.L985:
	movabsq	$9223372036854775806, %r9
	subq	%rdx, %r9
	cmpq	%r8, %r9
	jb	.L977
	movq	288(%rbx), %r9
	leaq	304(%rbx), %r10
	cmpq	%r10, %r9
	je	.L987
	movq	304(%rbx), %r11
.L972:
	leaq	(%rdx,%r8), %r10
	cmpq	%r10, %r11
	jb	.L973
	addq	%rdx, %r9
	cmpq	$1, %r8
	je	.L1014
	movq	%rcx, %rdx
	movq	%r9, %rcx
	movq	%r10, 56(%rsp)
	call	memcpy
	movq	56(%rsp), %r10
	jmp	.L981
.L973:
	movq	%r8, 32(%rsp)
	movq	%rcx, %r9
	xorl	%r8d, %r8d
	movq	%rax, %rcx
	movq	%r10, 56(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	movq	56(%rsp), %r10
	jmp	.L981
.L1012:
	movq	%rcx, 72(%rsp)
	leaq	64(%rsp), %rdx
	movq	%rax, %rcx
	movq	%rax, 56(%rsp)
	movq	%r8, 64(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	movq	56(%rsp), %rax
	jmp	.L964
.L1014:
	movzbl	(%rcx), %eax
	movb	%al, (%r9)
	jmp	.L981
.L1013:
	movq	328(%rax), %rdx
	cmpq	%rdx, 344(%rax)
	jnb	.L966
	jmp	.L1006
.L987:
	movl	$15, %r11d
	jmp	.L972
.L977:
	leaq	.LC9(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcE11_M_on_charsEPKc,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcE11_M_on_charsEPKc
	.def	_ZNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcE11_M_on_charsEPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcE11_M_on_charsEPKc
_ZNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcE11_M_on_charsEPKc:
.LFB7370:
	subq	$72, %rsp
	.seh_stackalloc	72
	.seh_endprologue
	movq	8(%rcx), %rax
	movq	56(%rcx), %r8
	movq	16(%r8), %rcx
	subq	%rax, %rdx
	jne	.L1020
	movq	%rcx, 16(%r8)
	addq	$72, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L1020:
	movq	%rdx, 48(%rsp)
	leaq	48(%rsp), %rdx
	movq	%r8, 40(%rsp)
	movq	%rcx, 32(%rsp)
	movq	%rax, 56(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	movq	40(%rsp), %r8
	movq	32(%rsp), %rcx
	movq	%rcx, 16(%r8)
	addq	$72, %rsp
	ret
	.seh_endproc
	.section	.text$_ZNSt8__format14__write_paddedINS_10_Sink_iterIcEEcEET_S3_St17basic_string_viewIT0_St11char_traitsIS5_EENS_6_AlignEyDi,"x"
	.linkonce discard
	.p2align 4
	.globl	_ZNSt8__format14__write_paddedINS_10_Sink_iterIcEEcEET_S3_St17basic_string_viewIT0_St11char_traitsIS5_EENS_6_AlignEyDi
	.def	_ZNSt8__format14__write_paddedINS_10_Sink_iterIcEEcEET_S3_St17basic_string_viewIT0_St11char_traitsIS5_EENS_6_AlignEyDi;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format14__write_paddedINS_10_Sink_iterIcEEcEET_S3_St17basic_string_viewIT0_St11char_traitsIS5_EENS_6_AlignEyDi
_ZNSt8__format14__write_paddedINS_10_Sink_iterIcEEcEET_S3_St17basic_string_viewIT0_St11char_traitsIS5_EENS_6_AlignEyDi:
.LFB7884:
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
	subq	$200, %rsp
	.seh_stackalloc	200
	.seh_endprologue
	movq	(%rdx), %r14
	movq	8(%rdx), %r15
	movl	304(%rsp), %eax
	movb	$0, 64(%rsp)
	movq	%rcx, %rsi
	movq	%r9, %rbx
	cmpb	$3, %r8b
	je	.L1136
	cmpb	$2, %r8b
	je	.L1064
	cmpl	$127, %eax
	ja	.L1065
	cmpq	$31, %r9
	ja	.L1137
	testq	%r9, %r9
	je	.L1028
	movzbl	%al, %eax
	movl	%r9d, %ecx
	leaq	64(%rsp), %r13
	movabsq	$72340172838076673, %rdx
	imulq	%rdx, %rax
	andl	$63, %ecx
	je	.L1030
	xorl	%edx, %edx
.L1029:
	movl	%edx, %r8d
	addl	$1, %edx
	movb	%al, 0(%r13,%r8)
	cmpl	%ecx, %edx
	jb	.L1029
.L1030:
	leaq	32(%rsp), %r12
	testq	%r14, %r14
	je	.L1031
	movq	%r12, %rdx
	movq	%rsi, %rcx
	movq	%r14, 32(%rsp)
	movq	%r15, 40(%rsp)
.LEHB8:
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
.L1031:
	movq	%rbx, %rdi
.L1032:
	movq	%r12, %rdx
	movq	%rsi, %rcx
	movq	%rdi, 32(%rsp)
	movq	%r13, 40(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	jmp	.L1088
	.p2align 4,,10
	.p2align 3
.L1064:
	movq	%r9, %rbp
	xorl	%edi, %edi
.L1023:
	cmpl	$127, %eax
	ja	.L1024
	cmpq	$31, %rbx
	ja	.L1067
	testq	%rbx, %rbx
	jne	.L1050
	testq	%rbp, %rbp
	je	.L1138
.L1081:
	.p2align 1
	.p2align 4
	.p2align 3
.L1058:
	jmp	.L1058
	.p2align 4,,10
	.p2align 3
.L1067:
	movl	$32, %ebx
.L1050:
	movzbl	%al, %eax
	movl	%ebx, %ecx
	leaq	64(%rsp), %r13
	movabsq	$72340172838076673, %rdx
	imulq	%rdx, %rax
	andl	$63, %ecx
	je	.L1055
	xorl	%edx, %edx
.L1054:
	movl	%edx, %r8d
	addl	$1, %edx
	movb	%al, 0(%r13,%r8)
	cmpl	%ecx, %edx
	jb	.L1054
.L1055:
	testq	%rbp, %rbp
	je	.L1056
	leaq	32(%rsp), %r12
	cmpq	%rbp, %rbx
	jnb	.L1057
	leaq	32(%rsp), %r12
	testq	%rbx, %rbx
	je	.L1081
	.p2align 4
	.p2align 3
.L1059:
	movq	%r12, %rdx
	movq	%rsi, %rcx
	subq	%rbx, %rbp
	movq	%rbx, 32(%rsp)
	movq	%r13, 40(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	cmpq	%rbp, %rbx
	jb	.L1059
	testq	%rbp, %rbp
	jne	.L1057
.L1056:
	testq	%r14, %r14
	jne	.L1139
.L1060:
	testq	%rdi, %rdi
	je	.L1088
	leaq	32(%rsp), %r12
	jmp	.L1027
	.p2align 4,,10
	.p2align 3
.L1136:
	movq	%r9, %rbp
	andl	$1, %ebx
	shrq	%rbp
	addq	%rbp, %rbx
	movq	%rbx, %rdi
	jmp	.L1023
	.p2align 4,,10
	.p2align 3
.L1137:
	movd	%eax, %xmm0
	leaq	32(%rsp), %r12
	punpcklbw	%xmm0, %xmm0
	punpcklwd	%xmm0, %xmm0
	pshufd	$0, %xmm0, %xmm0
	movups	%xmm0, 64(%rsp)
	movups	%xmm0, 80(%rsp)
	testq	%r14, %r14
	jne	.L1140
.L1026:
	movq	%rbx, %rdi
	leaq	64(%rsp), %r13
	movl	$32, %ebx
.L1027:
	cmpq	%rdi, %rbx
	jnb	.L1032
	testq	%rbx, %rbx
	jne	.L1062
	.p2align 1
	.p2align 4
	.p2align 3
.L1061:
	jmp	.L1061
	.p2align 4,,10
	.p2align 3
.L1062:
	movq	%r12, %rdx
	movq	%rsi, %rcx
	subq	%rbx, %rdi
	movq	%rbx, 32(%rsp)
	movq	%r13, 40(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	cmpq	%rdi, %rbx
	jb	.L1062
	testq	%rdi, %rdi
	jne	.L1032
.L1088:
	movq	%rsi, %rax
	addq	$200, %rsp
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
.L1028:
	testq	%r14, %r14
	je	.L1088
	leaq	32(%rsp), %rdx
	movq	%r14, 32(%rsp)
	movq	%r15, 40(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
.LEHE8:
	jmp	.L1088
	.p2align 4,,10
	.p2align 3
.L1065:
	movq	%r9, %rdi
	xorl	%ebp, %ebp
.L1024:
	leaq	60(%rsp), %rcx
	movl	%eax, 60(%rsp)
	movq	%rcx, %xmm0
	punpcklqdq	%xmm0, %xmm0
	cmpl	$55295, %eax
	ja	.L1035
	bsrl	%eax, %edx
	xorl	$31, %edx
	cmpl	$20, %edx
	jle	.L1038
	movl	%eax, %ecx
	shrl	$6, %eax
	movl	$2, %edx
	xorl	%r10d, %r10d
	andl	$63, %ecx
	movl	%eax, %r9d
	xorl	%r8d, %r8d
	orl	$-128, %ecx
	orl	$-64, %r9d
.L1040:
	leaq	64(%rsp), %rax
	movb	%cl, 153(%rsp)
	xorl	%r13d, %r13d
	leaq	184(%rsp), %rcx
	movq	%rax, 144(%rsp)
	leaq	112(%rsp), %rax
	movb	%r9b, 152(%rsp)
	movb	%r8b, 154(%rsp)
	movb	%r10b, 155(%rsp)
	movb	$0, 156(%rsp)
	movb	%dl, 157(%rsp)
	movb	$1, 158(%rsp)
	movups	%xmm0, 128(%rsp)
	movups	%xmm0, 160(%rsp)
	movdqu	144(%rsp), %xmm0
	movq	%rax, 96(%rsp)
	movups	%xmm0, 176(%rsp)
	.p2align 4
	.p2align 3
.L1042:
	movzbl	(%rcx,%r13), %eax
	addq	$1, %r13
	movb	%al, 111(%rsp,%r13)
	cmpl	%r13d, %edx
	jg	.L1141
	movb	$0, 112(%rsp,%r13)
	movq	96(%rsp), %rbx
	movq	%r13, 104(%rsp)
	testq	%rbp, %rbp
	je	.L1043
	subq	$1, %rbp
.L1044:
	leaq	32(%rsp), %rdx
	movq	%rsi, %rcx
	movq	%r13, 32(%rsp)
	movq	%rbx, 40(%rsp)
.LEHB9:
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	subq	$1, %rbp
	jnb	.L1044
.L1043:
	testq	%r14, %r14
	jne	.L1142
.L1045:
	testq	%rdi, %rdi
	je	.L1046
	subq	$1, %rdi
.L1047:
	leaq	32(%rsp), %rdx
	movq	%rsi, %rcx
	movq	%r13, 32(%rsp)
	movq	%rbx, 40(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
.LEHE9:
	subq	$1, %rdi
	jnb	.L1047
.L1046:
	movq	96(%rsp), %rcx
	leaq	112(%rsp), %rax
	cmpq	%rax, %rcx
	je	.L1088
	movq	112(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	jmp	.L1088
	.p2align 4,,10
	.p2align 3
.L1140:
	movq	%r12, %rdx
	movq	%r14, 32(%rsp)
	movq	%r15, 40(%rsp)
.LEHB10:
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	jmp	.L1026
.L1066:
	movl	$65533, %eax
.L1038:
	movl	%eax, %ecx
	movl	%eax, %r9d
	movl	%eax, %r8d
	movl	$3, %edx
	shrl	$6, %ecx
	shrl	$12, %r9d
	andl	$63, %r8d
	xorl	%r10d, %r10d
	andl	$63, %ecx
	orl	$-32, %r9d
	orl	$-128, %r8d
	orl	$-128, %ecx
	jmp	.L1040
.L1138:
	testq	%r14, %r14
	jne	.L1143
	testq	%rdi, %rdi
	je	.L1088
	jmp	.L1061
	.p2align 4,,10
	.p2align 3
.L1141:
	movb	%r13b, 188(%rsp)
	jmp	.L1042
	.p2align 4,,10
	.p2align 3
.L1057:
	movq	%r12, %rdx
	movq	%rsi, %rcx
	movq	%rbp, 32(%rsp)
	movq	%r13, 40(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	testq	%r14, %r14
	je	.L1060
.L1139:
	leaq	32(%rsp), %rdx
	movq	%rsi, %rcx
	movq	%r14, 32(%rsp)
	movq	%r15, 40(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
.LEHE10:
	jmp	.L1060
.L1142:
	leaq	32(%rsp), %rdx
	movq	%rsi, %rcx
	movq	%r14, 32(%rsp)
	movq	%r15, 40(%rsp)
.LEHB11:
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
.LEHE11:
	jmp	.L1045
.L1035:
	leal	-57344(%rax), %edx
	cmpl	$1056767, %edx
	ja	.L1066
	bsrl	%eax, %edx
	cmpl	$15, %edx
	je	.L1038
	movl	%eax, %r8d
	movl	%eax, %r10d
	movl	%eax, %r9d
	shrl	$12, %eax
	shrl	$6, %r8d
	movl	%eax, %ecx
	andl	$63, %r10d
	shrl	$18, %r9d
	andl	$63, %r8d
	andl	$63, %ecx
	orl	$-128, %r10d
	orl	$-16, %r9d
	orl	$-128, %r8d
	orl	$-128, %ecx
	movl	$4, %edx
	jmp	.L1040
.L1143:
	leaq	32(%rsp), %rdx
	movq	%rsi, %rcx
	movq	%r14, 32(%rsp)
	movq	%r15, 40(%rsp)
.LEHB12:
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	testq	%rdi, %rdi
	je	.L1088
	jmp	.L1061
.L1068:
	movq	%rax, %rbx
	leaq	96(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rcx
	call	_Unwind_Resume
	nop
.LEHE12:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA7884:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE7884-.LLSDACSB7884
.LLSDACSB7884:
	.uleb128 .LEHB8-.LFB7884
	.uleb128 .LEHE8-.LEHB8
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB9-.LFB7884
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L1068-.LFB7884
	.uleb128 0
	.uleb128 .LEHB10-.LFB7884
	.uleb128 .LEHE10-.LEHB10
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB11-.LFB7884
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L1068-.LFB7884
	.uleb128 0
	.uleb128 .LEHB12-.LFB7884
	.uleb128 .LEHE12-.LEHB12
	.uleb128 0
	.uleb128 0
.LLSDACSE7884:
	.section	.text$_ZNSt8__format14__write_paddedINS_10_Sink_iterIcEEcEET_S3_St17basic_string_viewIT0_St11char_traitsIS5_EENS_6_AlignEyDi,"x"
	.linkonce discard
	.seh_endproc
	.section	.text$_ZNKSt8__format15__formatter_intIcE13_M_format_intINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorESt17basic_string_viewIcSt11char_traitsIcEEyRS7_,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt8__format15__formatter_intIcE13_M_format_intINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorESt17basic_string_viewIcSt11char_traitsIcEEyRS7_
	.def	_ZNKSt8__format15__formatter_intIcE13_M_format_intINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorESt17basic_string_viewIcSt11char_traitsIcEEyRS7_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format15__formatter_intIcE13_M_format_intINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorESt17basic_string_viewIcSt11char_traitsIcEEyRS7_
_ZNKSt8__format15__formatter_intIcE13_M_format_intINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorESt17basic_string_viewIcSt11char_traitsIcEEyRS7_:
.LFB7870:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$152, %rsp
	.seh_stackalloc	152
	leaq	144(%rsp), %rbp
	.seh_setframe	%rbp, 144
	.seh_endprologue
	movzbl	16(%rcx), %eax
	movq	(%rdx), %r14
	movq	8(%rdx), %rdi
	andl	$3, %eax
	movq	%rcx, %rbx
	movq	%r8, %r12
	movq	%r9, %rsi
	cmpb	$1, %al
	je	.L1195
	cmpb	$2, %al
	je	.L1147
	testb	$2, 12(%rcx)
	jne	.L1196
.L1149:
	movq	16(%rsi), %rbx
	testq	%r14, %r14
	jne	.L1197
.L1165:
	movq	%rbx, %rax
.L1193:
	leaq	8(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.p2align 4,,10
	.p2align 3
.L1195:
	movzwl	(%rcx), %r13d
.L1146:
	testb	$2, 12(%rbx)
	jne	.L1148
.L1150:
	cmpq	%r13, %r14
	jnb	.L1149
	movzbl	8(%rbx), %r8d
	movq	%r13, %r9
	movq	16(%rsi), %rcx
	subq	%r14, %r9
	andl	$3, %r8d
	je	.L1167
	movl	4(%rbx), %eax
	leaq	-64(%rbp), %rdx
.L1168:
	movq	%r14, -64(%rbp)
	andl	$3, %r8d
	movq	%rdi, -56(%rbp)
	movl	%eax, 32(%rsp)
.LEHB13:
	call	_ZNSt8__format14__write_paddedINS_10_Sink_iterIcEEcEET_S3_St17basic_string_viewIT0_St11char_traitsIS5_EENS_6_AlignEyDi
.LEHE13:
	jmp	.L1193
	.p2align 4,,10
	.p2align 3
.L1196:
	xorl	%r13d, %r13d
.L1148:
	leaq	24(%rsi), %rdx
	cmpb	$0, 32(%rsi)
	je	.L1198
.L1151:
	leaq	-40(%rbp), %rcx
	call	_ZNSt6localeC1ERKS_
	leaq	-40(%rbp), %rdx
	leaq	-32(%rbp), %rcx
.LEHB14:
	call	_ZNKSt6locale4nameB5cxx11Ev
	movq	-32(%rbp), %rcx
	leaq	-16(%rbp), %rax
	cmpq	$1, -24(%rbp)
	je	.L1199
.L1153:
	movq	%rax, -72(%rbp)
	cmpq	%rax, %rcx
	je	.L1156
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L1156:
	movq	.refptr._ZNSt7__cxx118numpunctIcE2idE(%rip), %rcx
	call	_ZNKSt6locale2id5_M_idEv
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax,%rdx,8), %r10
	testq	%r10, %r10
	je	.L1159
	movq	(%r10), %rax
	movq	%r10, -80(%rbp)
	movq	%r10, %rdx
	leaq	-32(%rbp), %rcx
	call	*32(%rax)
.LEHE14:
	movq	-24(%rbp), %r9
	movq	-80(%rbp), %r10
	testq	%r9, %r9
	je	.L1161
	movq	%r14, %rax
	subq	%r12, %rax
	leaq	15(%r12,%rax,2), %rax
	andq	$-16, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	48(%rsp), %rcx
	movq	%rcx, -80(%rbp)
	movq	%rcx, %r15
	testq	%r12, %r12
	je	.L1162
	movq	%r12, %r8
	movq	%rdi, %rdx
	movq	%r10, -96(%rbp)
	movq	%r9, -88(%rbp)
	call	memcpy
	movq	-96(%rbp), %r10
	movq	-88(%rbp), %r9
.L1162:
	movq	(%r10), %rax
	leaq	(%rdi,%r12), %r8
	addq	%rdi, %r14
	movq	%r9, -96(%rbp)
	movq	%r8, -88(%rbp)
	movq	-32(%rbp), %rdi
	movq	%r10, %rcx
.LEHB15:
	call	*24(%rax)
.LEHE15:
	movq	%r14, 40(%rsp)
	movq	-88(%rbp), %r8
	leaq	(%r15,%r12), %rcx
	movsbl	%al, %edx
	movq	%r8, 32(%rsp)
	movq	-96(%rbp), %r9
	movq	%rdi, %r8
	call	_ZSt14__add_groupingIcEPT_S1_S0_PKcyPKS0_S5_
	movq	-32(%rbp), %rcx
	subq	%r15, %rax
	movq	%rax, %r14
	cmpq	-72(%rbp), %rcx
	je	.L1174
.L1172:
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	-80(%rbp), %rdi
.L1155:
	leaq	-40(%rbp), %rcx
	call	_ZNSt6localeD1Ev
	jmp	.L1150
	.p2align 4,,10
	.p2align 3
.L1167:
	testb	$4, 12(%rbx)
	je	.L1175
	testq	%r12, %r12
	jne	.L1200
	movl	$2, %r8d
	movl	$48, %eax
	leaq	-64(%rbp), %rdx
	jmp	.L1168
	.p2align 4,,10
	.p2align 3
.L1197:
	leaq	-64(%rbp), %rdx
	movq	%rbx, %rcx
	movq	%r14, -64(%rbp)
	movq	%rdi, -56(%rbp)
.LEHB16:
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	jmp	.L1165
	.p2align 4,,10
	.p2align 3
.L1175:
	movl	$2, %r8d
	movl	$32, %eax
	leaq	-64(%rbp), %rdx
	jmp	.L1168
	.p2align 4,,10
	.p2align 3
.L1147:
	movzwl	(%rcx), %ecx
	movq	%r9, %rdx
	call	_ZNKSt8__format5_SpecIcE12_M_get_widthISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
	movq	%rax, %r13
	jmp	.L1146
	.p2align 4,,10
	.p2align 3
.L1199:
	cmpb	$67, (%rcx)
	jne	.L1153
	cmpq	%rax, %rcx
	je	.L1155
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	jmp	.L1155
	.p2align 4,,10
	.p2align 3
.L1198:
	movq	%rdx, %rcx
	movq	%rdx, -72(%rbp)
	call	_ZNSt6localeC1Ev
	movb	$1, 32(%rsi)
	movq	-72(%rbp), %rdx
	jmp	.L1151
	.p2align 4,,10
	.p2align 3
.L1161:
	movq	-32(%rbp), %rcx
	cmpq	-72(%rbp), %rcx
	je	.L1155
	movq	%rdi, -80(%rbp)
	jmp	.L1172
	.p2align 4,,10
	.p2align 3
.L1200:
	cmpq	%r14, %r12
	movq	%r14, %rax
	leaq	-64(%rbp), %rdx
	cmovbe	%r12, %rax
	testq	%rax, %rax
	jne	.L1201
.L1169:
	addq	%r12, %rdi
	subq	%r12, %r14
	movl	$2, %r8d
	movl	$48, %eax
	jmp	.L1168
	.p2align 4,,10
	.p2align 3
.L1174:
	movq	%r15, %rdi
	jmp	.L1155
	.p2align 4,,10
	.p2align 3
.L1201:
	movq	%r9, -88(%rbp)
	movq	%rdx, -80(%rbp)
	movq	%rcx, -72(%rbp)
	movq	%rax, -64(%rbp)
	movq	%rdi, -56(%rbp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	movq	-88(%rbp), %r9
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rcx
	jmp	.L1169
.L1178:
	leaq	-32(%rbp), %rcx
	movq	%rax, %rbx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L1171:
	leaq	-40(%rbp), %rcx
	call	_ZNSt6localeD1Ev
	movq	%rbx, %rcx
	call	_Unwind_Resume
.LEHE16:
.L1159:
.LEHB17:
	call	_ZSt16__throw_bad_castv
.LEHE17:
.L1177:
	movq	%rax, %rbx
	jmp	.L1171
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA7870:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE7870-.LLSDACSB7870
.LLSDACSB7870:
	.uleb128 .LEHB13-.LFB7870
	.uleb128 .LEHE13-.LEHB13
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB14-.LFB7870
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L1177-.LFB7870
	.uleb128 0
	.uleb128 .LEHB15-.LFB7870
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L1178-.LFB7870
	.uleb128 0
	.uleb128 .LEHB16-.LFB7870
	.uleb128 .LEHE16-.LEHB16
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB17-.LFB7870
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L1177-.LFB7870
	.uleb128 0
.LLSDACSE7870:
	.section	.text$_ZNKSt8__format15__formatter_intIcE13_M_format_intINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorESt17basic_string_viewIcSt11char_traitsIcEEyRS7_,"x"
	.linkonce discard
	.seh_endproc
	.section	.text$_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE,"x"
	.linkonce discard
	.p2align 4
	.globl	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	.def	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE:
.LFB7865:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movzbl	16(%r9), %eax
	movq	(%rcx), %rbx
	movzbl	128(%rsp), %r11d
	movq	8(%rcx), %rsi
	andl	$3, %eax
	movq	%rdx, %rdi
	movq	%r9, %r10
	cmpb	$1, %al
	je	.L1215
	cmpb	$2, %al
	je	.L1205
.L1208:
	movq	16(%r8), %rdi
	testq	%rbx, %rbx
	jne	.L1216
.L1207:
	movq	%rdi, %rax
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L1215:
	movzwl	(%r9), %r9d
.L1204:
	cmpq	%r9, %rdi
	jnb	.L1208
	movzbl	8(%r10), %edx
	movl	4(%r10), %eax
	movq	%rbx, 48(%rsp)
	movq	16(%r8), %rcx
	movq	%rsi, 56(%rsp)
	andl	$3, %edx
	movl	%eax, 32(%rsp)
	cmovne	%edx, %r11d
	leaq	48(%rsp), %rdx
	subq	%rdi, %r9
	movzbl	%r11b, %r8d
	call	_ZNSt8__format14__write_paddedINS_10_Sink_iterIcEEcEET_S3_St17basic_string_viewIT0_St11char_traitsIS5_EENS_6_AlignEyDi
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L1216:
	leaq	48(%rsp), %rdx
	movq	%rdi, %rcx
	movq	%rbx, 48(%rsp)
	movq	%rsi, 56(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	jmp	.L1207
	.p2align 4,,10
	.p2align 3
.L1205:
	movzwl	(%r9), %ecx
	movq	%r8, %rdx
	movq	%r9, 120(%rsp)
	movb	%r11b, 128(%rsp)
	movq	%r8, 112(%rsp)
	call	_ZNKSt8__format5_SpecIcE12_M_get_widthISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
	movq	120(%rsp), %r10
	movq	112(%rsp), %r8
	movzbl	128(%rsp), %r11d
	movq	%rax, %r9
	jmp	.L1204
	.seh_endproc
	.section .rdata,"dr"
.LC14:
	.ascii "basic_string::_M_replace\0"
.LC15:
	.ascii "basic_string_view::substr\0"
	.align 8
.LC16:
	.ascii "%s: __pos (which is %zu) > __size (which is %zu)\0"
.LC17:
	.ascii "basic_string::insert\0"
	.align 8
.LC18:
	.ascii "%s: __pos (which is %zu) > this->size() (which is %zu)\0"
	.section	.text$_ZNKSt8__format14__formatter_fpIcE6formatIfNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt8__format14__formatter_fpIcE6formatIfNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	.def	_ZNKSt8__format14__formatter_fpIcE6formatIfNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format14__formatter_fpIcE6formatIfNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
_ZNKSt8__format14__formatter_fpIcE6formatIfNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_:
.LFB7703:
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
	subq	$392, %rsp
	.seh_stackalloc	392
	movups	%xmm6, 368(%rsp)
	.seh_savexmm	%xmm6, 368
	.seh_endprologue
	movb	$0, 160(%rsp)
	movzbl	16(%rcx), %eax
	movq	%rcx, %rsi
	movaps	%xmm1, %xmm6
	leaq	160(%rsp), %rbp
	movq	%r8, %rdi
	movq	$0, 152(%rsp)
	movq	%rbp, 144(%rsp)
	andl	$12, %eax
	jne	.L1544
	movzbl	24(%rcx), %edx
	leaq	.L1424(%rip), %rcx
	movq	%rdx, %rax
	andl	$15, %eax
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1424:
	.long	.L1238-.L1424
	.long	.L1429-.L1424
	.long	.L1428-.L1424
	.long	.L1232-.L1424
	.long	.L1236-.L1424
	.long	.L1427-.L1424
	.long	.L1426-.L1424
	.long	.L1425-.L1424
	.long	.L1468-.L1424
	.section	.text$_ZNKSt8__format14__formatter_fpIcE6formatIfNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L1238:
	leaq	112(%rsp), %rbx
	movaps	%xmm6, %xmm3
	leaq	368(%rsp), %r8
	leaq	241(%rsp), %rdx
	movq	%rbx, %rcx
	call	_ZSt8to_charsPcS_f
	movq	112(%rsp), %r13
	cmpl	$132, 120(%rsp)
	je	.L1437
	leaq	368(%rsp), %rax
	movb	$0, 56(%rsp)
	movl	$6, %r12d
	leaq	241(%rsp), %rbx
	movb	$101, 71(%rsp)
	movq	%rax, 48(%rsp)
.L1240:
	movd	%xmm6, %eax
	movl	$1, %r9d
	testl	%eax, %eax
	js	.L1271
	movzbl	8(%rsi), %eax
	andl	$12, %eax
	cmpb	$4, %al
	je	.L1545
	xorl	%r9d, %r9d
	cmpb	$12, %al
	jne	.L1271
	movb	$32, -1(%rbx)
	movl	$1, %r9d
	subq	$1, %rbx
	.p2align 4
	.p2align 3
.L1271:
	movzbl	12(%rsi), %r15d
	movq	%r13, %r14
	subq	%rbx, %r14
	testb	$1, %r15b
	je	.L1273
	movss	.LC13(%rip), %xmm1
	movaps	%xmm6, %xmm0
	andps	.LC12(%rip), %xmm0
	ucomiss	%xmm0, %xmm1
	jb	.L1274
	testq	%r14, %r14
	je	.L1275
	movq	%r14, %r8
	movl	$46, %edx
	movq	%rbx, %rcx
	movb	%r9b, 72(%rsp)
	call	memchr
	movzbl	72(%rsp), %r9d
	testq	%rax, %rax
	je	.L1276
	subq	%rbx, %rax
	movq	%rax, 88(%rsp)
	cmpq	$-1, %rax
	je	.L1276
	leaq	1(%rax), %r11
	cmpq	%r14, %r11
	jnb	.L1546
	movsbl	71(%rsp), %edx
	movq	%r14, %r8
	leaq	(%rbx,%r11), %rcx
	movb	%r9b, 80(%rsp)
	subq	%r11, %r8
	movq	%r11, 72(%rsp)
	call	memchr
	movq	72(%rsp), %r11
	movzbl	80(%rsp), %r9d
	testq	%rax, %rax
	je	.L1447
	subq	%rbx, %rax
	cmpq	$-1, %rax
	cmove	%r14, %rax
	movq	%rax, 72(%rsp)
.L1281:
	xorl	%eax, %eax
	movq	88(%rsp), %rdx
	cmpq	%rdx, 72(%rsp)
	sete	%al
	movq	%rax, 80(%rsp)
	cmpb	$0, 56(%rsp)
	je	.L1449
	cmpb	$48, (%rbx,%r9)
	je	.L1282
.L1279:
	movq	72(%rsp), %rax
	subq	%r9, %rax
	subq	$1, %rax
.L1283:
	testq	%r12, %r12
	jne	.L1287
	.p2align 4
	.p2align 3
.L1278:
	cmpq	$0, 80(%rsp)
	jne	.L1286
.L1288:
	leaq	192(%rsp), %r12
	andl	$2, %r15d
	movb	$0, 192(%rsp)
	movq	%r12, 176(%rsp)
	movq	$0, 184(%rsp)
	je	.L1539
.L1414:
	cmpb	$0, 32(%rdi)
	je	.L1547
.L1379:
	leaq	24(%rdi), %rdx
	leaq	136(%rsp), %rcx
	call	_ZNSt6localeC1ERKS_
	movzbl	71(%rsp), %r8d
	leaq	208(%rsp), %rcx
	leaq	96(%rsp), %rdx
	leaq	136(%rsp), %r9
	movq	%r14, 96(%rsp)
	movq	%rbx, 104(%rsp)
.LEHB18:
	call	_ZNKSt8__format14__formatter_fpIcE11_M_localizeB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEEcRKSt6locale.isra.0
.LEHE18:
	leaq	136(%rsp), %rcx
	call	_ZNSt6localeD1Ev
	movq	216(%rsp), %r8
	testq	%r8, %r8
	je	.L1465
	movq	176(%rsp), %rcx
	cmpq	%r12, %rcx
	je	.L1548
	movq	208(%rsp), %rax
	leaq	224(%rsp), %r13
	cmpq	%r13, %rax
	je	.L1406
	movq	192(%rsp), %rdx
	movq	%r8, %xmm0
	movq	%rax, 176(%rsp)
	movhps	224(%rsp), %xmm0
	movups	%xmm0, 184(%rsp)
	testq	%rcx, %rcx
	je	.L1386
	movq	%rcx, 208(%rsp)
	movq	%rdx, 224(%rsp)
.L1385:
	movb	$0, (%rcx)
	movq	184(%rsp), %r14
	movq	176(%rsp), %r15
	jmp	.L1380
	.p2align 4,,10
	.p2align 3
.L1273:
	leaq	192(%rsp), %r12
	andl	$2, %r15d
	movb	$0, 192(%rsp)
	movq	%r12, 176(%rsp)
	movq	$0, 184(%rsp)
	je	.L1539
	movss	.LC13(%rip), %xmm1
	movaps	%xmm6, %xmm0
	andps	.LC12(%rip), %xmm0
	ucomiss	%xmm0, %xmm1
	jnb	.L1414
.L1539:
	movq	%rbx, %r13
.L1377:
	movzbl	16(%rsi), %eax
	andl	$3, %eax
	cmpb	$1, %al
	je	.L1549
	cmpb	$2, %al
	je	.L1550
.L1389:
	movq	16(%rdi), %rsi
	testq	%r14, %r14
	jne	.L1551
.L1392:
	movq	176(%rsp), %rcx
	cmpq	%r12, %rcx
	je	.L1399
	movq	192(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L1399:
	movq	144(%rsp), %rcx
	cmpq	%rbp, %rcx
	je	.L1485
	movq	160(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	nop
.L1485:
	movups	368(%rsp), %xmm6
	movq	%rsi, %rax
	addq	$392, %rsp
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
.L1549:
	movzwl	(%rsi), %r9d
.L1388:
	cmpq	%r9, %r14
	jnb	.L1389
	movzbl	8(%rsi), %r8d
	movq	16(%rdi), %rcx
	andl	$3, %r8d
	jne	.L1552
	testb	$4, 12(%rsi)
	je	.L1396
	andps	.LC12(%rip), %xmm6
	movss	.LC13(%rip), %xmm0
	ucomiss	%xmm6, %xmm0
	jb	.L1396
	movzbl	0(%r13), %eax
	leaq	_ZNSt8__detail31__from_chars_alnum_to_val_tableILb0EE5valueE(%rip), %rdx
	cmpb	$15, (%rdx,%rax)
	ja	.L1553
	movq	%r14, %rdx
	movl	$2, %r8d
	movl	$48, %eax
	jmp	.L1394
	.p2align 4,,10
	.p2align 3
.L1396:
	movq	%r14, %rdx
	movl	$2, %r8d
	movl	$32, %eax
.L1394:
	movl	%eax, 32(%rsp)
	subq	%r14, %r9
	andl	$3, %r8d
	movq	%rdx, 96(%rsp)
	leaq	96(%rsp), %rdx
	movq	%rbx, 104(%rsp)
.LEHB19:
	call	_ZNSt8__format14__write_paddedINS_10_Sink_iterIcEEcEET_S3_St17basic_string_viewIT0_St11char_traitsIS5_EENS_6_AlignEyDi
.LEHE19:
	movq	%rax, %rsi
	jmp	.L1392
	.p2align 4,,10
	.p2align 3
.L1544:
	cmpb	$4, %al
	je	.L1554
	movq	$-1, %r12
	cmpb	$8, %al
	je	.L1555
.L1220:
	movzbl	24(%rsi), %edx
	leaq	.L1417(%rip), %rcx
	movq	%rdx, %rax
	andl	$15, %eax
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1417:
	.long	.L1423-.L1417
	.long	.L1530-.L1417
	.long	.L1529-.L1417
	.long	.L1228-.L1417
	.long	.L1227-.L1417
	.long	.L1528-.L1417
	.long	.L1527-.L1417
	.long	.L1526-.L1417
	.long	.L1525-.L1417
	.section	.text$_ZNKSt8__format14__formatter_fpIcE6formatIfNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L1274:
	leaq	192(%rsp), %r12
	movb	$0, 192(%rsp)
	movq	%r12, 176(%rsp)
	movq	$0, 184(%rsp)
	jmp	.L1539
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L1556:
	addq	$1, %r11
	cmpq	%r14, %r11
	jnb	.L1535
.L1282:
	cmpb	$48, (%rbx,%r11)
	je	.L1556
	jmp	.L1280
	.p2align 4,,10
	.p2align 3
.L1465:
	movq	%rbx, %r15
	leaq	224(%rsp), %r13
.L1380:
	movq	208(%rsp), %rcx
	cmpq	%r13, %rcx
	je	.L1404
	movq	224(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L1404:
	movq	%rbx, %r13
	movq	%r15, %rbx
	jmp	.L1377
	.p2align 4,,10
	.p2align 3
.L1276:
	movsbl	71(%rsp), %edx
	movq	%r14, %r8
	movq	%rbx, %rcx
	movb	%r9b, 72(%rsp)
	call	memchr
	movzbl	72(%rsp), %r9d
	testq	%rax, %rax
	jne	.L1284
	.p2align 4
	.p2align 3
.L1275:
	movq	%r14, 88(%rsp)
.L1285:
	cmpb	$0, 56(%rsp)
	je	.L1451
	testq	%r12, %r12
	je	.L1452
	movq	$1, 80(%rsp)
	movq	88(%rsp), %rdx
	movq	%rdx, 72(%rsp)
	movq	%rdx, %rax
	subq	%r9, %rax
.L1287:
	subq	%rax, %r12
	addq	%r12, 80(%rsp)
	jmp	.L1278
	.p2align 4,,10
	.p2align 3
.L1468:
	movl	$6, %r12d
.L1525:
	movb	$101, 71(%rsp)
	movl	$2, %r15d
	movl	$1, %r14d
	movb	$0, 56(%rsp)
	.p2align 4
	.p2align 3
.L1225:
	movl	%r12d, 40(%rsp)
	leaq	112(%rsp), %rbx
	movaps	%xmm6, %xmm3
	leaq	368(%rsp), %r8
	movl	%r15d, 32(%rsp)
	leaq	241(%rsp), %rdx
	movq	%rbx, %rcx
	call	_ZSt8to_charsPcS_fSt12chars_formati
	movq	112(%rsp), %r13
	cmpl	$132, 120(%rsp)
	je	.L1241
.L1534:
	leaq	368(%rsp), %rax
	leaq	241(%rsp), %rbx
	movq	%rax, 48(%rsp)
.L1242:
	testb	%r14b, %r14b
	je	.L1240
	cmpq	%r13, %rbx
	je	.L1240
	movq	__imp_toupper(%rip), %r14
	movq	%rbx, %r15
	.p2align 4
	.p2align 3
.L1270:
	movsbl	(%r15), %ecx
	addq	$1, %r15
	call	*%r14
	movb	%al, -1(%r15)
	cmpq	%r13, %r15
	jne	.L1270
	jmp	.L1240
	.p2align 4,,10
	.p2align 3
.L1429:
	movl	$6, %r12d
.L1530:
	movb	$101, 71(%rsp)
	movl	$3, %r15d
	xorl	%r14d, %r14d
	movb	$1, 56(%rsp)
	jmp	.L1225
	.p2align 4,,10
	.p2align 3
.L1428:
	movl	$6, %r12d
.L1529:
	movb	$69, 71(%rsp)
	movl	$3, %r15d
	movl	$1, %r14d
	movb	$1, 56(%rsp)
	jmp	.L1225
	.p2align 4,,10
	.p2align 3
.L1232:
	andl	$15, %edx
	xorl	%r14d, %r14d
	movl	$101, %eax
	cmpb	$4, %dl
	movl	$112, %edx
	cmovne	%edx, %eax
	movb	%al, 71(%rsp)
.L1234:
	movl	$4, 32(%rsp)
	leaq	112(%rsp), %rbx
	movaps	%xmm6, %xmm3
	leaq	368(%rsp), %r8
	leaq	241(%rsp), %rdx
	movq	%rbx, %rcx
	call	_ZSt8to_charsPcS_fSt12chars_format
	movq	112(%rsp), %r13
	cmpl	$132, 120(%rsp)
	je	.L1438
	movb	$0, 56(%rsp)
	movl	$6, %r12d
	jmp	.L1534
	.p2align 4,,10
	.p2align 3
.L1236:
	andl	$15, %edx
	movl	$112, %eax
	movl	$1, %r14d
	cmpb	$4, %dl
	movl	$80, %edx
	cmove	%edx, %eax
	movb	%al, 71(%rsp)
	jmp	.L1234
	.p2align 4,,10
	.p2align 3
.L1427:
	movl	$6, %r12d
.L1528:
	movl	$1, %r15d
.L1533:
	movb	$101, 71(%rsp)
	xorl	%r14d, %r14d
	movb	$0, 56(%rsp)
	jmp	.L1225
	.p2align 4,,10
	.p2align 3
.L1426:
	movl	$6, %r12d
.L1527:
	movb	$69, 71(%rsp)
	movl	$1, %r15d
	movl	$1, %r14d
	movb	$0, 56(%rsp)
	jmp	.L1225
	.p2align 4,,10
	.p2align 3
.L1425:
	movl	$6, %r12d
.L1526:
	movb	$101, 71(%rsp)
	movl	$2, %r15d
	xorl	%r14d, %r14d
	movb	$0, 56(%rsp)
	jmp	.L1225
	.p2align 4,,10
	.p2align 3
.L1547:
	leaq	24(%rdi), %rcx
	call	_ZNSt6localeC1Ev
	movb	$1, 32(%rdi)
	jmp	.L1379
	.p2align 4,,10
	.p2align 3
.L1555:
	movzwl	2(%rcx), %ecx
	movq	%r8, %rdx
.LEHB20:
	call	_ZNKSt8__format5_SpecIcE16_M_get_precisionISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
.LEHE20:
	movzbl	24(%rsi), %edx
	movq	%rax, %r12
	leaq	.L1223(%rip), %rcx
	movq	%rdx, %rax
	andl	$15, %eax
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1223:
	.long	.L1423-.L1223
	.long	.L1530-.L1223
	.long	.L1529-.L1223
	.long	.L1228-.L1223
	.long	.L1227-.L1223
	.long	.L1528-.L1223
	.long	.L1527-.L1223
	.long	.L1526-.L1223
	.long	.L1525-.L1223
	.section	.text$_ZNKSt8__format14__formatter_fpIcE6formatIfNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L1423:
	movb	$101, 71(%rsp)
	movl	$3, %r15d
	xorl	%r14d, %r14d
	movb	$0, 56(%rsp)
	jmp	.L1225
	.p2align 4,,10
	.p2align 3
.L1545:
	movb	$43, -1(%rbx)
	subq	$1, %rbx
	jmp	.L1271
	.p2align 4,,10
	.p2align 3
.L1552:
	movl	4(%rsi), %eax
	movq	%r14, %rdx
	jmp	.L1394
	.p2align 4,,10
	.p2align 3
.L1551:
	leaq	96(%rsp), %rdx
	movq	%rsi, %rcx
	movq	%r14, 96(%rsp)
	movq	%rbx, 104(%rsp)
.LEHB21:
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	jmp	.L1392
	.p2align 4,,10
	.p2align 3
.L1550:
	movzwl	(%rsi), %ecx
	movq	%rdi, %rdx
	call	_ZNKSt8__format5_SpecIcE12_M_get_widthISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
.LEHE21:
	movq	%rax, %r9
	jmp	.L1388
	.p2align 4,,10
	.p2align 3
.L1451:
	movq	88(%rsp), %rax
	xorl	%r12d, %r12d
	movq	$1, 80(%rsp)
	movq	%rax, 72(%rsp)
.L1286:
	movq	80(%rsp), %rdx
	movq	152(%rsp), %r9
	leaq	(%r14,%rdx), %r15
	testq	%r9, %r9
	jne	.L1289
	movq	48(%rsp), %rax
	subq	%r13, %rax
	cmpq	%rdx, %rax
	jnb	.L1290
	movq	144(%rsp), %rdx
	cmpq	%rbp, %rdx
	je	.L1557
	movq	160(%rsp), %rax
	cmpq	%r15, %rax
	jnb	.L1296
.L1300:
	movabsq	$9223372036854775806, %r8
	cmpq	%r15, %r8
	jb	.L1297
	addq	%rax, %rax
	leaq	1(%r15), %rcx
	cmpq	%rax, %r15
	jnb	.L1303
	cmpq	%rax, %r8
	leaq	1(%rax), %r10
	movabsq	$9223372036854775807, %rcx
	cmovb	%r8, %rax
	cmovnb	%r10, %rcx
	movq	%rax, %r15
.L1303:
	movq	%r9, 56(%rsp)
	movq	%rdx, 48(%rsp)
.LEHB22:
	call	_Znwy
	movq	56(%rsp), %r9
	movq	48(%rsp), %rdx
	movq	%rax, %r13
.L1299:
	leaq	1(%r9), %r8
	testq	%r9, %r9
	je	.L1558
	movq	%r13, %rcx
	call	memcpy
.L1305:
	movq	144(%rsp), %rcx
	cmpq	%rbp, %rcx
	je	.L1536
	movq	160(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L1536:
	movq	152(%rsp), %r9
	movq	%r13, 144(%rsp)
	movq	%r15, 160(%rsp)
	testq	%r9, %r9
	je	.L1296
.L1307:
	cmpq	72(%rsp), %r9
	jb	.L1559
	movabsq	$9223372036854775806, %rax
	movq	%rax, %rdx
	subq	%r9, %rdx
	cmpq	80(%rsp), %rdx
	jb	.L1560
	movq	80(%rsp), %rbx
	movq	144(%rsp), %r13
	leaq	(%rbx,%r9), %r14
	cmpq	%rbp, %r13
	je	.L1561
	movq	160(%rsp), %r12
	cmpq	%r14, %r12
	jb	.L1364
.L1360:
	movq	72(%rsp), %rax
	leaq	0(%r13,%rax), %rcx
	subq	%rax, %r9
	je	.L1365
	movq	80(%rsp), %rax
	addq	%rcx, %rax
	cmpq	$1, %r9
	je	.L1562
	movq	%rcx, %rdx
	movq	%r9, %r8
	movq	%rax, %rcx
	call	memmove
	movq	72(%rsp), %rcx
	addq	144(%rsp), %rcx
.L1365:
	cmpq	$1, 80(%rsp)
	je	.L1563
	movq	80(%rsp), %r8
	movl	$48, %edx
	call	memset
.L1375:
	movq	144(%rsp), %rax
	movq	88(%rsp), %rbx
	movb	$0, (%rax,%r14)
	movq	%r14, 152(%rsp)
	cmpq	%rbx, 72(%rsp)
	jne	.L1356
	movq	144(%rsp), %rax
	movq	72(%rsp), %rbx
	movb	$46, (%rax,%rbx)
	movq	152(%rsp), %r14
	.p2align 4
	.p2align 3
.L1356:
	movq	144(%rsp), %rbx
	movzbl	12(%rsi), %r15d
	jmp	.L1288
	.p2align 4,,10
	.p2align 3
.L1554:
	movzwl	2(%rcx), %r12d
	jmp	.L1220
	.p2align 4,,10
	.p2align 3
.L1546:
	cmpq	%rax, %r14
	movq	%r14, 72(%rsp)
	sete	%al
	cmpb	$0, 56(%rsp)
	movzbl	%al, %eax
	movq	%rax, 80(%rsp)
	jne	.L1564
.L1449:
	xorl	%r12d, %r12d
	jmp	.L1278
	.p2align 4,,10
	.p2align 3
.L1284:
	subq	%rbx, %rax
	cmpq	$-1, %rax
	cmove	%r14, %rax
	movq	%rax, 88(%rsp)
	jmp	.L1285
.L1564:
	cmpb	$48, (%rbx,%r9)
	jne	.L1279
.L1535:
	movq	$-1, %r11
.L1280:
	movq	72(%rsp), %rax
	subq	%r11, %rax
	jmp	.L1283
.L1228:
	andl	$15, %edx
	movl	$4, %r15d
	cmpb	$4, %dl
	je	.L1533
	movb	$112, 71(%rsp)
	xorl	%r14d, %r14d
	movb	$0, 56(%rsp)
	jmp	.L1225
.L1227:
	andl	$15, %edx
	movl	$4, %r15d
	cmpb	$4, %dl
	je	.L1436
	movb	$112, 71(%rsp)
	movl	$1, %r14d
	movb	$0, 56(%rsp)
	jmp	.L1225
.L1557:
	cmpq	$15, %r15
	jbe	.L1296
.L1295:
	movabsq	$9223372036854775806, %rax
	cmpq	%r15, %rax
	jb	.L1297
	movq	%r9, 48(%rsp)
	cmpq	$29, %r15
	ja	.L1298
	movl	$31, %ecx
	call	_Znwy
	movq	48(%rsp), %r9
	movq	%rax, %r13
	movl	$30, %r15d
	movq	%rbp, %rdx
	jmp	.L1299
	.p2align 4,,10
	.p2align 3
.L1296:
	movq	72(%rsp), %rax
	cmpq	%r14, %rax
	movq	%rax, %r13
	movabsq	$9223372036854775806, %rax
	cmova	%r14, %r13
	cmpq	%r13, %rax
	jb	.L1565
	movq	144(%rsp), %r15
	cmpq	%rbp, %r15
	je	.L1566
	movq	160(%rsp), %rdx
	cmpq	%r13, %rdx
	jb	.L1314
.L1311:
	cmpq	%r15, %rbx
	je	.L1315
	testq	%r13, %r13
	je	.L1317
	cmpq	$1, %r13
	je	.L1567
	movq	%r15, %rcx
	movq	%r13, %r8
	movq	%rbx, %rdx
	call	memcpy
	movq	144(%rsp), %r15
.L1317:
	movb	$0, (%r15,%r13)
	movq	88(%rsp), %rdx
	movq	%r13, 152(%rsp)
	cmpq	%rdx, 72(%rsp)
	je	.L1568
	testq	%r12, %r12
	je	.L1331
.L1413:
	movabsq	$9223372036854775806, %rax
	movq	%rax, %rdx
	subq	%r13, %rdx
	cmpq	%r12, %rdx
	jb	.L1569
	movq	144(%rsp), %r9
	leaq	(%r12,%r13), %r15
	cmpq	%rbp, %r9
	je	.L1570
	movq	160(%rsp), %rdx
	cmpq	%r15, %rdx
	jb	.L1571
.L1339:
	leaq	(%r9,%r13), %rcx
	cmpq	$1, %r12
	je	.L1572
	movq	%r12, %r8
	movl	$48, %edx
	call	memset
.L1348:
	movq	144(%rsp), %rax
	movb	$0, (%rax,%r15)
	movq	%r15, 152(%rsp)
	cmpq	72(%rsp), %r14
	jb	.L1410
	movq	72(%rsp), %rax
	movq	%r14, %r8
	subq	%rax, %r8
	leaq	(%rbx,%rax), %r9
.L1409:
	movabsq	$9223372036854775806, %rax
	subq	%r15, %rax
	cmpq	%r8, %rax
	jb	.L1573
	movq	144(%rsp), %rdx
	movl	$15, %eax
	leaq	(%r15,%r8), %r14
	cmpq	%rbp, %rdx
	cmovne	160(%rsp), %rax
	cmpq	%r14, %rax
	jb	.L1352
	testq	%r8, %r8
	jne	.L1353
	movb	$0, (%rdx,%r14)
	movq	%r14, 152(%rsp)
	jmp	.L1356
	.p2align 4,,10
	.p2align 3
.L1289:
	movq	144(%rsp), %rdx
	cmpq	%rbp, %rdx
	je	.L1574
	movq	160(%rsp), %rax
	cmpq	%r15, %rax
	jnb	.L1307
	jmp	.L1300
.L1437:
	movb	$0, 72(%rsp)
	xorl	%r15d, %r15d
	xorl	%r14d, %r14d
	movl	$6, %r12d
	movb	$0, 56(%rsp)
	movl	$14, %r9d
	movb	$101, 71(%rsp)
.L1239:
	movq	144(%rsp), %rax
	movq	%rax, 48(%rsp)
	cmpq	$128, %r9
	jbe	.L1575
	cmpq	%rbp, 48(%rsp)
	je	.L1576
	movq	160(%rsp), %rax
	cmpq	%r9, %rax
	jb	.L1577
.L1267:
	cmpq	%rbp, 48(%rsp)
	je	.L1442
	movq	160(%rsp), %rax
	leaq	(%rax,%rax), %r13
	cmpq	%r13, %rax
	jnb	.L1258
	movabsq	$9223372036854775806, %rax
	cmpq	%r13, %rax
	jb	.L1578
	leaq	1(%r13), %rcx
.L1257:
	call	_Znwy
	movq	%rax, %r10
	movq	152(%rsp), %rax
	leaq	1(%rax), %r8
	testq	%rax, %rax
	je	.L1579
	movq	48(%rsp), %rdx
	movq	%r10, %rcx
	call	memcpy
	movq	%rax, %r10
.L1261:
	movq	144(%rsp), %rcx
	cmpq	%rbp, %rcx
	je	.L1262
	movq	160(%rsp), %rax
	movq	%r10, 48(%rsp)
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	48(%rsp), %r10
.L1262:
	movq	%r10, 144(%rsp)
	movq	%r13, 160(%rsp)
	movq	%r10, 48(%rsp)
.L1258:
	movq	48(%rsp), %rax
	leaq	-1(%rax,%r13), %r8
	leaq	1(%rax), %rdx
	cmpb	$0, 72(%rsp)
	jne	.L1580
	testl	%r15d, %r15d
	je	.L1265
	movl	%r15d, 32(%rsp)
	movaps	%xmm6, %xmm3
	movq	%rbx, %rcx
	call	_ZSt8to_charsPcS_fSt12chars_format
	movq	112(%rsp), %r10
	movq	120(%rsp), %rax
.L1264:
	movq	%r10, %r13
	testl	%eax, %eax
	jne	.L1266
	movq	144(%rsp), %rdx
	movq	%r10, %rax
	subq	48(%rsp), %rax
	movb	$0, (%rdx,%rax)
	movq	144(%rsp), %rdx
	movq	%rax, 152(%rsp)
	addq	%rdx, %rax
	leaq	1(%rdx), %rbx
	movq	%rax, 48(%rsp)
	jmp	.L1242
	.p2align 4,,10
	.p2align 3
.L1266:
	movq	144(%rsp), %rdx
	movb	$0, (%rdx)
	movq	144(%rsp), %rdx
	movq	$0, 152(%rsp)
	movq	%rdx, 48(%rsp)
	cmpl	$132, %eax
	je	.L1267
	leaq	1(%rdx), %rbx
	jmp	.L1242
.L1265:
	movaps	%xmm6, %xmm3
	movq	%rbx, %rcx
	call	_ZSt8to_charsPcS_f
	movq	112(%rsp), %r10
	movq	120(%rsp), %rax
	jmp	.L1264
.L1438:
	movb	$0, 72(%rsp)
	movl	$4, %r15d
	movl	$6, %r12d
	movl	$14, %r9d
	movb	$0, 56(%rsp)
	jmp	.L1239
.L1580:
	movl	%r12d, 40(%rsp)
	movaps	%xmm6, %xmm3
	movq	%rbx, %rcx
	movl	%r15d, 32(%rsp)
	call	_ZSt8to_charsPcS_fSt12chars_formati
	movq	112(%rsp), %r10
	movq	120(%rsp), %rax
	jmp	.L1264
.L1241:
	movb	$1, 72(%rsp)
	leaq	8(%r12), %r9
	cmpl	$2, %r15d
	jne	.L1239
	leaq	208(%rsp), %rdx
	movaps	%xmm6, %xmm0
	movq	%r9, 48(%rsp)
	movl	$0, 208(%rsp)
	call	frexpf
	movq	48(%rsp), %r9
	movb	$1, 72(%rsp)
	movl	208(%rsp), %ecx
	imull	$4004, %ecx, %eax
	movq	%rax, %rdx
	imulq	$995517945, %rax, %rax
	shrq	$32, %rax
	subl	%eax, %edx
	shrl	%edx
	addl	%edx, %eax
	shrl	$13, %eax
	addl	$1, %eax
	addq	%r9, %rax
	testl	%ecx, %ecx
	cmovg	%rax, %r9
	jmp	.L1239
.L1577:
	movabsq	$9223372036854775806, %rdx
	cmpq	%r9, %rdx
	jb	.L1248
	addq	%rax, %rax
	cmpq	%rax, %r9
	jnb	.L1416
	movabsq	$9223372036854775807, %rcx
	movq	%rdx, %r9
	cmpq	%rax, %rdx
	jnb	.L1415
.L1245:
	movq	%r9, 80(%rsp)
	call	_Znwy
	movq	%rax, %r13
	movq	152(%rsp), %rax
	movq	80(%rsp), %r9
	testq	%rax, %rax
	leaq	1(%rax), %r8
	je	.L1581
	movq	48(%rsp), %rdx
	movq	%r13, %rcx
	movq	%r9, 80(%rsp)
	call	memcpy
	movq	80(%rsp), %r9
.L1255:
	movq	144(%rsp), %rcx
	cmpq	%rbp, %rcx
	je	.L1256
	movq	160(%rsp), %rax
	movq	%r9, 48(%rsp)
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	48(%rsp), %r9
.L1256:
	movq	%r13, 144(%rsp)
	movq	%r9, 160(%rsp)
	movq	%r13, 48(%rsp)
	jmp	.L1267
.L1290:
	movq	72(%rsp), %rax
	movq	80(%rsp), %rcx
	movq	%r14, %r8
	addq	%rax, %rcx
	leaq	(%rbx,%rax), %r13
	subq	%rax, %r8
	movq	%rax, %r14
	addq	%rbx, %rcx
	movq	%r13, %rdx
	call	memmove
	cmpq	88(%rsp), %r14
	jne	.L1308
	movq	72(%rsp), %rax
	movb	$46, 0(%r13)
	leaq	1(%rbx,%rax), %r13
.L1308:
	movq	%r12, %r8
	movl	$48, %edx
	movq	%r13, %rcx
	movq	%r15, %r14
	call	memset
	movzbl	12(%rsi), %r15d
	jmp	.L1288
.L1553:
	movq	24(%rcx), %rax
	movzbl	(%rbx), %edx
	leaq	1(%rax), %r8
	movq	%r8, 24(%rcx)
	movb	%dl, (%rax)
	movq	8(%rcx), %rdx
	movq	24(%rcx), %rax
	subq	%rdx, %rax
	cmpq	16(%rcx), %rax
	je	.L1582
.L1397:
	addq	$1, %rbx
	leaq	-1(%r14), %rdx
	movl	$2, %r8d
	movl	$48, %eax
	jmp	.L1394
.L1548:
	movq	208(%rsp), %rax
	leaq	224(%rsp), %r13
	cmpq	%r13, %rax
	je	.L1406
	movq	%rax, 176(%rsp)
	movq	%r8, %xmm0
	movhps	224(%rsp), %xmm0
	movups	%xmm0, 184(%rsp)
.L1386:
	movq	%r13, 208(%rsp)
	leaq	224(%rsp), %r13
	movq	%r13, %rcx
	jmp	.L1385
.L1568:
	movq	144(%rsp), %rdx
	leaq	1(%r13), %r15
	cmpq	%rbp, %rdx
	je	.L1583
	movq	160(%rsp), %r9
	cmpq	%r15, %r9
	jb	.L1584
.L1325:
	movb	$46, (%rdx,%r13)
.L1541:
	movq	144(%rsp), %rax
	movq	%r15, %r13
	movb	$0, (%rax,%r15)
	movq	%r15, 152(%rsp)
	testq	%r12, %r12
	jne	.L1413
.L1331:
	cmpq	72(%rsp), %r14
	jb	.L1410
	movq	72(%rsp), %rax
	movq	%r14, %r8
	movq	152(%rsp), %r15
	subq	%rax, %r8
	leaq	(%rbx,%rax), %r9
	jmp	.L1409
.L1452:
	movq	$1, 80(%rsp)
	movq	88(%rsp), %rax
	movq	%rax, 72(%rsp)
	jmp	.L1286
.L1447:
	movq	%r14, 72(%rsp)
	jmp	.L1281
.L1442:
	movl	$30, %r13d
	movl	$31, %ecx
	jmp	.L1257
.L1576:
	movabsq	$9223372036854775806, %rax
	cmpq	%r9, %rax
	jb	.L1248
.L1416:
	leaq	1(%r9), %rcx
	jmp	.L1245
.L1579:
	movq	48(%rsp), %rax
	movzbl	(%rax), %eax
	movb	%al, (%r10)
	jmp	.L1261
.L1581:
	movq	48(%rsp), %rax
	movzbl	(%rax), %eax
	movb	%al, 0(%r13)
	jmp	.L1255
.L1558:
	movzbl	(%rdx), %eax
	movb	%al, 0(%r13)
	jmp	.L1305
.L1353:
	leaq	(%rdx,%r15), %rcx
	cmpq	$1, %r8
	je	.L1585
	movq	%r9, %rdx
	call	memcpy
	movq	144(%rsp), %rax
	movb	$0, (%rax,%r14)
	movq	%r14, 152(%rsp)
	jmp	.L1356
.L1352:
	movq	%r8, 32(%rsp)
	leaq	144(%rsp), %rcx
	xorl	%r8d, %r8d
	movq	%r15, %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	movq	144(%rsp), %rax
	movb	$0, (%rax,%r14)
	movq	%r14, 152(%rsp)
	jmp	.L1356
.L1364:
	movq	%r9, %rbx
	subq	72(%rsp), %rbx
	cmpq	%r14, %rax
	jb	.L1361
	addq	%r12, %r12
	cmpq	%r12, %r14
	jnb	.L1363
	leaq	1(%r12), %rcx
	cmpq	%r12, %rax
	jnb	.L1362
	movabsq	$9223372036854775807, %rcx
	movq	%rax, %r12
.L1362:
	call	_Znwy
	movq	%rax, %r15
	movq	72(%rsp), %rax
	testq	%rax, %rax
	je	.L1369
	cmpq	$1, %rax
	je	.L1586
	movq	72(%rsp), %r8
	movq	%r13, %rdx
	movq	%r15, %rcx
	call	memcpy
	movq	144(%rsp), %r13
.L1369:
	testq	%rbx, %rbx
	je	.L1371
	movq	72(%rsp), %rax
	movq	80(%rsp), %rcx
	addq	%rax, %rcx
	leaq	0(%r13,%rax), %rdx
	addq	%r15, %rcx
	cmpq	$1, %rbx
	je	.L1587
	movq	%rbx, %r8
	call	memcpy
	movq	144(%rsp), %r13
.L1371:
	cmpq	%rbp, %r13
	je	.L1373
	movq	160(%rsp), %rax
	movq	%r13, %rcx
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L1373:
	movq	72(%rsp), %rax
	movq	%r15, 144(%rsp)
	movq	%r12, 160(%rsp)
	leaq	(%r15,%rax), %rcx
	jmp	.L1365
.L1436:
	movb	$80, 71(%rsp)
	movl	$1, %r14d
	movb	$0, 56(%rsp)
	jmp	.L1225
.L1575:
	cmpq	%rbp, %rax
	je	.L1588
	movq	160(%rsp), %rax
	cmpq	$255, %rax
	ja	.L1267
	addq	%rax, %rax
	cmpq	$256, %rax
	jbe	.L1589
.L1415:
	leaq	1(%rax), %rcx
	movq	%rax, %r9
	jmp	.L1245
.L1406:
	cmpq	$1, %r8
	je	.L1590
	movq	%r13, %rdx
	call	memcpy
.L1384:
	movq	216(%rsp), %rax
	movq	176(%rsp), %rdx
	movb	$0, (%rdx,%rax)
	movq	208(%rsp), %rcx
	movq	%rax, 184(%rsp)
	jmp	.L1385
.L1566:
	cmpq	$15, %r13
	jbe	.L1311
	cmpq	$29, %r13
	ja	.L1313
	movq	$30, 48(%rsp)
.L1312:
	movq	48(%rsp), %rax
	leaq	1(%rax), %rcx
.L1320:
	call	_Znwy
	movq	%rax, %rcx
	movq	%r13, %r8
	movq	%rbx, %rdx
	movq	%rax, %r15
	call	memcpy
	movq	144(%rsp), %rcx
	cmpq	%rbp, %rcx
	je	.L1321
	movq	160(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L1321:
	movq	48(%rsp), %rax
	movq	%r15, 144(%rsp)
	movq	%rax, 160(%rsp)
	jmp	.L1317
.L1561:
	cmpq	$15, %r14
	jbe	.L1360
	movq	%r9, %rbx
	subq	72(%rsp), %rbx
	cmpq	%r14, %rax
	jb	.L1361
	cmpq	$29, %r14
	ja	.L1363
	movl	$30, %r12d
	movl	$31, %ecx
	jmp	.L1362
.L1563:
	movb	$48, (%rcx)
	jmp	.L1375
.L1314:
	addq	%rdx, %rdx
	movq	%rdx, 48(%rsp)
	cmpq	%rdx, %r13
	jb	.L1319
.L1313:
	movq	%r13, 48(%rsp)
	leaq	1(%r13), %rcx
	jmp	.L1320
.L1574:
	cmpq	$15, %r15
	jbe	.L1307
	jmp	.L1295
.L1571:
	cmpq	%r15, %rax
	jb	.L1335
	leaq	(%rdx,%rdx), %r10
	cmpq	%r10, %r15
	jnb	.L1337
	cmpq	%r10, %rax
	jnb	.L1336
	movabsq	$9223372036854775807, %rcx
	movq	%rax, %r10
.L1342:
	movq	%r10, 56(%rsp)
	movq	%r9, 48(%rsp)
	call	_Znwy
	testq	%r13, %r13
	movq	48(%rsp), %r9
	movq	56(%rsp), %r10
	movq	%rax, %r11
	je	.L1538
	cmpq	$1, %r13
	je	.L1591
	movq	%r13, %r8
	movq	%r9, %rdx
	movq	%rax, %rcx
	movq	%r10, 48(%rsp)
	call	memcpy
	movq	48(%rsp), %r10
	movq	%rax, %r11
.L1345:
	movq	144(%rsp), %r9
.L1538:
	cmpq	%rbp, %r9
	je	.L1346
	movq	160(%rsp), %rax
	movq	%r9, %rcx
	movq	%r11, 56(%rsp)
	movq	%r10, 48(%rsp)
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	56(%rsp), %r11
	movq	48(%rsp), %r10
.L1346:
	movq	%r11, 144(%rsp)
	movq	%r11, %r9
	movq	%r10, 160(%rsp)
	jmp	.L1339
.L1562:
	movzbl	(%rcx), %edx
	movq	72(%rsp), %rcx
	movb	%dl, (%rax)
	addq	144(%rsp), %rcx
	jmp	.L1365
.L1567:
	movzbl	(%rbx), %eax
	movb	%al, (%r15)
.L1537:
	movq	144(%rsp), %r15
	jmp	.L1317
.L1585:
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	movq	144(%rsp), %rax
	movb	$0, (%rax,%r14)
	movq	%r14, 152(%rsp)
	jmp	.L1356
.L1298:
	leaq	1(%r15), %rcx
	call	_Znwy
.LEHE22:
	movq	48(%rsp), %r9
	movq	%rax, %r13
	movq	%rbp, %rdx
	jmp	.L1299
.L1570:
	cmpq	$15, %r15
	jbe	.L1339
	cmpq	%r15, %rax
	jb	.L1335
	cmpq	$29, %r15
	ja	.L1337
	movl	$30, %r10d
.L1336:
	leaq	1(%r10), %rcx
	jmp	.L1342
.L1572:
	movb	$48, (%rcx)
	jmp	.L1348
.L1319:
	cmpq	48(%rsp), %rax
	jnb	.L1312
	movabsq	$9223372036854775807, %rcx
	movq	%rax, 48(%rsp)
	jmp	.L1320
.L1363:
	leaq	1(%r14), %rcx
	movq	%r14, %r12
	jmp	.L1362
.L1590:
	movzbl	224(%rsp), %eax
	movb	%al, (%rcx)
	jmp	.L1384
.L1582:
	movq	(%rcx), %rax
	leaq	_ZNSt8__format14_Fixedbuf_sinkIcE11_M_overflowEv(%rip), %r8
	movq	(%rax), %rax
	cmpq	%r8, %rax
	je	.L1592
	movq	%r9, 56(%rsp)
	movq	%rcx, 48(%rsp)
.LEHB23:
	call	*%rax
.LEHE23:
	movq	56(%rsp), %r9
	movq	48(%rsp), %rcx
	jmp	.L1397
.L1587:
	movzbl	(%rdx), %eax
	movb	%al, (%rcx)
	movq	144(%rsp), %r13
	jmp	.L1371
.L1586:
	movzbl	0(%r13), %eax
	movb	%al, (%r15)
	movq	144(%rsp), %r13
	jmp	.L1369
.L1584:
	movabsq	$9223372036854775807, %rcx
	cmpq	%rcx, %r15
	je	.L1593
	addq	%r9, %r9
	cmpq	%r9, %r15
	jnb	.L1594
	movabsq	$9223372036854775806, %rax
	cmpq	%r9, %rax
	jnb	.L1324
	movq	%rax, %r9
.L1328:
	movq	%rdx, 80(%rsp)
	movq	%r9, 56(%rsp)
.LEHB24:
	call	_Znwy
	movq	80(%rsp), %rdx
	movq	%rax, %rcx
	movq	%r13, %r8
	movq	%rax, 48(%rsp)
	call	memcpy
	movq	144(%rsp), %rcx
	movq	56(%rsp), %r9
	cmpq	%rbp, %rcx
	je	.L1329
	movq	160(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	56(%rsp), %r9
.L1329:
	movq	48(%rsp), %rax
	movq	%r9, 160(%rsp)
	movq	%rax, 144(%rsp)
	movb	$46, (%rax,%r13)
	jmp	.L1541
.L1588:
	movl	$256, %r9d
	movl	$257, %ecx
	jmp	.L1245
.L1337:
	leaq	1(%r15), %rcx
	movq	%r15, %r10
	jmp	.L1342
.L1583:
	cmpq	$16, %r15
	jne	.L1325
	movl	$30, %r9d
.L1324:
	leaq	1(%r9), %rcx
	jmp	.L1328
.L1591:
	movzbl	(%r9), %eax
	movb	%al, (%r11)
	jmp	.L1345
.L1594:
	leaq	2(%r13), %rcx
	movq	%r15, %r9
	jmp	.L1328
.L1592:
	movq	%rdx, 24(%rcx)
	jmp	.L1397
.L1589:
	movl	$256, %r9d
	jmp	.L1416
.L1297:
	leaq	.LC8(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L1560:
	leaq	.LC10(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.LEHE24:
.L1471:
	movq	%rax, %rbx
.L1402:
	leaq	176(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L1403:
	leaq	144(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rcx
.LEHB25:
	call	_Unwind_Resume
.LEHE25:
.L1361:
	leaq	.LC8(%rip), %rcx
.LEHB26:
	call	_ZSt20__throw_length_errorPKc
.L1559:
	movq	72(%rsp), %r8
	leaq	.LC17(%rip), %rdx
	leaq	.LC18(%rip), %rcx
	call	_ZSt24__throw_out_of_range_fmtPKcz
.L1565:
	leaq	.LC14(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L1469:
	movq	%rax, %rbx
	jmp	.L1403
.L1248:
	leaq	.LC8(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L1335:
	leaq	.LC8(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L1593:
	leaq	.LC8(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L1578:
	leaq	.LC8(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L1315:
	xorl	%eax, %eax
	movq	%r13, 32(%rsp)
	movq	%rbx, %r9
	xorl	%r8d, %r8d
	movq	%rax, 40(%rsp)
	leaq	144(%rsp), %rcx
	movq	%rbx, %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE15_M_replace_coldEPcyPKcyy
	jmp	.L1537
.L1569:
	leaq	.LC10(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L1470:
	leaq	136(%rsp), %rcx
	movq	%rax, %rbx
	call	_ZNSt6localeD1Ev
	jmp	.L1402
.L1573:
	leaq	.LC9(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L1410:
	movq	72(%rsp), %r8
	movq	%r14, %r9
	leaq	.LC15(%rip), %rdx
	leaq	.LC16(%rip), %rcx
	call	_ZSt24__throw_out_of_range_fmtPKcz
	nop
.LEHE26:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA7703:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE7703-.LLSDACSB7703
.LLSDACSB7703:
	.uleb128 .LEHB18-.LFB7703
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L1470-.LFB7703
	.uleb128 0
	.uleb128 .LEHB19-.LFB7703
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L1471-.LFB7703
	.uleb128 0
	.uleb128 .LEHB20-.LFB7703
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L1469-.LFB7703
	.uleb128 0
	.uleb128 .LEHB21-.LFB7703
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L1471-.LFB7703
	.uleb128 0
	.uleb128 .LEHB22-.LFB7703
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L1469-.LFB7703
	.uleb128 0
	.uleb128 .LEHB23-.LFB7703
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L1471-.LFB7703
	.uleb128 0
	.uleb128 .LEHB24-.LFB7703
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L1469-.LFB7703
	.uleb128 0
	.uleb128 .LEHB25-.LFB7703
	.uleb128 .LEHE25-.LEHB25
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB26-.LFB7703
	.uleb128 .LEHE26-.LEHB26
	.uleb128 .L1469-.LFB7703
	.uleb128 0
.LLSDACSE7703:
	.section	.text$_ZNKSt8__format14__formatter_fpIcE6formatIfNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.seh_endproc
	.section	.text$_ZNKSt8__format14__formatter_fpIcE6formatIdNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt8__format14__formatter_fpIcE6formatIdNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	.def	_ZNKSt8__format14__formatter_fpIcE6formatIdNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format14__formatter_fpIcE6formatIdNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
_ZNKSt8__format14__formatter_fpIcE6formatIdNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_:
.LFB7709:
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
	subq	$392, %rsp
	.seh_stackalloc	392
	movups	%xmm6, 368(%rsp)
	.seh_savexmm	%xmm6, 368
	.seh_endprologue
	movb	$0, 160(%rsp)
	movzbl	16(%rcx), %eax
	movq	%rcx, %rsi
	movapd	%xmm1, %xmm6
	leaq	160(%rsp), %rbp
	movq	%r8, %rdi
	movq	$0, 152(%rsp)
	movq	%rbp, 144(%rsp)
	andl	$12, %eax
	jne	.L1922
	movzbl	24(%rcx), %edx
	leaq	.L1802(%rip), %rcx
	movq	%rdx, %rax
	andl	$15, %eax
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1802:
	.long	.L1616-.L1802
	.long	.L1807-.L1802
	.long	.L1806-.L1802
	.long	.L1610-.L1802
	.long	.L1614-.L1802
	.long	.L1805-.L1802
	.long	.L1804-.L1802
	.long	.L1803-.L1802
	.long	.L1846-.L1802
	.section	.text$_ZNKSt8__format14__formatter_fpIcE6formatIdNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L1616:
	leaq	112(%rsp), %rbx
	movapd	%xmm6, %xmm3
	leaq	368(%rsp), %r8
	leaq	241(%rsp), %rdx
	movq	%rbx, %rcx
	call	_ZSt8to_charsPcS_d
	movq	112(%rsp), %r13
	cmpl	$132, 120(%rsp)
	je	.L1815
	leaq	368(%rsp), %rax
	movb	$0, 56(%rsp)
	movl	$6, %r12d
	leaq	241(%rsp), %rbx
	movb	$101, 71(%rsp)
	movq	%rax, 48(%rsp)
.L1618:
	movmskpd	%xmm6, %eax
	movl	$1, %r9d
	testb	$1, %al
	jne	.L1649
	movzbl	8(%rsi), %eax
	andl	$12, %eax
	cmpb	$4, %al
	je	.L1923
	xorl	%r9d, %r9d
	cmpb	$12, %al
	jne	.L1649
	movb	$32, -1(%rbx)
	movl	$1, %r9d
	subq	$1, %rbx
	.p2align 4
	.p2align 3
.L1649:
	movzbl	12(%rsi), %r15d
	movq	%r13, %r14
	subq	%rbx, %r14
	testb	$1, %r15b
	je	.L1651
	movsd	.LC20(%rip), %xmm1
	movapd	%xmm6, %xmm0
	andpd	.LC19(%rip), %xmm0
	ucomisd	%xmm0, %xmm1
	jb	.L1652
	testq	%r14, %r14
	je	.L1653
	movq	%r14, %r8
	movl	$46, %edx
	movq	%rbx, %rcx
	movb	%r9b, 72(%rsp)
	call	memchr
	movzbl	72(%rsp), %r9d
	testq	%rax, %rax
	je	.L1654
	subq	%rbx, %rax
	movq	%rax, 88(%rsp)
	cmpq	$-1, %rax
	je	.L1654
	leaq	1(%rax), %r11
	cmpq	%r14, %r11
	jnb	.L1924
	movsbl	71(%rsp), %edx
	movq	%r14, %r8
	leaq	(%rbx,%r11), %rcx
	movb	%r9b, 80(%rsp)
	subq	%r11, %r8
	movq	%r11, 72(%rsp)
	call	memchr
	movq	72(%rsp), %r11
	movzbl	80(%rsp), %r9d
	testq	%rax, %rax
	je	.L1825
	subq	%rbx, %rax
	cmpq	$-1, %rax
	cmove	%r14, %rax
	movq	%rax, 72(%rsp)
.L1659:
	xorl	%eax, %eax
	movq	88(%rsp), %rdx
	cmpq	%rdx, 72(%rsp)
	sete	%al
	movq	%rax, 80(%rsp)
	cmpb	$0, 56(%rsp)
	je	.L1827
	cmpb	$48, (%rbx,%r9)
	je	.L1660
.L1657:
	movq	72(%rsp), %rax
	subq	%r9, %rax
	subq	$1, %rax
.L1661:
	testq	%r12, %r12
	jne	.L1665
	.p2align 4
	.p2align 3
.L1656:
	cmpq	$0, 80(%rsp)
	jne	.L1664
.L1666:
	leaq	192(%rsp), %r12
	andl	$2, %r15d
	movb	$0, 192(%rsp)
	movq	%r12, 176(%rsp)
	movq	$0, 184(%rsp)
	je	.L1917
.L1792:
	cmpb	$0, 32(%rdi)
	je	.L1925
.L1757:
	leaq	24(%rdi), %rdx
	leaq	136(%rsp), %rcx
	call	_ZNSt6localeC1ERKS_
	movzbl	71(%rsp), %r8d
	leaq	208(%rsp), %rcx
	leaq	96(%rsp), %rdx
	leaq	136(%rsp), %r9
	movq	%r14, 96(%rsp)
	movq	%rbx, 104(%rsp)
.LEHB27:
	call	_ZNKSt8__format14__formatter_fpIcE11_M_localizeB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEEcRKSt6locale.isra.0
.LEHE27:
	leaq	136(%rsp), %rcx
	call	_ZNSt6localeD1Ev
	movq	216(%rsp), %r8
	testq	%r8, %r8
	je	.L1843
	movq	176(%rsp), %rcx
	cmpq	%r12, %rcx
	je	.L1926
	movq	208(%rsp), %rax
	leaq	224(%rsp), %r13
	cmpq	%r13, %rax
	je	.L1784
	movq	192(%rsp), %rdx
	movq	%r8, %xmm0
	movq	%rax, 176(%rsp)
	movhps	224(%rsp), %xmm0
	movups	%xmm0, 184(%rsp)
	testq	%rcx, %rcx
	je	.L1764
	movq	%rcx, 208(%rsp)
	movq	%rdx, 224(%rsp)
.L1763:
	movb	$0, (%rcx)
	movq	184(%rsp), %r14
	movq	176(%rsp), %r15
	jmp	.L1758
	.p2align 4,,10
	.p2align 3
.L1651:
	leaq	192(%rsp), %r12
	andl	$2, %r15d
	movb	$0, 192(%rsp)
	movq	%r12, 176(%rsp)
	movq	$0, 184(%rsp)
	je	.L1917
	movsd	.LC20(%rip), %xmm1
	movapd	%xmm6, %xmm0
	andpd	.LC19(%rip), %xmm0
	ucomisd	%xmm0, %xmm1
	jnb	.L1792
.L1917:
	movq	%rbx, %r13
.L1755:
	movzbl	16(%rsi), %eax
	andl	$3, %eax
	cmpb	$1, %al
	je	.L1927
	cmpb	$2, %al
	je	.L1928
.L1767:
	movq	16(%rdi), %rsi
	testq	%r14, %r14
	jne	.L1929
.L1770:
	movq	176(%rsp), %rcx
	cmpq	%r12, %rcx
	je	.L1777
	movq	192(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L1777:
	movq	144(%rsp), %rcx
	cmpq	%rbp, %rcx
	je	.L1863
	movq	160(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	nop
.L1863:
	movups	368(%rsp), %xmm6
	movq	%rsi, %rax
	addq	$392, %rsp
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
.L1927:
	movzwl	(%rsi), %r9d
.L1766:
	cmpq	%r9, %r14
	jnb	.L1767
	movzbl	8(%rsi), %r8d
	movq	16(%rdi), %rcx
	andl	$3, %r8d
	jne	.L1930
	testb	$4, 12(%rsi)
	je	.L1774
	andpd	.LC19(%rip), %xmm6
	movsd	.LC20(%rip), %xmm0
	ucomisd	%xmm6, %xmm0
	jb	.L1774
	movzbl	0(%r13), %eax
	leaq	_ZNSt8__detail31__from_chars_alnum_to_val_tableILb0EE5valueE(%rip), %rdx
	cmpb	$15, (%rdx,%rax)
	ja	.L1931
	movq	%r14, %rdx
	movl	$2, %r8d
	movl	$48, %eax
	jmp	.L1772
	.p2align 4,,10
	.p2align 3
.L1774:
	movq	%r14, %rdx
	movl	$2, %r8d
	movl	$32, %eax
.L1772:
	movl	%eax, 32(%rsp)
	subq	%r14, %r9
	andl	$3, %r8d
	movq	%rdx, 96(%rsp)
	leaq	96(%rsp), %rdx
	movq	%rbx, 104(%rsp)
.LEHB28:
	call	_ZNSt8__format14__write_paddedINS_10_Sink_iterIcEEcEET_S3_St17basic_string_viewIT0_St11char_traitsIS5_EENS_6_AlignEyDi
.LEHE28:
	movq	%rax, %rsi
	jmp	.L1770
	.p2align 4,,10
	.p2align 3
.L1922:
	cmpb	$4, %al
	je	.L1932
	movq	$-1, %r12
	cmpb	$8, %al
	je	.L1933
.L1598:
	movzbl	24(%rsi), %edx
	leaq	.L1795(%rip), %rcx
	movq	%rdx, %rax
	andl	$15, %eax
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1795:
	.long	.L1801-.L1795
	.long	.L1908-.L1795
	.long	.L1907-.L1795
	.long	.L1606-.L1795
	.long	.L1605-.L1795
	.long	.L1906-.L1795
	.long	.L1905-.L1795
	.long	.L1904-.L1795
	.long	.L1903-.L1795
	.section	.text$_ZNKSt8__format14__formatter_fpIcE6formatIdNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L1652:
	leaq	192(%rsp), %r12
	movb	$0, 192(%rsp)
	movq	%r12, 176(%rsp)
	movq	$0, 184(%rsp)
	jmp	.L1917
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L1934:
	addq	$1, %r11
	cmpq	%r14, %r11
	jnb	.L1913
.L1660:
	cmpb	$48, (%rbx,%r11)
	je	.L1934
	jmp	.L1658
	.p2align 4,,10
	.p2align 3
.L1843:
	movq	%rbx, %r15
	leaq	224(%rsp), %r13
.L1758:
	movq	208(%rsp), %rcx
	cmpq	%r13, %rcx
	je	.L1782
	movq	224(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L1782:
	movq	%rbx, %r13
	movq	%r15, %rbx
	jmp	.L1755
	.p2align 4,,10
	.p2align 3
.L1654:
	movsbl	71(%rsp), %edx
	movq	%r14, %r8
	movq	%rbx, %rcx
	movb	%r9b, 72(%rsp)
	call	memchr
	movzbl	72(%rsp), %r9d
	testq	%rax, %rax
	jne	.L1662
	.p2align 4
	.p2align 3
.L1653:
	movq	%r14, 88(%rsp)
.L1663:
	cmpb	$0, 56(%rsp)
	je	.L1829
	testq	%r12, %r12
	je	.L1830
	movq	$1, 80(%rsp)
	movq	88(%rsp), %rdx
	movq	%rdx, 72(%rsp)
	movq	%rdx, %rax
	subq	%r9, %rax
.L1665:
	subq	%rax, %r12
	addq	%r12, 80(%rsp)
	jmp	.L1656
	.p2align 4,,10
	.p2align 3
.L1846:
	movl	$6, %r12d
.L1903:
	movb	$101, 71(%rsp)
	movl	$2, %r15d
	movl	$1, %r14d
	movb	$0, 56(%rsp)
	.p2align 4
	.p2align 3
.L1603:
	movl	%r12d, 40(%rsp)
	leaq	112(%rsp), %rbx
	movapd	%xmm6, %xmm3
	leaq	368(%rsp), %r8
	movl	%r15d, 32(%rsp)
	leaq	241(%rsp), %rdx
	movq	%rbx, %rcx
	call	_ZSt8to_charsPcS_dSt12chars_formati
	movq	112(%rsp), %r13
	cmpl	$132, 120(%rsp)
	je	.L1619
.L1912:
	leaq	368(%rsp), %rax
	leaq	241(%rsp), %rbx
	movq	%rax, 48(%rsp)
.L1620:
	testb	%r14b, %r14b
	je	.L1618
	cmpq	%r13, %rbx
	je	.L1618
	movq	__imp_toupper(%rip), %r14
	movq	%rbx, %r15
	.p2align 4
	.p2align 3
.L1648:
	movsbl	(%r15), %ecx
	addq	$1, %r15
	call	*%r14
	movb	%al, -1(%r15)
	cmpq	%r13, %r15
	jne	.L1648
	jmp	.L1618
	.p2align 4,,10
	.p2align 3
.L1807:
	movl	$6, %r12d
.L1908:
	movb	$101, 71(%rsp)
	movl	$3, %r15d
	xorl	%r14d, %r14d
	movb	$1, 56(%rsp)
	jmp	.L1603
	.p2align 4,,10
	.p2align 3
.L1806:
	movl	$6, %r12d
.L1907:
	movb	$69, 71(%rsp)
	movl	$3, %r15d
	movl	$1, %r14d
	movb	$1, 56(%rsp)
	jmp	.L1603
	.p2align 4,,10
	.p2align 3
.L1610:
	andl	$15, %edx
	xorl	%r14d, %r14d
	movl	$101, %eax
	cmpb	$4, %dl
	movl	$112, %edx
	cmovne	%edx, %eax
	movb	%al, 71(%rsp)
.L1612:
	movl	$4, 32(%rsp)
	leaq	112(%rsp), %rbx
	movapd	%xmm6, %xmm3
	leaq	368(%rsp), %r8
	leaq	241(%rsp), %rdx
	movq	%rbx, %rcx
	call	_ZSt8to_charsPcS_dSt12chars_format
	movq	112(%rsp), %r13
	cmpl	$132, 120(%rsp)
	je	.L1816
	movb	$0, 56(%rsp)
	movl	$6, %r12d
	jmp	.L1912
	.p2align 4,,10
	.p2align 3
.L1614:
	andl	$15, %edx
	movl	$112, %eax
	movl	$1, %r14d
	cmpb	$4, %dl
	movl	$80, %edx
	cmove	%edx, %eax
	movb	%al, 71(%rsp)
	jmp	.L1612
	.p2align 4,,10
	.p2align 3
.L1805:
	movl	$6, %r12d
.L1906:
	movl	$1, %r15d
.L1911:
	movb	$101, 71(%rsp)
	xorl	%r14d, %r14d
	movb	$0, 56(%rsp)
	jmp	.L1603
	.p2align 4,,10
	.p2align 3
.L1804:
	movl	$6, %r12d
.L1905:
	movb	$69, 71(%rsp)
	movl	$1, %r15d
	movl	$1, %r14d
	movb	$0, 56(%rsp)
	jmp	.L1603
	.p2align 4,,10
	.p2align 3
.L1803:
	movl	$6, %r12d
.L1904:
	movb	$101, 71(%rsp)
	movl	$2, %r15d
	xorl	%r14d, %r14d
	movb	$0, 56(%rsp)
	jmp	.L1603
	.p2align 4,,10
	.p2align 3
.L1925:
	leaq	24(%rdi), %rcx
	call	_ZNSt6localeC1Ev
	movb	$1, 32(%rdi)
	jmp	.L1757
	.p2align 4,,10
	.p2align 3
.L1933:
	movzwl	2(%rcx), %ecx
	movq	%r8, %rdx
.LEHB29:
	call	_ZNKSt8__format5_SpecIcE16_M_get_precisionISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
.LEHE29:
	movzbl	24(%rsi), %edx
	movq	%rax, %r12
	leaq	.L1601(%rip), %rcx
	movq	%rdx, %rax
	andl	$15, %eax
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1601:
	.long	.L1801-.L1601
	.long	.L1908-.L1601
	.long	.L1907-.L1601
	.long	.L1606-.L1601
	.long	.L1605-.L1601
	.long	.L1906-.L1601
	.long	.L1905-.L1601
	.long	.L1904-.L1601
	.long	.L1903-.L1601
	.section	.text$_ZNKSt8__format14__formatter_fpIcE6formatIdNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L1801:
	movb	$101, 71(%rsp)
	movl	$3, %r15d
	xorl	%r14d, %r14d
	movb	$0, 56(%rsp)
	jmp	.L1603
	.p2align 4,,10
	.p2align 3
.L1923:
	movb	$43, -1(%rbx)
	subq	$1, %rbx
	jmp	.L1649
	.p2align 4,,10
	.p2align 3
.L1930:
	movl	4(%rsi), %eax
	movq	%r14, %rdx
	jmp	.L1772
	.p2align 4,,10
	.p2align 3
.L1929:
	leaq	96(%rsp), %rdx
	movq	%rsi, %rcx
	movq	%r14, 96(%rsp)
	movq	%rbx, 104(%rsp)
.LEHB30:
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	jmp	.L1770
	.p2align 4,,10
	.p2align 3
.L1928:
	movzwl	(%rsi), %ecx
	movq	%rdi, %rdx
	call	_ZNKSt8__format5_SpecIcE12_M_get_widthISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
.LEHE30:
	movq	%rax, %r9
	jmp	.L1766
	.p2align 4,,10
	.p2align 3
.L1829:
	movq	88(%rsp), %rax
	xorl	%r12d, %r12d
	movq	$1, 80(%rsp)
	movq	%rax, 72(%rsp)
.L1664:
	movq	80(%rsp), %rdx
	movq	152(%rsp), %r9
	leaq	(%r14,%rdx), %r15
	testq	%r9, %r9
	jne	.L1667
	movq	48(%rsp), %rax
	subq	%r13, %rax
	cmpq	%rdx, %rax
	jnb	.L1668
	movq	144(%rsp), %rdx
	cmpq	%rbp, %rdx
	je	.L1935
	movq	160(%rsp), %rax
	cmpq	%r15, %rax
	jnb	.L1674
.L1678:
	movabsq	$9223372036854775806, %r8
	cmpq	%r15, %r8
	jb	.L1675
	addq	%rax, %rax
	leaq	1(%r15), %rcx
	cmpq	%rax, %r15
	jnb	.L1681
	cmpq	%rax, %r8
	leaq	1(%rax), %r10
	movabsq	$9223372036854775807, %rcx
	cmovb	%r8, %rax
	cmovnb	%r10, %rcx
	movq	%rax, %r15
.L1681:
	movq	%r9, 56(%rsp)
	movq	%rdx, 48(%rsp)
.LEHB31:
	call	_Znwy
	movq	56(%rsp), %r9
	movq	48(%rsp), %rdx
	movq	%rax, %r13
.L1677:
	leaq	1(%r9), %r8
	testq	%r9, %r9
	je	.L1936
	movq	%r13, %rcx
	call	memcpy
.L1683:
	movq	144(%rsp), %rcx
	cmpq	%rbp, %rcx
	je	.L1914
	movq	160(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L1914:
	movq	152(%rsp), %r9
	movq	%r13, 144(%rsp)
	movq	%r15, 160(%rsp)
	testq	%r9, %r9
	je	.L1674
.L1685:
	cmpq	72(%rsp), %r9
	jb	.L1937
	movabsq	$9223372036854775806, %rax
	movq	%rax, %rdx
	subq	%r9, %rdx
	cmpq	80(%rsp), %rdx
	jb	.L1938
	movq	80(%rsp), %rbx
	movq	144(%rsp), %r13
	leaq	(%rbx,%r9), %r14
	cmpq	%rbp, %r13
	je	.L1939
	movq	160(%rsp), %r12
	cmpq	%r14, %r12
	jb	.L1742
.L1738:
	movq	72(%rsp), %rax
	leaq	0(%r13,%rax), %rcx
	subq	%rax, %r9
	je	.L1743
	movq	80(%rsp), %rax
	addq	%rcx, %rax
	cmpq	$1, %r9
	je	.L1940
	movq	%rcx, %rdx
	movq	%r9, %r8
	movq	%rax, %rcx
	call	memmove
	movq	72(%rsp), %rcx
	addq	144(%rsp), %rcx
.L1743:
	cmpq	$1, 80(%rsp)
	je	.L1941
	movq	80(%rsp), %r8
	movl	$48, %edx
	call	memset
.L1753:
	movq	144(%rsp), %rax
	movq	88(%rsp), %rbx
	movb	$0, (%rax,%r14)
	movq	%r14, 152(%rsp)
	cmpq	%rbx, 72(%rsp)
	jne	.L1734
	movq	144(%rsp), %rax
	movq	72(%rsp), %rbx
	movb	$46, (%rax,%rbx)
	movq	152(%rsp), %r14
	.p2align 4
	.p2align 3
.L1734:
	movq	144(%rsp), %rbx
	movzbl	12(%rsi), %r15d
	jmp	.L1666
	.p2align 4,,10
	.p2align 3
.L1932:
	movzwl	2(%rcx), %r12d
	jmp	.L1598
	.p2align 4,,10
	.p2align 3
.L1924:
	cmpq	%rax, %r14
	movq	%r14, 72(%rsp)
	sete	%al
	cmpb	$0, 56(%rsp)
	movzbl	%al, %eax
	movq	%rax, 80(%rsp)
	jne	.L1942
.L1827:
	xorl	%r12d, %r12d
	jmp	.L1656
	.p2align 4,,10
	.p2align 3
.L1662:
	subq	%rbx, %rax
	cmpq	$-1, %rax
	cmove	%r14, %rax
	movq	%rax, 88(%rsp)
	jmp	.L1663
.L1942:
	cmpb	$48, (%rbx,%r9)
	jne	.L1657
.L1913:
	movq	$-1, %r11
.L1658:
	movq	72(%rsp), %rax
	subq	%r11, %rax
	jmp	.L1661
.L1606:
	andl	$15, %edx
	movl	$4, %r15d
	cmpb	$4, %dl
	je	.L1911
	movb	$112, 71(%rsp)
	xorl	%r14d, %r14d
	movb	$0, 56(%rsp)
	jmp	.L1603
.L1605:
	andl	$15, %edx
	movl	$4, %r15d
	cmpb	$4, %dl
	je	.L1814
	movb	$112, 71(%rsp)
	movl	$1, %r14d
	movb	$0, 56(%rsp)
	jmp	.L1603
.L1935:
	cmpq	$15, %r15
	jbe	.L1674
.L1673:
	movabsq	$9223372036854775806, %rax
	cmpq	%r15, %rax
	jb	.L1675
	movq	%r9, 48(%rsp)
	cmpq	$29, %r15
	ja	.L1676
	movl	$31, %ecx
	call	_Znwy
	movq	48(%rsp), %r9
	movq	%rax, %r13
	movl	$30, %r15d
	movq	%rbp, %rdx
	jmp	.L1677
	.p2align 4,,10
	.p2align 3
.L1674:
	movq	72(%rsp), %rax
	cmpq	%r14, %rax
	movq	%rax, %r13
	movabsq	$9223372036854775806, %rax
	cmova	%r14, %r13
	cmpq	%r13, %rax
	jb	.L1943
	movq	144(%rsp), %r15
	cmpq	%rbp, %r15
	je	.L1944
	movq	160(%rsp), %rdx
	cmpq	%r13, %rdx
	jb	.L1692
.L1689:
	cmpq	%r15, %rbx
	je	.L1693
	testq	%r13, %r13
	je	.L1695
	cmpq	$1, %r13
	je	.L1945
	movq	%r15, %rcx
	movq	%r13, %r8
	movq	%rbx, %rdx
	call	memcpy
	movq	144(%rsp), %r15
.L1695:
	movb	$0, (%r15,%r13)
	movq	88(%rsp), %rdx
	movq	%r13, 152(%rsp)
	cmpq	%rdx, 72(%rsp)
	je	.L1946
	testq	%r12, %r12
	je	.L1709
.L1791:
	movabsq	$9223372036854775806, %rax
	movq	%rax, %rdx
	subq	%r13, %rdx
	cmpq	%r12, %rdx
	jb	.L1947
	movq	144(%rsp), %r9
	leaq	(%r12,%r13), %r15
	cmpq	%rbp, %r9
	je	.L1948
	movq	160(%rsp), %rdx
	cmpq	%r15, %rdx
	jb	.L1949
.L1717:
	leaq	(%r9,%r13), %rcx
	cmpq	$1, %r12
	je	.L1950
	movq	%r12, %r8
	movl	$48, %edx
	call	memset
.L1726:
	movq	144(%rsp), %rax
	movb	$0, (%rax,%r15)
	movq	%r15, 152(%rsp)
	cmpq	72(%rsp), %r14
	jb	.L1788
	movq	72(%rsp), %rax
	movq	%r14, %r8
	subq	%rax, %r8
	leaq	(%rbx,%rax), %r9
.L1787:
	movabsq	$9223372036854775806, %rax
	subq	%r15, %rax
	cmpq	%r8, %rax
	jb	.L1951
	movq	144(%rsp), %rdx
	movl	$15, %eax
	leaq	(%r15,%r8), %r14
	cmpq	%rbp, %rdx
	cmovne	160(%rsp), %rax
	cmpq	%r14, %rax
	jb	.L1730
	testq	%r8, %r8
	jne	.L1731
	movb	$0, (%rdx,%r14)
	movq	%r14, 152(%rsp)
	jmp	.L1734
	.p2align 4,,10
	.p2align 3
.L1667:
	movq	144(%rsp), %rdx
	cmpq	%rbp, %rdx
	je	.L1952
	movq	160(%rsp), %rax
	cmpq	%r15, %rax
	jnb	.L1685
	jmp	.L1678
.L1815:
	movb	$0, 72(%rsp)
	xorl	%r15d, %r15d
	xorl	%r14d, %r14d
	movl	$6, %r12d
	movb	$0, 56(%rsp)
	movl	$14, %r9d
	movb	$101, 71(%rsp)
.L1617:
	movq	144(%rsp), %rax
	movq	%rax, 48(%rsp)
	cmpq	$128, %r9
	jbe	.L1953
	cmpq	%rbp, 48(%rsp)
	je	.L1954
	movq	160(%rsp), %rax
	cmpq	%r9, %rax
	jb	.L1955
.L1645:
	cmpq	%rbp, 48(%rsp)
	je	.L1820
	movq	160(%rsp), %rax
	leaq	(%rax,%rax), %r13
	cmpq	%r13, %rax
	jnb	.L1636
	movabsq	$9223372036854775806, %rax
	cmpq	%r13, %rax
	jb	.L1956
	leaq	1(%r13), %rcx
.L1635:
	call	_Znwy
	movq	%rax, %r10
	movq	152(%rsp), %rax
	leaq	1(%rax), %r8
	testq	%rax, %rax
	je	.L1957
	movq	48(%rsp), %rdx
	movq	%r10, %rcx
	call	memcpy
	movq	%rax, %r10
.L1639:
	movq	144(%rsp), %rcx
	cmpq	%rbp, %rcx
	je	.L1640
	movq	160(%rsp), %rax
	movq	%r10, 48(%rsp)
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	48(%rsp), %r10
.L1640:
	movq	%r10, 144(%rsp)
	movq	%r13, 160(%rsp)
	movq	%r10, 48(%rsp)
.L1636:
	movq	48(%rsp), %rax
	leaq	-1(%rax,%r13), %r8
	leaq	1(%rax), %rdx
	cmpb	$0, 72(%rsp)
	jne	.L1958
	testl	%r15d, %r15d
	je	.L1643
	movl	%r15d, 32(%rsp)
	movapd	%xmm6, %xmm3
	movq	%rbx, %rcx
	call	_ZSt8to_charsPcS_dSt12chars_format
	movq	112(%rsp), %r10
	movq	120(%rsp), %rax
.L1642:
	movq	%r10, %r13
	testl	%eax, %eax
	jne	.L1644
	movq	144(%rsp), %rdx
	movq	%r10, %rax
	subq	48(%rsp), %rax
	movb	$0, (%rdx,%rax)
	movq	144(%rsp), %rdx
	movq	%rax, 152(%rsp)
	addq	%rdx, %rax
	leaq	1(%rdx), %rbx
	movq	%rax, 48(%rsp)
	jmp	.L1620
	.p2align 4,,10
	.p2align 3
.L1644:
	movq	144(%rsp), %rdx
	movb	$0, (%rdx)
	movq	144(%rsp), %rdx
	movq	$0, 152(%rsp)
	movq	%rdx, 48(%rsp)
	cmpl	$132, %eax
	je	.L1645
	leaq	1(%rdx), %rbx
	jmp	.L1620
.L1643:
	movapd	%xmm6, %xmm3
	movq	%rbx, %rcx
	call	_ZSt8to_charsPcS_d
	movq	112(%rsp), %r10
	movq	120(%rsp), %rax
	jmp	.L1642
.L1816:
	movb	$0, 72(%rsp)
	movl	$4, %r15d
	movl	$6, %r12d
	movl	$14, %r9d
	movb	$0, 56(%rsp)
	jmp	.L1617
.L1958:
	movl	%r12d, 40(%rsp)
	movapd	%xmm6, %xmm3
	movq	%rbx, %rcx
	movl	%r15d, 32(%rsp)
	call	_ZSt8to_charsPcS_dSt12chars_formati
	movq	112(%rsp), %r10
	movq	120(%rsp), %rax
	jmp	.L1642
.L1619:
	movb	$1, 72(%rsp)
	leaq	8(%r12), %r9
	cmpl	$2, %r15d
	jne	.L1617
	leaq	208(%rsp), %rdx
	movapd	%xmm6, %xmm0
	movq	%r9, 48(%rsp)
	movl	$0, 208(%rsp)
	call	frexp
	movq	48(%rsp), %r9
	movb	$1, 72(%rsp)
	movl	208(%rsp), %ecx
	imull	$4004, %ecx, %eax
	movq	%rax, %rdx
	imulq	$995517945, %rax, %rax
	shrq	$32, %rax
	subl	%eax, %edx
	shrl	%edx
	addl	%edx, %eax
	shrl	$13, %eax
	addl	$1, %eax
	addq	%r9, %rax
	testl	%ecx, %ecx
	cmovg	%rax, %r9
	jmp	.L1617
.L1955:
	movabsq	$9223372036854775806, %rdx
	cmpq	%r9, %rdx
	jb	.L1626
	addq	%rax, %rax
	cmpq	%rax, %r9
	jnb	.L1794
	movabsq	$9223372036854775807, %rcx
	movq	%rdx, %r9
	cmpq	%rax, %rdx
	jnb	.L1793
.L1623:
	movq	%r9, 80(%rsp)
	call	_Znwy
	movq	%rax, %r13
	movq	152(%rsp), %rax
	movq	80(%rsp), %r9
	testq	%rax, %rax
	leaq	1(%rax), %r8
	je	.L1959
	movq	48(%rsp), %rdx
	movq	%r13, %rcx
	movq	%r9, 80(%rsp)
	call	memcpy
	movq	80(%rsp), %r9
.L1633:
	movq	144(%rsp), %rcx
	cmpq	%rbp, %rcx
	je	.L1634
	movq	160(%rsp), %rax
	movq	%r9, 48(%rsp)
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	48(%rsp), %r9
.L1634:
	movq	%r13, 144(%rsp)
	movq	%r9, 160(%rsp)
	movq	%r13, 48(%rsp)
	jmp	.L1645
.L1668:
	movq	72(%rsp), %rax
	movq	80(%rsp), %rcx
	movq	%r14, %r8
	addq	%rax, %rcx
	leaq	(%rbx,%rax), %r13
	subq	%rax, %r8
	movq	%rax, %r14
	addq	%rbx, %rcx
	movq	%r13, %rdx
	call	memmove
	cmpq	88(%rsp), %r14
	jne	.L1686
	movq	72(%rsp), %rax
	movb	$46, 0(%r13)
	leaq	1(%rbx,%rax), %r13
.L1686:
	movq	%r12, %r8
	movl	$48, %edx
	movq	%r13, %rcx
	movq	%r15, %r14
	call	memset
	movzbl	12(%rsi), %r15d
	jmp	.L1666
.L1931:
	movq	24(%rcx), %rax
	movzbl	(%rbx), %edx
	leaq	1(%rax), %r8
	movq	%r8, 24(%rcx)
	movb	%dl, (%rax)
	movq	8(%rcx), %rdx
	movq	24(%rcx), %rax
	subq	%rdx, %rax
	cmpq	16(%rcx), %rax
	je	.L1960
.L1775:
	addq	$1, %rbx
	leaq	-1(%r14), %rdx
	movl	$2, %r8d
	movl	$48, %eax
	jmp	.L1772
.L1926:
	movq	208(%rsp), %rax
	leaq	224(%rsp), %r13
	cmpq	%r13, %rax
	je	.L1784
	movq	%rax, 176(%rsp)
	movq	%r8, %xmm0
	movhps	224(%rsp), %xmm0
	movups	%xmm0, 184(%rsp)
.L1764:
	movq	%r13, 208(%rsp)
	leaq	224(%rsp), %r13
	movq	%r13, %rcx
	jmp	.L1763
.L1946:
	movq	144(%rsp), %rdx
	leaq	1(%r13), %r15
	cmpq	%rbp, %rdx
	je	.L1961
	movq	160(%rsp), %r9
	cmpq	%r15, %r9
	jb	.L1962
.L1703:
	movb	$46, (%rdx,%r13)
.L1919:
	movq	144(%rsp), %rax
	movq	%r15, %r13
	movb	$0, (%rax,%r15)
	movq	%r15, 152(%rsp)
	testq	%r12, %r12
	jne	.L1791
.L1709:
	cmpq	72(%rsp), %r14
	jb	.L1788
	movq	72(%rsp), %rax
	movq	%r14, %r8
	movq	152(%rsp), %r15
	subq	%rax, %r8
	leaq	(%rbx,%rax), %r9
	jmp	.L1787
.L1830:
	movq	$1, 80(%rsp)
	movq	88(%rsp), %rax
	movq	%rax, 72(%rsp)
	jmp	.L1664
.L1825:
	movq	%r14, 72(%rsp)
	jmp	.L1659
.L1820:
	movl	$30, %r13d
	movl	$31, %ecx
	jmp	.L1635
.L1954:
	movabsq	$9223372036854775806, %rax
	cmpq	%r9, %rax
	jb	.L1626
.L1794:
	leaq	1(%r9), %rcx
	jmp	.L1623
.L1957:
	movq	48(%rsp), %rax
	movzbl	(%rax), %eax
	movb	%al, (%r10)
	jmp	.L1639
.L1959:
	movq	48(%rsp), %rax
	movzbl	(%rax), %eax
	movb	%al, 0(%r13)
	jmp	.L1633
.L1936:
	movzbl	(%rdx), %eax
	movb	%al, 0(%r13)
	jmp	.L1683
.L1731:
	leaq	(%rdx,%r15), %rcx
	cmpq	$1, %r8
	je	.L1963
	movq	%r9, %rdx
	call	memcpy
	movq	144(%rsp), %rax
	movb	$0, (%rax,%r14)
	movq	%r14, 152(%rsp)
	jmp	.L1734
.L1730:
	movq	%r8, 32(%rsp)
	leaq	144(%rsp), %rcx
	xorl	%r8d, %r8d
	movq	%r15, %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	movq	144(%rsp), %rax
	movb	$0, (%rax,%r14)
	movq	%r14, 152(%rsp)
	jmp	.L1734
.L1742:
	movq	%r9, %rbx
	subq	72(%rsp), %rbx
	cmpq	%r14, %rax
	jb	.L1739
	addq	%r12, %r12
	cmpq	%r12, %r14
	jnb	.L1741
	leaq	1(%r12), %rcx
	cmpq	%r12, %rax
	jnb	.L1740
	movabsq	$9223372036854775807, %rcx
	movq	%rax, %r12
.L1740:
	call	_Znwy
	movq	%rax, %r15
	movq	72(%rsp), %rax
	testq	%rax, %rax
	je	.L1747
	cmpq	$1, %rax
	je	.L1964
	movq	72(%rsp), %r8
	movq	%r13, %rdx
	movq	%r15, %rcx
	call	memcpy
	movq	144(%rsp), %r13
.L1747:
	testq	%rbx, %rbx
	je	.L1749
	movq	72(%rsp), %rax
	movq	80(%rsp), %rcx
	addq	%rax, %rcx
	leaq	0(%r13,%rax), %rdx
	addq	%r15, %rcx
	cmpq	$1, %rbx
	je	.L1965
	movq	%rbx, %r8
	call	memcpy
	movq	144(%rsp), %r13
.L1749:
	cmpq	%rbp, %r13
	je	.L1751
	movq	160(%rsp), %rax
	movq	%r13, %rcx
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L1751:
	movq	72(%rsp), %rax
	movq	%r15, 144(%rsp)
	movq	%r12, 160(%rsp)
	leaq	(%r15,%rax), %rcx
	jmp	.L1743
.L1814:
	movb	$80, 71(%rsp)
	movl	$1, %r14d
	movb	$0, 56(%rsp)
	jmp	.L1603
.L1953:
	cmpq	%rbp, %rax
	je	.L1966
	movq	160(%rsp), %rax
	cmpq	$255, %rax
	ja	.L1645
	addq	%rax, %rax
	cmpq	$256, %rax
	jbe	.L1967
.L1793:
	leaq	1(%rax), %rcx
	movq	%rax, %r9
	jmp	.L1623
.L1784:
	cmpq	$1, %r8
	je	.L1968
	movq	%r13, %rdx
	call	memcpy
.L1762:
	movq	216(%rsp), %rax
	movq	176(%rsp), %rdx
	movb	$0, (%rdx,%rax)
	movq	208(%rsp), %rcx
	movq	%rax, 184(%rsp)
	jmp	.L1763
.L1944:
	cmpq	$15, %r13
	jbe	.L1689
	cmpq	$29, %r13
	ja	.L1691
	movq	$30, 48(%rsp)
.L1690:
	movq	48(%rsp), %rax
	leaq	1(%rax), %rcx
.L1698:
	call	_Znwy
	movq	%rax, %rcx
	movq	%r13, %r8
	movq	%rbx, %rdx
	movq	%rax, %r15
	call	memcpy
	movq	144(%rsp), %rcx
	cmpq	%rbp, %rcx
	je	.L1699
	movq	160(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L1699:
	movq	48(%rsp), %rax
	movq	%r15, 144(%rsp)
	movq	%rax, 160(%rsp)
	jmp	.L1695
.L1939:
	cmpq	$15, %r14
	jbe	.L1738
	movq	%r9, %rbx
	subq	72(%rsp), %rbx
	cmpq	%r14, %rax
	jb	.L1739
	cmpq	$29, %r14
	ja	.L1741
	movl	$30, %r12d
	movl	$31, %ecx
	jmp	.L1740
.L1941:
	movb	$48, (%rcx)
	jmp	.L1753
.L1692:
	addq	%rdx, %rdx
	movq	%rdx, 48(%rsp)
	cmpq	%rdx, %r13
	jb	.L1697
.L1691:
	movq	%r13, 48(%rsp)
	leaq	1(%r13), %rcx
	jmp	.L1698
.L1952:
	cmpq	$15, %r15
	jbe	.L1685
	jmp	.L1673
.L1949:
	cmpq	%r15, %rax
	jb	.L1713
	leaq	(%rdx,%rdx), %r10
	cmpq	%r10, %r15
	jnb	.L1715
	cmpq	%r10, %rax
	jnb	.L1714
	movabsq	$9223372036854775807, %rcx
	movq	%rax, %r10
.L1720:
	movq	%r10, 56(%rsp)
	movq	%r9, 48(%rsp)
	call	_Znwy
	testq	%r13, %r13
	movq	48(%rsp), %r9
	movq	56(%rsp), %r10
	movq	%rax, %r11
	je	.L1916
	cmpq	$1, %r13
	je	.L1969
	movq	%r13, %r8
	movq	%r9, %rdx
	movq	%rax, %rcx
	movq	%r10, 48(%rsp)
	call	memcpy
	movq	48(%rsp), %r10
	movq	%rax, %r11
.L1723:
	movq	144(%rsp), %r9
.L1916:
	cmpq	%rbp, %r9
	je	.L1724
	movq	160(%rsp), %rax
	movq	%r9, %rcx
	movq	%r11, 56(%rsp)
	movq	%r10, 48(%rsp)
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	56(%rsp), %r11
	movq	48(%rsp), %r10
.L1724:
	movq	%r11, 144(%rsp)
	movq	%r11, %r9
	movq	%r10, 160(%rsp)
	jmp	.L1717
.L1940:
	movzbl	(%rcx), %edx
	movq	72(%rsp), %rcx
	movb	%dl, (%rax)
	addq	144(%rsp), %rcx
	jmp	.L1743
.L1945:
	movzbl	(%rbx), %eax
	movb	%al, (%r15)
.L1915:
	movq	144(%rsp), %r15
	jmp	.L1695
.L1963:
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	movq	144(%rsp), %rax
	movb	$0, (%rax,%r14)
	movq	%r14, 152(%rsp)
	jmp	.L1734
.L1676:
	leaq	1(%r15), %rcx
	call	_Znwy
.LEHE31:
	movq	48(%rsp), %r9
	movq	%rax, %r13
	movq	%rbp, %rdx
	jmp	.L1677
.L1948:
	cmpq	$15, %r15
	jbe	.L1717
	cmpq	%r15, %rax
	jb	.L1713
	cmpq	$29, %r15
	ja	.L1715
	movl	$30, %r10d
.L1714:
	leaq	1(%r10), %rcx
	jmp	.L1720
.L1950:
	movb	$48, (%rcx)
	jmp	.L1726
.L1697:
	cmpq	48(%rsp), %rax
	jnb	.L1690
	movabsq	$9223372036854775807, %rcx
	movq	%rax, 48(%rsp)
	jmp	.L1698
.L1741:
	leaq	1(%r14), %rcx
	movq	%r14, %r12
	jmp	.L1740
.L1968:
	movzbl	224(%rsp), %eax
	movb	%al, (%rcx)
	jmp	.L1762
.L1960:
	movq	(%rcx), %rax
	leaq	_ZNSt8__format14_Fixedbuf_sinkIcE11_M_overflowEv(%rip), %r8
	movq	(%rax), %rax
	cmpq	%r8, %rax
	je	.L1970
	movq	%r9, 56(%rsp)
	movq	%rcx, 48(%rsp)
.LEHB32:
	call	*%rax
.LEHE32:
	movq	56(%rsp), %r9
	movq	48(%rsp), %rcx
	jmp	.L1775
.L1965:
	movzbl	(%rdx), %eax
	movb	%al, (%rcx)
	movq	144(%rsp), %r13
	jmp	.L1749
.L1964:
	movzbl	0(%r13), %eax
	movb	%al, (%r15)
	movq	144(%rsp), %r13
	jmp	.L1747
.L1962:
	movabsq	$9223372036854775807, %rcx
	cmpq	%rcx, %r15
	je	.L1971
	addq	%r9, %r9
	cmpq	%r9, %r15
	jnb	.L1972
	movabsq	$9223372036854775806, %rax
	cmpq	%r9, %rax
	jnb	.L1702
	movq	%rax, %r9
.L1706:
	movq	%rdx, 80(%rsp)
	movq	%r9, 56(%rsp)
.LEHB33:
	call	_Znwy
	movq	80(%rsp), %rdx
	movq	%rax, %rcx
	movq	%r13, %r8
	movq	%rax, 48(%rsp)
	call	memcpy
	movq	144(%rsp), %rcx
	movq	56(%rsp), %r9
	cmpq	%rbp, %rcx
	je	.L1707
	movq	160(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	56(%rsp), %r9
.L1707:
	movq	48(%rsp), %rax
	movq	%r9, 160(%rsp)
	movq	%rax, 144(%rsp)
	movb	$46, (%rax,%r13)
	jmp	.L1919
.L1966:
	movl	$256, %r9d
	movl	$257, %ecx
	jmp	.L1623
.L1715:
	leaq	1(%r15), %rcx
	movq	%r15, %r10
	jmp	.L1720
.L1961:
	cmpq	$16, %r15
	jne	.L1703
	movl	$30, %r9d
.L1702:
	leaq	1(%r9), %rcx
	jmp	.L1706
.L1969:
	movzbl	(%r9), %eax
	movb	%al, (%r11)
	jmp	.L1723
.L1972:
	leaq	2(%r13), %rcx
	movq	%r15, %r9
	jmp	.L1706
.L1970:
	movq	%rdx, 24(%rcx)
	jmp	.L1775
.L1967:
	movl	$256, %r9d
	jmp	.L1794
.L1675:
	leaq	.LC8(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L1938:
	leaq	.LC10(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.LEHE33:
.L1849:
	movq	%rax, %rbx
.L1780:
	leaq	176(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L1781:
	leaq	144(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rcx
.LEHB34:
	call	_Unwind_Resume
.LEHE34:
.L1739:
	leaq	.LC8(%rip), %rcx
.LEHB35:
	call	_ZSt20__throw_length_errorPKc
.L1937:
	movq	72(%rsp), %r8
	leaq	.LC17(%rip), %rdx
	leaq	.LC18(%rip), %rcx
	call	_ZSt24__throw_out_of_range_fmtPKcz
.L1943:
	leaq	.LC14(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L1847:
	movq	%rax, %rbx
	jmp	.L1781
.L1626:
	leaq	.LC8(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L1713:
	leaq	.LC8(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L1971:
	leaq	.LC8(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L1956:
	leaq	.LC8(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L1693:
	xorl	%eax, %eax
	movq	%r13, 32(%rsp)
	movq	%rbx, %r9
	xorl	%r8d, %r8d
	movq	%rax, 40(%rsp)
	leaq	144(%rsp), %rcx
	movq	%rbx, %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE15_M_replace_coldEPcyPKcyy
	jmp	.L1915
.L1947:
	leaq	.LC10(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L1848:
	leaq	136(%rsp), %rcx
	movq	%rax, %rbx
	call	_ZNSt6localeD1Ev
	jmp	.L1780
.L1951:
	leaq	.LC9(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L1788:
	movq	72(%rsp), %r8
	movq	%r14, %r9
	leaq	.LC15(%rip), %rdx
	leaq	.LC16(%rip), %rcx
	call	_ZSt24__throw_out_of_range_fmtPKcz
	nop
.LEHE35:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA7709:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE7709-.LLSDACSB7709
.LLSDACSB7709:
	.uleb128 .LEHB27-.LFB7709
	.uleb128 .LEHE27-.LEHB27
	.uleb128 .L1848-.LFB7709
	.uleb128 0
	.uleb128 .LEHB28-.LFB7709
	.uleb128 .LEHE28-.LEHB28
	.uleb128 .L1849-.LFB7709
	.uleb128 0
	.uleb128 .LEHB29-.LFB7709
	.uleb128 .LEHE29-.LEHB29
	.uleb128 .L1847-.LFB7709
	.uleb128 0
	.uleb128 .LEHB30-.LFB7709
	.uleb128 .LEHE30-.LEHB30
	.uleb128 .L1849-.LFB7709
	.uleb128 0
	.uleb128 .LEHB31-.LFB7709
	.uleb128 .LEHE31-.LEHB31
	.uleb128 .L1847-.LFB7709
	.uleb128 0
	.uleb128 .LEHB32-.LFB7709
	.uleb128 .LEHE32-.LEHB32
	.uleb128 .L1849-.LFB7709
	.uleb128 0
	.uleb128 .LEHB33-.LFB7709
	.uleb128 .LEHE33-.LEHB33
	.uleb128 .L1847-.LFB7709
	.uleb128 0
	.uleb128 .LEHB34-.LFB7709
	.uleb128 .LEHE34-.LEHB34
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB35-.LFB7709
	.uleb128 .LEHE35-.LEHB35
	.uleb128 .L1847-.LFB7709
	.uleb128 0
.LLSDACSE7709:
	.section	.text$_ZNKSt8__format14__formatter_fpIcE6formatIdNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.seh_endproc
	.section	.text$_ZNKSt8__format14__formatter_fpIcE6formatIeNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt8__format14__formatter_fpIcE6formatIeNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	.def	_ZNKSt8__format14__formatter_fpIcE6formatIeNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format14__formatter_fpIcE6formatIeNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
_ZNKSt8__format14__formatter_fpIcE6formatIeNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_:
.LFB7712:
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
	subq	$424, %rsp
	.seh_stackalloc	424
	.seh_endprologue
	fldt	(%rdx)
	movb	$0, 208(%rsp)
	movzbl	16(%rcx), %eax
	movq	%rcx, %rsi
	movq	%r8, %r12
	leaq	208(%rsp), %r13
	fstpt	48(%rsp)
	movq	%r13, 192(%rsp)
	movq	$0, 200(%rsp)
	andl	$12, %eax
	jne	.L2298
	movzbl	24(%rcx), %edx
	leaq	.L2180(%rip), %rcx
	movq	%rdx, %rax
	andl	$15, %eax
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L2180:
	.long	.L1994-.L2180
	.long	.L2185-.L2180
	.long	.L2184-.L2180
	.long	.L1988-.L2180
	.long	.L1992-.L2180
	.long	.L2183-.L2180
	.long	.L2182-.L2180
	.long	.L2181-.L2180
	.long	.L2224-.L2180
	.section	.text$_ZNKSt8__format14__formatter_fpIcE6formatIeNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L1994:
	fldt	48(%rsp)
	leaq	160(%rsp), %rbp
	leaq	144(%rsp), %rbx
	movq	%rbx, %r9
	leaq	416(%rsp), %r8
	movq	%rbp, %rcx
	leaq	289(%rsp), %rdx
	fstpt	144(%rsp)
	call	_ZSt8to_charsPcS_e
	movq	160(%rsp), %rdi
	cmpl	$132, 168(%rsp)
	je	.L2193
	leaq	416(%rsp), %rax
	movb	$0, 80(%rsp)
	leaq	289(%rsp), %rbx
	movb	$101, 110(%rsp)
	movq	$6, 64(%rsp)
	movq	%rax, 72(%rsp)
.L1996:
	fldt	48(%rsp)
	movl	$1, %r10d
	fxam
	fnstsw	%ax
	fstp	%st(0)
	testb	$2, %ah
	jne	.L2027
	movzbl	8(%rsi), %eax
	andl	$12, %eax
	cmpb	$4, %al
	je	.L2299
	xorl	%r10d, %r10d
	cmpb	$12, %al
	jne	.L2027
	movb	$32, -1(%rbx)
	movl	$1, %r10d
	subq	$1, %rbx
	.p2align 4
	.p2align 3
.L2027:
	movzbl	12(%rsi), %r9d
	movq	%rdi, %rbp
	subq	%rbx, %rbp
	testb	$1, %r9b
	je	.L2029
	fldt	48(%rsp)
	fabs
	fldt	.LC21(%rip)
	fucomip	%st(1), %st
	fstp	%st(0)
	jb	.L2030
	testq	%rbp, %rbp
	je	.L2031
	movq	%rbp, %r8
	movl	$46, %edx
	movq	%rbx, %rcx
	movb	%r9b, 96(%rsp)
	movb	%r10b, 88(%rsp)
	call	memchr
	movzbl	88(%rsp), %r10d
	movzbl	96(%rsp), %r9d
	testq	%rax, %rax
	je	.L2032
	subq	%rbx, %rax
	movq	%rax, 88(%rsp)
	cmpq	$-1, %rax
	je	.L2032
	leaq	1(%rax), %r14
	cmpq	%rbp, %r14
	jnb	.L2300
	movsbl	110(%rsp), %edx
	movq	%rbp, %r8
	leaq	(%rbx,%r14), %rcx
	movb	%r9b, 111(%rsp)
	subq	%r14, %r8
	movb	%r10b, 96(%rsp)
	call	memchr
	movzbl	96(%rsp), %r10d
	movzbl	111(%rsp), %r9d
	testq	%rax, %rax
	je	.L2203
	subq	%rbx, %rax
	movq	%rax, %r11
	cmpq	$-1, %rax
	cmove	%rbp, %r11
.L2037:
	xorl	%r15d, %r15d
	cmpq	88(%rsp), %r11
	sete	%r15b
	cmpb	$0, 80(%rsp)
	je	.L2205
	cmpb	$48, (%rbx,%r10)
	je	.L2038
.L2035:
	movq	%r11, %rax
	subq	%r10, %rax
	subq	$1, %rax
.L2039:
	cmpq	$0, 64(%rsp)
	jne	.L2043
	.p2align 4
	.p2align 3
.L2034:
	testq	%r15, %r15
	jne	.L2042
.L2044:
	leaq	240(%rsp), %rdi
	andl	$2, %r9d
	movb	$0, 240(%rsp)
	movq	%rdi, 224(%rsp)
	movq	$0, 232(%rsp)
	je	.L2293
.L2170:
	cmpb	$0, 32(%r12)
	je	.L2301
.L2135:
	leaq	24(%r12), %rdx
	leaq	184(%rsp), %rcx
	call	_ZNSt6localeC1ERKS_
	movzbl	110(%rsp), %r8d
	leaq	256(%rsp), %rcx
	leaq	112(%rsp), %rdx
	leaq	184(%rsp), %r9
	movq	%rbp, 112(%rsp)
	movq	%rbx, 120(%rsp)
.LEHB36:
	call	_ZNKSt8__format14__formatter_fpIcE11_M_localizeB5cxx11ESt17basic_string_viewIcSt11char_traitsIcEEcRKSt6locale.isra.0
.LEHE36:
	leaq	184(%rsp), %rcx
	call	_ZNSt6localeD1Ev
	movq	264(%rsp), %r8
	testq	%r8, %r8
	je	.L2221
	movq	224(%rsp), %rcx
	cmpq	%rdi, %rcx
	je	.L2302
	movq	256(%rsp), %rax
	leaq	272(%rsp), %r14
	cmpq	%r14, %rax
	je	.L2162
	movq	240(%rsp), %rdx
	movq	%r8, %xmm0
	movq	%rax, 224(%rsp)
	movhps	272(%rsp), %xmm0
	movups	%xmm0, 232(%rsp)
	testq	%rcx, %rcx
	je	.L2142
	movq	%rcx, 256(%rsp)
	movq	%rdx, 272(%rsp)
.L2141:
	movb	$0, (%rcx)
	movq	232(%rsp), %rbp
	movq	224(%rsp), %r15
	jmp	.L2136
	.p2align 4,,10
	.p2align 3
.L2029:
	leaq	240(%rsp), %rdi
	andl	$2, %r9d
	movb	$0, 240(%rsp)
	movq	%rdi, 224(%rsp)
	movq	$0, 232(%rsp)
	je	.L2293
	fldt	48(%rsp)
	fabs
	fldt	.LC21(%rip)
	fucomip	%st(1), %st
	fstp	%st(0)
	jnb	.L2170
.L2293:
	movq	%rbx, %r14
.L2133:
	movzbl	16(%rsi), %eax
	andl	$3, %eax
	cmpb	$1, %al
	je	.L2303
	cmpb	$2, %al
	je	.L2304
.L2145:
	movq	16(%r12), %rsi
	testq	%rbp, %rbp
	jne	.L2305
.L2148:
	movq	224(%rsp), %rcx
	cmpq	%rdi, %rcx
	je	.L2155
	movq	240(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L2155:
	movq	192(%rsp), %rcx
	cmpq	%r13, %rcx
	je	.L2241
	movq	208(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L2241:
	movq	%rsi, %rax
	addq	$424, %rsp
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
.L2303:
	movzwl	(%rsi), %r9d
.L2144:
	cmpq	%r9, %rbp
	jnb	.L2145
	movzbl	8(%rsi), %r8d
	movq	16(%r12), %rcx
	andl	$3, %r8d
	jne	.L2306
	testb	$4, 12(%rsi)
	je	.L2152
	fldt	48(%rsp)
	fabs
	fldt	.LC21(%rip)
	fucomip	%st(1), %st
	fstp	%st(0)
	jb	.L2152
	movzbl	(%r14), %eax
	leaq	_ZNSt8__detail31__from_chars_alnum_to_val_tableILb0EE5valueE(%rip), %rdx
	cmpb	$15, (%rdx,%rax)
	ja	.L2307
	movq	%rbp, %rdx
	movl	$2, %r8d
	movl	$48, %eax
	jmp	.L2150
	.p2align 4,,10
	.p2align 3
.L2152:
	movq	%rbp, %rdx
	movl	$2, %r8d
	movl	$32, %eax
.L2150:
	movl	%eax, 32(%rsp)
	subq	%rbp, %r9
	andl	$3, %r8d
	movq	%rdx, 112(%rsp)
	leaq	112(%rsp), %rdx
	movq	%rbx, 120(%rsp)
.LEHB37:
	call	_ZNSt8__format14__write_paddedINS_10_Sink_iterIcEEcEET_S3_St17basic_string_viewIT0_St11char_traitsIS5_EENS_6_AlignEyDi
.LEHE37:
	movq	%rax, %rsi
	jmp	.L2148
	.p2align 4,,10
	.p2align 3
.L2298:
	cmpb	$4, %al
	je	.L2308
	movq	$-1, 64(%rsp)
	cmpb	$8, %al
	je	.L2309
.L1976:
	movzbl	24(%rsi), %edx
	leaq	.L2173(%rip), %rcx
	movq	%rdx, %rax
	andl	$15, %eax
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L2173:
	.long	.L2179-.L2173
	.long	.L2286-.L2173
	.long	.L2285-.L2173
	.long	.L1984-.L2173
	.long	.L1983-.L2173
	.long	.L2284-.L2173
	.long	.L2283-.L2173
	.long	.L2282-.L2173
	.long	.L2281-.L2173
	.section	.text$_ZNKSt8__format14__formatter_fpIcE6formatIeNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L2030:
	leaq	240(%rsp), %rdi
	movb	$0, 240(%rsp)
	movq	%rdi, 224(%rsp)
	movq	$0, 232(%rsp)
	jmp	.L2293
	.p2align 4
	.p2align 4,,10
	.p2align 3
.L2310:
	addq	$1, %r14
	cmpq	%rbp, %r14
	jnb	.L2291
.L2038:
	cmpb	$48, (%rbx,%r14)
	je	.L2310
	jmp	.L2036
	.p2align 4,,10
	.p2align 3
.L2221:
	movq	%rbx, %r15
	leaq	272(%rsp), %r14
.L2136:
	movq	256(%rsp), %rcx
	cmpq	%r14, %rcx
	je	.L2160
	movq	272(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L2160:
	movq	%rbx, %r14
	movq	%r15, %rbx
	jmp	.L2133
	.p2align 4,,10
	.p2align 3
.L2032:
	movsbl	110(%rsp), %edx
	movq	%rbp, %r8
	movq	%rbx, %rcx
	movb	%r9b, 96(%rsp)
	movb	%r10b, 88(%rsp)
	call	memchr
	movzbl	88(%rsp), %r10d
	movzbl	96(%rsp), %r9d
	testq	%rax, %rax
	jne	.L2040
	.p2align 4
	.p2align 3
.L2031:
	movq	%rbp, 88(%rsp)
.L2041:
	movq	88(%rsp), %r11
	cmpb	$0, 80(%rsp)
	je	.L2207
	cmpq	$0, 64(%rsp)
	je	.L2208
	movq	%r11, %rax
	movl	$1, %r15d
	subq	%r10, %rax
.L2043:
	subq	%rax, 64(%rsp)
	addq	64(%rsp), %r15
	jmp	.L2034
	.p2align 4,,10
	.p2align 3
.L2224:
	movq	$6, 64(%rsp)
.L2281:
	movb	$101, 110(%rsp)
	movl	$2, %r15d
	movl	$1, %r14d
	movb	$0, 80(%rsp)
	.p2align 4
	.p2align 3
.L1981:
	movl	64(%rsp), %eax
	fldt	48(%rsp)
	movl	%r15d, 32(%rsp)
	leaq	160(%rsp), %rbp
	leaq	144(%rsp), %rbx
	leaq	416(%rsp), %r8
	movq	%rbp, %rcx
	movl	%eax, 40(%rsp)
	movq	%rbx, %r9
	leaq	289(%rsp), %rdx
	fstpt	144(%rsp)
	call	_ZSt8to_charsPcS_eSt12chars_formati
	movq	160(%rsp), %rdi
	cmpl	$132, 168(%rsp)
	je	.L1997
.L2290:
	leaq	416(%rsp), %rax
	leaq	289(%rsp), %rbx
	movq	%rax, 72(%rsp)
.L1998:
	testb	%r14b, %r14b
	je	.L1996
	cmpq	%rdi, %rbx
	je	.L1996
	movq	__imp_toupper(%rip), %rbp
	movq	%rbx, %r14
	.p2align 4
	.p2align 3
.L2026:
	movsbl	(%r14), %ecx
	addq	$1, %r14
	call	*%rbp
	movb	%al, -1(%r14)
	cmpq	%rdi, %r14
	jne	.L2026
	jmp	.L1996
	.p2align 4,,10
	.p2align 3
.L2185:
	movq	$6, 64(%rsp)
.L2286:
	movb	$101, 110(%rsp)
	movl	$3, %r15d
	xorl	%r14d, %r14d
	movb	$1, 80(%rsp)
	jmp	.L1981
	.p2align 4,,10
	.p2align 3
.L2184:
	movq	$6, 64(%rsp)
.L2285:
	movb	$69, 110(%rsp)
	movl	$3, %r15d
	movl	$1, %r14d
	movb	$1, 80(%rsp)
	jmp	.L1981
	.p2align 4,,10
	.p2align 3
.L1988:
	andl	$15, %edx
	xorl	%r14d, %r14d
	movl	$101, %eax
	cmpb	$4, %dl
	movl	$112, %edx
	cmovne	%edx, %eax
	movb	%al, 110(%rsp)
.L1990:
	fldt	48(%rsp)
	movl	$4, 32(%rsp)
	leaq	160(%rsp), %rbp
	leaq	144(%rsp), %rbx
	movq	%rbx, %r9
	leaq	416(%rsp), %r8
	movq	%rbp, %rcx
	leaq	289(%rsp), %rdx
	fstpt	144(%rsp)
	call	_ZSt8to_charsPcS_eSt12chars_format
	movq	160(%rsp), %rdi
	cmpl	$132, 168(%rsp)
	je	.L2194
	movb	$0, 80(%rsp)
	movq	$6, 64(%rsp)
	jmp	.L2290
	.p2align 4,,10
	.p2align 3
.L1992:
	andl	$15, %edx
	movl	$112, %eax
	movl	$1, %r14d
	cmpb	$4, %dl
	movl	$80, %edx
	cmove	%edx, %eax
	movb	%al, 110(%rsp)
	jmp	.L1990
	.p2align 4,,10
	.p2align 3
.L2183:
	movq	$6, 64(%rsp)
.L2284:
	movl	$1, %r15d
.L2289:
	movb	$101, 110(%rsp)
	xorl	%r14d, %r14d
	movb	$0, 80(%rsp)
	jmp	.L1981
	.p2align 4,,10
	.p2align 3
.L2182:
	movq	$6, 64(%rsp)
.L2283:
	movb	$69, 110(%rsp)
	movl	$1, %r15d
	movl	$1, %r14d
	movb	$0, 80(%rsp)
	jmp	.L1981
	.p2align 4,,10
	.p2align 3
.L2181:
	movq	$6, 64(%rsp)
.L2282:
	movb	$101, 110(%rsp)
	movl	$2, %r15d
	xorl	%r14d, %r14d
	movb	$0, 80(%rsp)
	jmp	.L1981
	.p2align 4,,10
	.p2align 3
.L2301:
	leaq	24(%r12), %rcx
	call	_ZNSt6localeC1Ev
	movb	$1, 32(%r12)
	jmp	.L2135
	.p2align 4,,10
	.p2align 3
.L2309:
	movzwl	2(%rcx), %ecx
	movq	%r8, %rdx
.LEHB38:
	call	_ZNKSt8__format5_SpecIcE16_M_get_precisionISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
.LEHE38:
	movzbl	24(%rsi), %edx
	movq	%rax, 64(%rsp)
	leaq	.L1979(%rip), %rcx
	movq	%rdx, %rax
	andl	$15, %eax
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L1979:
	.long	.L2179-.L1979
	.long	.L2286-.L1979
	.long	.L2285-.L1979
	.long	.L1984-.L1979
	.long	.L1983-.L1979
	.long	.L2284-.L1979
	.long	.L2283-.L1979
	.long	.L2282-.L1979
	.long	.L2281-.L1979
	.section	.text$_ZNKSt8__format14__formatter_fpIcE6formatIeNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L2179:
	movb	$101, 110(%rsp)
	movl	$3, %r15d
	xorl	%r14d, %r14d
	movb	$0, 80(%rsp)
	jmp	.L1981
	.p2align 4,,10
	.p2align 3
.L2299:
	movb	$43, -1(%rbx)
	subq	$1, %rbx
	jmp	.L2027
	.p2align 4,,10
	.p2align 3
.L2306:
	movl	4(%rsi), %eax
	movq	%rbp, %rdx
	jmp	.L2150
	.p2align 4,,10
	.p2align 3
.L2305:
	leaq	112(%rsp), %rdx
	movq	%rsi, %rcx
	movq	%rbp, 112(%rsp)
	movq	%rbx, 120(%rsp)
.LEHB39:
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	jmp	.L2148
	.p2align 4,,10
	.p2align 3
.L2304:
	movzwl	(%rsi), %ecx
	movq	%r12, %rdx
	call	_ZNKSt8__format5_SpecIcE12_M_get_widthISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
.LEHE39:
	movq	%rax, %r9
	jmp	.L2144
	.p2align 4,,10
	.p2align 3
.L2207:
	movq	$0, 64(%rsp)
	movl	$1, %r15d
.L2042:
	movq	200(%rsp), %r9
	leaq	0(%rbp,%r15), %r14
	testq	%r9, %r9
	jne	.L2045
	movq	72(%rsp), %rax
	subq	%rdi, %rax
	cmpq	%r15, %rax
	jnb	.L2046
	movq	192(%rsp), %rdx
	cmpq	%r13, %rdx
	je	.L2311
	movq	208(%rsp), %rax
	cmpq	%r14, %rax
	jnb	.L2052
.L2056:
	movabsq	$9223372036854775806, %rcx
	cmpq	%r14, %rcx
	jb	.L2053
	addq	%rax, %rax
	leaq	1(%r14), %r8
	cmpq	%rax, %r14
	jnb	.L2059
	cmpq	%rax, %rcx
	leaq	1(%rax), %r10
	movabsq	$9223372036854775807, %r8
	cmovb	%rcx, %rax
	cmovnb	%r10, %r8
	movq	%rax, %r14
.L2059:
	movq	%r8, %rcx
	movq	%r9, 96(%rsp)
	movq	%rdx, 80(%rsp)
	movq	%r11, 72(%rsp)
.LEHB40:
	call	_Znwy
	movq	96(%rsp), %r9
	movq	80(%rsp), %rdx
	movq	%rax, %rdi
	movq	72(%rsp), %r11
.L2055:
	leaq	1(%r9), %r8
	testq	%r9, %r9
	je	.L2312
	movq	%rdi, %rcx
	movq	%r11, 72(%rsp)
	call	memcpy
	movq	72(%rsp), %r11
.L2061:
	movq	192(%rsp), %rcx
	cmpq	%r13, %rcx
	je	.L2313
	movq	208(%rsp), %rax
	movq	%r11, 72(%rsp)
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	200(%rsp), %r9
	movq	72(%rsp), %r11
	movq	%rdi, 192(%rsp)
	movq	%r14, 208(%rsp)
	testq	%r9, %r9
	je	.L2052
.L2063:
	cmpq	%r11, %r9
	jb	.L2314
	movabsq	$9223372036854775806, %rax
	movq	%rax, %rdx
	subq	%r9, %rdx
	cmpq	%r15, %rdx
	jb	.L2315
	movq	192(%rsp), %rdi
	leaq	(%r15,%r9), %rbp
	cmpq	%r13, %rdi
	je	.L2316
	movq	208(%rsp), %rdx
	cmpq	%rbp, %rdx
	jb	.L2120
.L2116:
	leaq	(%rdi,%r11), %rcx
	subq	%r11, %r9
	je	.L2121
	cmpq	$1, %r9
	je	.L2317
	movq	%rcx, %rdx
	movq	%r9, %r8
	addq	%r15, %rcx
	movq	%r11, 64(%rsp)
	call	memmove
	movq	64(%rsp), %r11
	movq	192(%rsp), %rcx
	addq	%r11, %rcx
.L2121:
	cmpq	$1, %r15
	je	.L2318
	movq	%r15, %r8
	movl	$48, %edx
	movq	%r11, 64(%rsp)
	call	memset
	movq	64(%rsp), %r11
.L2131:
	movq	192(%rsp), %rax
	movb	$0, (%rax,%rbp)
	movq	%rbp, 200(%rsp)
	cmpq	88(%rsp), %r11
	jne	.L2112
	movq	192(%rsp), %rax
	movb	$46, (%rax,%r11)
	movq	200(%rsp), %rbp
	.p2align 4
	.p2align 3
.L2112:
	movq	192(%rsp), %rbx
	movzbl	12(%rsi), %r9d
	jmp	.L2044
	.p2align 4,,10
	.p2align 3
.L2308:
	movzwl	2(%rcx), %eax
	movq	%rax, 64(%rsp)
	jmp	.L1976
	.p2align 4,,10
	.p2align 3
.L2300:
	xorl	%r15d, %r15d
	cmpq	%rax, %rbp
	movq	%rbp, %r11
	sete	%r15b
	cmpb	$0, 80(%rsp)
	jne	.L2319
.L2205:
	movq	$0, 64(%rsp)
	jmp	.L2034
	.p2align 4,,10
	.p2align 3
.L2040:
	subq	%rbx, %rax
	cmpq	$-1, %rax
	cmove	%rbp, %rax
	movq	%rax, 88(%rsp)
	jmp	.L2041
.L2319:
	cmpb	$48, (%rbx,%r10)
	jne	.L2035
.L2291:
	movq	$-1, %r14
.L2036:
	movq	%r11, %rax
	subq	%r14, %rax
	jmp	.L2039
.L1984:
	andl	$15, %edx
	movl	$4, %r15d
	cmpb	$4, %dl
	je	.L2289
	movb	$112, 110(%rsp)
	xorl	%r14d, %r14d
	movb	$0, 80(%rsp)
	jmp	.L1981
.L1983:
	andl	$15, %edx
	movl	$4, %r15d
	cmpb	$4, %dl
	je	.L2192
	movb	$112, 110(%rsp)
	movl	$1, %r14d
	movb	$0, 80(%rsp)
	jmp	.L1981
.L2311:
	cmpq	$15, %r14
	jbe	.L2052
.L2051:
	movabsq	$9223372036854775806, %rax
	cmpq	%r14, %rax
	jb	.L2053
	movq	%r9, 80(%rsp)
	movq	%r11, 72(%rsp)
	cmpq	$29, %r14
	ja	.L2054
	movl	$31, %ecx
	call	_Znwy
	movq	72(%rsp), %r11
	movq	80(%rsp), %r9
	movq	%rax, %rdi
	movq	%r13, %rdx
	movl	$30, %r14d
	jmp	.L2055
.L2313:
	movq	200(%rsp), %r9
	movq	%rdi, 192(%rsp)
	movq	%r14, 208(%rsp)
	testq	%r9, %r9
	jne	.L2063
	.p2align 4
	.p2align 3
.L2052:
	movabsq	$9223372036854775806, %rax
	cmpq	%rbp, %r11
	movq	%rbp, %rdi
	cmovbe	%r11, %rdi
	cmpq	%rdi, %rax
	jb	.L2320
	movq	192(%rsp), %r15
	cmpq	%r13, %r15
	je	.L2321
	movq	208(%rsp), %rdx
	cmpq	%rdi, %rdx
	jb	.L2070
.L2067:
	cmpq	%r15, %rbx
	je	.L2071
	testq	%rdi, %rdi
	je	.L2073
	cmpq	$1, %rdi
	je	.L2322
	movq	%r15, %rcx
	movq	%rdi, %r8
	movq	%rbx, %rdx
	movq	%r11, 72(%rsp)
	call	memcpy
	movq	192(%rsp), %r15
	movq	72(%rsp), %r11
.L2073:
	movb	$0, (%r15,%rdi)
	movq	%rdi, 200(%rsp)
	cmpq	88(%rsp), %r11
	je	.L2323
	cmpq	$0, 64(%rsp)
	je	.L2087
.L2169:
	movabsq	$9223372036854775806, %rax
	movq	%rax, %rdx
	subq	%rdi, %rdx
	cmpq	64(%rsp), %rdx
	jb	.L2324
	movq	64(%rsp), %rdx
	movq	192(%rsp), %r15
	leaq	(%rdx,%rdi), %r14
	cmpq	%r13, %r15
	je	.L2325
	movq	208(%rsp), %rdx
	cmpq	%r14, %rdx
	jb	.L2326
.L2095:
	leaq	(%r15,%rdi), %rcx
	cmpq	$1, 64(%rsp)
	je	.L2327
	movq	64(%rsp), %r8
	movl	$48, %edx
	movq	%r11, 72(%rsp)
	call	memset
	movq	72(%rsp), %r11
.L2104:
	movq	192(%rsp), %rax
	movb	$0, (%rax,%r14)
	movq	%r14, 200(%rsp)
	cmpq	%r11, %rbp
	jb	.L2166
	movq	%rbp, %r8
	leaq	(%rbx,%r11), %r9
	subq	%r11, %r8
.L2165:
	movabsq	$9223372036854775806, %rax
	subq	%r14, %rax
	cmpq	%r8, %rax
	jb	.L2328
	movq	192(%rsp), %rcx
	movl	$15, %eax
	leaq	(%r14,%r8), %rbp
	cmpq	%r13, %rcx
	cmovne	208(%rsp), %rax
	cmpq	%rbp, %rax
	jb	.L2108
	testq	%r8, %r8
	jne	.L2109
	movb	$0, (%rcx,%rbp)
	movq	%rbp, 200(%rsp)
	jmp	.L2112
	.p2align 4,,10
	.p2align 3
.L2045:
	movq	192(%rsp), %rdx
	cmpq	%r13, %rdx
	je	.L2329
	movq	208(%rsp), %rax
	cmpq	%r14, %rax
	jnb	.L2063
	jmp	.L2056
.L2194:
	movb	$0, 88(%rsp)
	movl	$4, %r15d
	movl	$14, %edi
	movb	$0, 80(%rsp)
	movq	$6, 64(%rsp)
.L1995:
	movq	192(%rsp), %rax
	movq	%rax, 72(%rsp)
	cmpq	$128, %rdi
	jbe	.L2330
	cmpq	%r13, 72(%rsp)
	je	.L2331
	movq	208(%rsp), %rax
	cmpq	%rdi, %rax
	jb	.L2332
.L2023:
	cmpq	%r13, 72(%rsp)
	je	.L2198
	movq	208(%rsp), %rax
	leaq	(%rax,%rax), %rdi
	cmpq	%rdi, %rax
	jnb	.L2014
	movabsq	$9223372036854775806, %rax
	cmpq	%rdi, %rax
	jb	.L2333
	leaq	1(%rdi), %rcx
.L2013:
	call	_Znwy
	movq	%rax, %r9
	movq	200(%rsp), %rax
	leaq	1(%rax), %r8
	testq	%rax, %rax
	je	.L2334
	movq	72(%rsp), %rdx
	movq	%r9, %rcx
	call	memcpy
	movq	%rax, %r9
.L2017:
	movq	192(%rsp), %rcx
	cmpq	%r13, %rcx
	je	.L2018
	movq	208(%rsp), %rax
	movq	%r9, 72(%rsp)
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	72(%rsp), %r9
.L2018:
	movq	%r9, 192(%rsp)
	movq	%rdi, 208(%rsp)
	movq	%r9, 72(%rsp)
.L2014:
	fldt	48(%rsp)
	movq	72(%rsp), %rax
	cmpb	$0, 88(%rsp)
	leaq	-1(%rax,%rdi), %r8
	leaq	1(%rax), %rdx
	fstpt	144(%rsp)
	jne	.L2335
	testl	%r15d, %r15d
	je	.L2021
	movl	%r15d, 32(%rsp)
	movq	%rbx, %r9
	movq	%rbp, %rcx
	call	_ZSt8to_charsPcS_eSt12chars_format
	movq	160(%rsp), %rdi
	movq	168(%rsp), %rax
.L2020:
	testl	%eax, %eax
	jne	.L2022
	movq	192(%rsp), %rdx
	movq	%rdi, %rax
	subq	72(%rsp), %rax
	movb	$0, (%rdx,%rax)
	movq	192(%rsp), %rdx
	movq	%rax, 200(%rsp)
	addq	%rdx, %rax
	leaq	1(%rdx), %rbx
	movq	%rax, 72(%rsp)
	jmp	.L1998
	.p2align 4,,10
	.p2align 3
.L2022:
	movq	192(%rsp), %rdx
	movb	$0, (%rdx)
	movq	192(%rsp), %rdx
	movq	$0, 200(%rsp)
	movq	%rdx, 72(%rsp)
	cmpl	$132, %eax
	je	.L2023
	leaq	1(%rdx), %rbx
	jmp	.L1998
.L2021:
	movq	%rbx, %r9
	movq	%rbp, %rcx
	call	_ZSt8to_charsPcS_e
	movq	160(%rsp), %rdi
	movq	168(%rsp), %rax
	jmp	.L2020
.L2193:
	movb	$0, 88(%rsp)
	xorl	%r15d, %r15d
	xorl	%r14d, %r14d
	movl	$14, %edi
	movb	$0, 80(%rsp)
	movq	$6, 64(%rsp)
	movb	$101, 110(%rsp)
	jmp	.L1995
.L1997:
	movq	64(%rsp), %rax
	movb	$1, 88(%rsp)
	leaq	8(%rax), %rdi
	cmpl	$2, %r15d
	jne	.L1995
	fldt	48(%rsp)
	leaq	128(%rsp), %rdx
	movq	%rbx, %rcx
	movl	$0, 256(%rsp)
	leaq	256(%rsp), %r8
	fstpt	128(%rsp)
	call	frexpl
	movl	256(%rsp), %ecx
	movb	$1, 88(%rsp)
	imull	$4004, %ecx, %eax
	movq	%rax, %rdx
	imulq	$995517945, %rax, %rax
	shrq	$32, %rax
	subl	%eax, %edx
	shrl	%edx
	addl	%edx, %eax
	shrl	$13, %eax
	addl	$1, %eax
	addq	%rdi, %rax
	testl	%ecx, %ecx
	cmovg	%rax, %rdi
	jmp	.L1995
.L2335:
	movl	64(%rsp), %eax
	movl	%r15d, 32(%rsp)
	movq	%rbx, %r9
	movq	%rbp, %rcx
	movl	%eax, 40(%rsp)
	call	_ZSt8to_charsPcS_eSt12chars_formati
	movq	160(%rsp), %rdi
	movq	168(%rsp), %rax
	jmp	.L2020
.L2332:
	movabsq	$9223372036854775806, %rdx
	cmpq	%rdi, %rdx
	jb	.L2004
	addq	%rax, %rax
	cmpq	%rax, %rdi
	jnb	.L2172
	movabsq	$9223372036854775807, %rcx
	movq	%rdx, %rdi
	cmpq	%rax, %rdx
	jnb	.L2171
.L2001:
	call	_Znwy
	movq	%rax, %r9
	movq	200(%rsp), %rax
	leaq	1(%rax), %r8
	testq	%rax, %rax
	je	.L2336
	movq	72(%rsp), %rdx
	movq	%r9, %rcx
	call	memcpy
	movq	%rax, %r9
.L2011:
	movq	192(%rsp), %rcx
	cmpq	%r13, %rcx
	je	.L2012
	movq	208(%rsp), %rax
	movq	%r9, 72(%rsp)
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	72(%rsp), %r9
.L2012:
	movq	%r9, 192(%rsp)
	movq	%rdi, 208(%rsp)
	movq	%r9, 72(%rsp)
	jmp	.L2023
.L2046:
	leaq	(%rbx,%r11), %rdi
	leaq	(%r11,%r15), %rcx
	movq	%rbp, %r8
	movq	%r11, 72(%rsp)
	subq	%r11, %r8
	addq	%rbx, %rcx
	movq	%rdi, %rdx
	call	memmove
	movq	72(%rsp), %r11
	cmpq	88(%rsp), %r11
	jne	.L2064
	movb	$46, (%rdi)
	leaq	1(%rbx,%r11), %rdi
.L2064:
	movq	64(%rsp), %r8
	movl	$48, %edx
	movq	%rdi, %rcx
	movq	%r14, %rbp
	call	memset
	movzbl	12(%rsi), %r9d
	jmp	.L2044
.L2307:
	movq	24(%rcx), %rax
	movzbl	(%rbx), %edx
	leaq	1(%rax), %r8
	movq	%r8, 24(%rcx)
	movb	%dl, (%rax)
	movq	8(%rcx), %rdx
	movq	24(%rcx), %rax
	subq	%rdx, %rax
	cmpq	16(%rcx), %rax
	je	.L2337
.L2153:
	addq	$1, %rbx
	leaq	-1(%rbp), %rdx
	movl	$2, %r8d
	movl	$48, %eax
	jmp	.L2150
.L2302:
	movq	256(%rsp), %rax
	leaq	272(%rsp), %r14
	cmpq	%r14, %rax
	je	.L2162
	movq	%rax, 224(%rsp)
	movq	%r8, %xmm0
	movhps	272(%rsp), %xmm0
	movups	%xmm0, 232(%rsp)
.L2142:
	movq	%r14, 256(%rsp)
	leaq	272(%rsp), %r14
	movq	%r14, %rcx
	jmp	.L2141
.L2323:
	movq	192(%rsp), %rdx
	leaq	1(%rdi), %r14
	cmpq	%r13, %rdx
	je	.L2338
	movq	208(%rsp), %r15
	cmpq	%r14, %r15
	jb	.L2339
.L2081:
	movb	$46, (%rdx,%rdi)
.L2295:
	movq	192(%rsp), %rax
	movq	%r14, %rdi
	movb	$0, (%rax,%r14)
	movq	%r14, 200(%rsp)
	cmpq	$0, 64(%rsp)
	jne	.L2169
.L2087:
	cmpq	%r11, %rbp
	jb	.L2166
	movq	%rbp, %r8
	movq	200(%rsp), %r14
	leaq	(%rbx,%r11), %r9
	subq	%r11, %r8
	jmp	.L2165
.L2208:
	movl	$1, %r15d
	jmp	.L2042
.L2203:
	movq	%rbp, %r11
	jmp	.L2037
.L2198:
	movl	$30, %edi
	movl	$31, %ecx
	jmp	.L2013
.L2331:
	movabsq	$9223372036854775806, %rax
	cmpq	%rdi, %rax
	jb	.L2004
.L2172:
	leaq	1(%rdi), %rcx
	jmp	.L2001
.L2334:
	movq	72(%rsp), %rax
	movzbl	(%rax), %eax
	movb	%al, (%r9)
	jmp	.L2017
.L2336:
	movq	72(%rsp), %rax
	movzbl	(%rax), %eax
	movb	%al, (%r9)
	jmp	.L2011
.L2109:
	addq	%r14, %rcx
	cmpq	$1, %r8
	je	.L2340
	movq	%r9, %rdx
	call	memcpy
	movq	192(%rsp), %rax
	movb	$0, (%rax,%rbp)
	movq	%rbp, 200(%rsp)
	jmp	.L2112
.L2108:
	movq	%r8, 32(%rsp)
	leaq	192(%rsp), %rcx
	xorl	%r8d, %r8d
	movq	%r14, %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	movq	192(%rsp), %rax
	movb	$0, (%rax,%rbp)
	movq	%rbp, 200(%rsp)
	jmp	.L2112
.L2312:
	movzbl	(%rdx), %eax
	movb	%al, (%rdi)
	jmp	.L2061
.L2120:
	subq	%r11, %r9
	movq	%r9, 64(%rsp)
	cmpq	%rbp, %rax
	jb	.L2117
	leaq	(%rdx,%rdx), %rbx
	cmpq	%rbx, %rbp
	jnb	.L2119
	leaq	1(%rbx), %rcx
	cmpq	%rbx, %rax
	jnb	.L2118
	movabsq	$9223372036854775807, %rcx
	movq	%rax, %rbx
.L2118:
	movq	%r11, 72(%rsp)
	call	_Znwy
	movq	72(%rsp), %r11
	movq	%rax, %r14
	testq	%r11, %r11
	je	.L2125
	cmpq	$1, %r11
	je	.L2341
	movq	%r11, %r8
	movq	%rdi, %rdx
	movq	%rax, %rcx
	movq	%r11, 72(%rsp)
	call	memcpy
	movq	192(%rsp), %rdi
	movq	72(%rsp), %r11
.L2125:
	movq	64(%rsp), %rax
	testq	%rax, %rax
	je	.L2127
	leaq	(%r11,%r15), %rcx
	leaq	(%rdi,%r11), %rdx
	addq	%r14, %rcx
	cmpq	$1, %rax
	je	.L2342
	movq	64(%rsp), %r8
	movq	%r11, 72(%rsp)
	call	memcpy
	movq	192(%rsp), %rdi
	movq	72(%rsp), %r11
.L2127:
	cmpq	%r13, %rdi
	je	.L2129
	movq	208(%rsp), %rax
	movq	%rdi, %rcx
	movq	%r11, 64(%rsp)
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	64(%rsp), %r11
.L2129:
	movq	%r14, 192(%rsp)
	leaq	(%r14,%r11), %rcx
	movq	%rbx, 208(%rsp)
	jmp	.L2121
.L2192:
	movb	$80, 110(%rsp)
	movl	$1, %r14d
	movb	$0, 80(%rsp)
	jmp	.L1981
.L2330:
	cmpq	%r13, %rax
	je	.L2343
	movq	208(%rsp), %rax
	cmpq	$255, %rax
	ja	.L2023
	addq	%rax, %rax
	cmpq	$256, %rax
	jbe	.L2344
.L2171:
	leaq	1(%rax), %rcx
	movq	%rax, %rdi
	jmp	.L2001
.L2162:
	cmpq	$1, %r8
	je	.L2345
	movq	%r14, %rdx
	call	memcpy
.L2140:
	movq	264(%rsp), %rax
	movq	224(%rsp), %rdx
	movb	$0, (%rdx,%rax)
	movq	256(%rsp), %rcx
	movq	%rax, 232(%rsp)
	jmp	.L2141
.L2316:
	cmpq	$15, %rbp
	jbe	.L2116
	subq	%r11, %r9
	movq	%r9, 64(%rsp)
	cmpq	%rbp, %rax
	jb	.L2117
	cmpq	$29, %rbp
	ja	.L2119
	movl	$30, %ebx
	movl	$31, %ecx
	jmp	.L2118
.L2321:
	cmpq	$15, %rdi
	jbe	.L2067
	cmpq	$29, %rdi
	ja	.L2069
	movl	$30, %r14d
.L2068:
	leaq	1(%r14), %rcx
.L2076:
	movq	%r11, 72(%rsp)
	call	_Znwy
	movq	%rax, %rcx
	movq	%rdi, %r8
	movq	%rbx, %rdx
	movq	%rax, %r15
	call	memcpy
	movq	192(%rsp), %rcx
	movq	72(%rsp), %r11
	cmpq	%r13, %rcx
	je	.L2077
	movq	208(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	72(%rsp), %r11
.L2077:
	movq	%r15, 192(%rsp)
	movq	%r14, 208(%rsp)
	jmp	.L2073
.L2318:
	movb	$48, (%rcx)
	jmp	.L2131
.L2329:
	cmpq	$15, %r14
	jbe	.L2063
	jmp	.L2051
.L2070:
	leaq	(%rdx,%rdx), %r14
	cmpq	%r14, %rdi
	jb	.L2075
.L2069:
	leaq	1(%rdi), %rcx
	movq	%rdi, %r14
	jmp	.L2076
.L2326:
	cmpq	%r14, %rax
	jb	.L2091
	leaq	(%rdx,%rdx), %r9
	cmpq	%r9, %r14
	jnb	.L2093
	cmpq	%r9, %rax
	jnb	.L2092
	movabsq	$9223372036854775807, %rcx
	movq	%rax, %r9
.L2098:
	movq	%r9, 80(%rsp)
	movq	%r11, 72(%rsp)
	call	_Znwy
	testq	%rdi, %rdi
	movq	72(%rsp), %r11
	movq	80(%rsp), %r9
	movq	%rax, %r10
	je	.L2292
	cmpq	$1, %rdi
	je	.L2346
	movq	%rdi, %r8
	movq	%r15, %rdx
	movq	%rax, %rcx
	movq	%r9, 80(%rsp)
	movq	%r11, 72(%rsp)
	call	memcpy
	movq	80(%rsp), %r9
	movq	72(%rsp), %r11
	movq	%rax, %r10
.L2101:
	movq	192(%rsp), %r15
.L2292:
	cmpq	%r13, %r15
	je	.L2102
	movq	208(%rsp), %rax
	movq	%r15, %rcx
	movq	%r10, 88(%rsp)
	movq	%r9, 80(%rsp)
	leaq	1(%rax), %rdx
	movq	%r11, 72(%rsp)
	call	_ZdlPvy
	movq	88(%rsp), %r10
	movq	80(%rsp), %r9
	movq	72(%rsp), %r11
.L2102:
	movq	%r10, 192(%rsp)
	movq	%r10, %r15
	movq	%r9, 208(%rsp)
	jmp	.L2095
.L2317:
	movzbl	(%rcx), %edx
	movb	%dl, (%rcx,%r15)
	movq	192(%rsp), %rcx
	addq	%r11, %rcx
	jmp	.L2121
.L2322:
	movzbl	(%rbx), %eax
	movb	%al, (%r15)
	movq	192(%rsp), %r15
	jmp	.L2073
.L2340:
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	movq	192(%rsp), %rax
	movb	$0, (%rax,%rbp)
	movq	%rbp, 200(%rsp)
	jmp	.L2112
.L2054:
	leaq	1(%r14), %rcx
	call	_Znwy
.LEHE40:
	movq	72(%rsp), %r11
	movq	80(%rsp), %r9
	movq	%rax, %rdi
	movq	%r13, %rdx
	jmp	.L2055
.L2325:
	cmpq	$15, %r14
	jbe	.L2095
	cmpq	%r14, %rax
	jb	.L2091
	cmpq	$29, %r14
	ja	.L2093
	movl	$30, %r9d
.L2092:
	leaq	1(%r9), %rcx
	jmp	.L2098
.L2075:
	cmpq	%r14, %rax
	jnb	.L2068
	movabsq	$9223372036854775807, %rcx
	movq	%rax, %r14
	jmp	.L2076
.L2119:
	leaq	1(%rbp), %rcx
	movq	%rbp, %rbx
	jmp	.L2118
.L2327:
	movb	$48, (%rcx)
	jmp	.L2104
.L2345:
	movzbl	272(%rsp), %eax
	movb	%al, (%rcx)
	jmp	.L2140
.L2337:
	movq	(%rcx), %rax
	leaq	_ZNSt8__format14_Fixedbuf_sinkIcE11_M_overflowEv(%rip), %r8
	movq	(%rax), %rax
	cmpq	%r8, %rax
	je	.L2347
	movq	%r9, 64(%rsp)
	movq	%rcx, 48(%rsp)
.LEHB41:
	call	*%rax
.LEHE41:
	movq	64(%rsp), %r9
	movq	48(%rsp), %rcx
	jmp	.L2153
.L2341:
	movzbl	(%rdi), %eax
	movb	%al, (%r14)
	movq	192(%rsp), %rdi
	jmp	.L2125
.L2339:
	movabsq	$9223372036854775807, %rcx
	cmpq	%rcx, %r14
	je	.L2348
	addq	%r15, %r15
	cmpq	%r15, %r14
	jnb	.L2349
	movabsq	$9223372036854775806, %rax
	cmpq	%r15, %rax
	jnb	.L2080
	movq	%rax, %r15
.L2084:
	movq	%rdx, 88(%rsp)
	movq	%r11, 80(%rsp)
.LEHB42:
	call	_Znwy
	movq	88(%rsp), %rdx
	movq	%rax, %rcx
	movq	%rdi, %r8
	movq	%rax, 72(%rsp)
	call	memcpy
	movq	192(%rsp), %rcx
	movq	80(%rsp), %r11
	cmpq	%r13, %rcx
	je	.L2085
	movq	208(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	80(%rsp), %r11
.L2085:
	movq	72(%rsp), %rax
	movq	%r15, 208(%rsp)
	movq	%rax, 192(%rsp)
	movb	$46, (%rax,%rdi)
	jmp	.L2295
.L2342:
	movzbl	(%rdx), %eax
	movb	%al, (%rcx)
	movq	192(%rsp), %rdi
	jmp	.L2127
.L2093:
	leaq	1(%r14), %rcx
	movq	%r14, %r9
	jmp	.L2098
.L2343:
	movl	$256, %edi
	movl	$257, %ecx
	jmp	.L2001
.L2338:
	cmpq	$16, %r14
	jne	.L2081
	movl	$30, %r15d
.L2080:
	leaq	1(%r15), %rcx
	jmp	.L2084
.L2346:
	movzbl	(%r15), %eax
	movb	%al, (%r10)
	jmp	.L2101
.L2349:
	leaq	2(%rdi), %rcx
	movq	%r14, %r15
	jmp	.L2084
.L2347:
	movq	%rdx, 24(%rcx)
	jmp	.L2153
.L2344:
	movl	$256, %edi
	jmp	.L2172
.L2348:
	leaq	.LC8(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.LEHE42:
.L2227:
	movq	%rax, %rbx
.L2158:
	leaq	224(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L2159:
	leaq	192(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rcx
.LEHB43:
	call	_Unwind_Resume
.LEHE43:
.L2004:
	leaq	.LC8(%rip), %rcx
.LEHB44:
	call	_ZSt20__throw_length_errorPKc
.L2333:
	leaq	.LC8(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L2117:
	leaq	.LC8(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L2071:
	xorl	%eax, %eax
	movq	%rdi, 32(%rsp)
	movq	%rbx, %r9
	xorl	%r8d, %r8d
	movq	%rax, 40(%rsp)
	leaq	192(%rsp), %rcx
	movq	%rbx, %rdx
	movq	%r11, 72(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE15_M_replace_coldEPcyPKcyy
	movq	72(%rsp), %r11
	movq	192(%rsp), %r15
	jmp	.L2073
.L2328:
	leaq	.LC9(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L2166:
	movq	%rbp, %r9
	movq	%r11, %r8
	leaq	.LC15(%rip), %rdx
	leaq	.LC16(%rip), %rcx
	call	_ZSt24__throw_out_of_range_fmtPKcz
.L2225:
	movq	%rax, %rbx
	jmp	.L2159
.L2091:
	leaq	.LC8(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L2324:
	leaq	.LC10(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L2320:
	leaq	.LC14(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L2315:
	leaq	.LC10(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.L2314:
	movq	%r11, %r8
	leaq	.LC17(%rip), %rdx
	leaq	.LC18(%rip), %rcx
	call	_ZSt24__throw_out_of_range_fmtPKcz
.L2053:
	leaq	.LC8(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
.LEHE44:
.L2226:
	leaq	184(%rsp), %rcx
	movq	%rax, %rbx
	call	_ZNSt6localeD1Ev
	jmp	.L2158
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA7712:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE7712-.LLSDACSB7712
.LLSDACSB7712:
	.uleb128 .LEHB36-.LFB7712
	.uleb128 .LEHE36-.LEHB36
	.uleb128 .L2226-.LFB7712
	.uleb128 0
	.uleb128 .LEHB37-.LFB7712
	.uleb128 .LEHE37-.LEHB37
	.uleb128 .L2227-.LFB7712
	.uleb128 0
	.uleb128 .LEHB38-.LFB7712
	.uleb128 .LEHE38-.LEHB38
	.uleb128 .L2225-.LFB7712
	.uleb128 0
	.uleb128 .LEHB39-.LFB7712
	.uleb128 .LEHE39-.LEHB39
	.uleb128 .L2227-.LFB7712
	.uleb128 0
	.uleb128 .LEHB40-.LFB7712
	.uleb128 .LEHE40-.LEHB40
	.uleb128 .L2225-.LFB7712
	.uleb128 0
	.uleb128 .LEHB41-.LFB7712
	.uleb128 .LEHE41-.LEHB41
	.uleb128 .L2227-.LFB7712
	.uleb128 0
	.uleb128 .LEHB42-.LFB7712
	.uleb128 .LEHE42-.LEHB42
	.uleb128 .L2225-.LFB7712
	.uleb128 0
	.uleb128 .LEHB43-.LFB7712
	.uleb128 .LEHE43-.LEHB43
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB44-.LFB7712
	.uleb128 .LEHE44-.LEHB44
	.uleb128 .L2225-.LFB7712
	.uleb128 0
.LLSDACSE7712:
	.section	.text$_ZNKSt8__format14__formatter_fpIcE6formatIeNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.seh_endproc
	.section	.text$_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE11_M_overflowEv,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE11_M_overflowEv
	.def	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE11_M_overflowEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE11_M_overflowEv
_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE11_M_overflowEv:
.LFB8302:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, %r10
	movq	344(%rcx), %rcx
	movq	328(%r10), %rax
	movq	8(%r10), %r9
	cmpq	%rax, %rcx
	jb	.L2351
	movq	%r9, 24(%r10)
.L2350:
	addq	$80, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L2351:
	movq	24(%r10), %r8
	movq	320(%r10), %rdx
	subq	%r9, %r8
	cmpq	$-1, %rax
	jne	.L2353
	cmpq	%rdx, %rcx
	jnb	.L2382
.L2353:
	addq	%r8, %rcx
	cmpq	%rdx, %rax
	cmova	%rdx, %rax
	movq	%rcx, 344(%r10)
	cmpq	%rax, %rcx
	jb	.L2358
	movq	%r10, %rcx
	movq	%r10, 96(%rsp)
	call	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE15_M_force_updateEv
	movq	96(%rsp), %r10
	testb	%al, %al
	je	.L2350
	movq	8(%r10), %r9
	movq	24(%r10), %r8
	subq	%r9, %r8
	jne	.L2380
	jmp	.L2350
	.p2align 4,,10
	.p2align 3
.L2382:
	movq	336(%r10), %rcx
	cmpq	24(%r10), %r9
	jne	.L2383
.L2354:
	movq	(%rcx), %rax
	leaq	_ZNKSt8__format5_SinkIcE13_M_discardingEv(%rip), %rdx
	movq	%rcx, 336(%r10)
	movq	24(%rax), %rax
	cmpq	%rdx, %rax
	je	.L2381
	leaq	_ZNKSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE13_M_discardingEv(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2384
	movq	%r10, 96(%rsp)
	call	*%rax
	movq	96(%rsp), %r10
	testb	%al, %al
	je	.L2381
.L2357:
	movq	344(%r10), %rax
	movq	%rax, 328(%r10)
.L2381:
	movq	8(%r10), %rax
	movq	%rax, 24(%r10)
	addq	$80, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L2358:
	testq	%r8, %r8
	je	.L2350
.L2380:
	movq	296(%r10), %rdx
	leaq	288(%r10), %rbx
	movabsq	$9223372036854775806, %rax
	subq	%rdx, %rax
	cmpq	%r8, %rax
	jb	.L2385
	movq	288(%r10), %rcx
	leaq	304(%r10), %rax
	cmpq	%rax, %rcx
	je	.L2366
	movq	304(%r10), %rax
.L2360:
	leaq	(%rdx,%r8), %r11
	cmpq	%r11, %rax
	jb	.L2361
	addq	%rdx, %rcx
	cmpq	$1, %r8
	je	.L2386
	movq	%r9, %rdx
	movq	%r10, 96(%rsp)
	movq	%r11, 56(%rsp)
	call	memcpy
	movq	56(%rsp), %r11
	movq	96(%rsp), %r10
	.p2align 4
	.p2align 3
.L2363:
	movq	288(%r10), %rax
	movb	$0, (%rax,%r11)
	movq	%r11, 296(%r10)
	jmp	.L2381
	.p2align 4,,10
	.p2align 3
.L2383:
	leaq	64(%rsp), %rdx
	movq	%r10, 96(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%r8, 64(%rsp)
	movq	%r9, 72(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	movq	96(%rsp), %r10
	movq	56(%rsp), %rcx
	jmp	.L2354
	.p2align 4,,10
	.p2align 3
.L2386:
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	jmp	.L2363
	.p2align 4,,10
	.p2align 3
.L2384:
	movq	328(%rcx), %rax
	cmpq	%rax, 344(%rcx)
	jnb	.L2357
	jmp	.L2381
	.p2align 4,,10
	.p2align 3
.L2361:
	movq	%r8, 32(%rsp)
	movq	%rbx, %rcx
	xorl	%r8d, %r8d
	movq	%r10, 96(%rsp)
	movq	%r11, 56(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	movq	96(%rsp), %r10
	movq	56(%rsp), %r11
	jmp	.L2363
	.p2align 4,,10
	.p2align 3
.L2366:
	movl	$15, %eax
	jmp	.L2360
.L2385:
	leaq	.LC9(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE10_M_reserveEy,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE10_M_reserveEy
	.def	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE10_M_reserveEy;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE10_M_reserveEy
_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE10_M_reserveEy:
.LFB8303:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	.seh_endprologue
	movq	344(%rcx), %rax
	movq	%rcx, %r10
	movq	328(%rcx), %rcx
	movq	%rdx, %r11
	movq	8(%r10), %r9
	cmpq	%rcx, %rax
	jb	.L2388
	movq	%r9, 24(%r10)
	xorl	%r8d, %r8d
.L2389:
	movq	16(%r10), %rcx
	movq	%r10, %rbx
	subq	%r8, %rcx
	cmpq	%r11, %rcx
	jnb	.L2409
	cmpq	%r11, 16(%r10)
	jb	.L2421
	movq	(%r10), %rax
	leaq	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE11_M_overflowEv(%rip), %rdx
	movq	(%rax), %rax
	cmpq	%rdx, %rax
	je	.L2431
	leaq	_ZNSt8__format14_Fixedbuf_sinkIcE11_M_overflowEv(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2430
	movq	%r11, 104(%rsp)
	movq	%r10, %rcx
	movq	%r10, 96(%rsp)
	call	*%rax
	movq	96(%rsp), %r10
	movq	104(%rsp), %r11
	movq	16(%r10), %rax
	movq	24(%r10), %rdx
	subq	8(%r10), %rdx
	subq	%rdx, %rax
.L2418:
	xorl	%ebx, %ebx
	cmpq	%r11, %rax
	cmovnb	%r10, %rbx
.L2409:
	movq	%rbx, %rax
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L2388:
	movq	24(%r10), %r8
	cmpq	320(%r10), %rax
	jb	.L2390
	cmpq	$-1, %rcx
	je	.L2432
.L2390:
	subq	%r9, %r8
	jmp	.L2389
	.p2align 4,,10
	.p2align 3
.L2421:
	xorl	%ebx, %ebx
	movq	%rbx, %rax
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L2432:
	movq	336(%r10), %rbx
	cmpq	%r9, %r8
	je	.L2433
	subq	%r9, %r8
	movq	%rdx, 104(%rsp)
	movq	%rbx, %rcx
	leaq	48(%rsp), %rdx
	movq	%r10, 96(%rsp)
	movq	%r8, 48(%rsp)
	movq	%r9, 56(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	movq	(%rbx), %rax
	movq	96(%rsp), %r10
	leaq	_ZNKSt8__format5_SinkIcE13_M_discardingEv(%rip), %rcx
	movq	104(%rsp), %r11
	movq	24(%rax), %rdx
	movq	%rbx, 336(%r10)
	cmpq	%rcx, %rdx
	je	.L2396
	leaq	_ZNKSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE13_M_discardingEv(%rip), %rcx
	cmpq	%rcx, %rdx
	je	.L2434
	movq	%r11, 104(%rsp)
	movq	%rbx, %rcx
	movq	%r10, 96(%rsp)
	call	*%rdx
	movq	96(%rsp), %r10
	movq	104(%rsp), %r11
	testb	%al, %al
	movq	336(%r10), %rbx
	movq	(%rbx), %rax
	je	.L2396
.L2395:
	movq	344(%r10), %rdx
	movq	%rdx, 328(%r10)
.L2396:
	movq	8(%r10), %rdx
	movq	%rdx, 24(%r10)
.L2392:
	movq	8(%rax), %r8
	leaq	_ZNSt8__format5_SinkIcE10_M_reserveEy(%rip), %rdx
	cmpq	%rdx, %r8
	je	.L2435
	movq	%r10, 96(%rsp)
	movq	%r11, %rdx
	movq	%rbx, %rcx
	movq	%r11, 104(%rsp)
	call	*%r8
	movq	104(%rsp), %r11
	movq	96(%rsp), %r10
	testq	%rax, %rax
	movq	%rax, %rbx
	jne	.L2409
.L2429:
	movq	8(%r10), %r9
	movq	24(%r10), %r8
	subq	%r9, %r8
	jmp	.L2389
	.p2align 4,,10
	.p2align 3
.L2433:
	movq	(%rbx), %rax
	jmp	.L2392
	.p2align 4,,10
	.p2align 3
.L2430:
	movq	%r9, 24(%rbx)
	jmp	.L2409
	.p2align 4,,10
	.p2align 3
.L2431:
	testq	%r8, %r8
	je	.L2409
	movq	296(%r10), %rdx
	movabsq	$9223372036854775806, %rax
	subq	%rdx, %rax
	cmpq	%r8, %rax
	jb	.L2413
	movq	288(%r10), %rax
	leaq	304(%r10), %rcx
	cmpq	%rcx, %rax
	je	.L2422
	movq	304(%r10), %rcx
.L2414:
	leaq	(%rdx,%r8), %rbx
	cmpq	%rbx, %rcx
	jb	.L2415
	leaq	(%rax,%rdx), %rcx
	cmpq	$1, %r8
	je	.L2436
	movq	%r9, %rdx
	movq	%r11, 104(%rsp)
	movq	%r10, 96(%rsp)
	call	memcpy
	movq	96(%rsp), %r10
	movq	104(%rsp), %r11
	.p2align 4
	.p2align 3
.L2417:
	movq	288(%r10), %rax
	movb	$0, (%rax,%rbx)
	movq	8(%r10), %rax
	movq	%rbx, 296(%r10)
	movq	%rax, 24(%r10)
	movq	16(%r10), %rax
	jmp	.L2418
	.p2align 4,,10
	.p2align 3
.L2434:
	movq	328(%rbx), %rdx
	cmpq	%rdx, 344(%rbx)
	jnb	.L2395
	jmp	.L2396
	.p2align 4,,10
	.p2align 3
.L2435:
	movq	8(%rbx), %r9
	movq	24(%rbx), %r8
	movq	16(%rbx), %rcx
	subq	%r9, %r8
	movq	%rcx, %rdx
	subq	%r8, %rdx
	cmpq	%r11, %rdx
	jnb	.L2409
	cmpq	%r11, %rcx
	jb	.L2429
	movq	(%rax), %rax
	leaq	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE11_M_overflowEv(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2437
	leaq	_ZNSt8__format14_Fixedbuf_sinkIcE11_M_overflowEv(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2430
	movq	%r11, 104(%rsp)
	movq	%rbx, %rcx
	movq	%r10, 96(%rsp)
	call	*%rax
	movq	16(%rbx), %rax
	movq	24(%rbx), %rdx
	movq	104(%rsp), %r11
	subq	8(%rbx), %rdx
	movq	96(%rsp), %r10
	subq	%rdx, %rax
.L2406:
	cmpq	%r11, %rax
	jb	.L2429
	jmp	.L2409
	.p2align 4,,10
	.p2align 3
.L2415:
	movq	%r8, 32(%rsp)
	leaq	288(%r10), %rcx
	xorl	%r8d, %r8d
	movq	%r11, 104(%rsp)
	movq	%r10, 96(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	movq	104(%rsp), %r11
	movq	96(%rsp), %r10
	jmp	.L2417
.L2422:
	movl	$15, %ecx
	jmp	.L2414
.L2436:
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	jmp	.L2417
.L2437:
	testq	%r8, %r8
	je	.L2409
	movq	296(%rbx), %rdx
	movabsq	$9223372036854775806, %rax
	subq	%rdx, %rax
	cmpq	%r8, %rax
	jb	.L2413
	movq	288(%rbx), %rcx
	leaq	304(%rbx), %rax
	cmpq	%rax, %rcx
	je	.L2420
	movq	304(%rbx), %rax
.L2402:
	leaq	(%r8,%rdx), %rsi
	cmpq	%rsi, %rax
	jb	.L2403
	addq	%rdx, %rcx
	cmpq	$1, %r8
	je	.L2438
	movq	%r9, %rdx
	movq	%r11, 104(%rsp)
	movq	%r10, 96(%rsp)
	call	memcpy
	movq	96(%rsp), %r10
	movq	104(%rsp), %r11
.L2405:
	movq	288(%rbx), %rax
	movb	$0, (%rax,%rsi)
	movq	8(%rbx), %rax
	movq	%rsi, 296(%rbx)
	movq	%rax, 24(%rbx)
	movq	16(%rbx), %rax
	jmp	.L2406
.L2403:
	movq	%r8, 32(%rsp)
	leaq	288(%rbx), %rcx
	xorl	%r8d, %r8d
	movq	%r11, 104(%rsp)
	movq	%r10, 96(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	movq	104(%rsp), %r11
	movq	96(%rsp), %r10
	jmp	.L2405
.L2420:
	movl	$15, %eax
	jmp	.L2402
.L2438:
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	jmp	.L2405
.L2413:
	leaq	.LC9(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
	nop
	.seh_endproc
	.section .rdata,"dr"
.LC23:
	.ascii "false\0"
.LC24:
	.ascii "true\0"
	.section	.text$_ZNSt16basic_format_argISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE8_M_visitIZNS1_15__do_vformat_toIcLj1EEENS2_IT_EES9_St17basic_string_viewIS8_St11char_traitsIS8_EERS0_IS9_S8_EEUlRS8_E_EEDcOS8_NS1_6_Arg_tE,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt16basic_format_argISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE8_M_visitIZNS1_15__do_vformat_toIcLj1EEENS2_IT_EES9_St17basic_string_viewIS8_St11char_traitsIS8_EERS0_IS9_S8_EEUlRS8_E_EEDcOS8_NS1_6_Arg_tE
	.def	_ZNSt16basic_format_argISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE8_M_visitIZNS1_15__do_vformat_toIcLj1EEENS2_IT_EES9_St17basic_string_viewIS8_St11char_traitsIS8_EERS0_IS9_S8_EEUlRS8_E_EEDcOS8_NS1_6_Arg_tE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt16basic_format_argISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE8_M_visitIZNS1_15__do_vformat_toIcLj1EEENS2_IT_EES9_St17basic_string_viewIS8_St11char_traitsIS8_EERS0_IS9_S8_EEUlRS8_E_EEDcOS8_NS1_6_Arg_tE
_ZNSt16basic_format_argISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE8_M_visitIZNS1_15__do_vformat_toIcLj1EEENS2_IT_EES9_St17basic_string_viewIS8_St11char_traitsIS8_EERS0_IS9_S8_EEUlRS8_E_EEDcOS8_NS1_6_Arg_tE:
.LFB6847:
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
	subq	$344, %rsp
	.seh_stackalloc	344
	.seh_endprologue
	movq	%rdx, %rbx
	movzbl	%r8b, %r8d
	leaq	.L2442(%rip), %rdx
	movq	%rcx, %r9
	movslq	(%rdx,%r8,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L2442:
	.long	.L2439-.L2442
	.long	.L2452-.L2442
	.long	.L2451-.L2442
	.long	.L2450-.L2442
	.long	.L2449-.L2442
	.long	.L2448-.L2442
	.long	.L2447-.L2442
	.long	.L2439-.L2442
	.long	.L2439-.L2442
	.long	.L2439-.L2442
	.long	.L2446-.L2442
	.long	.L2445-.L2442
	.long	.L2439-.L2442
	.long	.L2439-.L2442
	.long	.L2444-.L2442
	.long	.L2443-.L2442
	.long	.L2439-.L2442
	.long	.L2439-.L2442
	.long	.L2439-.L2442
	.long	.L2439-.L2442
	.long	.L2439-.L2442
	.section	.text$_ZNSt16basic_format_argISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE8_M_visitIZNS1_15__do_vformat_toIcLj1EEENS2_IT_EES9_St17basic_string_viewIS8_St11char_traitsIS8_EERS0_IS9_S8_EEUlRS8_E_EEDcOS8_NS1_6_Arg_tE,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L2445:
	movq	(%rcx), %rdi
	movq	8(%rcx), %rsi
.L2834:
	movq	(%rbx), %rax
	leaq	_ZNSt8__format5_SinkIcE10_M_reserveEy(%rip), %rdx
	movq	(%rax), %rcx
	movq	(%rcx), %rax
	movq	8(%rax), %rax
	cmpq	%rdx, %rax
	movq	%rdi, %rdx
	je	.L2835
	call	*%rax
	movq	%rax, %r10
.L2593:
	testq	%r10, %r10
	je	.L2439
	movq	24(%r10), %rcx
	movq	%rsi, %rdx
	movq	%rdi, %r8
	movq	%r10, 48(%rsp)
	call	memcpy
	movq	48(%rsp), %r10
	leaq	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE7_M_bumpEy(%rip), %rdx
	movq	(%r10), %rax
	movq	16(%rax), %rax
	cmpq	%rdx, %rax
	je	.L2836
.L2594:
	leaq	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE7_M_bumpEy(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2837
	leaq	_ZNSt8__format5_SinkIcE7_M_bumpEy(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2838
	movq	%rdi, %rdx
.L2764:
	movq	%r10, %rcx
	call	*%rax
.L2639:
	movq	8(%rbx), %rax
	movb	$1, (%rax)
.L2439:
	addq	$344, %rsp
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
.L2444:
	movq	8(%r9), %rdx
	movq	(%rcx), %rcx
	movq	%rdx, %rax
	movq	%rcx, %r8
	shrq	$63, %rax
	negq	%r8
	movq	%rax, %rbp
	movq	%rdx, %rax
	adcq	$0, %rax
	negq	%rax
	cmovns	%r8, %rcx
	cmovns	%rax, %rdx
	movl	$9, %eax
	cmpq	%rcx, %rax
	movl	$0, %eax
	movq	%rcx, %r14
	movq	%rdx, %r15
	sbbq	%rdx, %rax
	jnc	.L2665
	movq	%rbx, 424(%rsp)
	movq	%rdx, %rax
	movl	$1, %edi
	xorl	%r9d, %r9d
	movq	%rcx, %rbx
	jmp	.L2609
	.p2align 4,,10
	.p2align 3
.L2606:
	movl	$999, %ecx
	cmpq	%rbx, %rcx
	movq	%r9, %rcx
	sbbq	%rax, %rcx
	jnc	.L2839
	movl	$9999, %edx
	movq	%r9, %rcx
	cmpq	%rbx, %rdx
	sbbq	%rax, %rcx
	jnc	.L2840
	leaq	96(%rsp), %rdx
	leaq	112(%rsp), %rcx
	movq	%rbx, 112(%rsp)
	addl	$4, %edi
	movq	%rax, 120(%rsp)
	movq	%rax, 72(%rsp)
	movq	$10000, 96(%rsp)
	movq	$0, 104(%rsp)
	call	__udivti3
	xorl	%r9d, %r9d
	movl	$99999, %eax
	cmpq	%rbx, %rax
	movq	%r9, %rbx
	sbbq	72(%rsp), %rbx
	movups	%xmm0, 48(%rsp)
	jnc	.L2841
	movq	48(%rsp), %rbx
	movq	56(%rsp), %rax
.L2609:
	movl	$99, %ecx
	cmpq	%rbx, %rcx
	movq	%r9, %rcx
	sbbq	%rax, %rcx
	jc	.L2606
	movq	424(%rsp), %rbx
	addl	$1, %edi
.L2605:
	movq	(%rbx), %rax
	leaq	_ZNSt8__format5_SinkIcE10_M_reserveEy(%rip), %rdx
	leal	(%rdi,%rbp), %r8d
	movq	%r8, 48(%rsp)
	movq	(%rax), %rcx
	movq	(%rcx), %rax
	movq	8(%rax), %rax
	cmpq	%rdx, %rax
	movq	%r8, %rdx
	je	.L2842
	call	*%rax
	movq	48(%rsp), %r8
	movq	%rax, %r13
.L2611:
	testq	%r13, %r13
	je	.L2439
	movdqu	.LC25(%rip), %xmm0
	movq	24(%r13), %rax
	movq	%r15, %rcx
	movups	%xmm0, 128(%rsp)
	movdqu	.LC26(%rip), %xmm0
	leaq	(%rax,%rbp), %r12
	movb	$45, (%rax)
	movl	$99, %eax
	movups	%xmm0, 144(%rsp)
	movdqu	.LC27(%rip), %xmm0
	cmpq	%r14, %rax
	movl	$0, %eax
	sbbq	%r15, %rax
	movups	%xmm0, 160(%rsp)
	movdqu	.LC28(%rip), %xmm0
	movups	%xmm0, 176(%rsp)
	movdqu	.LC29(%rip), %xmm0
	movups	%xmm0, 192(%rsp)
	movdqu	.LC30(%rip), %xmm0
	movups	%xmm0, 208(%rsp)
	movdqu	.LC31(%rip), %xmm0
	movups	%xmm0, 224(%rsp)
	movdqu	.LC32(%rip), %xmm0
	movups	%xmm0, 240(%rsp)
	movdqu	.LC33(%rip), %xmm0
	movups	%xmm0, 256(%rsp)
	movdqu	.LC34(%rip), %xmm0
	movups	%xmm0, 272(%rsp)
	movdqu	.LC35(%rip), %xmm0
	movups	%xmm0, 288(%rsp)
	movdqu	.LC36(%rip), %xmm0
	movups	%xmm0, 304(%rsp)
	movdqu	.LC37(%rip), %xmm0
	movups	%xmm0, 313(%rsp)
	jnc	.L2612
	movq	%rbx, 424(%rsp)
	leal	-1(%rdi), %r15d
	movq	%rcx, %r9
	movq	%r8, 48(%rsp)
	movq	%r14, %r8
	.p2align 4
	.p2align 3
.L2613:
	movq	%r8, %rax
	movq	%r8, %r10
	xorl	%ebx, %ebx
	movq	%r9, %r11
	movabsq	$1152921504606846975, %rsi
	shrdq	$60, %r9, %rax
	movabsq	$1152921504606846975, %rcx
	andq	%rsi, %rax
	andq	%r8, %rcx
	addq	%rax, %rcx
	movq	%r9, %rax
	shrq	$56, %rax
	addq	%rax, %rcx
	movabsq	$5165088340638674453, %rax
	mulq	%rcx
	movq	%rcx, %rax
	subq	%rdx, %rax
	shrq	%rax
	addq	%rax, %rdx
	shrq	$4, %rdx
	leaq	(%rdx,%rdx,4), %rax
	movabsq	$2951479051793528258, %rdx
	leaq	(%rax,%rax,4), %rax
	subq	%rax, %rcx
	movabsq	$-8116567392432202711, %rax
	subq	%rcx, %r10
	sbbq	%rbx, %r11
	imulq	%r10, %rdx
	imulq	%r11, %rax
	leaq	(%rax,%rdx), %rsi
	movabsq	$-8116567392432202711, %rax
	mulq	%r10
	movq	%rax, %r10
	leaq	(%rsi,%rdx), %rax
	movl	$25, %esi
	movq	%rax, %r11
	movq	%r10, %rax
	andl	$3, %eax
	mulq	%rsi
	movq	%r9, %rdx
	addq	%rcx, %rax
	movq	%r8, %rcx
	addq	%rax, %rax
	shrdq	$2, %r11, %r10
	shrq	$2, %r11
	movq	%r10, %r8
	movl	%r15d, %r10d
	movq	%r11, %r9
	movzbl	129(%rsp,%rax), %r11d
	movzbl	128(%rsp,%rax), %eax
	movb	%r11b, (%r12,%r10)
	leal	-1(%r15), %r10d
	subl	$2, %r15d
	movb	%al, (%r12,%r10)
	movl	$9999, %eax
	cmpq	%rcx, %rax
	movl	$0, %eax
	sbbq	%rdx, %rax
	jc	.L2613
	movq	%r8, %r14
	movq	424(%rsp), %rbx
	movq	48(%rsp), %r8
	movq	%r9, %r15
.L2612:
	movl	$9, %eax
	leal	48(%r14), %r10d
	cmpq	%r14, %rax
	movl	$0, %eax
	sbbq	%r15, %rax
	jnc	.L2615
	movq	%r14, %r10
	addq	%r14, %r10
	movzbl	129(%rsp,%r10), %edx
	movzbl	128(%rsp,%r10), %r10d
	movb	%dl, 1(%r12)
.L2615:
	movb	%r10b, (%r12)
	movq	0(%r13), %rax
	leaq	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE7_M_bumpEy(%rip), %rdx
	movq	16(%rax), %rax
	cmpq	%rdx, %rax
	je	.L2843
	leaq	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE7_M_bumpEy(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2844
	leaq	_ZNSt8__format5_SinkIcE7_M_bumpEy(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2845
	movq	%r8, %rdx
	movq	%r13, %rcx
	call	*%rax
	jmp	.L2639
	.p2align 4,,10
	.p2align 3
.L2446:
	movq	(%rcx), %rsi
	movq	(%rcx), %rcx
	call	strlen
	movq	%rax, %rdi
	jmp	.L2834
	.p2align 4,,10
	.p2align 3
.L2447:
	movq	(%rcx), %r9
	cmpq	$9, %r9
	jbe	.L2660
	movq	%r9, %rcx
	movl	$1, %r8d
	movabsq	$3777893186295716171, %r10
	jmp	.L2561
	.p2align 4,,10
	.p2align 3
.L2558:
	cmpq	$999, %rcx
	jbe	.L2846
	cmpq	$9999, %rcx
	jbe	.L2847
	movq	%rcx, %rax
	addl	$4, %r8d
	mulq	%r10
	cmpq	$99999, %rcx
	jbe	.L2848
	movq	%rdx, %rcx
	shrq	$11, %rcx
.L2561:
	cmpq	$99, %rcx
	ja	.L2558
	leal	1(%r8), %edi
	movq	%rdi, %r8
.L2557:
	movq	(%rbx), %rax
	leaq	_ZNSt8__format5_SinkIcE10_M_reserveEy(%rip), %rdx
	movl	%r8d, 72(%rsp)
	movq	%r9, 48(%rsp)
	movq	(%rax), %rcx
	movq	(%rcx), %rax
	movq	8(%rax), %rax
	cmpq	%rdx, %rax
	movq	%rdi, %rdx
	je	.L2849
	call	*%rax
	movl	72(%rsp), %r8d
	movq	48(%rsp), %r9
	movq	%rax, %r10
.L2563:
	testq	%r10, %r10
	je	.L2439
	movdqu	.LC25(%rip), %xmm0
	movq	24(%r10), %rcx
	movups	%xmm0, 128(%rsp)
	movdqu	.LC26(%rip), %xmm0
	movups	%xmm0, 144(%rsp)
	movdqu	.LC27(%rip), %xmm0
	movups	%xmm0, 160(%rsp)
	movdqu	.LC28(%rip), %xmm0
	movups	%xmm0, 176(%rsp)
	movdqu	.LC29(%rip), %xmm0
	movups	%xmm0, 192(%rsp)
	movdqu	.LC30(%rip), %xmm0
	movups	%xmm0, 208(%rsp)
	movdqu	.LC31(%rip), %xmm0
	movups	%xmm0, 224(%rsp)
	movdqu	.LC32(%rip), %xmm0
	movups	%xmm0, 240(%rsp)
	movdqu	.LC33(%rip), %xmm0
	movups	%xmm0, 256(%rsp)
	movdqu	.LC34(%rip), %xmm0
	movups	%xmm0, 272(%rsp)
	movdqu	.LC35(%rip), %xmm0
	movups	%xmm0, 288(%rsp)
	movdqu	.LC36(%rip), %xmm0
	movups	%xmm0, 304(%rsp)
	movdqu	.LC37(%rip), %xmm0
	movups	%xmm0, 313(%rsp)
	cmpq	$99, %r9
	jbe	.L2564
	subl	$1, %r8d
	.p2align 4
	.p2align 3
.L2565:
	movabsq	$2951479051793528259, %rax
	movq	%r9, %rdx
	shrq	$2, %rdx
	mulq	%rdx
	movq	%r9, %rax
	shrq	$2, %rdx
	imulq	$100, %rdx, %r11
	subq	%r11, %rax
	movq	%r9, %r11
	movq	%rdx, %r9
	movl	%r8d, %edx
	movzbl	129(%rsp,%rax,2), %esi
	movzbl	128(%rsp,%rax,2), %eax
	movb	%sil, (%rcx,%rdx)
	leal	-1(%r8), %edx
	subl	$2, %r8d
	movb	%al, (%rcx,%rdx)
	cmpq	$9999, %r11
	ja	.L2565
.L2564:
	leal	48(%r9), %eax
	cmpq	$9, %r9
	jbe	.L2567
	movzbl	129(%rsp,%r9,2), %eax
	movb	%al, 1(%rcx)
	movzbl	128(%rsp,%r9,2), %eax
.L2567:
	movb	%al, (%rcx)
	movq	(%r10), %rax
	leaq	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE7_M_bumpEy(%rip), %rdx
	movq	16(%rax), %rax
	cmpq	%rdx, %rax
	jne	.L2594
	movq	344(%r10), %rax
	movq	328(%r10), %rdx
	cmpq	%rdx, %rax
	jnb	.L2639
	movq	320(%r10), %rcx
	addq	%rdi, 24(%r10)
	cmpq	%rcx, %rax
	jb	.L2676
	cmpq	$-1, %rdx
	je	.L2639
.L2676:
	addq	%rdi, %rax
.L2772:
	cmpq	%rcx, %rdx
	movq	%rax, 344(%r10)
	cmova	%rcx, %rdx
	cmpq	%rdx, %rax
	jnb	.L2767
	jmp	.L2639
	.p2align 4,,10
	.p2align 3
.L2448:
	movq	(%rcx), %rax
	movq	%rax, %r11
	movq	%rax, %r9
	shrq	$63, %r11
	negq	%r9
	cmovs	%rax, %r9
	cmpq	$9, %r9
	jbe	.L2657
	movq	%r9, %rcx
	movl	$1, %r8d
	movabsq	$3777893186295716171, %r10
	jmp	.L2539
	.p2align 4,,10
	.p2align 3
.L2536:
	cmpq	$999, %rcx
	jbe	.L2850
	cmpq	$9999, %rcx
	jbe	.L2851
	movq	%rcx, %rax
	addl	$4, %r8d
	mulq	%r10
	cmpq	$99999, %rcx
	jbe	.L2535
	movq	%rdx, %rcx
	shrq	$11, %rcx
.L2539:
	cmpq	$99, %rcx
	ja	.L2536
	addl	$1, %r8d
.L2535:
	movq	(%rbx), %rax
	leaq	_ZNSt8__format5_SinkIcE10_M_reserveEy(%rip), %rdx
	leal	(%r8,%r11), %edi
	movq	%r11, 80(%rsp)
	movq	%r9, 72(%rsp)
	movq	(%rax), %rcx
	movl	%r8d, 48(%rsp)
	movq	(%rcx), %rax
	movq	8(%rax), %rax
	cmpq	%rdx, %rax
	movq	%rdi, %rdx
	je	.L2852
	call	*%rax
	movq	80(%rsp), %r11
	movq	72(%rsp), %r9
	movl	48(%rsp), %r8d
	movq	%rax, %r10
.L2541:
	testq	%r10, %r10
	je	.L2439
	movdqu	.LC25(%rip), %xmm0
	movq	24(%r10), %rcx
	movups	%xmm0, 128(%rsp)
	movdqu	.LC26(%rip), %xmm0
	movb	$45, (%rcx)
	addq	%r11, %rcx
	movups	%xmm0, 144(%rsp)
	movdqu	.LC27(%rip), %xmm0
	movups	%xmm0, 160(%rsp)
	movdqu	.LC28(%rip), %xmm0
	movups	%xmm0, 176(%rsp)
	movdqu	.LC29(%rip), %xmm0
	movups	%xmm0, 192(%rsp)
	movdqu	.LC30(%rip), %xmm0
	movups	%xmm0, 208(%rsp)
	movdqu	.LC31(%rip), %xmm0
	movups	%xmm0, 224(%rsp)
	movdqu	.LC32(%rip), %xmm0
	movups	%xmm0, 240(%rsp)
	movdqu	.LC33(%rip), %xmm0
	movups	%xmm0, 256(%rsp)
	movdqu	.LC34(%rip), %xmm0
	movups	%xmm0, 272(%rsp)
	movdqu	.LC35(%rip), %xmm0
	movups	%xmm0, 288(%rsp)
	movdqu	.LC36(%rip), %xmm0
	movups	%xmm0, 304(%rsp)
	movdqu	.LC37(%rip), %xmm0
	movups	%xmm0, 313(%rsp)
	cmpq	$99, %r9
	jbe	.L2542
	subl	$1, %r8d
	.p2align 4
	.p2align 3
.L2543:
	movabsq	$2951479051793528259, %rax
	movq	%r9, %rdx
	shrq	$2, %rdx
	mulq	%rdx
	movq	%r9, %rax
	shrq	$2, %rdx
	imulq	$100, %rdx, %r11
	subq	%r11, %rax
	movq	%r9, %r11
	movq	%rdx, %r9
	movl	%r8d, %edx
	movzbl	129(%rsp,%rax,2), %esi
	movzbl	128(%rsp,%rax,2), %eax
	movb	%sil, (%rcx,%rdx)
	leal	-1(%r8), %edx
	subl	$2, %r8d
	movb	%al, (%rcx,%rdx)
	cmpq	$9999, %r11
	ja	.L2543
.L2542:
	leal	48(%r9), %eax
	cmpq	$9, %r9
	jbe	.L2545
	movzbl	129(%rsp,%r9,2), %eax
	movb	%al, 1(%rcx)
	movzbl	128(%rsp,%r9,2), %eax
.L2545:
	movb	%al, (%rcx)
	movq	(%r10), %rax
	leaq	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE7_M_bumpEy(%rip), %rdx
	movq	16(%rax), %rax
	cmpq	%rdx, %rax
	jne	.L2594
	movq	344(%r10), %rdx
	movq	328(%r10), %rax
	cmpq	%rax, %rdx
	jnb	.L2639
	addq	%rdi, 24(%r10)
	movq	320(%r10), %rcx
	cmpq	$-1, %rax
	jne	.L2675
	cmpq	%rcx, %rdx
	jnb	.L2639
.L2675:
	addq	%rdi, %rdx
	cmpq	%rcx, %rax
	cmova	%rcx, %rax
	movq	%rdx, 344(%r10)
	cmpq	%rax, %rdx
	jnb	.L2767
	jmp	.L2639
	.p2align 4,,10
	.p2align 3
.L2449:
	movl	(%rcx), %r8d
	cmpl	$9, %r8d
	jbe	.L2654
	movl	%r8d, %eax
	movl	$1, %r9d
	movl	$3518437209, %ecx
	jmp	.L2517
	.p2align 4,,10
	.p2align 3
.L2514:
	cmpl	$999, %eax
	jbe	.L2853
	cmpl	$9999, %eax
	jbe	.L2854
	movl	%eax, %edx
	addl	$4, %r9d
	imulq	%rcx, %rdx
	shrq	$45, %rdx
	cmpl	$99999, %eax
	jbe	.L2855
	movl	%edx, %eax
.L2517:
	cmpl	$99, %eax
	ja	.L2514
	leal	1(%r9), %edx
	movq	%rdx, %r9
.L2513:
	movq	(%rbx), %rax
	leaq	_ZNSt8__format5_SinkIcE10_M_reserveEy(%rip), %r10
	movl	%r8d, 80(%rsp)
	movl	%r9d, 72(%rsp)
	movq	(%rax), %rcx
	movq	%rdx, 48(%rsp)
	movq	(%rcx), %rax
	movq	8(%rax), %rax
	cmpq	%r10, %rax
	je	.L2856
	call	*%rax
	movl	80(%rsp), %r8d
	movl	72(%rsp), %r9d
	movq	48(%rsp), %rdx
	movq	%rax, %r10
.L2519:
	testq	%r10, %r10
	je	.L2439
	movdqu	.LC25(%rip), %xmm0
	movq	24(%r10), %rcx
	movups	%xmm0, 128(%rsp)
	movdqu	.LC26(%rip), %xmm0
	movups	%xmm0, 144(%rsp)
	movdqu	.LC27(%rip), %xmm0
	movups	%xmm0, 160(%rsp)
	movdqu	.LC28(%rip), %xmm0
	movups	%xmm0, 176(%rsp)
	movdqu	.LC29(%rip), %xmm0
	movups	%xmm0, 192(%rsp)
	movdqu	.LC30(%rip), %xmm0
	movups	%xmm0, 208(%rsp)
	movdqu	.LC31(%rip), %xmm0
	movups	%xmm0, 224(%rsp)
	movdqu	.LC32(%rip), %xmm0
	movups	%xmm0, 240(%rsp)
	movdqu	.LC33(%rip), %xmm0
	movups	%xmm0, 256(%rsp)
	movdqu	.LC34(%rip), %xmm0
	movups	%xmm0, 272(%rsp)
	movdqu	.LC35(%rip), %xmm0
	movups	%xmm0, 288(%rsp)
	movdqu	.LC36(%rip), %xmm0
	movups	%xmm0, 304(%rsp)
	movdqu	.LC37(%rip), %xmm0
	movups	%xmm0, 313(%rsp)
	cmpl	$99, %r8d
	jbe	.L2520
	movq	%rbx, 424(%rsp)
	subl	$1, %r9d
	movq	%rdx, %rdi
	movq	%r10, %rbx
	.p2align 4
	.p2align 3
.L2521:
	movl	%r8d, %r11d
	movl	%r8d, %eax
	imulq	$1374389535, %r11, %r11
	shrq	$37, %r11
	imull	$100, %r11d, %edx
	subl	%edx, %eax
	movl	%r8d, %edx
	movl	%r11d, %r8d
	movl	%r9d, %r11d
	addl	%eax, %eax
	leal	1(%rax), %r10d
	movzbl	128(%rsp,%rax), %eax
	movzbl	128(%rsp,%r10), %esi
	movb	%sil, (%rcx,%r11)
	leal	-1(%r9), %r11d
	subl	$2, %r9d
	movb	%al, (%rcx,%r11)
	cmpl	$9999, %edx
	ja	.L2521
.L2832:
	movq	%rbx, %r10
	movq	424(%rsp), %rbx
	movq	%rdi, %rdx
.L2520:
	leal	48(%r8), %eax
	cmpl	$9, %r8d
	jbe	.L2523
	addl	%r8d, %r8d
	leal	1(%r8), %eax
	movzbl	128(%rsp,%rax), %eax
	movb	%al, 1(%rcx)
	movzbl	128(%rsp,%r8), %eax
.L2523:
	movb	%al, (%rcx)
	movq	(%r10), %rax
	leaq	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE7_M_bumpEy(%rip), %rcx
	movq	16(%rax), %rax
	cmpq	%rcx, %rax
	je	.L2796
	leaq	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE7_M_bumpEy(%rip), %rcx
	cmpq	%rcx, %rax
	je	.L2815
	leaq	_ZNSt8__format5_SinkIcE7_M_bumpEy(%rip), %rcx
	cmpq	%rcx, %rax
	jne	.L2764
.L2769:
	addq	%rdx, 24(%r10)
	jmp	.L2639
	.p2align 4,,10
	.p2align 3
.L2450:
	movl	(%rcx), %eax
	movl	%eax, %r11d
	movl	%eax, %r8d
	shrl	$31, %r11d
	negl	%r8d
	cmovs	%eax, %r8d
	cmpl	$9, %r8d
	jbe	.L2651
	movl	%r8d, %eax
	movl	$1, %r9d
	movl	$3518437209, %ecx
	jmp	.L2495
	.p2align 4,,10
	.p2align 3
.L2492:
	cmpl	$999, %eax
	jbe	.L2857
	cmpl	$9999, %eax
	jbe	.L2858
	movl	%eax, %edx
	addl	$4, %r9d
	imulq	%rcx, %rdx
	shrq	$45, %rdx
	cmpl	$99999, %eax
	jbe	.L2491
	movl	%edx, %eax
.L2495:
	cmpl	$99, %eax
	ja	.L2492
	addl	$1, %r9d
.L2491:
	movq	(%rbx), %rax
	leal	(%r11,%r9), %edx
	movl	%r11d, 92(%rsp)
	leaq	_ZNSt8__format5_SinkIcE10_M_reserveEy(%rip), %r10
	movl	%r8d, 80(%rsp)
	movq	(%rax), %rcx
	movl	%r9d, 72(%rsp)
	movq	%rdx, 48(%rsp)
	movq	(%rcx), %rax
	movq	8(%rax), %rax
	cmpq	%r10, %rax
	je	.L2859
	call	*%rax
	movl	92(%rsp), %r11d
	movl	80(%rsp), %r8d
	movl	72(%rsp), %r9d
	movq	48(%rsp), %rdx
	movq	%rax, %r10
.L2497:
	testq	%r10, %r10
	je	.L2439
	movdqu	.LC25(%rip), %xmm0
	movq	24(%r10), %rcx
	movzbl	%r11b, %r11d
	movups	%xmm0, 128(%rsp)
	movdqu	.LC26(%rip), %xmm0
	movb	$45, (%rcx)
	addq	%r11, %rcx
	movups	%xmm0, 144(%rsp)
	movdqu	.LC27(%rip), %xmm0
	movups	%xmm0, 160(%rsp)
	movdqu	.LC28(%rip), %xmm0
	movups	%xmm0, 176(%rsp)
	movdqu	.LC29(%rip), %xmm0
	movups	%xmm0, 192(%rsp)
	movdqu	.LC30(%rip), %xmm0
	movups	%xmm0, 208(%rsp)
	movdqu	.LC31(%rip), %xmm0
	movups	%xmm0, 224(%rsp)
	movdqu	.LC32(%rip), %xmm0
	movups	%xmm0, 240(%rsp)
	movdqu	.LC33(%rip), %xmm0
	movups	%xmm0, 256(%rsp)
	movdqu	.LC34(%rip), %xmm0
	movups	%xmm0, 272(%rsp)
	movdqu	.LC35(%rip), %xmm0
	movups	%xmm0, 288(%rsp)
	movdqu	.LC36(%rip), %xmm0
	movups	%xmm0, 304(%rsp)
	movdqu	.LC37(%rip), %xmm0
	movups	%xmm0, 313(%rsp)
	cmpl	$99, %r8d
	jbe	.L2520
	movq	%rbx, 424(%rsp)
	subl	$1, %r9d
	movq	%rdx, %rdi
	movq	%r10, %rbx
	.p2align 4
	.p2align 3
.L2499:
	movl	%r8d, %r11d
	movl	%r8d, %eax
	imulq	$1374389535, %r11, %r11
	shrq	$37, %r11
	imull	$100, %r11d, %edx
	subl	%edx, %eax
	movl	%r8d, %edx
	movl	%r11d, %r8d
	movl	%r9d, %r11d
	addl	%eax, %eax
	leal	1(%rax), %r10d
	movzbl	128(%rsp,%rax), %eax
	movzbl	128(%rsp,%r10), %esi
	movb	%sil, (%rcx,%r11)
	leal	-1(%r9), %r11d
	subl	$2, %r9d
	movb	%al, (%rcx,%r11)
	cmpl	$9999, %edx
	ja	.L2499
	jmp	.L2832
	.p2align 4,,10
	.p2align 3
.L2452:
	leaq	.LC23(%rip), %rax
	movzbl	(%rcx), %r8d
	leaq	_ZNSt8__format5_SinkIcE10_M_reserveEy(%rip), %r10
	movq	%r9, 416(%rsp)
	movq	%rax, 128(%rsp)
	leaq	.LC24(%rip), %rax
	movq	%rax, 136(%rsp)
	movq	(%rbx), %rax
	xorl	$1, %r8d
	movzbl	%r8b, %r8d
	movq	(%rax), %rcx
	leal	4(%r8), %edx
	movl	%edx, 72(%rsp)
	movq	(%rcx), %rax
	movq	%rdx, 48(%rsp)
	movq	8(%rax), %rax
	cmpq	%r10, %rax
	je	.L2860
	call	*%rax
	movl	72(%rsp), %r8d
	movq	416(%rsp), %r9
	movq	48(%rsp), %rdx
	movq	%rax, %r10
.L2454:
	testq	%r10, %r10
	je	.L2439
	movzbl	(%r9), %ecx
	movq	24(%r10), %rax
	movq	128(%rsp,%rcx,8), %rcx
	cmpl	$64, %r8d
	jnb	.L2456
	testb	$32, %r8b
	jne	.L2861
	testb	$16, %r8b
	jne	.L2862
	testb	$8, %r8b
	jne	.L2863
	testb	$4, %r8b
	jne	.L2864
	testl	%r8d, %r8d
	je	.L2457
	movzbl	(%rcx), %r9d
	andl	$2, %r8d
	movb	%r9b, (%rax)
	jne	.L2865
.L2457:
	movq	(%r10), %rax
	leaq	_ZNSt8__format5_SinkIcE7_M_bumpEy(%rip), %rcx
	movq	16(%rax), %rax
	cmpq	%rcx, %rax
	je	.L2769
	leaq	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE7_M_bumpEy(%rip), %rcx
	cmpq	%rcx, %rax
	je	.L2815
	leaq	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE7_M_bumpEy(%rip), %rcx
	cmpq	%rcx, %rax
	jne	.L2764
.L2796:
	movq	344(%r10), %rax
	movq	328(%r10), %rcx
	cmpq	%rcx, %rax
	jnb	.L2639
	movq	320(%r10), %r8
	addq	%rdx, 24(%r10)
	cmpq	%r8, %rax
	jb	.L2674
	cmpq	$-1, %rcx
	je	.L2639
.L2674:
	addq	%rdx, %rax
	cmpq	%r8, %rcx
	cmova	%r8, %rcx
	movq	%rax, 344(%r10)
	cmpq	%rcx, %rax
	jb	.L2639
.L2767:
	movq	%r10, %rcx
	call	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE15_M_force_updateEv
	jmp	.L2639
	.p2align 4,,10
	.p2align 3
.L2451:
	movq	(%rbx), %rax
	leaq	_ZNSt8__format5_SinkIcE10_M_reserveEy(%rip), %rdx
	movq	%r9, 416(%rsp)
	movq	(%rax), %rcx
	movq	(%rcx), %rax
	movq	8(%rax), %rax
	cmpq	%rdx, %rax
	movl	$1, %edx
	je	.L2866
	call	*%rax
	movq	416(%rsp), %r9
	movq	%rax, %r10
.L2478:
	testq	%r10, %r10
	je	.L2439
	movzbl	(%r9), %edx
	movq	24(%r10), %rax
	movb	%dl, (%rax)
	movq	(%r10), %rax
	leaq	_ZNSt8__format5_SinkIcE7_M_bumpEy(%rip), %rdx
	movq	16(%rax), %rax
	cmpq	%rdx, %rax
	je	.L2867
	leaq	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE7_M_bumpEy(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2868
	leaq	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE7_M_bumpEy(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2869
	movl	$1, %edx
	movq	%r10, %rcx
	call	*%rax
	jmp	.L2639
	.p2align 4,,10
	.p2align 3
.L2443:
	movdqu	(%rcx), %xmm4
	movl	$9, %eax
	movups	%xmm4, 48(%rsp)
	movq	48(%rsp), %r14
	movq	56(%rsp), %r15
	cmpq	%r14, %rax
	movl	$0, %eax
	sbbq	%r15, %rax
	jnc	.L2668
	movq	%rbx, 424(%rsp)
	movq	%r15, %rax
	movl	$1, %edi
	xorl	%r11d, %r11d
	movq	%r14, %rbx
	jmp	.L2631
	.p2align 4,,10
	.p2align 3
.L2628:
	movl	$999, %ecx
	cmpq	%rbx, %rcx
	movq	%r11, %rcx
	sbbq	%rax, %rcx
	jnc	.L2870
	movl	$9999, %edx
	movq	%r11, %rcx
	cmpq	%rbx, %rdx
	sbbq	%rax, %rcx
	jnc	.L2871
	leaq	96(%rsp), %rdx
	leaq	112(%rsp), %rcx
	movq	%rbx, 112(%rsp)
	addl	$4, %edi
	movq	%rax, 120(%rsp)
	movq	%rax, 72(%rsp)
	movq	$10000, 96(%rsp)
	movq	$0, 104(%rsp)
	call	__udivti3
	xorl	%r11d, %r11d
	movl	$99999, %eax
	cmpq	%rbx, %rax
	movq	%r11, %rbx
	sbbq	72(%rsp), %rbx
	movups	%xmm0, 48(%rsp)
	jnc	.L2872
	movq	48(%rsp), %rbx
	movq	56(%rsp), %rax
.L2631:
	movl	$99, %ecx
	cmpq	%rbx, %rcx
	movq	%r11, %rcx
	sbbq	%rax, %rcx
	jc	.L2628
	leal	1(%rdi), %r10d
	movq	424(%rsp), %rbx
	movl	%r10d, %edi
.L2627:
	movq	(%rbx), %rax
	leaq	_ZNSt8__format5_SinkIcE10_M_reserveEy(%rip), %rdx
	movq	%r10, 48(%rsp)
	movq	(%rax), %rcx
	movq	(%rcx), %rax
	movq	8(%rax), %rax
	cmpq	%rdx, %rax
	movq	%r10, %rdx
	je	.L2873
	call	*%rax
	movq	48(%rsp), %r10
	movq	%rax, %r11
.L2633:
	testq	%r11, %r11
	je	.L2439
	movdqu	.LC25(%rip), %xmm0
	movl	$99, %eax
	movq	24(%r11), %r12
	movq	%r15, %rcx
	cmpq	%r14, %rax
	movl	$0, %eax
	movups	%xmm0, 128(%rsp)
	movdqu	.LC26(%rip), %xmm0
	sbbq	%r15, %rax
	movups	%xmm0, 144(%rsp)
	movdqu	.LC27(%rip), %xmm0
	movups	%xmm0, 160(%rsp)
	movdqu	.LC28(%rip), %xmm0
	movups	%xmm0, 176(%rsp)
	movdqu	.LC29(%rip), %xmm0
	movups	%xmm0, 192(%rsp)
	movdqu	.LC30(%rip), %xmm0
	movups	%xmm0, 208(%rsp)
	movdqu	.LC31(%rip), %xmm0
	movups	%xmm0, 224(%rsp)
	movdqu	.LC32(%rip), %xmm0
	movups	%xmm0, 240(%rsp)
	movdqu	.LC33(%rip), %xmm0
	movups	%xmm0, 256(%rsp)
	movdqu	.LC34(%rip), %xmm0
	movups	%xmm0, 272(%rsp)
	movdqu	.LC35(%rip), %xmm0
	movups	%xmm0, 288(%rsp)
	movdqu	.LC36(%rip), %xmm0
	movups	%xmm0, 304(%rsp)
	movdqu	.LC37(%rip), %xmm0
	movups	%xmm0, 313(%rsp)
	jnc	.L2634
	movq	%rbx, 424(%rsp)
	movq	%r10, %r13
	leal	-1(%rdi), %r15d
	movq	%r14, %r10
	movq	%r11, 48(%rsp)
	movq	%rcx, %r11
	.p2align 4
	.p2align 3
.L2635:
	movq	%r10, %rax
	movq	%r10, %r8
	xorl	%ebx, %ebx
	movq	%r11, %r9
	movabsq	$1152921504606846975, %rsi
	shrdq	$60, %r11, %rax
	movabsq	$1152921504606846975, %rcx
	andq	%rsi, %rax
	andq	%r10, %rcx
	addq	%rax, %rcx
	movq	%r11, %rax
	shrq	$56, %rax
	addq	%rax, %rcx
	movabsq	$5165088340638674453, %rax
	mulq	%rcx
	movq	%rcx, %rax
	subq	%rdx, %rax
	shrq	%rax
	addq	%rax, %rdx
	shrq	$4, %rdx
	leaq	(%rdx,%rdx,4), %rax
	movabsq	$-8116567392432202711, %rdx
	leaq	(%rax,%rax,4), %rax
	subq	%rax, %rcx
	movabsq	$2951479051793528258, %rax
	subq	%rcx, %r8
	sbbq	%rbx, %r9
	imulq	%r8, %rax
	imulq	%r9, %rdx
	leaq	(%rdx,%rax), %rsi
	movabsq	$-8116567392432202711, %rax
	mulq	%r8
	movq	%rax, %r8
	leaq	(%rsi,%rdx), %rax
	movl	$25, %esi
	movq	%rax, %r9
	movq	%r8, %rax
	andl	$3, %eax
	mulq	%rsi
	movq	%r11, %rdx
	movq	%r9, %r11
	addq	%rcx, %rax
	movq	%r10, %rcx
	movq	%r8, %r10
	movl	%r15d, %r8d
	addq	%rax, %rax
	shrdq	$2, %r9, %r10
	movzbl	129(%rsp,%rax), %r9d
	shrq	$2, %r11
	movzbl	128(%rsp,%rax), %eax
	movb	%r9b, (%r12,%r8)
	leal	-1(%r15), %r8d
	subl	$2, %r15d
	movb	%al, (%r12,%r8)
	movl	$9999, %eax
	cmpq	%rcx, %rax
	movl	$0, %eax
	sbbq	%rdx, %rax
	jc	.L2635
	movq	%r11, %r15
	movq	424(%rsp), %rbx
	movq	48(%rsp), %r11
	movq	%r10, %r14
	movq	%r13, %r10
.L2634:
	movl	$9, %eax
	leal	48(%r14), %r8d
	cmpq	%r14, %rax
	movl	$0, %eax
	sbbq	%r15, %rax
	jnc	.L2637
	movq	%r14, %r8
	addq	%r14, %r8
	movzbl	129(%rsp,%r8), %edx
	movzbl	128(%rsp,%r8), %r8d
	movb	%dl, 1(%r12)
.L2637:
	movb	%r8b, (%r12)
	movq	(%r11), %rax
	leaq	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE7_M_bumpEy(%rip), %rdx
	movq	16(%rax), %rax
	cmpq	%rdx, %rax
	je	.L2874
	leaq	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE7_M_bumpEy(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2875
	leaq	_ZNSt8__format5_SinkIcE7_M_bumpEy(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2876
	movq	%r10, %rdx
	movq	%r11, %rcx
	call	*%rax
	jmp	.L2639
	.p2align 4,,10
	.p2align 3
.L2838:
	addq	%rdi, 24(%r10)
	jmp	.L2639
	.p2align 4,,10
	.p2align 3
.L2835:
	call	_ZNSt8__format5_SinkIcE10_M_reserveEy
	movq	%rax, %r10
	jmp	.L2593
	.p2align 4,,10
	.p2align 3
.L2837:
	movq	24(%r10), %r11
	movq	296(%r10), %rax
	subq	8(%r10), %r11
	addq	%rdi, %r11
	cmpq	%r11, %rax
	jb	.L2813
.L2598:
	cmpq	%rax, %r11
	jnb	.L2603
.L2761:
	movq	288(%r10), %rax
	movb	$0, (%rax,%r11)
	movq	%r11, 296(%r10)
.L2603:
	leaq	32(%r10), %rax
	movq	$256, 16(%r10)
	movq	%rax, 8(%r10)
	movq	%rax, 24(%r10)
	jmp	.L2639
	.p2align 4,,10
	.p2align 3
.L2815:
	movq	24(%r10), %r11
	movq	296(%r10), %rax
	subq	8(%r10), %r11
	addq	%rdx, %r11
	cmpq	%r11, %rax
	jnb	.L2598
.L2813:
	movabsq	$9223372036854775806, %rdx
	movq	%r11, %rsi
	subq	%rax, %rsi
	subq	%rax, %rdx
	movq	%rsi, %rdi
	cmpq	%rsi, %rdx
	jb	.L2483
	movq	288(%r10), %rdx
	leaq	304(%r10), %rcx
	cmpq	%rcx, %rdx
	je	.L2664
	movq	304(%r10), %rcx
.L2599:
	cmpq	%r11, %rcx
	jb	.L2877
.L2600:
	leaq	(%rdx,%rax), %rcx
	cmpq	$1, %rdi
	je	.L2878
	movq	%rdi, %r8
	xorl	%edx, %edx
	movq	%r10, 72(%rsp)
	movq	%r11, 48(%rsp)
	call	memset
	movq	72(%rsp), %r10
	movq	48(%rsp), %r11
	jmp	.L2761
	.p2align 4,,10
	.p2align 3
.L2456:
	leaq	(%rcx,%rdx), %r11
	subl	$1, %r8d
	movdqu	-64(%r11), %xmm0
	movups	%xmm0, -64(%rax,%rdx)
	movdqu	-48(%r11), %xmm0
	movups	%xmm0, -48(%rax,%rdx)
	movdqu	-32(%r11), %xmm0
	movups	%xmm0, -32(%rax,%rdx)
	movdqu	-16(%r11), %xmm0
	movups	%xmm0, -16(%rax,%rdx)
	cmpl	$64, %r8d
	jb	.L2457
	andl	$-64, %r8d
	xorl	%r11d, %r11d
.L2463:
	movl	%r11d, %r9d
	addl	$64, %r11d
	movdqu	(%rcx,%r9), %xmm3
	movdqu	16(%rcx,%r9), %xmm2
	movdqu	32(%rcx,%r9), %xmm1
	movdqu	48(%rcx,%r9), %xmm0
	movups	%xmm3, (%rax,%r9)
	movups	%xmm2, 16(%rax,%r9)
	movups	%xmm1, 32(%rax,%r9)
	movups	%xmm0, 48(%rax,%r9)
	cmpl	%r8d, %r11d
	jb	.L2463
	jmp	.L2457
	.p2align 4,,10
	.p2align 3
.L2859:
	call	_ZNSt8__format5_SinkIcE10_M_reserveEy
	movq	48(%rsp), %rdx
	movl	72(%rsp), %r9d
	movl	80(%rsp), %r8d
	movl	92(%rsp), %r11d
	movq	%rax, %r10
	jmp	.L2497
	.p2align 4,,10
	.p2align 3
.L2860:
	call	_ZNSt8__format5_SinkIcE10_M_reserveEy
	movq	48(%rsp), %rdx
	movl	72(%rsp), %r8d
	movq	416(%rsp), %r9
	movq	%rax, %r10
	jmp	.L2454
	.p2align 4,,10
	.p2align 3
.L2842:
	call	_ZNSt8__format5_SinkIcE10_M_reserveEy
	movq	48(%rsp), %r8
	movq	%rax, %r13
	jmp	.L2611
	.p2align 4,,10
	.p2align 3
.L2849:
	call	_ZNSt8__format5_SinkIcE10_M_reserveEy
	movq	48(%rsp), %r9
	movl	72(%rsp), %r8d
	movq	%rax, %r10
	jmp	.L2563
	.p2align 4,,10
	.p2align 3
.L2856:
	call	_ZNSt8__format5_SinkIcE10_M_reserveEy
	movq	48(%rsp), %rdx
	movl	72(%rsp), %r9d
	movl	80(%rsp), %r8d
	movq	%rax, %r10
	jmp	.L2519
	.p2align 4,,10
	.p2align 3
.L2852:
	call	_ZNSt8__format5_SinkIcE10_M_reserveEy
	movl	48(%rsp), %r8d
	movq	72(%rsp), %r9
	movq	80(%rsp), %r11
	movq	%rax, %r10
	jmp	.L2541
	.p2align 4,,10
	.p2align 3
.L2873:
	call	_ZNSt8__format5_SinkIcE10_M_reserveEy
	movq	48(%rsp), %r10
	movq	%rax, %r11
	jmp	.L2633
	.p2align 4,,10
	.p2align 3
.L2866:
	call	_ZNSt8__format5_SinkIcE10_M_reserveEy
	movq	416(%rsp), %r9
	movq	%rax, %r10
	jmp	.L2478
	.p2align 4,,10
	.p2align 3
.L2853:
	leal	2(%r9), %edx
	movq	%rdx, %r9
	jmp	.L2513
	.p2align 4,,10
	.p2align 3
.L2870:
	leal	2(%rdi), %r10d
	movq	424(%rsp), %rbx
	movl	%r10d, %edi
	jmp	.L2627
	.p2align 4,,10
	.p2align 3
.L2857:
	addl	$2, %r9d
	jmp	.L2491
	.p2align 4,,10
	.p2align 3
.L2846:
	leal	2(%r8), %edi
	movq	%rdi, %r8
	jmp	.L2557
	.p2align 4,,10
	.p2align 3
.L2850:
	addl	$2, %r8d
	jmp	.L2535
	.p2align 4,,10
	.p2align 3
.L2839:
	movq	424(%rsp), %rbx
	addl	$2, %edi
	jmp	.L2605
	.p2align 4,,10
	.p2align 3
.L2840:
	movq	424(%rsp), %rbx
	addl	$3, %edi
	jmp	.L2605
	.p2align 4,,10
	.p2align 3
.L2871:
	leal	3(%rdi), %r10d
	movq	424(%rsp), %rbx
	movl	%r10d, %edi
	jmp	.L2627
	.p2align 4,,10
	.p2align 3
.L2858:
	addl	$3, %r9d
	jmp	.L2491
	.p2align 4,,10
	.p2align 3
.L2847:
	leal	3(%r8), %edi
	movq	%rdi, %r8
	jmp	.L2557
	.p2align 4,,10
	.p2align 3
.L2851:
	addl	$3, %r8d
	jmp	.L2535
	.p2align 4,,10
	.p2align 3
.L2854:
	leal	3(%r9), %edx
	movq	%rdx, %r9
	jmp	.L2513
	.p2align 4,,10
	.p2align 3
.L2848:
	movl	%r8d, %edi
	jmp	.L2557
	.p2align 4,,10
	.p2align 3
.L2855:
	movl	%r9d, %edx
	jmp	.L2513
	.p2align 4,,10
	.p2align 3
.L2872:
	movq	424(%rsp), %rbx
	movl	%edi, %r10d
	jmp	.L2627
	.p2align 4,,10
	.p2align 3
.L2841:
	movq	424(%rsp), %rbx
	jmp	.L2605
.L2867:
	addq	$1, 24(%r10)
	jmp	.L2639
.L2836:
	movq	344(%r10), %rax
	movq	328(%r10), %rdx
	cmpq	%rdx, %rax
	jnb	.L2639
	movq	320(%r10), %rcx
	addq	%rdi, 24(%r10)
	cmpq	%rcx, %rax
	jb	.L2678
	cmpq	$-1, %rdx
	je	.L2639
.L2678:
	addq	%rdi, %rax
	jmp	.L2772
.L2845:
	addq	%r8, 24(%r13)
	jmp	.L2639
.L2876:
	addq	%r10, 24(%r11)
	jmp	.L2639
.L2868:
	movq	24(%r10), %r11
	movq	296(%r10), %rax
	subq	8(%r10), %r11
	movq	%r11, %rdi
	addq	$1, %r11
	cmpq	%r11, %rax
	jb	.L2879
	cmpq	%rax, %r11
	jnb	.L2603
.L2755:
	movq	288(%r10), %rax
	movb	$0, 1(%rax,%rdi)
	movq	%r11, 296(%r10)
	jmp	.L2603
.L2844:
	movq	24(%r13), %r10
	movq	296(%r13), %rax
	subq	8(%r13), %r10
	addq	%r8, %r10
	cmpq	%r10, %rax
	jb	.L2880
	cmpq	%rax, %r10
	jnb	.L2625
.L2762:
	movq	288(%r13), %rax
	movb	$0, (%rax,%r10)
	movq	%r10, 296(%r13)
.L2625:
	leaq	32(%r13), %rax
	movq	$256, 16(%r13)
	movq	%rax, 8(%r13)
	movq	%rax, 24(%r13)
	jmp	.L2639
.L2875:
	movq	24(%r11), %rax
	subq	8(%r11), %rax
	addq	%rax, %r10
	movq	296(%r11), %rax
	cmpq	%r10, %rax
	jb	.L2881
	cmpq	%rax, %r10
	jnb	.L2647
.L2763:
	movq	288(%r11), %rax
	movb	$0, (%rax,%r10)
	movq	%r10, 296(%r11)
.L2647:
	leaq	32(%r11), %rax
	movq	$256, 16(%r11)
	movq	%rax, 8(%r11)
	movq	%rax, 24(%r11)
	jmp	.L2639
.L2869:
	movq	344(%r10), %rax
	movq	328(%r10), %rdx
	cmpq	%rdx, %rax
	jnb	.L2639
	movq	320(%r10), %rcx
	addq	$1, 24(%r10)
	cmpq	%rcx, %rax
	jb	.L2672
	cmpq	$-1, %rdx
	je	.L2639
.L2672:
	addq	$1, %rax
	jmp	.L2772
.L2878:
	movb	$0, (%rcx)
	jmp	.L2761
.L2877:
	movq	%rdi, 32(%rsp)
	movq	%rax, %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	leaq	288(%r10), %rcx
	movq	%r11, 80(%rsp)
	movq	%r10, 72(%rsp)
	movq	%rax, 48(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	movq	72(%rsp), %r10
	movq	80(%rsp), %r11
	movq	48(%rsp), %rax
	movq	288(%r10), %rdx
	jmp	.L2600
.L2843:
	movq	344(%r13), %rdx
	movq	328(%r13), %rax
	cmpq	%rax, %rdx
	jnb	.L2639
	addq	%r8, 24(%r13)
	movq	320(%r13), %rcx
	cmpq	$-1, %rax
	jne	.L2679
	cmpq	%rcx, %rdx
	jnb	.L2639
.L2679:
	addq	%r8, %rdx
	cmpq	%rcx, %rax
	cmova	%rcx, %rax
	movq	%rdx, 344(%r13)
	cmpq	%rax, %rdx
	jb	.L2639
	movq	%r13, %rcx
	call	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE15_M_force_updateEv
	jmp	.L2639
.L2874:
	movq	344(%r11), %rax
	movq	328(%r11), %rdx
	cmpq	%rdx, %rax
	jnb	.L2639
	movq	320(%r11), %rcx
	addq	%r10, 24(%r11)
	cmpq	%rcx, %rax
	jb	.L2680
	cmpq	$-1, %rdx
	je	.L2639
.L2680:
	addq	%r10, %rax
	cmpq	%rcx, %rdx
	cmova	%rcx, %rdx
	movq	%rax, 344(%r11)
	cmpq	%rdx, %rax
	jb	.L2639
	movq	%r11, %rcx
	call	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE15_M_force_updateEv
	jmp	.L2639
.L2879:
	movabsq	$9223372036854775806, %rdx
	movq	%r11, %rsi
	subq	%rax, %rsi
	subq	%rax, %rdx
	cmpq	%rsi, %rdx
	jb	.L2483
	movq	288(%r10), %rdx
	leaq	304(%r10), %rcx
	cmpq	%rcx, %rdx
	je	.L2650
	movq	304(%r10), %rcx
.L2484:
	cmpq	%r11, %rcx
	jb	.L2882
.L2485:
	leaq	(%rdx,%rax), %rcx
	cmpq	$1, %rsi
	je	.L2883
	movq	%rsi, %r8
	xorl	%edx, %edx
	movq	%r10, 72(%rsp)
	movq	%r11, 48(%rsp)
	call	memset
	movq	72(%rsp), %r10
	movq	48(%rsp), %r11
	jmp	.L2755
.L2664:
	movl	$15, %ecx
	jmp	.L2599
.L2880:
	movabsq	$9223372036854775806, %rdx
	movq	%r10, %r11
	subq	%rax, %r11
	subq	%rax, %rdx
	cmpq	%r11, %rdx
	jb	.L2483
	movq	288(%r13), %rdx
	leaq	304(%r13), %rcx
	cmpq	%rcx, %rdx
	je	.L2667
	movq	304(%r13), %rcx
.L2621:
	cmpq	%r10, %rcx
	jb	.L2884
.L2622:
	leaq	(%rdx,%rax), %rcx
	cmpq	$1, %r11
	je	.L2885
	movq	%r11, %r8
	xorl	%edx, %edx
	movq	%r10, 48(%rsp)
	call	memset
	movq	48(%rsp), %r10
	jmp	.L2762
.L2881:
	movabsq	$9223372036854775806, %rdx
	movq	%r10, %rsi
	subq	%rax, %rsi
	subq	%rax, %rdx
	movq	%rsi, %rdi
	cmpq	%rsi, %rdx
	jb	.L2483
	movq	288(%r11), %rdx
	leaq	304(%r11), %rcx
	cmpq	%rcx, %rdx
	je	.L2670
	movq	304(%r11), %rcx
.L2643:
	cmpq	%r10, %rcx
	jb	.L2886
.L2644:
	leaq	(%rdx,%rax), %rcx
	cmpq	$1, %rdi
	je	.L2887
	movq	%rdi, %r8
	xorl	%edx, %edx
	movq	%r11, 72(%rsp)
	movq	%r10, 48(%rsp)
	call	memset
	movq	72(%rsp), %r11
	movq	48(%rsp), %r10
	jmp	.L2763
.L2665:
	movl	$1, %edi
	jmp	.L2605
.L2660:
	movl	$1, %edi
	movl	$1, %r8d
	jmp	.L2557
.L2668:
	movl	$1, %r10d
	movl	$1, %edi
	jmp	.L2627
.L2654:
	movl	$1, %edx
	movl	$1, %r9d
	jmp	.L2513
.L2657:
	movl	$1, %r8d
	jmp	.L2535
.L2651:
	movl	$1, %r9d
	jmp	.L2491
.L2861:
	movdqu	(%rcx), %xmm0
	movups	%xmm0, (%rax)
	movdqu	16(%rcx), %xmm0
	leaq	32(%rcx,%rdx), %rcx
	movups	%xmm0, 16(%rax)
	movdqu	-64(%rcx), %xmm0
	movups	%xmm0, -32(%rax,%rdx)
	movdqu	-48(%rcx), %xmm0
	movups	%xmm0, -16(%rax,%rdx)
	jmp	.L2457
.L2862:
	movdqu	(%rcx), %xmm0
	movups	%xmm0, (%rax)
	movdqu	-16(%rcx,%rdx), %xmm0
	movups	%xmm0, -16(%rax,%rdx)
	jmp	.L2457
.L2863:
	movq	(%rcx), %r8
	movq	%r8, (%rax)
	movq	-8(%rcx,%rdx), %rcx
	movq	%rcx, -8(%rax,%rdx)
	jmp	.L2457
.L2864:
	movl	(%rcx), %r8d
	movl	%r8d, (%rax)
	movl	-4(%rcx,%rdx), %ecx
	movl	%ecx, -4(%rax,%rdx)
	jmp	.L2457
.L2883:
	movb	$0, (%rcx)
	jmp	.L2755
.L2882:
	movq	%rsi, 32(%rsp)
	movq	%rax, %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	leaq	288(%r10), %rcx
	movq	%r11, 80(%rsp)
	movq	%r10, 72(%rsp)
	movq	%rax, 48(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	movq	72(%rsp), %r10
	movq	80(%rsp), %r11
	movq	48(%rsp), %rax
	movq	288(%r10), %rdx
	jmp	.L2485
.L2884:
	movq	%r11, 32(%rsp)
	movq	%rax, %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	leaq	288(%r13), %rcx
	movq	%r10, 80(%rsp)
	movq	%r11, 72(%rsp)
	movq	%rax, 48(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	movq	80(%rsp), %r10
	movq	72(%rsp), %r11
	movq	288(%r13), %rdx
	movq	48(%rsp), %rax
	jmp	.L2622
.L2885:
	movb	$0, (%rcx)
	jmp	.L2762
.L2886:
	movq	%rdi, 32(%rsp)
	movq	%rax, %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	leaq	288(%r11), %rcx
	movq	%r10, 80(%rsp)
	movq	%r11, 72(%rsp)
	movq	%rax, 48(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	movq	72(%rsp), %r11
	movq	80(%rsp), %r10
	movq	48(%rsp), %rax
	movq	288(%r11), %rdx
	jmp	.L2644
.L2887:
	movb	$0, (%rcx)
	jmp	.L2763
.L2865:
	movzwl	-2(%rcx,%rdx), %ecx
	movw	%cx, -2(%rax,%rdx)
	jmp	.L2457
.L2650:
	movl	$15, %ecx
	jmp	.L2484
.L2667:
	movl	$15, %ecx
	jmp	.L2621
.L2670:
	movl	$15, %ecx
	jmp	.L2643
.L2483:
	leaq	.LC10(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZNSt8__format18__write_escape_seqINS_10_Sink_iterIcEEcEET_S3_jSt17basic_string_viewIT0_St11char_traitsIS5_EE,"x"
	.linkonce discard
	.p2align 4
	.globl	_ZNSt8__format18__write_escape_seqINS_10_Sink_iterIcEEcEET_S3_jSt17basic_string_viewIT0_St11char_traitsIS5_EE
	.def	_ZNSt8__format18__write_escape_seqINS_10_Sink_iterIcEEcEET_S3_jSt17basic_string_viewIT0_St11char_traitsIS5_EE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format18__write_escape_seqINS_10_Sink_iterIcEEcEET_S3_jSt17basic_string_viewIT0_St11char_traitsIS5_EE
_ZNSt8__format18__write_escape_seqINS_10_Sink_iterIcEEcEET_S3_jSt17basic_string_viewIT0_St11char_traitsIS5_EE:
.LFB8258:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$112, %rsp
	.seh_stackalloc	112
	.seh_endprologue
	movq	(%r8), %r10
	movq	8(%r8), %r11
	movl	%edx, %eax
	movq	%rcx, %rbx
	testl	%eax, %eax
	jne	.L2889
	movl	$1, %eax
	leaq	88(%rsp), %rdx
	movb	$48, 88(%rsp)
	movq	%rax, %rsi
	movq	%rdx, %rdi
	testq	%r10, %r10
	jne	.L2924
.L2895:
	movq	24(%rbx), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, 24(%rbx)
	movb	$123, (%rax)
	movq	8(%rbx), %r9
	movq	24(%rbx), %r8
	subq	%r9, %r8
	cmpq	16(%rbx), %r8
	je	.L2925
.L2896:
	movq	%rsi, 48(%rsp)
	leaq	64(%rsp), %rdx
	movq	%rbx, %rcx
	movq	%rdi, 56(%rsp)
	movdqu	48(%rsp), %xmm1
	movups	%xmm1, 64(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	movq	24(%rbx), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, 24(%rbx)
	movb	$125, (%rax)
	movq	8(%rbx), %r9
	movq	24(%rbx), %r8
	subq	%r9, %r8
	cmpq	16(%rbx), %r8
	je	.L2926
.L2904:
	movq	%rbx, %rax
	addq	$112, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L2889:
	movdqu	.LC38(%rip), %xmm0
	bsrl	%eax, %edx
	leal	4(%rdx), %r9d
	shrl	$2, %r9d
	movups	%xmm0, 96(%rsp)
	cmpl	$255, %eax
	jbe	.L2891
	leal	-1(%r9), %edx
	.p2align 6
	.p2align 4
	.p2align 3
.L2892:
	movl	%eax, %r8d
	movl	%edx, %ecx
	andl	$15, %r8d
	movzbl	96(%rsp,%r8), %r8d
	movb	%r8b, 88(%rsp,%rcx)
	movl	%eax, %ecx
	leal	-1(%rdx), %r8d
	shrl	$8, %eax
	shrl	$4, %ecx
	subl	$2, %edx
	andl	$15, %ecx
	movzbl	96(%rsp,%rcx), %ecx
	movb	%cl, 88(%rsp,%r8)
	cmpl	$255, %eax
	ja	.L2892
.L2891:
	cmpl	$15, %eax
	jbe	.L2893
	movl	%eax, %edx
	shrl	$4, %eax
	andl	$15, %edx
	movzbl	96(%rsp,%rdx), %edx
	movb	%dl, 89(%rsp)
	movzbl	96(%rsp,%rax), %eax
.L2894:
	movb	%al, 88(%rsp)
	leaq	88(%rsp), %rdx
	movl	%r9d, %eax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	testq	%r10, %r10
	je	.L2895
.L2924:
	leaq	64(%rsp), %rdx
	movq	%rbx, %rcx
	movq	%r10, 64(%rsp)
	movq	%r11, 72(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	jmp	.L2895
	.p2align 4,,10
	.p2align 3
.L2893:
	movzbl	96(%rsp,%rax), %eax
	jmp	.L2894
	.p2align 4,,10
	.p2align 3
.L2926:
	movq	(%rbx), %rax
	leaq	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE11_M_overflowEv(%rip), %rdx
	movq	(%rax), %rax
	cmpq	%rdx, %rax
	je	.L2927
	leaq	_ZNSt8__format14_Fixedbuf_sinkIcE11_M_overflowEv(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2928
	movq	%rbx, %rcx
	call	*%rax
	jmp	.L2904
	.p2align 4,,10
	.p2align 3
.L2925:
	movq	(%rbx), %rax
	leaq	_ZNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEE11_M_overflowEv(%rip), %rdx
	movq	(%rax), %rax
	cmpq	%rdx, %rax
	je	.L2929
	leaq	_ZNSt8__format14_Fixedbuf_sinkIcE11_M_overflowEv(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L2930
	movq	%rbx, %rcx
	call	*%rax
	jmp	.L2896
.L2928:
	movq	%r9, 24(%rbx)
	jmp	.L2904
.L2930:
	movq	%r9, 24(%rbx)
	jmp	.L2896
.L2927:
	testq	%r8, %r8
	je	.L2904
	movq	296(%rbx), %rdx
	movabsq	$9223372036854775806, %rax
	subq	%rdx, %rax
	cmpq	%r8, %rax
	jb	.L2906
	movq	288(%rbx), %rax
	leaq	304(%rbx), %rcx
	cmpq	%rcx, %rax
	je	.L2913
	movq	304(%rbx), %rcx
.L2907:
	leaq	(%r8,%rdx), %r10
	cmpq	%r10, %rcx
	jb	.L2908
	leaq	(%rax,%rdx), %rcx
	cmpq	$1, %r8
	je	.L2931
	movq	%r9, %rdx
	movq	%r10, 48(%rsp)
	call	memcpy
	movq	48(%rsp), %r10
.L2910:
	movq	288(%rbx), %rax
	movb	$0, (%rax,%r10)
	movq	8(%rbx), %rax
	movq	%r10, 296(%rbx)
	movq	%rax, 24(%rbx)
	jmp	.L2904
.L2929:
	testq	%r8, %r8
	je	.L2896
	movq	296(%rbx), %rdx
	movabsq	$9223372036854775806, %rax
	subq	%rdx, %rax
	cmpq	%r8, %rax
	jb	.L2906
	movq	288(%rbx), %rax
	leaq	304(%rbx), %rcx
	cmpq	%rcx, %rax
	je	.L2912
	movq	304(%rbx), %rcx
.L2899:
	leaq	(%r8,%rdx), %r10
	cmpq	%r10, %rcx
	jb	.L2900
	leaq	(%rax,%rdx), %rcx
	cmpq	$1, %r8
	je	.L2932
	movq	%r9, %rdx
	movq	%r10, 48(%rsp)
	call	memcpy
	movq	48(%rsp), %r10
.L2902:
	movq	288(%rbx), %rax
	movb	$0, (%rax,%r10)
	movq	8(%rbx), %rax
	movq	%r10, 296(%rbx)
	movq	%rax, 24(%rbx)
	jmp	.L2896
.L2908:
	movq	%r8, 32(%rsp)
	leaq	288(%rbx), %rcx
	xorl	%r8d, %r8d
	movq	%r10, 48(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	movq	48(%rsp), %r10
	jmp	.L2910
.L2900:
	movq	%r8, 32(%rsp)
	leaq	288(%rbx), %rcx
	xorl	%r8d, %r8d
	movq	%r10, 48(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
	movq	48(%rsp), %r10
	jmp	.L2902
.L2912:
	movl	$15, %ecx
	jmp	.L2899
.L2913:
	movl	$15, %ecx
	jmp	.L2907
.L2931:
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	jmp	.L2910
.L2932:
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	jmp	.L2902
.L2906:
	leaq	.LC9(%rip), %rcx
	call	_ZSt20__throw_length_errorPKc
	nop
	.seh_endproc
	.section .rdata,"dr"
.LC39:
	.ascii "\357\277\275\0"
.LC40:
	.ascii "\11\\t\12\\n\15\\r\\\\\\\"\\\"'\\'\\u\\x\0"
	.section	.text$_ZNSt8__format28__write_escaped_unicode_partIcNS_10_Sink_iterIcEEEET0_S3_RSt17basic_string_viewIT_St11char_traitsIS5_EERbNS_10_Term_charE,"x"
	.linkonce discard
	.p2align 4
	.globl	_ZNSt8__format28__write_escaped_unicode_partIcNS_10_Sink_iterIcEEEET0_S3_RSt17basic_string_viewIT_St11char_traitsIS5_EERbNS_10_Term_charE
	.def	_ZNSt8__format28__write_escaped_unicode_partIcNS_10_Sink_iterIcEEEET0_S3_RSt17basic_string_viewIT_St11char_traitsIS5_EERbNS_10_Term_charE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format28__write_escaped_unicode_partIcNS_10_Sink_iterIcEEEET0_S3_RSt17basic_string_viewIT_St11char_traitsIS5_EERbNS_10_Term_charE
_ZNSt8__format28__write_escaped_unicode_partIcNS_10_Sink_iterIcEEEET0_S3_RSt17basic_string_viewIT_St11char_traitsIS5_EERbNS_10_Term_charE:
.LFB8148:
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
	subq	$120, %rsp
	.seh_stackalloc	120
	.seh_endprologue
	movq	8(%rdx), %rax
	movq	(%rdx), %r12
	movq	%rax, %xmm1
	addq	%rax, %r12
	movddup	%xmm1, %xmm0
	movq	$0, (%rdx)
	movq	%rdx, %rsi
	movq	%r8, %rbp
	movq	%rcx, %rdi
	movq	$0, 8(%rdx)
	xorl	%edx, %edx
	movb	%r9b, 216(%rsp)
	movq	%r12, 64(%rsp)
	movw	%dx, 76(%rsp)
	movb	$0, 78(%rsp)
	movups	%xmm0, 48(%rsp)
	cmpq	%r12, %rax
	je	.L2998
	leaq	48(%rsp), %rcx
	call	_ZNSt9__unicode13_Utf_iteratorIcDiPKcS2_NS_5_ReplEE12_M_read_utf8Ev.isra.0
	movq	56(%rsp), %r15
	cmpb	$0, 76(%rsp)
	sete	%dl
	cmpq	%r15, %r12
	sete	%al
	testb	%al, %dl
	jne	.L2998
	movq	%rsi, 200(%rsp)
.L2935:
	movdqu	48(%rsp), %xmm0
	movups	%xmm0, 80(%rsp)
	movdqu	64(%rsp), %xmm0
	movq	88(%rsp), %rbx
	movups	%xmm0, 96(%rsp)
	movzbl	108(%rsp), %esi
	testb	%sil, %sil
	sete	%r14b
	cmpq	%rbx, %r12
	sete	%al
	andb	%al, %r14b
	jne	.L2936
.L2986:
	movzbl	%sil, %eax
	movl	104(%rsp,%rax,4), %ecx
	cmpl	$127, %ecx
	ja	.L2937
.L3018:
	movzbl	(%rbx), %eax
	cmpb	$34, %al
	je	.L2938
	jle	.L3016
	cmpb	$2, 216(%rsp)
	sete	%dl
	cmpb	$39, %al
	jne	.L3017
.L2945:
	testb	%dl, %dl
	jne	.L2992
.L2946:
	movzbl	%sil, %eax
	movzbl	109(%rsp), %edx
	movb	$0, 0(%rbp)
	addl	$1, %eax
	cmpl	%edx, %eax
	jge	.L2956
	addl	$1, %esi
	movq	88(%rsp), %rbx
	movzbl	%sil, %eax
	movb	%sil, 108(%rsp)
	movl	104(%rsp,%rax,4), %ecx
	cmpl	$127, %ecx
	jbe	.L3018
.L2937:
	leal	2(%rcx,%rcx), %r9d
	leaq	_ZNSt9__unicode9__v16_0_014__escape_edgesE(%rip), %r8
	movl	$1483, %eax
	jmp	.L2948
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L3020:
	subq	%rdx, %rax
	leaq	4(%r8,%rdx,4), %r8
	subq	$1, %rax
	testq	%rax, %rax
	jle	.L3019
.L2948:
	movq	%rax, %rdx
	sarq	%rdx
	cmpl	%r9d, (%r8,%rdx,4)
	jb	.L3020
	movq	%rdx, %rax
	testq	%rax, %rax
	jg	.L2948
.L3019:
	movl	-4(%r8), %r13d
	andl	$1, %r13d
	jne	.L2944
	movzbl	0(%rbp), %r10d
	testb	%r10b, %r10b
	je	.L2949
	movl	%ecx, %r9d
	leaq	_ZNSt9__unicode9__v16_0_011__gcb_edgesE(%rip), %r8
	movl	$1734, %eax
	sall	$4, %r9d
	orl	$15, %r9d
	jmp	.L2951
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L3022:
	subq	%rdx, %rax
	leaq	4(%r8,%rdx,4), %r8
	subq	$1, %rax
	testq	%rax, %rax
	jle	.L3021
.L2951:
	movq	%rax, %rdx
	sarq	%rdx
	cmpl	%r9d, (%r8,%rdx,4)
	jb	.L3022
	movq	%rdx, %rax
	testq	%rax, %rax
	jg	.L2951
.L3021:
	movl	-4(%r8), %eax
	andl	$15, %eax
	cmpl	$4, %eax
	je	.L2991
.L2949:
	cmpl	$65533, %ecx
	jne	.L2946
	cmpb	$3, 110(%rsp)
	je	.L3023
.L2952:
	xorl	%r14d, %r14d
	.p2align 4
	.p2align 3
.L2944:
	cmpq	%rbx, %r15
	je	.L2955
	jmp	.L2987
	.p2align 4,,10
	.p2align 3
.L2956:
	movq	96(%rsp), %rax
	cmpq	%rbx, %rax
	je	.L2958
	movzbl	110(%rsp), %edx
	addq	%rdx, %rbx
	movq	%rbx, 88(%rsp)
	cmpq	%rbx, %rax
	je	.L3024
	leaq	80(%rsp), %rcx
	call	_ZNSt9__unicode13_Utf_iteratorIcDiPKcS2_NS_5_ReplEE12_M_read_utf8Ev.isra.0
	movq	88(%rsp), %rbx
	movzbl	108(%rsp), %esi
	cmpq	%rbx, %r12
	sete	%al
	testb	%sil, %sil
	sete	%dl
	andl	%edx, %eax
.L2960:
	testb	%al, %al
	je	.L2986
.L2936:
	cmpq	%rbx, %r15
	je	.L2998
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	xorl	%esi, %esi
.L2987:
	movq	%rbx, %rax
	leaq	32(%rsp), %rdx
	movq	%rdi, %rcx
	movq	%r15, 40(%rsp)
	subq	%r15, %rax
	movq	%rax, 32(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
.L2955:
	testb	%sil, %sil
	jne	.L2993
	cmpq	%rbx, %r12
	je	.L2998
.L2993:
	movdqu	80(%rsp), %xmm0
	movups	%xmm0, 48(%rsp)
	movdqu	95(%rsp), %xmm0
	movups	%xmm0, 63(%rsp)
	testb	%r14b, %r14b
	jne	.L3025
	testb	%r13b, %r13b
	jne	.L3026
	movzbl	78(%rsp), %eax
	leaq	(%rbx,%rax), %rsi
	cmpq	%r12, %rsi
	je	.L2977
	cmpq	%rbx, %rsi
	je	.L2975
	movq	%rdi, %rcx
	.p2align 4
	.p2align 3
.L2978:
	movzbl	(%rbx), %edx
	leaq	20+.LC40(%rip), %rax
	leaq	32(%rsp), %r8
	addq	$1, %rbx
	movq	$2, 32(%rsp)
	movq	%rax, 40(%rsp)
	call	_ZNSt8__format18__write_escape_seqINS_10_Sink_iterIcEEcEET_S3_jSt17basic_string_viewIT0_St11char_traitsIS5_EE
	movq	%rax, %rcx
	cmpq	%rbx, %rsi
	jne	.L2978
	movq	%rax, %rdi
.L2975:
	movzbl	76(%rsp), %eax
	movzbl	77(%rsp), %ecx
	movb	$1, 0(%rbp)
	movq	56(%rsp), %r15
	movl	%eax, %edx
	addl	$1, %eax
	cmpl	%ecx, %eax
	jge	.L2979
	addl	$1, %edx
	movb	%dl, 76(%rsp)
	jmp	.L2935
	.p2align 4,,10
	.p2align 3
.L2958:
	movzbl	108(%rsp), %esi
	movq	88(%rsp), %rbx
	testb	%sil, %sil
	sete	%al
	cmpq	%r12, %rbx
	sete	%dl
	andl	%edx, %eax
	jmp	.L2960
	.p2align 4,,10
	.p2align 3
.L2991:
	xorl	%r14d, %r14d
	movl	%r10d, %r13d
	jmp	.L2944
	.p2align 4,,10
	.p2align 3
.L3016:
	cmpb	$10, %al
	jg	.L2940
	cmpb	$8, %al
	jle	.L2942
.L2941:
	xorl	%r13d, %r13d
	movl	$1, %r14d
	jmp	.L2944
	.p2align 4,,10
	.p2align 3
.L2938:
	cmpb	$1, 216(%rsp)
	sete	%dl
	jmp	.L2945
	.p2align 4,,10
	.p2align 3
.L3017:
	cmpb	$92, %al
	je	.L2941
.L2942:
	cmpb	$31, %al
	setbe	%dl
	cmpb	$127, %al
	sete	%al
	orb	%al, %dl
	je	.L2946
.L2992:
	xorl	%r13d, %r13d
	movl	%edx, %r14d
	jmp	.L2944
	.p2align 4,,10
	.p2align 3
.L3024:
	movb	$0, 108(%rsp)
	cmpq	%rbx, %r12
	je	.L2936
	xorl	%esi, %esi
	jmp	.L2986
	.p2align 4,,10
	.p2align 3
.L2979:
	movq	64(%rsp), %rax
	cmpq	%rax, %r15
	je	.L3027
	movzbl	78(%rsp), %edx
	addq	%rdx, %r15
	movq	%r15, 56(%rsp)
	cmpq	%r15, %rax
	je	.L3028
	leaq	48(%rsp), %rcx
	call	_ZNSt9__unicode13_Utf_iteratorIcDiPKcS2_NS_5_ReplEE12_M_read_utf8Ev.isra.0
	movq	56(%rsp), %r15
	cmpb	$0, 76(%rsp)
	sete	%al
	cmpq	%r15, %r12
	sete	%dl
	andl	%edx, %eax
.L2982:
	testb	%al, %al
	je	.L2935
.L2998:
	movq	%rdi, %rax
	addq	$120, %rsp
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
.L2940:
	cmpb	$13, %al
	je	.L2941
	cmpb	$31, %al
	setbe	%dl
	cmpb	$127, %al
	sete	%al
	orb	%al, %dl
	je	.L2946
	jmp	.L2992
	.p2align 4,,10
	.p2align 3
.L3025:
	movzbl	(%rbx), %eax
	cmpb	$39, %al
	jg	.L2964
	cmpb	$8, %al
	jle	.L2965
	leal	-9(%rax), %edx
	cmpb	$30, %dl
	ja	.L2965
	leaq	.L2967(%rip), %rcx
	movzbl	%dl, %edx
	movslq	(%rcx,%rdx,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section .rdata,"dr"
	.align 4
.L2967:
	.long	.L2971-.L2967
	.long	.L2970-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2969-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2968-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2965-.L2967
	.long	.L2966-.L2967
	.section	.text$_ZNSt8__format28__write_escaped_unicode_partIcNS_10_Sink_iterIcEEEET0_S3_RSt17basic_string_viewIT_St11char_traitsIS5_EERbNS_10_Term_charE,"x"
	.linkonce discard
.L3027:
	cmpq	%r15, %r12
	sete	%al
	testb	%dl, %dl
	sete	%dl
	andl	%edx, %eax
	jmp	.L2982
.L3026:
	movzbl	%sil, %esi
	leaq	18+.LC40(%rip), %rax
	movq	%rdi, %rcx
	movl	72(%rsp,%rsi,4), %edx
	leaq	32(%rsp), %r8
	movq	%rax, 40(%rsp)
	movq	$2, 32(%rsp)
	call	_ZNSt8__format18__write_escape_seqINS_10_Sink_iterIcEEcEET_S3_jSt17basic_string_viewIT0_St11char_traitsIS5_EE
	movq	%rax, %rdi
	jmp	.L2975
.L3023:
	cmpw	$-16401, (%rbx)
	jne	.L2952
	cmpb	$-67, 2(%rbx)
	jne	.L2952
	jmp	.L2946
.L3028:
	cmpq	%r15, %r12
	movb	$0, 76(%rsp)
	sete	%al
	jmp	.L2982
.L2964:
	cmpb	$92, %al
	jne	.L2965
	leaq	10+.LC40(%rip), %rax
	leaq	32(%rsp), %rdx
	movq	%rdi, %rcx
	movq	$2, 32(%rsp)
	movq	%rax, 40(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	jmp	.L2975
.L2965:
	leaq	18+.LC40(%rip), %rcx
	movzbl	%al, %edx
	leaq	32(%rsp), %r8
	movq	$2, 32(%rsp)
	movq	%rcx, 40(%rsp)
	movq	%rdi, %rcx
	call	_ZNSt8__format18__write_escape_seqINS_10_Sink_iterIcEEcEET_S3_jSt17basic_string_viewIT0_St11char_traitsIS5_EE
	movq	%rax, %rdi
	jmp	.L2975
.L2971:
	leaq	1+.LC40(%rip), %rax
	leaq	32(%rsp), %rdx
	movq	%rdi, %rcx
	movq	$2, 32(%rsp)
	movq	%rax, 40(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	jmp	.L2975
.L2970:
	leaq	4+.LC40(%rip), %rax
	leaq	32(%rsp), %rdx
	movq	%rdi, %rcx
	movq	$2, 32(%rsp)
	movq	%rax, 40(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	jmp	.L2975
.L2969:
	leaq	7+.LC40(%rip), %rax
	leaq	32(%rsp), %rdx
	movq	%rdi, %rcx
	movq	$2, 32(%rsp)
	movq	%rax, 40(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	jmp	.L2975
.L2968:
	leaq	13+.LC40(%rip), %rax
	leaq	32(%rsp), %rdx
	movq	%rdi, %rcx
	movq	$2, 32(%rsp)
	movq	%rax, 40(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	jmp	.L2975
.L2966:
	leaq	16+.LC40(%rip), %rax
	leaq	32(%rsp), %rdx
	movq	%rdi, %rcx
	movq	$2, 32(%rsp)
	movq	%rax, 40(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	jmp	.L2975
.L2977:
	movq	200(%rsp), %rsi
	movq	%rax, (%rsi)
	movq	%rbx, 8(%rsi)
	jmp	.L2998
	.seh_endproc
	.section	.text$_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE,"x"
	.linkonce discard
	.p2align 4
	.globl	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
	.def	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE:
.LFB7867:
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
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	movdqu	(%rdx), %xmm0
	movq	%rcx, %rbx
	movl	%r8d, %esi
	cmpb	$1, %r8b
	je	.L3039
	leaq	15+.LC40(%rip), %rcx
	cmpb	$2, %r8b
	jne	.L3046
.L3030:
	leaq	48(%rsp), %rdi
	movl	$1, %eax
	movq	%rcx, 56(%rsp)
	movq	%rbx, %rcx
	movq	%rdi, %rdx
	movq	%rax, 48(%rsp)
	movups	%xmm0, 32(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	movdqu	32(%rsp), %xmm0
	movq	%rbx, %rcx
	movzbl	%sil, %r9d
	leaq	80(%rsp), %rdx
	leaq	79(%rsp), %r8
	movb	$1, 79(%rsp)
	movups	%xmm0, 80(%rsp)
	call	_ZNSt8__format28__write_escaped_unicode_partIcNS_10_Sink_iterIcEEEET0_S3_RSt17basic_string_viewIT_St11char_traitsIS5_EERbNS_10_Term_charE
	movq	88(%rsp), %rbx
	movq	80(%rsp), %rbp
	movq	%rax, %rcx
	addq	%rbx, %rbp
	cmpq	%rbx, %rbp
	je	.L3032
.L3037:
	leaq	20+.LC40(%rip), %r12
	.p2align 4
	.p2align 3
.L3033:
	movzbl	(%rbx), %edx
	movq	%rdi, %r8
	movq	%r12, 56(%rsp)
	addq	$1, %rbx
	movq	$2, 48(%rsp)
	call	_ZNSt8__format18__write_escape_seqINS_10_Sink_iterIcEEcEET_S3_jSt17basic_string_viewIT0_St11char_traitsIS5_EE
	movq	%rax, %rcx
	cmpq	%rbx, %rbp
	jne	.L3033
	cmpb	$1, %sil
	je	.L3041
	leaq	15+.LC40(%rip), %r8
	cmpb	$2, %sil
	je	.L3035
.L3042:
	movq	%rcx, %rax
	addq	$96, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L3046:
	movq	%rbx, %rcx
	leaq	80(%rsp), %rdx
	xorl	%r9d, %r9d
	movb	$1, 79(%rsp)
	leaq	79(%rsp), %r8
	movups	%xmm0, 80(%rsp)
	leaq	48(%rsp), %rdi
	call	_ZNSt8__format28__write_escaped_unicode_partIcNS_10_Sink_iterIcEEEET0_S3_RSt17basic_string_viewIT_St11char_traitsIS5_EERbNS_10_Term_charE
	movq	88(%rsp), %rbx
	movq	80(%rsp), %rbp
	movq	%rax, %rcx
	addq	%rbx, %rbp
	cmpq	%rbx, %rbp
	jne	.L3037
	jmp	.L3042
	.p2align 4,,10
	.p2align 3
.L3041:
	leaq	12+.LC40(%rip), %r8
.L3035:
	movl	$1, %eax
	movq	%rdi, %rdx
	movq	%rcx, 32(%rsp)
	movq	%rax, 48(%rsp)
	movq	%r8, 56(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	movq	32(%rsp), %rcx
	movq	%rcx, %rax
	addq	$96, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L3039:
	leaq	12+.LC40(%rip), %rcx
	jmp	.L3030
.L3032:
	leaq	12+.LC40(%rip), %r8
	cmpb	$1, %sil
	leaq	3(%r8), %rax
	cmovne	%rax, %r8
	jmp	.L3035
	.seh_endproc
	.section	.text$_ZNKSt8__format15__formatter_strIcE17_M_format_escapedINS_10_Sink_iterIcEEEET_St17basic_string_viewIcSt11char_traitsIcEERSt20basic_format_contextIS5_cE,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt8__format15__formatter_strIcE17_M_format_escapedINS_10_Sink_iterIcEEEET_St17basic_string_viewIcSt11char_traitsIcEERSt20basic_format_contextIS5_cE
	.def	_ZNKSt8__format15__formatter_strIcE17_M_format_escapedINS_10_Sink_iterIcEEEET_St17basic_string_viewIcSt11char_traitsIcEERSt20basic_format_contextIS5_cE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format15__formatter_strIcE17_M_format_escapedINS_10_Sink_iterIcEEEET_St17basic_string_viewIcSt11char_traitsIcEERSt20basic_format_contextIS5_cE
_ZNKSt8__format15__formatter_strIcE17_M_format_escapedINS_10_Sink_iterIcEEEET_St17basic_string_viewIcSt11char_traitsIcEERSt20basic_format_contextIS5_cE:
.LFB7901:
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
	subq	$448, %rsp
	.seh_stackalloc	448
	.seh_endprologue
	movzbl	16(%rcx), %eax
	movdqu	(%rdx), %xmm0
	movl	%eax, %edx
	andl	$3, %edx
	movq	%rcx, %rbx
	movups	%xmm0, 80(%rsp)
	movq	%r8, %rsi
	cmpb	$1, %dl
	je	.L3122
	cmpb	$2, %dl
	je	.L3123
.L3050:
	andl	$12, %eax
	je	.L3052
	cmpb	$4, %al
	je	.L3124
	cmpb	$8, %al
	je	.L3125
	leaq	80(%rsp), %rcx
	movq	$-1, %rdx
	xorl	%edi, %edi
	movq	$-1, %rbp
	call	_ZNSt8__format10__truncateIcEEyRSt17basic_string_viewIT_St11char_traitsIS2_EEy
.L3054:
	testb	$12, 16(%rbx)
	je	.L3052
.L3058:
	leaq	128(%rsp), %rax
	movq	16(%rsi), %rcx
	movq	.LC41(%rip), %xmm0
	movb	$0, 400(%rsp)
	movq	%rax, %xmm1
	movq	%rax, 120(%rsp)
	leaq	400(%rsp), %rsi
	punpcklqdq	%xmm1, %xmm0
	movq	%rdi, 416(%rsp)
	leaq	_ZNKSt8__format5_SinkIcE13_M_discardingEv(%rip), %rdi
	movq	$256, 112(%rsp)
	movups	%xmm0, 96(%rsp)
	movq	(%rcx), %rax
	movq	%rsi, 384(%rsp)
	movq	24(%rax), %rax
	movq	%rbp, 424(%rsp)
	movq	$0, 392(%rsp)
	movq	%rcx, 432(%rsp)
	movq	$0, 440(%rsp)
	cmpq	%rdi, %rax
	je	.L3059
	leaq	_ZNKSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE13_M_discardingEv(%rip), %rdx
	cmpq	%rdx, %rax
	je	.L3126
.LEHB45:
	call	*%rax
.LEHE45:
	testb	%al, %al
	je	.L3059
	movq	440(%rsp), %rax
.L3061:
	movq	%rax, 424(%rsp)
.L3059:
	movdqu	80(%rsp), %xmm0
	movl	$1, %r8d
	leaq	64(%rsp), %rdx
	leaq	96(%rsp), %rcx
	leaq	384(%rsp), %rbp
	movups	%xmm0, 64(%rsp)
.LEHB46:
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
	movl	4(%rbx), %r14d
	movq	104(%rsp), %rcx
	movzbl	8(%rbx), %ebx
	movq	120(%rsp), %rax
	movq	440(%rsp), %rdx
	andl	$3, %ebx
	subq	%rcx, %rax
	je	.L3064
	movq	424(%rsp), %r8
	cmpq	%r8, %rdx
	jnb	.L3127
	movq	416(%rsp), %r9
	cmpq	$-1, %r8
	jne	.L3068
	cmpq	%r9, %rdx
	jb	.L3068
	movq	432(%rsp), %r8
	movq	%rcx, 72(%rsp)
	leaq	64(%rsp), %rdx
	leaq	384(%rsp), %rbp
	movq	%rax, 64(%rsp)
	movq	%r8, %rcx
	movq	%r8, 56(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	movq	56(%rsp), %r8
	leaq	_ZNKSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE13_M_discardingEv(%rip), %rdx
	movq	(%r8), %rax
	movq	%r8, 432(%rsp)
	movq	24(%rax), %rax
	cmpq	%rdx, %rax
	je	.L3128
	cmpq	%rdi, %rax
	je	.L3120
	leaq	384(%rsp), %rbp
	movq	%r8, %rcx
	call	*%rax
	testb	%al, %al
	je	.L3120
.L3070:
	movq	440(%rsp), %rdx
	movq	%rdx, 424(%rsp)
.L3071:
	movq	104(%rsp), %rax
	movq	%rax, 120(%rsp)
	.p2align 4
	.p2align 3
.L3064:
	cmpq	416(%rsp), %rdx
	jb	.L3066
	movq	424(%rsp), %rax
	cmpq	$-1, %rax
	je	.L3067
	cmpq	%rax, %rdx
	jnb	.L3067
.L3066:
	leaq	96(%rsp), %rcx
	leaq	384(%rsp), %rbp
	call	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE15_M_force_updateEv
	testb	%al, %al
	jne	.L3073
	movq	416(%rsp), %rax
	cmpq	%rax, 440(%rsp)
	jnb	.L3067
.L3073:
	movq	104(%rsp), %r9
	movq	120(%rsp), %r8
	movq	392(%rsp), %rdx
	subq	%r9, %r8
	testq	%rdx, %rdx
	je	.L3075
	testq	%r8, %r8
	jne	.L3129
	movq	440(%rsp), %rcx
	movq	416(%rsp), %r9
	movq	%rdx, %rax
	movq	384(%rsp), %rdx
	cmpq	%r9, %rcx
	jnb	.L3086
.L3082:
	movl	%r14d, 32(%rsp)
	subq	%rcx, %r9
	movl	%ebx, %r8d
	movq	432(%rsp), %rcx
	movq	%rdx, 72(%rsp)
	andl	$3, %r8d
	leaq	64(%rsp), %rdx
	leaq	384(%rsp), %rbp
	movq	%rax, 64(%rsp)
	call	_ZNSt8__format14__write_paddedINS_10_Sink_iterIcEEcEET_S3_St17basic_string_viewIT0_St11char_traitsIS5_EENS_6_AlignEyDi
.LEHE46:
	movq	%rax, %rbx
	jmp	.L3074
	.p2align 4,,10
	.p2align 3
.L3052:
	movdqu	80(%rsp), %xmm0
	movq	16(%rsi), %rcx
	leaq	64(%rsp), %rdx
	movl	$1, %r8d
	movups	%xmm0, 64(%rsp)
.LEHB47:
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
.LEHE47:
	movq	%rax, %rbx
.L3103:
	movq	%rbx, %rax
	addq	$448, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L3127:
	movq	%rcx, 120(%rsp)
	cmpq	416(%rsp), %rdx
	jb	.L3066
.L3067:
	movq	432(%rsp), %rbx
.L3074:
	movq	384(%rsp), %rcx
	cmpq	%rsi, %rcx
	je	.L3103
	movq	400(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	jmp	.L3103
	.p2align 4,,10
	.p2align 3
.L3122:
	movzwl	(%rcx), %edi
.L3049:
	movzbl	16(%rbx), %eax
	testq	%rdi, %rdi
	je	.L3050
	andl	$12, %eax
	cmpb	$4, %al
	je	.L3130
	movq	$-1, %rbp
	cmpb	$8, %al
	je	.L3088
.L3057:
	leaq	80(%rsp), %rcx
	movq	%rbp, %rdx
	call	_ZNSt8__format10__truncateIcEEyRSt17basic_string_viewIT_St11char_traitsIS2_EEy
	cmpq	%rdi, %rax
	jb	.L3058
	jmp	.L3054
	.p2align 4,,10
	.p2align 3
.L3075:
	movq	%r9, %rdx
	movq	440(%rsp), %rcx
	movq	416(%rsp), %r9
	movq	%r8, %rax
	cmpq	%r9, %rcx
	jb	.L3082
	movq	432(%rsp), %rbx
	testq	%r8, %r8
	je	.L3074
	.p2align 4
	.p2align 3
.L3083:
	movq	%rdx, 72(%rsp)
	movq	%rbx, %rcx
	leaq	64(%rsp), %rdx
	leaq	384(%rsp), %rbp
	movq	%rax, 64(%rsp)
.LEHB48:
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
.LEHE48:
	jmp	.L3074
	.p2align 4,,10
	.p2align 3
.L3125:
	xorl	%edi, %edi
.L3088:
	movzwl	2(%rbx), %ecx
	movq	%rsi, %rdx
.LEHB49:
	call	_ZNKSt8__format5_SpecIcE16_M_get_precisionISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
	movq	%rax, %rbp
	jmp	.L3057
	.p2align 4,,10
	.p2align 3
.L3124:
	movzwl	2(%rbx), %ebp
	leaq	80(%rsp), %rcx
	xorl	%edi, %edi
	movq	%rbp, %rdx
	call	_ZNSt8__format10__truncateIcEEyRSt17basic_string_viewIT_St11char_traitsIS2_EEy
	jmp	.L3054
	.p2align 4,,10
	.p2align 3
.L3126:
	movq	328(%rcx), %rdx
	xorl	%eax, %eax
	cmpq	%rdx, 344(%rcx)
	jnb	.L3061
	jmp	.L3059
	.p2align 4,,10
	.p2align 3
.L3123:
	movzwl	(%rcx), %ecx
	movq	%r8, %rdx
	call	_ZNKSt8__format5_SpecIcE12_M_get_widthISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
.LEHE49:
	movq	%rax, %rdi
	jmp	.L3049
	.p2align 4,,10
	.p2align 3
.L3130:
	movzwl	2(%rbx), %ebp
	jmp	.L3057
	.p2align 4,,10
	.p2align 3
.L3068:
	addq	%rdx, %rax
	cmpq	%r8, %r9
	cmova	%r8, %r9
	movq	%rax, 440(%rsp)
	cmpq	%r9, %rax
	jb	.L3066
	leaq	96(%rsp), %rcx
	leaq	384(%rsp), %rbp
.LEHB50:
	call	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE15_M_force_updateEv
	movq	440(%rsp), %rdx
	jmp	.L3064
	.p2align 4,,10
	.p2align 3
.L3129:
	movabsq	$9223372036854775806, %rax
	subq	%rdx, %rax
	cmpq	%r8, %rax
	jb	.L3131
	movq	384(%rsp), %rcx
	movl	$15, %eax
	leaq	(%r8,%rdx), %rdi
	cmpq	%rsi, %rcx
	cmovne	400(%rsp), %rax
	cmpq	%rdi, %rax
	jb	.L3079
	addq	%rdx, %rcx
	cmpq	$1, %r8
	je	.L3132
	movq	%r9, %rdx
	call	memcpy
	.p2align 4
	.p2align 3
.L3121:
	movq	384(%rsp), %rax
	movb	$0, (%rax,%rdi)
	movq	104(%rsp), %rax
	movq	440(%rsp), %rcx
	movq	416(%rsp), %r9
	movq	%rdi, 392(%rsp)
	movq	%rax, 120(%rsp)
	movq	384(%rsp), %rdx
	movq	%rdi, %rax
	cmpq	%r9, %rcx
	jb	.L3082
.L3086:
	movq	432(%rsp), %rbx
	jmp	.L3083
	.p2align 4,,10
	.p2align 3
.L3079:
	movq	%r8, 32(%rsp)
	leaq	384(%rsp), %rbp
	xorl	%r8d, %r8d
	movq	%rbp, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
.LEHE50:
	jmp	.L3121
	.p2align 4,,10
	.p2align 3
.L3128:
	movq	328(%r8), %rax
	cmpq	%rax, 344(%r8)
	jnb	.L3070
	.p2align 4
	.p2align 3
.L3120:
	movq	440(%rsp), %rdx
	jmp	.L3071
.L3132:
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	jmp	.L3121
.L3095:
	movq	%rax, %rbx
	leaq	384(%rsp), %rcx
	leaq	16+_ZTVNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE(%rip), %rax
	movq	%rax, 96(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rcx
.LEHB51:
	call	_Unwind_Resume
.L3094:
	movq	%rax, %rbx
	movq	%rbp, %rcx
	leaq	16+_ZTVNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE(%rip), %rax
	movq	%rax, 96(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rcx
	call	_Unwind_Resume
.LEHE51:
.L3131:
	leaq	.LC9(%rip), %rcx
	leaq	384(%rsp), %rbp
.LEHB52:
	call	_ZSt20__throw_length_errorPKc
	nop
.LEHE52:
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA7901:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE7901-.LLSDACSB7901
.LLSDACSB7901:
	.uleb128 .LEHB45-.LFB7901
	.uleb128 .LEHE45-.LEHB45
	.uleb128 .L3095-.LFB7901
	.uleb128 0
	.uleb128 .LEHB46-.LFB7901
	.uleb128 .LEHE46-.LEHB46
	.uleb128 .L3094-.LFB7901
	.uleb128 0
	.uleb128 .LEHB47-.LFB7901
	.uleb128 .LEHE47-.LEHB47
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB48-.LFB7901
	.uleb128 .LEHE48-.LEHB48
	.uleb128 .L3094-.LFB7901
	.uleb128 0
	.uleb128 .LEHB49-.LFB7901
	.uleb128 .LEHE49-.LEHB49
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB50-.LFB7901
	.uleb128 .LEHE50-.LEHB50
	.uleb128 .L3094-.LFB7901
	.uleb128 0
	.uleb128 .LEHB51-.LFB7901
	.uleb128 .LEHE51-.LEHB51
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB52-.LFB7901
	.uleb128 .LEHE52-.LEHB52
	.uleb128 .L3094-.LFB7901
	.uleb128 0
.LLSDACSE7901:
	.section	.text$_ZNKSt8__format15__formatter_strIcE17_M_format_escapedINS_10_Sink_iterIcEEEET_St17basic_string_viewIcSt11char_traitsIcEERSt20basic_format_contextIS5_cE,"x"
	.linkonce discard
	.seh_endproc
	.section .rdata,"dr"
.LC42:
	.ascii "0b\0"
.LC43:
	.ascii "0B\0"
.LC44:
	.ascii "0X\0"
.LC45:
	.ascii "0x\0"
.LC46:
	.ascii "0\0"
	.align 8
.LC47:
	.ascii "format error: integer not representable as character\0"
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatIhNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt8__format15__formatter_intIcE6formatIhNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	.def	_ZNKSt8__format15__formatter_intIcE6formatIhNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format15__formatter_intIcE6formatIhNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
_ZNKSt8__format15__formatter_intIcE6formatIhNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_:
.LFB7693:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$320, %rsp
	.seh_stackalloc	320
	.seh_endprologue
	movzbl	%dl, %eax
	movzbl	24(%rcx), %edx
	movq	%rcx, %r10
	movq	%r8, %rbx
	andl	$15, %edx
	cmpb	$2, %dl
	je	.L3197
	leaq	.L3146(%rip), %r8
	movzbl	%dl, %ecx
	movslq	(%r8,%rcx,4), %rcx
	addq	%r8, %rcx
	jmp	*%rcx
	.section .rdata,"dr"
	.align 4
.L3146:
	.long	.L3148-.L3146
	.long	.L3145-.L3146
	.long	.L3145-.L3146
	.long	.L3149-.L3146
	.long	.L3149-.L3146
	.long	.L3148-.L3146
	.long	.L3147-.L3146
	.long	.L3145-.L3146
	.long	.L3145-.L3146
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatIhNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L3197:
	testb	%al, %al
	js	.L3135
	movb	%al, 99(%rsp)
	testb	$1, 20(%rcx)
	je	.L3198
	movzbl	16(%rcx), %eax
	andl	$3, %eax
	cmpb	$1, %al
	je	.L3199
	cmpb	$2, %al
	je	.L3200
.L3140:
	leaq	99(%rsp), %rcx
	movl	$1, %eax
	leaq	80(%rsp), %rdx
	movl	$2, %r8d
	movq	%rcx, 88(%rsp)
	movq	16(%rbx), %rcx
	movq	%rax, 80(%rsp)
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
.L3143:
	addq	$320, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L3149:
	cmpb	$3, %dl
	je	.L3201
	testb	%al, %al
	jne	.L3184
	movb	$48, 103(%rsp)
	leaq	104(%rsp), %r11
	leaq	103(%rsp), %r8
	leaq	.LC44(%rip), %rdi
	cmpb	$4, %dl
	je	.L3169
.L3168:
	testb	$1, 12(%r10)
	jne	.L3186
	.p2align 4
	.p2align 3
.L3196:
	movq	%r8, %rcx
	jmp	.L3155
	.p2align 4,,10
	.p2align 3
.L3145:
	cmpb	$7, %dl
	leaq	.LC43(%rip), %rcx
	leaq	.LC42(%rip), %rdx
	cmovne	%rcx, %rdx
	movq	%rdx, %rdi
	testb	%al, %al
	je	.L3180
	bsrl	%eax, %ecx
	movl	$32, %r11d
	xorl	$31, %ecx
	subl	%ecx, %r11d
	cmpl	$1, %eax
	je	.L3152
	movl	$31, %r8d
	movl	$30, %r9d
	subl	%ecx, %r8d
	subl	%ecx, %r9d
	leaq	100(%rsp,%r8), %rdx
	leaq	99(%rsp,%r8), %r8
	subq	%r9, %r8
	.p2align 5
	.p2align 4
	.p2align 3
.L3153:
	movl	%eax, %ecx
	subq	$1, %rdx
	shrl	%eax
	andl	$1, %ecx
	addl	$48, %ecx
	movb	%cl, 4(%rdx)
	cmpq	%r8, %rdx
	jne	.L3153
.L3152:
	leaq	103(%rsp), %r8
	movl	$49, %eax
	addq	%r8, %r11
.L3151:
	movb	%al, 103(%rsp)
	testb	$1, 12(%r10)
	je	.L3196
.L3186:
	movq	$-2, %rcx
	movl	$2, %eax
.L3154:
	addq	%r8, %rcx
	movl	%eax, %r9d
	testl	%eax, %eax
	je	.L3155
	xorl	%eax, %eax
.L3173:
	movl	%eax, %edx
	addl	$1, %eax
	movzbl	(%rdi,%rdx), %esi
	movb	%sil, (%rcx,%rdx)
	cmpl	%r9d, %eax
	jb	.L3173
	jmp	.L3155
	.p2align 4,,10
	.p2align 3
.L3148:
	testb	%al, %al
	je	.L3160
	movzbl	%al, %edx
	cmpb	$9, %al
	jbe	.L3182
	movdqu	.LC25(%rip), %xmm0
	movups	%xmm0, 112(%rsp)
	movdqu	.LC26(%rip), %xmm0
	movups	%xmm0, 128(%rsp)
	movdqu	.LC27(%rip), %xmm0
	movups	%xmm0, 144(%rsp)
	movdqu	.LC28(%rip), %xmm0
	movups	%xmm0, 160(%rsp)
	movdqu	.LC29(%rip), %xmm0
	movups	%xmm0, 176(%rsp)
	movdqu	.LC30(%rip), %xmm0
	movups	%xmm0, 192(%rsp)
	movdqu	.LC31(%rip), %xmm0
	movups	%xmm0, 208(%rsp)
	movdqu	.LC32(%rip), %xmm0
	movups	%xmm0, 224(%rsp)
	movdqu	.LC33(%rip), %xmm0
	movups	%xmm0, 240(%rsp)
	movdqu	.LC34(%rip), %xmm0
	movups	%xmm0, 256(%rsp)
	movdqu	.LC35(%rip), %xmm0
	movups	%xmm0, 272(%rsp)
	movdqu	.LC36(%rip), %xmm0
	movups	%xmm0, 288(%rsp)
	movdqu	.LC37(%rip), %xmm0
	movups	%xmm0, 297(%rsp)
	cmpl	$99, %edx
	jbe	.L3202
	movl	%edx, %eax
	imulq	$1374389535, %rax, %rax
	shrq	$37, %rax
	imull	$100, %eax, %ecx
	subl	%ecx, %edx
	leal	1(%rdx,%rdx), %edx
	movzwl	111(%rsp,%rdx), %edx
	movw	%dx, 104(%rsp)
	movl	$3, %edx
.L3157:
	addl	$48, %eax
.L3159:
	movb	%al, 103(%rsp)
	leaq	103(%rsp), %r8
	leaq	103(%rsp,%rdx), %r11
	movq	%r8, %rcx
	.p2align 4
	.p2align 3
.L3155:
	movzbl	8(%r10), %eax
	leaq	-1(%rcx), %rdx
	shrb	$2, %al
	andl	$3, %eax
	cmpb	$1, %al
	je	.L3203
	cmpb	$3, %al
	je	.L3204
.L3177:
	subq	%rcx, %r11
	movq	%rcx, 88(%rsp)
	subq	%rcx, %r8
	leaq	80(%rsp), %rdx
	movq	%rbx, %r9
	movq	%r10, %rcx
	movq	%r11, 80(%rsp)
	call	_ZNKSt8__format15__formatter_intIcE13_M_format_intINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorESt17basic_string_viewIcSt11char_traitsIcEEyRS7_
	addq	$320, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L3198:
	movl	$1, 32(%rsp)
	leaq	99(%rsp), %rcx
	movl	$1, %eax
	movq	%r10, %r9
	movq	%rcx, 88(%rsp)
	movl	$1, %edx
	leaq	80(%rsp), %rcx
	movq	%rax, 80(%rsp)
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	addq	$320, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L3147:
	testb	%al, %al
	je	.L3160
	movzbl	%al, %edx
	bsrl	%edx, %ecx
	leal	3(%rcx), %r11d
	movl	$2863311531, %ecx
	imulq	%rcx, %r11
	shrq	$33, %r11
	cmpl	$63, %edx
	jbe	.L3205
	andl	$7, %eax
	addl	$48, %eax
	movb	%al, 105(%rsp)
	movl	%edx, %eax
	shrl	$6, %edx
	shrl	$3, %eax
	andl	$7, %eax
	addl	$48, %eax
	movb	%al, 104(%rsp)
.L3163:
	addl	$48, %edx
.L3164:
	movb	%dl, 103(%rsp)
	leaq	103(%rsp), %r8
	movl	$1, %eax
	leaq	.LC46(%rip), %rdi
	addq	%r8, %r11
.L3165:
	movq	%r8, %rcx
	testb	$1, 12(%r10)
	je	.L3155
	movq	%rax, %rcx
	negq	%rcx
	jmp	.L3154
	.p2align 4,,10
	.p2align 3
.L3203:
	movb	$43, -1(%rcx)
.L3176:
	movq	%rdx, %rcx
	jmp	.L3177
	.p2align 4,,10
	.p2align 3
.L3160:
	movb	$48, 103(%rsp)
	leaq	104(%rsp), %r11
	leaq	103(%rsp), %r8
	jmp	.L3196
	.p2align 4,,10
	.p2align 3
.L3204:
	movb	$32, -1(%rcx)
	jmp	.L3176
	.p2align 4,,10
	.p2align 3
.L3180:
	movl	$48, %eax
	leaq	104(%rsp), %r11
	leaq	103(%rsp), %r8
	jmp	.L3151
	.p2align 4,,10
	.p2align 3
.L3199:
	movzwl	(%rcx), %eax
.L3139:
	cmpq	$3, %rax
	jbe	.L3140
	leaq	100(%rsp), %rax
	leaq	99(%rsp), %r8
	movq	.LC48(%rip), %xmm0
	movq	%r10, 352(%rsp)
	movq	%rax, %xmm1
	movq	%r8, 88(%rsp)
	leaq	112(%rsp), %rcx
	leaq	80(%rsp), %rdx
	movq	%rax, 136(%rsp)
	punpcklqdq	%xmm1, %xmm0
	movl	$1, %eax
	movl	$2, %r8d
	movq	$12, 128(%rsp)
	movq	%rax, 80(%rsp)
	movups	%xmm0, 112(%rsp)
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
	movq	120(%rsp), %rcx
	movq	%rbx, %r8
	movq	136(%rsp), %rax
	movl	$3, %edx
	movq	352(%rsp), %r9
	subq	%rcx, %rax
	cmpb	$92, 1(%rcx)
	movl	$1, 32(%rsp)
	cmove	%rax, %rdx
	movq	%rcx, 88(%rsp)
	leaq	80(%rsp), %rcx
	movq	%rax, 80(%rsp)
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	jmp	.L3143
	.p2align 4,,10
	.p2align 3
.L3201:
	testb	%al, %al
	jne	.L3183
	movb	$48, 103(%rsp)
	leaq	104(%rsp), %r11
	leaq	103(%rsp), %r8
	leaq	.LC45(%rip), %rdi
	jmp	.L3168
	.p2align 4,,10
	.p2align 3
.L3184:
	leaq	.LC44(%rip), %rdi
.L3167:
	movzbl	%al, %ecx
	movdqu	.LC38(%rip), %xmm0
	bsrl	%ecx, %r8d
	leal	4(%r8), %r11d
	movups	%xmm0, 112(%rsp)
	shrl	$2, %r11d
	cmpl	$15, %ecx
	ja	.L3206
	movzbl	112(%rsp,%rcx), %eax
.L3171:
	leaq	103(%rsp), %r8
	movb	%al, 103(%rsp)
	addq	%r8, %r11
	cmpb	$4, %dl
	jne	.L3168
.L3169:
	movq	%r8, %rdx
	.p2align 4
	.p2align 3
.L3172:
	movsbl	(%rdx), %ecx
	movq	%r8, 72(%rsp)
	movq	%r10, 352(%rsp)
	movq	%r11, 64(%rsp)
	movq	%rdx, 56(%rsp)
	call	toupper
	movq	56(%rsp), %rdx
	movq	64(%rsp), %r11
	movq	352(%rsp), %r10
	movq	72(%rsp), %r8
	movb	%al, (%rdx)
	addq	$1, %rdx
	cmpq	%r11, %rdx
	jne	.L3172
	movl	$2, %eax
	jmp	.L3165
	.p2align 4,,10
	.p2align 3
.L3206:
	andl	$15, %eax
	shrl	$4, %ecx
	movzbl	112(%rsp,%rax), %eax
	movb	%al, 104(%rsp)
	movzbl	112(%rsp,%rcx), %eax
	jmp	.L3171
	.p2align 4,,10
	.p2align 3
.L3183:
	leaq	.LC45(%rip), %rdi
	jmp	.L3167
.L3202:
	addl	%edx, %edx
	leal	1(%rdx), %eax
	movzbl	112(%rsp,%rax), %eax
	movb	%al, 104(%rsp)
	movzbl	112(%rsp,%rdx), %eax
	movl	$2, %edx
	jmp	.L3159
	.p2align 4,,10
	.p2align 3
.L3200:
	movzwl	(%rcx), %ecx
	movq	%r8, %rdx
	movq	%r10, 352(%rsp)
	call	_ZNKSt8__format5_SpecIcE12_M_get_widthISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
	movq	352(%rsp), %r10
	jmp	.L3139
.L3182:
	movl	$1, %edx
	jmp	.L3157
.L3205:
	cmpl	$7, %edx
	jbe	.L3163
	andl	$7, %eax
	shrl	$3, %edx
	addl	$48, %eax
	addl	$48, %edx
	movb	%al, 104(%rsp)
	jmp	.L3164
.L3135:
	leaq	.LC47(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatIjNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt8__format15__formatter_intIcE6formatIjNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	.def	_ZNKSt8__format15__formatter_intIcE6formatIjNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format15__formatter_intIcE6formatIjNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
_ZNKSt8__format15__formatter_intIcE6formatIjNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_:
.LFB7696:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$352, %rsp
	.seh_stackalloc	352
	.seh_endprologue
	movl	%edx, %eax
	movzbl	24(%rcx), %edx
	movq	%rcx, %r10
	movq	%r8, %r11
	andl	$15, %edx
	cmpb	$2, %dl
	je	.L3285
	leaq	.L3220(%rip), %r8
	movzbl	%dl, %ecx
	movslq	(%r8,%rcx,4), %rcx
	addq	%r8, %rcx
	jmp	*%rcx
	.section .rdata,"dr"
	.align 4
.L3220:
	.long	.L3222-.L3220
	.long	.L3219-.L3220
	.long	.L3219-.L3220
	.long	.L3223-.L3220
	.long	.L3223-.L3220
	.long	.L3222-.L3220
	.long	.L3221-.L3220
	.long	.L3219-.L3220
	.long	.L3219-.L3220
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatIjNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L3285:
	cmpl	$127, %eax
	ja	.L3209
	movb	%al, 95(%rsp)
	testb	$1, 20(%rcx)
	je	.L3286
	movzbl	16(%rcx), %eax
	andl	$3, %eax
	cmpb	$1, %al
	je	.L3287
	cmpb	$2, %al
	je	.L3288
.L3214:
	leaq	95(%rsp), %rcx
	movl	$1, %eax
	leaq	64(%rsp), %rdx
	movl	$2, %r8d
	movq	%rcx, 72(%rsp)
	movq	16(%r11), %rcx
	movq	%rax, 64(%rsp)
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
.L3217:
	addq	$352, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L3223:
	cmpb	$3, %dl
	je	.L3289
	testl	%eax, %eax
	jne	.L3269
	movb	$48, 99(%rsp)
	cmpb	$4, %dl
	je	.L3270
	leaq	.LC44(%rip), %rdi
	leaq	100(%rsp), %rbx
	leaq	99(%rsp), %rsi
	jmp	.L3249
	.p2align 4,,10
	.p2align 3
.L3219:
	cmpb	$7, %dl
	leaq	.LC43(%rip), %rsi
	leaq	.LC42(%rip), %rdx
	cmovne	%rsi, %rdx
	movq	%rdx, %rdi
	testl	%eax, %eax
	je	.L3263
	bsrl	%eax, %ecx
	movl	$32, %r9d
	leaq	99(%rsp), %rsi
	xorl	$31, %ecx
	subl	%ecx, %r9d
	cmpl	$1, %eax
	je	.L3226
	movl	$31, %ebx
	leaq	99(%rsp), %rsi
	movl	$30, %r8d
	subl	%ecx, %ebx
	subl	%ecx, %r8d
	leaq	(%rsi,%rbx), %rdx
	leaq	98(%rsp,%rbx), %rbx
	subq	%r8, %rbx
	.p2align 5
	.p2align 4
	.p2align 3
.L3227:
	movl	%eax, %ecx
	subq	$1, %rdx
	shrl	%eax
	andl	$1, %ecx
	addl	$48, %ecx
	movb	%cl, 1(%rdx)
	cmpq	%rdx, %rbx
	jne	.L3227
.L3226:
	leaq	(%rsi,%r9), %rbx
	movl	$49, %eax
.L3225:
	movb	%al, 99(%rsp)
	testb	$1, 12(%r10)
	je	.L3284
.L3271:
	movq	$-2, %rcx
	movl	$2, %eax
.L3228:
	addq	%rsi, %rcx
	movl	%eax, %r8d
	testl	%eax, %eax
	je	.L3229
	xorl	%eax, %eax
.L3256:
	movl	%eax, %edx
	addl	$1, %eax
	movzbl	(%rdi,%rdx), %r9d
	movb	%r9b, (%rcx,%rdx)
	cmpl	%r8d, %eax
	jb	.L3256
	jmp	.L3229
	.p2align 4,,10
	.p2align 3
.L3222:
	testl	%eax, %eax
	je	.L3240
	cmpl	$9, %eax
	jbe	.L3265
	movl	%eax, %edx
	movl	$1, %r8d
	movl	$3518437209, %r9d
	jmp	.L3236
	.p2align 4,,10
	.p2align 3
.L3232:
	cmpl	$999, %edx
	jbe	.L3290
	cmpl	$9999, %edx
	jbe	.L3291
	movl	%edx, %ecx
	addl	$4, %r8d
	imulq	%r9, %rcx
	shrq	$45, %rcx
	cmpl	$99999, %edx
	jbe	.L3233
	movl	%ecx, %edx
.L3236:
	cmpl	$99, %edx
	ja	.L3232
	addl	$1, %r8d
.L3233:
	movl	%r8d, %ebx
	cmpl	$32, %r8d
	ja	.L3267
	movdqu	.LC25(%rip), %xmm0
	movups	%xmm0, 144(%rsp)
	movdqu	.LC26(%rip), %xmm0
	movups	%xmm0, 160(%rsp)
	movdqu	.LC27(%rip), %xmm0
	movups	%xmm0, 176(%rsp)
	movdqu	.LC28(%rip), %xmm0
	movups	%xmm0, 192(%rsp)
	movdqu	.LC29(%rip), %xmm0
	movups	%xmm0, 208(%rsp)
	movdqu	.LC30(%rip), %xmm0
	movups	%xmm0, 224(%rsp)
	movdqu	.LC31(%rip), %xmm0
	movups	%xmm0, 240(%rsp)
	movdqu	.LC32(%rip), %xmm0
	movups	%xmm0, 256(%rsp)
	movdqu	.LC33(%rip), %xmm0
	movups	%xmm0, 272(%rsp)
	movdqu	.LC34(%rip), %xmm0
	movups	%xmm0, 288(%rsp)
	movdqu	.LC35(%rip), %xmm0
	movups	%xmm0, 304(%rsp)
	movdqu	.LC36(%rip), %xmm0
	movups	%xmm0, 320(%rsp)
	movdqu	.LC37(%rip), %xmm0
	movups	%xmm0, 329(%rsp)
	cmpl	$99, %eax
	jbe	.L3237
	leal	-1(%r8), %edx
	.p2align 4
	.p2align 3
.L3238:
	movl	%eax, %r8d
	movl	%eax, %ecx
	imulq	$1374389535, %r8, %r8
	shrq	$37, %r8
	imull	$100, %r8d, %r9d
	subl	%r9d, %ecx
	movl	%eax, %r9d
	movl	%r8d, %eax
	movl	%edx, %r8d
	addl	%ecx, %ecx
	leal	1(%rcx), %esi
	movzbl	144(%rsp,%rcx), %ecx
	movzbl	144(%rsp,%rsi), %esi
	movb	%sil, 99(%rsp,%r8)
	leal	-1(%rdx), %r8d
	subl	$2, %edx
	movb	%cl, 99(%rsp,%r8)
	cmpl	$9999, %r9d
	ja	.L3238
	cmpl	$999, %r9d
	ja	.L3237
.L3231:
	addl	$48, %eax
.L3239:
	leaq	99(%rsp), %rsi
	movb	%al, 99(%rsp)
	leaq	99(%rsp,%rbx), %rbx
	movq	%rsi, %rcx
	jmp	.L3229
	.p2align 4,,10
	.p2align 3
.L3286:
	movl	$1, 32(%rsp)
	leaq	95(%rsp), %rcx
	movl	$1, %eax
	movq	%r10, %r9
	movq	%rcx, 72(%rsp)
	movl	$1, %edx
	leaq	64(%rsp), %rcx
	movq	%rax, 64(%rsp)
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	addq	$352, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L3221:
	testl	%eax, %eax
	je	.L3240
	bsrl	%eax, %edx
	leal	3(%rdx), %ecx
	movl	$2863311531, %edx
	imulq	%rdx, %rcx
	shrq	$33, %rcx
	movl	%ecx, %r9d
	subl	$1, %ecx
	cmpl	$63, %eax
	jbe	.L3242
	.p2align 6
	.p2align 4
	.p2align 3
.L3243:
	movl	%eax, %edx
	movl	%ecx, %r8d
	andl	$7, %edx
	addl	$48, %edx
	movb	%dl, 99(%rsp,%r8)
	movl	%eax, %edx
	leal	-1(%rcx), %r8d
	shrl	$6, %eax
	shrl	$3, %edx
	subl	$2, %ecx
	andl	$7, %edx
	addl	$48, %edx
	movb	%dl, 99(%rsp,%r8)
	cmpl	$63, %eax
	ja	.L3243
.L3242:
	leal	48(%rax), %edx
	cmpl	$7, %eax
	ja	.L3292
.L3245:
	movb	%dl, 99(%rsp)
	leaq	99(%rsp), %rsi
	movl	$1, %eax
	leaq	.LC46(%rip), %rdi
	leaq	(%rsi,%r9), %rbx
.L3246:
	movq	%rsi, %rcx
	testb	$1, 12(%r10)
	jne	.L3293
.L3229:
	movzbl	8(%r10), %eax
	leaq	-1(%rcx), %rdx
	shrb	$2, %al
	andl	$3, %eax
	cmpb	$1, %al
	je	.L3294
	cmpb	$3, %al
	je	.L3295
.L3260:
	subq	%rcx, %rsi
	movq	%rcx, 72(%rsp)
	subq	%rcx, %rbx
	leaq	64(%rsp), %rdx
	movq	%r11, %r9
	movq	%rsi, %r8
	movq	%r10, %rcx
	movq	%rbx, 64(%rsp)
	call	_ZNKSt8__format15__formatter_intIcE13_M_format_intINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorESt17basic_string_viewIcSt11char_traitsIcEEyRS7_
	addq	$352, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L3294:
	movb	$43, -1(%rcx)
.L3259:
	movq	%rdx, %rcx
	jmp	.L3260
	.p2align 4,,10
	.p2align 3
.L3240:
	leaq	99(%rsp), %rsi
	movb	$48, 99(%rsp)
	leaq	100(%rsp), %rbx
	movq	%rsi, %rcx
	jmp	.L3229
	.p2align 4,,10
	.p2align 3
.L3295:
	movb	$32, -1(%rcx)
	jmp	.L3259
	.p2align 4,,10
	.p2align 3
.L3269:
	leaq	.LC44(%rip), %rdi
.L3248:
	bsrl	%eax, %ecx
	movdqu	.LC38(%rip), %xmm0
	addl	$4, %ecx
	shrl	$2, %ecx
	movups	%xmm0, 144(%rsp)
	movl	%ecx, %r9d
	cmpl	$255, %eax
	jbe	.L3251
	subl	$1, %ecx
	.p2align 6
	.p2align 4
	.p2align 3
.L3252:
	movl	%eax, %ebx
	movl	%ecx, %r8d
	andl	$15, %ebx
	movzbl	144(%rsp,%rbx), %ebx
	movb	%bl, 99(%rsp,%r8)
	movl	%eax, %r8d
	leal	-1(%rcx), %ebx
	shrl	$8, %eax
	shrl	$4, %r8d
	subl	$2, %ecx
	andl	$15, %r8d
	movzbl	144(%rsp,%r8), %r8d
	movb	%r8b, 99(%rsp,%rbx)
	cmpl	$255, %eax
	ja	.L3252
.L3251:
	cmpl	$15, %eax
	ja	.L3296
	movzbl	144(%rsp,%rax), %eax
.L3254:
	leaq	99(%rsp), %rsi
	movb	%al, 99(%rsp)
	leaq	(%rsi,%r9), %rbx
	cmpb	$4, %dl
	je	.L3250
.L3249:
	testb	$1, 12(%r10)
	jne	.L3271
.L3284:
	movq	%rsi, %rcx
	jmp	.L3229
	.p2align 4,,10
	.p2align 3
.L3263:
	movl	$48, %eax
	leaq	100(%rsp), %rbx
	leaq	99(%rsp), %rsi
	jmp	.L3225
	.p2align 4,,10
	.p2align 3
.L3287:
	movzwl	(%rcx), %eax
.L3213:
	cmpq	$3, %rax
	jbe	.L3214
	leaq	96(%rsp), %rax
	leaq	95(%rsp), %r8
	movq	.LC48(%rip), %xmm0
	movq	%r11, 400(%rsp)
	movq	%rax, %xmm1
	movq	%rax, 168(%rsp)
	leaq	144(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movq	%r8, 72(%rsp)
	punpcklqdq	%xmm1, %xmm0
	movl	$1, %eax
	movl	$2, %r8d
	movq	%r10, 384(%rsp)
	movq	$12, 160(%rsp)
	movq	%rax, 64(%rsp)
	movups	%xmm0, 144(%rsp)
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
	movq	152(%rsp), %rcx
	movq	168(%rsp), %rax
	movl	$3, %edx
	movq	384(%rsp), %r9
	movq	400(%rsp), %r8
	subq	%rcx, %rax
	cmpb	$92, 1(%rcx)
	movl	$1, 32(%rsp)
	cmove	%rax, %rdx
	movq	%rcx, 72(%rsp)
	leaq	64(%rsp), %rcx
	movq	%rax, 64(%rsp)
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	jmp	.L3217
	.p2align 4,,10
	.p2align 3
.L3289:
	testl	%eax, %eax
	jne	.L3268
	movb	$48, 99(%rsp)
	leaq	100(%rsp), %rbx
	leaq	99(%rsp), %rsi
	leaq	.LC45(%rip), %rdi
	jmp	.L3249
	.p2align 4,,10
	.p2align 3
.L3296:
	movl	%eax, %ecx
	shrl	$4, %eax
	andl	$15, %ecx
	movzbl	144(%rsp,%rcx), %ecx
	movb	%cl, 100(%rsp)
	movzbl	144(%rsp,%rax), %eax
	jmp	.L3254
	.p2align 4,,10
	.p2align 3
.L3292:
	movl	%eax, %edx
	shrl	$3, %eax
	andl	$7, %edx
	addl	$48, %edx
	movb	%dl, 100(%rsp)
	leal	48(%rax), %edx
	jmp	.L3245
	.p2align 4,,10
	.p2align 3
.L3237:
	addl	%eax, %eax
	leal	1(%rax), %edx
	movzbl	144(%rsp,%rax), %eax
	movzbl	144(%rsp,%rdx), %edx
	movb	%dl, 100(%rsp)
	jmp	.L3239
	.p2align 4,,10
	.p2align 3
.L3268:
	leaq	.LC45(%rip), %rdi
	jmp	.L3248
	.p2align 4,,10
	.p2align 3
.L3270:
	leaq	100(%rsp), %rbx
	leaq	.LC44(%rip), %rdi
	leaq	99(%rsp), %rsi
.L3250:
	movq	%rsi, %rdx
	.p2align 4
	.p2align 3
.L3255:
	movsbl	(%rdx), %ecx
	movq	%r11, 400(%rsp)
	movq	%r10, 384(%rsp)
	movq	%rdx, 56(%rsp)
	call	toupper
	movq	56(%rsp), %rdx
	movq	384(%rsp), %r10
	movq	400(%rsp), %r11
	movb	%al, (%rdx)
	addq	$1, %rdx
	cmpq	%rbx, %rdx
	jne	.L3255
	movl	$2, %eax
	jmp	.L3246
	.p2align 4,,10
	.p2align 3
.L3288:
	movzwl	(%rcx), %ecx
	movq	%r8, %rdx
	movq	%r10, 384(%rsp)
	movq	%r8, 400(%rsp)
	call	_ZNKSt8__format5_SpecIcE12_M_get_widthISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
	movq	384(%rsp), %r10
	movq	400(%rsp), %r11
	jmp	.L3213
	.p2align 4,,10
	.p2align 3
.L3290:
	addl	$2, %r8d
	jmp	.L3233
	.p2align 4,,10
	.p2align 3
.L3291:
	addl	$3, %r8d
	jmp	.L3233
.L3293:
	movq	%rax, %rcx
	negq	%rcx
	jmp	.L3228
.L3267:
	leaq	131(%rsp), %rbx
	leaq	99(%rsp), %rsi
	jmp	.L3284
.L3265:
	movl	$1, %ebx
	jmp	.L3231
.L3209:
	leaq	.LC47(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatIyNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt8__format15__formatter_intIcE6formatIyNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	.def	_ZNKSt8__format15__formatter_intIcE6formatIyNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format15__formatter_intIcE6formatIyNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
_ZNKSt8__format15__formatter_intIcE6formatIyNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_:
.LFB7699:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$392, %rsp
	.seh_stackalloc	392
	.seh_endprologue
	movzbl	24(%rcx), %eax
	andl	$15, %eax
	movq	%rcx, %r11
	movq	%rdx, %r10
	movq	%r8, %rbx
	cmpb	$2, %al
	je	.L3375
	leaq	.L3310(%rip), %rcx
	movzbl	%al, %edx
	movslq	(%rcx,%rdx,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section .rdata,"dr"
	.align 4
.L3310:
	.long	.L3312-.L3310
	.long	.L3309-.L3310
	.long	.L3309-.L3310
	.long	.L3313-.L3310
	.long	.L3313-.L3310
	.long	.L3312-.L3310
	.long	.L3311-.L3310
	.long	.L3309-.L3310
	.long	.L3309-.L3310
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatIyNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L3375:
	cmpq	$127, %rdx
	ja	.L3299
	movb	%dl, 95(%rsp)
	testb	$1, 20(%rcx)
	je	.L3376
	movzbl	16(%rcx), %eax
	andl	$3, %eax
	cmpb	$1, %al
	je	.L3377
	cmpb	$2, %al
	je	.L3378
.L3304:
	leaq	95(%rsp), %rcx
	movl	$1, %eax
	leaq	64(%rsp), %rdx
	movl	$2, %r8d
	movq	%rcx, 72(%rsp)
	movq	16(%rbx), %rcx
	movq	%rax, 64(%rsp)
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
.L3307:
	addq	$392, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L3313:
	cmpb	$3, %al
	je	.L3379
	testq	%r10, %r10
	jne	.L3359
	movb	$48, 99(%rsp)
	cmpb	$4, %al
	je	.L3360
	leaq	.LC44(%rip), %r14
	leaq	100(%rsp), %rsi
	leaq	99(%rsp), %r8
	jmp	.L3339
	.p2align 4,,10
	.p2align 3
.L3309:
	cmpb	$7, %al
	leaq	.LC43(%rip), %rdi
	leaq	.LC42(%rip), %rax
	cmovne	%rdi, %rax
	movq	%rax, %r14
	testq	%r10, %r10
	je	.L3353
	bsrq	%r10, %rcx
	movl	$64, %edx
	leaq	99(%rsp), %r8
	xorq	$63, %rcx
	subl	%ecx, %edx
	cmpq	$1, %r10
	je	.L3316
	movl	$63, %esi
	leaq	99(%rsp), %r8
	movl	$62, %r9d
	subl	%ecx, %esi
	subl	%ecx, %r9d
	leaq	(%r8,%rsi), %rax
	leaq	98(%rsp,%rsi), %rsi
	subq	%r9, %rsi
	.p2align 5
	.p2align 4
	.p2align 3
.L3317:
	movl	%r10d, %ecx
	subq	$1, %rax
	shrq	%r10
	andl	$1, %ecx
	addl	$48, %ecx
	movb	%cl, 1(%rax)
	cmpq	%rax, %rsi
	jne	.L3317
.L3316:
	leaq	(%r8,%rdx), %rsi
	movl	$49, %eax
.L3315:
	movb	%al, 99(%rsp)
	testb	$1, 12(%r11)
	je	.L3374
.L3361:
	movq	$-2, %rcx
	movl	$2, %eax
.L3318:
	addq	%r8, %rcx
	movl	%eax, %edx
	testl	%eax, %eax
	je	.L3319
	xorl	%eax, %eax
.L3346:
	movl	%eax, %r10d
	addl	$1, %eax
	movzbl	(%r14,%r10), %edi
	movb	%dil, (%rcx,%r10)
	cmpl	%edx, %eax
	jb	.L3346
	jmp	.L3319
	.p2align 4,,10
	.p2align 3
.L3312:
	testq	%r10, %r10
	je	.L3330
	cmpq	$9, %r10
	jbe	.L3355
	movq	%r10, %rcx
	movl	$1, %r8d
	movabsq	$3777893186295716171, %r9
	jmp	.L3326
	.p2align 4,,10
	.p2align 3
.L3322:
	cmpq	$999, %rcx
	jbe	.L3380
	cmpq	$9999, %rcx
	jbe	.L3381
	movq	%rcx, %rax
	addl	$4, %r8d
	mulq	%r9
	cmpq	$99999, %rcx
	jbe	.L3323
	shrq	$11, %rdx
	movq	%rdx, %rcx
.L3326:
	cmpq	$99, %rcx
	ja	.L3322
	addl	$1, %r8d
.L3323:
	movl	%r8d, %r9d
	cmpl	$64, %r8d
	ja	.L3357
	movdqu	.LC25(%rip), %xmm0
	movups	%xmm0, 176(%rsp)
	movdqu	.LC26(%rip), %xmm0
	movups	%xmm0, 192(%rsp)
	movdqu	.LC27(%rip), %xmm0
	movups	%xmm0, 208(%rsp)
	movdqu	.LC28(%rip), %xmm0
	movups	%xmm0, 224(%rsp)
	movdqu	.LC29(%rip), %xmm0
	movups	%xmm0, 240(%rsp)
	movdqu	.LC30(%rip), %xmm0
	movups	%xmm0, 256(%rsp)
	movdqu	.LC31(%rip), %xmm0
	movups	%xmm0, 272(%rsp)
	movdqu	.LC32(%rip), %xmm0
	movups	%xmm0, 288(%rsp)
	movdqu	.LC33(%rip), %xmm0
	movups	%xmm0, 304(%rsp)
	movdqu	.LC34(%rip), %xmm0
	movups	%xmm0, 320(%rsp)
	movdqu	.LC35(%rip), %xmm0
	movups	%xmm0, 336(%rsp)
	movdqu	.LC36(%rip), %xmm0
	movups	%xmm0, 352(%rsp)
	movdqu	.LC37(%rip), %xmm0
	movups	%xmm0, 361(%rsp)
	cmpq	$99, %r10
	jbe	.L3327
	movabsq	$2951479051793528259, %rsi
	leal	-1(%r8), %ecx
	.p2align 4
	.p2align 3
.L3328:
	movq	%r10, %rdx
	shrq	$2, %rdx
	movq	%rdx, %rax
	mulq	%rsi
	movq	%r10, %rax
	shrq	$2, %rdx
	imulq	$100, %rdx, %r8
	subq	%r8, %rax
	movq	%r10, %r8
	movq	%rdx, %r10
	movl	%ecx, %edx
	movzbl	177(%rsp,%rax,2), %edi
	movzbl	176(%rsp,%rax,2), %eax
	movb	%dil, 99(%rsp,%rdx)
	leal	-1(%rcx), %edx
	subl	$2, %ecx
	movb	%al, 99(%rsp,%rdx)
	cmpq	$9999, %r8
	ja	.L3328
	cmpq	$999, %r8
	ja	.L3327
.L3321:
	addl	$48, %r10d
.L3329:
	leaq	99(%rsp), %r8
	movb	%r10b, 99(%rsp)
	leaq	99(%rsp,%r9), %rsi
	movq	%r8, %rcx
	jmp	.L3319
	.p2align 4,,10
	.p2align 3
.L3376:
	movl	$1, 32(%rsp)
	leaq	95(%rsp), %rcx
	movl	$1, %eax
	movq	%r11, %r9
	movq	%rcx, 72(%rsp)
	movl	$1, %edx
	leaq	64(%rsp), %rcx
	movq	%rax, 64(%rsp)
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	addq	$392, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L3311:
	testq	%r10, %r10
	je	.L3330
	bsrq	%r10, %rax
	leal	3(%rax), %ecx
	movl	$2863311531, %eax
	imulq	%rax, %rcx
	shrq	$33, %rcx
	movl	%ecx, %edx
	subl	$1, %ecx
	cmpq	$63, %r10
	jbe	.L3332
	.p2align 6
	.p2align 4
	.p2align 3
.L3333:
	movq	%r10, %rax
	movl	%ecx, %r8d
	andl	$7, %eax
	addl	$48, %eax
	movb	%al, 99(%rsp,%r8)
	movq	%r10, %rax
	leal	-1(%rcx), %r8d
	shrq	$6, %r10
	shrq	$3, %rax
	subl	$2, %ecx
	andl	$7, %eax
	addl	$48, %eax
	movb	%al, 99(%rsp,%r8)
	cmpq	$63, %r10
	ja	.L3333
.L3332:
	leal	48(%r10), %eax
	cmpq	$7, %r10
	ja	.L3382
.L3335:
	leaq	99(%rsp), %r8
	movb	%al, 99(%rsp)
	leaq	.LC46(%rip), %r14
	movl	$1, %eax
	leaq	(%r8,%rdx), %rsi
.L3336:
	movq	%r8, %rcx
	testb	$1, 12(%r11)
	jne	.L3383
.L3319:
	movzbl	8(%r11), %eax
	leaq	-1(%rcx), %r9
	shrb	$2, %al
	andl	$3, %eax
	cmpb	$1, %al
	je	.L3384
	cmpb	$3, %al
	je	.L3385
.L3350:
	movq	%rcx, 72(%rsp)
	subq	%rcx, %rsi
	subq	%rcx, %r8
	leaq	64(%rsp), %rdx
	movq	%rbx, %r9
	movq	%r11, %rcx
	movq	%rsi, 64(%rsp)
	call	_ZNKSt8__format15__formatter_intIcE13_M_format_intINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorESt17basic_string_viewIcSt11char_traitsIcEEyRS7_
	addq	$392, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L3384:
	movb	$43, -1(%rcx)
.L3349:
	movq	%r9, %rcx
	jmp	.L3350
	.p2align 4,,10
	.p2align 3
.L3330:
	leaq	99(%rsp), %r8
	movb	$48, 99(%rsp)
	leaq	100(%rsp), %rsi
	movq	%r8, %rcx
	jmp	.L3319
	.p2align 4,,10
	.p2align 3
.L3385:
	movb	$32, -1(%rcx)
	jmp	.L3349
	.p2align 4,,10
	.p2align 3
.L3359:
	leaq	.LC44(%rip), %r14
.L3338:
	bsrq	%r10, %rdx
	movdqu	.LC38(%rip), %xmm0
	leal	4(%rdx), %ecx
	shrl	$2, %ecx
	movups	%xmm0, 176(%rsp)
	movl	%ecx, %edx
	cmpq	$255, %r10
	jbe	.L3341
	subl	$1, %ecx
	.p2align 4
	.p2align 3
.L3342:
	movq	%r10, %rsi
	movl	%ecx, %r8d
	andl	$15, %esi
	movzbl	176(%rsp,%rsi), %esi
	movb	%sil, 99(%rsp,%r8)
	movq	%r10, %r8
	leal	-1(%rcx), %esi
	shrq	$8, %r10
	shrq	$4, %r8
	subl	$2, %ecx
	andl	$15, %r8d
	movzbl	176(%rsp,%r8), %r8d
	movb	%r8b, 99(%rsp,%rsi)
	cmpq	$255, %r10
	ja	.L3342
.L3341:
	cmpq	$15, %r10
	ja	.L3386
	movzbl	176(%rsp,%r10), %ecx
.L3344:
	leaq	99(%rsp), %r8
	movb	%cl, 99(%rsp)
	leaq	(%r8,%rdx), %rsi
	cmpb	$4, %al
	je	.L3340
.L3339:
	testb	$1, 12(%r11)
	jne	.L3361
.L3374:
	movq	%r8, %rcx
	jmp	.L3319
	.p2align 4,,10
	.p2align 3
.L3353:
	movl	$48, %eax
	leaq	100(%rsp), %rsi
	leaq	99(%rsp), %r8
	jmp	.L3315
	.p2align 4,,10
	.p2align 3
.L3377:
	movzwl	(%rcx), %eax
.L3303:
	cmpq	$3, %rax
	jbe	.L3304
	leaq	96(%rsp), %rax
	leaq	95(%rsp), %r8
	movq	.LC48(%rip), %xmm0
	movq	%r11, 432(%rsp)
	movq	%rax, %xmm1
	movq	%rax, 200(%rsp)
	leaq	176(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movq	%r8, 72(%rsp)
	punpcklqdq	%xmm1, %xmm0
	movl	$1, %eax
	movl	$2, %r8d
	movq	$12, 192(%rsp)
	movq	%rax, 64(%rsp)
	movups	%xmm0, 176(%rsp)
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
	movq	184(%rsp), %rcx
	movq	%rbx, %r8
	movq	200(%rsp), %rax
	movl	$3, %edx
	movq	432(%rsp), %r9
	subq	%rcx, %rax
	cmpb	$92, 1(%rcx)
	movl	$1, 32(%rsp)
	cmove	%rax, %rdx
	movq	%rcx, 72(%rsp)
	leaq	64(%rsp), %rcx
	movq	%rax, 64(%rsp)
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	jmp	.L3307
	.p2align 4,,10
	.p2align 3
.L3379:
	testq	%r10, %r10
	jne	.L3358
	movb	$48, 99(%rsp)
	leaq	100(%rsp), %rsi
	leaq	99(%rsp), %r8
	leaq	.LC45(%rip), %r14
	jmp	.L3339
	.p2align 4,,10
	.p2align 3
.L3386:
	movq	%r10, %rcx
	shrq	$4, %r10
	andl	$15, %ecx
	movzbl	176(%rsp,%rcx), %ecx
	movb	%cl, 100(%rsp)
	movzbl	176(%rsp,%r10), %ecx
	jmp	.L3344
	.p2align 4,,10
	.p2align 3
.L3382:
	movq	%r10, %rax
	andl	$7, %eax
	addl	$48, %eax
	movb	%al, 100(%rsp)
	movq	%r10, %rax
	shrq	$3, %rax
	addl	$48, %eax
	jmp	.L3335
	.p2align 4,,10
	.p2align 3
.L3327:
	movzbl	177(%rsp,%r10,2), %eax
	movzbl	176(%rsp,%r10,2), %r10d
	movb	%al, 100(%rsp)
	jmp	.L3329
	.p2align 4,,10
	.p2align 3
.L3358:
	leaq	.LC45(%rip), %r14
	jmp	.L3338
	.p2align 4,,10
	.p2align 3
.L3360:
	leaq	100(%rsp), %rsi
	leaq	.LC44(%rip), %r14
	leaq	99(%rsp), %r8
.L3340:
	movq	%r8, %r10
	.p2align 4
	.p2align 3
.L3345:
	movsbl	(%r10), %ecx
	movq	%r8, 56(%rsp)
	movq	%r11, 432(%rsp)
	movq	%r10, 48(%rsp)
	call	toupper
	movq	48(%rsp), %r10
	movq	56(%rsp), %r8
	movq	432(%rsp), %r11
	movb	%al, (%r10)
	addq	$1, %r10
	cmpq	%rsi, %r10
	jne	.L3345
	movl	$2, %eax
	jmp	.L3336
	.p2align 4,,10
	.p2align 3
.L3378:
	movzwl	(%rcx), %ecx
	movq	%r8, %rdx
	movq	%r11, 432(%rsp)
	call	_ZNKSt8__format5_SpecIcE12_M_get_widthISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
	movq	432(%rsp), %r11
	jmp	.L3303
	.p2align 4,,10
	.p2align 3
.L3380:
	addl	$2, %r8d
	jmp	.L3323
	.p2align 4,,10
	.p2align 3
.L3381:
	addl	$3, %r8d
	jmp	.L3323
.L3383:
	movq	%rax, %rcx
	negq	%rcx
	jmp	.L3318
.L3357:
	leaq	163(%rsp), %rsi
	leaq	99(%rsp), %r8
	jmp	.L3374
.L3355:
	movl	$1, %r9d
	jmp	.L3321
.L3299:
	leaq	.LC47(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatIiNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt8__format15__formatter_intIcE6formatIiNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	.def	_ZNKSt8__format15__formatter_intIcE6formatIiNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format15__formatter_intIcE6formatIiNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
_ZNKSt8__format15__formatter_intIcE6formatIiNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_:
.LFB7694:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$360, %rsp
	.seh_stackalloc	360
	.seh_endprologue
	movq	%rcx, %r10
	movzbl	24(%rcx), %ecx
	movq	%r8, %rbx
	movl	%edx, %eax
	andl	$15, %ecx
	cmpb	$2, %cl
	je	.L3473
	testl	%edx, %edx
	js	.L3474
	leaq	.L3407(%rip), %r9
	movzbl	%cl, %r8d
	movslq	(%r9,%r8,4), %r8
	addq	%r9, %r8
	jmp	*%r8
	.section .rdata,"dr"
	.align 4
.L3407:
	.long	.L3409-.L3407
	.long	.L3406-.L3407
	.long	.L3406-.L3407
	.long	.L3410-.L3407
	.long	.L3410-.L3407
	.long	.L3409-.L3407
	.long	.L3408-.L3407
	.long	.L3406-.L3407
	.long	.L3406-.L3407
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatIiNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L3474:
	leaq	.L3401(%rip), %r9
	movzbl	%cl, %r8d
	movl	%edx, %eax
	movslq	(%r9,%r8,4), %r8
	negl	%eax
	addq	%r9, %r8
	jmp	*%r8
	.section .rdata,"dr"
	.align 4
.L3401:
	.long	.L3403-.L3401
	.long	.L3400-.L3401
	.long	.L3400-.L3401
	.long	.L3404-.L3401
	.long	.L3404-.L3401
	.long	.L3403-.L3401
	.long	.L3402-.L3401
	.long	.L3400-.L3401
	.long	.L3400-.L3401
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatIiNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L3473:
	leal	128(%rdx), %eax
	cmpl	$255, %eax
	ja	.L3389
	movb	%dl, 95(%rsp)
	testb	$1, 20(%r10)
	je	.L3475
	movzbl	16(%r10), %eax
	andl	$3, %eax
	cmpb	$1, %al
	je	.L3476
	cmpb	$2, %al
	je	.L3477
.L3394:
	leaq	95(%rsp), %rcx
	movl	$1, %eax
	leaq	64(%rsp), %rdx
	movl	$2, %r8d
	movq	%rcx, 72(%rsp)
	movq	16(%rbx), %rcx
	movq	%rax, 64(%rsp)
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
.L3397:
	addq	$360, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L3475:
	movl	$1, 32(%rsp)
	leaq	95(%rsp), %rcx
	movl	$1, %eax
	movq	%r10, %r9
	movq	%rcx, 72(%rsp)
	movl	$1, %edx
	leaq	64(%rsp), %rcx
	movq	%rax, 64(%rsp)
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	addq	$360, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L3410:
	cmpb	$3, %cl
	je	.L3478
	testl	%edx, %edx
	jne	.L3457
	movb	$48, 99(%rsp)
	cmpb	$4, %cl
	je	.L3458
	leaq	.LC44(%rip), %r14
	leaq	100(%rsp), %rsi
	leaq	99(%rsp), %rdi
	jmp	.L3434
	.p2align 4,,10
	.p2align 3
.L3406:
	cmpb	$7, %cl
	leaq	.LC43(%rip), %rdi
	leaq	.LC42(%rip), %rcx
	cmovne	%rdi, %rcx
	movq	%rcx, %r14
	testl	%edx, %edx
	jne	.L3405
	movl	$48, %eax
	leaq	100(%rsp), %rsi
	leaq	99(%rsp), %rdi
.L3412:
	movb	%al, 99(%rsp)
	testb	$1, 12(%r10)
	je	.L3471
.L3459:
	movq	$-2, %rax
	movl	$2, %ecx
.L3415:
	addq	%rdi, %rax
	movl	%ecx, %r8d
	testl	%ecx, %ecx
	je	.L3416
	xorl	%ecx, %ecx
.L3441:
	movl	%ecx, %r11d
	addl	$1, %ecx
	movzbl	(%r14,%r11), %r9d
	movb	%r9b, (%rax,%r11)
	cmpl	%r8d, %ecx
	jb	.L3441
	jmp	.L3416
	.p2align 4,,10
	.p2align 3
.L3409:
	testl	%edx, %edx
	jne	.L3403
.L3472:
	movb	$48, 99(%rsp)
	leaq	99(%rsp), %rdi
	leaq	100(%rsp), %rsi
	movq	%rdi, %rax
	leaq	98(%rsp), %rcx
.L3443:
	movzbl	8(%r10), %edx
	shrb	$2, %dl
	andl	$3, %edx
	cmpb	$1, %dl
	je	.L3479
	cmpb	$3, %dl
	je	.L3480
.L3444:
	subq	%rax, %rdi
	subq	%rax, %rsi
	leaq	64(%rsp), %rdx
	movq	%rbx, %r9
	movq	%rdi, %r8
	movq	%r10, %rcx
	movq	%rsi, 64(%rsp)
	movq	%rax, 72(%rsp)
	call	_ZNKSt8__format15__formatter_intIcE13_M_format_intINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorESt17basic_string_viewIcSt11char_traitsIcEEyRS7_
	addq	$360, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L3403:
	cmpl	$9, %eax
	jbe	.L3452
	movl	%eax, %ecx
	movl	$1, %r9d
	movl	$3518437209, %r11d
	jmp	.L3423
	.p2align 4,,10
	.p2align 3
.L3419:
	cmpl	$999, %ecx
	jbe	.L3481
	cmpl	$9999, %ecx
	jbe	.L3482
	movl	%ecx, %r8d
	addl	$4, %r9d
	imulq	%r11, %r8
	shrq	$45, %r8
	cmpl	$99999, %ecx
	jbe	.L3420
	movl	%r8d, %ecx
.L3423:
	cmpl	$99, %ecx
	ja	.L3419
	addl	$1, %r9d
.L3420:
	movl	%r9d, %esi
	cmpl	$32, %r9d
	ja	.L3454
	movdqu	.LC25(%rip), %xmm0
	movups	%xmm0, 144(%rsp)
	movdqu	.LC26(%rip), %xmm0
	movups	%xmm0, 160(%rsp)
	movdqu	.LC27(%rip), %xmm0
	movups	%xmm0, 176(%rsp)
	movdqu	.LC28(%rip), %xmm0
	movups	%xmm0, 192(%rsp)
	movdqu	.LC29(%rip), %xmm0
	movups	%xmm0, 208(%rsp)
	movdqu	.LC30(%rip), %xmm0
	movups	%xmm0, 224(%rsp)
	movdqu	.LC31(%rip), %xmm0
	movups	%xmm0, 240(%rsp)
	movdqu	.LC32(%rip), %xmm0
	movups	%xmm0, 256(%rsp)
	movdqu	.LC33(%rip), %xmm0
	movups	%xmm0, 272(%rsp)
	movdqu	.LC34(%rip), %xmm0
	movups	%xmm0, 288(%rsp)
	movdqu	.LC35(%rip), %xmm0
	movups	%xmm0, 304(%rsp)
	movdqu	.LC36(%rip), %xmm0
	movups	%xmm0, 320(%rsp)
	movdqu	.LC37(%rip), %xmm0
	movups	%xmm0, 329(%rsp)
	cmpl	$99, %eax
	jbe	.L3424
	leal	-1(%r9), %ecx
	.p2align 4
	.p2align 3
.L3425:
	movl	%eax, %r8d
	movl	%eax, %r11d
	imulq	$1374389535, %r8, %r8
	shrq	$37, %r8
	imull	$100, %r8d, %r9d
	subl	%r9d, %r11d
	movl	%eax, %r9d
	movl	%r8d, %eax
	movl	%ecx, %r8d
	addl	%r11d, %r11d
	leal	1(%r11), %edi
	movzbl	144(%rsp,%r11), %r11d
	movzbl	144(%rsp,%rdi), %edi
	movb	%dil, 99(%rsp,%r8)
	leal	-1(%rcx), %r8d
	subl	$2, %ecx
	movb	%r11b, 99(%rsp,%r8)
	cmpl	$9999, %r9d
	ja	.L3425
	cmpl	$999, %r9d
	ja	.L3424
.L3418:
	addl	$48, %eax
.L3426:
	leaq	99(%rsp), %rdi
	movb	%al, 99(%rsp)
	leaq	99(%rsp,%rsi), %rsi
	movq	%rdi, %rax
	jmp	.L3416
	.p2align 4,,10
	.p2align 3
.L3400:
	cmpb	$7, %cl
	leaq	.LC42(%rip), %rdi
	leaq	.LC43(%rip), %rcx
	cmove	%rdi, %rcx
	movq	%rcx, %r14
.L3405:
	bsrl	%eax, %r11d
	movl	$32, %r9d
	leaq	99(%rsp), %rdi
	xorl	$31, %r11d
	subl	%r11d, %r9d
	cmpl	$1, %eax
	je	.L3413
	movl	$31, %esi
	leaq	99(%rsp), %rdi
	movl	$30, %r8d
	subl	%r11d, %esi
	subl	%r11d, %r8d
	leaq	(%rdi,%rsi), %rcx
	leaq	98(%rsp,%rsi), %rsi
	subq	%r8, %rsi
	.p2align 5
	.p2align 4
	.p2align 3
.L3414:
	movl	%eax, %r11d
	subq	$1, %rcx
	shrl	%eax
	andl	$1, %r11d
	addl	$48, %r11d
	movb	%r11b, 1(%rcx)
	cmpq	%rcx, %rsi
	jne	.L3414
.L3413:
	leaq	(%rdi,%r9), %rsi
	movl	$49, %eax
	jmp	.L3412
	.p2align 4,,10
	.p2align 3
.L3404:
	leaq	.LC44(%rip), %rdi
	cmpb	$3, %cl
	leaq	.LC45(%rip), %r8
	cmovne	%rdi, %r8
	movq	%r8, %r14
.L3432:
	bsrl	%eax, %r8d
	movdqu	.LC38(%rip), %xmm0
	addl	$4, %r8d
	shrl	$2, %r8d
	movups	%xmm0, 144(%rsp)
	movl	%r8d, %r9d
	cmpl	$255, %eax
	jbe	.L3436
	subl	$1, %r8d
	.p2align 6
	.p2align 4
	.p2align 3
.L3437:
	movl	%eax, %esi
	movl	%r8d, %r11d
	andl	$15, %esi
	movzbl	144(%rsp,%rsi), %esi
	movb	%sil, 99(%rsp,%r11)
	movl	%eax, %r11d
	leal	-1(%r8), %esi
	shrl	$8, %eax
	shrl	$4, %r11d
	subl	$2, %r8d
	andl	$15, %r11d
	movzbl	144(%rsp,%r11), %r11d
	movb	%r11b, 99(%rsp,%rsi)
	cmpl	$255, %eax
	ja	.L3437
.L3436:
	cmpl	$15, %eax
	ja	.L3483
	movzbl	144(%rsp,%rax), %eax
.L3439:
	leaq	99(%rsp), %rdi
	movb	%al, 99(%rsp)
	leaq	(%rdi,%r9), %rsi
	cmpb	$4, %cl
	je	.L3435
.L3434:
	testb	$1, 12(%r10)
	jne	.L3459
.L3471:
	movq	%rdi, %rax
	jmp	.L3416
	.p2align 4,,10
	.p2align 3
.L3408:
	testl	%edx, %edx
	je	.L3472
.L3402:
	bsrl	%eax, %ecx
	leal	3(%rcx), %r8d
	movl	$2863311531, %ecx
	imulq	%rcx, %r8
	shrq	$33, %r8
	movl	%r8d, %r9d
	cmpl	$63, %eax
	jbe	.L3427
	subl	$1, %r8d
	.p2align 6
	.p2align 4
	.p2align 3
.L3428:
	movl	%eax, %ecx
	movl	%r8d, %r11d
	andl	$7, %ecx
	addl	$48, %ecx
	movb	%cl, 99(%rsp,%r11)
	movl	%eax, %ecx
	leal	-1(%r8), %r11d
	shrl	$6, %eax
	shrl	$3, %ecx
	subl	$2, %r8d
	andl	$7, %ecx
	addl	$48, %ecx
	movb	%cl, 99(%rsp,%r11)
	cmpl	$63, %eax
	ja	.L3428
.L3427:
	leal	48(%rax), %ecx
	cmpl	$7, %eax
	ja	.L3484
.L3430:
	leaq	99(%rsp), %rdi
	movb	%cl, 99(%rsp)
	leaq	.LC46(%rip), %r14
	movl	$1, %ecx
	leaq	(%rdi,%r9), %rsi
.L3431:
	movq	%rdi, %rax
	testb	$1, 12(%r10)
	jne	.L3485
.L3416:
	leaq	-1(%rax), %rcx
	testl	%edx, %edx
	jns	.L3443
	movb	$45, -1(%rax)
	movq	%rcx, %rax
	jmp	.L3444
	.p2align 4,,10
	.p2align 3
.L3479:
	movb	$43, -1(%rax)
.L3446:
	movq	%rcx, %rax
	jmp	.L3444
	.p2align 4,,10
	.p2align 3
.L3480:
	movb	$32, -1(%rax)
	jmp	.L3446
	.p2align 4,,10
	.p2align 3
.L3476:
	movzwl	(%r10), %eax
.L3393:
	cmpq	$3, %rax
	jbe	.L3394
	leaq	96(%rsp), %rax
	leaq	95(%rsp), %r8
	movq	.LC48(%rip), %xmm0
	movq	%r10, 400(%rsp)
	movq	%rax, %xmm1
	movq	%rax, 168(%rsp)
	leaq	144(%rsp), %rcx
	leaq	64(%rsp), %rdx
	movq	%r8, 72(%rsp)
	punpcklqdq	%xmm1, %xmm0
	movl	$1, %eax
	movl	$2, %r8d
	movq	$12, 160(%rsp)
	movq	%rax, 64(%rsp)
	movups	%xmm0, 144(%rsp)
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
	movq	152(%rsp), %rcx
	movq	%rbx, %r8
	movq	168(%rsp), %rax
	movl	$3, %edx
	movq	400(%rsp), %r9
	subq	%rcx, %rax
	cmpb	$92, 1(%rcx)
	movl	$1, 32(%rsp)
	cmove	%rax, %rdx
	movq	%rcx, 72(%rsp)
	leaq	64(%rsp), %rcx
	movq	%rax, 64(%rsp)
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	jmp	.L3397
	.p2align 4,,10
	.p2align 3
.L3484:
	movl	%eax, %ecx
	shrl	$3, %eax
	andl	$7, %ecx
	addl	$48, %ecx
	movb	%cl, 100(%rsp)
	leal	48(%rax), %ecx
	jmp	.L3430
	.p2align 4,,10
	.p2align 3
.L3483:
	movl	%eax, %r8d
	shrl	$4, %eax
	andl	$15, %r8d
	movzbl	144(%rsp,%r8), %r8d
	movb	%r8b, 100(%rsp)
	movzbl	144(%rsp,%rax), %eax
	jmp	.L3439
	.p2align 4,,10
	.p2align 3
.L3424:
	addl	%eax, %eax
	leal	1(%rax), %ecx
	movzbl	144(%rsp,%rax), %eax
	movzbl	144(%rsp,%rcx), %ecx
	movb	%cl, 100(%rsp)
	jmp	.L3426
	.p2align 4,,10
	.p2align 3
.L3458:
	leaq	100(%rsp), %rsi
	leaq	.LC44(%rip), %r14
	leaq	99(%rsp), %rdi
.L3435:
	movq	%rdi, %r11
	.p2align 4
	.p2align 3
.L3440:
	movsbl	(%r11), %ecx
	movl	%edx, 408(%rsp)
	movq	%r10, 400(%rsp)
	movq	%r11, 56(%rsp)
	call	toupper
	movq	56(%rsp), %r11
	movq	400(%rsp), %r10
	movl	408(%rsp), %edx
	movb	%al, (%r11)
	addq	$1, %r11
	cmpq	%rsi, %r11
	jne	.L3440
	movl	$2, %ecx
	jmp	.L3431
	.p2align 4,,10
	.p2align 3
.L3478:
	testl	%edx, %edx
	jne	.L3456
	movb	$48, 99(%rsp)
	leaq	100(%rsp), %rsi
	leaq	99(%rsp), %rdi
	leaq	.LC45(%rip), %r14
	jmp	.L3434
	.p2align 4,,10
	.p2align 3
.L3477:
	movzwl	(%r10), %ecx
	movq	%r8, %rdx
	movq	%r10, 400(%rsp)
	call	_ZNKSt8__format5_SpecIcE12_M_get_widthISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
	movq	400(%rsp), %r10
	jmp	.L3393
	.p2align 4,,10
	.p2align 3
.L3481:
	addl	$2, %r9d
	jmp	.L3420
	.p2align 4,,10
	.p2align 3
.L3482:
	addl	$3, %r9d
	jmp	.L3420
	.p2align 4,,10
	.p2align 3
.L3457:
	leaq	.LC44(%rip), %r14
	jmp	.L3432
.L3485:
	movq	%rcx, %rax
	negq	%rax
	jmp	.L3415
.L3454:
	leaq	131(%rsp), %rsi
	leaq	99(%rsp), %rdi
	jmp	.L3471
.L3456:
	leaq	.LC45(%rip), %r14
	jmp	.L3432
.L3452:
	movl	$1, %esi
	jmp	.L3418
.L3389:
	leaq	.LC47(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatIxNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt8__format15__formatter_intIcE6formatIxNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	.def	_ZNKSt8__format15__formatter_intIcE6formatIxNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format15__formatter_intIcE6formatIxNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
_ZNKSt8__format15__formatter_intIcE6formatIxNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_:
.LFB7698:
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$408, %rsp
	.seh_stackalloc	408
	.seh_endprologue
	movzbl	24(%rcx), %eax
	andl	$15, %eax
	movq	%rcx, %rbx
	movq	%rdx, %r11
	movq	%r8, %rsi
	movq	%rdx, %r10
	cmpb	$2, %al
	je	.L3572
	testq	%rdx, %rdx
	js	.L3573
	leaq	.L3506(%rip), %rcx
	movzbl	%al, %edx
	movslq	(%rcx,%rdx,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section .rdata,"dr"
	.align 4
.L3506:
	.long	.L3508-.L3506
	.long	.L3505-.L3506
	.long	.L3505-.L3506
	.long	.L3509-.L3506
	.long	.L3509-.L3506
	.long	.L3508-.L3506
	.long	.L3507-.L3506
	.long	.L3505-.L3506
	.long	.L3505-.L3506
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatIxNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L3573:
	leaq	.L3500(%rip), %rcx
	movzbl	%al, %edx
	negq	%r10
	movslq	(%rcx,%rdx,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section .rdata,"dr"
	.align 4
.L3500:
	.long	.L3502-.L3500
	.long	.L3499-.L3500
	.long	.L3499-.L3500
	.long	.L3503-.L3500
	.long	.L3503-.L3500
	.long	.L3502-.L3500
	.long	.L3501-.L3500
	.long	.L3499-.L3500
	.long	.L3499-.L3500
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatIxNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L3572:
	leaq	128(%rdx), %rax
	cmpq	$255, %rax
	ja	.L3488
	movb	%dl, 111(%rsp)
	testb	$1, 20(%rcx)
	je	.L3574
	movzbl	16(%rcx), %eax
	andl	$3, %eax
	cmpb	$1, %al
	je	.L3575
	cmpb	$2, %al
	je	.L3576
.L3493:
	leaq	111(%rsp), %rcx
	movl	$1, %eax
	leaq	80(%rsp), %rdx
	movl	$2, %r8d
	movq	%rcx, 88(%rsp)
	movq	16(%rsi), %rcx
	movq	%rax, 80(%rsp)
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
.L3496:
	addq	$408, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L3574:
	movl	$1, 32(%rsp)
	leaq	111(%rsp), %rcx
	movl	$1, %eax
	movq	%rbx, %r9
	movq	%rcx, 88(%rsp)
	movl	$1, %edx
	leaq	80(%rsp), %rcx
	movq	%rax, 80(%rsp)
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	addq	$408, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L3509:
	cmpb	$3, %al
	je	.L3577
	testq	%r11, %r11
	jne	.L3556
	movb	$48, 115(%rsp)
	cmpb	$4, %al
	je	.L3557
	leaq	.LC44(%rip), %r9
	leaq	116(%rsp), %rdi
	leaq	115(%rsp), %r8
	jmp	.L3533
	.p2align 4,,10
	.p2align 3
.L3505:
	cmpb	$7, %al
	leaq	.LC43(%rip), %r9
	leaq	.LC42(%rip), %rax
	cmove	%rax, %r9
	testq	%r11, %r11
	jne	.L3504
	leaq	116(%rsp), %rdi
	leaq	115(%rsp), %r8
	movl	$48, %eax
.L3511:
	movb	%al, 115(%rsp)
	testb	$1, 12(%rbx)
	je	.L3570
.L3558:
	movq	$-2, %rax
	movl	$2, %ecx
.L3514:
	addq	%r8, %rax
	movl	%ecx, %edx
	testl	%ecx, %ecx
	je	.L3515
	xorl	%ecx, %ecx
.L3540:
	movl	%ecx, %r10d
	addl	$1, %ecx
	movzbl	(%r9,%r10), %r14d
	movb	%r14b, (%rax,%r10)
	cmpl	%edx, %ecx
	jb	.L3540
	jmp	.L3515
	.p2align 4,,10
	.p2align 3
.L3508:
	testq	%r11, %r11
	jne	.L3502
.L3571:
	movb	$48, 115(%rsp)
	leaq	115(%rsp), %r8
	leaq	116(%rsp), %rdi
	movq	%r8, %rax
	leaq	114(%rsp), %r9
.L3542:
	movzbl	8(%rbx), %ecx
	shrb	$2, %cl
	andl	$3, %ecx
	cmpb	$1, %cl
	je	.L3578
	cmpb	$3, %cl
	je	.L3579
.L3543:
	subq	%rax, %rdi
	leaq	80(%rsp), %rdx
	movq	%rsi, %r9
	subq	%rax, %r8
	movq	%rbx, %rcx
	movq	%rdi, 80(%rsp)
	movq	%rax, 88(%rsp)
	call	_ZNKSt8__format15__formatter_intIcE13_M_format_intINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorESt17basic_string_viewIcSt11char_traitsIcEEyRS7_
	addq	$408, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r14
	ret
	.p2align 4,,10
	.p2align 3
.L3502:
	cmpq	$9, %r10
	jbe	.L3551
	movq	%r10, %rcx
	movl	$1, %r8d
	movabsq	$3777893186295716171, %r9
	jmp	.L3522
	.p2align 4,,10
	.p2align 3
.L3518:
	cmpq	$999, %rcx
	jbe	.L3580
	cmpq	$9999, %rcx
	jbe	.L3581
	movq	%rcx, %rax
	addl	$4, %r8d
	mulq	%r9
	cmpq	$99999, %rcx
	jbe	.L3519
	shrq	$11, %rdx
	movq	%rdx, %rcx
.L3522:
	cmpq	$99, %rcx
	ja	.L3518
	addl	$1, %r8d
.L3519:
	movl	%r8d, %r9d
	cmpl	$64, %r8d
	ja	.L3553
	movdqu	.LC25(%rip), %xmm0
	movups	%xmm0, 192(%rsp)
	movdqu	.LC26(%rip), %xmm0
	movups	%xmm0, 208(%rsp)
	movdqu	.LC27(%rip), %xmm0
	movups	%xmm0, 224(%rsp)
	movdqu	.LC28(%rip), %xmm0
	movups	%xmm0, 240(%rsp)
	movdqu	.LC29(%rip), %xmm0
	movups	%xmm0, 256(%rsp)
	movdqu	.LC30(%rip), %xmm0
	movups	%xmm0, 272(%rsp)
	movdqu	.LC31(%rip), %xmm0
	movups	%xmm0, 288(%rsp)
	movdqu	.LC32(%rip), %xmm0
	movups	%xmm0, 304(%rsp)
	movdqu	.LC33(%rip), %xmm0
	movups	%xmm0, 320(%rsp)
	movdqu	.LC34(%rip), %xmm0
	movups	%xmm0, 336(%rsp)
	movdqu	.LC35(%rip), %xmm0
	movups	%xmm0, 352(%rsp)
	movdqu	.LC36(%rip), %xmm0
	movups	%xmm0, 368(%rsp)
	movdqu	.LC37(%rip), %xmm0
	movups	%xmm0, 377(%rsp)
	cmpq	$99, %r10
	jbe	.L3523
	movabsq	$2951479051793528259, %rdi
	leal	-1(%r8), %ecx
	.p2align 4
	.p2align 3
.L3524:
	movq	%r10, %rdx
	shrq	$2, %rdx
	movq	%rdx, %rax
	mulq	%rdi
	movq	%r10, %rax
	shrq	$2, %rdx
	imulq	$100, %rdx, %r8
	subq	%r8, %rax
	movq	%r10, %r8
	movq	%rdx, %r10
	movl	%ecx, %edx
	movzbl	193(%rsp,%rax,2), %r14d
	movzbl	192(%rsp,%rax,2), %eax
	movb	%r14b, 115(%rsp,%rdx)
	leal	-1(%rcx), %edx
	subl	$2, %ecx
	movb	%al, 115(%rsp,%rdx)
	cmpq	$9999, %r8
	ja	.L3524
	cmpq	$999, %r8
	ja	.L3523
.L3517:
	addl	$48, %r10d
.L3525:
	leaq	115(%rsp), %r8
	movb	%r10b, 115(%rsp)
	leaq	115(%rsp,%r9), %rdi
	movq	%r8, %rax
	jmp	.L3515
	.p2align 4,,10
	.p2align 3
.L3499:
	cmpb	$7, %al
	leaq	.LC42(%rip), %r9
	leaq	.LC43(%rip), %rax
	cmovne	%rax, %r9
.L3504:
	bsrq	%r10, %rcx
	leaq	115(%rsp), %r8
	movl	$64, %edx
	xorq	$63, %rcx
	subl	%ecx, %edx
	cmpq	$1, %r10
	je	.L3512
	movl	$63, %edi
	leaq	115(%rsp), %r8
	movl	$62, %r14d
	subl	%ecx, %edi
	subl	%ecx, %r14d
	leaq	(%r8,%rdi), %rax
	leaq	114(%rsp,%rdi), %rdi
	subq	%r14, %rdi
	.p2align 5
	.p2align 4
	.p2align 3
.L3513:
	movl	%r10d, %ecx
	subq	$1, %rax
	shrq	%r10
	andl	$1, %ecx
	addl	$48, %ecx
	movb	%cl, 1(%rax)
	cmpq	%rax, %rdi
	jne	.L3513
.L3512:
	leaq	(%r8,%rdx), %rdi
	movl	$49, %eax
	jmp	.L3511
	.p2align 4,,10
	.p2align 3
.L3503:
	leaq	.LC44(%rip), %r9
	cmpb	$3, %al
	leaq	.LC45(%rip), %rdx
	cmove	%rdx, %r9
.L3531:
	bsrq	%r10, %rdx
	movdqu	.LC38(%rip), %xmm0
	leal	4(%rdx), %ecx
	shrl	$2, %ecx
	movups	%xmm0, 192(%rsp)
	movl	%ecx, %edx
	cmpq	$255, %r10
	jbe	.L3535
	subl	$1, %ecx
	.p2align 4
	.p2align 3
.L3536:
	movq	%r10, %rdi
	movl	%ecx, %r8d
	andl	$15, %edi
	movzbl	192(%rsp,%rdi), %edi
	movb	%dil, 115(%rsp,%r8)
	movq	%r10, %r8
	leal	-1(%rcx), %edi
	shrq	$8, %r10
	shrq	$4, %r8
	subl	$2, %ecx
	andl	$15, %r8d
	movzbl	192(%rsp,%r8), %r8d
	movb	%r8b, 115(%rsp,%rdi)
	cmpq	$255, %r10
	ja	.L3536
.L3535:
	cmpq	$15, %r10
	ja	.L3582
	movzbl	192(%rsp,%r10), %ecx
.L3538:
	leaq	115(%rsp), %r8
	movb	%cl, 115(%rsp)
	leaq	(%r8,%rdx), %rdi
	cmpb	$4, %al
	je	.L3534
.L3533:
	testb	$1, 12(%rbx)
	jne	.L3558
.L3570:
	movq	%r8, %rax
	jmp	.L3515
	.p2align 4,,10
	.p2align 3
.L3507:
	testq	%r11, %r11
	je	.L3571
.L3501:
	bsrq	%r10, %rax
	leal	3(%rax), %ecx
	movl	$2863311531, %eax
	imulq	%rax, %rcx
	shrq	$33, %rcx
	movl	%ecx, %edx
	cmpq	$63, %r10
	jbe	.L3526
	subl	$1, %ecx
	.p2align 6
	.p2align 4
	.p2align 3
.L3527:
	movq	%r10, %rax
	movl	%ecx, %r8d
	andl	$7, %eax
	addl	$48, %eax
	movb	%al, 115(%rsp,%r8)
	movq	%r10, %rax
	leal	-1(%rcx), %r8d
	shrq	$6, %r10
	shrq	$3, %rax
	subl	$2, %ecx
	andl	$7, %eax
	addl	$48, %eax
	movb	%al, 115(%rsp,%r8)
	cmpq	$63, %r10
	ja	.L3527
.L3526:
	leal	48(%r10), %eax
	cmpq	$7, %r10
	ja	.L3583
.L3529:
	movb	%al, 115(%rsp)
	leaq	115(%rsp), %r8
	movl	$1, %ecx
	leaq	.LC46(%rip), %r9
	leaq	(%r8,%rdx), %rdi
.L3530:
	movq	%r8, %rax
	testb	$1, 12(%rbx)
	jne	.L3584
.L3515:
	leaq	-1(%rax), %r9
	testq	%r11, %r11
	jns	.L3542
	movb	$45, -1(%rax)
	movq	%r9, %rax
	jmp	.L3543
	.p2align 4,,10
	.p2align 3
.L3578:
	movb	$43, -1(%rax)
.L3545:
	movq	%r9, %rax
	jmp	.L3543
	.p2align 4,,10
	.p2align 3
.L3579:
	movb	$32, -1(%rax)
	jmp	.L3545
	.p2align 4,,10
	.p2align 3
.L3575:
	movzwl	(%rcx), %eax
.L3492:
	cmpq	$3, %rax
	jbe	.L3493
	leaq	112(%rsp), %rax
	leaq	111(%rsp), %r8
	movq	.LC48(%rip), %xmm0
	movq	$12, 208(%rsp)
	movq	%rax, %xmm1
	movq	%rax, 216(%rsp)
	leaq	192(%rsp), %rcx
	leaq	80(%rsp), %rdx
	movq	%r8, 88(%rsp)
	punpcklqdq	%xmm1, %xmm0
	movl	$1, %eax
	movl	$2, %r8d
	movq	%rax, 80(%rsp)
	movups	%xmm0, 192(%rsp)
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
	movl	$3, %edx
	movq	%rbx, %r9
	movq	%rsi, %r8
	movq	200(%rsp), %rcx
	movq	216(%rsp), %rax
	subq	%rcx, %rax
	cmpb	$92, 1(%rcx)
	movl	$1, 32(%rsp)
	cmove	%rax, %rdx
	movq	%rcx, 88(%rsp)
	leaq	80(%rsp), %rcx
	movq	%rax, 80(%rsp)
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	jmp	.L3496
	.p2align 4,,10
	.p2align 3
.L3583:
	movq	%r10, %rax
	andl	$7, %eax
	addl	$48, %eax
	movb	%al, 116(%rsp)
	movq	%r10, %rax
	shrq	$3, %rax
	addl	$48, %eax
	jmp	.L3529
	.p2align 4,,10
	.p2align 3
.L3582:
	movq	%r10, %rcx
	shrq	$4, %r10
	andl	$15, %ecx
	movzbl	192(%rsp,%rcx), %ecx
	movb	%cl, 116(%rsp)
	movzbl	192(%rsp,%r10), %ecx
	jmp	.L3538
	.p2align 4,,10
	.p2align 3
.L3523:
	movzbl	193(%rsp,%r10,2), %eax
	movzbl	192(%rsp,%r10,2), %r10d
	movb	%al, 116(%rsp)
	jmp	.L3525
	.p2align 4,,10
	.p2align 3
.L3557:
	leaq	116(%rsp), %rdi
	leaq	.LC44(%rip), %r9
	leaq	115(%rsp), %r8
.L3534:
	movq	%r8, %r10
	.p2align 4
	.p2align 3
.L3539:
	movsbl	(%r10), %ecx
	movq	%r8, 72(%rsp)
	movq	%r11, 456(%rsp)
	movq	%r9, 64(%rsp)
	movq	%r10, 56(%rsp)
	call	toupper
	movq	56(%rsp), %r10
	movq	64(%rsp), %r9
	movq	456(%rsp), %r11
	movq	72(%rsp), %r8
	movb	%al, (%r10)
	addq	$1, %r10
	cmpq	%rdi, %r10
	jne	.L3539
	movl	$2, %ecx
	jmp	.L3530
	.p2align 4,,10
	.p2align 3
.L3577:
	testq	%r11, %r11
	jne	.L3555
	movb	$48, 115(%rsp)
	leaq	116(%rsp), %rdi
	leaq	115(%rsp), %r8
	leaq	.LC45(%rip), %r9
	jmp	.L3533
	.p2align 4,,10
	.p2align 3
.L3576:
	movzwl	(%rcx), %ecx
	movq	%r8, %rdx
	call	_ZNKSt8__format5_SpecIcE12_M_get_widthISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
	jmp	.L3492
	.p2align 4,,10
	.p2align 3
.L3580:
	addl	$2, %r8d
	jmp	.L3519
	.p2align 4,,10
	.p2align 3
.L3581:
	addl	$3, %r8d
	jmp	.L3519
	.p2align 4,,10
	.p2align 3
.L3556:
	leaq	.LC44(%rip), %r9
	jmp	.L3531
.L3584:
	movq	%rcx, %rax
	negq	%rax
	jmp	.L3514
.L3553:
	leaq	179(%rsp), %rdi
	leaq	115(%rsp), %r8
	jmp	.L3570
.L3555:
	leaq	.LC45(%rip), %r9
	jmp	.L3531
.L3551:
	movl	$1, %r9d
	jmp	.L3517
.L3488:
	leaq	.LC47(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatIoNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt8__format15__formatter_intIcE6formatIoNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	.def	_ZNKSt8__format15__formatter_intIcE6formatIoNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format15__formatter_intIcE6formatIoNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
_ZNKSt8__format15__formatter_intIcE6formatIoNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_:
.LFB7726:
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
	subq	$504, %rsp
	.seh_stackalloc	504
	.seh_endprologue
	movzbl	24(%rcx), %eax
	movq	(%rdx), %r10
	movq	8(%rdx), %r11
	andl	$15, %eax
	movq	%rcx, %rbx
	movq	%r8, %rbp
	cmpb	$2, %al
	je	.L3670
	leaq	.L3598(%rip), %rcx
	movzbl	%al, %edx
	movslq	(%rcx,%rdx,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section .rdata,"dr"
	.align 4
.L3598:
	.long	.L3600-.L3598
	.long	.L3597-.L3598
	.long	.L3597-.L3598
	.long	.L3601-.L3598
	.long	.L3601-.L3598
	.long	.L3600-.L3598
	.long	.L3599-.L3598
	.long	.L3597-.L3598
	.long	.L3597-.L3598
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatIoNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L3670:
	movl	$127, %eax
	cmpq	%r10, %rax
	movl	$0, %eax
	sbbq	%r11, %rax
	jc	.L3587
	movb	%r10b, 143(%rsp)
	testb	$1, 20(%rcx)
	je	.L3671
	movzbl	16(%rcx), %eax
	andl	$3, %eax
	cmpb	$1, %al
	je	.L3672
	cmpb	$2, %al
	je	.L3673
.L3592:
	movl	$1, %eax
	leaq	143(%rsp), %rcx
	leaq	112(%rsp), %rdx
	movl	$2, %r8d
	movq	%rcx, 120(%rsp)
	movq	16(%rbp), %rcx
	movq	%rax, 112(%rsp)
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
.L3595:
	addq	$504, %rsp
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
.L3601:
	movq	%r10, %rdx
	cmpb	$3, %al
	je	.L3674
	orq	%r11, %rdx
	jne	.L3654
	movb	$48, 147(%rsp)
	cmpb	$4, %al
	je	.L3655
	leaq	.LC44(%rip), %r12
	leaq	148(%rsp), %rsi
	leaq	147(%rsp), %r8
	jmp	.L3631
	.p2align 4,,10
	.p2align 3
.L3597:
	cmpb	$7, %al
	leaq	.LC43(%rip), %r12
	leaq	.LC42(%rip), %rax
	cmove	%rax, %r12
	movq	%r10, %rax
	orq	%r11, %rax
	je	.L3647
	testq	%r11, %r11
	jne	.L3675
	bsrq	%r10, %rax
	xorq	$63, %rax
	leal	64(%rax), %r8d
	cmpl	$63, %eax
	je	.L3648
	movl	$128, %edx
	movl	$127, %ecx
	subl	%r8d, %edx
	subl	%r8d, %ecx
.L3605:
	movl	%ecx, %esi
	leaq	147(%rsp), %r8
	subl	$1, %ecx
	leaq	(%r8,%rsi), %rax
	leaq	146(%rsp,%rsi), %rsi
	subq	%rcx, %rsi
	.p2align 5
	.p2align 4
	.p2align 3
.L3607:
	movl	%r10d, %ecx
	subq	$1, %rax
	shrdq	$1, %r11, %r10
	andl	$1, %ecx
	shrq	%r11
	addl	$48, %ecx
	movb	%cl, 1(%rax)
	cmpq	%rsi, %rax
	jne	.L3607
.L3606:
	leaq	(%r8,%rdx), %rsi
	movl	$49, %eax
	jmp	.L3603
	.p2align 4,,10
	.p2align 3
.L3600:
	movq	%r10, %rax
	orq	%r11, %rax
	je	.L3620
	movl	$9, %eax
	cmpq	%r10, %rax
	movl	$0, %eax
	sbbq	%r11, %rax
	jnc	.L3650
	movq	%r10, 64(%rsp)
	movq	%r10, %r13
	movq	%r11, %r12
	movl	$99, %esi
	movq	%r11, 72(%rsp)
	movl	$1, %r15d
	xorl	%r14d, %r14d
	movl	$999, %edi
	jmp	.L3616
	.p2align 4,,10
	.p2align 3
.L3612:
	cmpq	%r13, %rdi
	movq	%r14, %rax
	sbbq	%r12, %rax
	jnc	.L3676
	movl	$9999, %eax
	cmpq	%r13, %rax
	movq	%r14, %rax
	sbbq	%r12, %rax
	jnc	.L3677
	leaq	96(%rsp), %rcx
	leaq	80(%rsp), %rdx
	movq	%r13, 96(%rsp)
	addl	$4, %r15d
	movq	%r12, 104(%rsp)
	movq	$10000, 80(%rsp)
	movq	$0, 88(%rsp)
	call	__udivti3
	movl	$99999, %ecx
	cmpq	%r13, %rcx
	movq	%r14, %rcx
	movups	%xmm0, 48(%rsp)
	sbbq	%r12, %rcx
	jnc	.L3678
	movq	48(%rsp), %r13
	movq	56(%rsp), %r12
.L3616:
	cmpq	%r13, %rsi
	movq	%r14, %rax
	sbbq	%r12, %rax
	jc	.L3612
	movq	64(%rsp), %r10
	movq	72(%rsp), %r11
	addl	$1, %r15d
.L3613:
	movl	%r15d, %r8d
	cmpl	$128, %r15d
	ja	.L3652
	movdqu	.LC25(%rip), %xmm0
	movl	$99, %eax
	leaq	288(%rsp), %rsi
	cmpq	%r10, %rax
	movl	$0, %eax
	movups	%xmm0, 288(%rsp)
	movdqu	.LC26(%rip), %xmm0
	sbbq	%r11, %rax
	movups	%xmm0, 304(%rsp)
	movdqu	.LC27(%rip), %xmm0
	movups	%xmm0, 320(%rsp)
	movdqu	.LC28(%rip), %xmm0
	movups	%xmm0, 336(%rsp)
	movdqu	.LC29(%rip), %xmm0
	movups	%xmm0, 352(%rsp)
	movdqu	.LC30(%rip), %xmm0
	movups	%xmm0, 368(%rsp)
	movdqu	.LC31(%rip), %xmm0
	movups	%xmm0, 384(%rsp)
	movdqu	.LC32(%rip), %xmm0
	movups	%xmm0, 400(%rsp)
	movdqu	.LC33(%rip), %xmm0
	movups	%xmm0, 416(%rsp)
	movdqu	.LC34(%rip), %xmm0
	movups	%xmm0, 432(%rsp)
	movdqu	.LC35(%rip), %xmm0
	movups	%xmm0, 448(%rsp)
	movdqu	.LC36(%rip), %xmm0
	movups	%xmm0, 464(%rsp)
	movdqu	.LC37(%rip), %xmm0
	movups	%xmm0, 473(%rsp)
	jnc	.L3617
	movq	%r8, 64(%rsp)
	leal	-1(%r15), %edi
	leaq	288(%rsp), %rsi
	xorl	%r12d, %r12d
	movq	%rbx, 576(%rsp)
	movabsq	$1152921504606846975, %r14
	movabsq	$-8116567392432202711, %r13
	movabsq	$2951479051793528258, %r15
	movq	%rbp, 592(%rsp)
	.p2align 4
	.p2align 3
.L3618:
	movq	%r10, %rax
	movq	%r10, %rcx
	movq	%r10, %r8
	xorl	%ebx, %ebx
	shrdq	$60, %r11, %rax
	andq	%r14, %rcx
	movq	%r11, %r9
	andq	%r14, %rax
	addq	%rax, %rcx
	movq	%r11, %rax
	shrq	$56, %rax
	addq	%rax, %rcx
	movabsq	$5165088340638674453, %rax
	mulq	%rcx
	movq	%rcx, %rax
	subq	%rdx, %rax
	shrq	%rax
	addq	%rax, %rdx
	shrq	$4, %rdx
	leaq	(%rdx,%rdx,4), %rax
	leaq	(%rax,%rax,4), %rax
	subq	%rax, %rcx
	subq	%rcx, %r8
	sbbq	%rbx, %r9
	movq	%r8, %rax
	movq	%r9, %rbp
	imulq	%r15, %rax
	imulq	%r13, %rbp
	addq	%rax, %rbp
	movq	%r8, %rax
	mulq	%r13
	addq	%rdx, %rbp
	movq	%rax, %r8
	andl	$3, %eax
	movq	%rbp, %r9
	movl	$25, %ebp
	mulq	%rbp
	addq	%rcx, %rax
	xorl	%edx, %edx
	movq	%r10, %rcx
	addq	%rax, %rax
	movq	%rax, 48(%rsp)
	movq	48(%rsp), %rax
	adcq	%rdx, %rdx
	shrdq	$2, %r9, %r8
	shrq	$2, %r9
	movq	%rdx, 56(%rsp)
	movq	%r11, %rdx
	movq	%r8, %r10
	movq	%r9, %r11
	movzbl	1(%rsi,%rax), %r9d
	movl	%edi, %r8d
	movzbl	(%rax,%rsi), %eax
	movb	%r9b, 147(%rsp,%r8)
	leal	-1(%rdi), %r8d
	subl	$2, %edi
	movb	%al, 147(%rsp,%r8)
	movl	$9999, %eax
	cmpq	%rcx, %rax
	movq	%r12, %rax
	sbbq	%rdx, %rax
	jc	.L3618
	movl	$999, %eax
	movq	64(%rsp), %r8
	movq	576(%rsp), %rbx
	cmpq	%rcx, %rax
	movq	592(%rsp), %rbp
	sbbq	%rdx, %r12
	jc	.L3617
.L3611:
	addl	$48, %r10d
.L3619:
	leaq	147(%rsp,%r8), %rsi
	leaq	147(%rsp), %r8
	movb	%r10b, 147(%rsp)
	movq	%r8, %rcx
	jmp	.L3609
	.p2align 4,,10
	.p2align 3
.L3671:
	movl	$1, 32(%rsp)
	movl	$1, %eax
	movq	%rbx, %r9
	movl	$1, %edx
	leaq	143(%rsp), %rcx
	movq	%rax, 112(%rsp)
	movq	%rcx, 120(%rsp)
	leaq	112(%rsp), %rcx
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	jmp	.L3595
	.p2align 4,,10
	.p2align 3
.L3599:
	movq	%r10, %rax
	orq	%r11, %rax
	je	.L3620
	testq	%r11, %r11
	je	.L3679
	bsrq	%r11, %rax
	movl	$2863311531, %edx
	addl	$67, %eax
	imulq	%rdx, %rax
	shrq	$33, %rax
	movl	%eax, %edx
	subl	$1, %eax
.L3623:
	movl	$63, %r9d
	xorl	%r8d, %r8d
	movq	%rbx, %rsi
	.p2align 4
	.p2align 3
.L3625:
	movq	%r10, %rcx
	movl	%eax, %edi
	leal	-1(%rax), %ebx
	subl	$2, %eax
	andl	$7, %ecx
	addl	$48, %ecx
	movb	%cl, 147(%rsp,%rdi)
	movq	%r10, %rcx
	shrdq	$6, %r11, %r10
	movq	%r8, %rdi
	shrdq	$3, %r11, %rcx
	shrq	$6, %r11
	andl	$7, %ecx
	cmpq	%r10, %r9
	leal	48(%rcx), %ecx
	sbbq	%r11, %rdi
	movb	%cl, 147(%rsp,%rbx)
	jc	.L3625
	movq	%rsi, %rbx
.L3624:
	movl	$7, %eax
	cmpq	%r10, %rax
	movl	$0, %eax
	sbbq	%r11, %rax
	jnc	.L3626
	movq	%r10, %r8
	shrdq	$3, %r11, %r10
	andl	$7, %r8d
	addl	$48, %r10d
	addl	$48, %r8d
	movb	%r8b, 148(%rsp)
.L3627:
	movb	%r10b, 147(%rsp)
	leaq	147(%rsp), %r8
	movl	$1, %eax
	leaq	.LC46(%rip), %r12
	leaq	(%r8,%rdx), %rsi
.L3628:
	movq	%r8, %rcx
	testb	$1, 12(%rbx)
	je	.L3609
	movq	%rax, %rcx
	negq	%rcx
	jmp	.L3608
	.p2align 4,,10
	.p2align 3
.L3620:
	movb	$48, 147(%rsp)
	leaq	147(%rsp), %r8
	leaq	148(%rsp), %rsi
	movq	%r8, %rcx
.L3609:
	movzbl	8(%rbx), %eax
	leaq	-1(%rcx), %rdx
	shrb	$2, %al
	andl	$3, %eax
	cmpb	$1, %al
	je	.L3680
	cmpb	$3, %al
	je	.L3681
.L3644:
	subq	%rcx, %rsi
	movq	%rcx, 120(%rsp)
	subq	%rcx, %r8
	leaq	112(%rsp), %rdx
	movq	%rbp, %r9
	movq	%rbx, %rcx
	movq	%rsi, 112(%rsp)
	call	_ZNKSt8__format15__formatter_intIcE13_M_format_intINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorESt17basic_string_viewIcSt11char_traitsIcEEyRS7_
	jmp	.L3595
	.p2align 4,,10
	.p2align 3
.L3680:
	movb	$43, -1(%rcx)
.L3643:
	movq	%rdx, %rcx
	jmp	.L3644
	.p2align 4,,10
	.p2align 3
.L3681:
	movb	$32, -1(%rcx)
	jmp	.L3643
	.p2align 4,,10
	.p2align 3
.L3647:
	movl	$48, %eax
	leaq	148(%rsp), %rsi
	leaq	147(%rsp), %r8
.L3603:
	movb	%al, 147(%rsp)
	testb	$1, 12(%rbx)
	je	.L3669
.L3656:
	movq	$-2, %rcx
	movl	$2, %eax
.L3608:
	addq	%r8, %rcx
	movl	%eax, %r10d
	testl	%eax, %eax
	je	.L3609
	xorl	%eax, %eax
.L3640:
	movl	%eax, %edx
	addl	$1, %eax
	movzbl	(%r12,%rdx), %r9d
	movb	%r9b, (%rcx,%rdx)
	cmpl	%r10d, %eax
	jb	.L3640
	jmp	.L3609
	.p2align 4,,10
	.p2align 3
.L3654:
	leaq	.LC44(%rip), %r12
.L3630:
	testq	%r11, %r11
	jne	.L3682
	bsrq	%r10, %rdx
	movdqu	.LC38(%rip), %xmm0
	movl	$255, %r8d
	leaq	288(%rsp), %rsi
	leal	4(%rdx), %ecx
	shrl	$2, %ecx
	cmpq	%r10, %r8
	movups	%xmm0, 288(%rsp)
	movl	%ecx, %edx
	jnb	.L3635
	subl	$1, %ecx
.L3634:
	movl	$255, %r14d
	xorl	%r13d, %r13d
	movl	%eax, %r9d
	movq	%rdx, %r8
	leaq	288(%rsp), %rsi
	.p2align 4
	.p2align 3
.L3636:
	movq	%r10, %rax
	movl	%ecx, %edi
	xorl	%edx, %edx
	andl	$15, %eax
	movq	%rdx, 56(%rsp)
	leal	-1(%rcx), %edx
	subl	$2, %ecx
	movzbl	(%rsi,%rax), %eax
	movb	%al, 147(%rsp,%rdi)
	movq	%r10, %rax
	shrdq	$8, %r11, %r10
	shrdq	$4, %r11, %rax
	shrq	$8, %r11
	andl	$15, %eax
	cmpq	%r10, %r14
	movq	%rax, 48(%rsp)
	movq	48(%rsp), %rax
	movzbl	(%rax,%rsi), %eax
	movb	%al, 147(%rsp,%rdx)
	movq	%r13, %rax
	sbbq	%r11, %rax
	jc	.L3636
	movl	%r9d, %eax
	movq	%r8, %rdx
.L3635:
	movl	$15, %ecx
	cmpq	%r10, %rcx
	movl	$0, %ecx
	sbbq	%r11, %rcx
	jnc	.L3637
	movq	%r10, %r8
	andl	$15, %r8d
	movzbl	(%rsi,%r8), %ecx
	movb	%cl, 148(%rsp)
	movq	%r10, %rcx
	shrdq	$4, %r11, %rcx
	movzbl	(%rcx,%rsi), %ecx
.L3638:
	leaq	147(%rsp), %r8
	movb	%cl, 147(%rsp)
	leaq	(%r8,%rdx), %rsi
	cmpb	$4, %al
	je	.L3632
.L3631:
	testb	$1, 12(%rbx)
	jne	.L3656
.L3669:
	movq	%r8, %rcx
	jmp	.L3609
	.p2align 4,,10
	.p2align 3
.L3672:
	movzwl	(%rcx), %eax
.L3591:
	cmpq	$3, %rax
	jbe	.L3592
	leaq	144(%rsp), %rax
	leaq	143(%rsp), %r8
	movq	.LC48(%rip), %xmm0
	movq	$12, 304(%rsp)
	movq	%rax, %xmm1
	movq	%rax, 312(%rsp)
	leaq	288(%rsp), %rcx
	leaq	112(%rsp), %rdx
	movq	%r8, 120(%rsp)
	punpcklqdq	%xmm1, %xmm0
	movl	$1, %eax
	movl	$2, %r8d
	movq	%rax, 112(%rsp)
	movups	%xmm0, 288(%rsp)
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
	movl	$3, %edx
	movq	%rbx, %r9
	movq	%rbp, %r8
	movq	296(%rsp), %rcx
	movq	312(%rsp), %rax
	subq	%rcx, %rax
	cmpb	$92, 1(%rcx)
	movl	$1, 32(%rsp)
	cmove	%rax, %rdx
	movq	%rcx, 120(%rsp)
	leaq	112(%rsp), %rcx
	movq	%rax, 112(%rsp)
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	jmp	.L3595
	.p2align 4,,10
	.p2align 3
.L3674:
	orq	%r11, %rdx
	jne	.L3653
	movb	$48, 147(%rsp)
	leaq	.LC45(%rip), %r12
	leaq	148(%rsp), %rsi
	leaq	147(%rsp), %r8
	jmp	.L3631
	.p2align 4,,10
	.p2align 3
.L3682:
	bsrq	%r11, %rdx
	movdqu	.LC38(%rip), %xmm0
	leal	68(%rdx), %ecx
	shrl	$2, %ecx
	movups	%xmm0, 288(%rsp)
	movl	%ecx, %edx
	subl	$1, %ecx
	jmp	.L3634
	.p2align 4,,10
	.p2align 3
.L3675:
	bsrq	%r11, %rax
	movl	$128, %edx
	movl	$127, %ecx
	xorq	$63, %rax
	subl	%eax, %edx
	subl	%eax, %ecx
	jmp	.L3605
	.p2align 4,,10
	.p2align 3
.L3679:
	bsrq	%r10, %rax
	movl	$2863311531, %edx
	movl	$63, %ecx
	addl	$3, %eax
	imulq	%rdx, %rax
	shrq	$33, %rax
	movl	%eax, %edx
	cmpq	%r10, %rcx
	jnb	.L3624
	subl	$1, %eax
	jmp	.L3623
	.p2align 4,,10
	.p2align 3
.L3653:
	leaq	.LC45(%rip), %r12
	jmp	.L3630
	.p2align 4,,10
	.p2align 3
.L3655:
	leaq	148(%rsp), %rsi
	leaq	.LC44(%rip), %r12
	leaq	147(%rsp), %r8
.L3632:
	movq	%r8, %rdi
	movq	%r8, %r13
	.p2align 4
	.p2align 3
.L3639:
	movsbl	(%rdi), %ecx
	addq	$1, %rdi
	call	toupper
	movb	%al, -1(%rdi)
	cmpq	%rsi, %rdi
	jne	.L3639
	movq	%r13, %r8
	movl	$2, %eax
	jmp	.L3628
	.p2align 4,,10
	.p2align 3
.L3626:
	addl	$48, %r10d
	jmp	.L3627
	.p2align 4,,10
	.p2align 3
.L3637:
	movzbl	(%rsi,%r10), %ecx
	jmp	.L3638
	.p2align 4,,10
	.p2align 3
.L3617:
	addq	%r10, %r10
	movzbl	1(%rsi,%r10), %eax
	movzbl	(%rsi,%r10), %r10d
	movb	%al, 148(%rsp)
	jmp	.L3619
	.p2align 4,,10
	.p2align 3
.L3673:
	movzwl	(%rcx), %ecx
	movq	%r8, %rdx
	call	_ZNKSt8__format5_SpecIcE12_M_get_widthISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
	jmp	.L3591
	.p2align 4,,10
	.p2align 3
.L3676:
	movq	64(%rsp), %r10
	movq	72(%rsp), %r11
	addl	$2, %r15d
	jmp	.L3613
	.p2align 4,,10
	.p2align 3
.L3677:
	movq	64(%rsp), %r10
	movq	72(%rsp), %r11
	addl	$3, %r15d
	jmp	.L3613
	.p2align 4,,10
	.p2align 3
.L3678:
	movq	64(%rsp), %r10
	movq	72(%rsp), %r11
	jmp	.L3613
	.p2align 4,,10
	.p2align 3
.L3648:
	movl	$1, %edx
	leaq	147(%rsp), %r8
	jmp	.L3606
.L3652:
	leaq	275(%rsp), %rsi
	leaq	147(%rsp), %r8
	jmp	.L3669
.L3650:
	movl	$1, %r8d
	jmp	.L3611
.L3587:
	leaq	.LC47(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatInNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt8__format15__formatter_intIcE6formatInNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	.def	_ZNKSt8__format15__formatter_intIcE6formatInNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format15__formatter_intIcE6formatInNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
_ZNKSt8__format15__formatter_intIcE6formatInNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_:
.LFB7724:
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
	subq	$504, %rsp
	.seh_stackalloc	504
	.seh_endprologue
	movzbl	24(%rcx), %eax
	movq	(%rdx), %r14
	movq	8(%rdx), %r15
	andl	$15, %eax
	movq	%r14, %r10
	movq	%r15, %r11
	movq	%rcx, %rbx
	movq	%r8, %rbp
	cmpb	$2, %al
	je	.L3776
	testq	%r15, %r15
	js	.L3777
	leaq	.L3703(%rip), %rcx
	movzbl	%al, %edx
	movslq	(%rcx,%rdx,4), %rdx
	addq	%rcx, %rdx
	jmp	*%rdx
	.section .rdata,"dr"
	.align 4
.L3703:
	.long	.L3705-.L3703
	.long	.L3702-.L3703
	.long	.L3702-.L3703
	.long	.L3706-.L3703
	.long	.L3706-.L3703
	.long	.L3705-.L3703
	.long	.L3704-.L3703
	.long	.L3702-.L3703
	.long	.L3702-.L3703
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatInNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L3777:
	leaq	.L3697(%rip), %rcx
	movzbl	%al, %edx
	xorl	%r11d, %r11d
	negq	%r10
	movslq	(%rcx,%rdx,4), %rdx
	sbbq	%r15, %r11
	addq	%rcx, %rdx
	jmp	*%rdx
	.section .rdata,"dr"
	.align 4
.L3697:
	.long	.L3699-.L3697
	.long	.L3696-.L3697
	.long	.L3696-.L3697
	.long	.L3700-.L3697
	.long	.L3700-.L3697
	.long	.L3699-.L3697
	.long	.L3698-.L3697
	.long	.L3696-.L3697
	.long	.L3696-.L3697
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatInNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L3776:
	movq	%r14, %rax
	movq	%r15, %rdx
	movl	$255, %ecx
	addq	$128, %rax
	movq	%rax, %rsi
	adcq	$0, %rdx
	xorl	%eax, %eax
	cmpq	%rsi, %rcx
	sbbq	%rdx, %rax
	jc	.L3685
	movb	%r14b, 143(%rsp)
	testb	$1, 20(%rbx)
	je	.L3778
	movzbl	16(%rbx), %eax
	andl	$3, %eax
	cmpb	$1, %al
	je	.L3779
	cmpb	$2, %al
	je	.L3780
.L3690:
	movl	$1, %eax
	leaq	143(%rsp), %rcx
	leaq	112(%rsp), %rdx
	movl	$2, %r8d
	movq	%rcx, 120(%rsp)
	movq	16(%rbp), %rcx
	movq	%rax, 112(%rsp)
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
.L3693:
	addq	$504, %rsp
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
.L3778:
	movl	$1, 32(%rsp)
	movl	$1, %eax
	movq	%rbx, %r9
	movl	$1, %edx
	leaq	143(%rsp), %rcx
	movq	%rax, 112(%rsp)
	movq	%rcx, 120(%rsp)
	leaq	112(%rsp), %rcx
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	jmp	.L3693
	.p2align 4,,10
	.p2align 3
.L3706:
	movq	%r14, %rdx
	cmpb	$3, %al
	je	.L3781
	orq	%r15, %rdx
	jne	.L3760
	movb	$48, 147(%rsp)
	cmpb	$4, %al
	je	.L3761
	leaq	.LC44(%rip), %r12
	leaq	148(%rsp), %rsi
	leaq	147(%rsp), %r8
	jmp	.L3734
	.p2align 4,,10
	.p2align 3
.L3702:
	cmpb	$7, %al
	leaq	.LC43(%rip), %r12
	leaq	.LC42(%rip), %rax
	cmove	%rax, %r12
	movq	%r14, %rax
	orq	%r15, %rax
	jne	.L3701
	movl	$48, %eax
	leaq	148(%rsp), %rsi
	leaq	147(%rsp), %r8
.L3708:
	movb	%al, 147(%rsp)
	testb	$1, 12(%rbx)
	je	.L3774
.L3762:
	movq	$-2, %rax
	movl	$2, %edx
.L3713:
	addq	%r8, %rax
	movl	%edx, %r10d
	testl	%edx, %edx
	je	.L3714
	xorl	%edx, %edx
.L3743:
	movl	%edx, %ecx
	addl	$1, %edx
	movzbl	(%r12,%rcx), %r9d
	movb	%r9b, (%rax,%rcx)
	cmpl	%r10d, %edx
	jb	.L3743
	.p2align 4
	.p2align 3
.L3714:
	leaq	-1(%rax), %rcx
	testq	%r15, %r15
	jns	.L3745
	movb	$45, -1(%rax)
	movq	%rcx, %rax
	jmp	.L3746
	.p2align 4,,10
	.p2align 3
.L3705:
	movq	%r14, %rax
	orq	%r15, %rax
	jne	.L3699
.L3775:
	movb	$48, 147(%rsp)
	leaq	147(%rsp), %r8
	leaq	148(%rsp), %rsi
	movq	%r8, %rax
	leaq	146(%rsp), %rcx
.L3745:
	movzbl	8(%rbx), %edx
	shrb	$2, %dl
	andl	$3, %edx
	cmpb	$1, %dl
	je	.L3782
	cmpb	$3, %dl
	je	.L3783
.L3746:
	subq	%rax, %rsi
	leaq	112(%rsp), %rdx
	movq	%rbp, %r9
	subq	%rax, %r8
	movq	%rbx, %rcx
	movq	%rsi, 112(%rsp)
	movq	%rax, 120(%rsp)
	call	_ZNKSt8__format15__formatter_intIcE13_M_format_intINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorESt17basic_string_viewIcSt11char_traitsIcEEyRS7_
	jmp	.L3693
	.p2align 4,,10
	.p2align 3
.L3699:
	movl	$9, %eax
	cmpq	%r10, %rax
	movl	$0, %eax
	sbbq	%r11, %rax
	jnc	.L3755
	movq	%r10, 64(%rsp)
	movq	%r10, %r13
	movq	%r11, %r12
	movl	$1, %edi
	movq	%r11, 72(%rsp)
	xorl	%esi, %esi
	jmp	.L3721
	.p2align 4,,10
	.p2align 3
.L3717:
	movl	$999, %eax
	cmpq	%r13, %rax
	movq	%rsi, %rax
	sbbq	%r12, %rax
	jnc	.L3784
	movl	$9999, %eax
	cmpq	%r13, %rax
	movq	%rsi, %rax
	sbbq	%r12, %rax
	jnc	.L3785
	leaq	96(%rsp), %rcx
	leaq	80(%rsp), %rdx
	movq	%r13, 96(%rsp)
	addl	$4, %edi
	movq	%r12, 104(%rsp)
	movq	$10000, 80(%rsp)
	movq	$0, 88(%rsp)
	call	__udivti3
	movl	$99999, %ecx
	cmpq	%r13, %rcx
	movq	%rsi, %rcx
	movups	%xmm0, 48(%rsp)
	sbbq	%r12, %rcx
	jnc	.L3786
	movq	48(%rsp), %r13
	movq	56(%rsp), %r12
.L3721:
	movl	$99, %eax
	cmpq	%r13, %rax
	movq	%rsi, %rax
	sbbq	%r12, %rax
	jc	.L3717
	movq	64(%rsp), %r10
	movq	72(%rsp), %r11
	addl	$1, %edi
.L3718:
	movl	%edi, %r8d
	cmpl	$128, %edi
	ja	.L3757
	movdqu	.LC25(%rip), %xmm0
	movl	$99, %eax
	leaq	288(%rsp), %rsi
	cmpq	%r10, %rax
	movl	$0, %eax
	movups	%xmm0, 288(%rsp)
	movdqu	.LC26(%rip), %xmm0
	sbbq	%r11, %rax
	movups	%xmm0, 304(%rsp)
	movdqu	.LC27(%rip), %xmm0
	movups	%xmm0, 320(%rsp)
	movdqu	.LC28(%rip), %xmm0
	movups	%xmm0, 336(%rsp)
	movdqu	.LC29(%rip), %xmm0
	movups	%xmm0, 352(%rsp)
	movdqu	.LC30(%rip), %xmm0
	movups	%xmm0, 368(%rsp)
	movdqu	.LC31(%rip), %xmm0
	movups	%xmm0, 384(%rsp)
	movdqu	.LC32(%rip), %xmm0
	movups	%xmm0, 400(%rsp)
	movdqu	.LC33(%rip), %xmm0
	movups	%xmm0, 416(%rsp)
	movdqu	.LC34(%rip), %xmm0
	movups	%xmm0, 432(%rsp)
	movdqu	.LC35(%rip), %xmm0
	movups	%xmm0, 448(%rsp)
	movdqu	.LC36(%rip), %xmm0
	movups	%xmm0, 464(%rsp)
	movdqu	.LC37(%rip), %xmm0
	movups	%xmm0, 473(%rsp)
	jnc	.L3722
	movq	%r14, 64(%rsp)
	subl	$1, %edi
	leaq	288(%rsp), %rsi
	movq	%rbx, %r12
	movabsq	$1152921504606846975, %r13
	movq	%r15, 72(%rsp)
	movq	%r8, %r15
	movq	%rbp, 592(%rsp)
	.p2align 4
	.p2align 3
.L3723:
	movq	%r10, %rax
	movq	%r10, %rcx
	movq	%r10, %r8
	xorl	%ebx, %ebx
	shrdq	$60, %r11, %rax
	andq	%r13, %rcx
	movq	%r11, %r9
	movl	$25, %r14d
	andq	%r13, %rax
	addq	%rax, %rcx
	movq	%r11, %rax
	shrq	$56, %rax
	addq	%rax, %rcx
	movabsq	$5165088340638674453, %rax
	mulq	%rcx
	movq	%rcx, %rax
	subq	%rdx, %rax
	shrq	%rax
	addq	%rax, %rdx
	shrq	$4, %rdx
	leaq	(%rdx,%rdx,4), %rax
	movabsq	$-8116567392432202711, %rdx
	leaq	(%rax,%rax,4), %rax
	subq	%rax, %rcx
	movabsq	$2951479051793528258, %rax
	subq	%rcx, %r8
	sbbq	%rbx, %r9
	imulq	%r8, %rax
	imulq	%r9, %rdx
	leaq	(%rdx,%rax), %rbp
	movabsq	$-8116567392432202711, %rax
	mulq	%r8
	movq	%rax, %r8
	leaq	0(%rbp,%rdx), %rax
	movq	%rax, %r9
	movq	%r8, %rax
	andl	$3, %eax
	mulq	%r14
	addq	%rcx, %rax
	xorl	%edx, %edx
	movq	%r10, %rcx
	movq	%r8, %r10
	addq	%rax, %rax
	movl	%edi, %r8d
	movq	%rax, 48(%rsp)
	movq	48(%rsp), %rax
	adcq	%rdx, %rdx
	shrdq	$2, %r9, %r10
	movq	%rdx, 56(%rsp)
	movq	%r11, %rdx
	movq	%r9, %r11
	movzbl	1(%rsi,%rax), %r9d
	movzbl	(%rax,%rsi), %eax
	shrq	$2, %r11
	movb	%r9b, 147(%rsp,%r8)
	leal	-1(%rdi), %r8d
	subl	$2, %edi
	movb	%al, 147(%rsp,%r8)
	movl	$9999, %eax
	cmpq	%rcx, %rax
	movl	$0, %eax
	sbbq	%rdx, %rax
	jc	.L3723
	movl	$999, %eax
	movq	%r15, %r8
	movq	%r12, %rbx
	movq	72(%rsp), %r15
	cmpq	%rcx, %rax
	movl	$0, %eax
	movq	592(%rsp), %rbp
	sbbq	%rdx, %rax
	jc	.L3722
.L3716:
	addl	$48, %r10d
.L3724:
	leaq	147(%rsp,%r8), %rsi
	leaq	147(%rsp), %r8
	movb	%r10b, 147(%rsp)
	movq	%r8, %rax
	jmp	.L3714
	.p2align 4,,10
	.p2align 3
.L3696:
	cmpb	$7, %al
	leaq	.LC42(%rip), %r12
	leaq	.LC43(%rip), %rax
	cmovne	%rax, %r12
.L3701:
	testq	%r11, %r11
	je	.L3709
	bsrq	%r11, %rax
	movl	$128, %edx
	movl	$127, %ecx
	xorq	$63, %rax
	subl	%eax, %edx
	subl	%eax, %ecx
.L3710:
	movl	%ecx, %esi
	leaq	147(%rsp), %r8
	subl	$1, %ecx
	leaq	146(%rsp,%rsi), %rdi
	leaq	(%r8,%rsi), %rax
	subq	%rcx, %rdi
	.p2align 5
	.p2align 4
	.p2align 3
.L3712:
	movl	%r10d, %ecx
	subq	$1, %rax
	shrdq	$1, %r11, %r10
	andl	$1, %ecx
	shrq	%r11
	addl	$48, %ecx
	movb	%cl, 1(%rax)
	cmpq	%rdi, %rax
	jne	.L3712
.L3711:
	leaq	(%r8,%rdx), %rsi
	movl	$49, %eax
	jmp	.L3708
	.p2align 4,,10
	.p2align 3
.L3700:
	leaq	.LC44(%rip), %r12
	cmpb	$3, %al
	leaq	.LC45(%rip), %rdx
	cmove	%rdx, %r12
.L3732:
	testq	%r11, %r11
	je	.L3736
	bsrq	%r11, %rdx
	movdqu	.LC38(%rip), %xmm0
	leal	68(%rdx), %ecx
	shrl	$2, %ecx
	movups	%xmm0, 288(%rsp)
	movl	%ecx, %edi
	subl	$1, %ecx
.L3737:
	movq	%r14, 48(%rsp)
	leaq	288(%rsp), %rsi
	movl	$255, %edx
	xorl	%r13d, %r13d
	movq	%r15, 56(%rsp)
	.p2align 4
	.p2align 3
.L3739:
	movq	%r10, %r8
	movl	%ecx, %r15d
	leal	-1(%rcx), %r9d
	subl	$2, %ecx
	andl	$15, %r8d
	movzbl	(%rsi,%r8), %r8d
	movb	%r8b, 147(%rsp,%r15)
	movq	%r10, %r8
	shrdq	$8, %r11, %r10
	movq	%r13, %r15
	shrdq	$4, %r11, %r8
	shrq	$8, %r11
	movq	%r8, %r14
	andl	$15, %r14d
	cmpq	%r10, %rdx
	movzbl	(%rsi,%r14), %r8d
	sbbq	%r11, %r15
	movb	%r8b, 147(%rsp,%r9)
	jc	.L3739
	movq	56(%rsp), %r15
.L3738:
	movl	$15, %ecx
	cmpq	%r10, %rcx
	movl	$0, %ecx
	sbbq	%r11, %rcx
	jnc	.L3740
	movq	%r10, %r8
	andl	$15, %r8d
	movzbl	(%rsi,%r8), %ecx
	movb	%cl, 148(%rsp)
	movq	%r10, %rcx
	shrdq	$4, %r11, %rcx
	movzbl	(%rcx,%rsi), %ecx
.L3741:
	leaq	147(%rsp), %r8
	movb	%cl, 147(%rsp)
	leaq	(%r8,%rdi), %rsi
	cmpb	$4, %al
	je	.L3735
.L3734:
	testb	$1, 12(%rbx)
	jne	.L3762
.L3774:
	movq	%r8, %rax
	jmp	.L3714
	.p2align 4,,10
	.p2align 3
.L3704:
	movq	%r14, %rax
	orq	%r15, %rax
	je	.L3775
.L3698:
	testq	%r11, %r11
	jne	.L3787
	bsrq	%r10, %rax
	movl	$2863311531, %edx
	movl	$63, %ecx
	addl	$3, %eax
	imulq	%rdx, %rax
	shrq	$33, %rax
	movl	%eax, %edx
	cmpq	%r10, %rcx
	jnb	.L3727
	subl	$1, %eax
.L3726:
	movl	$63, %r9d
	xorl	%r8d, %r8d
	movq	%rbx, %rsi
	.p2align 4
	.p2align 3
.L3728:
	movq	%r10, %rcx
	movl	%eax, %edi
	leal	-1(%rax), %ebx
	subl	$2, %eax
	andl	$7, %ecx
	addl	$48, %ecx
	movb	%cl, 147(%rsp,%rdi)
	movq	%r10, %rcx
	shrdq	$6, %r11, %r10
	movq	%r8, %rdi
	shrdq	$3, %r11, %rcx
	shrq	$6, %r11
	andl	$7, %ecx
	cmpq	%r10, %r9
	leal	48(%rcx), %ecx
	sbbq	%r11, %rdi
	movb	%cl, 147(%rsp,%rbx)
	jc	.L3728
	movq	%rsi, %rbx
.L3727:
	movl	$7, %eax
	cmpq	%r10, %rax
	movl	$0, %eax
	sbbq	%r11, %rax
	jnc	.L3729
	movq	%r10, %r8
	shrdq	$3, %r11, %r10
	andl	$7, %r8d
	addl	$48, %r10d
	addl	$48, %r8d
	movb	%r8b, 148(%rsp)
.L3730:
	movb	%r10b, 147(%rsp)
	leaq	147(%rsp), %r8
	leaq	.LC46(%rip), %r12
	leaq	(%r8,%rdx), %rsi
	movl	$1, %edx
.L3731:
	movq	%r8, %rax
	testb	$1, 12(%rbx)
	je	.L3714
	movq	%rdx, %rax
	negq	%rax
	jmp	.L3713
	.p2align 4,,10
	.p2align 3
.L3782:
	movb	$43, -1(%rax)
.L3748:
	movq	%rcx, %rax
	jmp	.L3746
	.p2align 4,,10
	.p2align 3
.L3783:
	movb	$32, -1(%rax)
	jmp	.L3748
	.p2align 4,,10
	.p2align 3
.L3779:
	movzwl	(%rbx), %eax
.L3689:
	cmpq	$3, %rax
	jbe	.L3690
	leaq	144(%rsp), %rax
	leaq	143(%rsp), %r8
	movq	.LC48(%rip), %xmm0
	movq	$12, 304(%rsp)
	movq	%rax, %xmm1
	movq	%rax, 312(%rsp)
	leaq	288(%rsp), %rcx
	leaq	112(%rsp), %rdx
	movq	%r8, 120(%rsp)
	punpcklqdq	%xmm1, %xmm0
	movl	$1, %eax
	movl	$2, %r8d
	movq	%rax, 112(%rsp)
	movups	%xmm0, 288(%rsp)
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
	movl	$3, %edx
	movq	%rbx, %r9
	movq	%rbp, %r8
	movq	296(%rsp), %rcx
	movq	312(%rsp), %rax
	subq	%rcx, %rax
	cmpb	$92, 1(%rcx)
	movl	$1, 32(%rsp)
	cmove	%rax, %rdx
	movq	%rcx, 120(%rsp)
	leaq	112(%rsp), %rcx
	movq	%rax, 112(%rsp)
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	jmp	.L3693
	.p2align 4,,10
	.p2align 3
.L3787:
	bsrq	%r11, %rax
	movl	$2863311531, %edx
	addl	$67, %eax
	imulq	%rdx, %rax
	shrq	$33, %rax
	movl	%eax, %edx
	subl	$1, %eax
	jmp	.L3726
	.p2align 4,,10
	.p2align 3
.L3709:
	bsrq	%r10, %rax
	xorq	$63, %rax
	leal	64(%rax), %r8d
	cmpl	$63, %eax
	je	.L3753
	movl	$128, %edx
	movl	$127, %ecx
	subl	%r8d, %edx
	subl	%r8d, %ecx
	jmp	.L3710
	.p2align 4,,10
	.p2align 3
.L3736:
	bsrq	%r10, %rdx
	movdqu	.LC38(%rip), %xmm0
	movl	$255, %r8d
	leaq	288(%rsp), %rsi
	leal	4(%rdx), %ecx
	shrl	$2, %ecx
	cmpq	%r10, %r8
	movups	%xmm0, 288(%rsp)
	movl	%ecx, %edi
	jnb	.L3738
	subl	$1, %ecx
	jmp	.L3737
	.p2align 4,,10
	.p2align 3
.L3761:
	leaq	148(%rsp), %rsi
	leaq	.LC44(%rip), %r12
	leaq	147(%rsp), %r8
.L3735:
	movq	%r8, %rdi
	movq	%r8, %r13
	.p2align 4
	.p2align 3
.L3742:
	movsbl	(%rdi), %ecx
	addq	$1, %rdi
	call	toupper
	movb	%al, -1(%rdi)
	cmpq	%rsi, %rdi
	jne	.L3742
	movq	%r13, %r8
	movl	$2, %edx
	jmp	.L3731
	.p2align 4,,10
	.p2align 3
.L3740:
	movzbl	(%rsi,%r10), %ecx
	jmp	.L3741
	.p2align 4,,10
	.p2align 3
.L3729:
	addl	$48, %r10d
	jmp	.L3730
	.p2align 4,,10
	.p2align 3
.L3722:
	addq	%r10, %r10
	movzbl	1(%rsi,%r10), %eax
	movzbl	(%rsi,%r10), %r10d
	movb	%al, 148(%rsp)
	jmp	.L3724
	.p2align 4,,10
	.p2align 3
.L3781:
	orq	%r15, %rdx
	jne	.L3759
	movb	$48, 147(%rsp)
	leaq	.LC45(%rip), %r12
	leaq	148(%rsp), %rsi
	leaq	147(%rsp), %r8
	jmp	.L3734
	.p2align 4,,10
	.p2align 3
.L3780:
	movzwl	(%rbx), %ecx
	movq	%r8, %rdx
	call	_ZNKSt8__format5_SpecIcE12_M_get_widthISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
	jmp	.L3689
	.p2align 4,,10
	.p2align 3
.L3784:
	movq	64(%rsp), %r10
	movq	72(%rsp), %r11
	addl	$2, %edi
	jmp	.L3718
	.p2align 4,,10
	.p2align 3
.L3785:
	movq	64(%rsp), %r10
	movq	72(%rsp), %r11
	addl	$3, %edi
	jmp	.L3718
	.p2align 4,,10
	.p2align 3
.L3786:
	movq	64(%rsp), %r10
	movq	72(%rsp), %r11
	jmp	.L3718
	.p2align 4,,10
	.p2align 3
.L3760:
	leaq	.LC44(%rip), %r12
	jmp	.L3732
	.p2align 4,,10
	.p2align 3
.L3753:
	movl	$1, %edx
	leaq	147(%rsp), %r8
	jmp	.L3711
.L3757:
	leaq	275(%rsp), %rsi
	leaq	147(%rsp), %r8
	jmp	.L3774
.L3759:
	leaq	.LC45(%rip), %r12
	jmp	.L3732
.L3755:
	movl	$1, %r8d
	jmp	.L3716
.L3685:
	leaq	.LC47(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorEbRS7_,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNKSt8__format15__formatter_intIcE6formatINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorEbRS7_
	.def	_ZNKSt8__format15__formatter_intIcE6formatINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorEbRS7_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNKSt8__format15__formatter_intIcE6formatINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorEbRS7_
_ZNKSt8__format15__formatter_intIcE6formatINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorEbRS7_:
.LFB7676:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$184, %rsp
	.seh_stackalloc	184
	.seh_endprologue
	movzbl	24(%rcx), %eax
	andl	$15, %eax
	movq	%rcx, %r10
	movl	%edx, %r9d
	movq	%r8, %r11
	cmpb	$2, %al
	je	.L3866
	cmpb	$1, %al
	jne	.L3867
	leaq	128(%rsp), %rbx
	movb	$0, 128(%rsp)
	movq	%rbx, 112(%rsp)
	movq	$0, 120(%rsp)
	testb	$2, 12(%rcx)
	jne	.L3868
	testb	%dl, %dl
	jne	.L3837
	movl	$5, %eax
	leaq	.LC23(%rip), %rcx
.L3823:
	leaq	112(%rsp), %rsi
	cmpq	%rbx, %rcx
	je	.L3869
	movl	%eax, %r9d
	andl	$63, %r9d
	je	.L3827
	xorl	%edx, %edx
.L3826:
	movl	%edx, %r8d
	addl	$1, %edx
	movzbl	(%rcx,%r8), %esi
	movb	%sil, (%rbx,%r8)
	cmpl	%r9d, %edx
	jb	.L3826
.L3827:
	movq	%rbx, %rdx
.L3825:
	movb	$0, (%rdx,%rax)
	movq	%rax, 120(%rsp)
.L3822:
	movq	112(%rsp), %rdx
	leaq	80(%rsp), %rcx
	movq	%r10, %r9
	movq	%r11, %r8
	movl	$1, 32(%rsp)
	leaq	112(%rsp), %rsi
	movq	%rdx, 88(%rsp)
	movq	%rax, %rdx
	movq	%rax, 80(%rsp)
.LEHB53:
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
.LEHE53:
	movq	112(%rsp), %rcx
	cmpq	%rbx, %rcx
	je	.L3845
	movq	%rax, 48(%rsp)
	movq	128(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	48(%rsp), %rax
	addq	$184, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L3867:
	movzbl	%dl, %edx
	addq	$184, %rsp
	popq	%rbx
	popq	%rsi
.LEHB54:
	jmp	_ZNKSt8__format15__formatter_intIcE6formatIhNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	.p2align 4,,10
	.p2align 3
.L3866:
	movb	%dl, 111(%rsp)
	testb	$1, 20(%rcx)
	je	.L3870
	movzbl	16(%rcx), %eax
	andl	$3, %eax
	cmpb	$1, %al
	je	.L3871
	cmpb	$2, %al
	je	.L3872
.L3794:
	leaq	111(%rsp), %rcx
	movl	$1, %eax
	leaq	80(%rsp), %rdx
	movl	$2, %r8d
	movq	%rcx, 88(%rsp)
	movq	16(%r11), %rcx
	movq	%rax, 80(%rsp)
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
.L3845:
	addq	$184, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L3837:
	movl	$4, %eax
	leaq	.LC24(%rip), %rcx
	jmp	.L3823
	.p2align 4,,10
	.p2align 3
.L3870:
	movl	$1, 32(%rsp)
	leaq	111(%rsp), %rcx
	movl	$1, %eax
	movq	%r10, %r9
	movq	%rcx, 88(%rsp)
	movl	$1, %edx
	leaq	80(%rsp), %rcx
	movq	%rax, 80(%rsp)
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
.LEHE54:
	addq	$184, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.p2align 4,,10
	.p2align 3
.L3868:
	leaq	24(%r8), %rdx
	cmpb	$0, 32(%r8)
	je	.L3873
.L3800:
	leaq	144(%rsp), %rcx
	movq	%r11, 72(%rsp)
	movb	%r9b, 64(%rsp)
	movq	%r10, 56(%rsp)
	call	_ZNSt6localeC1ERKS_
	movq	.refptr._ZNSt7__cxx118numpunctIcE2idE(%rip), %rcx
	call	_ZNKSt6locale2id5_M_idEv
	movq	%rax, %rdx
	movq	144(%rsp), %rax
	movq	8(%rax), %rax
	movq	(%rax,%rdx,8), %rdx
	testq	%rdx, %rdx
	je	.L3801
	leaq	144(%rsp), %rcx
	movq	%rdx, 48(%rsp)
	call	_ZNSt6localeD1Ev
	movq	48(%rsp), %rdx
	cmpb	$0, 64(%rsp)
	movq	56(%rsp), %r10
	movq	72(%rsp), %r11
	movq	(%rdx), %rax
	je	.L3874
	movq	%r11, 56(%rsp)
	leaq	112(%rsp), %rsi
	leaq	144(%rsp), %rcx
	movq	%r10, 48(%rsp)
.LEHB55:
	call	*40(%rax)
.LEHE55:
	movq	48(%rsp), %r10
	movq	56(%rsp), %r11
.L3804:
	movq	112(%rsp), %rax
	movq	%rax, %r9
	cmpq	%rbx, %rax
	je	.L3875
	movq	144(%rsp), %r8
	leaq	160(%rsp), %rdx
	movq	152(%rsp), %rcx
	cmpq	%rdx, %r8
	je	.L3834
	movq	128(%rsp), %r9
	movq	%rcx, %xmm0
	movq	%r8, 112(%rsp)
	movhps	160(%rsp), %xmm0
	movups	%xmm0, 120(%rsp)
	testq	%rax, %rax
	je	.L3820
	movq	%rax, 144(%rsp)
	movq	%r9, 160(%rsp)
.L3819:
	movb	$0, (%rax)
	movq	144(%rsp), %rcx
	cmpq	%rdx, %rcx
	je	.L3821
	movq	160(%rsp), %rax
	movq	%r11, 56(%rsp)
	movq	%r10, 48(%rsp)
	leaq	1(%rax), %rdx
	call	_ZdlPvy
	movq	56(%rsp), %r11
	movq	48(%rsp), %r10
.L3821:
	movq	120(%rsp), %rax
	jmp	.L3822
	.p2align 4,,10
	.p2align 3
.L3871:
	movzwl	(%rcx), %eax
.L3793:
	cmpq	$3, %rax
	jbe	.L3794
	leaq	112(%rsp), %rax
	leaq	111(%rsp), %r8
	movq	.LC48(%rip), %xmm0
	movq	%r11, 56(%rsp)
	movq	%rax, %xmm4
	movq	%rax, 168(%rsp)
	leaq	144(%rsp), %rcx
	leaq	80(%rsp), %rdx
	movq	%r8, 88(%rsp)
	punpcklqdq	%xmm4, %xmm0
	movl	$1, %eax
	movl	$2, %r8d
	movq	%r10, 48(%rsp)
	movq	$12, 160(%rsp)
	movq	%rax, 80(%rsp)
	movups	%xmm0, 144(%rsp)
.LEHB56:
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
	movl	$3, %edx
	movq	48(%rsp), %r9
	movq	152(%rsp), %rcx
	movq	168(%rsp), %rax
	movq	56(%rsp), %r8
	subq	%rcx, %rax
	cmpb	$92, 1(%rcx)
	movl	$1, 32(%rsp)
	cmove	%rax, %rdx
	movq	%rcx, 88(%rsp)
	leaq	80(%rsp), %rcx
	movq	%rax, 80(%rsp)
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
.LEHE56:
	jmp	.L3845
	.p2align 4,,10
	.p2align 3
.L3874:
	movq	%r11, 56(%rsp)
	leaq	112(%rsp), %rsi
	leaq	144(%rsp), %rcx
	movq	%r10, 48(%rsp)
.LEHB57:
	call	*48(%rax)
.LEHE57:
	movq	56(%rsp), %r11
	movq	48(%rsp), %r10
	jmp	.L3804
	.p2align 4,,10
	.p2align 3
.L3873:
	movq	%rcx, 56(%rsp)
	movq	%rdx, %rcx
	movb	%r9b, 64(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%r8, 72(%rsp)
	call	_ZNSt6localeC1Ev
	movq	72(%rsp), %r11
	movzbl	64(%rsp), %r9d
	movq	56(%rsp), %r10
	movq	48(%rsp), %rdx
	movb	$1, 32(%r11)
	jmp	.L3800
	.p2align 4,,10
	.p2align 3
.L3872:
	movzwl	(%rcx), %ecx
	movq	%r8, %rdx
	movq	%r10, 56(%rsp)
	movq	%r8, 48(%rsp)
.LEHB58:
	call	_ZNKSt8__format5_SpecIcE12_M_get_widthISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
.LEHE58:
	movq	56(%rsp), %r10
	movq	48(%rsp), %r11
	jmp	.L3793
.L3875:
	movq	144(%rsp), %rax
	leaq	160(%rsp), %rdx
	cmpq	%rdx, %rax
	je	.L3876
	movq	152(%rsp), %xmm0
	movq	%rax, 112(%rsp)
	movhps	160(%rsp), %xmm0
	movups	%xmm0, 120(%rsp)
.L3820:
	movq	%rdx, 144(%rsp)
	leaq	160(%rsp), %rdx
	movq	%rdx, %rax
	jmp	.L3819
.L3876:
	movq	152(%rsp), %rcx
.L3834:
	testq	%rcx, %rcx
	je	.L3807
	cmpq	$1, %rcx
	je	.L3877
	movl	%ecx, %eax
	cmpl	$64, %ecx
	jnb	.L3810
	testb	$32, %cl
	jne	.L3878
	testb	$16, %al
	jne	.L3879
	testb	$8, %al
	jne	.L3880
	testb	$4, %al
	jne	.L3881
	testl	%eax, %eax
	je	.L3807
	movzbl	160(%rsp), %ecx
	movb	%cl, (%r9)
	testb	$2, %al
	jne	.L3860
.L3865:
	movq	112(%rsp), %r9
	movq	152(%rsp), %rcx
.L3807:
	movb	$0, (%r9,%rcx)
	movq	144(%rsp), %rax
	movq	%rcx, 120(%rsp)
	jmp	.L3819
.L3877:
	movzbl	160(%rsp), %eax
	movb	%al, (%r9)
	movq	112(%rsp), %r9
	movq	152(%rsp), %rcx
	jmp	.L3807
.L3810:
	movl	%ecx, %eax
	leaq	(%r9,%rax), %r8
	addq	%rdx, %rax
	movdqu	-64(%rax), %xmm0
	movups	%xmm0, -64(%r8)
	movdqu	-48(%rax), %xmm0
	movups	%xmm0, -48(%r8)
	movdqu	-32(%rax), %xmm0
	movups	%xmm0, -32(%r8)
	movdqu	-16(%rax), %xmm0
	leal	-1(%rcx), %eax
	movups	%xmm0, -16(%r8)
	cmpl	$64, %eax
	jb	.L3865
	andl	$-64, %eax
	xorl	%r8d, %r8d
.L3817:
	movl	%r8d, %ecx
	addl	$64, %r8d
	movdqu	(%rdx,%rcx), %xmm3
	movdqu	16(%rdx,%rcx), %xmm2
	movdqu	32(%rdx,%rcx), %xmm1
	movdqu	48(%rdx,%rcx), %xmm0
	movups	%xmm3, (%r9,%rcx)
	movups	%xmm2, 16(%r9,%rcx)
	movups	%xmm1, 32(%r9,%rcx)
	movups	%xmm0, 48(%r9,%rcx)
	cmpl	%eax, %r8d
	jb	.L3817
	jmp	.L3865
.L3879:
	movdqu	160(%rsp), %xmm0
	movups	%xmm0, (%r9)
	movdqu	-16(%rdx,%rax), %xmm0
	movups	%xmm0, -16(%r9,%rax)
	movq	112(%rsp), %r9
	movq	152(%rsp), %rcx
	jmp	.L3807
.L3878:
	movdqu	160(%rsp), %xmm0
	leaq	32(%r9,%rax), %rcx
	movups	%xmm0, (%r9)
	movdqu	176(%rsp), %xmm0
	movups	%xmm0, 16(%r9)
	movdqu	-32(%rdx,%rax), %xmm0
	movups	%xmm0, -64(%rcx)
	movdqu	-16(%rdx,%rax), %xmm0
	movups	%xmm0, -48(%rcx)
	movq	112(%rsp), %r9
	movq	152(%rsp), %rcx
	jmp	.L3807
.L3881:
	movl	160(%rsp), %ecx
	movl	%ecx, (%r9)
	movl	-4(%rdx,%rax), %ecx
	movl	%ecx, -4(%r9,%rax)
	movq	112(%rsp), %r9
	movq	152(%rsp), %rcx
	jmp	.L3807
.L3880:
	movq	160(%rsp), %rcx
	movq	%rcx, (%r9)
	movq	-8(%rdx,%rax), %rcx
	movq	%rcx, -8(%r9,%rax)
	movq	112(%rsp), %r9
	movq	152(%rsp), %rcx
	jmp	.L3807
.L3860:
	movzwl	-2(%rdx,%rax), %ecx
	movw	%cx, -2(%r9,%rax)
	movq	112(%rsp), %r9
	movq	152(%rsp), %rcx
	jmp	.L3807
.L3869:
	xorl	%edx, %edx
	movq	%rax, 32(%rsp)
	movq	%rbx, %r9
	xorl	%r8d, %r8d
	movq	%rdx, 40(%rsp)
	movq	%rsi, %rcx
	movq	%rbx, %rdx
	movq	%r11, 64(%rsp)
	movq	%r10, 56(%rsp)
	movq	%rax, 48(%rsp)
.LEHB59:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE15_M_replace_coldEPcyPKcyy
.LEHE59:
	movq	64(%rsp), %r11
	movq	56(%rsp), %r10
	movq	48(%rsp), %rax
	movq	112(%rsp), %rdx
	jmp	.L3825
.L3801:
.LEHB60:
	call	_ZSt16__throw_bad_castv
.LEHE60:
.L3839:
	movq	%rax, %rbx
.L3830:
	movq	%rsi, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rcx
.LEHB61:
	call	_Unwind_Resume
.LEHE61:
.L3838:
	leaq	144(%rsp), %rcx
	movq	%rax, %rbx
	leaq	112(%rsp), %rsi
	call	_ZNSt6localeD1Ev
	jmp	.L3830
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA7676:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE7676-.LLSDACSB7676
.LLSDACSB7676:
	.uleb128 .LEHB53-.LFB7676
	.uleb128 .LEHE53-.LEHB53
	.uleb128 .L3839-.LFB7676
	.uleb128 0
	.uleb128 .LEHB54-.LFB7676
	.uleb128 .LEHE54-.LEHB54
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB55-.LFB7676
	.uleb128 .LEHE55-.LEHB55
	.uleb128 .L3839-.LFB7676
	.uleb128 0
	.uleb128 .LEHB56-.LFB7676
	.uleb128 .LEHE56-.LEHB56
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB57-.LFB7676
	.uleb128 .LEHE57-.LEHB57
	.uleb128 .L3839-.LFB7676
	.uleb128 0
	.uleb128 .LEHB58-.LFB7676
	.uleb128 .LEHE58-.LEHB58
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB59-.LFB7676
	.uleb128 .LEHE59-.LEHB59
	.uleb128 .L3839-.LFB7676
	.uleb128 0
	.uleb128 .LEHB60-.LFB7676
	.uleb128 .LEHE60-.LEHB60
	.uleb128 .L3838-.LFB7676
	.uleb128 0
	.uleb128 .LEHB61-.LFB7676
	.uleb128 .LEHE61-.LEHB61
	.uleb128 0
	.uleb128 0
.LLSDACSE7676:
	.section	.text$_ZNKSt8__format15__formatter_intIcE6formatINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorEbRS7_,"x"
	.linkonce discard
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC49:
	.ascii "format error: format-spec contains invalid formatting options for 'bool'\0"
	.align 8
.LC50:
	.ascii "format error: format-spec contains invalid formatting options for 'charT'\0"
	.section	.text$_ZNSt16basic_format_argISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE8_M_visitIZNS1_19_Formatting_scannerIS3_cE13_M_format_argEyEUlRT_E_EEDcOS9_NS1_6_Arg_tE,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt16basic_format_argISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE8_M_visitIZNS1_19_Formatting_scannerIS3_cE13_M_format_argEyEUlRT_E_EEDcOS9_NS1_6_Arg_tE
	.def	_ZNSt16basic_format_argISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE8_M_visitIZNS1_19_Formatting_scannerIS3_cE13_M_format_argEyEUlRT_E_EEDcOS9_NS1_6_Arg_tE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt16basic_format_argISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE8_M_visitIZNS1_19_Formatting_scannerIS3_cE13_M_format_argEyEUlRT_E_EEDcOS9_NS1_6_Arg_tE
_ZNSt16basic_format_argISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE8_M_visitIZNS1_19_Formatting_scannerIS3_cE13_M_format_argEyEUlRT_E_EEDcOS9_NS1_6_Arg_tE:
.LFB7374:
	pushq	%r15
	.seh_pushreg	%r15
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
	subq	$200, %rsp
	.seh_stackalloc	200
	.seh_endprologue
	pxor	%xmm0, %xmm0
	movq	%rdx, %rbx
	movzbl	%r8b, %r8d
	leaq	.L3885(%rip), %rdx
	movq	%rcx, %rsi
	movslq	(%rdx,%r8,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L3885:
	.long	.L3904-.L3885
	.long	.L3903-.L3885
	.long	.L3902-.L3885
	.long	.L3901-.L3885
	.long	.L3900-.L3885
	.long	.L3899-.L3885
	.long	.L3898-.L3885
	.long	.L3886-.L3885
	.long	.L3884-.L3885
	.long	.L3895-.L3885
	.long	.L3894-.L3885
	.long	.L3893-.L3885
	.long	.L3892-.L3885
	.long	.L3891-.L3885
	.long	.L3890-.L3885
	.long	.L3889-.L3885
	.long	.L3884-.L3885
	.long	.L3888-.L3885
	.long	.L3887-.L3885
	.long	.L3886-.L3885
	.long	.L3884-.L3885
	.section	.text$_ZNSt16basic_format_argISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE8_M_visitIZNS1_19_Formatting_scannerIS3_cE13_M_format_argEyEUlRT_E_EEDcOS9_NS1_6_Arg_tE,"x"
	.linkonce discard
	.p2align 4,,10
	.p2align 3
.L3886:
	movups	%xmm0, 160(%rsp)
	leaq	160(%rsp), %rcx
	movups	%xmm0, 176(%rsp)
	movq	(%rbx), %r8
	movl	$32, 164(%rsp)
	leaq	8(%r8), %rdx
	movq	%r8, 56(%rsp)
	call	_ZNSt8__format14__formatter_fpIcE5parseERSt26basic_format_parse_contextIcE
	movq	56(%rsp), %r8
	leaq	160(%rsp), %rcx
	movq	%rax, 8(%r8)
	movq	(%rbx), %rax
	movss	(%rsi), %xmm1
	movq	56(%rax), %rbx
	movq	%rbx, %r8
	call	_ZNKSt8__format14__formatter_fpIcE6formatIfNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	movq	%rax, 16(%rbx)
.L3882:
	addq	$200, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L3884:
	movups	%xmm0, 160(%rsp)
	leaq	160(%rsp), %rcx
	movups	%xmm0, 176(%rsp)
	movq	(%rbx), %r8
	movl	$32, 164(%rsp)
	leaq	8(%r8), %rdx
	movq	%r8, 56(%rsp)
	call	_ZNSt8__format14__formatter_fpIcE5parseERSt26basic_format_parse_contextIcE
	movq	56(%rsp), %r8
	leaq	160(%rsp), %rcx
	movq	%rax, 8(%r8)
	movq	(%rbx), %rax
	movsd	(%rsi), %xmm1
	movq	56(%rax), %rbx
	movq	%rbx, %r8
	call	_ZNKSt8__format14__formatter_fpIcE6formatIdNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	movq	%rax, 16(%rbx)
	addq	$200, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L3898:
	movq	(%rbx), %r9
	movl	$5, %r8d
	leaq	160(%rsp), %rcx
	movups	%xmm0, 160(%rsp)
	movups	%xmm0, 176(%rsp)
	leaq	8(%r9), %rdx
	movq	%r9, 56(%rsp)
	movl	$32, 164(%rsp)
	call	_ZNSt8__format15__formatter_intIcE11_M_do_parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE
	movq	56(%rsp), %r9
	movq	(%rsi), %rdx
	leaq	160(%rsp), %rcx
	movq	%rax, 8(%r9)
	movq	(%rbx), %rax
	movq	56(%rax), %rbx
	movq	%rbx, %r8
	call	_ZNKSt8__format15__formatter_intIcE6formatIyNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	movq	%rax, 16(%rbx)
	jmp	.L3882
	.p2align 4,,10
	.p2align 3
.L3903:
	movq	(%rbx), %r9
	movl	$1, %r8d
	leaq	160(%rsp), %rcx
	movups	%xmm0, 160(%rsp)
	movups	%xmm0, 176(%rsp)
	leaq	8(%r9), %rdx
	movq	%r9, 56(%rsp)
	movb	$32, 164(%rsp)
	call	_ZNSt8__format15__formatter_intIcE11_M_do_parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE
	movq	56(%rsp), %r9
	movq	%rax, %rdx
	movzbl	184(%rsp), %eax
	andl	$15, %eax
	cmpb	$1, %al
	je	.L3940
.L3905:
	movq	(%rbx), %rax
	movq	%rdx, 8(%r9)
	leaq	160(%rsp), %rcx
	movzbl	(%rsi), %edx
	movq	56(%rax), %rbx
	movq	%rbx, %r8
	call	_ZNKSt8__format15__formatter_intIcE6formatINS_10_Sink_iterIcEEEENSt20basic_format_contextIT_cE8iteratorEbRS7_
	movq	%rax, 16(%rbx)
	jmp	.L3882
	.p2align 4,,10
	.p2align 3
.L3888:
	movq	(%rbx), %r8
	leaq	160(%rsp), %rcx
	movups	%xmm0, 160(%rsp)
	movups	%xmm0, 176(%rsp)
	leaq	8(%r8), %rdx
	movq	%r8, 56(%rsp)
	movl	$32, 164(%rsp)
	call	_ZNSt8__format14__formatter_fpIcE5parseERSt26basic_format_parse_contextIcE
	movq	56(%rsp), %r8
	movzwl	(%rsi), %ecx
	movq	%rax, 8(%r8)
	movq	(%rbx), %rax
	movq	56(%rax), %rbx
	call	__extendbfsf2
.L3939:
	movaps	%xmm0, %xmm1
	movq	%rbx, %r8
	leaq	160(%rsp), %rcx
	call	_ZNKSt8__format14__formatter_fpIcE6formatIfNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	movq	%rax, 16(%rbx)
	addq	$200, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L3902:
	movq	(%rbx), %r9
	movl	$2, %r8d
	leaq	128(%rsp), %rcx
	movups	%xmm0, 128(%rsp)
	movups	%xmm0, 144(%rsp)
	leaq	8(%r9), %rdx
	movq	%r9, 56(%rsp)
	movb	$32, 132(%rsp)
	call	_ZNSt8__format15__formatter_intIcE11_M_do_parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE
	movq	56(%rsp), %r9
	movq	%rax, %rdx
	movzbl	152(%rsp), %eax
	andl	$15, %eax
	cmpb	$2, %al
	je	.L3941
	movq	(%rbx), %rax
	movq	%rdx, 8(%r9)
	leaq	128(%rsp), %rcx
	movzbl	(%rsi), %edx
	movq	56(%rax), %rbx
	movq	%rbx, %r8
	call	_ZNKSt8__format15__formatter_intIcE6formatIhNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	jmp	.L3938
	.p2align 4,,10
	.p2align 3
.L3901:
	movq	(%rbx), %r9
	movl	$5, %r8d
	leaq	160(%rsp), %rcx
	movups	%xmm0, 160(%rsp)
	movups	%xmm0, 176(%rsp)
	leaq	8(%r9), %rdx
	movq	%r9, 56(%rsp)
	movl	$32, 164(%rsp)
	call	_ZNSt8__format15__formatter_intIcE11_M_do_parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE
	movq	56(%rsp), %r9
	movl	(%rsi), %edx
	leaq	160(%rsp), %rcx
	movq	%rax, 8(%r9)
	movq	(%rbx), %rax
	movq	56(%rax), %rbx
	movq	%rbx, %r8
	call	_ZNKSt8__format15__formatter_intIcE6formatIiNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	movq	%rax, 16(%rbx)
	jmp	.L3882
	.p2align 4,,10
	.p2align 3
.L3900:
	movq	(%rbx), %r9
	movl	$5, %r8d
	leaq	160(%rsp), %rcx
	movups	%xmm0, 160(%rsp)
	movups	%xmm0, 176(%rsp)
	leaq	8(%r9), %rdx
	movq	%r9, 56(%rsp)
	movl	$32, 164(%rsp)
	call	_ZNSt8__format15__formatter_intIcE11_M_do_parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE
	movq	56(%rsp), %r9
	movl	(%rsi), %edx
	leaq	160(%rsp), %rcx
	movq	%rax, 8(%r9)
	movq	(%rbx), %rax
	movq	56(%rax), %rbx
	movq	%rbx, %r8
	call	_ZNKSt8__format15__formatter_intIcE6formatIjNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	movq	%rax, 16(%rbx)
	jmp	.L3882
	.p2align 4,,10
	.p2align 3
.L3899:
	movq	(%rbx), %r9
	movl	$5, %r8d
	leaq	160(%rsp), %rcx
	movups	%xmm0, 160(%rsp)
	movups	%xmm0, 176(%rsp)
	leaq	8(%r9), %rdx
	movq	%r9, 56(%rsp)
	movl	$32, 164(%rsp)
	call	_ZNSt8__format15__formatter_intIcE11_M_do_parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE
	movq	56(%rsp), %r9
	movq	(%rsi), %rdx
	leaq	160(%rsp), %rcx
	movq	%rax, 8(%r9)
	movq	(%rbx), %rax
	movq	56(%rax), %rbx
	movq	%rbx, %r8
	call	_ZNKSt8__format15__formatter_intIcE6formatIxNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	movq	%rax, 16(%rbx)
	jmp	.L3882
	.p2align 4,,10
	.p2align 3
.L3887:
	movq	(%rbx), %r8
	leaq	160(%rsp), %rcx
	movups	%xmm0, 160(%rsp)
	movups	%xmm0, 176(%rsp)
	leaq	8(%r8), %rdx
	movq	%r8, 56(%rsp)
	movl	$32, 164(%rsp)
	call	_ZNSt8__format14__formatter_fpIcE5parseERSt26basic_format_parse_contextIcE
	movq	56(%rsp), %r8
	pinsrw	$0, (%rsi), %xmm0
	movq	%rax, 8(%r8)
	movq	(%rbx), %rax
	movq	56(%rax), %rbx
	call	__extendhfsf2
	jmp	.L3939
	.p2align 4,,10
	.p2align 3
.L3895:
	movq	(%rbx), %r8
	leaq	160(%rsp), %rcx
	movups	%xmm0, 160(%rsp)
	movups	%xmm0, 176(%rsp)
	leaq	8(%r8), %rdx
	movq	%r8, 56(%rsp)
	movl	$32, 164(%rsp)
	call	_ZNSt8__format14__formatter_fpIcE5parseERSt26basic_format_parse_contextIcE
	movq	56(%rsp), %r8
	fldt	(%rsi)
	leaq	80(%rsp), %rdx
	leaq	160(%rsp), %rcx
	movq	%rax, 8(%r8)
	movq	(%rbx), %rax
	movq	56(%rax), %rbx
	fstpt	80(%rsp)
	movq	%rbx, %r8
	call	_ZNKSt8__format14__formatter_fpIcE6formatIeNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	movq	%rax, 16(%rbx)
	jmp	.L3882
	.p2align 4,,10
	.p2align 3
.L3894:
	movq	(%rbx), %r8
	leaq	160(%rsp), %rcx
	movups	%xmm0, 160(%rsp)
	leaq	160(%rsp), %r14
	movups	%xmm0, 176(%rsp)
	leaq	8(%r8), %rdx
	movq	%r8, 56(%rsp)
	movl	$32, 164(%rsp)
	call	_ZNSt8__format15__formatter_strIcE5parseERSt26basic_format_parse_contextIcE
	movq	56(%rsp), %r8
	movzbl	180(%rsp), %edi
	movzwl	162(%rsp), %ebp
	movzbl	176(%rsp), %r15d
	movq	%rax, 8(%r8)
	movq	(%rsi), %rsi
	movq	(%rbx), %rax
	movq	%rsi, %rcx
	movq	56(%rax), %rbx
	call	strlen
	andl	$1, %edi
	movq	%rsi, 136(%rsp)
	movq	%rax, 128(%rsp)
	jne	.L3942
	testb	$15, %r15b
	je	.L3943
	movl	%r15d, %edx
	movzwl	%bp, %eax
	andl	$12, %edx
	cmpb	$4, %dl
	je	.L3923
	movq	$-1, %rax
	cmpb	$8, %dl
	je	.L3944
.L3923:
	leaq	128(%rsp), %rcx
	movq	%rax, %rdx
	call	_ZNSt8__format10__truncateIcEEyRSt17basic_string_viewIT_St11char_traitsIS2_EEy
	leaq	96(%rsp), %rcx
	movq	%r14, %r9
	movq	%rbx, %r8
	movl	$1, 32(%rsp)
	movq	%rax, %rdx
	movdqu	128(%rsp), %xmm0
	movups	%xmm0, 96(%rsp)
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	movq	%rax, %rcx
.L3918:
	movq	%rcx, 16(%rbx)
	jmp	.L3882
	.p2align 4,,10
	.p2align 3
.L3893:
	movq	(%rbx), %r8
	leaq	160(%rsp), %rcx
	movups	%xmm0, 160(%rsp)
	leaq	160(%rsp), %r14
	movups	%xmm0, 176(%rsp)
	leaq	8(%r8), %rdx
	movq	%r8, 56(%rsp)
	movl	$32, 164(%rsp)
	call	_ZNSt8__format15__formatter_strIcE5parseERSt26basic_format_parse_contextIcE
	movq	56(%rsp), %r8
	movzwl	162(%rsp), %r9d
	movq	%rax, %rcx
	movdqu	(%rsi), %xmm0
	movzbl	176(%rsp), %eax
	testb	$1, 180(%rsp)
	movq	%rcx, 8(%r8)
	movq	(%rbx), %rcx
	movups	%xmm0, 128(%rsp)
	movq	56(%rcx), %rbx
	jne	.L3945
	movq	(%rsi), %rsi
	testb	$15, %al
	je	.L3946
	andl	$12, %eax
	movzwl	%r9w, %edx
	cmpb	$4, %al
	je	.L3930
	movq	$-1, %rdx
	cmpb	$8, %al
	je	.L3947
.L3930:
	leaq	128(%rsp), %rcx
	movq	%rsi, 128(%rsp)
	call	_ZNSt8__format10__truncateIcEEyRSt17basic_string_viewIT_St11char_traitsIS2_EEy
	leaq	96(%rsp), %rcx
	movq	%r14, %r9
	movq	%rbx, %r8
	movl	$1, 32(%rsp)
	movq	%rax, %rdx
	movdqu	128(%rsp), %xmm0
	movups	%xmm0, 96(%rsp)
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	jmp	.L3938
	.p2align 4,,10
	.p2align 3
.L3892:
	movq	(%rbx), %r9
	leaq	128(%rsp), %rcx
	movabsq	$137438953472, %rax
	movl	$3, %r8d
	movq	%rax, 128(%rsp)
	movabsq	$4294967296, %rax
	leaq	8(%r9), %rdx
	movq	%r9, 56(%rsp)
	movq	%rax, 136(%rsp)
	movq	$0, 144(%rsp)
	movq	$3, 152(%rsp)
	call	_ZNSt8__format15__formatter_ptrIcE5parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE
	movq	56(%rsp), %r9
	movdqu	128(%rsp), %xmm0
	movq	%rax, 8(%r9)
	movq	(%rbx), %rax
	movq	(%rsi), %rdx
	movq	56(%rax), %rbx
	movups	%xmm0, 160(%rsp)
	movdqu	144(%rsp), %xmm0
	movups	%xmm0, 176(%rsp)
	movzbl	184(%rsp), %eax
	testb	$15, %al
	jne	.L3931
	andl	$-16, %eax
	orl	$5, %eax
	movb	%al, 184(%rsp)
.L3931:
	leaq	160(%rsp), %rcx
	movq	%rbx, %r8
	call	_ZNKSt8__format15__formatter_intIcE6formatIyNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	movq	%rax, 16(%rbx)
	jmp	.L3882
	.p2align 4,,10
	.p2align 3
.L3891:
	movq	(%rbx), %rcx
	movq	8(%rsi), %rax
	movq	(%rsi), %r8
	movq	56(%rcx), %rdx
	addq	$8, %rcx
	addq	$200, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r14
	popq	%r15
	rex.W jmp	*%rax
	.p2align 4,,10
	.p2align 3
.L3890:
	movq	(%rbx), %r9
	movl	$5, %r8d
	leaq	160(%rsp), %rcx
	movups	%xmm0, 160(%rsp)
	movups	%xmm0, 176(%rsp)
	leaq	8(%r9), %rdx
	movq	%r9, 56(%rsp)
	movl	$32, 164(%rsp)
	call	_ZNSt8__format15__formatter_intIcE11_M_do_parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE
	movq	56(%rsp), %r9
	movdqu	(%rsi), %xmm0
	leaq	64(%rsp), %rdx
	leaq	160(%rsp), %rcx
	movq	%rax, 8(%r9)
	movq	(%rbx), %rax
	movq	56(%rax), %rbx
	movups	%xmm0, 64(%rsp)
	movq	%rbx, %r8
	call	_ZNKSt8__format15__formatter_intIcE6formatInNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
	movq	%rax, 16(%rbx)
	jmp	.L3882
	.p2align 4,,10
	.p2align 3
.L3889:
	movq	(%rbx), %r9
	movl	$5, %r8d
	leaq	160(%rsp), %rcx
	movups	%xmm0, 160(%rsp)
	movups	%xmm0, 176(%rsp)
	leaq	8(%r9), %rdx
	movq	%r9, 56(%rsp)
	movl	$32, 164(%rsp)
	call	_ZNSt8__format15__formatter_intIcE11_M_do_parseERSt26basic_format_parse_contextIcENS_10_Pres_typeE
	movq	56(%rsp), %r9
	movdqu	(%rsi), %xmm0
	leaq	64(%rsp), %rdx
	leaq	160(%rsp), %rcx
	movq	%rax, 8(%r9)
	movq	(%rbx), %rax
	movq	56(%rax), %rbx
	movups	%xmm0, 64(%rsp)
	movq	%rbx, %r8
	call	_ZNKSt8__format15__formatter_intIcE6formatIoNS_10_Sink_iterIcEEEENSt20basic_format_contextIT0_cE8iteratorET_RS7_
.L3938:
	movq	%rax, 16(%rbx)
	addq	$200, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r14
	popq	%r15
	ret
	.p2align 4,,10
	.p2align 3
.L3941:
	movzbl	136(%rsp), %eax
	movzbl	140(%rsp), %ecx
	movzwl	128(%rsp), %r11d
	movzbl	144(%rsp), %r8d
	andl	$12, %eax
	andl	$5, %ecx
	orb	%cl, %al
	jne	.L3948
	movq	(%rbx), %rax
	testb	$1, 148(%rsp)
	movq	%rdx, 8(%r9)
	movq	56(%rax), %rbx
	movzbl	(%rsi), %eax
	movb	%al, 115(%rsp)
	jne	.L3910
	movl	$1, 32(%rsp)
	leaq	115(%rsp), %rcx
	movl	$1, %eax
	leaq	128(%rsp), %r9
	movq	%rcx, 104(%rsp)
	movq	%rbx, %r8
	leaq	96(%rsp), %rcx
	movl	$1, %edx
	movq	%rax, 96(%rsp)
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	jmp	.L3938
	.p2align 4,,10
	.p2align 3
.L3940:
	movzbl	168(%rsp), %eax
	movzbl	172(%rsp), %ecx
	andl	$12, %eax
	andl	$5, %ecx
	orb	%cl, %al
	je	.L3905
	leaq	.LC49(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	.p2align 4,,10
	.p2align 3
.L3942:
	movq	%r14, %rcx
	leaq	96(%rsp), %rdx
	movq	%rbx, %r8
	movq	%rax, 96(%rsp)
	movq	%rsi, 104(%rsp)
	call	_ZNKSt8__format15__formatter_strIcE17_M_format_escapedINS_10_Sink_iterIcEEEET_St17basic_string_viewIcSt11char_traitsIcEERSt20basic_format_contextIS5_cE
	movq	%rax, %rcx
	jmp	.L3918
	.p2align 4,,10
	.p2align 3
.L3945:
	leaq	96(%rsp), %rdx
	movq	%rbx, %r8
	movq	%r14, %rcx
	movups	%xmm0, 96(%rsp)
	call	_ZNKSt8__format15__formatter_strIcE17_M_format_escapedINS_10_Sink_iterIcEEEET_St17basic_string_viewIcSt11char_traitsIcEERSt20basic_format_contextIS5_cE
	jmp	.L3938
	.p2align 4,,10
	.p2align 3
.L3946:
	movq	16(%rbx), %rax
	testq	%rsi, %rsi
	je	.L3938
	movq	%rax, %rcx
	leaq	96(%rsp), %rdx
	movq	%rax, 56(%rsp)
	movups	%xmm0, 96(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	movq	56(%rsp), %rax
	jmp	.L3938
	.p2align 4,,10
	.p2align 3
.L3943:
	movq	16(%rbx), %rcx
	testq	%rax, %rax
	je	.L3918
	leaq	96(%rsp), %rdx
	movq	%rcx, 56(%rsp)
	movq	%rax, 96(%rsp)
	movq	%rsi, 104(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	movq	56(%rsp), %rcx
	jmp	.L3918
.L3910:
	andl	$3, %r8d
	cmpb	$1, %r8b
	je	.L3913
	cmpb	$2, %r8b
	je	.L3914
.L3915:
	leaq	115(%rsp), %rcx
	movl	$1, %eax
	leaq	96(%rsp), %rdx
	movl	$2, %r8d
	movq	%rcx, 104(%rsp)
	movq	16(%rbx), %rcx
	movq	%rax, 96(%rsp)
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
	jmp	.L3938
.L3947:
	movq	%rbx, %rdx
	movzwl	%r9w, %ecx
	call	_ZNKSt8__format5_SpecIcE16_M_get_precisionISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
	movq	%rax, %rdx
	jmp	.L3930
.L3944:
	movzwl	%bp, %ecx
	movq	%rbx, %rdx
	call	_ZNKSt8__format5_SpecIcE16_M_get_precisionISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
	jmp	.L3923
.L3914:
	movzwl	%r11w, %ecx
	movq	%rbx, %rdx
	call	_ZNKSt8__format5_SpecIcE12_M_get_widthISt20basic_format_contextINS_10_Sink_iterIcEEcEEEyRT_.part.0.isra.0
	movq	%rax, %r11
.L3913:
	cmpq	$3, %r11
	jbe	.L3915
	leaq	116(%rsp), %rax
	leaq	115(%rsp), %r8
	movq	.LC48(%rip), %xmm0
	movq	$12, 176(%rsp)
	movq	%rax, %xmm2
	movq	%rax, 184(%rsp)
	leaq	160(%rsp), %rcx
	leaq	96(%rsp), %rdx
	movq	%r8, 104(%rsp)
	punpcklqdq	%xmm2, %xmm0
	movl	$1, %eax
	movl	$2, %r8d
	movq	%rax, 96(%rsp)
	movups	%xmm0, 160(%rsp)
	call	_ZNSt8__format15__write_escapedIcNS_10_Sink_iterIcEEEET0_S3_St17basic_string_viewIT_St11char_traitsIS5_EENS_10_Term_charE
	movq	168(%rsp), %rcx
	movq	%rbx, %r8
	movq	184(%rsp), %rax
	movl	$3, %edx
	leaq	128(%rsp), %r9
	subq	%rcx, %rax
	cmpb	$92, 1(%rcx)
	movl	$1, 32(%rsp)
	cmove	%rax, %rdx
	movq	%rcx, 104(%rsp)
	leaq	96(%rsp), %rcx
	movq	%rax, 96(%rsp)
	call	_ZNSt8__format22__write_padded_as_specIcNS_10_Sink_iterIcEEEET0_St17basic_string_viewINSt13type_identityIT_E4typeESt11char_traitsIS8_EEyRSt20basic_format_contextIS3_S6_ERKNS_5_SpecIS6_EENS_6_AlignE
	jmp	.L3938
.L3904:
	call	_ZNSt8__format33__invalid_arg_id_in_format_stringEv
.L3948:
	leaq	.LC50(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcE13_M_format_argEy,"x"
	.linkonce discard
	.align 2
	.p2align 4
	.globl	_ZNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcE13_M_format_argEy
	.def	_ZNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcE13_M_format_argEy;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcE13_M_format_argEy
_ZNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcE13_M_format_argEy:
.LFB7371:
	subq	$120, %rsp
	.seh_stackalloc	120
	.seh_endprologue
	movq	56(%rcx), %r9
	movzbl	(%r9), %r8d
	movq	%rcx, %rax
	movq	%r8, %rcx
	andl	$15, %ecx
	cmpq	%rcx, %rdx
	jnb	.L3950
	movq	(%r9), %r8
	leaq	(%rdx,%rdx,4), %rcx
	salq	$4, %rdx
	addq	8(%r9), %rdx
	movdqu	(%rdx), %xmm0
	shrq	$4, %r8
	shrq	%cl, %r8
	movups	%xmm0, 48(%rsp)
	andl	$31, %r8d
.L3951:
	movdqu	48(%rsp), %xmm0
	movb	%r8b, 64(%rsp)
	leaq	40(%rsp), %rdx
	leaq	80(%rsp), %rcx
	movzbl	%r8b, %r8d
	movq	%rax, 40(%rsp)
	movups	%xmm0, 80(%rsp)
	movdqu	64(%rsp), %xmm0
	movups	%xmm0, 96(%rsp)
	call	_ZNSt16basic_format_argISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE8_M_visitIZNS1_19_Formatting_scannerIS3_cE13_M_format_argEyEUlRT_E_EEDcOS9_NS1_6_Arg_tE
	nop
	addq	$120, %rsp
	ret
	.p2align 4,,10
	.p2align 3
.L3950:
	andl	$15, %r8d
	jne	.L3952
	movq	(%r9), %rcx
	shrq	$4, %rcx
	cmpq	%rcx, %rdx
	jnb	.L3951
	salq	$5, %rdx
	addq	8(%r9), %rdx
	movdqu	(%rdx), %xmm0
	movzbl	16(%rdx), %r8d
	movups	%xmm0, 48(%rsp)
	jmp	.L3951
	.p2align 4,,10
	.p2align 3
.L3952:
	xorl	%r8d, %r8d
	jmp	.L3951
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC52:
	.ascii "format error: unmatched '}' in format string\0"
	.section	.text$_ZNSt8__format15__do_vformat_toIcLj1EEENS_10_Sink_iterIT_EES3_St17basic_string_viewIS2_St11char_traitsIS2_EERSt20basic_format_contextIS3_S2_E,"x"
	.linkonce discard
	.p2align 4
	.globl	_ZNSt8__format15__do_vformat_toIcLj1EEENS_10_Sink_iterIT_EES3_St17basic_string_viewIS2_St11char_traitsIS2_EERSt20basic_format_contextIS3_S2_E
	.def	_ZNSt8__format15__do_vformat_toIcLj1EEENS_10_Sink_iterIT_EES3_St17basic_string_viewIS2_St11char_traitsIS2_EERSt20basic_format_contextIS3_S2_E;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZNSt8__format15__do_vformat_toIcLj1EEENS_10_Sink_iterIT_EES3_St17basic_string_viewIS2_St11char_traitsIS2_EERSt20basic_format_contextIS3_S2_E
_ZNSt8__format15__do_vformat_toIcLj1EEENS_10_Sink_iterIT_EES3_St17basic_string_viewIS2_St11char_traitsIS2_EERSt20basic_format_contextIS3_S2_E:
.LFB6844:
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
	subq	$232, %rsp
	.seh_stackalloc	232
	.seh_endprologue
	movq	(%rdx), %r14
	movq	8(%rdx), %r13
	movq	%r14, %r12
	movq	%r13, %rbx
	movq	%rcx, 304(%rsp)
	movq	%r8, %rsi
	cmpq	$2, %r14
	jne	.L3954
	cmpb	$123, 0(%r13)
	je	.L4064
	leaq	2(%r13), %rax
	movdqu	.LC51(%rip), %xmm0
	movq	%r13, 168(%rsp)
	movq	%rax, 176(%rsp)
	leaq	16+_ZTVNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcEE(%rip), %rax
	movl	$0, 184(%rsp)
	movq	$0, 208(%rsp)
	movq	%rax, 160(%rsp)
	movq	%r8, 216(%rsp)
	movups	%xmm0, 192(%rsp)
.L3961:
	movq	%r14, %r8
	movl	$123, %edx
	movq	%r13, %rcx
	movq	$-1, %rbp
	call	memchr
	movq	%r14, %r8
	movl	$125, %edx
	movq	%r13, %rcx
	movq	%rax, %rdi
	leaq	160(%rsp), %r14
	subq	%r13, %rdi
	testq	%rax, %rax
	cmove	%rbp, %rdi
	call	memchr
	movq	%rax, %rsi
	subq	%r13, %rsi
	testq	%rax, %rax
	cmove	%rbp, %rsi
	.p2align 4
	.p2align 3
.L3966:
	cmpq	%rsi, %rdi
	je	.L4065
	jnb	.L3971
.L3970:
	leaq	1(%rdi), %rdx
	cmpq	%r12, %rdx
	je	.L3973
	movzbl	1(%rbx,%rdi), %eax
	cmpq	$-1, %rsi
	je	.L4008
	cmpb	$123, %al
	movq	168(%rsp), %rax
	sete	%dl
	sete	%r15b
	movzbl	%dl, %edx
	addq	%rdi, %rdx
	leaq	(%rax,%rdx), %r13
	leaq	1(%r13), %r12
	jne	.L4066
	movq	%r12, 168(%rsp)
	movq	176(%rsp), %rcx
.L3978:
	movsbw	(%r12), %ax
	cmpb	$125, %al
	je	.L4067
	cmpb	$58, %al
	je	.L4068
	cmpb	$48, %al
	je	.L4069
	leal	-49(%rax), %edx
	cmpb	$8, %dl
	ja	.L3989
	leaq	2(%r13), %r9
	movzbl	2(%r13), %edx
	subl	$48, %eax
	cmpq	%r9, %rcx
	je	.L3988
	leal	-48(%rdx), %r8d
	cmpb	$9, %r8b
	ja	.L3988
	movq	%r12, %r9
	xorl	%eax, %eax
	movl	$16, %r10d
	jmp	.L3999
	.p2align 4,,10
	.p2align 3
.L4070:
	leal	(%rax,%rax,4), %eax
	movzbl	%r8b, %r8d
	leal	(%r8,%rax,2), %eax
.L3994:
	addq	$1, %r9
	cmpq	%r9, %rcx
	je	.L4000
.L3999:
	movzbl	(%r9), %edi
	leal	-48(%rdi), %r8d
	cmpb	$9, %r8b
	ja	.L3992
	subl	$4, %r10d
	jns	.L4070
	movl	$10, %edx
	mulw	%dx
	jo	.L3989
	movzbl	%r8b, %r8d
	addw	%ax, %r8w
	jc	.L3989
	movl	%r8d, %eax
	jmp	.L3994
	.p2align 4,,10
	.p2align 3
.L3954:
	leaq	0(%r13,%r14), %rax
	movdqu	.LC51(%rip), %xmm0
	movq	%r13, 168(%rsp)
	movq	%rax, 176(%rsp)
	leaq	16+_ZTVNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcEE(%rip), %rax
	movl	$0, 184(%rsp)
	movq	$0, 208(%rsp)
	movq	%rax, 160(%rsp)
	movq	%r8, 216(%rsp)
	movups	%xmm0, 192(%rsp)
	testq	%r14, %r14
	jne	.L3961
.L3968:
	movq	304(%rsp), %rax
	addq	$232, %rsp
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
.L4073:
	cmpq	$-1, %rdi
	je	.L4007
	leaq	1(%rdi), %rdx
	cmpq	%rdx, %r12
	je	.L3973
	movzbl	1(%r13), %eax
	.p2align 4
	.p2align 3
.L4008:
	cmpb	$123, %al
	jne	.L3973
	movq	168(%rsp), %rax
	movq	216(%rsp), %rbp
	movq	$-1, %rsi
	movl	$1, %r15d
	leaq	(%rax,%rdx), %r13
	movq	16(%rbp), %rbx
	leaq	1(%r13), %r12
.L4014:
	xchgq	%rdx, %rax
	movq	%rbx, %rcx
	movq	%rdx, 40(%rsp)
	leaq	32(%rsp), %rdx
	movq	%rax, 32(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	movq	%rbx, 16(%rbp)
	movq	%r12, %rbx
	movq	176(%rsp), %rbp
	movq	%r12, 168(%rsp)
	movq	%rbp, %rcx
	testb	%r15b, %r15b
	je	.L3978
	leaq	-2(%rsi), %rax
	movq	%rbp, %r12
	subq	%rdi, %rax
	cmpq	$-1, %rsi
	cmovne	%rax, %rsi
	subq	%rbx, %r12
	je	.L3968
	movq	%r12, %r8
	movl	$123, %edx
	movq	%rbx, %rcx
	call	memchr
	movq	%rax, %rdi
	subq	%rbx, %rdi
	testq	%rax, %rax
	jne	.L3966
	cmpq	$-1, %rsi
	je	.L3969
	movq	$-1, %rdi
	.p2align 4
	.p2align 3
.L3971:
	leaq	1(%rsi), %r13
	cmpq	%r13, %r12
	je	.L4009
	cmpb	$125, 1(%rbx,%rsi)
	jne	.L4009
	movq	216(%rsp), %rbx
	movq	168(%rsp), %rbp
	movq	16(%rbx), %r12
	testq	%r13, %r13
	jne	.L4071
.L4010:
	movq	%r12, 16(%rbx)
	leaq	2(%rbp,%rsi), %rbx
	leaq	-1(%rdi), %rax
	movq	176(%rsp), %rbp
	subq	%r13, %rax
	cmpq	$-1, %rdi
	movq	%rbx, 168(%rsp)
	movq	%rbp, %r12
	cmovne	%rax, %rdi
	subq	%rbx, %r12
	je	.L3968
	movq	%r12, %r8
	movl	$125, %edx
	movq	%rbx, %rcx
	call	memchr
	movq	%rax, %rsi
	subq	%rbx, %rsi
	testq	%rax, %rax
	jne	.L3966
	movq	$-1, %rsi
	cmpq	$-1, %rdi
	jne	.L3970
.L4007:
	movq	216(%rsp), %rbx
	movq	168(%rsp), %rax
	movq	16(%rbx), %rsi
	subq	%rax, %rbp
.L4015:
	leaq	32(%rsp), %rdx
	movq	%rsi, %rcx
	movq	%rbp, 32(%rsp)
	movq	%rax, 40(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	movq	%rsi, 16(%rbx)
	jmp	.L3968
	.p2align 4,,10
	.p2align 3
.L4065:
	movq	176(%rsp), %rbp
.L3969:
	movq	216(%rsp), %rbx
	movq	168(%rsp), %rax
	movq	16(%rbx), %rsi
	subq	%rax, %rbp
	jne	.L4015
	movq	%rsi, 16(%rbx)
	jmp	.L3968
	.p2align 4,,10
	.p2align 3
.L4071:
	leaq	32(%rsp), %rdx
	movq	%r12, %rcx
	movq	%r13, 32(%rsp)
	movq	%rbp, 40(%rsp)
	call	_ZNSt8__format5_SinkIcE8_M_writeESt17basic_string_viewIcSt11char_traitsIcEE
	jmp	.L4010
	.p2align 4,,10
	.p2align 3
.L4067:
	cmpl	$1, 184(%rsp)
	je	.L3986
	movq	192(%rsp), %rax
	movl	$2, 184(%rsp)
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rsp)
.L3984:
	movq	216(%rsp), %rdx
	movzbl	(%rdx), %r8d
	movq	%r8, %rcx
	andl	$15, %ecx
	cmpq	%rcx, %rax
	jnb	.L4003
	movq	(%rdx), %r8
	leaq	(%rax,%rax,4), %rcx
	salq	$4, %rax
	addq	8(%rdx), %rax
	movdqu	(%rax), %xmm0
	shrq	$4, %r8
	shrq	%cl, %r8
	movups	%xmm0, 128(%rsp)
	andl	$31, %r8d
.L4004:
	leaq	96(%rsp), %rcx
	leaq	56(%rsp), %rdx
	movq	%r14, 56(%rsp)
	movdqu	128(%rsp), %xmm0
	movb	%r8b, 144(%rsp)
	movzbl	%r8b, %r8d
	movups	%xmm0, 96(%rsp)
	movdqu	144(%rsp), %xmm0
	movups	%xmm0, 112(%rsp)
	call	_ZNSt16basic_format_argISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE8_M_visitIZNS1_19_Formatting_scannerIS3_cE13_M_format_argEyEUlRT_E_EEDcOS9_NS1_6_Arg_tE
	movq	168(%rsp), %rbx
	movq	176(%rsp), %rbp
	cmpq	%rbp, %rbx
	je	.L3973
	cmpb	$125, (%rbx)
	jne	.L3973
	addq	$1, %rbx
	movq	%rbp, %r12
	movq	%rbx, 168(%rsp)
	subq	%rbx, %r12
	je	.L3968
	movq	%r12, %r8
	movl	$123, %edx
	movq	%rbx, %rcx
	call	memchr
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L4072
	movq	%r12, %r8
	movl	$125, %edx
	movq	%rbx, %rcx
	movq	%rax, %rdi
	call	memchr
	subq	%rbx, %rdi
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L4073
.L4006:
	subq	%rbx, %rsi
	jmp	.L3966
	.p2align 4,,10
	.p2align 3
.L4003:
	andl	$15, %r8d
	jne	.L4022
	movq	(%rdx), %rcx
	shrq	$4, %rcx
	cmpq	%rcx, %rax
	jnb	.L4004
	salq	$5, %rax
	addq	8(%rdx), %rax
	movdqu	(%rax), %xmm0
	movzbl	16(%rax), %r8d
	movups	%xmm0, 128(%rsp)
	jmp	.L4004
	.p2align 4,,10
	.p2align 3
.L4022:
	xorl	%r8d, %r8d
	jmp	.L4004
	.p2align 4,,10
	.p2align 3
.L4068:
	cmpl	$1, 184(%rsp)
	je	.L3986
	movq	192(%rsp), %rax
	addq	$2, %r13
	movl	$2, 184(%rsp)
	movq	%r13, 168(%rsp)
	leaq	1(%rax), %rdx
	movq	%rdx, 192(%rsp)
	jmp	.L3984
	.p2align 4,,10
	.p2align 3
.L4069:
	movzbl	2(%r13), %edx
	leaq	2(%r13), %r9
	xorl	%eax, %eax
.L3988:
	cmpb	$125, %dl
	je	.L4001
	cmpb	$58, %dl
	jne	.L3989
.L4001:
	movzwl	%ax, %eax
	cmpl	$2, 184(%rsp)
	je	.L3986
	movl	$1, 184(%rsp)
	xorl	%edx, %edx
	cmpb	$58, (%r9)
	sete	%dl
	addq	%rdx, %r9
	movq	%r9, 168(%rsp)
	jmp	.L3984
	.p2align 4,,10
	.p2align 3
.L4064:
	cmpb	$125, 1(%r13)
	je	.L4074
	leaq	2(%r13), %rax
	movdqu	.LC51(%rip), %xmm0
	movq	%r13, 168(%rsp)
	movq	%rax, 176(%rsp)
	leaq	16+_ZTVNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcEE(%rip), %rax
	movl	$0, 184(%rsp)
	movq	$0, 208(%rsp)
	movq	%rax, 160(%rsp)
	movq	%r8, 216(%rsp)
	movups	%xmm0, 192(%rsp)
.L4016:
	cmpb	$125, 1(%r13)
	jne	.L3961
	movl	$2, 184(%rsp)
	addq	$1, %r13
	movq	%r13, 168(%rsp)
	movq	$1, 192(%rsp)
	testb	$15, (%rsi)
	je	.L4075
	movq	8(%rsi), %rax
	movq	(%rsi), %r8
	movdqu	(%rax), %xmm0
	shrq	$4, %r8
	andl	$31, %r8d
	movups	%xmm0, 96(%rsp)
.L3967:
	movdqu	96(%rsp), %xmm0
	movb	%r8b, 112(%rsp)
	leaq	160(%rsp), %rax
	leaq	56(%rsp), %rdx
	leaq	128(%rsp), %rcx
	movzbl	%r8b, %r8d
	movq	%rax, 56(%rsp)
	movups	%xmm0, 128(%rsp)
	movdqu	112(%rsp), %xmm0
	movups	%xmm0, 144(%rsp)
	call	_ZNSt16basic_format_argISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE8_M_visitIZNS1_19_Formatting_scannerIS3_cE13_M_format_argEyEUlRT_E_EEDcOS9_NS1_6_Arg_tE
	jmp	.L3968
	.p2align 4,,10
	.p2align 3
.L4072:
	movq	%r12, %r8
	movl	$125, %edx
	movq	%rbx, %rcx
	call	memchr
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L4007
	movq	$-1, %rdi
	jmp	.L4006
.L4074:
	leaq	96(%rsp), %rax
	leaq	304(%rsp), %rcx
	movb	$0, 96(%rsp)
	movq	%rcx, %xmm0
	movq	%rax, %xmm2
	punpcklqdq	%xmm2, %xmm0
	testb	$15, (%r8)
	je	.L3957
	movq	8(%rsi), %rax
	movq	(%r8), %r8
	movdqu	(%rax), %xmm1
	shrq	$4, %r8
	andl	$31, %r8d
	movups	%xmm1, 64(%rsp)
.L3958:
	movups	%xmm0, 128(%rsp)
	movdqu	64(%rsp), %xmm0
	leaq	128(%rsp), %rdx
	leaq	160(%rsp), %rcx
	movb	%r8b, 80(%rsp)
	movzbl	%r8b, %r8d
	movups	%xmm0, 160(%rsp)
	movdqu	80(%rsp), %xmm0
	movups	%xmm0, 176(%rsp)
	call	_ZNSt16basic_format_argISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE8_M_visitIZNS1_15__do_vformat_toIcLj1EEENS2_IT_EES9_St17basic_string_viewIS8_St11char_traitsIS8_EERS0_IS9_S8_EEUlRS8_E_EEDcOS8_NS1_6_Arg_tE
	cmpb	$0, 96(%rsp)
	jne	.L3968
	leaq	2(%r13), %rax
	movdqu	.LC51(%rip), %xmm0
	movq	%r13, 168(%rsp)
	movq	%rax, 176(%rsp)
	leaq	16+_ZTVNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcEE(%rip), %rax
	movl	$0, 184(%rsp)
	movq	$0, 208(%rsp)
	movq	%rax, 160(%rsp)
	movq	%rsi, 216(%rsp)
	movups	%xmm0, 192(%rsp)
	cmpb	$123, 0(%r13)
	jne	.L3961
	jmp	.L4016
	.p2align 4,,10
	.p2align 3
.L3992:
	cmpq	%r12, %r9
	je	.L3989
.L4000:
	movzbl	(%r9), %edx
	jmp	.L3988
.L3957:
	movq	(%rsi), %rax
	xorl	%r8d, %r8d
	shrq	$4, %rax
	je	.L3958
	movq	8(%rsi), %rax
	movdqu	(%rax), %xmm1
	movzbl	16(%rax), %r8d
	movups	%xmm1, 64(%rsp)
	jmp	.L3958
.L4075:
	movq	(%rsi), %rax
	xorl	%r8d, %r8d
	shrq	$4, %rax
	je	.L3967
	movq	8(%rsi), %rax
	movdqu	(%rax), %xmm0
	movups	%xmm0, 96(%rsp)
	movzbl	16(%rax), %edx
	movb	%dl, 112(%rsp)
	movzbl	16(%rax), %r8d
	jmp	.L3967
.L4066:
	movq	216(%rsp), %rbp
	movq	16(%rbp), %rbx
	jmp	.L4014
.L3986:
	call	_ZNSt8__format39__conflicting_indexing_in_format_stringEv
.L3989:
	call	_ZNSt8__format33__invalid_arg_id_in_format_stringEv
.L4009:
	leaq	.LC52(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
.L3973:
	leaq	.LC6(%rip), %rcx
	call	_ZSt20__throw_format_errorPKc
	nop
	.seh_endproc
	.section	.text$_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE,"x"
	.linkonce discard
	.p2align 4
	.globl	_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE
	.def	_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE
_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE:
.LFB5178:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$448, %rsp
	.seh_stackalloc	448
	.seh_endprologue
	movq	.LC53(%rip), %xmm1
	movdqu	(%r8), %xmm0
	movq	(%rdx), %r9
	movq	8(%rdx), %r10
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
	movq	%r9, 64(%rsp)
	movq	%r10, 72(%rsp)
	movups	%xmm1, 128(%rsp)
	movups	%xmm0, 80(%rsp)
.LEHB62:
	call	_ZNSt8__format15__do_vformat_toIcLj1EEENS_10_Sink_iterIT_EES3_St17basic_string_viewIS2_St11char_traitsIS2_EERSt20basic_format_contextIS3_S2_E
.LEHE62:
	cmpb	$0, 112(%rsp)
	jne	.L4110
	movq	136(%rsp), %r9
	movq	152(%rsp), %r8
	cmpq	%r9, %r8
	je	.L4079
.L4078:
	movq	424(%rsp), %rdx
	subq	%r9, %r8
	movabsq	$9223372036854775806, %rax
	subq	%rdx, %rax
	cmpq	%r8, %rax
	jb	.L4111
	movq	416(%rsp), %rcx
	movl	$15, %eax
	leaq	(%r8,%rdx), %r10
	cmpq	%rsi, %rcx
	cmovne	432(%rsp), %rax
	cmpq	%r10, %rax
	jb	.L4085
	addq	%rdx, %rcx
	cmpq	$1, %r8
	je	.L4112
	movq	%r9, %rdx
	movq	%r10, 56(%rsp)
	call	memcpy
	movq	56(%rsp), %r10
	.p2align 4
	.p2align 3
.L4087:
	movq	416(%rsp), %rax
	leaq	16(%rbx), %rdx
	movb	$0, (%rax,%r10)
	movq	416(%rsp), %rax
	movq	%rdx, (%rbx)
	cmpq	%rsi, %rax
	jne	.L4099
.L4088:
	leaq	1(%r10), %rax
	cmpl	$64, %eax
	jnb	.L4090
	testb	$32, %al
	jne	.L4113
	testb	$16, %al
	jne	.L4114
	testb	$8, %al
	jne	.L4115
	testb	$4, %al
	jne	.L4116
	testl	%eax, %eax
	je	.L4089
	movzbl	432(%rsp), %ecx
	movb	%cl, (%rdx)
	testb	$2, %al
	je	.L4089
	movl	%eax, %eax
	movzwl	-2(%rsi,%rax), %ecx
	movw	%cx, -2(%rdx,%rax)
	jmp	.L4089
	.p2align 4,,10
	.p2align 3
.L4110:
	leaq	104(%rsp), %rcx
	call	_ZNSt6localeD1Ev
	movq	136(%rsp), %r9
	movq	152(%rsp), %r8
	cmpq	%r8, %r9
	jne	.L4078
.L4079:
	movq	416(%rsp), %rax
	leaq	16(%rbx), %rdx
	movq	424(%rsp), %r10
	movq	%rdx, (%rbx)
	cmpq	%rsi, %rax
	je	.L4088
.L4099:
	movq	%rax, (%rbx)
	movq	432(%rsp), %rax
	movq	%rax, 16(%rbx)
.L4089:
	movq	%rbx, %rax
	movq	%r10, 8(%rbx)
	addq	$448, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L4085:
	movq	%r8, 32(%rsp)
	leaq	416(%rsp), %rcx
	xorl	%r8d, %r8d
	leaq	416(%rsp), %rdi
	movq	%r10, 56(%rsp)
.LEHB63:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_mutateEyyPKcy
.LEHE63:
	movq	56(%rsp), %r10
	jmp	.L4087
	.p2align 4,,10
	.p2align 3
.L4090:
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
	jb	.L4089
	andl	$-64, %eax
	xorl	%r8d, %r8d
.L4097:
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
	jb	.L4097
	jmp	.L4089
	.p2align 4,,10
	.p2align 3
.L4112:
	movzbl	(%r9), %eax
	movb	%al, (%rcx)
	jmp	.L4087
.L4113:
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
	jmp	.L4089
.L4114:
	movdqu	432(%rsp), %xmm0
	movl	%eax, %eax
	movups	%xmm0, (%rdx)
	movdqu	-16(%rsi,%rax), %xmm0
	movups	%xmm0, -16(%rdx,%rax)
	jmp	.L4089
.L4115:
	movq	432(%rsp), %rcx
	movl	%eax, %eax
	movq	%rcx, (%rdx)
	movq	-8(%rsi,%rax), %rcx
	movq	%rcx, -8(%rdx,%rax)
	jmp	.L4089
.L4116:
	movl	432(%rsp), %ecx
	movl	%eax, %eax
	movl	%ecx, (%rdx)
	movl	-4(%rsi,%rax), %ecx
	movl	%ecx, -4(%rdx,%rax)
	jmp	.L4089
.L4104:
	movq	%rax, %rbx
	cmpb	$0, 112(%rsp)
	je	.L4081
	leaq	104(%rsp), %rcx
	call	_ZNSt6localeD1Ev
.L4081:
	leaq	416(%rsp), %rdi
.L4082:
	leaq	16+_ZTVNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE(%rip), %rax
	movq	%rdi, %rcx
	movq	%rax, 128(%rsp)
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rcx
.LEHB64:
	call	_Unwind_Resume
.LEHE64:
.L4111:
	leaq	.LC9(%rip), %rcx
	leaq	416(%rsp), %rdi
.LEHB65:
	call	_ZSt20__throw_length_errorPKc
.LEHE65:
.L4103:
	movq	%rax, %rbx
	jmp	.L4082
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA5178:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5178-.LLSDACSB5178
.LLSDACSB5178:
	.uleb128 .LEHB62-.LFB5178
	.uleb128 .LEHE62-.LEHB62
	.uleb128 .L4104-.LFB5178
	.uleb128 0
	.uleb128 .LEHB63-.LFB5178
	.uleb128 .LEHE63-.LEHB63
	.uleb128 .L4103-.LFB5178
	.uleb128 0
	.uleb128 .LEHB64-.LFB5178
	.uleb128 .LEHE64-.LEHB64
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB65-.LFB5178
	.uleb128 .LEHE65-.LEHB65
	.uleb128 .L4103-.LFB5178
	.uleb128 0
.LLSDACSE5178:
	.section	.text$_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE,"x"
	.linkonce discard
	.seh_endproc
	.section .rdata,"dr"
.LC54:
	.ascii "10/2 -> {}\0"
	.align 8
.LC55:
	.ascii "1/0 \346\234\211\345\200\274\345\220\227\357\274\232{}\357\274\214\351\224\231\350\257\257\347\240\201 {}\0"
.LC56:
	.ascii "9/3 \345\206\215 +1 = {}\0"
.LC57:
	.ascii "Color::Green \345\272\225\345\261\202\345\200\274 = {}\0"
.LC58:
	.ascii "contains(\"42\") = {}\0"
	.align 8
.LC59:
	.ascii "ranges::to \344\271\213\345\220\216 size={}\357\274\214\346\234\253\345\205\203\347\264\240={}\0"
.LC60:
	.ascii "Widget::scale(4) = {}\0"
.LC61:
	.ascii "deducing this \350\257\273\345\217\226 x = {}\0"
	.align 8
.LC62:
	.ascii "const \345\257\271\350\261\241\344\271\237\350\203\275\350\260\203\347\224\250\345\220\214\344\270\200\344\270\252\346\250\241\346\235\277\357\274\232{}\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB5669:
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
	subq	$232, %rsp
	.seh_stackalloc	232
	.seh_endprologue
	leaq	192(%rsp), %rbx
	leaq	160(%rsp), %rbp
	call	__main
	leaq	.LC54(%rip), %rax
	movq	%rbx, %rcx
	leaq	48(%rsp), %r8
	leaq	64(%rsp), %rdx
	movq	%rax, 72(%rsp)
	movl	$5, 160(%rsp)
	movq	$10, 64(%rsp)
	movq	$49, 48(%rsp)
	movq	%rbp, 56(%rsp)
.LEHB66:
	call	_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE
.LEHE66:
	movq	192(%rsp), %rcx
.LEHB67:
	call	puts
.LEHE67:
	movq	192(%rsp), %rcx
	leaq	208(%rsp), %rsi
	cmpq	%rsi, %rcx
	je	.L4118
	movq	208(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L4118:
	leaq	.LC55(%rip), %rax
	movq	%rbp, %rcx
	leaq	48(%rsp), %r8
	movb	$0, 192(%rsp)
	leaq	64(%rsp), %rdx
	movq	%rax, 72(%rsp)
	movl	$0, 208(%rsp)
	movq	$33, 64(%rsp)
	movq	$1554, 48(%rsp)
	movq	%rbx, 56(%rsp)
.LEHB68:
	call	_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE
.LEHE68:
	movq	160(%rsp), %rcx
.LEHB69:
	call	puts
.LEHE69:
	movq	160(%rsp), %rcx
	leaq	176(%rsp), %r14
	cmpq	%r14, %rcx
	je	.L4119
	movq	176(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L4119:
	leaq	.LC56(%rip), %rax
	movq	%rbx, %rcx
	leaq	48(%rsp), %r8
	movl	$4, 160(%rsp)
	leaq	64(%rsp), %rdx
	movq	%rax, 72(%rsp)
	movq	$15, 64(%rsp)
	movq	$49, 48(%rsp)
	movq	%rbp, 56(%rsp)
.LEHB70:
	call	_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE
.LEHE70:
	movq	192(%rsp), %rcx
.LEHB71:
	call	puts
.LEHE71:
	movq	192(%rsp), %rcx
	cmpq	%rsi, %rcx
	je	.L4120
	movq	208(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L4120:
	leaq	.LC57(%rip), %rax
	movq	%rbx, %rcx
	leaq	48(%rsp), %r8
	movl	$2, 160(%rsp)
	leaq	64(%rsp), %rdx
	movq	%rax, 72(%rsp)
	movq	$27, 64(%rsp)
	movq	$49, 48(%rsp)
	movq	%rbp, 56(%rsp)
.LEHB72:
	call	_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE
.LEHE72:
	movq	192(%rsp), %rcx
.LEHB73:
	call	puts
.LEHE73:
	movq	192(%rsp), %rcx
	cmpq	%rsi, %rcx
	je	.L4121
	movq	208(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L4121:
	movl	$17, %ecx
.LEHB74:
	call	_Znwy
.LEHE74:
	movdqu	.LC63(%rip), %xmm0
	movq	$16, 144(%rsp)
	movl	$16, %r8d
	movq	%rax, 128(%rsp)
	movq	%rax, %rdi
	movq	%rax, %rcx
	movb	$0, 16(%rax)
	movq	$16, 136(%rsp)
	movups	%xmm0, (%rax)
.L4125:
	subq	$1, %r8
	movl	$52, %edx
	call	memchr
	testq	%rax, %rax
	je	.L4126
	cmpw	$12852, (%rax)
	je	.L4166
	leaq	1(%rax), %rcx
	leaq	16(%rdi), %r8
	subq	%rcx, %r8
	cmpq	$1, %r8
	ja	.L4125
.L4126:
	movq	$-1, %rax
.L4123:
	leaq	.LC58(%rip), %rdx
	cmpq	$-1, %rax
	leaq	48(%rsp), %r8
	movq	%rbx, %rcx
	movq	%rdx, 72(%rsp)
	leaq	80(%rsp), %rax
	leaq	64(%rsp), %rdx
	movq	$19, 64(%rsp)
	movq	$17, 48(%rsp)
	movq	%rax, 56(%rsp)
	setne	80(%rsp)
.LEHB75:
	call	_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE
.LEHE75:
	movq	192(%rsp), %rcx
.LEHB76:
	call	puts
.LEHE76:
	movq	192(%rsp), %rcx
	cmpq	%rsi, %rcx
	je	.L4127
	movq	208(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L4127:
	movl	$20, %ecx
.LEHB77:
	call	_Znwy
.LEHE77:
	movq	%rax, %r13
	movl	$20, %ecx
	leaq	20(%rax), %rax
	movq	%rax, 40(%rsp)
.LEHB78:
	call	_Znwy
.LEHE78:
	movq	%rax, %r12
	leaq	20(%rax), %r15
	leaq	48(%rsp), %r8
	movq	%rbp, %rcx
	movl	$10, 16(%rax)
	leaq	64(%rsp), %rdx
	leaq	.LC59(%rip), %rax
	movq	$5, 192(%rsp)
	movl	$10, 208(%rsp)
	movq	$40, 64(%rsp)
	movq	%rax, 72(%rsp)
	movq	$1634, 48(%rsp)
	movq	%rbx, 56(%rsp)
.LEHB79:
	call	_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE
.LEHE79:
	movq	160(%rsp), %rcx
.LEHB80:
	call	puts
.LEHE80:
	movq	160(%rsp), %rcx
	cmpq	%r14, %rcx
	je	.L4134
	movq	176(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L4134:
	leaq	.LC60(%rip), %rdx
	leaq	96(%rsp), %rax
	movq	%rbx, %rcx
	movl	$40, 96(%rsp)
	movq	%rdx, 72(%rsp)
	leaq	48(%rsp), %r8
	leaq	64(%rsp), %rdx
	movq	$21, 64(%rsp)
	movq	$49, 48(%rsp)
	movq	%rax, 56(%rsp)
.LEHB81:
	call	_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE
.LEHE81:
	movq	192(%rsp), %rcx
.LEHB82:
	call	puts
.LEHE82:
	movq	192(%rsp), %rcx
	cmpq	%rsi, %rcx
	je	.L4135
	movq	208(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L4135:
	leaq	.LC61(%rip), %rdx
	leaq	112(%rsp), %rax
	movq	%rbx, %rcx
	movl	$5, 112(%rsp)
	movq	%rdx, 72(%rsp)
	leaq	48(%rsp), %r8
	leaq	64(%rsp), %rdx
	movq	$27, 64(%rsp)
	movq	$49, 48(%rsp)
	movq	%rax, 56(%rsp)
.LEHB83:
	call	_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE
.LEHE83:
	movq	192(%rsp), %rcx
.LEHB84:
	call	puts
.LEHE84:
	movq	192(%rsp), %rcx
	cmpq	%rsi, %rcx
	je	.L4136
	movq	208(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L4136:
	leaq	.LC62(%rip), %rax
	leaq	48(%rsp), %r8
	movq	%rbx, %rcx
	movq	%rbp, 56(%rsp)
	leaq	64(%rsp), %rdx
	movq	%rax, 72(%rsp)
	movl	$9, 160(%rsp)
	movq	$44, 64(%rsp)
	movq	$49, 48(%rsp)
.LEHB85:
	call	_ZSt7vformatB5cxx11St17basic_string_viewIcSt11char_traitsIcEESt17basic_format_argsISt20basic_format_contextINSt8__format10_Sink_iterIcEEcEE
.LEHE85:
	movq	192(%rsp), %rcx
.LEHB86:
	call	puts
.LEHE86:
	movq	192(%rsp), %rcx
	cmpq	%rsi, %rcx
	je	.L4137
	movq	208(%rsp), %rax
	leaq	1(%rax), %rdx
	call	_ZdlPvy
.L4137:
	movq	%r15, %rdx
	movq	%r12, %rcx
	call	_ZNSt12_Vector_baseIiSaIiEED2Ev.isra.0
	leaq	20(%r13), %rdx
	movq	%r13, %rcx
	call	_ZNSt12_Vector_baseIiSaIiEED2Ev.isra.0
	movl	$17, %edx
	movq	%rdi, %rcx
	call	_ZdlPvy
	xorl	%eax, %eax
	addq	$232, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L4166:
	subq	%rdi, %rax
	jmp	.L4123
.L4153:
	movq	%rax, %rbx
.L4130:
	leaq	128(%rsp), %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rcx
.LEHB87:
	call	_Unwind_Resume
.L4148:
.L4165:
	movq	%rax, %rsi
	movq	%rbx, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rsi, %rcx
	call	_Unwind_Resume
.L4151:
	jmp	.L4165
.L4150:
	jmp	.L4165
.L4149:
	movq	%rax, %rbx
	movq	%rbp, %rcx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	movq	%rbx, %rcx
	call	_Unwind_Resume
.LEHE87:
.L4158:
.L4164:
	movq	%rbx, %rcx
	movq	%rax, %rsi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
.L4144:
	movq	%r15, %rdx
	movq	%r12, %rcx
	movq	%rsi, %rbx
	call	_ZNSt12_Vector_baseIiSaIiEED2Ev.isra.0
.L4133:
	leaq	20(%r13), %rdx
	movq	%r13, %rcx
	call	_ZNSt12_Vector_baseIiSaIiEED2Ev.isra.0
	jmp	.L4130
.L4157:
	jmp	.L4164
.L4156:
	jmp	.L4164
.L4154:
	movq	%rbp, %rcx
	movq	%rax, %rsi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L4144
.L4155:
	movq	%rax, %rsi
	jmp	.L4144
.L4160:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rax, %rbx
	call	_ZNSt12_Vector_baseIiSaIiEED2Ev.isra.0
	jmp	.L4133
.L4159:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movq	%rax, %rbx
	call	_ZNSt12_Vector_baseIiSaIiEED2Ev.isra.0
	jmp	.L4130
.L4152:
	movq	%rbx, %rcx
	movq	%rax, %rbx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv
	jmp	.L4130
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA5669:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5669-.LLSDACSB5669
.LLSDACSB5669:
	.uleb128 .LEHB66-.LFB5669
	.uleb128 .LEHE66-.LEHB66
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB67-.LFB5669
	.uleb128 .LEHE67-.LEHB67
	.uleb128 .L4148-.LFB5669
	.uleb128 0
	.uleb128 .LEHB68-.LFB5669
	.uleb128 .LEHE68-.LEHB68
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB69-.LFB5669
	.uleb128 .LEHE69-.LEHB69
	.uleb128 .L4149-.LFB5669
	.uleb128 0
	.uleb128 .LEHB70-.LFB5669
	.uleb128 .LEHE70-.LEHB70
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB71-.LFB5669
	.uleb128 .LEHE71-.LEHB71
	.uleb128 .L4150-.LFB5669
	.uleb128 0
	.uleb128 .LEHB72-.LFB5669
	.uleb128 .LEHE72-.LEHB72
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB73-.LFB5669
	.uleb128 .LEHE73-.LEHB73
	.uleb128 .L4151-.LFB5669
	.uleb128 0
	.uleb128 .LEHB74-.LFB5669
	.uleb128 .LEHE74-.LEHB74
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB75-.LFB5669
	.uleb128 .LEHE75-.LEHB75
	.uleb128 .L4153-.LFB5669
	.uleb128 0
	.uleb128 .LEHB76-.LFB5669
	.uleb128 .LEHE76-.LEHB76
	.uleb128 .L4152-.LFB5669
	.uleb128 0
	.uleb128 .LEHB77-.LFB5669
	.uleb128 .LEHE77-.LEHB77
	.uleb128 .L4159-.LFB5669
	.uleb128 0
	.uleb128 .LEHB78-.LFB5669
	.uleb128 .LEHE78-.LEHB78
	.uleb128 .L4160-.LFB5669
	.uleb128 0
	.uleb128 .LEHB79-.LFB5669
	.uleb128 .LEHE79-.LEHB79
	.uleb128 .L4155-.LFB5669
	.uleb128 0
	.uleb128 .LEHB80-.LFB5669
	.uleb128 .LEHE80-.LEHB80
	.uleb128 .L4154-.LFB5669
	.uleb128 0
	.uleb128 .LEHB81-.LFB5669
	.uleb128 .LEHE81-.LEHB81
	.uleb128 .L4155-.LFB5669
	.uleb128 0
	.uleb128 .LEHB82-.LFB5669
	.uleb128 .LEHE82-.LEHB82
	.uleb128 .L4156-.LFB5669
	.uleb128 0
	.uleb128 .LEHB83-.LFB5669
	.uleb128 .LEHE83-.LEHB83
	.uleb128 .L4155-.LFB5669
	.uleb128 0
	.uleb128 .LEHB84-.LFB5669
	.uleb128 .LEHE84-.LEHB84
	.uleb128 .L4157-.LFB5669
	.uleb128 0
	.uleb128 .LEHB85-.LFB5669
	.uleb128 .LEHE85-.LEHB85
	.uleb128 .L4155-.LFB5669
	.uleb128 0
	.uleb128 .LEHB86-.LFB5669
	.uleb128 .LEHE86-.LEHB86
	.uleb128 .L4158-.LFB5669
	.uleb128 0
	.uleb128 .LEHB87-.LFB5669
	.uleb128 .LEHE87-.LEHB87
	.uleb128 0
	.uleb128 0
.LLSDACSE5669:
	.section	.text.startup,"x"
	.seh_endproc
	.section .rdata,"dr"
	.align 8
CSWTCH.794:
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.globl	_ZTSNSt8__format14_Fixedbuf_sinkIcEE
	.section	.rdata$_ZTSNSt8__format14_Fixedbuf_sinkIcEE,"dr"
	.linkonce same_size
	.align 32
_ZTSNSt8__format14_Fixedbuf_sinkIcEE:
	.ascii "NSt8__format14_Fixedbuf_sinkIcEE\0"
	.globl	_ZTINSt8__format14_Fixedbuf_sinkIcEE
	.section	.rdata$_ZTINSt8__format14_Fixedbuf_sinkIcEE,"dr"
	.linkonce same_size
	.align 8
_ZTINSt8__format14_Fixedbuf_sinkIcEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt8__format14_Fixedbuf_sinkIcEE
	.quad	_ZTINSt8__format5_SinkIcEE
	.globl	_ZTSNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcEE
	.section	.rdata$_ZTSNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcEE,"dr"
	.linkonce same_size
	.align 32
_ZTSNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcEE:
	.ascii "NSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcEE\0"
	.globl	_ZTINSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcEE
	.section	.rdata$_ZTINSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcEE,"dr"
	.linkonce same_size
	.align 8
_ZTINSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcEE
	.quad	_ZTINSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE
	.globl	_ZTVNSt8__format14_Fixedbuf_sinkIcEE
	.section	.rdata$_ZTVNSt8__format14_Fixedbuf_sinkIcEE,"dr"
	.linkonce same_size
	.align 8
_ZTVNSt8__format14_Fixedbuf_sinkIcEE:
	.quad	0
	.quad	_ZTINSt8__format14_Fixedbuf_sinkIcEE
	.quad	_ZNSt8__format14_Fixedbuf_sinkIcE11_M_overflowEv
	.quad	_ZNSt8__format5_SinkIcE10_M_reserveEy
	.quad	_ZNSt8__format5_SinkIcE7_M_bumpEy
	.quad	_ZNKSt8__format5_SinkIcE13_M_discardingEv
	.globl	_ZTVNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcEE
	.section	.rdata$_ZTVNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcEE,"dr"
	.linkonce same_size
	.align 8
_ZTVNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcEE:
	.quad	0
	.quad	_ZTINSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcEE
	.quad	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE11_M_overflowEv
	.quad	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE10_M_reserveEy
	.quad	_ZNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE7_M_bumpEy
	.quad	_ZNKSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcE13_M_discardingEv
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
	.globl	_ZTSSt13runtime_error
	.section	.rdata$_ZTSSt13runtime_error,"dr"
	.linkonce same_size
	.align 16
_ZTSSt13runtime_error:
	.ascii "St13runtime_error\0"
	.globl	_ZTISt13runtime_error
	.section	.rdata$_ZTISt13runtime_error,"dr"
	.linkonce same_size
	.align 8
_ZTISt13runtime_error:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSSt13runtime_error
	.quad	_ZTISt9exception
	.globl	_ZTSSt12format_error
	.section	.rdata$_ZTSSt12format_error,"dr"
	.linkonce same_size
	.align 16
_ZTSSt12format_error:
	.ascii "St12format_error\0"
	.globl	_ZTISt12format_error
	.section	.rdata$_ZTISt12format_error,"dr"
	.linkonce same_size
	.align 8
_ZTISt12format_error:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSSt12format_error
	.quad	_ZTISt13runtime_error
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
	.globl	_ZTSNSt8__format8_ScannerIcEE
	.section	.rdata$_ZTSNSt8__format8_ScannerIcEE,"dr"
	.linkonce same_size
	.align 16
_ZTSNSt8__format8_ScannerIcEE:
	.ascii "NSt8__format8_ScannerIcEE\0"
	.globl	_ZTINSt8__format8_ScannerIcEE
	.section	.rdata$_ZTINSt8__format8_ScannerIcEE,"dr"
	.linkonce same_size
	.align 8
_ZTINSt8__format8_ScannerIcEE:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTSNSt8__format8_ScannerIcEE
	.globl	_ZTSNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcEE
	.section	.rdata$_ZTSNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcEE,"dr"
	.linkonce same_size
	.align 32
_ZTSNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcEE:
	.ascii "NSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcEE\0"
	.globl	_ZTINSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcEE
	.section	.rdata$_ZTINSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcEE,"dr"
	.linkonce same_size
	.align 8
_ZTINSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcEE
	.quad	_ZTINSt8__format8_ScannerIcEE
	.globl	_ZTVSt12format_error
	.section	.rdata$_ZTVSt12format_error,"dr"
	.linkonce same_size
	.align 8
_ZTVSt12format_error:
	.quad	0
	.quad	_ZTISt12format_error
	.quad	_ZNSt12format_errorD1Ev
	.quad	_ZNSt12format_errorD0Ev
	.quad	_ZNKSt13runtime_error4whatEv
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
	.globl	_ZTVNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcEE
	.section	.rdata$_ZTVNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcEE,"dr"
	.linkonce same_size
	.align 8
_ZTVNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcEE:
	.quad	0
	.quad	_ZTINSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcEE
	.quad	_ZNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcE11_M_on_charsEPKc
	.quad	_ZNSt8__format19_Formatting_scannerINS_10_Sink_iterIcEEcE13_M_format_argEy
	.globl	_ZNSt8__detail31__from_chars_alnum_to_val_tableILb0EE5valueE
	.section	.rdata$_ZNSt8__detail31__from_chars_alnum_to_val_tableILb0EE5valueE,"dr"
	.linkonce same_size
	.align 32
_ZNSt8__detail31__from_chars_alnum_to_val_tableILb0EE5valueE:
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	27
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.byte	32
	.byte	33
	.byte	34
	.byte	35
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	27
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.byte	32
	.byte	33
	.byte	34
	.byte	35
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.byte	127
	.globl	_ZNSt9__unicode9__v16_0_014__xpicto_edgesE
	.section	.rdata$_ZNSt9__unicode9__v16_0_014__xpicto_edgesE,"dr"
	.linkonce same_size
	.align 32
_ZNSt9__unicode9__v16_0_014__xpicto_edgesE:
	.long	169
	.long	170
	.long	174
	.long	175
	.long	8252
	.long	8253
	.long	8265
	.long	8266
	.long	8482
	.long	8483
	.long	8505
	.long	8506
	.long	8596
	.long	8602
	.long	8617
	.long	8619
	.long	8986
	.long	8988
	.long	9000
	.long	9001
	.long	9167
	.long	9168
	.long	9193
	.long	9204
	.long	9208
	.long	9211
	.long	9410
	.long	9411
	.long	9642
	.long	9644
	.long	9654
	.long	9655
	.long	9664
	.long	9665
	.long	9723
	.long	9727
	.long	9728
	.long	9733
	.long	9742
	.long	9743
	.long	9745
	.long	9746
	.long	9748
	.long	9750
	.long	9752
	.long	9753
	.long	9757
	.long	9758
	.long	9760
	.long	9761
	.long	9762
	.long	9764
	.long	9766
	.long	9767
	.long	9770
	.long	9771
	.long	9774
	.long	9776
	.long	9784
	.long	9787
	.long	9792
	.long	9793
	.long	9794
	.long	9795
	.long	9800
	.long	9812
	.long	9823
	.long	9825
	.long	9827
	.long	9828
	.long	9829
	.long	9831
	.long	9832
	.long	9833
	.long	9851
	.long	9852
	.long	9854
	.long	9856
	.long	9874
	.long	9880
	.long	9881
	.long	9882
	.long	9883
	.long	9885
	.long	9888
	.long	9890
	.long	9895
	.long	9896
	.long	9898
	.long	9900
	.long	9904
	.long	9906
	.long	9917
	.long	9919
	.long	9924
	.long	9926
	.long	9928
	.long	9929
	.long	9934
	.long	9936
	.long	9937
	.long	9938
	.long	9939
	.long	9941
	.long	9961
	.long	9963
	.long	9968
	.long	9974
	.long	9975
	.long	9979
	.long	9981
	.long	9982
	.long	9986
	.long	9987
	.long	9989
	.long	9990
	.long	9992
	.long	9998
	.long	9999
	.long	10000
	.long	10002
	.long	10003
	.long	10004
	.long	10005
	.long	10006
	.long	10007
	.long	10013
	.long	10014
	.long	10017
	.long	10018
	.long	10024
	.long	10025
	.long	10035
	.long	10037
	.long	10052
	.long	10053
	.long	10055
	.long	10056
	.long	10060
	.long	10061
	.long	10062
	.long	10063
	.long	10067
	.long	10070
	.long	10071
	.long	10072
	.long	10083
	.long	10085
	.long	10133
	.long	10136
	.long	10145
	.long	10146
	.long	10160
	.long	10161
	.long	10175
	.long	10176
	.long	10548
	.long	10550
	.long	11013
	.long	11016
	.long	11035
	.long	11037
	.long	11088
	.long	11089
	.long	11093
	.long	11094
	.long	12336
	.long	12337
	.long	12349
	.long	12350
	.long	12951
	.long	12952
	.long	12953
	.long	12954
	.long	126980
	.long	126981
	.long	127020
	.long	127024
	.long	127124
	.long	127136
	.long	127151
	.long	127153
	.long	127168
	.long	127169
	.long	127183
	.long	127185
	.long	127222
	.long	127232
	.long	127344
	.long	127346
	.long	127358
	.long	127360
	.long	127374
	.long	127375
	.long	127377
	.long	127387
	.long	127406
	.long	127462
	.long	127489
	.long	127504
	.long	127514
	.long	127515
	.long	127535
	.long	127536
	.long	127538
	.long	127547
	.long	127548
	.long	127552
	.long	127561
	.long	127584
	.long	127590
	.long	127778
	.long	127780
	.long	127892
	.long	127894
	.long	127896
	.long	127897
	.long	127900
	.long	127902
	.long	127985
	.long	127987
	.long	127990
	.long	127991
	.long	127995
	.long	128000
	.long	128254
	.long	128255
	.long	128318
	.long	128329
	.long	128335
	.long	128336
	.long	128360
	.long	128367
	.long	128369
	.long	128371
	.long	128379
	.long	128391
	.long	128392
	.long	128394
	.long	128398
	.long	128400
	.long	128401
	.long	128405
	.long	128407
	.long	128420
	.long	128422
	.long	128424
	.long	128425
	.long	128433
	.long	128435
	.long	128444
	.long	128445
	.long	128450
	.long	128453
	.long	128465
	.long	128468
	.long	128476
	.long	128479
	.long	128481
	.long	128482
	.long	128483
	.long	128484
	.long	128488
	.long	128489
	.long	128495
	.long	128496
	.long	128499
	.long	128500
	.long	128506
	.long	128592
	.long	128640
	.long	128710
	.long	128715
	.long	128723
	.long	128725
	.long	128742
	.long	128745
	.long	128746
	.long	128747
	.long	128753
	.long	128755
	.long	128768
	.long	128986
	.long	129024
	.long	129036
	.long	129040
	.long	129096
	.long	129104
	.long	129114
	.long	129120
	.long	129160
	.long	129168
	.long	129198
	.long	129200
	.long	129212
	.long	129216
	.long	129218
	.long	129232
	.long	129241
	.long	129280
	.long	129292
	.long	129339
	.long	129340
	.long	129350
	.long	129351
	.long	129536
	.long	129624
	.long	129632
	.long	129646
	.long	129792
	.long	130048
	.long	131070
	.globl	_ZNSt9__unicode9__v16_0_012__incb_edgesE
	.section	.rdata$_ZNSt9__unicode9__v16_0_012__incb_edgesE,"dr"
	.linkonce same_size
	.align 32
_ZNSt9__unicode9__v16_0_012__incb_edgesE:
	.long	3074
	.long	3520
	.long	4622
	.long	4648
	.long	5702
	.long	5880
	.long	5886
	.long	5888
	.long	5894
	.long	5900
	.long	5906
	.long	5912
	.long	5918
	.long	5920
	.long	6210
	.long	6252
	.long	6446
	.long	6528
	.long	6594
	.long	6596
	.long	7002
	.long	7028
	.long	7038
	.long	7060
	.long	7070
	.long	7076
	.long	7082
	.long	7096
	.long	7238
	.long	7240
	.long	7362
	.long	7468
	.long	7834
	.long	7876
	.long	8110
	.long	8144
	.long	8182
	.long	8184
	.long	8282
	.long	8296
	.long	8302
	.long	8336
	.long	8342
	.long	8352
	.long	8358
	.long	8376
	.long	8550
	.long	8560
	.long	8798
	.long	8832
	.long	9002
	.long	9096
	.long	9102
	.long	9228
	.long	9301
	.long	9450
	.long	9452
	.long	9458
	.long	9460
	.long	9478
	.long	9508
	.long	9542
	.long	9569
	.long	9600
	.long	9610
	.long	9616
	.long	9697
	.long	9728
	.long	9734
	.long	9736
	.long	9813
	.long	9892
	.long	9897
	.long	9924
	.long	9929
	.long	9932
	.long	9945
	.long	9960
	.long	9970
	.long	9972
	.long	9978
	.long	9980
	.long	9990
	.long	10004
	.long	10078
	.long	10080
	.long	10097
	.long	10104
	.long	10109
	.long	10112
	.long	10122
	.long	10128
	.long	10177
	.long	10184
	.long	10234
	.long	10236
	.long	10246
	.long	10252
	.long	10482
	.long	10484
	.long	10502
	.long	10508
	.long	10526
	.long	10532
	.long	10542
	.long	10552
	.long	10566
	.long	10568
	.long	10690
	.long	10696
	.long	10710
	.long	10712
	.long	10758
	.long	10764
	.long	10837
	.long	10916
	.long	10921
	.long	10948
	.long	10953
	.long	10960
	.long	10965
	.long	10984
	.long	10994
	.long	10996
	.long	11014
	.long	11032
	.long	11038
	.long	11044
	.long	11146
	.long	11152
	.long	11237
	.long	11242
	.long	11264
	.long	11270
	.long	11272
	.long	11349
	.long	11428
	.long	11433
	.long	11460
	.long	11465
	.long	11472
	.long	11477
	.long	11496
	.long	11506
	.long	11508
	.long	11514
	.long	11520
	.long	11526
	.long	11540
	.long	11606
	.long	11616
	.long	11633
	.long	11640
	.long	11645
	.long	11648
	.long	11658
	.long	11664
	.long	11717
	.long	11720
	.long	11786
	.long	11788
	.long	12026
	.long	12028
	.long	12034
	.long	12036
	.long	12086
	.long	12088
	.long	12126
	.long	12128
	.long	12290
	.long	12292
	.long	12306
	.long	12308
	.long	12373
	.long	12452
	.long	12457
	.long	12520
	.long	12530
	.long	12532
	.long	12538
	.long	12548
	.long	12570
	.long	12580
	.long	12586
	.long	12596
	.long	12630
	.long	12636
	.long	12641
	.long	12652
	.long	12682
	.long	12688
	.long	12806
	.long	12808
	.long	13042
	.long	13044
	.long	13054
	.long	13060
	.long	13066
	.long	13068
	.long	13082
	.long	13092
	.long	13098
	.long	13112
	.long	13142
	.long	13148
	.long	13194
	.long	13200
	.long	13314
	.long	13320
	.long	13397
	.long	13550
	.long	13556
	.long	13562
	.long	13564
	.long	13574
	.long	13588
	.long	13662
	.long	13664
	.long	13706
	.long	13712
	.long	13830
	.long	13832
	.long	14122
	.long	14124
	.long	14142
	.long	14144
	.long	14154
	.long	14164
	.long	14170
	.long	14172
	.long	14206
	.long	14208
	.long	14534
	.long	14536
	.long	14546
	.long	14572
	.long	14622
	.long	14652
	.long	15046
	.long	15048
	.long	15058
	.long	15092
	.long	15138
	.long	15164
	.long	15458
	.long	15464
	.long	15574
	.long	15576
	.long	15582
	.long	15584
	.long	15590
	.long	15592
	.long	15814
	.long	15868
	.long	15874
	.long	15892
	.long	15898
	.long	15904
	.long	15926
	.long	15968
	.long	15974
	.long	16116
	.long	16154
	.long	16156
	.long	16385
	.long	16556
	.long	16566
	.long	16580
	.long	16586
	.long	16608
	.long	16618
	.long	16620
	.long	16630
	.long	16637
	.long	16640
	.long	16705
	.long	16728
	.long	16738
	.long	16745
	.long	16762
	.long	16773
	.long	16776
	.long	16789
	.long	16796
	.long	16825
	.long	16838
	.long	16853
	.long	16906
	.long	16908
	.long	16918
	.long	16924
	.long	16950
	.long	16953
	.long	16956
	.long	17014
	.long	17016
	.long	19830
	.long	19840
	.long	23626
	.long	23640
	.long	23754
	.long	23764
	.long	23882
	.long	23888
	.long	24010
	.long	24016
	.long	24065
	.long	24274
	.long	24280
	.long	24286
	.long	24312
	.long	24346
	.long	24348
	.long	24358
	.long	24392
	.long	24398
	.long	24400
	.long	24438
	.long	24440
	.long	24622
	.long	24632
	.long	24638
	.long	24640
	.long	25110
	.long	25116
	.long	25254
	.long	25256
	.long	25730
	.long	25740
	.long	25758
	.long	25764
	.long	25802
	.long	25804
	.long	25830
	.long	25840
	.long	26718
	.long	26724
	.long	26734
	.long	26736
	.long	26753
	.long	26964
	.long	26970
	.long	26972
	.long	26978
	.long	27004
	.long	27018
	.long	27020
	.long	27030
	.long	27060
	.long	27086
	.long	27124
	.long	27134
	.long	27136
	.long	27330
	.long	27512
	.long	27522
	.long	27568
	.long	27650
	.long	27664
	.long	27693
	.long	27700
	.long	27725
	.long	27858
	.long	27896
	.long	27914
	.long	27920
	.long	27925
	.long	27956
	.long	28078
	.long	28112
	.long	28162
	.long	28168
	.long	28173
	.long	28292
	.long	28298
	.long	28312
	.long	28322
	.long	28332
	.long	28338
	.long	28345
	.long	28352
	.long	28397
	.long	28408
	.long	28570
	.long	28572
	.long	28578
	.long	28584
	.long	28598
	.long	28600
	.long	28606
	.long	28624
	.long	28850
	.long	28880
	.long	28890
	.long	28896
	.long	29506
	.long	29516
	.long	29522
	.long	29572
	.long	29578
	.long	29604
	.long	29622
	.long	29624
	.long	29650
	.long	29652
	.long	29666
	.long	29672
	.long	30466
	.long	30720
	.long	32822
	.long	32824
	.long	33602
	.long	33732
	.long	46014
	.long	46024
	.long	46590
	.long	46592
	.long	46978
	.long	47104
	.long	49322
	.long	49344
	.long	49766
	.long	49772
	.long	170430
	.long	170444
	.long	170450
	.long	170488
	.long	170618
	.long	170624
	.long	170946
	.long	170952
	.long	172042
	.long	172044
	.long	172058
	.long	172060
	.long	172078
	.long	172080
	.long	172182
	.long	172188
	.long	172210
	.long	172212
	.long	172818
	.long	172824
	.long	172930
	.long	173000
	.long	173054
	.long	173056
	.long	173210
	.long	173240
	.long	173342
	.long	173384
	.long	173390
	.long	173392
	.long	173570
	.long	173580
	.long	173605
	.long	173616
	.long	173629
	.long	173774
	.long	173776
	.long	173786
	.long	173800
	.long	173810
	.long	173816
	.long	173953
	.long	173974
	.long	173976
	.long	173981
	.long	174016
	.long	174057
	.long	174076
	.long	174246
	.long	174268
	.long	174278
	.long	174284
	.long	174294
	.long	174300
	.long	174350
	.long	174352
	.long	174386
	.long	174388
	.long	174465
	.long	174528
	.long	174533
	.long	174544
	.long	174569
	.long	174572
	.long	174578
	.long	174580
	.long	174585
	.long	174592
	.long	174786
	.long	174788
	.long	174794
	.long	174804
	.long	174814
	.long	174820
	.long	174842
	.long	174848
	.long	174854
	.long	174856
	.long	174977
	.long	175020
	.long	175026
	.long	175032
	.long	175873
	.long	175980
	.long	176022
	.long	176024
	.long	176034
	.long	176036
	.long	176054
	.long	176056
	.long	257146
	.long	257148
	.long	260098
	.long	260160
	.long	260226
	.long	260288
	.long	261754
	.long	261760
	.long	264182
	.long	264184
	.long	265090
	.long	265092
	.long	265690
	.long	265708
	.long	272385
	.long	272390
	.long	272400
	.long	272406
	.long	272412
	.long	272434
	.long	272449
	.long	272464
	.long	272469
	.long	272480
	.long	272485
	.long	272600
	.long	272610
	.long	272620
	.long	273302
	.long	273308
	.long	275602
	.long	275616
	.long	275878
	.long	275896
	.long	277166
	.long	277172
	.long	277482
	.long	277504
	.long	277786
	.long	277828
	.long	278026
	.long	278040
	.long	278534
	.long	278536
	.long	278754
	.long	278812
	.long	278978
	.long	278980
	.long	278990
	.long	278996
	.long	279038
	.long	279048
	.long	279246
	.long	279260
	.long	279270
	.long	279276
	.long	279306
	.long	279308
	.long	279554
	.long	279565
	.long	279710
	.long	279728
	.long	279734
	.long	279756
	.long	279762
	.long	279764
	.long	279825
	.long	279828
	.long	279837
	.long	279840
	.long	280014
	.long	280016
	.long	280066
	.long	280072
	.long	280282
	.long	280316
	.long	280322
	.long	280324
	.long	280358
	.long	280372
	.long	280382
	.long	280384
	.long	280766
	.long	280776
	.long	280786
	.long	280800
	.long	280826
	.long	280828
	.long	280838
	.long	280840
	.long	281470
	.long	281472
	.long	281486
	.long	281516
	.long	281602
	.long	281608
	.long	281838
	.long	281844
	.long	281850
	.long	281852
	.long	281858
	.long	281860
	.long	281910
	.long	281912
	.long	281950
	.long	281952
	.long	282010
	.long	282036
	.long	282050
	.long	282068
	.long	282113
	.long	282152
	.long	282157
	.long	282160
	.long	282169
	.long	282172
	.long	282177
	.long	282328
	.long	282338
	.long	282340
	.long	282350
	.long	282372
	.long	282378
	.long	282380
	.long	282390
	.long	282392
	.long	282398
	.long	282408
	.long	282426
	.long	282432
	.long	282442
	.long	282444
	.long	282502
	.long	282508
	.long	282850
	.long	282880
	.long	282890
	.long	282900
	.long	282906
	.long	282908
	.long	283002
	.long	283004
	.long	283330
	.long	283332
	.long	283342
	.long	283364
	.long	283370
	.long	283372
	.long	283382
	.long	283384
	.long	283390
	.long	283396
	.long	283402
	.long	283408
	.long	284350
	.long	284352
	.long	284362
	.long	284376
	.long	284402
	.long	284408
	.long	284414
	.long	284420
	.long	284530
	.long	284536
	.long	284878
	.long	284908
	.long	284918
	.long	284920
	.long	284926
	.long	284932
	.long	285358
	.long	285360
	.long	285366
	.long	285368
	.long	285378
	.long	285408
	.long	285814
	.long	285816
	.long	285822
	.long	285824
	.long	285834
	.long	285848
	.long	285854
	.long	285872
	.long	286910
	.long	286944
	.long	286950
	.long	286956
	.long	287745
	.long	287772
	.long	287781
	.long	287784
	.long	287793
	.long	287824
	.long	287829
	.long	287836
	.long	287841
	.long	287938
	.long	287940
	.long	287982
	.long	287992
	.long	288014
	.long	288016
	.long	288594
	.long	288608
	.long	288618
	.long	288624
	.long	288642
	.long	288644
	.long	288769
	.long	288774
	.long	288813
	.long	288974
	.long	288996
	.long	289006
	.long	289020
	.long	289089
	.long	289094
	.long	289116
	.long	289126
	.long	289137
	.long	289296
	.long	289322
	.long	289372
	.long	289378
	.long	289380
	.long	290178
	.long	290180
	.long	290186
	.long	290196
	.long	290202
	.long	290204
	.long	291010
	.long	291036
	.long	291042
	.long	291064
	.long	291070
	.long	291072
	.long	291402
	.long	291488
	.long	291498
	.long	291524
	.long	291530
	.long	291536
	.long	291542
	.long	291548
	.long	292038
	.long	292060
	.long	292074
	.long	292076
	.long	292082
	.long	292088
	.long	292094
	.long	292120
	.long	292126
	.long	292128
	.long	292418
	.long	292424
	.long	292438
	.long	292440
	.long	292446
	.long	292448
	.long	293838
	.long	293844
	.long	293890
	.long	293896
	.long	293905
	.long	293956
	.long	293961
	.long	294096
	.long	294106
	.long	294124
	.long	294146
	.long	294152
	.long	294250
	.long	294252
	.long	315650
	.long	315652
	.long	315678
	.long	315736
	.long	361594
	.long	361640
	.long	361654
	.long	361664
	.long	371650
	.long	371668
	.long	371906
	.long	371932
	.long	376126
	.long	376128
	.long	376382
	.long	376396
	.long	376722
	.long	376724
	.long	376770
	.long	376776
	.long	455286
	.long	455292
	.long	474114
	.long	474296
	.long	474306
	.long	474396
	.long	476566
	.long	476584
	.long	476598
	.long	476620
	.long	476654
	.long	476684
	.long	476694
	.long	476720
	.long	476842
	.long	476856
	.long	477450
	.long	477460
	.long	485378
	.long	485596
	.long	485614
	.long	485812
	.long	485846
	.long	485848
	.long	485906
	.long	485908
	.long	485998
	.long	486016
	.long	486022
	.long	486080
	.long	491522
	.long	491548
	.long	491554
	.long	491620
	.long	491630
	.long	491656
	.long	491662
	.long	491668
	.long	491674
	.long	491692
	.long	492094
	.long	492096
	.long	492738
	.long	492764
	.long	494266
	.long	494268
	.long	494514
	.long	494528
	.long	496562
	.long	496576
	.long	497594
	.long	497600
	.long	498574
	.long	498576
	.long	498586
	.long	498588
	.long	498618
	.long	498624
	.long	498646
	.long	498648
	.long	500546
	.long	500572
	.long	501010
	.long	501036
	.long	511982
	.long	512000
	.long	3670146
	.long	3670528
	.long	3671042
	.long	3672000
	.globl	_ZNSt9__unicode9__v16_0_014__incb_linkersE
	.section	.rdata$_ZNSt9__unicode9__v16_0_014__incb_linkersE,"dr"
	.linkonce same_size
	.align 32
_ZNSt9__unicode9__v16_0_014__incb_linkersE:
	.long	2381
	.long	2509
	.long	2765
	.long	2893
	.long	3149
	.long	3405
	.long	4153
	.long	6098
	.long	6752
	.long	6980
	.long	7083
	.long	43456
	.long	43766
	.long	68159
	.long	69939
	.long	70608
	.long	71998
	.long	72263
	.long	72345
	.long	73538
	.globl	_ZNSt9__unicode9__v16_0_011__gcb_edgesE
	.section	.rdata$_ZNSt9__unicode9__v16_0_011__gcb_edgesE,"dr"
	.linkonce same_size
	.align 32
_ZNSt9__unicode9__v16_0_011__gcb_edgesE:
	.long	1
	.long	162
	.long	177
	.long	211
	.long	225
	.long	512
	.long	2033
	.long	2560
	.long	2769
	.long	2784
	.long	12292
	.long	14080
	.long	18484
	.long	18592
	.long	22804
	.long	23520
	.long	23540
	.long	23552
	.long	23572
	.long	23600
	.long	23620
	.long	23648
	.long	23668
	.long	23680
	.long	24581
	.long	24672
	.long	24836
	.long	25008
	.long	25025
	.long	25040
	.long	25780
	.long	26112
	.long	26372
	.long	26384
	.long	28004
	.long	28117
	.long	28128
	.long	28148
	.long	28240
	.long	28276
	.long	28304
	.long	28324
	.long	28384
	.long	28917
	.long	28928
	.long	28948
	.long	28960
	.long	29444
	.long	29872
	.long	31332
	.long	31504
	.long	32436
	.long	32576
	.long	32724
	.long	32736
	.long	33124
	.long	33184
	.long	33204
	.long	33344
	.long	33364
	.long	33408
	.long	33428
	.long	33504
	.long	34196
	.long	34240
	.long	35077
	.long	35104
	.long	35188
	.long	35328
	.long	36004
	.long	36389
	.long	36404
	.long	36918
	.long	36928
	.long	37796
	.long	37814
	.long	37828
	.long	37840
	.long	37862
	.long	37908
	.long	38038
	.long	38100
	.long	38118
	.long	38144
	.long	38164
	.long	38272
	.long	38436
	.long	38464
	.long	38932
	.long	38950
	.long	38976
	.long	39876
	.long	39888
	.long	39908
	.long	39926
	.long	39956
	.long	40016
	.long	40054
	.long	40080
	.long	40118
	.long	40148
	.long	40160
	.long	40308
	.long	40320
	.long	40484
	.long	40512
	.long	40932
	.long	40944
	.long	40980
	.long	41014
	.long	41024
	.long	41924
	.long	41936
	.long	41958
	.long	42004
	.long	42032
	.long	42100
	.long	42128
	.long	42164
	.long	42208
	.long	42260
	.long	42272
	.long	42756
	.long	42784
	.long	42836
	.long	42848
	.long	43028
	.long	43062
	.long	43072
	.long	43972
	.long	43984
	.long	44006
	.long	44052
	.long	44128
	.long	44148
	.long	44182
	.long	44192
	.long	44214
	.long	44244
	.long	44256
	.long	44580
	.long	44608
	.long	44964
	.long	45056
	.long	45076
	.long	45094
	.long	45120
	.long	46020
	.long	46032
	.long	46052
	.long	46086
	.long	46100
	.long	46160
	.long	46198
	.long	46224
	.long	46262
	.long	46292
	.long	46304
	.long	46420
	.long	46464
	.long	46628
	.long	46656
	.long	47140
	.long	47152
	.long	48100
	.long	48118
	.long	48132
	.long	48150
	.long	48176
	.long	48230
	.long	48272
	.long	48294
	.long	48340
	.long	48352
	.long	48500
	.long	48512
	.long	49156
	.long	49174
	.long	49220
	.long	49232
	.long	50116
	.long	50128
	.long	50148
	.long	50198
	.long	50256
	.long	50276
	.long	50320
	.long	50340
	.long	50400
	.long	50516
	.long	50544
	.long	50724
	.long	50752
	.long	51220
	.long	51238
	.long	51264
	.long	52164
	.long	52176
	.long	52198
	.long	52212
	.long	52246
	.long	52260
	.long	52278
	.long	52304
	.long	52324
	.long	52368
	.long	52388
	.long	52448
	.long	52564
	.long	52592
	.long	52772
	.long	52800
	.long	53046
	.long	53056
	.long	53252
	.long	53286
	.long	53312
	.long	54196
	.long	54224
	.long	54244
	.long	54262
	.long	54292
	.long	54352
	.long	54374
	.long	54416
	.long	54438
	.long	54484
	.long	54501
	.long	54512
	.long	54644
	.long	54656
	.long	54820
	.long	54848
	.long	55316
	.long	55334
	.long	55360
	.long	56484
	.long	56496
	.long	56564
	.long	56582
	.long	56612
	.long	56656
	.long	56676
	.long	56688
	.long	56710
	.long	56820
	.long	56832
	.long	57126
	.long	57152
	.long	58132
	.long	58144
	.long	58166
	.long	58180
	.long	58288
	.long	58484
	.long	58608
	.long	60180
	.long	60192
	.long	60214
	.long	60228
	.long	60368
	.long	60548
	.long	60656
	.long	61828
	.long	61856
	.long	62292
	.long	62304
	.long	62324
	.long	62336
	.long	62356
	.long	62368
	.long	62438
	.long	62464
	.long	63252
	.long	63478
	.long	63492
	.long	63568
	.long	63588
	.long	63616
	.long	63700
	.long	63872
	.long	63892
	.long	64464
	.long	64612
	.long	64624
	.long	66260
	.long	66326
	.long	66340
	.long	66432
	.long	66452
	.long	66486
	.long	66516
	.long	66544
	.long	66918
	.long	66948
	.long	66976
	.long	67044
	.long	67088
	.long	67348
	.long	67408
	.long	67620
	.long	67632
	.long	67654
	.long	67668
	.long	67696
	.long	67796
	.long	67808
	.long	68052
	.long	68064
	.long	69639
	.long	71176
	.long	72329
	.long	73728
	.long	79316
	.long	79360
	.long	94500
	.long	94560
	.long	95012
	.long	95056
	.long	95524
	.long	95552
	.long	96036
	.long	96064
	.long	97092
	.long	97126
	.long	97140
	.long	97254
	.long	97380
	.long	97398
	.long	97428
	.long	97600
	.long	97748
	.long	97760
	.long	98484
	.long	98529
	.long	98548
	.long	98560
	.long	100436
	.long	100464
	.long	101012
	.long	101024
	.long	102916
	.long	102966
	.long	103028
	.long	103062
	.long	103104
	.long	103174
	.long	103204
	.long	103222
	.long	103316
	.long	103360
	.long	106868
	.long	106902
	.long	106932
	.long	106944
	.long	107862
	.long	107876
	.long	107894
	.long	107908
	.long	108016
	.long	108036
	.long	108048
	.long	108068
	.long	108080
	.long	108116
	.long	108246
	.long	108340
	.long	108496
	.long	108532
	.long	108544
	.long	109316
	.long	110048
	.long	110084
	.long	110272
	.long	110596
	.long	110662
	.long	110672
	.long	111428
	.long	111590
	.long	111652
	.long	111696
	.long	112308
	.long	112448
	.long	112644
	.long	112678
	.long	112688
	.long	113174
	.long	113188
	.long	113254
	.long	113284
	.long	113376
	.long	114276
	.long	114294
	.long	114308
	.long	114342
	.long	114388
	.long	114406
	.long	114420
	.long	114496
	.long	115270
	.long	115396
	.long	115526
	.long	115556
	.long	115584
	.long	118020
	.long	118064
	.long	118084
	.long	118294
	.long	118308
	.long	118416
	.long	118484
	.long	118496
	.long	118596
	.long	118608
	.long	118646
	.long	118660
	.long	118688
	.long	121860
	.long	122880
	.long	131249
	.long	131268
	.long	131290
	.long	131297
	.long	131328
	.long	131713
	.long	131824
	.long	132609
	.long	132864
	.long	134404
	.long	134928
	.long	184052
	.long	184096
	.long	186356
	.long	186368
	.long	187908
	.long	188416
	.long	197284
	.long	197376
	.long	199060
	.long	199088
	.long	681716
	.long	681776
	.long	681796
	.long	681952
	.long	682468
	.long	682496
	.long	683780
	.long	683808
	.long	688164
	.long	688176
	.long	688228
	.long	688240
	.long	688308
	.long	688320
	.long	688694
	.long	688724
	.long	688758
	.long	688768
	.long	688836
	.long	688848
	.long	690182
	.long	690208
	.long	691014
	.long	691268
	.long	691296
	.long	691716
	.long	692000
	.long	692212
	.long	692224
	.long	692836
	.long	692960
	.long	693364
	.long	693542
	.long	693556
	.long	693568
	.long	693767
	.long	694224
	.long	694276
	.long	694326
	.long	694336
	.long	695092
	.long	695110
	.long	695140
	.long	695206
	.long	695236
	.long	695270
	.long	695300
	.long	695312
	.long	695892
	.long	695904
	.long	696980
	.long	697078
	.long	697108
	.long	697142
	.long	697172
	.long	697200
	.long	697396
	.long	697408
	.long	697540
	.long	697558
	.long	697568
	.long	698308
	.long	698320
	.long	699140
	.long	699152
	.long	699172
	.long	699216
	.long	699252
	.long	699280
	.long	699364
	.long	699392
	.long	699412
	.long	699424
	.long	700086
	.long	700100
	.long	700134
	.long	700160
	.long	700246
	.long	700260
	.long	700272
	.long	704054
	.long	704084
	.long	704102
	.long	704132
	.long	704150
	.long	704176
	.long	704198
	.long	704212
	.long	704224
	.long	704523
	.long	704540
	.long	704971
	.long	704988
	.long	705419
	.long	705436
	.long	705867
	.long	705884
	.long	706315
	.long	706332
	.long	706763
	.long	706780
	.long	707211
	.long	707228
	.long	707659
	.long	707676
	.long	708107
	.long	708124
	.long	708555
	.long	708572
	.long	709003
	.long	709020
	.long	709451
	.long	709468
	.long	709899
	.long	709916
	.long	710347
	.long	710364
	.long	710795
	.long	710812
	.long	711243
	.long	711260
	.long	711691
	.long	711708
	.long	712139
	.long	712156
	.long	712587
	.long	712604
	.long	713035
	.long	713052
	.long	713483
	.long	713500
	.long	713931
	.long	713948
	.long	714379
	.long	714396
	.long	714827
	.long	714844
	.long	715275
	.long	715292
	.long	715723
	.long	715740
	.long	716171
	.long	716188
	.long	716619
	.long	716636
	.long	717067
	.long	717084
	.long	717515
	.long	717532
	.long	717963
	.long	717980
	.long	718411
	.long	718428
	.long	718859
	.long	718876
	.long	719307
	.long	719324
	.long	719755
	.long	719772
	.long	720203
	.long	720220
	.long	720651
	.long	720668
	.long	721099
	.long	721116
	.long	721547
	.long	721564
	.long	721995
	.long	722012
	.long	722443
	.long	722460
	.long	722891
	.long	722908
	.long	723339
	.long	723356
	.long	723787
	.long	723804
	.long	724235
	.long	724252
	.long	724683
	.long	724700
	.long	725131
	.long	725148
	.long	725579
	.long	725596
	.long	726027
	.long	726044
	.long	726475
	.long	726492
	.long	726923
	.long	726940
	.long	727371
	.long	727388
	.long	727819
	.long	727836
	.long	728267
	.long	728284
	.long	728715
	.long	728732
	.long	729163
	.long	729180
	.long	729611
	.long	729628
	.long	730059
	.long	730076
	.long	730507
	.long	730524
	.long	730955
	.long	730972
	.long	731403
	.long	731420
	.long	731851
	.long	731868
	.long	732299
	.long	732316
	.long	732747
	.long	732764
	.long	733195
	.long	733212
	.long	733643
	.long	733660
	.long	734091
	.long	734108
	.long	734539
	.long	734556
	.long	734987
	.long	735004
	.long	735435
	.long	735452
	.long	735883
	.long	735900
	.long	736331
	.long	736348
	.long	736779
	.long	736796
	.long	737227
	.long	737244
	.long	737675
	.long	737692
	.long	738123
	.long	738140
	.long	738571
	.long	738588
	.long	739019
	.long	739036
	.long	739467
	.long	739484
	.long	739915
	.long	739932
	.long	740363
	.long	740380
	.long	740811
	.long	740828
	.long	741259
	.long	741276
	.long	741707
	.long	741724
	.long	742155
	.long	742172
	.long	742603
	.long	742620
	.long	743051
	.long	743068
	.long	743499
	.long	743516
	.long	743947
	.long	743964
	.long	744395
	.long	744412
	.long	744843
	.long	744860
	.long	745291
	.long	745308
	.long	745739
	.long	745756
	.long	746187
	.long	746204
	.long	746635
	.long	746652
	.long	747083
	.long	747100
	.long	747531
	.long	747548
	.long	747979
	.long	747996
	.long	748427
	.long	748444
	.long	748875
	.long	748892
	.long	749323
	.long	749340
	.long	749771
	.long	749788
	.long	750219
	.long	750236
	.long	750667
	.long	750684
	.long	751115
	.long	751132
	.long	751563
	.long	751580
	.long	752011
	.long	752028
	.long	752459
	.long	752476
	.long	752907
	.long	752924
	.long	753355
	.long	753372
	.long	753803
	.long	753820
	.long	754251
	.long	754268
	.long	754699
	.long	754716
	.long	755147
	.long	755164
	.long	755595
	.long	755612
	.long	756043
	.long	756060
	.long	756491
	.long	756508
	.long	756939
	.long	756956
	.long	757387
	.long	757404
	.long	757835
	.long	757852
	.long	758283
	.long	758300
	.long	758731
	.long	758748
	.long	759179
	.long	759196
	.long	759627
	.long	759644
	.long	760075
	.long	760092
	.long	760523
	.long	760540
	.long	760971
	.long	760988
	.long	761419
	.long	761436
	.long	761867
	.long	761884
	.long	762315
	.long	762332
	.long	762763
	.long	762780
	.long	763211
	.long	763228
	.long	763659
	.long	763676
	.long	764107
	.long	764124
	.long	764555
	.long	764572
	.long	765003
	.long	765020
	.long	765451
	.long	765468
	.long	765899
	.long	765916
	.long	766347
	.long	766364
	.long	766795
	.long	766812
	.long	767243
	.long	767260
	.long	767691
	.long	767708
	.long	768139
	.long	768156
	.long	768587
	.long	768604
	.long	769035
	.long	769052
	.long	769483
	.long	769500
	.long	769931
	.long	769948
	.long	770379
	.long	770396
	.long	770827
	.long	770844
	.long	771275
	.long	771292
	.long	771723
	.long	771740
	.long	772171
	.long	772188
	.long	772619
	.long	772636
	.long	773067
	.long	773084
	.long	773515
	.long	773532
	.long	773963
	.long	773980
	.long	774411
	.long	774428
	.long	774859
	.long	774876
	.long	775307
	.long	775324
	.long	775755
	.long	775772
	.long	776203
	.long	776220
	.long	776651
	.long	776668
	.long	777099
	.long	777116
	.long	777547
	.long	777564
	.long	777995
	.long	778012
	.long	778443
	.long	778460
	.long	778891
	.long	778908
	.long	779339
	.long	779356
	.long	779787
	.long	779804
	.long	780235
	.long	780252
	.long	780683
	.long	780700
	.long	781131
	.long	781148
	.long	781579
	.long	781596
	.long	782027
	.long	782044
	.long	782475
	.long	782492
	.long	782923
	.long	782940
	.long	783371
	.long	783388
	.long	783819
	.long	783836
	.long	784267
	.long	784284
	.long	784715
	.long	784732
	.long	785163
	.long	785180
	.long	785611
	.long	785628
	.long	786059
	.long	786076
	.long	786507
	.long	786524
	.long	786955
	.long	786972
	.long	787403
	.long	787420
	.long	787851
	.long	787868
	.long	788299
	.long	788316
	.long	788747
	.long	788764
	.long	789195
	.long	789212
	.long	789643
	.long	789660
	.long	790091
	.long	790108
	.long	790539
	.long	790556
	.long	790987
	.long	791004
	.long	791435
	.long	791452
	.long	791883
	.long	791900
	.long	792331
	.long	792348
	.long	792779
	.long	792796
	.long	793227
	.long	793244
	.long	793675
	.long	793692
	.long	794123
	.long	794140
	.long	794571
	.long	794588
	.long	795019
	.long	795036
	.long	795467
	.long	795484
	.long	795915
	.long	795932
	.long	796363
	.long	796380
	.long	796811
	.long	796828
	.long	797259
	.long	797276
	.long	797707
	.long	797724
	.long	798155
	.long	798172
	.long	798603
	.long	798620
	.long	799051
	.long	799068
	.long	799499
	.long	799516
	.long	799947
	.long	799964
	.long	800395
	.long	800412
	.long	800843
	.long	800860
	.long	801291
	.long	801308
	.long	801739
	.long	801756
	.long	802187
	.long	802204
	.long	802635
	.long	802652
	.long	803083
	.long	803100
	.long	803531
	.long	803548
	.long	803979
	.long	803996
	.long	804427
	.long	804444
	.long	804875
	.long	804892
	.long	805323
	.long	805340
	.long	805771
	.long	805788
	.long	806219
	.long	806236
	.long	806667
	.long	806684
	.long	807115
	.long	807132
	.long	807563
	.long	807580
	.long	808011
	.long	808028
	.long	808459
	.long	808476
	.long	808907
	.long	808924
	.long	809355
	.long	809372
	.long	809803
	.long	809820
	.long	810251
	.long	810268
	.long	810699
	.long	810716
	.long	811147
	.long	811164
	.long	811595
	.long	811612
	.long	812043
	.long	812060
	.long	812491
	.long	812508
	.long	812939
	.long	812956
	.long	813387
	.long	813404
	.long	813835
	.long	813852
	.long	814283
	.long	814300
	.long	814731
	.long	814748
	.long	815179
	.long	815196
	.long	815627
	.long	815644
	.long	816075
	.long	816092
	.long	816523
	.long	816540
	.long	816971
	.long	816988
	.long	817419
	.long	817436
	.long	817867
	.long	817884
	.long	818315
	.long	818332
	.long	818763
	.long	818780
	.long	819211
	.long	819228
	.long	819659
	.long	819676
	.long	820107
	.long	820124
	.long	820555
	.long	820572
	.long	821003
	.long	821020
	.long	821451
	.long	821468
	.long	821899
	.long	821916
	.long	822347
	.long	822364
	.long	822795
	.long	822812
	.long	823243
	.long	823260
	.long	823691
	.long	823708
	.long	824139
	.long	824156
	.long	824587
	.long	824604
	.long	825035
	.long	825052
	.long	825483
	.long	825500
	.long	825931
	.long	825948
	.long	826379
	.long	826396
	.long	826827
	.long	826844
	.long	827275
	.long	827292
	.long	827723
	.long	827740
	.long	828171
	.long	828188
	.long	828619
	.long	828636
	.long	829067
	.long	829084
	.long	829515
	.long	829532
	.long	829963
	.long	829980
	.long	830411
	.long	830428
	.long	830859
	.long	830876
	.long	831307
	.long	831324
	.long	831755
	.long	831772
	.long	832203
	.long	832220
	.long	832651
	.long	832668
	.long	833099
	.long	833116
	.long	833547
	.long	833564
	.long	833995
	.long	834012
	.long	834443
	.long	834460
	.long	834891
	.long	834908
	.long	835339
	.long	835356
	.long	835787
	.long	835804
	.long	836235
	.long	836252
	.long	836683
	.long	836700
	.long	837131
	.long	837148
	.long	837579
	.long	837596
	.long	838027
	.long	838044
	.long	838475
	.long	838492
	.long	838923
	.long	838940
	.long	839371
	.long	839388
	.long	839819
	.long	839836
	.long	840267
	.long	840284
	.long	840715
	.long	840732
	.long	841163
	.long	841180
	.long	841611
	.long	841628
	.long	842059
	.long	842076
	.long	842507
	.long	842524
	.long	842955
	.long	842972
	.long	843403
	.long	843420
	.long	843851
	.long	843868
	.long	844299
	.long	844316
	.long	844747
	.long	844764
	.long	845195
	.long	845212
	.long	845643
	.long	845660
	.long	846091
	.long	846108
	.long	846539
	.long	846556
	.long	846987
	.long	847004
	.long	847435
	.long	847452
	.long	847883
	.long	847900
	.long	848331
	.long	848348
	.long	848779
	.long	848796
	.long	849227
	.long	849244
	.long	849675
	.long	849692
	.long	850123
	.long	850140
	.long	850571
	.long	850588
	.long	851019
	.long	851036
	.long	851467
	.long	851484
	.long	851915
	.long	851932
	.long	852363
	.long	852380
	.long	852811
	.long	852828
	.long	853259
	.long	853276
	.long	853707
	.long	853724
	.long	854155
	.long	854172
	.long	854603
	.long	854620
	.long	855051
	.long	855068
	.long	855499
	.long	855516
	.long	855947
	.long	855964
	.long	856395
	.long	856412
	.long	856843
	.long	856860
	.long	857291
	.long	857308
	.long	857739
	.long	857756
	.long	858187
	.long	858204
	.long	858635
	.long	858652
	.long	859083
	.long	859100
	.long	859531
	.long	859548
	.long	859979
	.long	859996
	.long	860427
	.long	860444
	.long	860875
	.long	860892
	.long	861323
	.long	861340
	.long	861771
	.long	861788
	.long	862219
	.long	862236
	.long	862667
	.long	862684
	.long	863115
	.long	863132
	.long	863563
	.long	863580
	.long	864011
	.long	864028
	.long	864459
	.long	864476
	.long	864907
	.long	864924
	.long	865355
	.long	865372
	.long	865803
	.long	865820
	.long	866251
	.long	866268
	.long	866699
	.long	866716
	.long	867147
	.long	867164
	.long	867595
	.long	867612
	.long	868043
	.long	868060
	.long	868491
	.long	868508
	.long	868939
	.long	868956
	.long	869387
	.long	869404
	.long	869835
	.long	869852
	.long	870283
	.long	870300
	.long	870731
	.long	870748
	.long	871179
	.long	871196
	.long	871627
	.long	871644
	.long	872075
	.long	872092
	.long	872523
	.long	872540
	.long	872971
	.long	872988
	.long	873419
	.long	873436
	.long	873867
	.long	873884
	.long	874315
	.long	874332
	.long	874763
	.long	874780
	.long	875211
	.long	875228
	.long	875659
	.long	875676
	.long	876107
	.long	876124
	.long	876555
	.long	876572
	.long	877003
	.long	877020
	.long	877451
	.long	877468
	.long	877899
	.long	877916
	.long	878347
	.long	878364
	.long	878795
	.long	878812
	.long	879243
	.long	879260
	.long	879691
	.long	879708
	.long	880139
	.long	880156
	.long	880587
	.long	880604
	.long	881035
	.long	881052
	.long	881483
	.long	881500
	.long	881931
	.long	881948
	.long	882379
	.long	882396
	.long	882827
	.long	882844
	.long	883264
	.long	883464
	.long	883824
	.long	883897
	.long	884672
	.long	1028580
	.long	1028592
	.long	1040388
	.long	1040640
	.long	1040900
	.long	1041152
	.long	1044465
	.long	1044480
	.long	1047012
	.long	1047040
	.long	1048321
	.long	1048512
	.long	1056724
	.long	1056736
	.long	1060356
	.long	1060368
	.long	1062756
	.long	1062832
	.long	1089556
	.long	1089600
	.long	1089620
	.long	1089648
	.long	1089732
	.long	1089792
	.long	1090436
	.long	1090480
	.long	1090548
	.long	1090560
	.long	1093204
	.long	1093232
	.long	1102404
	.long	1102464
	.long	1103508
	.long	1103584
	.long	1108660
	.long	1108688
	.long	1109924
	.long	1110016
	.long	1111140
	.long	1111312
	.long	1112100
	.long	1112160
	.long	1114118
	.long	1114132
	.long	1114150
	.long	1114160
	.long	1115012
	.long	1115248
	.long	1115908
	.long	1115920
	.long	1115956
	.long	1115984
	.long	1116148
	.long	1116198
	.long	1116208
	.long	1116934
	.long	1116980
	.long	1117046
	.long	1117076
	.long	1117104
	.long	1117141
	.long	1117152
	.long	1117220
	.long	1117232
	.long	1117397
	.long	1117408
	.long	1118212
	.long	1118256
	.long	1118836
	.long	1118918
	.long	1118932
	.long	1119056
	.long	1119318
	.long	1119344
	.long	1120052
	.long	1120064
	.long	1120260
	.long	1120294
	.long	1120304
	.long	1121078
	.long	1121124
	.long	1121270
	.long	1121284
	.long	1121296
	.long	1121317
	.long	1121344
	.long	1121428
	.long	1121488
	.long	1121510
	.long	1121524
	.long	1121536
	.long	1123014
	.long	1123060
	.long	1123110
	.long	1123140
	.long	1123200
	.long	1123300
	.long	1123312
	.long	1123348
	.long	1123360
	.long	1125876
	.long	1125894
	.long	1125940
	.long	1126064
	.long	1126404
	.long	1126438
	.long	1126464
	.long	1127348
	.long	1127376
	.long	1127396
	.long	1127414
	.long	1127428
	.long	1127446
	.long	1127504
	.long	1127542
	.long	1127568
	.long	1127606
	.long	1127636
	.long	1127648
	.long	1127796
	.long	1127808
	.long	1127974
	.long	1128000
	.long	1128036
	.long	1128144
	.long	1128196
	.long	1128272
	.long	1129348
	.long	1129366
	.long	1129396
	.long	1129488
	.long	1129508
	.long	1129520
	.long	1129556
	.long	1129568
	.long	1129588
	.long	1129638
	.long	1129648
	.long	1129670
	.long	1129700
	.long	1129749
	.long	1129764
	.long	1129776
	.long	1130004
	.long	1130032
	.long	1131350
	.long	1131396
	.long	1131526
	.long	1131556
	.long	1131606
	.long	1131620
	.long	1131632
	.long	1132004
	.long	1132016
	.long	1133316
	.long	1133334
	.long	1133364
	.long	1133462
	.long	1133476
	.long	1133494
	.long	1133524
	.long	1133542
	.long	1133556
	.long	1133590
	.long	1133604
	.long	1133632
	.long	1137396
	.long	1137414
	.long	1137444
	.long	1137504
	.long	1137542
	.long	1137604
	.long	1137638
	.long	1137652
	.long	1137680
	.long	1138116
	.long	1138144
	.long	1139462
	.long	1139508
	.long	1139638
	.long	1139668
	.long	1139686
	.long	1139700
	.long	1139728
	.long	1141428
	.long	1141446
	.long	1141460
	.long	1141478
	.long	1141508
	.long	1141632
	.long	1143252
	.long	1143270
	.long	1143284
	.long	1143296
	.long	1143332
	.long	1143398
	.long	1143412
	.long	1143488
	.long	1147590
	.long	1147636
	.long	1147782
	.long	1147796
	.long	1147824
	.long	1151748
	.long	1151766
	.long	1151840
	.long	1151862
	.long	1151888
	.long	1151924
	.long	1151989
	.long	1152006
	.long	1152021
	.long	1152038
	.long	1152052
	.long	1152064
	.long	1154326
	.long	1154372
	.long	1154432
	.long	1154468
	.long	1154502
	.long	1154564
	.long	1154576
	.long	1154630
	.long	1154640
	.long	1155092
	.long	1155248
	.long	1155892
	.long	1155990
	.long	1156000
	.long	1156020
	.long	1156080
	.long	1156212
	.long	1156224
	.long	1156372
	.long	1156470
	.long	1156500
	.long	1156544
	.long	1157189
	.long	1157284
	.long	1157494
	.long	1157508
	.long	1157536
	.long	1160708
	.long	1160726
	.long	1160740
	.long	1160790
	.long	1160804
	.long	1160822
	.long	1160832
	.long	1164022
	.long	1164036
	.long	1164144
	.long	1164164
	.long	1164262
	.long	1164276
	.long	1164288
	.long	1165604
	.long	1165952
	.long	1165974
	.long	1165988
	.long	1166102
	.long	1166116
	.long	1166150
	.long	1166164
	.long	1166192
	.long	1168148
	.long	1168240
	.long	1168292
	.long	1168304
	.long	1168324
	.long	1168352
	.long	1168372
	.long	1168485
	.long	1168500
	.long	1168512
	.long	1169574
	.long	1169648
	.long	1169668
	.long	1169696
	.long	1169718
	.long	1169748
	.long	1169766
	.long	1169780
	.long	1169792
	.long	1175348
	.long	1175382
	.long	1175408
	.long	1175556
	.long	1175589
	.long	1175606
	.long	1175616
	.long	1176390
	.long	1176420
	.long	1176496
	.long	1176550
	.long	1176580
	.long	1176624
	.long	1176996
	.long	1177008
	.long	1262337
	.long	1262596
	.long	1262608
	.long	1262708
	.long	1262944
	.long	1446372
	.long	1446566
	.long	1446612
	.long	1446656
	.long	1486596
	.long	1486672
	.long	1487620
	.long	1487728
	.long	1496632
	.long	1496640
	.long	1496696
	.long	1496752
	.long	1504500
	.long	1504512
	.long	1504534
	.long	1505408
	.long	1505524
	.long	1505584
	.long	1506884
	.long	1506896
	.long	1507076
	.long	1507104
	.long	1821140
	.long	1821168
	.long	1821185
	.long	1821248
	.long	1896452
	.long	1897184
	.long	1897220
	.long	1897584
	.long	1906260
	.long	1906336
	.long	1906388
	.long	1906481
	.long	1906612
	.long	1906736
	.long	1906772
	.long	1906880
	.long	1907364
	.long	1907424
	.long	1909796
	.long	1909840
	.long	1941508
	.long	1942384
	.long	1942452
	.long	1943248
	.long	1943380
	.long	1943392
	.long	1943620
	.long	1943632
	.long	1943988
	.long	1944064
	.long	1944084
	.long	1944320
	.long	1966084
	.long	1966192
	.long	1966212
	.long	1966480
	.long	1966516
	.long	1966624
	.long	1966644
	.long	1966672
	.long	1966692
	.long	1966768
	.long	1968372
	.long	1968384
	.long	1970948
	.long	1971056
	.long	1977060
	.long	1977072
	.long	1978052
	.long	1978112
	.long	1986244
	.long	1986304
	.long	1990372
	.long	1990400
	.long	1994292
	.long	1994304
	.long	1994340
	.long	1994352
	.long	1994468
	.long	1994496
	.long	1994580
	.long	1994592
	.long	2002180
	.long	2002288
	.long	2004036
	.long	2004144
	.long	2039405
	.long	2039808
	.long	2047924
	.long	2048000
	.long	14680065
	.long	14680580
	.long	14682113
	.long	14684164
	.long	14688001
	.long	14745600
	.globl	_ZNSt9__unicode9__v16_0_014__escape_edgesE
	.section	.rdata$_ZNSt9__unicode9__v16_0_014__escape_edgesE,"dr"
	.linkonce same_size
	.align 32
_ZNSt9__unicode9__v16_0_014__escape_edgesE:
	.long	1
	.long	66
	.long	255
	.long	322
	.long	347
	.long	348
	.long	1777
	.long	1780
	.long	1793
	.long	1800
	.long	1815
	.long	1816
	.long	1819
	.long	1820
	.long	1861
	.long	1862
	.long	2657
	.long	2658
	.long	2735
	.long	2738
	.long	2839
	.long	2842
	.long	2849
	.long	2850
	.long	2961
	.long	2976
	.long	3031
	.long	3038
	.long	3051
	.long	3084
	.long	3129
	.long	3130
	.long	3515
	.long	3516
	.long	3613
	.long	3616
	.long	3735
	.long	3738
	.long	3941
	.long	3968
	.long	4087
	.long	4090
	.long	4189
	.long	4192
	.long	4223
	.long	4224
	.long	4281
	.long	4284
	.long	4287
	.long	4288
	.long	4311
	.long	4320
	.long	4385
	.long	4398
	.long	4549
	.long	4550
	.long	4873
	.long	4874
	.long	4891
	.long	4894
	.long	4899
	.long	4902
	.long	4947
	.long	4948
	.long	4963
	.long	4964
	.long	4967
	.long	4972
	.long	4981
	.long	4984
	.long	5003
	.long	5006
	.long	5011
	.long	5014
	.long	5023
	.long	5038
	.long	5041
	.long	5048
	.long	5053
	.long	5054
	.long	5065
	.long	5068
	.long	5119
	.long	5122
	.long	5129
	.long	5130
	.long	5143
	.long	5150
	.long	5155
	.long	5158
	.long	5203
	.long	5204
	.long	5219
	.long	5220
	.long	5225
	.long	5226
	.long	5231
	.long	5232
	.long	5237
	.long	5240
	.long	5243
	.long	5244
	.long	5255
	.long	5262
	.long	5267
	.long	5270
	.long	5277
	.long	5282
	.long	5285
	.long	5298
	.long	5307
	.long	5308
	.long	5311
	.long	5324
	.long	5359
	.long	5378
	.long	5385
	.long	5386
	.long	5405
	.long	5406
	.long	5413
	.long	5414
	.long	5459
	.long	5460
	.long	5475
	.long	5476
	.long	5481
	.long	5482
	.long	5493
	.long	5496
	.long	5517
	.long	5518
	.long	5525
	.long	5526
	.long	5533
	.long	5536
	.long	5539
	.long	5568
	.long	5577
	.long	5580
	.long	5605
	.long	5618
	.long	5633
	.long	5634
	.long	5641
	.long	5642
	.long	5659
	.long	5662
	.long	5667
	.long	5670
	.long	5715
	.long	5716
	.long	5731
	.long	5732
	.long	5737
	.long	5738
	.long	5749
	.long	5752
	.long	5771
	.long	5774
	.long	5779
	.long	5782
	.long	5789
	.long	5802
	.long	5809
	.long	5816
	.long	5821
	.long	5822
	.long	5833
	.long	5836
	.long	5873
	.long	5892
	.long	5897
	.long	5898
	.long	5911
	.long	5916
	.long	5923
	.long	5924
	.long	5933
	.long	5938
	.long	5943
	.long	5944
	.long	5947
	.long	5948
	.long	5953
	.long	5958
	.long	5963
	.long	5968
	.long	5975
	.long	5980
	.long	6005
	.long	6012
	.long	6023
	.long	6028
	.long	6035
	.long	6036
	.long	6045
	.long	6048
	.long	6051
	.long	6062
	.long	6065
	.long	6092
	.long	6135
	.long	6144
	.long	6171
	.long	6172
	.long	6179
	.long	6180
	.long	6227
	.long	6228
	.long	6261
	.long	6264
	.long	6283
	.long	6284
	.long	6291
	.long	6292
	.long	6301
	.long	6314
	.long	6319
	.long	6320
	.long	6327
	.long	6328
	.long	6333
	.long	6336
	.long	6345
	.long	6348
	.long	6369
	.long	6382
	.long	6427
	.long	6428
	.long	6435
	.long	6436
	.long	6483
	.long	6484
	.long	6505
	.long	6506
	.long	6517
	.long	6520
	.long	6539
	.long	6540
	.long	6547
	.long	6548
	.long	6557
	.long	6570
	.long	6575
	.long	6584
	.long	6591
	.long	6592
	.long	6601
	.long	6604
	.long	6625
	.long	6626
	.long	6633
	.long	6656
	.long	6683
	.long	6684
	.long	6691
	.long	6692
	.long	6795
	.long	6796
	.long	6803
	.long	6804
	.long	6817
	.long	6824
	.long	6857
	.long	6860
	.long	6913
	.long	6914
	.long	6921
	.long	6922
	.long	6959
	.long	6964
	.long	7013
	.long	7014
	.long	7033
	.long	7034
	.long	7037
	.long	7040
	.long	7055
	.long	7060
	.long	7063
	.long	7070
	.long	7083
	.long	7084
	.long	7087
	.long	7088
	.long	7105
	.long	7116
	.long	7137
	.long	7140
	.long	7147
	.long	7170
	.long	7287
	.long	7294
	.long	7353
	.long	7426
	.long	7431
	.long	7432
	.long	7435
	.long	7436
	.long	7447
	.long	7448
	.long	7497
	.long	7498
	.long	7501
	.long	7502
	.long	7549
	.long	7552
	.long	7563
	.long	7564
	.long	7567
	.long	7568
	.long	7583
	.long	7584
	.long	7605
	.long	7608
	.long	7617
	.long	7680
	.long	7825
	.long	7826
	.long	7899
	.long	7906
	.long	7985
	.long	7986
	.long	8059
	.long	8060
	.long	8091
	.long	8092
	.long	8119
	.long	8192
	.long	8589
	.long	8590
	.long	8593
	.long	8602
	.long	8605
	.long	8608
	.long	9363
	.long	9364
	.long	9373
	.long	9376
	.long	9391
	.long	9392
	.long	9395
	.long	9396
	.long	9405
	.long	9408
	.long	9491
	.long	9492
	.long	9501
	.long	9504
	.long	9571
	.long	9572
	.long	9581
	.long	9584
	.long	9599
	.long	9600
	.long	9603
	.long	9604
	.long	9613
	.long	9616
	.long	9647
	.long	9648
	.long	9763
	.long	9764
	.long	9773
	.long	9776
	.long	9911
	.long	9914
	.long	9979
	.long	9984
	.long	10037
	.long	10048
	.long	10221
	.long	10224
	.long	10237
	.long	10240
	.long	11521
	.long	11522
	.long	11579
	.long	11584
	.long	11763
	.long	11776
	.long	11821
	.long	11838
	.long	11887
	.long	11904
	.long	11945
	.long	11968
	.long	11995
	.long	11996
	.long	12003
	.long	12004
	.long	12009
	.long	12032
	.long	12221
	.long	12224
	.long	12245
	.long	12256
	.long	12277
	.long	12288
	.long	12317
	.long	12318
	.long	12341
	.long	12352
	.long	12531
	.long	12544
	.long	12631
	.long	12640
	.long	12781
	.long	12800
	.long	12863
	.long	12864
	.long	12889
	.long	12896
	.long	12921
	.long	12928
	.long	12931
	.long	12936
	.long	13021
	.long	13024
	.long	13035
	.long	13056
	.long	13145
	.long	13152
	.long	13205
	.long	13216
	.long	13239
	.long	13244
	.long	13369
	.long	13372
	.long	13503
	.long	13504
	.long	13563
	.long	13566
	.long	13589
	.long	13600
	.long	13621
	.long	13632
	.long	13661
	.long	13664
	.long	13757
	.long	13760
	.long	13785
	.long	13824
	.long	13979
	.long	13980
	.long	14313
	.long	14328
	.long	14449
	.long	14454
	.long	14485
	.long	14490
	.long	14615
	.long	14624
	.long	14711
	.long	14714
	.long	14737
	.long	14752
	.long	14839
	.long	14848
	.long	15917
	.long	15920
	.long	15933
	.long	15936
	.long	16013
	.long	16016
	.long	16029
	.long	16032
	.long	16049
	.long	16050
	.long	16053
	.long	16054
	.long	16057
	.long	16058
	.long	16061
	.long	16062
	.long	16125
	.long	16128
	.long	16235
	.long	16236
	.long	16267
	.long	16268
	.long	16297
	.long	16300
	.long	16313
	.long	16314
	.long	16353
	.long	16356
	.long	16363
	.long	16364
	.long	16383
	.long	16416
	.long	16465
	.long	16480
	.long	16575
	.long	16608
	.long	16613
	.long	16616
	.long	16671
	.long	16672
	.long	16699
	.long	16704
	.long	16773
	.long	16800
	.long	16867
	.long	16896
	.long	17177
	.long	17184
	.long	18517
	.long	18560
	.long	18583
	.long	18624
	.long	22249
	.long	22252
	.long	23017
	.long	23026
	.long	23117
	.long	23118
	.long	23121
	.long	23130
	.long	23133
	.long	23136
	.long	23249
	.long	23262
	.long	23267
	.long	23294
	.long	23343
	.long	23360
	.long	23375
	.long	23376
	.long	23391
	.long	23392
	.long	23407
	.long	23408
	.long	23423
	.long	23424
	.long	23439
	.long	23440
	.long	23455
	.long	23456
	.long	23471
	.long	23472
	.long	23487
	.long	23488
	.long	23741
	.long	23808
	.long	23861
	.long	23862
	.long	24041
	.long	24064
	.long	24493
	.long	24544
	.long	24577
	.long	24578
	.long	24705
	.long	24706
	.long	24879
	.long	24882
	.long	25089
	.long	25098
	.long	25185
	.long	25186
	.long	25375
	.long	25376
	.long	25549
	.long	25566
	.long	25663
	.long	25664
	.long	84251
	.long	84256
	.long	84367
	.long	84384
	.long	85081
	.long	85120
	.long	85489
	.long	85504
	.long	85947
	.long	85986
	.long	86107
	.long	86112
	.long	86133
	.long	86144
	.long	86257
	.long	86272
	.long	86413
	.long	86428
	.long	86453
	.long	86464
	.long	86697
	.long	86718
	.long	86779
	.long	86784
	.long	86941
	.long	86942
	.long	86965
	.long	86972
	.long	87039
	.long	87040
	.long	87151
	.long	87168
	.long	87197
	.long	87200
	.long	87221
	.long	87224
	.long	87431
	.long	87478
	.long	87535
	.long	87554
	.long	87567
	.long	87570
	.long	87583
	.long	87586
	.long	87599
	.long	87616
	.long	87631
	.long	87632
	.long	87647
	.long	87648
	.long	87769
	.long	87776
	.long	88029
	.long	88032
	.long	88053
	.long	88064
	.long	110409
	.long	110432
	.long	110479
	.long	110486
	.long	110585
	.long	127488
	.long	128221
	.long	128224
	.long	128437
	.long	128512
	.long	128527
	.long	128550
	.long	128561
	.long	128570
	.long	128623
	.long	128624
	.long	128635
	.long	128636
	.long	128639
	.long	128640
	.long	128645
	.long	128646
	.long	128651
	.long	128652
	.long	129953
	.long	130016
	.long	130101
	.long	130112
	.long	130215
	.long	130216
	.long	130255
	.long	130256
	.long	130265
	.long	130272
	.long	130283
	.long	130284
	.long	130555
	.long	130562
	.long	130943
	.long	130948
	.long	130961
	.long	130964
	.long	130977
	.long	130980
	.long	130993
	.long	130996
	.long	131003
	.long	131008
	.long	131023
	.long	131024
	.long	131039
	.long	131064
	.long	131069
	.long	131072
	.long	131097
	.long	131098
	.long	131151
	.long	131152
	.long	131191
	.long	131192
	.long	131197
	.long	131198
	.long	131229
	.long	131232
	.long	131261
	.long	131328
	.long	131575
	.long	131584
	.long	131591
	.long	131598
	.long	131689
	.long	131694
	.long	131871
	.long	131872
	.long	131899
	.long	131904
	.long	131907
	.long	132000
	.long	132093
	.long	132352
	.long	132411
	.long	132416
	.long	132515
	.long	132544
	.long	132601
	.long	132608
	.long	132681
	.long	132698
	.long	132759
	.long	132768
	.long	132855
	.long	132864
	.long	132925
	.long	132926
	.long	133001
	.long	133008
	.long	133037
	.long	133120
	.long	133437
	.long	133440
	.long	133461
	.long	133472
	.long	133545
	.long	133552
	.long	133625
	.long	133632
	.long	133713
	.long	133728
	.long	133833
	.long	133854
	.long	133879
	.long	133880
	.long	133911
	.long	133912
	.long	133927
	.long	133928
	.long	133933
	.long	133934
	.long	133957
	.long	133958
	.long	133989
	.long	133990
	.long	134005
	.long	134006
	.long	134011
	.long	134016
	.long	134121
	.long	134144
	.long	134767
	.long	134784
	.long	134829
	.long	134848
	.long	134865
	.long	134912
	.long	134925
	.long	134926
	.long	135011
	.long	135012
	.long	135031
	.long	135168
	.long	135181
	.long	135184
	.long	135187
	.long	135188
	.long	135277
	.long	135278
	.long	135283
	.long	135288
	.long	135291
	.long	135294
	.long	135341
	.long	135342
	.long	135487
	.long	135502
	.long	135521
	.long	135616
	.long	135655
	.long	135656
	.long	135661
	.long	135670
	.long	135737
	.long	135742
	.long	135797
	.long	135806
	.long	135861
	.long	135936
	.long	136049
	.long	136056
	.long	136097
	.long	136100
	.long	136201
	.long	136202
	.long	136207
	.long	136216
	.long	136233
	.long	136234
	.long	136241
	.long	136242
	.long	136301
	.long	136304
	.long	136311
	.long	136318
	.long	136339
	.long	136352
	.long	136371
	.long	136384
	.long	136513
	.long	136576
	.long	136655
	.long	136662
	.long	136687
	.long	136704
	.long	136813
	.long	136818
	.long	136877
	.long	136880
	.long	136935
	.long	136944
	.long	136997
	.long	137010
	.long	137019
	.long	137042
	.long	137057
	.long	137216
	.long	137363
	.long	137472
	.long	137575
	.long	137600
	.long	137703
	.long	137716
	.long	137809
	.long	137824
	.long	137845
	.long	137856
	.long	137933
	.long	137938
	.long	137997
	.long	138012
	.long	138017
	.long	138432
	.long	138495
	.long	138496
	.long	138581
	.long	138582
	.long	138589
	.long	138592
	.long	138597
	.long	138628
	.long	138641
	.long	138656
	.long	138675
	.long	138740
	.long	138833
	.long	138848
	.long	138933
	.long	138976
	.long	139029
	.long	139104
	.long	139161
	.long	139200
	.long	139247
	.long	139264
	.long	139421
	.long	139428
	.long	139501
	.long	139518
	.long	139643
	.long	139644
	.long	139655
	.long	139680
	.long	139731
	.long	139744
	.long	139765
	.long	139776
	.long	139883
	.long	139884
	.long	139921
	.long	139936
	.long	140015
	.long	140032
	.long	140225
	.long	140226
	.long	140267
	.long	140288
	.long	140325
	.long	140326
	.long	140421
	.long	140544
	.long	140559
	.long	140560
	.long	140563
	.long	140564
	.long	140573
	.long	140574
	.long	140605
	.long	140606
	.long	140629
	.long	140640
	.long	140759
	.long	140768
	.long	140789
	.long	140800
	.long	140809
	.long	140810
	.long	140827
	.long	140830
	.long	140835
	.long	140838
	.long	140883
	.long	140884
	.long	140899
	.long	140900
	.long	140905
	.long	140906
	.long	140917
	.long	140918
	.long	140939
	.long	140942
	.long	140947
	.long	140950
	.long	140957
	.long	140960
	.long	140963
	.long	140974
	.long	140977
	.long	140986
	.long	141001
	.long	141004
	.long	141019
	.long	141024
	.long	141035
	.long	141056
	.long	141077
	.long	141078
	.long	141081
	.long	141084
	.long	141087
	.long	141088
	.long	141165
	.long	141166
	.long	141187
	.long	141188
	.long	141191
	.long	141194
	.long	141197
	.long	141198
	.long	141207
	.long	141208
	.long	141229
	.long	141230
	.long	141235
	.long	141250
	.long	141255
	.long	141312
	.long	141497
	.long	141498
	.long	141509
	.long	141568
	.long	141713
	.long	141728
	.long	141749
	.long	142080
	.long	142189
	.long	142192
	.long	142269
	.long	142336
	.long	142475
	.long	142496
	.long	142517
	.long	142528
	.long	142555
	.long	142592
	.long	142709
	.long	142720
	.long	142741
	.long	142752
	.long	142793
	.long	142848
	.long	142903
	.long	142906
	.long	142937
	.long	142944
	.long	142991
	.long	143360
	.long	143481
	.long	143680
	.long	143847
	.long	143870
	.long	143887
	.long	143890
	.long	143893
	.long	143896
	.long	143913
	.long	143914
	.long	143919
	.long	143920
	.long	143981
	.long	143982
	.long	143987
	.long	143990
	.long	144015
	.long	144032
	.long	144053
	.long	144192
	.long	144209
	.long	144212
	.long	144305
	.long	144308
	.long	144331
	.long	144384
	.long	144529
	.long	144544
	.long	144711
	.long	144736
	.long	144883
	.long	144896
	.long	144917
	.long	145088
	.long	145105
	.long	145280
	.long	145349
	.long	145376
	.long	145397
	.long	145408
	.long	145427
	.long	145428
	.long	145519
	.long	145520
	.long	145549
	.long	145568
	.long	145627
	.long	145632
	.long	145697
	.long	145700
	.long	145745
	.long	145746
	.long	145775
	.long	145920
	.long	145935
	.long	145936
	.long	145941
	.long	145942
	.long	146031
	.long	146036
	.long	146039
	.long	146040
	.long	146045
	.long	146046
	.long	146065
	.long	146080
	.long	146101
	.long	146112
	.long	146125
	.long	146126
	.long	146131
	.long	146132
	.long	146207
	.long	146208
	.long	146213
	.long	146214
	.long	146227
	.long	146240
	.long	146261
	.long	146272
	.long	146361
	.long	146368
	.long	146389
	.long	146880
	.long	146931
	.long	146944
	.long	146979
	.long	146980
	.long	147063
	.long	147068
	.long	147127
	.long	147296
	.long	147299
	.long	147328
	.long	147429
	.long	147454
	.long	149301
	.long	149504
	.long	149727
	.long	149728
	.long	149739
	.long	149760
	.long	150153
	.long	155424
	.long	155623
	.long	155648
	.long	157793
	.long	157824
	.long	157869
	.long	157888
	.long	165879
	.long	165888
	.long	167055
	.long	180736
	.long	180853
	.long	184320
	.long	185459
	.long	185472
	.long	185535
	.long	185536
	.long	185557
	.long	185564
	.long	185727
	.long	185728
	.long	185749
	.long	185760
	.long	185821
	.long	185824
	.long	185837
	.long	185856
	.long	185997
	.long	186016
	.long	186037
	.long	186038
	.long	186053
	.long	186054
	.long	186097
	.long	186106
	.long	186145
	.long	187008
	.long	187125
	.long	187520
	.long	187703
	.long	187712
	.long	187763
	.long	187766
	.long	187817
	.long	187904
	.long	188055
	.long	188062
	.long	188177
	.long	188190
	.long	188225
	.long	188352
	.long	188363
	.long	188384
	.long	188399
	.long	188416
	.long	203181
	.long	203262
	.long	203327
	.long	203520
	.long	203751
	.long	221152
	.long	221161
	.long	221162
	.long	221177
	.long	221178
	.long	221183
	.long	221184
	.long	221767
	.long	221796
	.long	221799
	.long	221856
	.long	221863
	.long	221866
	.long	221869
	.long	221896
	.long	221905
	.long	221920
	.long	222713
	.long	227328
	.long	227543
	.long	227552
	.long	227579
	.long	227584
	.long	227603
	.long	227616
	.long	227637
	.long	227640
	.long	227649
	.long	235520
	.long	236027
	.long	236032
	.long	236905
	.long	236916
	.long	236963
	.long	236992
	.long	237027
	.long	237056
	.long	237149
	.long	237152
	.long	237199
	.long	237216
	.long	237449
	.long	237568
	.long	238061
	.long	238080
	.long	238159
	.long	238162
	.long	238311
	.long	238326
	.long	238551
	.long	238592
	.long	238733
	.long	238976
	.long	239017
	.long	239040
	.long	239081
	.long	239104
	.long	239279
	.long	239296
	.long	239347
	.long	239616
	.long	239787
	.long	239788
	.long	239931
	.long	239932
	.long	239937
	.long	239940
	.long	239943
	.long	239946
	.long	239951
	.long	239954
	.long	239963
	.long	239964
	.long	239989
	.long	239990
	.long	239993
	.long	239994
	.long	240009
	.long	240010
	.long	240141
	.long	240142
	.long	240151
	.long	240154
	.long	240171
	.long	240172
	.long	240187
	.long	240188
	.long	240245
	.long	240246
	.long	240255
	.long	240256
	.long	240267
	.long	240268
	.long	240271
	.long	240276
	.long	240291
	.long	240292
	.long	240973
	.long	240976
	.long	241561
	.long	241564
	.long	242969
	.long	242998
	.long	243009
	.long	243010
	.long	243041
	.long	245248
	.long	245311
	.long	245322
	.long	245335
	.long	245760
	.long	245775
	.long	245776
	.long	245811
	.long	245814
	.long	245829
	.long	245830
	.long	245835
	.long	245836
	.long	245847
	.long	245856
	.long	245981
	.long	246046
	.long	246049
	.long	246272
	.long	246363
	.long	246368
	.long	246397
	.long	246400
	.long	246421
	.long	246428
	.long	246433
	.long	247072
	.long	247135
	.long	247168
	.long	247285
	.long	247294
	.long	247297
	.long	248224
	.long	248309
	.long	248736
	.long	248823
	.long	248830
	.long	248833
	.long	249216
	.long	249279
	.long	249280
	.long	249325
	.long	249340
	.long	249345
	.long	249792
	.long	249807
	.long	249808
	.long	249817
	.long	249818
	.long	249823
	.long	249824
	.long	249855
	.long	249856
	.long	250251
	.long	250254
	.long	250287
	.long	250368
	.long	250521
	.long	250528
	.long	250549
	.long	250556
	.long	250561
	.long	252130
	.long	252267
	.long	252418
	.long	252541
	.long	252928
	.long	252937
	.long	252938
	.long	252993
	.long	252994
	.long	252999
	.long	253000
	.long	253003
	.long	253006
	.long	253009
	.long	253010
	.long	253031
	.long	253032
	.long	253041
	.long	253042
	.long	253045
	.long	253046
	.long	253049
	.long	253060
	.long	253063
	.long	253070
	.long	253073
	.long	253074
	.long	253077
	.long	253078
	.long	253081
	.long	253082
	.long	253089
	.long	253090
	.long	253095
	.long	253096
	.long	253099
	.long	253102
	.long	253105
	.long	253106
	.long	253109
	.long	253110
	.long	253113
	.long	253114
	.long	253117
	.long	253118
	.long	253121
	.long	253122
	.long	253127
	.long	253128
	.long	253131
	.long	253134
	.long	253143
	.long	253144
	.long	253159
	.long	253160
	.long	253169
	.long	253170
	.long	253179
	.long	253180
	.long	253183
	.long	253184
	.long	253205
	.long	253206
	.long	253241
	.long	253250
	.long	253257
	.long	253258
	.long	253269
	.long	253270
	.long	253305
	.long	253408
	.long	253413
	.long	253952
	.long	254041
	.long	254048
	.long	254249
	.long	254272
	.long	254303
	.long	254306
	.long	254337
	.long	254338
	.long	254369
	.long	254370
	.long	254445
	.long	254464
	.long	254813
	.long	254924
	.long	254983
	.long	255008
	.long	255097
	.long	255104
	.long	255123
	.long	255136
	.long	255141
	.long	255168
	.long	255181
	.long	255488
	.long	257459
	.long	257464
	.long	257499
	.long	257504
	.long	257531
	.long	257536
	.long	257973
	.long	257984
	.long	258009
	.long	258016
	.long	258019
	.long	258048
	.long	258073
	.long	258080
	.long	258193
	.long	258208
	.long	258229
	.long	258240
	.long	258321
	.long	258336
	.long	258397
	.long	258400
	.long	258425
	.long	258432
	.long	258437
	.long	258464
	.long	258483
	.long	258560
	.long	259249
	.long	259264
	.long	259293
	.long	259296
	.long	259323
	.long	259328
	.long	259351
	.long	259356
	.long	259471
	.long	259472
	.long	259475
	.long	259482
	.long	259515
	.long	259518
	.long	259543
	.long	259550
	.long	259571
	.long	259584
	.long	259879
	.long	259880
	.long	260087
	.long	262144
	.long	347585
	.long	347648
	.long	356413
	.long	356416
	.long	367965
	.long	367968
	.long	382915
	.long	382944
	.long	384189
	.long	389120
	.long	390205
	.long	393216
	.long	403095
	.long	403104
	.long	420085
	.long	1835520
	.long	1836001
	.globl	_ZNSt9__unicode9__v16_0_013__width_edgesE
	.section	.rdata$_ZNSt9__unicode9__v16_0_013__width_edgesE,"dr"
	.linkonce same_size
	.align 32
_ZNSt9__unicode9__v16_0_013__width_edgesE:
	.long	4352
	.long	4448
	.long	8986
	.long	8988
	.long	9001
	.long	9003
	.long	9193
	.long	9197
	.long	9200
	.long	9201
	.long	9203
	.long	9204
	.long	9725
	.long	9727
	.long	9748
	.long	9750
	.long	9776
	.long	9784
	.long	9800
	.long	9812
	.long	9855
	.long	9856
	.long	9866
	.long	9872
	.long	9875
	.long	9876
	.long	9889
	.long	9890
	.long	9898
	.long	9900
	.long	9917
	.long	9919
	.long	9924
	.long	9926
	.long	9934
	.long	9935
	.long	9940
	.long	9941
	.long	9962
	.long	9963
	.long	9970
	.long	9972
	.long	9973
	.long	9974
	.long	9978
	.long	9979
	.long	9981
	.long	9982
	.long	9989
	.long	9990
	.long	9994
	.long	9996
	.long	10024
	.long	10025
	.long	10060
	.long	10061
	.long	10062
	.long	10063
	.long	10067
	.long	10070
	.long	10071
	.long	10072
	.long	10133
	.long	10136
	.long	10160
	.long	10161
	.long	10175
	.long	10176
	.long	11035
	.long	11037
	.long	11088
	.long	11089
	.long	11093
	.long	11094
	.long	11904
	.long	11930
	.long	11931
	.long	12020
	.long	12032
	.long	12246
	.long	12272
	.long	12351
	.long	12353
	.long	12439
	.long	12441
	.long	12544
	.long	12549
	.long	12592
	.long	12593
	.long	12687
	.long	12688
	.long	12774
	.long	12783
	.long	12831
	.long	12832
	.long	12872
	.long	12880
	.long	42125
	.long	42128
	.long	42183
	.long	43360
	.long	43389
	.long	44032
	.long	55204
	.long	63744
	.long	64256
	.long	65040
	.long	65050
	.long	65072
	.long	65107
	.long	65108
	.long	65127
	.long	65128
	.long	65132
	.long	65281
	.long	65377
	.long	65504
	.long	65511
	.long	94176
	.long	94181
	.long	94192
	.long	94199
	.long	94208
	.long	101590
	.long	101631
	.long	101663
	.long	101760
	.long	101875
	.long	110576
	.long	110580
	.long	110581
	.long	110588
	.long	110589
	.long	110591
	.long	110592
	.long	110883
	.long	110898
	.long	110899
	.long	110928
	.long	110931
	.long	110933
	.long	110934
	.long	110948
	.long	110952
	.long	110960
	.long	111356
	.long	119552
	.long	119639
	.long	119648
	.long	119671
	.long	126980
	.long	126981
	.long	127183
	.long	127184
	.long	127374
	.long	127375
	.long	127377
	.long	127387
	.long	127488
	.long	127491
	.long	127504
	.long	127548
	.long	127552
	.long	127561
	.long	127568
	.long	127570
	.long	127584
	.long	127590
	.long	127744
	.long	128592
	.long	128640
	.long	128710
	.long	128716
	.long	128717
	.long	128720
	.long	128723
	.long	128725
	.long	128729
	.long	128732
	.long	128736
	.long	128747
	.long	128749
	.long	128756
	.long	128765
	.long	128992
	.long	129004
	.long	129008
	.long	129009
	.long	129280
	.long	129536
	.long	129648
	.long	129661
	.long	129664
	.long	129675
	.long	129678
	.long	129735
	.long	129736
	.long	129737
	.long	129741
	.long	129757
	.long	129759
	.long	129771
	.long	129775
	.long	129785
	.long	131072
	.long	196606
	.long	196608
	.long	262142
	.section .rdata,"dr"
	.align 16
.LC12:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.align 4
.LC13:
	.long	2139095039
	.align 16
.LC19:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC20:
	.long	-1
	.long	2146435071
	.align 16
.LC21:
	.long	-1
	.long	-1
	.long	32766
	.long	0
	.align 16
.LC25:
	.quad	3688503277381496880
	.quad	3976738051646829616
	.align 16
.LC26:
	.quad	3544667369688283184
	.quad	3832902143785906737
	.align 16
.LC27:
	.quad	4121136918051239473
	.quad	3689066235924983858
	.align 16
.LC28:
	.quad	3977301010190316594
	.quad	3545230328231770162
	.align 16
.LC29:
	.quad	3833465102329393715
	.quad	4121699876594726451
	.align 16
.LC30:
	.quad	3689629194468470836
	.quad	3977863968733803572
	.align 16
.LC31:
	.quad	3545793286775257140
	.quad	3834028060872880693
	.align 16
.LC32:
	.quad	4122262835138213429
	.quad	3690192153011957814
	.align 16
.LC33:
	.quad	3978426927277290550
	.quad	3546356245318744118
	.align 16
.LC34:
	.quad	3834591019416367671
	.quad	4122825793681700407
	.align 16
.LC35:
	.quad	3690755111555444792
	.quad	3978989885820777528
	.align 16
.LC36:
	.quad	3546919203862231096
	.quad	3835153977959854649
	.align 16
.LC37:
	.quad	4122263930388298034
	.quad	16106987313379638
	.align 16
.LC38:
	.quad	3978425819141910832
	.quad	7378413942531504440
	.align 8
.LC41:
	.quad	_ZTVNSt8__format13_Padding_sinkINS_10_Sink_iterIcEEcEE+16
	.align 8
.LC48:
	.quad	_ZTVNSt8__format14_Fixedbuf_sinkIcEE+16
	.align 16
.LC51:
	.quad	0
	.quad	-1
	.align 8
.LC53:
	.quad	_ZTVNSt8__format9_Seq_sinkINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEE+16
	.align 16
.LC63:
	.quad	3617566370035954287
	.quad	7234316338103214893
	.def	__main;	.scl	2;	.type	32;	.endef
	.def	__extendhfsf2;	.scl	2;	.type	32;	.endef
	.def	__extendbfsf2;	.scl	2;	.type	32;	.endef
	.def	__udivti3;	.scl	2;	.type	32;	.endef
	.def	__gxx_personality_seh0;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev5, Built by MSYS2 project) 16.1.0"
	.def	_ZNSt13runtime_errorD2Ev;	.scl	2;	.type	32;	.endef
	.def	_ZdlPvy;	.scl	2;	.type	32;	.endef
	.def	__cxa_allocate_exception;	.scl	2;	.type	32;	.endef
	.def	_ZNSt13runtime_errorC2EPKc;	.scl	2;	.type	32;	.endef
	.def	__cxa_throw;	.scl	2;	.type	32;	.endef
	.def	__cxa_free_exception;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
	.def	_Znwy;	.scl	2;	.type	32;	.endef
	.def	memcpy;	.scl	2;	.type	32;	.endef
	.def	_ZSt20__throw_length_errorPKc;	.scl	2;	.type	32;	.endef
	.def	memset;	.scl	2;	.type	32;	.endef
	.def	_ZNSt6locale7classicEv;	.scl	2;	.type	32;	.endef
	.def	_ZNKSt6localeeqERKS_;	.scl	2;	.type	32;	.endef
	.def	_ZNKSt6locale2id5_M_idEv;	.scl	2;	.type	32;	.endef
	.def	memchr;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__throw_bad_castv;	.scl	2;	.type	32;	.endef
	.def	_ZNSt6localeC1ERKS_;	.scl	2;	.type	32;	.endef
	.def	_ZNKSt6locale4nameB5cxx11Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSt6localeD1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSt6localeC1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZSt8to_charsPcS_f;	.scl	2;	.type	32;	.endef
	.def	_ZSt8to_charsPcS_fSt12chars_formati;	.scl	2;	.type	32;	.endef
	.def	_ZSt8to_charsPcS_fSt12chars_format;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	frexpf;	.scl	2;	.type	32;	.endef
	.def	_ZSt24__throw_out_of_range_fmtPKcz;	.scl	2;	.type	32;	.endef
	.def	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE15_M_replace_coldEPcyPKcyy;	.scl	2;	.type	32;	.endef
	.def	_ZSt8to_charsPcS_d;	.scl	2;	.type	32;	.endef
	.def	_ZSt8to_charsPcS_dSt12chars_formati;	.scl	2;	.type	32;	.endef
	.def	_ZSt8to_charsPcS_dSt12chars_format;	.scl	2;	.type	32;	.endef
	.def	frexp;	.scl	2;	.type	32;	.endef
	.def	_ZSt8to_charsPcS_e;	.scl	2;	.type	32;	.endef
	.def	_ZSt8to_charsPcS_eSt12chars_formati;	.scl	2;	.type	32;	.endef
	.def	_ZSt8to_charsPcS_eSt12chars_format;	.scl	2;	.type	32;	.endef
	.def	frexpl;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	toupper;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	_ZNKSt13runtime_error4whatEv;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZNSt7__cxx118numpunctIcE2idE, "dr"
	.p2align	3, 0
	.globl	.refptr._ZNSt7__cxx118numpunctIcE2idE
	.linkonce	discard
.refptr._ZNSt7__cxx118numpunctIcE2idE:
	.quad	_ZNSt7__cxx118numpunctIcE2idE
