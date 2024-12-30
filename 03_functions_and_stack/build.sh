#!/bin/bash

set -ex

as power.s -o power.o --32
ld power.o -o power.out -melf_i386

as factorial.s -o factorial.o --32
ld factorial.o -o factorial.out -melf_i386
