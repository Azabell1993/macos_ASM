; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit macOS only.
; To assemble and run:
;
;   nasm -f macho64 hello_world.asm
;	ld -macosx_version_min 10.7.0 -o hello_world hello_world.o
;	./hello_world
; ----------------------------------------------------------------------------------------
section .data
	userMsg db 	'Input the number : '
	lenUserMsg equ $-userMsg
	dispMsg db	'Output : '
	lenDispMsg equ $-dispMsg	;equ : (symbol)

section .bss
	num resb 10				;reserve byte

section .text
	global start

start:
	mov rax, 4				;system call number.. 4:sys_write
	mov rbx, 1				;file desriptor (stdout 1)
	mov rcx, userMsg		;'Input the number : '
	mov rdx, lenUserMsg		;message length
	syscall				;system call

	;Read on store the user input
	mov rax, 3				;system call number.. 3: sys_read
	mov rbx, 2				;file desriptor (stderr 2)
	mov rcx, num			;message to write
	mov rdx, 10 			;input 10 byte
	syscall				;system call

	;Output the message
	mov rax, 4				;system call number.. 4:sys_write
	mov rbx, 1				;file desriptor (stdout 1)
	mov rcx, dispMsg		;'Output : '
	mov rdx, lenDispMsg		;message length
	syscall				;system call

	;Output the number entered
	mov rax, 4				;sys_write
	mov rbx, 1				;stdout
	mov rcx, num			;message to write
	mov rdx ,10				;output 10 byte
	syscall				;system call
	
	;exit
	mov rax, 1				;call kernel
	mov rbx, 0				;system call number (sys_out)
	syscall				;system call

