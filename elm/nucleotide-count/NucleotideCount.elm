module NucleotideCount (..) where

import String


type alias Count =
  { a : Int
  , t : Int
  , c : Int
  , g : Int
  }


version : Int
version =
  2


newCount : Count
newCount =
  Count 0 0 0 0


counter : Char -> Count -> Count
counter letter count =
  case letter of
    'A' ->
      { count | a = count.a + 1 }

    'T' ->
      { count | t = count.t + 1 }

    'C' ->
      { count | c = count.c + 1 }

    'G' ->
      { count | g = count.g + 1 }

    _ ->
      count


nucleotideCounts : String -> Count
nucleotideCounts dna =
  String.foldl counter newCount dna
