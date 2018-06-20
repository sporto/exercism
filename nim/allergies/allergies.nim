# import algorithm

type
  Allergies* = object of RootObj
    score*: int

const allergens = [
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
  for i, _ in allergens:
    let score = 1 shl i
    if (score and allergies.score) != 0:
      result.add(allergens[i])

proc isAllergicTo*(allergies: Allergies, thing: string): bool =
  lst(allergies).contains(thing)