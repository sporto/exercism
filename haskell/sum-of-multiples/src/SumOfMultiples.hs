module SumOfMultiples (sumOfMultiples) where

import Data.Set

sumOfMultiples :: [Int] -> Int -> Int
sumOfMultiples numbers ceil =
	sum
	$ toList
	$ fromList
	$ concat
	$ Prelude.map (multiplesOf ceil) numbers

multiplesOf' :: Int -> Int -> Int -> [Int] -> [Int]
multiplesOf' ceil dist next acc
	| next >= ceil = acc
	| otherwise = multiplesOf' ceil dist (next + dist) (next : acc)

multiplesOf :: Int -> Int -> [Int]
multiplesOf ceil num =
	multiplesOf' ceil num num []