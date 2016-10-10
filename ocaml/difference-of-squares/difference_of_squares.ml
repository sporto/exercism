let rec nums acc n =
	match n with
		0 -> acc |
		_ -> nums (n::acc) (n - 1)

let sum =
	List.fold_left (+) 0

let square n =
	n * n

let square_of_sum n =
	nums [] n
		|> sum
		|> square

let sum_of_squares n =
	nums [] n
		|> List.map square
		|> sum

let difference_of_squares n =
	square_of_sum n - sum_of_squares n

