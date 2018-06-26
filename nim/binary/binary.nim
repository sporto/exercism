import strutils

proc charToBit(c: char): int =
  result = parseInt(c & "")
  if result > 1:
    raise newException(ValueError, "Not binary")

proc binary*(input: string): int =
  var exp = 0
  while exp < input.len:
    let bit = charToBit(input[input.len - 1 - exp])
    result += (1 shl exp) * bit
    inc exp