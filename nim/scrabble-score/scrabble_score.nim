import sequtils, strutils, math

const SCORES = [
 ("AEIOULNRST", 1),
 ("DG", 2),
 ("BCMP", 3),
 ("FHVWY", 4),
 ("K", 5),
 ("JX", 8),
 ("QZ", 10),
]

proc scoreForLetter(c: char): int =
  SCORES.filterIt(it[0].contains(c.toUpperAscii))[0][1]

proc score*(word: string): int =
  toSeq(word.items).map(scoreForLetter).sum