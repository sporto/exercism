import re, strutils, sequtils

proc abbreviate*(input: string): string =
  input.replace(re"(\W+)", " ")
    .split(" ")
    .mapIt(it[0])
    .map(toUpper)
    .join("")