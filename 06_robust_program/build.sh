#!/bin/bash

set -ex

# Read record
as read-record.s -o read-record.o --32
as count-chars.s -o count-chars.o --32
as write-record.s -o write-record.o --32
as write-newline.s -o write-newline.o --32
as linux.s -o linux.o --32
as error-exit.s -o error-exit.o --32

# Modify record
as add-year.s -o add-year.o --32
ld add-year.o read-record.o linux.o count-chars.o \
   write-newline.o write-record.o error-exit.o \
   -o add-year.out -melf_i386
