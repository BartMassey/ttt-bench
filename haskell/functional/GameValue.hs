-- Copyright © 2015 Bart Massey
-- [This program is licensed under the "MIT License"]
-- Please see the file COPYING in the source
-- distribution of this software for license terms.

-- Perfect Tic-Tac-Toe game valuator in Haskell

-- Returns the value of the game to the
-- side on move if the game is over, or
-- -2 if the game is still in progress.

module GameValue
where

import qualified Data.Map as M
import Data.Map ((!))

cells :: [(Int, Int)]
cells = [(r, c) | r <- [0..2], c <- [0..2]]


check :: [a] -> (a -> Bool) -> Bool
check xs f = or $ map f xs

gameValue :: Int -> M.Map (Int, Int) Int -> Int
gameValue onMove board
    | checkSide (-1) = -onMove
    | checkSide 1 = onMove
    | checkBlanks = -2
    | otherwise = 0
    where
      checkBlanks =
          -- scan for blanks
          check cells $ (\p -> board ! p == 0)
      checkSide side =
          -- scan for diagonal
          sum [ 1 :: Int | d <- [0..2], board ! (d, d) == side] == 3 ||
          -- scan for opposite diagonal
          sum [ 1 :: Int | d <- [0..2], board ! (d, 2 - d) == side] == 3 ||
          -- scan for rows
          check [0..2] (\r -> 
              sum [ 1 :: Int | c <- [0..2], board ! (r, c) == side] == 3) ||
          -- scan for columns
          check [0..2] (\c -> 
              sum [ 1 :: Int | r <- [0..2], board ! (r, c) == side] == 3)
