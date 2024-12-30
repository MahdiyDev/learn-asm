#!/bin/bash

set -ex

# Read record
as integer-to-string.s -o integer-to-string.o --32
as count-chars.s -o count-chars.o --32
as write-newline.s -o write-newline.o --32
as conversion-program.s -o conversion-program.o --32
ld integer-to-string.o count-chars.o \
   write-newline.o conversion-program.o -o conversion-program.out -melf_i386

