module RunLengthEncoding (..) where

--["ddd", "ddd"]

import Maybe
import String
import Regex


version : Int
version =
  2


{-|
Split a string into chunks by letters
e.g. "AABBBA" -> ["AA", "BBB", "A"]
-}
splitChunks : Char -> List String -> List String
splitChunks char acc =
  let
    letter =
      String.fromChar char
  in
    case acc of
      [] ->
        [ letter ]

      x :: xs ->
        if String.startsWith letter x then
          (String.append x letter) :: xs
        else
          letter :: acc


{-|
Convert a letter chunk to its encoded representation
e.g. "AAA" -> "3A"
-}
collapseChunk : String -> String
collapseChunk str =
  if String.length str == 1 then
    str
  else
    let
      len =
        toString (String.length str)

      first =
        String.slice 0 1 str
    in
      len ++ first


encode : String -> String
encode str =
  String.foldr splitChunks [] str
    |> List.map collapseChunk
    |> String.join ""


{-|
e.g. "2A" -> (2, "A")
-}
parseChunk : String -> ( Int, String )
parseChunk chunk =
  if String.length chunk == 1 then
    ( 1, chunk )
  else
    let
      splitted =
        chunk
          |> String.reverse
          |> String.uncons
    in
      case splitted of
        Just ( char, howMany ) ->
          let
            times =
              howMany
                |> String.reverse
                |> String.toInt
                |> Result.withDefault 1
          in
            ( times, String.fromChar char )

        Nothing ->
          ( 0, "" )


{-|
e.g. (2, "A") -> "AA"
-}
expandChunk : ( Int, String ) -> String
expandChunk ( times, letter ) =
  String.repeat times letter


decode : String -> String
decode str =
  str
    |> Regex.split Regex.All (Regex.regex "(\\d+\\D|\\D)")
    |> List.filter (String.isEmpty >> not)
    |> List.map parseChunk
    |> List.map expandChunk
    |> String.join ""
