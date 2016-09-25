module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard fn =
	keep (not . fn)

keep :: (a -> Bool) -> [a] -> [a]
keep fn list =
	let
		update v acc =
			if fn v then
				v : acc
			else
				acc
	in
		foldr update [] list