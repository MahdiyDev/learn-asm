#!/bin/bash

set -ex

# Write record
as write-record.s -o write-record.o --32
as read-record.s -o read-record.o --32

ld -shared write-record.o read-record.o -o librecord.so -melf_i386

as write-records.s -o write-records.o --32
ld -L . -dynamic-linker /lib/ld-linux.so.2 write-records.o \
   -o write-records.out -lrecord -melf_i386

