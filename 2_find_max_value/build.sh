#!/bin/bash

set -ex

as maximum.s -o maximum.o
ld maximum.o -o maximum.out
