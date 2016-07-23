% Tic-Tac-Toe board in Erlang
% Copyright © 2016 Bart Massey
% [This program is licensed under the "MIT License"]
% Please see the file COPYING in the source
% distribution of this software for license terms.

-module(board).
-export([new/0, get/3, set/4]).
-compile([inline]).

% Initialize a row of the board.
init_row(C, Row) when C > 2 ->
    Row;

init_row(C, Row) ->
    Row1 = array:set(C, 0, Row),
    init_row(C + 1, Row1).

% Create and initialize the rows of the board.
build_board(R, Board) when R > 2 ->
    Board;

build_board(R, Board) ->
    Row = array:new(3),
    Row1 = init_row(0, Row),
    Board1 = array:set(R, Row1, Board),
    build_board(R + 1, Board1).

new() ->
    Board = array:new(3),
    build_board(0, Board).
    
get(R, C, Board) ->
    array:get(C, array:get(R, Board)).

set(R, C, V, Board) ->
    Row = array:get(R, Board),
    Row1 = array:set(C, V, Row),
    array:set(R, Row1, Board).
