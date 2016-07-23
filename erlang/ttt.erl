% Perfect Tic-Tac-Toe player in Erlang
% Copyright © 2016 Bart Massey
% [This program is licensed under the "MIT License"]
% Please see the file COPYING in the source
% distribution of this software for license terms.

-module(ttt).
-export([start/0, bench/1]).

start() ->
    GameValue = negamax:negamax(-1, board:new()),
    io:fwrite("~B~n", [GameValue]).

loop(0, GameValue) ->
    io:fwrite("~B~n", [GameValue]);

loop(N, GameValue) ->
    GameValue1 = negamax:negamax(-1, board:new()),
    loop(N - 1, max(GameValue, GameValue1)).

bench([RepString]) ->
    {Reps, ""} = string:to_integer(RepString),
    loop(Reps, -2).
