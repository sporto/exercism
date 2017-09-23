import sequtils, strutils, algorithm 

proc isAnagramOf(a: string): auto =
  (proc(b: string): bool =
    let a2 = a.toLower()
    let b2 = b.toLower()
    (a2 != b2) and (a2.sorted(cmp) == b2.sorted(cmp))
  )

proc detectAnagrams*(word: string, list: seq[string]): seq[string] =
  list
    .filter(isAnagramOf(word))