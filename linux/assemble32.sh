#!/bin/bash

nasm -f elf -o $1.o $1.s
ld -melf_i386 -o $1.out $1.o
chmod 755 $1.out
