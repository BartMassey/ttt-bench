-- Copyright © 2015 Bart Massey
-- [This program is licensed under the "MIT License"]
-- Please see the file COPYING in the source
-- distribution of this software for license terms.

-- Perfect Tic-Tac-Toe player in Haskell

import Data.Array.IO

import Negamax

main :: IO ()
main = do
  board <- newArray ((0, 0), (2, 2)) 0 :: IO (IOUArray (Int, Int) Int)
  result <- negamax 1 board
  print result
