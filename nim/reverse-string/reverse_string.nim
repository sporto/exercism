proc reverse*(input: string): string =
  result = ""
  var i = high(input)
  while i >= 0:
    result &= input[i]
    dec i
