; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit macOS only.
; To assemble and run:
;
;   nasm -f macho64 hello_world.asm
;	ld -macosx_version_min 10.7.0 -o hello_world hello_world.o
;	./hello_world
; ----------------------------------------------------------------------------------------
global start
section .text

start:
	mov		rax, 0x02000004
	mov		rdi, 0x01
	mov 	rsi, msg
	mov		rdx, 0x10
	syscall

	mov		rax, 0x02000001
	xor		rdi, rdi
	syscall

	section		.data

msg:
	db		"Hello Rust Lang", 10

