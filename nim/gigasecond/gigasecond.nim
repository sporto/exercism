import times, math

const interval = initInterval(seconds = 1_000_000_000)

proc addGigasecond*(input: DateTime): DateTime =
  input + interval