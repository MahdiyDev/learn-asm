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
    .quad 3, 67, 34, 222, 32, 100, 11, 23, 54, 0

.section .text

.globl _start

_start:
    leaq data_items(%rip), %rdi  # load the address of data_items into %rdi 
    movq (%rdi), %rax            # move 0 into the index register    
    movq %rax, %rbx              # since this is the first item, %rax is
                                 # the biggest

start_loop:
    cmpq $0, %rax                # check to see if we've hit the end
    je   loop_exit               # jump if equal to zero
    addq $8, %rdi                # move to the next element (each element is 8 bytes)
    movq (%rdi), %rax            # load next item
    cmpq %rbx, %rax              # compare values
    jle  start_loop              # jump to loop begging if the new
                                 # one isn't bigger

    movq %rax, %rbx              # move the value as the largest
    jmp  start_loop

loop_exit:
    movq %rbx, %rcx              # return value
    call ExitProcess             # the exit command
