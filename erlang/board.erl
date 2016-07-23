% Tic-Tac-Toe board in Erlang
% Copyright © 2016 Bart Massey
% [This program is licensed under the "MIT License"]
% Please see the file COPYING in the source
% distribution of this software for license terms.

-module(board).
-export([new/0, get/3, set/4]).

% Initialize a row of the board.
init_row(C, Row) when C < 3 ->
    array:set(C, 0, Row).

% Create and initialize the rows of the board.
build_board(R, Board) when R < 3 ->
    Row = array:new(3),
    init_row(0, Row),
    array:set(R, Row, Board),
    build_board(R + 1, Board).

new() ->
    Board = array:new(3),
    build_board(0, Board),
    Board.
    
get(R, C, Board) ->
    array:get(C, array:get(R, Board)).

set(R, C, Board, V) ->
    Row = array:get(R, Board),
    Row1 = array:set(C, V, Row),
    array:set(R, Row1, Board).
