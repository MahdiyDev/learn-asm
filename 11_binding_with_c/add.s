# PURPOSE:  add two integer and return the result
#
# OUTPUT:   the result stores in %eax
#
.equ ST_A, 8
.equ ST_B, 12

.globl add
.type add, @function
add:
    pushl %ebp
    movl  %esp, %ebp

    movl  ST_A(%ebp), %eax
    addl  ST_B(%ebp), %eax

    movl  %ebp, %esp
    popl  %ebp
    ret

