module Leap where

import Prelude

isDivisibleBy divisor n =
  n `mod` divisor == 0

isLeapYear year =
  if isDivisibleBy 4 year then
    if isDivisibleBy 100 year then
      isDivisibleBy 400 year
    else
      true
  else
    false