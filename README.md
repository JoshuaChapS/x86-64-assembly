# x86-64 Assembly

Small programs I write by hand while learning x86-64 assembly on Linux.

The rules I'm following: Intel syntax, assembled with NASM (the Netwide Assembler), linked with `ld`, and no C library. Every program talks to the Linux kernel directly through the `syscall` instruction.

## Programs

- `class1.asm` - exits with a status code. The smallest program Linux will run: an entry point and the exit syscall.
- `class2.asm` - prints "Hello, World". Uses the write syscall and lets the assembler compute the string's length (`$ - message`) instead of hardcoding it.
- `class3.asm` - prints a row of stars with a counted loop. The check runs at the top of the loop, so a count of zero prints an empty line instead of looping forever.
- `class4.asm` - reads what the user types and prints it back. Uses the read syscall into a 64-byte buffer and writes back only the bytes actually read.
- `class5.asm` - prints two different strings by calling one `print` routine twice, using `call`/`ret`.
- `class6.asm` - same as class5, but finds its strings with RIP-relative addressing (`lea reg, [rel label]`) instead of hardcoded addresses, so it would still work if loaded somewhere else in memory (e.g. with ASLR/PIE). Confirmed with `objdump -Mintel -d`.

## Building

Tested on Kali Linux, x86-64.

    nasm -felf64 classn.asm && ld classn.o -o classn && ./classn

Check the exit status with `echo $?`.

## Background

I've written AVR assembly before, for an ATmega2560 robot, and I've read a lot of x86-64 while solving capture-the-flag challenges (buffer overflows, return-oriented programming). This repo goes the other direction: writing it from scratch.