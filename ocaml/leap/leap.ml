let is_divisible_by divisor n =
	n mod divisor == 0

let leap_year year =
	if (is_divisible_by 4 year) then
		if (is_divisible_by 100 year) then
			is_divisible_by 400 year
		else
			true
		else
			false