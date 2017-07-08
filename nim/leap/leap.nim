proc isLeapYear*(year: int): bool =
  let by4 = year mod 4 == 0
  let by100 = year mod 100 == 0
  let by400 = year mod 400 == 0

  if by4 and by100:
    by400
  else:
    by4
