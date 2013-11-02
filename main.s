	.file	"main.c"
	.comm	sl,16,16
	.comm	ul,16,16
	.section	.rodata
.LC0:
	.string	"clear"
	.text
	.globl	clear
	.type	clear, @function
clear:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$.LC0, %edi
	call	system
	movl	$10, %edi
	call	putchar
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	clear, .-clear
	.globl	compareDates
	.type	compareDates, @function
compareDates:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	%ecx, -16(%rbp)
	movl	%r8d, -20(%rbp)
	movl	%r9d, -24(%rbp)
	movl	-12(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jle	.L3
	movl	$1, %eax
	jmp	.L4
.L3:
	movl	-12(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jge	.L5
	movl	$-1, %eax
	jmp	.L4
.L5:
	movl	-8(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jle	.L6
	movl	$1, %eax
	jmp	.L4
.L6:
	movl	-8(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.L7
	movl	$-1, %eax
	jmp	.L4
.L7:
	movl	-4(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jle	.L8
	movl	$1, %eax
	jmp	.L4
.L8:
	movl	-4(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.L9
	movl	$-1, %eax
	jmp	.L4
.L9:
	movl	$0, %eax
.L4:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	compareDates, .-compareDates
	.globl	compareDatesAndHoras
	.type	compareDatesAndHoras, @function
compareDatesAndHoras:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$40, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	movl	%ecx, -32(%rbp)
	movq	-40(%rbp), %rax
	movl	8(%rax), %r8d
	movq	-40(%rbp), %rax
	movl	4(%rax), %edi
	movq	-40(%rbp), %rax
	movl	(%rax), %ecx
	movq	-24(%rbp), %rax
	movl	8(%rax), %edx
	movq	-24(%rbp), %rax
	movl	4(%rax), %esi
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%r8d, %r9d
	movl	%edi, %r8d
	movl	%eax, %edi
	call	compareDates
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L11
	movl	-4(%rbp), %eax
	jmp	.L12
.L11:
	movl	-28(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jle	.L13
	movl	$1, %eax
	jmp	.L12
.L13:
	movl	-28(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jge	.L14
	movl	$-1, %eax
	jmp	.L12
.L14:
	movl	$0, %eax
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	compareDatesAndHoras, .-compareDatesAndHoras
	.globl	isLeapYear
	.type	isLeapYear, @function
isLeapYear:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movl	%edi, -12(%rbp)
	movl	-12(%rbp), %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$7, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ebx
	subl	%eax, %ebx
	movl	%ebx, %eax
	imull	$400, %eax, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L16
	movl	$1, %eax
	jmp	.L17
.L16:
	movl	-12(%rbp), %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %ebx
	subl	%eax, %ebx
	movl	%ebx, %eax
	imull	$100, %eax, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L18
	movl	$0, %eax
	jmp	.L17
.L18:
	movl	-12(%rbp), %eax
	andl	$3, %eax
	testl	%eax, %eax
	jne	.L19
	movl	$1, %eax
	jmp	.L17
.L19:
	movl	$0, %eax
.L17:
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	isLeapYear, .-isLeapYear
	.globl	validTime
	.type	validTime, @function
validTime:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -32(%rbp)
	movl	$0, %edi
	call	time
	movq	%rax, -16(%rbp)
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	localtime
	movq	%rax, -8(%rbp)
	movl	-32(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, %edx
	jle	.L21
	movl	$1, %eax
	jmp	.L24
.L21:
	movl	-32(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, %edx
	jne	.L23
	movl	-28(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	subl	$15, %eax
	cmpl	%eax, %edx
	jl	.L23
	movl	$1, %eax
	jmp	.L24
.L23:
	movl	$0, %eax
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	validTime, .-validTime
	.globl	validDate
	.type	validDate, @function
validDate:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movl	%esi, -72(%rbp)
	movl	%edx, -76(%rbp)
	movl	$0, %edi
	call	time
	movq	%rax, -64(%rbp)
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	localtime
	movq	%rax, -56(%rbp)
	movl	$31, -48(%rbp)
	movl	$28, -44(%rbp)
	movl	$31, -40(%rbp)
	movl	$30, -36(%rbp)
	movl	$31, -32(%rbp)
	movl	$30, -28(%rbp)
	movl	$31, -24(%rbp)
	movl	$31, -20(%rbp)
	movl	$30, -16(%rbp)
	movl	$31, -12(%rbp)
	movl	$30, -8(%rbp)
	movl	$31, -4(%rbp)
	movl	-76(%rbp), %eax
	movl	%eax, %edi
	call	isLeapYear
	testl	%eax, %eax
	je	.L26
	movl	$29, -44(%rbp)
.L26:
	movq	-56(%rbp), %rax
	movl	12(%rax), %eax
	cmpl	-68(%rbp), %eax
	jne	.L27
	movq	-56(%rbp), %rax
	movl	16(%rax), %eax
	addl	$1, %eax
	cmpl	-72(%rbp), %eax
	jne	.L27
	movq	-56(%rbp), %rax
	movl	20(%rax), %eax
	addl	$1900, %eax
	cmpl	-76(%rbp), %eax
	jne	.L27
	movl	$2, %eax
	jmp	.L33
.L27:
	movq	-56(%rbp), %rax
	movl	20(%rax), %eax
	leal	1900(%rax), %r8d
	movq	-56(%rbp), %rax
	movl	16(%rax), %eax
	leal	1(%rax), %esi
	movq	-56(%rbp), %rax
	movl	12(%rax), %ecx
	movl	-68(%rbp), %eax
	leal	1(%rax), %edi
	movl	-76(%rbp), %edx
	movl	-72(%rbp), %eax
	movl	%r8d, %r9d
	movl	%esi, %r8d
	movl	%eax, %esi
	call	compareDates
	cmpl	$1, %eax
	jne	.L29
	cmpl	$0, -72(%rbp)
	jle	.L30
	cmpl	$12, -72(%rbp)
	jg	.L30
	cmpl	$0, -68(%rbp)
	jle	.L31
	movl	-72(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	cmpl	-68(%rbp), %eax
	jl	.L31
	movl	$1, %eax
	jmp	.L33
.L31:
	movl	$0, %eax
	jmp	.L33
.L30:
	movl	$0, %eax
	jmp	.L33
.L29:
	cmpl	$0, -72(%rbp)
	jle	.L32
	cmpl	$12, -72(%rbp)
	jg	.L32
	cmpl	$0, -68(%rbp)
	jle	.L32
	movl	-72(%rbp), %eax
	subl	$1, %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	cmpl	-68(%rbp), %eax
	jl	.L32
	movl	$-1, %eax
	jmp	.L33
.L32:
	movl	$0, %eax
.L33:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	validDate, .-validDate
	.globl	compareTime
	.type	compareTime, @function
compareTime:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -16(%rbp)
	movq	%rsi, -32(%rbp)
	movl	-16(%rbp), %edx
	movl	-32(%rbp), %eax
	cmpl	%eax, %edx
	jge	.L35
	movl	$1, %eax
	jmp	.L36
.L35:
	movl	-16(%rbp), %edx
	movl	-32(%rbp), %eax
	cmpl	%eax, %edx
	jne	.L37
	movl	-12(%rbp), %edx
	movl	-28(%rbp), %eax
	cmpl	%eax, %edx
	jge	.L37
	movl	$1, %eax
	jmp	.L36
.L37:
	movl	$0, %eax
.L36:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	compareTime, .-compareTime
	.globl	validInterval
	.type	validInterval, @function
validInterval:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movq	%rsi, -32(%rbp)
	movl	-16(%rbp), %eax
	cmpl	$9, %eax
	jle	.L39
	movl	-16(%rbp), %eax
	cmpl	$23, %eax
	jg	.L39
	movl	-32(%rbp), %eax
	cmpl	$9, %eax
	jle	.L39
	movl	-32(%rbp), %eax
	cmpl	$24, %eax
	jg	.L39
	movl	-12(%rbp), %eax
	testl	%eax, %eax
	je	.L40
	movl	-12(%rbp), %eax
	cmpl	$30, %eax
	jne	.L39
.L40:
	movl	-28(%rbp), %eax
	testl	%eax, %eax
	je	.L41
	movl	-28(%rbp), %eax
	cmpl	$30, %eax
	jne	.L39
.L41:
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	compareTime
	testl	%eax, %eax
	je	.L39
	movl	$1, %eax
	jmp	.L42
.L39:
	movl	$0, %eax
.L42:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	validInterval, .-validInterval
	.section	.rodata
.LC1:
	.string	"%d:%d0"
	.text
	.globl	printBlock
	.type	printBlock, @function
printBlock:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	$0, -4(%rbp)
	movl	-20(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L44
	movl	$3, -4(%rbp)
.L44:
	movl	-20(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -20(%rbp)
	addl	$10, -20(%rbp)
	movl	-4(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	printBlock, .-printBlock
	.section	.rodata
	.align 8
.LC2:
	.string	"\n\nRealizado por professionais:  Andr\303\251 Baptista e Guilherme Gra\303\247a\n"
.LC3:
	.string	"Reviews:"
	.align 8
.LC4:
	.string	" \302\253Que confus\303\243o!\302\273 - muita gente"
	.align 8
.LC5:
	.string	" \302\253Isso \303\251 para o 20!\302\273 - as nossas m\303\243es"
	.align 8
.LC6:
	.string	" \302\253Com arvores \303\251 que \303\251 de homem\302\273 - Michel "
	.align 8
.LC7:
	.string	" \302\253Aposto que encontro j\303\241 10 bugs\302\273 - an\303\263nimo"
	.align 8
.LC8:
	.string	" \302\253Ajuda-me no projecto\302\273 - an\303\263nimo\n"
.LC9:
	.string	"Desenvolvimento:"
	.align 8
.LC10:
	.string	" \302\253Com cores ficava mais bonito...\302\273"
	.align 8
.LC11:
	.string	" \302\253Boa est\303\251tica, vamos copiar...\302\273"
	.align 8
.LC12:
	.string	" \302\253A cerveja t\303\241 a ficar quente...\302\273"
	.align 8
.LC13:
	.string	" \302\253Podiamos fazer um virus e mandar ao stor...\302\273"
	.align 8
.LC14:
	.string	" \302\253Random segfaults everywhere...\302\273"
	.align 8
.LC15:
	.string	" \302\253Com esta linha chegamos as 1000 linhas!!\302\273"
	.text
	.globl	credits
	.type	credits, @function
credits:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$.LC2, %edi
	call	puts
	movl	$.LC3, %edi
	call	puts
	movl	$.LC4, %edi
	call	puts
	movl	$.LC5, %edi
	call	puts
	movl	$.LC6, %edi
	call	puts
	movl	$.LC7, %edi
	call	puts
	movl	$.LC8, %edi
	call	puts
	movl	$.LC9, %edi
	call	puts
	movl	$.LC10, %edi
	call	puts
	movl	$.LC11, %edi
	call	puts
	movl	$.LC12, %edi
	call	puts
	movl	$.LC13, %edi
	call	puts
	movl	$.LC14, %edi
	call	puts
	movl	$.LC15, %edi
	call	puts
	call	getchar
	movl	$0, %eax
	call	clear
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	credits, .-credits
	.globl	stdinClear
	.type	stdinClear, @function
stdinClear:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	nop
.L48:
	call	getchar
	movb	%al, -1(%rbp)
	cmpb	$10, -1(%rbp)
	je	.L46
	cmpb	$-1, -1(%rbp)
	jne	.L48
.L46:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	stdinClear, .-stdinClear
	.globl	reset_buffer
	.type	reset_buffer, @function
reset_buffer:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L50
.L51:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$1, -4(%rbp)
.L50:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L51
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	reset_buffer, .-reset_buffer
	.section	.rodata
	.align 8
.LC16:
	.string	"\033[32m Opera\303\247\303\243o conclu\303\255da com sucesso.\n\n\033[0m"
	.align 8
.LC17:
	.string	"\033[31m Opera\303\247\303\243o cancelada.\n\n\033[0m"
	.text
	.globl	feedBack
	.type	feedBack, @function
feedBack:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	$0, %eax
	call	stdinClear
	movl	$0, %eax
	call	clear
	cmpl	$0, -4(%rbp)
	je	.L56
.L53:
	cmpl	$1, -4(%rbp)
	jne	.L55
	movl	$.LC16, %edi
	movl	$0, %eax
	call	printf
	jmp	.L52
.L55:
	cmpl	$2, -4(%rbp)
	jne	.L52
	movl	$.LC17, %edi
	movl	$0, %eax
	call	printf
	jmp	.L52
.L56:
	nop
.L52:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	feedBack, .-feedBack
	.globl	ynInput
	.type	ynInput, @function
ynInput:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	stdin(%rip), %rax
	movq	%rax, %rdi
	call	fgetc
	movb	%al, -1(%rbp)
	cmpb	$10, -1(%rbp)
	jne	.L58
	movl	$1, %eax
	jmp	.L59
.L58:
	cmpb	$121, -1(%rbp)
	je	.L60
	cmpb	$89, -1(%rbp)
	jne	.L61
.L60:
	movl	$0, %eax
	call	stdinClear
	movl	$1, %eax
	jmp	.L59
.L61:
	movl	$0, %eax
	call	clear
	movl	$2, %edi
	call	feedBack
	movl	$0, %eax
.L59:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	ynInput, .-ynInput
	.globl	removeCommas
	.type	removeCommas, @function
removeCommas:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L63
.L65:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$44, %al
	jne	.L64
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$32, (%rax)
.L64:
	addl	$1, -4(%rbp)
.L63:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L65
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	removeCommas, .-removeCommas
	.globl	nameInput
	.type	nameInput, @function
nameInput:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$30, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$30, %esi
	movq	%rax, %rdi
	call	reset_buffer
	movq	stdin(%rip), %rdx
	movq	-8(%rbp), %rax
	movl	$31, %esi
	movq	%rax, %rdi
	call	fgets
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	leaq	-1(%rax), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	removeCommas
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	cmpq	$28, %rax
	jbe	.L67
	movl	$0, %eax
	call	stdinClear
.L67:
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	nameInput, .-nameInput
	.section	.rodata
.LC18:
	.string	"\n Data(dd mm aaaa): "
.LC19:
	.string	"%d%d%d"
.LC20:
	.string	"\033[31m Data inv\303\241lida.\n\033[0m"
	.align 8
.LC21:
	.string	"\033[31m Ainda n\303\243o existem m\303\241quinas do tempo.\n\033[0m"
	.text
	.globl	dateInput
	.type	dateInput, @function
dateInput:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
.L75:
	movl	$.LC18, %edi
	movl	$0, %eax
	call	printf
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC19, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	$0, %eax
	call	stdinClear
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %ecx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	validDate
	cmpl	$1, %eax
	jne	.L70
	movl	$0, %eax
	jmp	.L71
.L70:
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %ecx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	validDate
	cmpl	$2, %eax
	jne	.L72
	movl	$1, %eax
	jmp	.L71
.L72:
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %ecx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	validDate
	testl	%eax, %eax
	jne	.L73
	movl	$.LC20, %edi
	movl	$0, %eax
	call	printf
	jmp	.L75
.L73:
	movl	$.LC21, %edi
	movl	$0, %eax
	call	printf
	jmp	.L75
.L71:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	dateInput, .-dateInput
	.section	.rodata
	.align 8
.LC22:
	.string	"Hor\303\241rio (horas:minutos-horas:minutos): "
.LC23:
	.string	"%d %c %d %c %d %c %d"
.LC24:
	.string	"\033[31m Hora inv\303\241lida. \033[0m"
	.text
	.globl	timeInput
	.type	timeInput, @function
timeInput:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
.L80:
	movl	$.LC22, %edi
	movl	$0, %eax
	call	printf
	leaq	-16(%rbp), %r8
	leaq	-34(%rbp), %rdi
	leaq	-32(%rbp), %rax
	leaq	4(%rax), %rsi
	leaq	-35(%rbp), %rdx
	leaq	-32(%rbp), %rax
	leaq	-16(%rbp), %rcx
	addq	$4, %rcx
	movq	%rcx, 8(%rsp)
	leaq	-33(%rbp), %rcx
	movq	%rcx, (%rsp)
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rsi, %rcx
	movq	%rax, %rsi
	movl	$.LC23, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movq	-16(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	validInterval
	testl	%eax, %eax
	je	.L77
	cmpl	$1, -60(%rbp)
	jne	.L83
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	validTime
	testl	%eax, %eax
	jne	.L84
.L77:
	movl	$0, %eax
	call	stdinClear
	movl	$.LC24, %edi
	movl	$0, %eax
	call	printf
	jmp	.L80
.L83:
	nop
	jmp	.L79
.L84:
	nop
.L79:
	movl	-32(%rbp), %eax
	subl	$10, %eax
	leal	(%rax,%rax), %edx
	movq	-56(%rbp), %rax
	movl	%edx, (%rax)
	movl	-28(%rbp), %eax
	cmpl	$30, %eax
	jne	.L81
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-56(%rbp), %rax
	movl	%edx, (%rax)
.L81:
	movq	-56(%rbp), %rax
	addq	$4, %rax
	movl	-16(%rbp), %edx
	subl	$10, %edx
	addl	%edx, %edx
	movl	%edx, (%rax)
	movl	-12(%rbp), %eax
	cmpl	$30, %eax
	jne	.L82
	movq	-56(%rbp), %rax
	addq	$4, %rax
	movq	-56(%rbp), %rdx
	addq	$4, %rdx
	movl	(%rdx), %edx
	addl	$1, %edx
	movl	%edx, (%rax)
.L82:
	movq	-56(%rbp), %rax
	addq	$4, %rax
	movq	-56(%rbp), %rdx
	addq	$4, %rdx
	movl	(%rdx), %edx
	subl	$1, %edx
	movl	%edx, (%rax)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	timeInput, .-timeInput
	.globl	create_spaceDir
	.type	create_spaceDir, @function
create_spaceDir:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-48(%rbp), %rax
	movl	$1768188781, (%rax)
	movl	$1633951858, 4(%rax)
	movl	$1932484980, 8(%rax)
	movl	$1701011824, 12(%rax)
	movw	$12147, 16(%rax)
	movb	$0, 18(%rax)
	movq	-56(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	system
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L86
	call	__stack_chk_fail
.L86:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	create_spaceDir, .-create_spaceDir
	.section	.rodata
.LC25:
	.string	"a"
.LC26:
	.string	"data/users.txt"
.LC27:
	.string	"%s\n"
	.text
	.globl	saveUser
	.type	saveUser, @function
saveUser:
.LFB19:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$.LC25, %esi
	movl	$.LC26, %edi
	call	fopen
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	$.LC27, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	saveUser, .-saveUser
	.section	.rodata
.LC28:
	.string	"data/spaces.txt"
.LC29:
	.string	"w"
	.text
	.globl	saveSpace
	.type	saveSpace, @function
saveSpace:
.LFB20:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movq	%rdi, -136(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$.LC25, %esi
	movl	$.LC28, %edi
	call	fopen
	movq	%rax, -120(%rbp)
	movq	-136(%rbp), %rdx
	movq	-120(%rbp), %rax
	movl	$.LC27, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	create_spaceDir
	leaq	-112(%rbp), %rax
	movl	$1635017060, (%rax)
	movl	$1634759471, 4(%rax)
	movl	$796091747, 8(%rax)
	movb	$0, 12(%rax)
	movq	-136(%rbp), %rdx
	leaq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat
	leaq	-112(%rbp), %rax
	movq	$-1, -144(%rbp)
	movq	%rax, %rdx
	movl	$0, %eax
	movq	-144(%rbp), %rcx
	movq	%rdx, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	leaq	-1(%rax), %rdx
	leaq	-112(%rbp), %rax
	addq	%rdx, %rax
	movl	$1634296879, (%rax)
	movl	$2020879987, 4(%rax)
	movw	$116, 8(%rax)
	leaq	-112(%rbp), %rax
	movl	$.LC29, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L89
	call	__stack_chk_fail
.L89:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	saveSpace, .-saveSpace
	.section	.rodata
.LC30:
	.string	"%d-%d-%d"
	.text
	.globl	dateNotIn
	.type	dateNotIn, @function
dateNotIn:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movl	%edx, -48(%rbp)
	movl	%ecx, -52(%rbp)
	movl	$10, %edi
	call	malloc
	movq	%rax, -16(%rbp)
	movl	$10, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	movl	$0, -20(%rbp)
	movl	-52(%rbp), %esi
	movl	-48(%rbp), %ecx
	movl	-44(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC30, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
.L97:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc
	movb	%al, -21(%rbp)
	cmpb	$-1, -21(%rbp)
	je	.L99
.L91:
	cmpb	$10, -21(%rbp)
	jne	.L93
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L94
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$0, %eax
	jmp	.L95
.L94:
	movl	$0, -20(%rbp)
	jmp	.L97
.L93:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-21(%rbp), %eax
	movb	%al, (%rdx)
	addl	$1, -20(%rbp)
	jmp	.L97
.L99:
	nop
.L98:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$1, %eax
.L95:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	dateNotIn, .-dateNotIn
	.section	.rodata
.LC31:
	.string	"r+"
.LC32:
	.string	"%d-%d-%d\n"
	.text
	.globl	saveDate
	.type	saveDate, @function
saveDate:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$288, %rsp
	movq	%rdi, -264(%rbp)
	movq	%rsi, -272(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-224(%rbp), %rax
	movl	$1635017060, (%rax)
	movl	$1634759471, 4(%rax)
	movl	$796091747, 8(%rax)
	movb	$0, 12(%rax)
	movq	-264(%rbp), %rdx
	leaq	-224(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat
	leaq	-224(%rbp), %rdx
	leaq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	leaq	-224(%rbp), %rax
	movq	$-1, -280(%rbp)
	movq	%rax, %rdx
	movl	$0, %eax
	movq	-280(%rbp), %rcx
	movq	%rdx, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	leaq	-1(%rax), %rdx
	leaq	-224(%rbp), %rax
	addq	%rdx, %rax
	movl	$1634296879, (%rax)
	movl	$2020879987, 4(%rax)
	movw	$116, 8(%rax)
	leaq	-224(%rbp), %rax
	movl	$.LC29, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -248(%rbp)
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	leaq	-224(%rbp), %rax
	movl	$.LC31, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -248(%rbp)
	movq	-272(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-272(%rbp), %rax
	movl	4(%rax), %edx
	movq	-272(%rbp), %rax
	movl	(%rax), %esi
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	dateNotIn
	testl	%eax, %eax
	je	.L101
	movq	-272(%rbp), %rax
	movl	8(%rax), %esi
	movq	-272(%rbp), %rax
	movl	4(%rax), %ecx
	movq	-272(%rbp), %rax
	movl	(%rax), %edx
	movq	-248(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC32, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
.L101:
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	-272(%rbp), %rax
	movl	8(%rax), %esi
	movq	-272(%rbp), %rax
	movl	4(%rax), %ecx
	movq	-272(%rbp), %rax
	movl	(%rax), %edx
	leaq	-240(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC30, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-112(%rbp), %rax
	movq	$-1, -280(%rbp)
	movq	%rax, %rdx
	movl	$0, %eax
	movq	-280(%rbp), %rcx
	movq	%rdx, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	leaq	-1(%rax), %rdx
	leaq	-112(%rbp), %rax
	addq	%rdx, %rax
	movw	$47, (%rax)
	leaq	-240(%rbp), %rdx
	leaq	-112(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat
	leaq	-112(%rbp), %rax
	movq	$-1, -280(%rbp)
	movq	%rax, %rdx
	movl	$0, %eax
	movq	-280(%rbp), %rcx
	movq	%rdx, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	leaq	-1(%rax), %rdx
	leaq	-112(%rbp), %rax
	addq	%rdx, %rax
	movl	$1954051118, (%rax)
	movb	$0, 4(%rax)
	leaq	-112(%rbp), %rax
	movl	$.LC29, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -248(%rbp)
	movl	$0, -252(%rbp)
	jmp	.L102
.L103:
	movq	-248(%rbp), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc
	addl	$1, -252(%rbp)
.L102:
	cmpl	$27, -252(%rbp)
	jle	.L103
	movq	-248(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L104
	call	__stack_chk_fail
.L104:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	saveDate, .-saveDate
	.globl	insert_buffer
	.type	insert_buffer, @function
insert_buffer:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L106
.L107:
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -4(%rbp)
	addl	$1, -36(%rbp)
.L106:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L107
	movl	-36(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	insert_buffer, .-insert_buffer
	.globl	fsize
	.type	fsize, @function
fsize:
.LFB24:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L112
.L114:
	nop
.L112:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc
	movb	%al, -5(%rbp)
	addl	$1, -4(%rbp)
	cmpb	$-1, -5(%rbp)
	jne	.L114
	nop
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	rewind
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	fsize, .-fsize
	.globl	fAddUser
	.type	fAddUser, @function
fAddUser:
.LFB25:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	%edx, -68(%rbp)
	cmpl	$0, -68(%rbp)
	je	.L129
.L116:
	movl	$0, -36(%rbp)
	movl	$0, -32(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	fsize
	movl	%eax, %ebx
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	sall	$2, %eax
	leal	0(,%rax,8), %edx
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	%ebx, %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -24(%rbp)
	movl	-28(%rbp), %edx
	movq	-24(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	reset_buffer
.L122:
	movl	-36(%rbp), %eax
	cmpl	-68(%rbp), %eax
	je	.L130
.L118:
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc
	movb	%al, (%rbx)
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L120
	addl	$1, -36(%rbp)
.L120:
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$-1, %al
	je	.L131
.L121:
	addl	$1, -32(%rbp)
	jmp	.L122
.L130:
	nop
	jmp	.L119
.L131:
	nop
.L119:
	movl	-32(%rbp), %eax
	cltq
	leaq	-2(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	je	.L123
	movl	-32(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$44, (%rax)
	jmp	.L124
.L123:
	subl	$1, -32(%rbp)
.L124:
	movl	-32(%rbp), %edx
	movq	-64(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	insert_buffer
	movl	%eax, -32(%rbp)
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$10, (%rax)
	addl	$1, -32(%rbp)
.L127:
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc
	movb	%al, -37(%rbp)
	cmpb	$-1, -37(%rbp)
	je	.L132
.L125:
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-37(%rbp), %eax
	movb	%al, (%rdx)
	addl	$1, -32(%rbp)
	jmp	.L127
.L132:
	nop
.L128:
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	rewind
	movq	-56(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fputs
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free
	jmp	.L115
.L129:
	nop
.L115:
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	fAddUser, .-fAddUser
	.section	.rodata
.LC33:
	.string	"data/spaces/%s/%d-%d-%d.txt"
	.text
	.globl	saveReservation
	.type	saveReservation, @function
saveReservation:
.LFB26:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movq	%rdi, -136(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-136(%rbp), %rax
	movq	24(%rax), %rax
	movl	8(%rax), %edi
	movq	-136(%rbp), %rax
	movq	24(%rax), %rax
	movl	4(%rax), %esi
	movq	-136(%rbp), %rax
	movq	24(%rax), %rax
	movl	(%rax), %ecx
	movq	-136(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rdx
	leaq	-112(%rbp), %rax
	movl	%edi, %r9d
	movl	%esi, %r8d
	movl	$.LC33, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-112(%rbp), %rax
	movl	$.LC31, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -120(%rbp)
	cmpq	$0, -120(%rbp)
	je	.L133
	movq	-136(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-136(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rcx
	movq	-120(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	fAddUser
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
.L133:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L136
	call	__stack_chk_fail
.L136:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE26:
	.size	saveReservation, .-saveReservation
	.globl	find
	.type	find, @function
find:
.LFB27:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movl	$0, -20(%rbp)
	movl	$0, -32(%rbp)
	movl	$0, -28(%rbp)
	movl	$0, -24(%rbp)
	movb	$32, -33(%rbp)
	jmp	.L138
.L146:
	movl	$0, -28(%rbp)
	movl	$0, -24(%rbp)
	movl	-32(%rbp), %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -33(%rbp)
	movq	-64(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	-33(%rbp), %al
	jne	.L139
	movl	$0, -28(%rbp)
	jmp	.L140
.L143:
	movl	-32(%rbp), %eax
	movl	-28(%rbp), %edx
	addl	%edx, %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movl	-28(%rbp), %eax
	movslq	%eax, %rcx
	movq	-64(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jne	.L141
	movl	$1, -24(%rbp)
	jmp	.L142
.L141:
	movl	$0, -24(%rbp)
.L142:
	addl	$1, -28(%rbp)
.L140:
	movl	-28(%rbp), %eax
	movslq	%eax, %rbx
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	cmpq	%rax, %rbx
	jb	.L143
.L139:
	cmpl	$1, -24(%rbp)
	jne	.L144
	movl	-32(%rbp), %eax
	jmp	.L145
.L144:
	addl	$1, -32(%rbp)
.L138:
	cmpb	$0, -33(%rbp)
	jne	.L146
	movl	$-1, %eax
.L145:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE27:
	.size	find, .-find
	.section	.rodata
.LC34:
	.string	"r"
	.text
	.globl	fRemoveUser
	.type	fRemoveUser, @function
fRemoveUser:
.LFB28:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movl	%edx, -84(%rbp)
	cmpl	$0, -84(%rbp)
	je	.L165
.L148:
	movq	-72(%rbp), %rax
	movl	$.LC34, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	je	.L166
.L150:
	movl	$0, -60(%rbp)
	movl	$0, -56(%rbp)
	movl	$0, -52(%rbp)
	movl	$0, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fsize
	movslq	%eax, %rbx
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rbx, %rdx
	subq	%rax, %rdx
	movq	%rdx, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -32(%rbp)
	movl	$1000, %edi
	call	malloc
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fsize
	movl	%eax, %ebx
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%ebx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	movq	-32(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	reset_buffer
.L155:
	movl	-84(%rbp), %eax
	subl	$1, %eax
	cmpl	-60(%rbp), %eax
	je	.L167
.L151:
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc
	movb	%al, (%rbx)
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L153
	addl	$1, -60(%rbp)
.L153:
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$-1, %al
	je	.L168
.L154:
	addl	$1, -56(%rbp)
	jmp	.L155
.L167:
	nop
	jmp	.L152
.L168:
	nop
.L152:
	movq	-40(%rbp), %rdx
	movq	-24(%rbp), %rax
	movl	$501, %esi
	movq	%rax, %rdi
	call	fgets
	movq	-80(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	find
	movl	%eax, -44(%rbp)
	cmpl	$-1, -44(%rbp)
	je	.L169
.L156:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	leaq	-1(%rax), %rbx
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	cmpq	%rax, %rbx
	jne	.L157
	movq	-40(%rbp), %rax
	movl	$1, %edx
	movq	$-1, %rsi
	movq	%rax, %rdi
	call	fseek
	jmp	.L158
.L157:
	cmpl	$0, -44(%rbp)
	jle	.L159
	movl	$1, -48(%rbp)
.L159:
	movl	-52(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L170
.L160:
	movl	-48(%rbp), %eax
	movl	-44(%rbp), %edx
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	cmpl	-52(%rbp), %eax
	jne	.L161
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, %edx
	movl	-52(%rbp), %eax
	addl	%edx, %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
.L161:
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movl	-52(%rbp), %eax
	movslq	%eax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -56(%rbp)
	addl	$1, -52(%rbp)
	jmp	.L159
.L170:
	nop
.L158:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc
	movb	%al, -61(%rbp)
	cmpb	$-1, -61(%rbp)
	je	.L171
.L162:
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-61(%rbp), %eax
	movb	%al, (%rdx)
	addl	$1, -56(%rbp)
	jmp	.L158
.L171:
	nop
.L164:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	-72(%rbp), %rax
	movl	$.LC29, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fputs
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	jmp	.L147
.L165:
	nop
	jmp	.L147
.L166:
	nop
	jmp	.L147
.L169:
	nop
.L147:
	addq	$88, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE28:
	.size	fRemoveUser, .-fRemoveUser
	.globl	fdelete
	.type	fdelete, @function
fdelete:
.LFB29:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -120(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-120(%rbp), %rax
	movq	24(%rax), %rax
	movl	8(%rax), %edi
	movq	-120(%rbp), %rax
	movq	24(%rax), %rax
	movl	4(%rax), %esi
	movq	-120(%rbp), %rax
	movq	24(%rax), %rax
	movl	(%rax), %ecx
	movq	-120(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rdx
	leaq	-112(%rbp), %rax
	movl	%edi, %r9d
	movl	%esi, %r8d
	movl	$.LC33, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	movq	-120(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-120(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rcx
	leaq	-112(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	fRemoveUser
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L173
	call	__stack_chk_fail
.L173:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE29:
	.size	fdelete, .-fdelete
	.globl	newReservation
	.type	newReservation, @function
newReservation:
.LFB30:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$64, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$-1, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 24(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 32(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 40(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 48(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 56(%rax)
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE30:
	.size	newReservation, .-newReservation
	.globl	findReservation
	.type	findReservation, @function
findReservation:
.LFB31:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L177
	movl	$0, %eax
	jmp	.L178
.L177:
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	cmpq	-32(%rbp), %rax
	jne	.L179
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	-36(%rbp), %eax
	jne	.L179
	movq	-8(%rbp), %rax
	jmp	.L178
.L179:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	jne	.L180
	movl	$0, %eax
	jmp	.L178
.L180:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L177
.L178:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE31:
	.size	findReservation, .-findReservation
	.globl	newDate
	.type	newDate, @function
newDate:
.LFB32:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movl	%edx, -48(%rbp)
	movl	%ecx, -52(%rbp)
	movl	$248, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	-44(%rbp), %edx
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movl	-48(%rbp), %edx
	movl	%edx, 4(%rax)
	movq	-8(%rbp), %rax
	movl	-52(%rbp), %edx
	movl	%edx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 240(%rax)
	movl	$0, -28(%rbp)
	jmp	.L182
.L183:
	movq	-8(%rbp), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$2, %rdx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -28(%rbp)
.L182:
	cmpl	$27, -28(%rbp)
	jle	.L183
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L184
	movq	-40(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L185
.L184:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movl	8(%rax), %r8d
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movl	4(%rax), %edi
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movl	(%rax), %ecx
	movl	-52(%rbp), %edx
	movl	-48(%rbp), %esi
	movl	-44(%rbp), %eax
	movl	%r8d, %r9d
	movl	%edi, %r8d
	movl	%eax, %edi
	call	compareDates
	cmpl	$-1, %eax
	jne	.L186
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 240(%rax)
	movq	-40(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L185
.L186:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	240(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L187
.L189:
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	240(%rax), %rax
	movq	%rax, -16(%rbp)
.L187:
	cmpq	$0, -16(%rbp)
	je	.L188
	movq	-16(%rbp), %rax
	movl	8(%rax), %r8d
	movq	-16(%rbp), %rax
	movl	4(%rax), %edi
	movq	-16(%rbp), %rax
	movl	(%rax), %ecx
	movl	-52(%rbp), %edx
	movl	-48(%rbp), %esi
	movl	-44(%rbp), %eax
	movl	%r8d, %r9d
	movl	%edi, %r8d
	movl	%eax, %edi
	call	compareDates
	testl	%eax, %eax
	jg	.L189
.L188:
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 240(%rax)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 240(%rax)
.L185:
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE32:
	.size	newDate, .-newDate
	.globl	findDate
	.type	findDate, @function
findDate:
.LFB33:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$40, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	%ecx, -36(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L192
	movl	$0, %eax
	jmp	.L193
.L192:
	movq	-8(%rbp), %rax
	movl	8(%rax), %r8d
	movq	-8(%rbp), %rax
	movl	4(%rax), %edi
	movq	-8(%rbp), %rax
	movl	(%rax), %ecx
	movl	-36(%rbp), %edx
	movl	-32(%rbp), %esi
	movl	-28(%rbp), %eax
	movl	%r8d, %r9d
	movl	%edi, %r8d
	movl	%eax, %edi
	call	compareDates
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	jne	.L194
	movq	-8(%rbp), %rax
	jmp	.L193
.L194:
	movq	-8(%rbp), %rax
	movq	240(%rax), %rax
	testq	%rax, %rax
	je	.L195
	cmpl	$-1, -12(%rbp)
	jne	.L196
.L195:
	movl	$0, %eax
	jmp	.L193
.L196:
	movq	-8(%rbp), %rax
	movq	240(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L192
.L193:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE33:
	.size	findDate, .-findDate
	.globl	findOrCreateDate
	.type	findOrCreateDate, @function
findOrCreateDate:
.LFB34:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	%ecx, -36(%rbp)
	movl	%r8d, -40(%rbp)
	movl	-36(%rbp), %ecx
	movl	-32(%rbp), %edx
	movl	-28(%rbp), %esi
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	findDate
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L198
	movl	-36(%rbp), %ecx
	movl	-32(%rbp), %edx
	movl	-28(%rbp), %esi
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	newDate
	movq	%rax, -8(%rbp)
	cmpl	$1, -40(%rbp)
	jne	.L198
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	saveDate
.L198:
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE34:
	.size	findOrCreateDate, .-findOrCreateDate
	.globl	newSpace
	.type	newSpace, @function
newSpace:
.LFB35:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$24, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	movl	$30, %edi
	call	malloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	$30, %esi
	movq	%rax, %rdi
	call	reset_buffer
	movl	$0, -12(%rbp)
	jmp	.L201
.L202:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	movslq	%eax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -12(%rbp)
.L201:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L202
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	sl(%rip), %rax
	testq	%rax, %rax
	jne	.L203
	movq	-8(%rbp), %rax
	movq	%rax, sl(%rip)
	movq	-8(%rbp), %rax
	movq	%rax, sl+8(%rip)
	jmp	.L204
.L203:
	movq	sl+8(%rip), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	%rax, sl+8(%rip)
.L204:
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE35:
	.size	newSpace, .-newSpace
	.globl	findSpace
	.type	findSpace, @function
findSpace:
.LFB36:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	sl(%rip), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L207
	movl	$0, %eax
	jmp	.L208
.L207:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L209
	movq	-8(%rbp), %rax
	jmp	.L208
.L209:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L210
	movl	$0, %eax
	jmp	.L208
.L210:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L207
.L208:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE36:
	.size	findSpace, .-findSpace
	.section	.rodata
	.align 8
.LC35:
	.string	" O espa\303\247o '%s' n\303\243o existe. Quer que seja criado? (Y/n) "
	.text
	.globl	findOrCreateSpace
	.type	findOrCreateSpace, @function
findOrCreateSpace:
.LFB37:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	findSpace
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L212
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC35, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	call	ynInput
	testl	%eax, %eax
	je	.L213
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	newSpace
	movq	%rax, -8(%rbp)
	cmpl	$1, -28(%rbp)
	jne	.L212
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	saveSpace
	jmp	.L212
.L213:
	movl	$0, %eax
	jmp	.L214
.L212:
	movq	-8(%rbp), %rax
.L214:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE37:
	.size	findOrCreateSpace, .-findOrCreateSpace
	.globl	newUser
	.type	newUser, @function
newUser:
.LFB38:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$24, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	movl	$30, %edi
	call	malloc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	$30, %esi
	movq	%rax, %rdi
	call	reset_buffer
	movl	$0, -12(%rbp)
	jmp	.L216
.L217:
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	movslq	%eax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -12(%rbp)
.L216:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L217
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	movq	ul(%rip), %rax
	testq	%rax, %rax
	jne	.L218
	movq	-8(%rbp), %rax
	movq	%rax, ul(%rip)
	movq	-8(%rbp), %rax
	movq	%rax, ul+8(%rip)
	jmp	.L219
.L218:
	movq	ul+8(%rip), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	%rax, ul+8(%rip)
.L219:
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE38:
	.size	newUser, .-newUser
	.globl	findUser
	.type	findUser, @function
findUser:
.LFB39:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	ul(%rip), %rax
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L222
	movl	$0, %eax
	jmp	.L223
.L222:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L224
	movq	-8(%rbp), %rax
	jmp	.L223
.L224:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	testq	%rax, %rax
	jne	.L225
	movl	$0, %eax
	jmp	.L223
.L225:
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L222
.L223:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE39:
	.size	findUser, .-findUser
	.section	.rodata
	.align 8
.LC36:
	.string	" O utilizador '%s' n\303\243o existe. Quer que seja criado? (Y/n) "
	.text
	.globl	findOrCreateUser
	.type	findOrCreateUser, @function
findOrCreateUser:
.LFB40:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	findUser
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L227
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC36, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	call	ynInput
	testl	%eax, %eax
	je	.L228
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	newUser
	movq	%rax, -8(%rbp)
	cmpl	$1, -28(%rbp)
	jne	.L227
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	saveUser
	jmp	.L227
.L228:
	movl	$0, %eax
	jmp	.L229
.L227:
	movq	-8(%rbp), %rax
.L229:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE40:
	.size	findOrCreateUser, .-findOrCreateUser
	.globl	checkReservation
	.type	checkReservation, @function
checkReservation:
.LFB41:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	%ecx, -44(%rbp)
	movl	$0, -12(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
.L237:
	cmpq	$0, -8(%rbp)
	je	.L239
.L231:
	movq	-8(%rbp), %rax
	movl	(%rax), %ecx
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdx
	movl	-44(%rbp), %esi
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	compareDatesAndHoras
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	js	.L240
.L233:
	cmpl	$0, -12(%rbp)
	jne	.L234
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jne	.L235
	movl	$3, %eax
	jmp	.L236
.L235:
	movl	$1, %eax
	jmp	.L236
.L234:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L237
.L239:
	nop
	jmp	.L232
.L240:
	nop
.L232:
	movq	-40(%rbp), %rax
	movl	-44(%rbp), %edx
	movslq	%edx, %rdx
	addq	$2, %rdx
	movq	(%rax,%rdx,8), %rax
	testq	%rax, %rax
	jne	.L238
	movl	$0, %eax
	jmp	.L236
.L238:
	movl	$2, %eax
.L236:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE41:
	.size	checkReservation, .-checkReservation
	.globl	addReservationToUser
	.type	addReservationToUser, @function
addReservationToUser:
.LFB42:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L242
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L243
.L242:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	(%rax), %ecx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	24(%rax), %rdx
	movq	-32(%rbp), %rax
	movl	(%rax), %esi
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	compareDatesAndHoras
	cmpl	$-1, %eax
	jne	.L244
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, 32(%rax)
	movq	-24(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L243
.L244:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
.L250:
	movq	-16(%rbp), %rax
	movl	(%rax), %ecx
	movq	-16(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-32(%rbp), %rax
	movl	(%rax), %esi
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	compareDatesAndHoras
	testl	%eax, %eax
	jne	.L245
	movl	$0, %eax
	jmp	.L246
.L245:
	cmpq	$0, -8(%rbp)
	je	.L251
.L247:
	movq	-8(%rbp), %rax
	movl	(%rax), %ecx
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-32(%rbp), %rax
	movl	(%rax), %esi
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, %rdi
	call	compareDatesAndHoras
	cmpl	$-1, %eax
	je	.L252
.L249:
	movq	-8(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L250
.L251:
	nop
	jmp	.L248
.L252:
	nop
.L248:
	movq	-16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-32(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 32(%rax)
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 40(%rax)
.L243:
	movl	$1, %eax
.L246:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE42:
	.size	addReservationToUser, .-addReservationToUser
	.globl	addReservationToDate
	.type	addReservationToDate, @function
addReservationToDate:
.LFB43:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-24(%rbp), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$2, %rdx
	movq	(%rax,%rdx,8), %rax
	testq	%rax, %rax
	jne	.L254
	movq	-24(%rbp), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	leaq	2(%rdx), %rcx
	movq	-40(%rbp), %rdx
	movq	%rdx, (%rax,%rcx,8)
	jmp	.L253
.L254:
	movq	-24(%rbp), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	addq	$2, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -8(%rbp)
	jmp	.L256
.L257:
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	movq	%rax, -8(%rbp)
.L256:
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	testq	%rax, %rax
	jne	.L257
	movq	-8(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 48(%rax)
	movq	-40(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 56(%rax)
.L253:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE43:
	.size	addReservationToDate, .-addReservationToDate
	.globl	makeReservation
	.type	makeReservation, @function
makeReservation:
.LFB44:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	%ecx, -44(%rbp)
	movl	%r8d, -48(%rbp)
	movl	$0, %eax
	call	newReservation
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	-44(%rbp), %edx
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, 16(%rax)
	movq	-8(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 24(%rax)
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	addReservationToUser
	testl	%eax, %eax
	je	.L258
	movq	-8(%rbp), %rdx
	movl	-44(%rbp), %ecx
	movq	-40(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	addReservationToDate
	cmpl	$1, -48(%rbp)
	jne	.L258
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	saveReservation
.L258:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE44:
	.size	makeReservation, .-makeReservation
	.globl	deleteReservation
	.type	deleteReservation, @function
deleteReservation:
.LFB45:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L271
.L261:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fdelete
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	jne	.L263
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	jne	.L263
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	$0, 8(%rax)
	jmp	.L264
.L263:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	jne	.L265
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	movq	$0, 32(%rax)
	jmp	.L264
.L265:
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	jne	.L266
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	$0, 40(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	32(%rdx), %rdx
	movq	%rdx, 8(%rax)
	jmp	.L264
.L266:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	40(%rdx), %rdx
	movq	%rdx, 40(%rax)
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	32(%rdx), %rdx
	movq	%rdx, 32(%rax)
.L264:
	movq	-8(%rbp), %rax
	movq	56(%rax), %rax
	testq	%rax, %rax
	jne	.L267
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	testq	%rax, %rax
	jne	.L267
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdx
	movl	(%rdx), %edx
	movslq	%edx, %rdx
	addq	$2, %rdx
	movq	$0, (%rax,%rdx,8)
	jmp	.L268
.L267:
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	testq	%rax, %rax
	jne	.L269
	movq	-8(%rbp), %rax
	movq	56(%rax), %rax
	movq	$0, 48(%rax)
	jmp	.L268
.L269:
	movq	-8(%rbp), %rax
	movq	56(%rax), %rax
	testq	%rax, %rax
	jne	.L270
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	movq	$0, 56(%rax)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdx
	movl	(%rdx), %ecx
	movq	-8(%rbp), %rdx
	movq	48(%rdx), %rdx
	movslq	%ecx, %rcx
	addq	$2, %rcx
	movq	%rdx, (%rax,%rcx,8)
	jmp	.L268
.L270:
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	56(%rdx), %rdx
	movq	%rdx, 56(%rax)
	movq	-8(%rbp), %rax
	movq	56(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	48(%rdx), %rdx
	movq	%rdx, 48(%rax)
.L268:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	jmp	.L260
.L271:
	nop
.L260:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE45:
	.size	deleteReservation, .-deleteReservation
	.section	.rodata
	.align 8
.LC37:
	.string	" Espa\303\247o: %s\n Data: %d/%d/%d\n\n"
.LC38:
	.string	" Horas       | Utilizadores"
.LC39:
	.string	"\033[32m"
.LC40:
	.string	" | "
.LC41:
	.string	"%s"
.LC42:
	.string	"%s - "
.LC43:
	.string	"\033[0m"
.LC44:
	.string	"\n "
	.text
	.globl	printDay
	.type	printDay, @function
printDay:
.LFB46:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movq	-32(%rbp), %rax
	movl	8(%rax), %esi
	movq	-32(%rbp), %rax
	movl	4(%rax), %ecx
	movq	-32(%rbp), %rax
	movl	(%rax), %edx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	%esi, %r8d
	movq	%rax, %rsi
	movl	$.LC37, %edi
	movl	$0, %eax
	call	printf
	movl	$.LC38, %edi
	call	puts
	movl	-36(%rbp), %eax
	movl	%eax, -12(%rbp)
	jmp	.L273
.L280:
	movq	-32(%rbp), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	addq	$2, %rdx
	movq	(%rax,%rdx,8), %rax
	testq	%rax, %rax
	jne	.L274
	movl	$.LC39, %edi
	movl	$0, %eax
	call	printf
.L274:
	movl	$32, %edi
	call	putchar
	movl	-12(%rbp), %eax
	movl	%eax, %edi
	call	printBlock
	movl	$45, %edi
	call	putchar
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %edi
	call	printBlock
	movl	$.LC40, %edi
	movl	$0, %eax
	call	printf
	movq	-32(%rbp), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	addq	$2, %rdx
	movq	(%rax,%rdx,8), %rax
	testq	%rax, %rax
	je	.L275
	movq	-32(%rbp), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	addq	$2, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -8(%rbp)
	jmp	.L276
.L279:
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	testq	%rax, %rax
	jne	.L277
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC41, %edi
	movl	$0, %eax
	call	printf
	jmp	.L278
.L277:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC42, %edi
	movl	$0, %eax
	call	printf
.L278:
	movq	-8(%rbp), %rax
	movq	48(%rax), %rax
	movq	%rax, -8(%rbp)
.L276:
	cmpq	$0, -8(%rbp)
	jne	.L279
.L275:
	movl	$.LC43, %edi
	call	puts
	addl	$1, -12(%rbp)
.L273:
	cmpl	$27, -12(%rbp)
	jle	.L280
	movl	$.LC44, %edi
	movl	$0, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE46:
	.size	printDay, .-printDay
	.section	.rodata
.LC45:
	.string	" ---| Reservar espa\303\247o |---\n"
.LC46:
	.string	" Nome de utilizador: "
.LC47:
	.string	"\n Nome do espa\303\247o: "
	.align 8
.LC48:
	.string	"\033[31m Esta reserva coincide com a sua agenda.\n\n\033[0m"
	.align 8
.LC49:
	.string	" Ficar\303\241 a aguardar que alguns blocos fiquem disponiveis. Continuar? (Y/n) "
	.text
	.globl	prepareReservation
	.type	prepareReservation, @function
prepareReservation:
.LFB47:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movl	$4, %edi
	call	malloc
	movq	%rax, -72(%rbp)
	movl	$4, %edi
	call	malloc
	movq	%rax, -64(%rbp)
	movl	$4, %edi
	call	malloc
	movq	%rax, -56(%rbp)
	movl	$0, -112(%rbp)
	movl	$0, -108(%rbp)
	movl	$.LC45, %edi
	call	puts
	movl	$.LC46, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	call	nameInput
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	findOrCreateUser
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	je	.L281
	movl	$.LC47, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	call	nameInput
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	findOrCreateSpace
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L281
	movq	-56(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	dateInput
	movl	%eax, -104(%rbp)
	movq	-56(%rbp), %rax
	movl	(%rax), %ecx
	movq	-64(%rbp), %rax
	movl	(%rax), %edx
	movq	-72(%rbp), %rax
	movl	(%rax), %esi
	movq	-24(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rdi
	call	findOrCreateDate
	movq	%rax, -16(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	free
	cmpl	$1, -104(%rbp)
	jne	.L283
	movl	$0, %edi
	call	time
	movq	%rax, -80(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	localtime
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	$9, %eax
	jle	.L283
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	subl	$10, %eax
	addl	%eax, %eax
	movl	%eax, -108(%rbp)
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	$14, %eax
	jle	.L283
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	$44, %eax
	jg	.L285
	addl	$1, -108(%rbp)
	jmp	.L283
.L285:
	addl	$2, -108(%rbp)
.L283:
	movl	$0, %eax
	call	clear
	movl	-108(%rbp), %edx
	movq	-16(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	printDay
	movl	-104(%rbp), %edx
	leaq	-96(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	timeInput
	movl	-96(%rbp), %eax
	movl	%eax, -116(%rbp)
	jmp	.L286
.L289:
	movl	-116(%rbp), %ecx
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	checkReservation
	movl	%eax, -100(%rbp)
	cmpl	$1, -100(%rbp)
	jne	.L287
	movl	$0, %eax
	call	clear
	movl	$.LC48, %edi
	movl	$0, %eax
	call	printf
	jmp	.L281
.L287:
	cmpl	$2, -100(%rbp)
	jne	.L288
	movl	$1, -112(%rbp)
.L288:
	addl	$1, -116(%rbp)
.L286:
	movl	-92(%rbp), %eax
	cmpl	-116(%rbp), %eax
	jge	.L289
	cmpl	$0, -112(%rbp)
	je	.L290
	movl	$0, %eax
	call	stdinClear
	movl	$.LC49, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	call	ynInput
	testl	%eax, %eax
	je	.L281
.L290:
	movl	-96(%rbp), %eax
	movl	%eax, -116(%rbp)
	jmp	.L291
.L292:
	movl	-116(%rbp), %ecx
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-40(%rbp), %rax
	movl	$1, %r8d
	movq	%rax, %rdi
	call	makeReservation
	addl	$1, -116(%rbp)
.L291:
	movl	-92(%rbp), %eax
	cmpl	-116(%rbp), %eax
	jge	.L292
	movl	$1, %edi
	call	feedBack
.L281:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE47:
	.size	prepareReservation, .-prepareReservation
	.section	.rodata
	.align 8
.LC50:
	.string	" ---| Cancelar reserva ou pr\303\251-reserva |---\n"
	.align 8
.LC51:
	.string	"\033[31m O utilizador nao se encontra na base de dados.\n\n\033[0m"
	.align 8
.LC52:
	.string	"\033[31m O espa\303\247o n\303\243o se encontra na base de dados.\n\n\033[0m"
	.align 8
.LC53:
	.string	"\033[31m O espa\303\247o n\303\243o tem reservas para esse dia.\n\n\033[0m"
	.text
	.globl	cancelReservation
	.type	cancelReservation, @function
cancelReservation:
.LFB48:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	$4, %edi
	call	malloc
	movq	%rax, -72(%rbp)
	movl	$4, %edi
	call	malloc
	movq	%rax, -64(%rbp)
	movl	$4, %edi
	call	malloc
	movq	%rax, -56(%rbp)
	movl	$.LC50, %edi
	call	puts
	movl	$.LC46, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	call	nameInput
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	findUser
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L295
	movl	$0, %edi
	call	feedBack
	movl	$.LC51, %edi
	movl	$0, %eax
	call	printf
	jmp	.L294
.L295:
	movl	$.LC47, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	call	nameInput
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	findSpace
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L297
	movl	$0, %edi
	call	feedBack
	movl	$.LC52, %edi
	movl	$0, %eax
	call	printf
	jmp	.L294
.L297:
	movq	-56(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	dateInput
	movq	-56(%rbp), %rax
	movl	(%rax), %ecx
	movq	-64(%rbp), %rax
	movl	(%rax), %edx
	movq	-72(%rbp), %rax
	movl	(%rax), %esi
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	findDate
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L298
	movl	$0, %edi
	call	feedBack
	movl	$.LC53, %edi
	movl	$0, %eax
	call	printf
	jmp	.L294
.L298:
	movl	$10, %edi
	call	putchar
	movq	-16(%rbp), %rcx
	movq	-24(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	printDay
	leaq	-80(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	timeInput
	movl	-80(%rbp), %eax
	movl	%eax, -84(%rbp)
	jmp	.L299
.L301:
	movl	-84(%rbp), %edx
	movq	-16(%rbp), %rcx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	findReservation
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L300
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	deleteReservation
.L300:
	addl	$1, -84(%rbp)
.L299:
	movl	-76(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jge	.L301
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$1, %edi
	call	feedBack
.L294:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE48:
	.size	cancelReservation, .-cancelReservation
	.section	.rodata
	.align 8
.LC54:
	.string	" ---| Listar reservas e pr\303\251-reservas de um espa\303\247o |---\n"
.LC55:
	.string	" Nome do espa\303\247o: "
.LC56:
	.string	"\033[31m Data inv\303\241lida.\n\n\033[0m"
	.text
	.globl	printDayReservations
	.type	printDayReservations, @function
printDayReservations:
.LFB49:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	$.LC54, %edi
	call	puts
	movl	$.LC55, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	call	nameInput
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	findOrCreateSpace
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L303
	movl	$.LC18, %edi
	movl	$0, %eax
	call	printf
	leaq	-28(%rbp), %rcx
	leaq	-32(%rbp), %rdx
	leaq	-36(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC19, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	-28(%rbp), %edx
	movl	-32(%rbp), %ecx
	movl	-36(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	validDate
	testl	%eax, %eax
	jne	.L305
	movl	$0, %eax
	call	clear
	movl	$.LC56, %edi
	movl	$0, %eax
	call	printf
	jmp	.L303
.L305:
	movl	-28(%rbp), %ecx
	movl	-32(%rbp), %edx
	movl	-36(%rbp), %esi
	movq	-16(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	findOrCreateDate
	movq	%rax, -8(%rbp)
	movl	$10, %edi
	call	putchar
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	printDay
	movl	$0, %eax
	call	stdinClear
	call	getchar
	movl	$0, %eax
	call	clear
.L303:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE49:
	.size	printDayReservations, .-printDayReservations
	.section	.rodata
	.align 8
.LC57:
	.string	" ---| Listar \033[32mreservas\033[0m e \033[31mpr\303\251-reservas\033[0m de um utilizador |---\n"
	.align 8
.LC58:
	.string	"\033[31m O utilizador nao se encontra na base de dados. \n\n\033[0m"
	.align 8
.LC59:
	.string	" O utilizador nao tem reservas neste momento.\n\n "
.LC60:
	.string	"\n %d/%d/%d "
.LC61:
	.string	" -> "
.LC62:
	.string	"\033[31m"
.LC63:
	.string	" %d/%d/%d "
	.text
	.globl	printUserReservations
	.type	printUserReservations, @function
printUserReservations:
.LFB50:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	$.LC57, %edi
	call	puts
	movl	$.LC46, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	call	nameInput
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	findUser
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L308
	movl	$0, %eax
	call	clear
	movl	$.LC58, %edi
	movl	$0, %eax
	call	printf
	jmp	.L307
.L308:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L310
	movl	$0, %eax
	call	clear
	movl	$.LC59, %edi
	movl	$0, %eax
	call	printf
	jmp	.L307
.L310:
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -36(%rbp)
	movq	-24(%rbp), %rax
	movl	8(%rax), %ecx
	movq	-24(%rbp), %rax
	movl	4(%rax), %edx
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	movl	$.LC60, %edi
	movl	$0, %eax
	call	printf
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	printBlock
	movl	$45, %edi
	call	putchar
.L320:
	movq	-32(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	jne	.L311
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %edi
	call	printBlock
	movl	$.LC61, %edi
	movl	$0, %eax
	call	printf
	movq	-32(%rbp), %rax
	movq	56(%rax), %rax
	testq	%rax, %rax
	jne	.L312
	movl	$.LC39, %edi
	movl	$0, %eax
	call	printf
	jmp	.L313
.L312:
	movl	$.LC62, %edi
	movl	$0, %eax
	call	printf
.L313:
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC41, %edi
	movl	$0, %eax
	call	printf
	movl	$.LC43, %edi
	call	puts
	nop
	movl	$32, %edi
	call	putchar
	movl	$0, %edi
	call	feedBack
	jmp	.L307
.L311:
	movq	-32(%rbp), %rax
	movq	32(%rax), %rax
	movq	24(%rax), %rax
	cmpq	-24(%rbp), %rax
	jne	.L315
	movq	-32(%rbp), %rax
	movq	32(%rax), %rax
	movl	(%rax), %eax
	subl	-36(%rbp), %eax
	cmpl	$1, %eax
	jg	.L315
	movq	-32(%rbp), %rax
	movq	32(%rax), %rax
	movq	56(%rax), %rax
	testq	%rax, %rax
	jne	.L316
	movq	-32(%rbp), %rax
	movq	56(%rax), %rax
	testq	%rax, %rax
	jne	.L315
.L316:
	movq	-32(%rbp), %rax
	movq	32(%rax), %rax
	movq	56(%rax), %rax
	testq	%rax, %rax
	je	.L317
	movq	-32(%rbp), %rax
	movq	56(%rax), %rax
	testq	%rax, %rax
	jne	.L317
.L315:
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %edi
	call	printBlock
	movl	$.LC61, %edi
	movl	$0, %eax
	call	printf
	movq	-32(%rbp), %rax
	movq	56(%rax), %rax
	testq	%rax, %rax
	jne	.L318
	movl	$.LC39, %edi
	movl	$0, %eax
	call	printf
	jmp	.L319
.L318:
	movl	$.LC62, %edi
	movl	$0, %eax
	call	printf
.L319:
	movq	-32(%rbp), %rax
	movq	16(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	movl	$.LC41, %edi
	movl	$0, %eax
	call	printf
	movl	$.LC43, %edi
	call	puts
	movq	-32(%rbp), %rax
	movq	32(%rax), %rax
	movq	24(%rax), %rax
	movl	8(%rax), %ecx
	movq	-32(%rbp), %rax
	movq	32(%rax), %rax
	movq	24(%rax), %rax
	movl	4(%rax), %edx
	movq	-32(%rbp), %rax
	movq	32(%rax), %rax
	movq	24(%rax), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	movl	$.LC63, %edi
	movl	$0, %eax
	call	printf
	movq	-32(%rbp), %rax
	movq	32(%rax), %rax
	movl	(%rax), %eax
	movl	%eax, %edi
	call	printBlock
	movl	$45, %edi
	call	putchar
.L317:
	movq	-32(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -36(%rbp)
	jmp	.L320
.L307:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE50:
	.size	printUserReservations, .-printUserReservations
	.globl	empty_file
	.type	empty_file, @function
empty_file:
.LFB51:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc
	movb	%al, -1(%rbp)
	cmpb	$-1, -1(%rbp)
	je	.L322
	cmpb	$10, -1(%rbp)
	jne	.L323
.L322:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	rewind
	movl	$1, %eax
	jmp	.L324
.L323:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	rewind
	movl	$0, %eax
.L324:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE51:
	.size	empty_file, .-empty_file
	.section	.rodata
.LC64:
	.string	"mkdir data"
.LC65:
	.string	"mkdir data/spaces"
	.text
	.globl	check_files
	.type	check_files, @function
check_files:
.LFB52:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$.LC64, %edi
	call	system
	movl	$.LC65, %edi
	call	system
	movl	$.LC34, %esi
	movl	$.LC26, %edi
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L326
	movl	$.LC29, %esi
	movl	$.LC26, %edi
	call	fopen
	movq	%rax, -8(%rbp)
.L326:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	$.LC34, %esi
	movl	$.LC28, %edi
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L327
	movl	$.LC29, %esi
	movl	$.LC28, %edi
	call	fopen
	movq	%rax, -8(%rbp)
.L327:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE52:
	.size	check_files, .-check_files
	.section	.rodata
.LC66:
	.string	"%d%c%d%c%d"
	.text
	.globl	post_reservation
	.type	post_reservation, @function
post_reservation:
.LFB53:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$176, %rsp
	movq	%rdi, -136(%rbp)
	movq	%rsi, -144(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-48(%rbp), %rax
	movl	$1635017060, (%rax)
	movl	$1634759471, 4(%rax)
	movl	$796091747, 8(%rax)
	movb	$0, 12(%rax)
	movq	-144(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat
	leaq	-48(%rbp), %rax
	movq	$-1, -152(%rbp)
	movq	%rax, %rdx
	movl	$0, %eax
	movq	-152(%rbp), %rcx
	movq	%rdx, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	leaq	-1(%rax), %rdx
	leaq	-48(%rbp), %rax
	addq	%rdx, %rax
	movw	$47, (%rax)
	movq	-136(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat
	leaq	-48(%rbp), %rax
	movq	$-1, -152(%rbp)
	movq	%rax, %rdx
	movl	$0, %eax
	movq	-152(%rbp), %rcx
	movq	%rdx, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	leaq	-1(%rax), %rdx
	leaq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	$1954051118, (%rax)
	movb	$0, 4(%rax)
	leaq	-48(%rbp), %rax
	movl	$.LC34, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -112(%rbp)
	cmpq	$0, -112(%rbp)
	je	.L328
	movl	$0, -120(%rbp)
	movl	$0, -116(%rbp)
	movl	$30, %edi
	call	malloc
	movq	%rax, -104(%rbp)
	movl	$4, %edi
	call	malloc
	movq	%rax, -96(%rbp)
	movl	$4, %edi
	call	malloc
	movq	%rax, -88(%rbp)
	movl	$4, %edi
	call	malloc
	movq	%rax, -80(%rbp)
	leaq	-122(%rbp), %r8
	movq	-88(%rbp), %rdi
	leaq	-123(%rbp), %rcx
	movq	-96(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	-80(%rbp), %rsi
	movq	%rsi, (%rsp)
	movq	%r8, %r9
	movq	%rdi, %r8
	movl	$.LC66, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_sscanf
	movq	-144(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	findOrCreateSpace
	movq	%rax, -72(%rbp)
	movq	-80(%rbp), %rax
	movl	(%rax), %ecx
	movq	-88(%rbp), %rax
	movl	(%rax), %edx
	movq	-96(%rbp), %rax
	movl	(%rax), %esi
	movq	-72(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	findOrCreateDate
	movq	%rax, -64(%rbp)
.L337:
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc
	movb	%al, -121(%rbp)
	cmpb	$-1, -121(%rbp)
	je	.L341
.L330:
	cmpb	$44, -121(%rbp)
	je	.L332
	cmpb	$10, -121(%rbp)
	je	.L332
	cmpb	$-1, -121(%rbp)
	jne	.L333
.L332:
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	cmpq	$2, %rax
	jbe	.L334
	movq	-104(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	findOrCreateUser
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	je	.L334
	movl	-116(%rbp), %ecx
	movq	-64(%rbp), %rdx
	movq	-72(%rbp), %rsi
	movq	-56(%rbp), %rax
	movl	$0, %r8d
	movq	%rax, %rdi
	call	makeReservation
.L334:
	movq	-104(%rbp), %rax
	movl	$30, %esi
	movq	%rax, %rdi
	call	reset_buffer
	cmpb	$10, -121(%rbp)
	jne	.L335
	addl	$1, -116(%rbp)
.L335:
	movl	$0, -120(%rbp)
	jmp	.L337
.L333:
	movl	-120(%rbp), %eax
	movslq	%eax, %rdx
	movq	-104(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-121(%rbp), %eax
	movb	%al, (%rdx)
	addl	$1, -120(%rbp)
	jmp	.L337
.L341:
	nop
.L340:
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	free
.L328:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L339
	call	__stack_chk_fail
.L339:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE53:
	.size	post_reservation, .-post_reservation
	.globl	load_reservations
	.type	load_reservations, @function
load_reservations:
.LFB54:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -104(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-80(%rbp), %rax
	movl	$1635017060, (%rax)
	movl	$1634759471, 4(%rax)
	movl	$796091747, 8(%rax)
	movb	$0, 12(%rax)
	movq	-104(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat
	leaq	-80(%rbp), %rax
	movq	$-1, -112(%rbp)
	movq	%rax, %rdx
	movl	$0, %eax
	movq	-112(%rbp), %rcx
	movq	%rdx, %rdi
	repnz scasb
	movq	%rcx, %rax
	notq	%rax
	leaq	-1(%rax), %rdx
	leaq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	$1634296879, (%rax)
	movl	$2020879987, 4(%rax)
	movw	$116, 8(%rax)
	leaq	-80(%rbp), %rax
	movl	$.LC34, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	je	.L342
	leaq	-48(%rbp), %rax
	movl	$30, %esi
	movq	%rax, %rdi
	call	reset_buffer
.L346:
	movq	-88(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movl	$31, %esi
	movq	%rax, %rdi
	call	fgets
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	subq	$1, %rax
	movb	$0, -48(%rbp,%rax)
	movzbl	-48(%rbp), %eax
	testb	%al, %al
	je	.L350
.L344:
	movq	-104(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	post_reservation
	leaq	-48(%rbp), %rax
	movl	$30, %esi
	movq	%rax, %rdi
	call	reset_buffer
	jmp	.L346
.L350:
	nop
.L349:
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
.L342:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L348
	call	__stack_chk_fail
.L348:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE54:
	.size	load_reservations, .-load_reservations
	.section	.rodata
.LC67:
	.string	"users"
.LC68:
	.string	"spaces"
	.text
	.globl	load
	.type	load, @function
load:
.LFB55:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	$0, -20(%rbp)
	cmpq	$.LC67, -40(%rbp)
	jne	.L352
	movl	$.LC34, %esi
	movl	$.LC26, %edi
	call	fopen
	movq	%rax, -16(%rbp)
.L352:
	cmpq	$.LC68, -40(%rbp)
	jne	.L353
	movl	$.LC34, %esi
	movl	$.LC28, %edi
	call	fopen
	movq	%rax, -16(%rbp)
.L353:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	empty_file
	testl	%eax, %eax
	jne	.L364
.L354:
	movl	$30, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$30, %esi
	movq	%rax, %rdi
	call	reset_buffer
.L362:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc
	movb	%al, -21(%rbp)
	cmpb	$-1, -21(%rbp)
	je	.L365
.L356:
	cmpb	$10, -21(%rbp)
	jne	.L358
	cmpq	$.LC67, -40(%rbp)
	jne	.L359
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	newUser
.L359:
	cmpq	$.LC68, -40(%rbp)
	jne	.L360
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	create_spaceDir
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	newSpace
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	load_reservations
.L360:
	movq	-8(%rbp), %rax
	movl	$30, %esi
	movq	%rax, %rdi
	call	reset_buffer
	movl	$0, -20(%rbp)
	jmp	.L362
.L358:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-21(%rbp), %eax
	movb	%al, (%rdx)
	addl	$1, -20(%rbp)
	jmp	.L362
.L365:
	nop
.L363:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	jmp	.L351
.L364:
	nop
.L351:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE55:
	.size	load, .-load
	.globl	load_database
	.type	load_database, @function
load_database:
.LFB56:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, %eax
	call	check_files
	movl	$0, %eax
	call	clear
	movl	$.LC67, %edi
	call	load
	movl	$.LC68, %edi
	call	load
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE56:
	.size	load_database, .-load_database
	.section	.rodata
.LC69:
	.string	" ---| Menu principal |---\n"
	.align 8
.LC70:
	.string	" Introduza o n\303\272mero que corresponde \303\240 op\303\247\303\243o pretendida:"
.LC71:
	.string	" 1 - Reservar um espa\303\247o"
	.align 8
.LC72:
	.string	" 2 - Cancelar reserva ou pr\303\251-reserva"
	.align 8
.LC73:
	.string	" 3 - Listar reservas e pr\303\251-reservas de um espa\303\247o"
	.align 8
.LC74:
	.string	" 4 - Listar reservas e pr\303\251-reservas de um utilizador"
.LC75:
	.string	" 5 - Cr\303\251ditos"
.LC76:
	.string	" 9 - Sair\n\n -> "
.LC77:
	.string	"%d"
.LC78:
	.string	" Op\303\247\303\243o inv\303\241lida\n\n -> "
	.text
	.globl	main
	.type	main, @function
main:
.LFB57:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$6, -4(%rbp)
	movl	$0, %eax
	call	load_database
	movl	$0, %eax
	call	clear
	jmp	.L379
.L383:
	nop
.L379:
	movl	$0, -8(%rbp)
	movl	$.LC69, %edi
	call	puts
	movl	$.LC70, %edi
	call	puts
	movl	$.LC71, %edi
	call	puts
	movl	$.LC72, %edi
	call	puts
	movl	$.LC73, %edi
	call	puts
	movl	$.LC74, %edi
	call	puts
	movl	$.LC75, %edi
	call	puts
	movl	$.LC76, %edi
	movl	$0, %eax
	call	printf
.L371:
	leaq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC77, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	$0, %eax
	call	stdinClear
	movl	-8(%rbp), %eax
	testl	%eax, %eax
	jle	.L369
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jle	.L370
.L369:
	movl	-8(%rbp), %eax
	cmpl	$9, %eax
	je	.L370
	movl	$.LC78, %edi
	movl	$0, %eax
	call	printf
	jmp	.L371
.L370:
	movl	$0, %eax
	call	clear
	movl	-8(%rbp), %eax
	cmpl	$9, %eax
	je	.L382
.L372:
	movl	-8(%rbp), %eax
	cmpl	$1, %eax
	jne	.L374
	movl	$0, %eax
	call	prepareReservation
	jmp	.L383
.L374:
	movl	-8(%rbp), %eax
	cmpl	$2, %eax
	jne	.L376
	movl	$0, %eax
	call	cancelReservation
	jmp	.L383
.L376:
	movl	-8(%rbp), %eax
	cmpl	$3, %eax
	jne	.L377
	movl	$0, %eax
	call	printDayReservations
	jmp	.L383
.L377:
	movl	-8(%rbp), %eax
	cmpl	$4, %eax
	jne	.L378
	movl	$0, %eax
	call	printUserReservations
	jmp	.L383
.L378:
	movl	-8(%rbp), %eax
	cmpl	$5, %eax
	jne	.L383
	movl	$0, %eax
	call	credits
	jmp	.L383
.L382:
	nop
.L381:
	movl	$0, %eax
	call	clear
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE57:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.7.2-2ubuntu1) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
