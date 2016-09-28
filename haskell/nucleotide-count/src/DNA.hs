module DNA (count, nucleotideCounts) where

import qualified Data.Map as Map

nucleotides = "ACGT"

isValidNuc :: Char -> Bool
isValidNuc given =
	any (\n -> n == given) nucleotides

isValidStrand :: String -> Bool
isValidStrand strand =
	(==) strand
	$ filter (\n -> isValidNuc n) strand

count :: Char -> String -> Either String Int
count c strand =
	if isValidStrand strand && isValidNuc c then
		Right $ length $ filter (\x -> x == c) strand
	else
		Left strand

countTuple :: String -> Char -> Either String (Char, Int)
countTuple strand nuc =
	fmap (\x -> (nuc, x)) (count nuc strand)

nucleotideCounts :: String -> Either String (Map.Map Char Int)
nucleotideCounts strand =
	fmap Map.fromList
	$ sequence
	$ map (countTuple strand) nucleotides
