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

gameValue :: Int -> M.Map (Int, Int) Int -> Int
gameValue onMove board
    | checkSide (-1) = -onMove
    | checkSide 1 = onMove
    | checkBlanks = -2
    | otherwise = 0
    where
      checkSide side = or [
          -- scan for diagonal
          has3 [ (d, d) | d <- [0..2] ],
          -- scan for opposite diagonal
          has3 [ (d, 2 - d) | d <- [0..2] ],
          -- scan for rows
          any (\r -> has3 [ (r, c) | c <- [0..2] ]) [0..2],
          -- scan for columns
          any (\c -> has3 [ (r, c) | r <- [0..2] ]) [0..2] ]
          where
            has3 ps = all (\p -> board ! p == side) ps
      checkBlanks =
          -- scan for blanks
          any (\p -> board ! p == 0) cells
