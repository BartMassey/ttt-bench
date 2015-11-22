-- Copyright © 2015 Bart Massey
-- [This program is licensed under the "MIT License"]
-- Please see the file COPYING in the source
-- distribution of this software for license terms.

-- Perfect Tic-Tac-Toe game valuator in Haskell

-- Returns the value of the game to the
-- side on move if the game is over, or
-- -2 if the game is still in progress.

module GameValue (gameValue)
where

import Data.Array.IArray
import Data.Array.Unboxed

import Result

gameValue :: Int -> UArray (Int, Int) Int -> IO Int
gameValue onmove board =
  -- scan for win
  return $ runResult $ do
    forR [-1, 1] $ \side -> do
      let v = side * onmove
      -- scan for diagonal
      ifR (sum [ 1 :: Int | d <- [0..2], board ! (d, d) == side] == 3) $
          result v
      -- scan for opposite diagonal
      ifR (sum [ 1 :: Int | d <- [0..2], board ! (d, 2 - d) == side] == 3) $
          result v
      -- scan for rows
      forR [0..2] $ \r ->
        ifR (sum [ 1 :: Int | c <- [0..2], board ! (r, c) == side] == 3) $
             result v
      -- scan for columns
      forR [0..2] $ \c ->
        ifR (sum [ 1 :: Int | r <- [0..2], board ! (r, c) == side] == 3) $
             result v
    -- scan for blanks
    forR [0..2] $ \r ->
      forR [0..2] $ \c ->
        ifR (board ! (r, c) == 0) $
             result (-2)
    result 0
