#!/bin/bash

set -ex

# No lib
as linux.s -o linux.o --32
as helloworld-nolib.s -o helloworld-nolib.o --32

ld helloworld-nolib.o linux.o -o helloworld-nolib.out -melf_i386

# With dynamic lib
as helloworld-lib.s -o helloworld-lib.o --32
as printf-example.s -o printf-example.o --32

ld -dynamic-linker /lib/ld-linux.so.2 helloworld-lib.o -o helloworld-lib.out -L/usr/lib32 -melf_i386 -lc
ld -dynamic-linker /lib/ld-linux.so.2 printf-example.o -o printf-example.out -L/usr/lib32 -melf_i386 -lc

