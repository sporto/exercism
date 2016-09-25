module Hamming (distance) where

countDiff :: String -> String -> Int
countDiff a b =
	length
	$ filter id
	$ map (\(x, y) -> x /= y)
	$ zip a b

distance :: String -> String -> Maybe Int
distance a b =
	if length a == length b then
		Just (countDiff a b)
	else
		Nothing
