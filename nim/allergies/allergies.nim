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
  result = @[]
  var remainder = allergies.score
  for i, _ in things:
    let score = 1 shl i
    let diff = remainder - score
    if diff shr (i + 1) == remainder shr (i + 1):
      result.add(things[i])
      remainder = diff 

proc isAllergicTo*(allergies: Allergies, thing: string): bool =
  lst(allergies).contains(thing)