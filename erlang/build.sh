#!/bin/sh
# Copyright © 2016 Bart Massey
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source
# distribution of this software for license terms.

# Build BEAM and HiPE versions of Erlang TTT

[ -d hipe ] || mkdir hipe
rm -rf *.beam
erl -make
mv *.beam hipe/

[ -d beam ] || mkdir beam
rm -rf *.beam
erl -make +native +o3
mv *.beam beam/
