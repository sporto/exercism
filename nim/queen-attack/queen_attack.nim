import sequtils

type
  Pos = tuple[rank: int, file: int]

proc isInside(a: Pos): bool =
  let (x, y) = a
  x >= 0 and x <= 7 and y >= 0 and y <= 7


proc validate(w: Pos, b: Pos) =
  if w == b:
    raise newException(ValueError, "Same position")

  if not isInside(w) or not isInside(b):
    raise newException(ValueError, "Invalid position")


proc canAttack*(w: Pos, b: Pos): bool =
  validate(w, b)

  let rank = w[0] == b[0]
  let file = w[1] == b[1]
  let diagonal = abs(w[0] - b[0]) == abs(w[1] - b[1])

  rank or file or diagonal


proc board*(w: Pos, b: Pos): seq[string] =
  validate(w, b)

  result = repeat("________", 8)
  result[w[0]][w[1]] = 'W'
  result[b[0]][b[1]] = 'B'
