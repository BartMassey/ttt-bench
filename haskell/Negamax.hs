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
import Data.IORef

import GameValue

negamax :: Int -> IOUArray (Int, Int) Int -> IO Int
negamax onMove board = do
  v0 <- gameValue onMove board
  if v0 /= -2
  then
      -- game is over
      return v0
  else do
    v <- newIORef (-1)
    forM_ [0..2] $ \r -> do
      forM_ [0..2] $ \c -> do
        cell <- readArray board (r, c)
        when (cell == 0) $ do
          writeArray board (r, c) onMove
          vn <- negamax (-onMove) board
          v' <- readIORef v
          when ((-vn) > v') $
              writeIORef v (-vn)
          writeArray board (r, c) 0
    readIORef v


testBoard :: IO (IOUArray (Int, Int) Int)
testBoard = newListArray ((0,0),(2,2)) [1,1,-1,-1,-1,1,1,1,0]
