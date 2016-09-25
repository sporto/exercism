module SumOfMultiples (..) where

import Debug
import Set


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples numbers ceil =
  List.map (multiplesOf ceil) numbers
    |> List.concat
    |> Set.fromList
    |> Set.toList
    |> List.sum


multiplesOf' : Int -> Int -> Int -> List Int -> List Int
multiplesOf' ceil dist next acc =
  if next >= ceil then
    acc
  else
    multiplesOf' ceil dist (next + dist) (next :: acc)


multiplesOf : Int -> Int -> List Int
multiplesOf ceil num =
  multiplesOf' ceil num num []
