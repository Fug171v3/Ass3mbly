BITS 32

extern printf
extern scanf

section .data
	input: db "%d",0
	output: db "%d",10,0
	o1: db "%d",0
section .text
	global main

	main:
	push ebp
	mov ebp, esp
	sub esp, 0x10
	
	lea eax,[ebp-0x4]
	push eax
	push input
	call scanf

	mov eax,1
	mov ecx,1
		
	cmp dword[ebp-0x4],0
	je print0
	
	loop:
	mul ecx
	inc ecx
	cmp ecx,dword[ebp-0x4]
	jle loop
	
	factorial:
	
	push eax
	push output
	call printf
	
	leave
	ret
	
	print0:
	mov eax,1
	push eax
	push o1
	call printf
	
	leave
	ret
