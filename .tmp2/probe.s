	.file	"probe.cpp"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "__cplusplus            = %ld\12\0"
.LC1:
	.ascii "__cpp_constexpr        = %ld\12\0"
	.align 8
.LC2:
	.ascii "__cpp_variadic_templates = %ld\12\0"
	.align 8
.LC3:
	.ascii "__cpp_rvalue_references  = %ld\12\0"
	.align 8
.LC4:
	.ascii "__cpp_variable_templates = %ld\12\0"
.LC5:
	.ascii "__cpp_if_constexpr     = %ld\12\0"
	.align 8
.LC6:
	.ascii "__cpp_structured_bindings = %ld\12\0"
.LC7:
	.ascii "__cpp_inline_variables = %ld\12\0"
.LC8:
	.ascii "__cpp_concepts         = %ld\12\0"
.LC9:
	.ascii "__cpp_consteval        = %ld\12\0"
.LC10:
	.ascii "__cpp_lib_format       = %ld\12\0"
.LC11:
	.ascii "__cpp_lib_jthread      = %ld\12\0"
.LC12:
	.ascii "__cpp_lib_expected     = %ld\12\0"
.LC13:
	.ascii "__cpp_lib_print        = %ld\12\0"
	.align 8
.LC14:
	.ascii "__cpp_lib_ranges_to_container = %ld\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB123:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	call	__main
	movl	$202302, %edx
	leaq	.LC0(%rip), %rcx
	call	__mingw_printf
	movl	$202211, %edx
	leaq	.LC1(%rip), %rcx
	call	__mingw_printf
	movl	$200704, %edx
	leaq	.LC2(%rip), %rcx
	call	__mingw_printf
	movl	$200610, %edx
	leaq	.LC3(%rip), %rcx
	call	__mingw_printf
	movl	$201304, %edx
	leaq	.LC4(%rip), %rcx
	call	__mingw_printf
	movl	$201606, %edx
	leaq	.LC5(%rip), %rcx
	call	__mingw_printf
	movl	$201606, %edx
	leaq	.LC6(%rip), %rcx
	call	__mingw_printf
	movl	$201606, %edx
	leaq	.LC7(%rip), %rcx
	call	__mingw_printf
	movl	$202002, %edx
	leaq	.LC8(%rip), %rcx
	call	__mingw_printf
	movl	$202211, %edx
	leaq	.LC9(%rip), %rcx
	call	__mingw_printf
	movl	$202304, %edx
	leaq	.LC10(%rip), %rcx
	call	__mingw_printf
	movl	$201911, %edx
	leaq	.LC11(%rip), %rcx
	call	__mingw_printf
	movl	$202211, %edx
	leaq	.LC12(%rip), %rcx
	call	__mingw_printf
	movl	$202406, %edx
	leaq	.LC13(%rip), %rcx
	call	__mingw_printf
	movl	$202202, %edx
	leaq	.LC14(%rip), %rcx
	call	__mingw_printf
	xorl	%eax, %eax
	addq	$40, %rsp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev5, Built by MSYS2 project) 16.1.0"
