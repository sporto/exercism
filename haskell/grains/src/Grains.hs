module Grains (square, total) where

square :: Int -> Maybe Integer
square num
	| num < 1 = Nothing
	| num > 64 = Nothing
	| num == 1 = Just 1
	| otherwise = Just (2 ^ (num - 1))

total :: Integer
total =
	sum $ fmap sum $ map square [1..64]
