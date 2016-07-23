#!/bin/sh
# Copyright © 2016 Bart Massey
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source
# distribution of this software for license terms.

# Build bytecode and HiPE versions of Erlang TTT

[ -d hipe ] || mkdir hipe
make clean
make ERLFLAGS="+native"
mv *.beam hipe/

[ -d bytecode ] || mkdir bytecode
make clean
make ERLFLAGS=""
mv *.beam bytecode/

make clean
