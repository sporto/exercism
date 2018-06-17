proc distance*(one: string, two: string): int =
  result = 0
  for i, _ in one:
    if one[i] != two[i]:
      result += 1 
