% Perfect Tic-Tac-Toe player in Erlang
% Copyright © 2016 Bart Massey
% [This program is licensed under the "MIT License"]
% Please see the file COPYING in the source
% distribution of this software for license terms.

% Pseudocode:

% To calculate the negamax value of a position s:
%    If s is a final state (game over)
%        return the value of s to the side on move
%    v <- -1
%    for each legal move m in s
%       s' <- m(s)
%       v' <- -negamax(s')
%       if v' > v
%           v <- v'
%    return v

-module(negamax).
-export([negamax/2]).
-compile([inline]).

best_child(_, _, R, _) when R > 2 ->
    -2;

best_child(OnMove, Board, R, C) when C > 2 ->
    best_child(OnMove, Board, R + 1, 0);

best_child(OnMove, Board, R, C) ->
    case board:get(R, C, Board) of
        0 -> 
            MoveBoard = board:set(R, C, OnMove, Board),
            NV = -negamax(-OnMove, MoveBoard),
            MV = best_child(OnMove, Board, R, C + 1),
            max(NV, MV);
        _ -> best_child(OnMove, Board, R, C + 1)
    end.    

negamax(OnMove, Board) ->
    case gamevalue:gamevalue(OnMove, Board) of
        -2 -> best_child(OnMove, Board, 0, 0);
        GameValue -> GameValue
    end.
