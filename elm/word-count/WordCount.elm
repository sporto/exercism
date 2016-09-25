module WordCount (..) where

import String
import Dict
import Regex exposing (replace, HowMany(..), regex)


removeNonLetters : String -> String
removeNonLetters =
  replace All (regex "\\W") (always "")


counter : String -> Dict.Dict String Int -> Dict.Dict String Int
counter word acc =
  let
    previous =
      Dict.get word acc |> Maybe.withDefault 0
  in
    Dict.insert word (previous + 1) acc


wordCount : String -> Dict.Dict String Int
wordCount phrase =
  phrase
    |> String.split " "
    |> List.map removeNonLetters
    |> List.filter (not << String.isEmpty)
    |> List.map String.toLower
    |> List.foldl counter Dict.empty
