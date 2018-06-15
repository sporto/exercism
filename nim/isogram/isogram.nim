import strutils

proc isIsogram*(input: string): bool =
  var seen = ""

  for c in input:
    if isAlphaAscii(c):
      let lower = c.toLower
      if seen.contains(lower):
        return false
      seen &= lower

  true