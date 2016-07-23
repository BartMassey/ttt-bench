# Copyright © 2016 Bart Massey
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source
# distribution of this software for license terms.

# Makefile for Erlang TTT

.SUFFIXES: .erl .beam

.erl.beam:
	erlc +native $*.erl

ttt.depends: ttt.beam negamax.beam gamevalue.beam board.beam
	@touch ttt.depends

clean:
	-rm -f *.beam
