import math

const EARTH = 31557600

proc secondsInYear(planet: string): float =
  let factor = case planet:
    of "Earth":
      1.0
    of "Mercury":
      0.2408467
    of "Venus":
      0.61519726
    of "Mars":
      1.8808158
    of "Jupiter":
      11.862615
    of "Saturn":
      29.447498
    of "Uranus":
      84.016846
    of "Neptune":
      164.79132
    else:
      1

  EARTH * factor

proc age*(planet: string, age: int64): float =
  (float(age) / secondsInYear(planet)).round(2)