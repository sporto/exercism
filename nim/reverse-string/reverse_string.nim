proc reduceR(source: string, f: proc(acc: string, v: char): string, acc: string): string =
  result = acc
  var i = high(source)
  while i >= 0:
    result = f(result, source[i])
    dec i

proc accumulate(acc: string, c: char): string =
  acc & c

proc reverse*(input: string): string =
    input.reduceR(accumulate , "")
