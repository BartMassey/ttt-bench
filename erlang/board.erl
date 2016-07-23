% Tic-Tac-Toe board in Erlang
% Copyright © 2016 Bart Massey
% [This program is licensed under the "MIT License"]
% Please see the file COPYING in the source
% distribution of this software for license terms.

-module(board).
-export([new/0, get/3, set/4]).
-compile([inline]).

new() ->
    array:new([{size, 9}, {default, 0}, {fixed, true}]).
    
get(R, C, Board) ->
    array:get(3 * R + C, Board).

set(R, C, V, Board) ->
    array:set(3 * R + C, V, Board).
