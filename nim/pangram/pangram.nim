import algorithm, strutils, sequtils

proc isPangram*(input: string): bool =
  toSeq(input.toLowerAscii.items)
    .sorted(cmp)
    .filter(isAlphaAscii)
    .deduplicate
    .join("") == "abcdefghijklmnopqrstuvwxyz"