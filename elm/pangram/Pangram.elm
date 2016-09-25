module Pangram (..) where

import Char
import String


codes : List Int
codes =
  [97..122]


isPangram : String -> Bool
isPangram sentence =
  let
    lowerSentence =
      String.toLower sentence
  in
    List.all (hasCode lowerSentence) codes


hasCode : String -> Int -> Bool
hasCode sentence code =
  let
    letter =
      code
        |> Char.fromCode
        |> String.fromChar
  in
    String.contains letter sentence
