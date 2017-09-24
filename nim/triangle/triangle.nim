type
  TriangleKind* = enum
    tkEquilateral,
    tkIsosceles,
    tkScalene,

proc isValid(a: float64, b: float64, c: float64): bool =
  let longestSide = a.max(b).max(c)
  let sumOfAll = a + b + c
  longestSide < sumOfAll - longestSide

proc kind*(a: float64, b: float64, c: float64): TriangleKind =
  if not isValid(a, b, c):
    raise newException(ValueError, "Invalid triangle")

  if a == b and a == c:
    tkEquilateral
  elif a == b or a == c or b == c:
    tkIsosceles
  else:
    tkScalene