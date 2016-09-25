module Sublist (..) where

import String


type ListComparison
  = Sublist
  | Superlist
  | Equal
  | Unequal


version =
  2


toStr : List Int -> String
toStr list =
  List.map toString list
    |> String.join ""


sublist : List Int -> List Int -> ListComparison
sublist a b =
  let
    a' =
      toStr a

    b' =
      toStr b
  in
    if a' == b' then
      Equal
    else if String.contains a' b' then
      Sublist
    else if String.contains b' a' then
      Superlist
    else
      Unequal
