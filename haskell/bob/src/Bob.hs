module Bob (responseFor) where

import Data.Char
import Data.List

responseFor :: String -> String
responseFor input
	| isNothing input =  "Fine. Be that way!"
	| isYell input = "Whoa, chill out!"
	| isQuestion input = "Sure."
	| otherwise = "Whatever."

isNothing :: String -> Bool
isNothing =
	(==) "" . dropWhile isSpace

isYell :: String -> Bool
isYell string =
	let
		isSame =
			map toUpper string == string
	in
		hasLetters string && isSame

isQuestion :: String -> Bool
isQuestion =
	(==) '?' . last . removeWhitespace

letters :: String
letters =
	['a'..'z'] ++ ['A'..'Z']

hasLetters :: String -> Bool
hasLetters =
	any id . map (\c -> elem c letters)

removeWhitespace :: String -> String
removeWhitespace =
	filter (\c -> c /= ' ')