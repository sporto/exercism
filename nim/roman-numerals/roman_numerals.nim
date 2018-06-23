import sequtils

proc nextNumeral(n: int): (int, string) =
  [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I"),
    (0, ""),
  ].filterIt(n >= it[0])[0]

proc numeral*(n: int): string =
  if n == 0: return ""
  let next = nextNumeral(n)
  next[1] & numeral(n - next[0])
