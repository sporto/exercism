import sequtils, strutils, math

proc isArmstrongNumber*(n: int): bool =
  let str = intToStr(n)
  let size = toFloat(str.len)

  str.map(proc (digit: char): int =
    int(pow(parseFloat(digit & ""), size))
  ).sum() == n