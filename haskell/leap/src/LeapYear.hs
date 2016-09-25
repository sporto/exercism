module LeapYear (isLeapYear) where

isLeapYear :: Int -> Bool
isLeapYear year =
	if (isDivisibleBy 4 year) then
		if (isDivisibleBy 100 year) then
			isDivisibleBy 400 year
		else
			True
	else
		False

isDivisibleBy divisor n =
	rem n divisor == 0



