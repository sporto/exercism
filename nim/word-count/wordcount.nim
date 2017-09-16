import critbits, strutils, sequtils

type
  TWordCount* =
    CritBitTree[int]

proc reduce[T,U](source: seq[T], f: proc(acc: U, v: T): U, acc: U): U =
  result = acc
  for val in source:
    result = f(result, val)

proc groupWords(acc: TWordCount, word: string): TWordCount =
  result = acc
  if result.hasKey(word):
    result[word] += 1
  else:
    result[word] = 1

proc notEmpty(s: string): bool =
  not s.isNilOrEmpty()

proc wordCount*(phrase: string): TWordCount =
  phrase
    .toLowerAscii()
    .split(AllChars - Letters - Digits)
    .filter(notEmpty)
    .reduce(groupWords, result)