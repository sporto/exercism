import math

proc digitForExponent(n: int, exponent: int): int =
  let tens = (10 ^ exponent).float
  fmod((n.float / tens).floor, 10.0).int

proc charForExponent(exponent: int): string =
  case exponent:
    of 0:
      "I"
    of 1:
      "X"
    of 2:
      "C"
    of 3:
      "M"
    else:
      ""

proc halfwayCharForExponent(exponent: int): string =
  case exponent:
    of 0:
      "V"
    of 1:
      "L"
    of 2:
      "D"
    else:
      ""

proc numeralFor(n: int, exponent: int): string =
  let i = charForExponent(exponent)
  let v = halfwayCharForExponent(exponent)
  let x = charForExponent(exponent + 1)

  case n:
    of 1:
      i
    of 2:
      i & i
    of 3:
      i & i & i
    of 4:
      i & v
    of 5:
      v
    of 6:
      v & i
    of 7:
      v & i & i
    of 8:
      v & i & i & i
    of 9:
      i & x
    else:
      ""

proc numeral*(n: int): string =
  result = ""
  var exponent = 6
  while exponent >= 0:
    let digit = digitForExponent(n, exponent)
    result &= numeralFor(digit, exponent)
    dec exponent
