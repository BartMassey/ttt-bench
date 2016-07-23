#!/bin/sh
# Copyright © 2016 Bart Massey
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source
# distribution of this software for license terms.

make clean
make CC="gcc -O4"
mv -f ttt ttt-gcc
make clean
make CC="clang -O3"
mv -f ttt ttt-clang
make clean
