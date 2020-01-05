#!/bin/bash

nasm -f elf64 -o $1.o $1.s 
ld -o $1.out $1.o
chmod 755 $1.out
