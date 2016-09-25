module Sublist (Sublist(..), sublist) where

import Data.List

data Sublist 
	= Sublist
	| Equal
	| Superlist
	| Unequal
	deriving (Show, Eq)

sublist a b =
	if a == b then
		Equal
	else if isInfixOf a b then 
		Sublist
	else if isInfixOf b a then
		Superlist
	else
		Unequal
