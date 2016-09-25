module Accumulate (accumulate) where

accumulate :: (a -> b) -> [a] -> [b]
accumulate f [] = []
accumulate f (x:xs) =  (f x) : accumulate f xs
