import sequtils, math

proc isMultiple(target: int): auto =
  (proc(n: int): bool =
    fmod(float(target), float(n)) == 0
  )

proc sum*(n: int, list: seq[int]): int =
  result = 0
  for i in (1..n-1):
    if list.any(isMultiple(i)):
      result += i