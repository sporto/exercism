module SpaceAge (..) where


type Planet
  = Mercury
  | Venus
  | Earth
  | Mars
  | Jupiter
  | Saturn
  | Uranus
  | Neptune


secondsInEarth : Float
secondsInEarth =
  31557600


relativeToEarth : Planet -> Float
relativeToEarth place =
  case place of
    Mercury ->
      0.2408467

    Venus ->
      0.61519726

    Earth ->
      1

    Mars ->
      1.8808158

    Jupiter ->
      11.862615

    Saturn ->
      29.447498

    Uranus ->
      84.016846

    Neptune ->
      164.79132


ageOn : Planet -> Float -> Float
ageOn place seconds =
  let
    divisor =
      secondsInEarth * (relativeToEarth place)
  in
    seconds / divisor
