#!/bin/sh
# Copyright © 2016 Bart Massey
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source
# distribution of this software for license terms.

# Clean BEAM and HiPE versions of Erlang TTT

rm -rf *.beam
[ -d hipe ] && rm -rf hipe
[ -d beam ] && rm -rf beam
