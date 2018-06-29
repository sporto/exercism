function is_leap_year(year::Int)
	by4 = year % 4 == 0
	by100 = year % 100 == 0
	by400 = year % 400 == 0

	by4 & by100 ? by400 : by4
end

