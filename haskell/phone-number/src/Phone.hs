module Phone (areaCode, number, prettyPrint) where

import Data.Char

getAreaCode :: String -> String
getAreaCode =
	take 3

areaCode :: String -> Maybe String
areaCode =
	fmap getAreaCode . number

number :: String -> Maybe String
number input
	| len == 10 = Just parsed
	| len == 11 && startsWith1 = Just (drop 1 parsed)
	| otherwise = Nothing
	where
		parsed = filter isNumber input
		len = length parsed
		startsWith1 = head parsed == '1'

prettyPrintNum :: String -> String
prettyPrintNum num =
	let
		middle =
			take 3 $ drop 3 num
		right =
			reverse $ take 4 $ reverse num
	in
		"(" ++ getAreaCode num ++ ") " ++ middle ++ "-" ++ right

prettyPrint :: String -> Maybe String
prettyPrint =
	fmap prettyPrintNum . number
