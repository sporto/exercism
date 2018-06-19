import algorithm

type
  Allergies* = object of RootObj
    score*: int

const things = [
  "eggs",
  "peanuts",
  "shellfish",
  "strawberries",
  "tomatoes",
  "chocolate",
  "pollen",
  "cats",
]

proc lst*(allergies: Allergies): seq[string] =
  var current = 12
  var remainder = allergies.score
  var positions: seq[int] = @[]
  result = @[]

  while current >= 0:
    let score = 1 shl current
    let diff = remainder - score
    if diff >= 0:
      positions.add(current)
      remainder = diff
    dec current

  for i in countdown(high(positions),low(positions)):
    let pos = positions[i]
    if things.len > pos:
      result.add(things[pos])

proc isAllergicTo*(allergies: Allergies, thing: string): bool =
  lst(allergies).contains(thing)