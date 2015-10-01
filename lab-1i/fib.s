	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}
	@to solve the side effect of mov r3, r4 & mov r4, r5
	mov r5, #1
	@initial F[0] & F[1]
	mov r4, #0
	mov r3, #1
while:
	@shift the values to proceed the fibonacci calculation
	mov r3, r4
	mov r4, r5
	@fibonacci calculation
	add r5, r4, r3
	@the counter of while
	sub r0, #1
	@if r0 > 1 do iterative calculation
	cmp r0, #1
	bgt while
	@if r0 <= 1  terminate the loop	
	@return r5 by r0
	mov r0, r5
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
