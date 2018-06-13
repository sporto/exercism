import strutils

proc twoFer*(name: string = "you"): string =
  "One for $1, one for me." % [name]