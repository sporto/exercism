import sequtils, strutils

proc process(acc: var seq[char], c: char): seq[char] =
  let lastIx = acc.len - 1
  let last = if acc.len > 0: acc[lastIx] else: ' '
  let open = "[{(".contains(c)
  let close = "]})".contains(c)
  let pair = "[](){}".contains(last & c)

  if pair:
    acc.delete(lastIx)
  elif open or close:
    acc.add(c)

  acc

proc reduce[T](source: string, f: proc(acc: var T, v: char): T, acc: T): T =
  result = acc
  for val in source:
    result = f(result, val)

proc isPaired*(input: string): bool =
  input.reduce(process, @[]) == @[]