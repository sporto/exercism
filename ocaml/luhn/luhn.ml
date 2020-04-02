open Core

let print_num v =
	printf "%d " v

let print_num_list l =
	List.iter ~f:print_num l

let debug_list n =
	print_num_list n ; n

let not_space c =
	not (Char.is_whitespace c)

let get_digits (input : string) : int list option =
	input
		|> String.to_list
		|> List.filter ~f:not_space
		|> List.map ~f:Char.get_digit
		|> Option.all

let double_if_even ix d =
	if ix % 2 = 0 then
		d
	else
		let double =
			d * 2
		in
		if double > 9 then
			double - 9
		else
			double

let double_every_second digits =
	digits
		|> List.rev
		|> List.mapi ~f:double_if_even
		|> List.rev

let sum =
	List.fold ~f:(+) ~init:0

let is_divisable_by_10 (d: int) : bool =
	(d % 10) = 0

let valid input =
	match get_digits input with
	| Some digits ->
		if List.length digits > 1 then
			digits
				(* |> debug_list *)
				|> double_every_second
				(* |> debug_list *)
				|> sum
				|> is_divisable_by_10
		else
			false
	| None ->
		false

