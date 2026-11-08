+++
title = "Hello, World! in Assembly :p"
description = "A simple Hello World program in x86-64 Assembly on Linux"
date = "2026-11-06"
author = "airi"
tags = ["assembly", "coding", "low-level", "linux"]
categories = ["coding", "low-level"]
+++

Hiii, guys!!

Ermm, you know, I really like coding, tbh. So, maybe when I'm bored, I'll just write some simple code in Assembly here.

Today, I'm going to show you a simple Assembly program that prints "Hello, World!" to your terminal!

```asm
global _start

section .text
_start:
    ; 1. Prepare and execute sys_write (print to screen)
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, msglen
    syscall

    ; 2. Prepare and execute sys_exit (clean shutdown)
    mov rax, 60
    mov rdi, 0
    syscall

section .rodata
    msg: db "Hello, World!", 10
    msglen: equ $ - msg
```

Ermmm, how do we compile it?

First, you need to have **NASM** installed. As for the linker, I usually use **mold**, hehehehehe.

### How to compile?

First, save the code above as `hello.asm`.

Then, open your terminal and execute these commands:

```bash
nasm -f elf64 hello.asm -o hello.o
mold -o hello -e _start hello.o
```

And finally, run your program:

```bash
./hello
```

You should see this in your terminal:

```text
Hello, World!
```

Mwehehehe, congratulations! You just created your first little Assembly program!

### But what actually happened?

Let me explain a little bit.

- **NASM:** Converts our Assembly source code into machine code inside an ELF64 object file.
- **mold:** Takes the object file and links it into an executable program.
- **syscall:** Allows our program to request services directly from the Linux kernel.

One interesting thing is that we don't need libc for this example. We're communicating directly with the Linux kernel through system calls!

Anyway, that's all for today. Maybe I'll write something more interesting about Assembly or low-level programming next time.

Byeeee, guys! Love you all!! >_<
