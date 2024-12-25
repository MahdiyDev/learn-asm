# PURPOSE: This program converts an input file
#          to an output file with all letters
#          converted to uppercase.
#
# PROCESSING: 1) Open the input file
#             2) Open the output file
#             3) While we're not at the end of the input file
#                a) read part of file into our memory buffer
#                b) go through each byte of memory
#                   - if the byte is lower-case letter
#                     convert it to uppercase
#                c) write the memory buffer to output file
.extern _open
.extern _read

.section .data

#######CONSTANTS#######

# system call numbers

# options for open (look at fcntl.h for various values.
# You can combine them by adding them or ORing them)
.equ O_RDONLY, 0x0000
.equ O_CREAT,  0x0100

# standard file discriptors
.equ STDIN, 0
.equ STDOUT, 1
.equ STDERR, 2


in_file_name:
    .ascii "test.c\0"
out_file_name:
    .ascii "test.c.out\0"

.section .bss
# Buffer - this is where the data is loaded into
#          from the data file and written from
#          into the output file. This should
#          never exceed 16,000 for various
#          reasons.
.equ BUFFER_SIZE, 500
.lcomm BUFFER_DATA, BUFFER_SIZE

.section .text

# STACK POSITIONS
.equ ST_FD_IN, -4
.equ ST_FD_OUT, -8

.globl _main
_main:
    pushl %ebp                  # save old base pointer
    movl  %esp, %ebp            # make stack pointer the base pointer

open_files:
open_fd_in:
    pushl $O_RDONLY             # push the second value
    movl  $in_file_name, (%esp) # push the first value
    call  _open
    addl  $4, %esp              # move the stack pointer back

store_fd_in:
    mov   %eax, ST_FD_IN(%ebp)

open_fd_out:
    pushl $O_CREAT               # push the second value
    movl  $out_file_name, (%esp) # push the first value
    call  _open
    addl  $4, %esp               # move the stack pointer back

store_fd_out:
    mov   %eax, ST_FD_OUT(%ebp)

### BEGIN MAIN LOOP###
read_loop_begin:
    movl  ST_FD_IN(%ebp), %ebx
    movl  $BUFFER_DATA,   %ecx
    movl  $BUFFER_SIZE,   %edx
    call  _read

    movl  $BUFFER_DATA, (%esp)
    call  _puts

    movl  %ebp, %esp             # restore the stack pointer
    popl  %ebp                   # restore the base pointer

    movl  $0, %eax
    ret
