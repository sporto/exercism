module Hamming (..) where

import String


countDiff : String -> String -> Int
countDiff a b =
  List.map2 (/=) (String.toList a) (String.toList b)
    |> List.filter identity
    |> List.length


distance : String -> String -> Maybe Int
distance a b =
  if String.length a == String.length b then
    Just (countDiff a b)
  else
    Nothing
