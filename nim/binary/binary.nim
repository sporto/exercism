import strutils

proc bit(c: char): int =
  result = parseInt(c & "")
  if result > 1:
    raise newException(ValueError, "Not binary")

proc binary*(input: string): int =
  result = 0
  let len = input.len - 1
  var exp = len
  while exp >= 0:
    let bit = bit(input[len - exp])
    result += (1 shl exp) * bit
    dec exp