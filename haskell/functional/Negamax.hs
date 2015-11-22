-- Copyright © 2015 Bart Massey
-- [This program is licensed under the "MIT License"]
-- Please see the file COPYING in the source
-- distribution of this software for license terms.

-- Perfect Tic-Tac-Toe negamax in Haskell

{-
  Pseudocode:

  To calculate the negamax value of a position s:
     If s is a final state (game over)
         return the value of s to the side on move
     v <- -1
     for each legal move m in s
        s' <- m(s)
        v' <- -negamax(s')
        if v' > v
            v <- v'
     return v
-}

module Negamax
where

import qualified Data.Map as M
import Data.Map ((!))

import GameValue

negamax :: Int -> M.Map (Int, Int) Int -> Int
negamax onMove board
    | v0 == -2 = foldr updateValue (-1) cells
    | otherwise = v0
    where
      updateValue pos v =
          case board ! pos of
            0 ->
                let vn = -(negamax (-onMove) (M.insert pos onMove board)) in
                if vn > v then vn else v
            _ ->
                v
      v0 = gameValue onMove board
