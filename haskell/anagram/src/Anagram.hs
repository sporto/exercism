module Anagram (anagramsFor) where

import Data.List
import Data.Char

anagramsFor :: String -> [String] -> [String]
anagramsFor a words =
	filter (isAnagram a) words

isAnagram a b =
	let
		a' = map toLower a
		b' = map toLower b
	in
		a' /= b' && sort a' == sort b'
