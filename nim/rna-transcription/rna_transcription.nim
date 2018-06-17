import sequtils, strutils

proc iden(c: char): char =
  result = case c:
    of 'G':'C'
    of 'C': 'G'
    of 'T': 'A'
    of 'A': 'U'
    else:
      '-'

  if result == '-':
    raise newException(ValueError, "didn't do stuff")
      

proc toRna*(input: string) : string =
  toSeq(input.items)
    .map(iden)
    .join("")