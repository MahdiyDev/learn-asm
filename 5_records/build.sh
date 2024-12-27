#!/bin/bash

set -ex

# Write record
as write-record.s -o write-record.o --32
as write-records.s -o write-records.o --32
ld write-record.o write-records.o -o write-records.out -melf_i386


# Read record
as read-record.s -o read-record.o --32
as count-chars.s -o count-chars.o --32
as write-newline.s -o write-newline.o --32
as read-records.s -o read-records.o --32
ld read-record.o count-chars.o \
   write-newline.o read-records.o -o read-records.out -melf_i386

# Modify record
as add-year.s -o add-year.o --32
ld add-year.o read-record.o \
   write-record.o -o add-year.out -melf_i386
