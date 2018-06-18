import times, math

const milliseconds = pow(10.0, 9)
const interval = initInterval(0, int(milliseconds))

proc addGigasecond*(input: DateTime): DateTime =
  input + interval