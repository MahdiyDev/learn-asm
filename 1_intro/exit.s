# PURPOSE: Simple program that exits and returns a
#          status code back to the Linux kernel

# VARIABLES:
#          %eax holds the system call number
#          %ebx holds the return status

.extern ExitProcess

.section .data

.section .text
.globl _start

_start:    
    movl $12, %ecx      # move return value
    call ExitProcess    # the exit command
