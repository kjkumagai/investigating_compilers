	.arch armv5t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"findmax.c"
	.section	.rodata
	.align	2
.LC1:
	.ascii	"largest number is: %d\000"
	.align	2
.LC0:
	.word	4
	.word	5
	.word	3
	.word	43
	.word	22
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	ldr	r3, .L4
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, .L4+4
	sub	ip, fp, #28
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r3, [lr]
	str	r3, [ip]
	sub	r3, fp, #28
	mov	r1, #5
	mov	r0, r3
	bl	max
	mov	r3, r0
	mov	r1, r3
	ldr	r0, .L4+8
	bl	printf
	mov	r3, #0
	mov	r0, r3
	ldr	r3, .L4
	ldr	r2, [fp, #-8]
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L3
	bl	__stack_chk_fail
.L3:
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L5:
	.align	2
.L4:
	.word	__stack_chk_guard
	.word	.LC0
	.word	.LC1
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",%progbits
