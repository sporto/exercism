import sequtils, strutils, math

proc isArmstrongNumber*(n: int): bool =
  let str = intToStr(n)
  let size = toFloat(str.len)

  str.map(proc (digit: char): int =
    (digit & "")
      .parseFloat
      .pow(size)
      .int
  ).sum() == n