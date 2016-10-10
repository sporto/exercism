let ( |> ) x f = f x

let rec nums acc n =
	match n with
		0 -> acc |
		_ -> nums (n::acc) (n - 1)

let sum =
	List.fold_left (+) 0

let power2 n =
	int_of_float (float_of_int n ** 2.0)

let square_of_sum n =
	nums [] n
		|> sum
		|> power2

let sum_of_squares n =
	nums [] n
		|> List.map power2
		|> sum

let difference_of_squares n =
	square_of_sum n - sum_of_squares n

