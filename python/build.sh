#!/bin/sh
# Copyright © 2015 Bart Massey
# This code is made available under the "MIT
# License". Please see the file COPYING in this distribution
# for license details.

# Preload __pycache__
rm -rf __pycache__
python3 ttt.py 1 >/dev/null
pypy3 ttt.py 1 >/dev/null

# Compile Python code with Nuitka.
#rm -rf ttt.bin ttt-nuitka ttt.build
#nuitka3 --follow-imports --lto=yes --clang ttt.py && mv ttt.bin ttt-nuitka
