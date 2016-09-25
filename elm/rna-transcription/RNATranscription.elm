module RNATranscription (..) where

import String


charToRNA : Char -> Result Char Char
charToRNA c =
  case c of
    'G' ->
      Ok 'C'

    'C' ->
      Ok 'G'

    'T' ->
      Ok 'A'

    'A' ->
      Ok 'U'

    x ->
      Err x


aggregate : Result Char Char -> Result Char String -> Result Char String
aggregate result acc =
  case acc of
    Ok values ->
      case result of
        Ok value ->
          Ok (String.append values (String.fromChar value))

        Err err ->
          Err err

    _ ->
      acc


toRNA : String -> Result Char String
toRNA dna =
  String.toList dna
    |> List.map charToRNA
    |> List.foldl aggregate (Ok "")
