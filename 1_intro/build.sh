#!/bin/bash

set -ex

# Replace this with mingw lib path
MINGW_LIB="C:\Program Files\mingw\mingw64\x86_64-w64-mingw32\lib"

as exit.s -o exit.o

ld exit.o -o exit.exe -L "$MINGW_LIB" -lkernel32
