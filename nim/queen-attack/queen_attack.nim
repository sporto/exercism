import sequtils

type
  Pos = tuple[rank: int, file: int]

proc isValidPos(a: Pos): bool =
  a[0] >= 0 and a[0] <= 7 and a[1] >= 0 and a[1] <= 7

proc validate(w: Pos, b: Pos) =
  if w == b:
    raise newException(ValueError, "Same position")
  
  if not isValidPos(w) or not isValidPos(b):
    raise newException(ValueError, "Invalid position")


proc canAttack*(w: Pos, b: Pos): bool =
  validate(w, b)

  if w[0] == b[0]:
    return true

  if w[1] == b[1]:
    return true

  if abs(w[0] - b[0]) == abs(w[1] - b[1]):
    return true

  false

proc charFor(w: Pos, b: Pos, current: Pos): char =
  if w == current:
    'W'
  elif b == current:
    'B'
  else:
    '_' 

proc board*(w: Pos, b: Pos): seq[string] =
  validate(w, b)

  result = @[]

  for rank in 0..7:
    var line = ""
    for file in 0..7:
      line &= charFor(w, b, (rank, file))
    result.add(line)
