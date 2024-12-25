# PURPOSE: This program finds the maximum number of a
#          set of data items

# VARIABLES: The registers have the following uses:
#
# %rdi - Holds the index of the data item being examined
# %rbx - Largest data item found
# %rax - Current data item
#
# The following memory locations are used:
#
# data_items - contains the item data. A 0 is used
#              to terminate the data

.extern ExitProcess

.section .data

data_items:                      # These are the data items
    .long 3, 67, 34, 222, 32, 100, 11, 23, 54, 0

.section .text

.globl _start

_start:
    movl $0, %edi                   # move 0 into the index register
    movl data_items(,%edi, 4), %eax # load the the first byte of data
    movl %eax, %ebx                 # since this is the first item, %rax is
                                    # the biggest

start_loop:
    cmpl $0, %eax                   # check to see if we've hit the end
    je   loop_exit                  # jump if equal to zero
    incl %edi                       # increment index
    movl data_items(,%edi, 4), %eax # load next item
    cmpl %ebx, %eax                 # compare values
    jle  start_loop                 # jump to loop begging if the new
                                    # one isn't bigger

    movl %eax, %ebx                 # move the value as the largest
    jmp  start_loop

loop_exit:
    movl $1, %eax                   # 1 is exit() syscall
    int  $0x80
