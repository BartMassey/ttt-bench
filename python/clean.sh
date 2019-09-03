#!/bin/sh
# Copyright © 2015 Bart Massey
# This code is made available under the "MIT
# License". Please see the file COPYING in this distribution
# for license details.

# Clean __pycache__
rm -rf __pycache__

# Clean Nuitka.
rm -rf ttt.bin ttt-nuitka ttt.build
