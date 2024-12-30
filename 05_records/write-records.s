.include "linux.s"
.include "record-def.s"

.section .data

# Constant data of the records we want to write
# Each text data item is padded to the proper
# length with null (i.e. 0) bytes

# .rept is used to pad each item. .rept tells
# the assembler to repeat the section between
# .rept and .endr the number of items specified.
# This is used in this program to add extra null
# characters at the end of each field to fill
# it up
record1:
    .ascii "Fredrick\0"
    .rept 31 # padding to 40 bytes
    .byte 0
    .endr

    .ascii "Bartlett\0"
    .rept 31 # padding to 40 bytes
    .byte 0
    .endr
    
    .ascii "4242 S Prairie, Tulsa\0"
    .rept 209 # padding to 240 bytes
    .byte 0
    .endr

    .long 45

record2:
    .ascii "Marilyn\0"
    .rept 31 # padding to 40 bytes
    .byte 0
    .endr

    .ascii "Taylor\0"
    .rept 31 # padding to 40 bytes
    .byte 0
    .endr
    
    .ascii "2224 S Johannan St, Chicago\0"
    .rept 203 # padding to 240 bytes
    .byte 0
    .endr

    .long 47

file_name:
    .ascii "test.dat\0"

.equ ST_FILE_DESCRIPTOR, -4
.globl _start
_start:
    # Copy the stack pointer to %ebp
    movl  %esp, %ebp
    # Allocate space to hold the file descriptor
    subl  $4, %esp

    # Open the file
    movl  $SYS_OPEN, %eax
    movl  $file_name, %ebx
    movl  $0101, %ecx    # This says to create if it
                        # doesn't exist, and open for
                        # writing
    movl  $0666, %edx
    int   $LINUX_SYSCALL

    # Store the file descriptor away
    movl  %eax, ST_FILE_DESCRIPTOR(%ebp)

    # Write the first record
    pushl ST_FILE_DESCRIPTOR(%ebp)
    pushl $record1
    call  write_record
    addl  $8, %esp

    # Write the second record
    pushl ST_FILE_DESCRIPTOR(%ebp)
    pushl $record2
    call  write_record
    addl  $8, %esp

    # Close the file descriptor
    movl  $SYS_EXIT, %eax
    movl  $0, %ebx
    int   $LINUX_SYSCALL


