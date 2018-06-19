import math, sequtils

proc sum(n: int): float64 =
  n * (n + 1) / 2

proc squareOfSum*(n: int): float64 =
  pow(sum(n), 2)

proc sumOfSquares*(n: int): float64 =
  (1..n).mapIt(it * it).sum().toFloat

proc difference*(n: int): float64 =
  squareOfSum(n) - sumOfSquares(n)