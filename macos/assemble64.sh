#!/bin/bash

nasm -f macho64 $1.s
ld -static -macosx_version_min 10.6 -o $1.out  $1.o
chmod 755 $1.out
