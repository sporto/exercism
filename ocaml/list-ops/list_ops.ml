let rec fold ~init ~f lst =
	match lst with
		[] -> init |
		x::xs ->
			fold ~init:(f init x) ~f:f xs

let reverse =
	fold ~init:[] ~f:(fun acc v -> v::acc)

let foldr ~init ~f lst =
	fold ~init:init ~f:f (reverse lst)

let length =
	fold ~init:0 ~f:(fun acc _ -> acc + 1)

let map ~f =
	let op' acc v = 
		(f v) :: acc
	in
		foldr ~init:[] ~f:op'

let filter ~f =
	let op' acc v =
		if f v then
			v::acc
		else
			acc
	in
		foldr ~init:[] ~f:op'

let append lst1 lst2 =
	fold ~init:(reverse lst1) ~f:(fun acc v -> v::acc) lst2
		|> reverse

let concat lst =
	lst
	(*foldr ~init:[] ~f:append*)