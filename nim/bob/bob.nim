import nre 
import strutils

proc isNothing(input: string): bool =
  strip(input) == ""

proc isYell(input: string): bool =
  input == toUpper(input) and contains(input, re"""[A-Z]""")

proc isQuestion(input: string): bool =
  endsWith(strip(input), "?")

proc hey*(input: string): string =
  if isNothing(input):
    "Fine. Be that way!"
  elif isYell(input):
    "Whoa, chill out!"
  elif isQuestion(input):
    "Sure."
  else:
    "Whatever."

