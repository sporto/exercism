module Bob (..) where

import Regex exposing (regex, replace, contains)
import String


type Input
  = Question
  | Yell
  | Nothing
  | Else


hey string =
  let
    input =
      inputFrom string
  in
    case input of
      Nothing ->
        "Fine. Be that way!"

      Yell ->
        "Whoa, chill out!"

      Question ->
        "Sure."

      Else ->
        "Whatever."


inputFrom string =
  if isNothing string then
    Nothing
  else if (isYell string) then
    Yell
  else if (isQuestion string) then
    Question
  else
    Else


isNothing string =
  string
    |> replace Regex.All (regex "\\s") (always "")
    |> String.isEmpty


isYell string =
  let
    isSame =
      (String.toUpper string) == string
  in
    (hasLetters string) && isSame


isQuestion string =
  String.endsWith "?" string


hasLetters string =
  contains (regex "[A-Za-z]+") string
