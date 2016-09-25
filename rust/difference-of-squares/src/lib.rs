pub fn square_of_sum(n: i32) -> i32 {
	let m: i32 = (1..n+1)
		.sum();
	
	m * m
}

pub fn sum_of_squares(n: i32) -> i32 {
	(1..n+1)
		.map(|m| m * m)
		.sum()
}

pub fn difference(n: i32) -> i32 {
	square_of_sum(n) - sum_of_squares(n)
}
