% Tic-Tac-Toe board in Erlang
% Copyright © 2016 Bart Massey
% [This program is licensed under the "MIT License"]
% Please see the file COPYING in the source
% distribution of this software for license terms.

-module(board).
-export([new/0, get/3, set/4]).
-compile([inline]).

init_rows(3, Board) ->
    Board;

init_rows(R, Board) ->
    Row = array:new([{fixed, true}, {size, 3}, {default, 0}]),
    Board1 = array:set(R, Row, Board),
    init_rows(R + 1, Board1).

new() ->
    Board = array:new([{fixed, true}, {size, 3}]),
    init_rows(0, Board).

get(R, C, Board) ->
    array:get(C, array:get(R, Board)).

set(R, C, V, Board) ->
    Row = array:get(R, Board),
    Row1 = array:set(C, V, Row),
    array:set(R, Row1, Board).
