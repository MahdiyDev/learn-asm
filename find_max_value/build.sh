#!/bin/bash

set -ex

# Replace this with mingw lib path
MINGW_LIB="C:\Program Files\mingw\mingw64\x86_64-w64-mingw32\lib"

as maximum.s -o maximum.o

if [ "$MINGW_LIB" = "" ]
then
# Linux
    ld maximum.o -o maximum
else
# Windows
    ld maximum.o -o maximum.exe -L "$MINGW_LIB" -lkernel32
fi
