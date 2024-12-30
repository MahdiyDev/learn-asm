#!/bin/bash

set -ex

# Read record
as read-record.s -o read-record.o --32
as count-chars.s -o count-chars.o --32
as write-newline.s -o write-newline.o --32
as read-records.s -o read-records.o --32
as alloc.s -o alloc.o --32
ld alloc.o read-record.o count-chars.o \
   write-newline.o read-records.o -o read-records.out -melf_i386

