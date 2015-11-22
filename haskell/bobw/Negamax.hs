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

import Control.Monad
import Data.Array.IO
import Data.Array.Unboxed

import GameValue

negamax :: Int -> IOUArray (Int, Int) Int -> IO Int
negamax onMove board = do
  v0 <- do
    board' <- freeze board :: IO (UArray (Int, Int) Int)
    return $ gameValue onMove board'
  case v0 of
    -2 -> foldM updateValue (-1) cells
    _ -> return v0   -- game is over
      
  where
    updateValue v (r, c) = do
      cell <- readArray board (r, c)
      if cell /= 0
        then return v
        else do
          writeArray board (r, c) onMove
          vn <- negamax (-onMove) board
          writeArray board (r, c) 0
          if (-vn) > v
            then return (-vn)
            else return v
