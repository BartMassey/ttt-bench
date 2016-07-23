% Perfect Tic-Tac-Toe player in Erlang
% Copyright © 2016 Bart Massey
% [This program is licensed under the "MIT License"]
% Please see the file COPYING in the source
% distribution of this software for license terms.

-module(ttt).
-on_load(main/0).

main() ->
    negamax:negamax(-1, board:new()).
