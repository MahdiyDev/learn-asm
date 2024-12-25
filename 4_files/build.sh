#!/bin/bash

set -ex

# Replace this with mingw lib path
MINGW_PATH="C:\Program Files\mingw\mingw32\bin"

as read.s -o read.o --32

# ld read.o -o read.exe -L "$MINGW_LIB" -lkernel32
"$MINGW_PATH\gcc" read.o -o read.exe -m32
