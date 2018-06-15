import strutils, unicode, sequtils

proc isIsogram*(input: string): bool =
  let one = input.toLowerAscii.toRunes.filter(isAlpha)
  one.deduplicate.len == one.len