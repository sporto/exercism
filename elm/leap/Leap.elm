module Leap (..) where


isLeapYear year =
  if (isDivisibleBy4 year) then
    if (isDivisibleBy100 year) then
      isDivisibleBy400 year
    else
      True
  else
    False


isDivisibleBy4 =
  isDivisibleBy 4


isDivisibleBy100 =
  isDivisibleBy 100


isDivisibleBy400 =
  isDivisibleBy 400


isDivisibleBy divisor n =
  n `rem` divisor == 0
