{-# LANGUAGE BangPatterns #-}
-- Copyright © 2015 Bart Massey
-- [This program is licensed under the "MIT License"]
-- Please see the file COPYING in the source
-- distribution of this software for license terms.

-- Perfect Tic-Tac-Toe player in Haskell

import Data.Map
import System.Environment

import Negamax
import GameValue (cells)

main :: IO ()
main = do
  [repStr] <- getArgs
  let _ = read repStr :: Int
  let board = fromAscList $ zip cells (repeat 0)
  print $ negamax 1 board
