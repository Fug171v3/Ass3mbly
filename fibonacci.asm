
BITS 32

extern printf
extern scanf

section .data
	input: db "%d", 0
	output: db "%d",10,0
	ou0: db "wrong input",10,0

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

	mov ecx,0                          
	mov ebx,1
	mov eax,1
	mov edx,4

	cmp dword[ebp-0x4],0
	je o
	
	cmp dword[ebp-0x4],1
        je o0
	
	cmp dword[ebp-0x4],3
        jle o1

	loop:
	mov ecx,eax
	add eax,ebx
	mov ebx,ecx
	inc edx
	cmp edx,dword[ebp-0x4]
	jle loop
	
	
	push eax
	push output
	call printf
	
	leave
	
	ret	
	
	o0:
	mov eax,0
	push eax
	push output
	call printf

	leave
	ret

	o1:
	mov eax,1
	push eax
	push output
	call printf

	leave
	ret

	o:
	push ou0
	call printf
	
	leave
	ret
