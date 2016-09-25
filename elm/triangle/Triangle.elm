module Triangle (..) where

import Set


triangleKind : Float -> Float -> Float -> Result String String
triangleKind a b c =
  case isValid [ a, b, c ] of
    Ok _ ->
      if (isEquilateral a b c) then
        Ok "equilateral"
      else if (isIsosceles a b c) then
        Ok "isosceles"
      else
        Ok "scalene"

    error ->
      error


isValid : List Float -> Result String String
isValid list =
  if ((not << hasValidLengths) list) then
    Err "Invalid lengths"
  else if ((not << hasLegalLengths) list) then
    Err "Violates inequality"
  else
    Ok ""


hasValidLengths : List Float -> Bool
hasValidLengths list =
  List.all (\x -> x > 0) list


hasLegalLengths : List Float -> Bool
hasLegalLengths list =
  let
    max =
      List.maximum list
        |> Maybe.withDefault 0

    sum =
      List.sum list
  in
    (sum - max) > max


isEquilateral : Float -> Float -> Float -> Bool
isEquilateral a b c =
  a == b && b == c


isIsosceles : Float -> Float -> Float -> Bool
isIsosceles a b c =
  let
    size =
      [ a, b, c ]
        |> Set.fromList
        |> Set.size
  in
    size == 2
