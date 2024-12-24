#!/bin/bash

set -ex

# Replace this with mingw lib path
MINGW_LIB="C:\Program Files\mingw\mingw32\i686-w64-mingw32\lib"

as power.s -o power.o --32

ld power.o -o power.exe -L "$MINGW_LIB" -lkernel32 -mi386pe