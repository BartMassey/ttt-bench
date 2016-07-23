% Perfect Tic-Tac-Toe unit tests in Erlang
% Copyright © 2016 Bart Massey
% [This program is licensed under the "MIT License"]
% Please see the file COPYING in the source
% distribution of this software for license terms.

-module(test).
-export([start/0, read_posn/1]).

% https://erlangcentral.org/wiki/index.php?title=Reading_Lines_from_a_File

% Read a TTT position test from a file.
read_posn(Filename) ->
    {ok, F} = file:open(Filename, read),
    Board = board:new(),
    Board1 = read_rows(F, Board, 0),
    {ok, [Value]} = io:fread(F, "", "~d"),
    file:close(F),
    {Board1, Value}.

% Read rows from a file.
read_rows(_, Board, R) when R > 2 ->
    Board;

read_rows(F, Board, R) ->
    Row = io:get_line(F, ""),
    Board1 = read_row(F, Board, R, 0, Row),
    read_rows(F, Board1, R + 1).

% Read a row from a file.
read_row(_, Board, _, _, []) ->
    Board;

read_row(F, Board, R, C, [Ch | Chs]) ->
    Board1 = case Ch of
                 $X -> board:set(R, C, 1, Board);
                 $x -> board:set(R, C, 1, Board);
                 $O -> board:set(R, C, -1, Board);
                 $o -> board:set(R, C, -1, Board);
                 $. -> Board;
                 $\n -> Board;
                 $\r -> Board;
                 $\  -> Board;
                 $\t -> Board
             end,
    read_row(F, Board1, R, C + 1, Chs).

start() -> true.
