import sequtils

proc process(acc: var seq[char], c: char): seq[char] =
  let last = if acc.len > 0: acc[acc.len - 1] else: ' '

  let open = c == '[' or c == '{' or c == '('
  let close = c == ']' or c == '}' or c == ')'

  let complete = case last & c:
    of "[]": true
    of "()": true
    of "{}": true
    else: false

  if complete:
    acc.delete(acc.len - 1, acc.len - 1)
  elif open or close:
    acc.add(c)

  acc

proc reduce[T](source: string, f: proc(acc: var T, v: char): T, acc: T): T =
  result = acc
  for val in source:
    result = f(result, val)

proc isPaired*(input: string): bool =
  var acc: seq[char] = @[]
  let stack = input.reduce(process, acc)
  stack == @[]