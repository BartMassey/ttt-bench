-- Copyright © 2015 Bart Massey
-- Provide a thin imperative veneer
-- using the Either monad

module Result (Result, result, runResult, forR, ifR, ifElseR)
where

type Result a = Either a a

result :: a -> Result a
result = Left

continueR :: Result a
continueR = Right undefined

runResult :: Result a -> a
runResult (Left x) = x
runResult (Right _) = error "runResult: no result"

forR :: [a] -> (a -> Result b) -> Result b
forR [] _ = continueR
forR [x] ax = ax x
forR (x : xs) ax =
    case ax x of
      Right _ -> forR xs ax
      y -> y

ifR :: Bool -> Result b -> Result b
ifR True a = a
ifR False _ = continueR

ifElseR :: Bool -> Result b -> Result b -> Result b
ifElseR True a _ = a
ifElseR False _ a = a
