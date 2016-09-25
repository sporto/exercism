module PhoneNumber (..) where

import String
import Regex exposing (replace, regex)


getNumber : String -> Maybe String
getNumber input =
  let
    parsed =
      replace Regex.All (regex "\\D") (always "") input

    len =
      String.length parsed
  in
    if len == 10 then
      Just parsed
    else if len == 11 then
      if String.startsWith "1" parsed then
        Just (String.dropLeft 1 parsed)
      else
        Nothing
    else
      Nothing


prettyPrint : String -> Maybe String
prettyPrint input =
  let
    prettyPrint' num =
      let
        left =
          String.left 3 num

        middle =
          String.dropLeft 3 num |> String.left 3

        right =
          String.right 4 num
      in
        "(" ++ left ++ ") " ++ middle ++ "-" ++ right
  in
    input
      |> getNumber
      |> Maybe.map prettyPrint'
