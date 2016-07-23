-- Copyright © 2015 Bart Massey
-- [This program is licensed under the "MIT License"]
-- Please see the file COPYING in the source
-- distribution of this software for license terms.

-- Perfect Tic-Tac-Toe player in Haskell

import Control.Monad
import Data.Array.IO
import System.Environment

import Negamax

main :: IO ()
main = do
  [repStr] <- getArgs
  let reps = read repStr :: Int
  board <- newArray ((0, 0), (2, 2)) 0 :: IO (IOUArray (Int, Int) Int)
  replicateM_ (reps - 1) $ do
         _ <- negamax 1 board
         return ()
  result <- negamax 1 board
  print result
