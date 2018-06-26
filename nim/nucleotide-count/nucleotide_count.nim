import sequtils, tables

proc count*(c: char, input: string): int =
  input.filterIt(it == c).len

proc countDna*(input: string): Table[char, int] =
  "ACTG"
    .mapIt((it, count(it, input)))
    .filterIt(it[1] > 0)
    .toTable