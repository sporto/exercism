module Bob
  ( hey
  ) where

import Prelude
import Data.Eq ((==), (/=))
import Data.String (trim, toUpper, stripSuffix, Pattern(..))
import Data.String.Regex (test, regex, Regex)
import Data.String.Regex.Flags (global, noFlags)
import Data.Maybe
import Data.Either

isEmpty :: String -> Boolean
isEmpty input =
  trim input == ""

re :: Either String Regex
re = regex "[a-zA-Z]" global

hasChars :: String -> Boolean
hasChars input =
  case re of
    Left _ ->
      false
    Right r ->
      test r input

isShouting :: String -> Boolean
isShouting input =
  hasChars input && input == toUpper input

isQuestion :: String -> Boolean
isQuestion input =
  stripSuffix (Pattern "?") input /= Nothing

hey :: String -> String
hey input =
  if isEmpty input then
    "Fine. Be that way!"
  else if isShouting input then
    "Whoa, chill out!"
  else if isQuestion input then
    "Sure."
  else
    "Whatever."