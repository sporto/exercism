module Squares (difference, squareOfSums, sumOfSquares) where

square n =
	n * n

difference :: Integral a => a -> a
difference n =
	squareOfSums n - sumOfSquares n

squareOfSums :: Integral a => a -> a
squareOfSums n =
	square $  (1 + n) / 2
	-- square $ sum $ [1..n]

sumOfSquares :: Integral a => a -> a
sumOfSquares n =
	sum $ map square $ [1..n]