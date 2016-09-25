pub fn is_leap_year(y: i16) -> bool {

	match y {
		y if is_divisable(y, 4) && is_divisable(y, 100) =>
			is_divisable(y, 400),
		y if is_divisable(y, 4) =>
			true,
		_ =>
			false,
	}
}

fn is_divisable(n: i16, divisor: i16) -> bool {
	n % divisor == 0
}

