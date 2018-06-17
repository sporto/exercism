import sequtils, strutils

proc iden(c: char): char =
  case c:
    of 'G': return 'C'
    of 'C': return 'G'
    of 'T': return 'A'
    of 'A': return 'U'
    else:
      raise newException(ValueError, "didn't do stuff")

proc toRna*(input: string) : string =
  input
    .map(iden)
    .join()