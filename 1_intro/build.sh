#!/bin/bash

set -ex

as exit.s -o exit.o
ld exit.o -o exit.out
