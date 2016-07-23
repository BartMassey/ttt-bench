% Perfect Tic-Tac-Toe evaluator in Erlang
% Copyright © 2016 Bart Massey
% [This program is licensed under the "MIT License"]
% Please see the file COPYING in the source
% distribution of this software for license terms.

-module(gamevalue).
-export([gamevalue/2]).
-compile([inline]).

% Scan for diagonal.
has_diagonal(_, _, D) when D > 2 -> true;

has_diagonal(OnMove, Board, D) ->
    board:get(D, D, Board) == OnMove andalso
    has_diagonal(OnMove, Board, D + 1).
    
% Scan for opposite diagonal.
has_opposite_diagonal(_, _, D) when D > 2 -> true;

has_opposite_diagonal(OnMove, Board, D) ->
    board:get(D, 2 - D, Board) == OnMove andalso
    has_opposite_diagonal(OnMove, Board, D + 1).

% Check this row.
has_row(_, _, _, C) when C > 2 -> true;

has_row(OnMove, Board, R, C) ->
    board:get(R, C, Board) == OnMove andalso
    has_row(OnMove, Board, R, C + 1).

% Scan for rows.
has_some_row(_, _, R) when R > 2 ->
    false;

has_some_row(OnMove, Board, R) ->
    has_row(OnMove, Board, R, 0) orelse
    has_some_row(OnMove, Board, R + 1).

% Check this column.
has_col(_, _, R, _) when R > 2 -> true;

has_col(OnMove, Board, R, C) ->
    board:get(R, C, Board) == OnMove andalso
    has_col(OnMove, Board, R + 1, C).

% Scan for columns.
has_some_col(_, _, C) when C > 2 ->
    false;

has_some_col(OnMove, Board, C) ->
    has_col(OnMove, Board, 0, C) orelse
    has_some_col(OnMove, Board, C + 1).

% Succeeds if there is a win on the board for
% the side on move.
has_win(OnMove, Board) ->
    has_diagonal(OnMove, Board, 0) orelse
    has_opposite_diagonal(OnMove, Board, 0) orelse
    has_some_row(OnMove, Board, 0) orelse
    has_some_col(OnMove, Board, 0).

% Succeeds if there is a blank on the board.
has_move(_, R, _) when R > 2 ->
    false;

has_move(Board, R, C) when C > 2 ->
    has_move(Board, R + 1, 0);

has_move(Board, R, C) ->
    board:get(R, C, Board) == 0 orelse
    has_move(Board, R, C + 1).

% Returns the value of the game to the
% side on move if the game is over, or
% -2 if the game is still in progress.
gamevalue(OnMove, Board) ->
    % This is really gross. I don't see a better plan
    % in Erlang, though.
    case has_win(OnMove, Board) of
        true -> 1;
        false -> case has_win(-OnMove, Board) of true -> -1;
        false -> case has_move(Board, 0, 0) of true -> -2;
        false -> 0
    end end end.
