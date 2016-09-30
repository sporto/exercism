module School (School, add, empty, grade, sorted) where

import Data.List

type School = [(Integer, String)]

add :: Integer -> String -> School -> School
add grade name school =
	(grade, name) : school

empty = []

grade :: Integer -> School -> [String]
grade givenGrade school =
	sort
	$ map snd
	$ filter (\(g, _) -> g == givenGrade) school

sorted :: School -> [(Integer, [String])]
sorted school =
	map (\g -> (g, grade g school))
	$ sort
	$ nub
	$ map fst school
