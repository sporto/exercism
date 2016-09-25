module Anagram (..) where

import String


normalize : String -> List Char
normalize =
  String.toLower >> String.toList >> List.sort


isAnagram : String -> String -> Bool
isAnagram word other =
  String.toLower word
    /= String.toLower other
    && normalize word
    == normalize other


detect : String -> List String -> List String
detect word list =
  List.filter (isAnagram word) list
