#!/bin/bash

set -ex

as read.s -o read.o --32
ld read.o -o read.out -melf_i386
