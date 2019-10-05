BITS 32

extern printf
extern scanf

section .data
input: db "%d",0
out2: db "prime",10,0
output:	db "not prime",10,0

section .text
	global main
	
	main:
	push ebp
	mov ebp, esp
	sub esp, 0x10 

	lea eax, [ebp-0x4]
	push eax
	push input 
	call scanf

	mov ecx,2
	
	cmp dword[ebp-0x4],1
	je nprime
	
	cmp dword[ebp-0x4],2
	je prime

	loop:
	mov edx, 0
	mov eax,dword[ebp-0x4] 
	div ecx
        inc ecx
	cmp edx, 0
	je nprime
	cmp ecx,dword[ebp-0x4]
	jl loop
	
	prime:
	push out2
	call printf

	leave
	ret 

	nprime:
	push output
	call printf

	leave 
	ret
