	.arch armv5t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 1
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"findmax.c"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	sub	sp, sp, #24
	ldr	r4, .L4
	ldr	r3, [r4]
	str	r3, [sp, #20]
	mov	ip, sp
	ldr	lr, .L4+4
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r3, [lr]
	str	r3, [ip]
	mov	r1, #5
	mov	r0, sp
	bl	max
	mov	r2, r0
	ldr	r1, .L4+8
	mov	r0, #1
	bl	__printf_chk
	ldr	r2, [sp, #20]
	ldr	r3, [r4]
	cmp	r2, r3
	beq	.L2
	bl	__stack_chk_fail
.L2:
	mov	r0, #0
	add	sp, sp, #24
	@ sp needed
	pop	{r4, pc}
.L5:
	.align	2
.L4:
	.word	__stack_chk_guard
	.word	.LANCHOR0
	.word	.LC1
	.size	main, .-main
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.word	4
	.word	5
	.word	3
	.word	43
	.word	22
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"largest number is: %d\000"
	.ident	"GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",%progbits
