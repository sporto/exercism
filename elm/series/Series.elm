module Series (..) where

import String


slices : Int -> String -> Result String (List (List Int))
slices howMany string =
  if howMany == 0 then
    Err "Invalid size: 0"
  else
    parse string
      |> Result.map (getSlices howMany)


{-|
  Get a string and convert it to a list of integer
  Returns an Err if invalid
-}
parse : String -> Result String (List Int)
parse string =
  string
    |> String.split ""
    |> List.map String.toInt
    |> collapseResults


{-|
  Collapse a list of results to only one
  e.g. [Ok 1, Ok 2] -> Ok [1, 2]
  e.g. [Ok 1, Err err] -> Err err
-}
collapseResults : List (Result String Int) -> Result String (List Int)
collapseResults results =
  List.foldr (Result.map2 (::)) (Ok []) results


{-|
  Given a list of ints e.g. [1, 2, 3]
  Return slices using howMany for the size e.g. [[1, 2], [2, 3]]
-}
getSlices : Int -> List Int -> List (List Int)
getSlices howMany lst =
  let
    sliced =
      List.take howMany lst

    nextList =
      List.drop 1 lst
  in
    if List.length sliced == howMany then
      sliced :: getSlices howMany nextList
    else
      []
