module CollatzConjecture
  ( collatz
  ) where

import Prelude
import Data.Maybe

collatz n =
  if n > 0 then
    Just (collatz_ 0 n)
  else
    Nothing

collatz_ step n =
  if n == 1 then
    step
  else
    if n `mod` 2 == 0 then
      collatz_ (step + 1) (n / 2)
    else
      collatz_ (step + 1 ) (n * 3 + 1)
