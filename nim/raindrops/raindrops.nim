proc add(n: int, factor: int, word: string): string =
  if n mod factor == 0:
    word
  else:
    ""

proc convert*(n: int): string =
  result = add(n, 3, "Pling") & 
    add(n, 5, "Plang") & 
    add(n, 7, "Plong")

  if result == "":
    result = $(n)