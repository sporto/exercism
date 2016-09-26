module SpaceAge (Planet(..), ageOn) where

data Planet
	= Earth
	| Mercury
	| Venus
	| Mars
	| Jupiter
	| Saturn
	| Uranus
	| Neptune

ageOn :: Planet -> Integer -> Double
ageOn planet seconds =
	fromIntegral seconds / (secondsInYear planet)

factor :: Planet -> Double
factor Earth = 1
factor Mercury = 0.2408467
factor Venus = 0.61519726
factor Mars = 1.8808158
factor Jupiter = 11.862615
factor Saturn = 29.447498
factor Uranus = 84.016846
factor Neptune = 164.79132

secondsInYear :: Planet -> Double
secondsInYear =
	(*) 31557600 . factor
