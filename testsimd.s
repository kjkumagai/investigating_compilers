	.arch armv5t
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 4
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"testsimd.c"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	vmov.i32	q8, #0  @ v4si
	mov	r3, #1
.L2:
	add	r0, r3, #1
	add	r1, r3, #2
	add	r2, r3, #3
	stmib	sp, {r0, r1, r2}
	str	r3, [sp]
	vld1.64	{d18-d19}, [sp:64]
	add	r3, r3, #4
	cmp	r3, #101
	vadd.i32	q8, q8, q9
	bne	.L2
	vmov.32	r2, d16[1]
	vmov.32	r3, d16[0]
	add	r3, r2, r3
	vmov.32	r2, d17[0]
	add	r2, r2, r3
	vmov.32	r3, d17[1]
	ldr	r1, .L6
	add	r2, r3, r2
	mov	r0, #1
	bl	__printf_chk
	mov	r0, #0
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L7:
	.align	2
.L6:
	.word	.LC0
	.size	main, .-main
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"%d\012\000"
	.ident	"GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",%progbits
