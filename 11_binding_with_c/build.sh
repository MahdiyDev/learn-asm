#!/bin/bash

set -ex

# With dynamic lib
gcc -c add.s -m32
gcc -c main.c -m32
gcc -o main.out main.o add.o -m32

