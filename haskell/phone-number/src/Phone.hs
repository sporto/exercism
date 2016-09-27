module Phone (areaCode, number, prettyPrint) where

import Data.Char

getAreaCode :: String -> String
getAreaCode =
	take 3

areaCode :: String -> Maybe String
areaCode num =
	fmap getAreaCode $ number num

number :: String -> Maybe String
number input
	| len == 10 = Just parsed
	| len == 11 = if startsWith1 then Just (drop 1 parsed) else Nothing
	| otherwise = Nothing
	where
		parsed = filter isNumber input
		len = length parsed
		startsWith1 = (take 1 parsed) == "1"

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
prettyPrint input =
	fmap prettyPrintNum $ number input
