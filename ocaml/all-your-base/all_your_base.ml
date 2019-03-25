type base = int

let sum l =
	List.fold_left (+) 0 l

let combine (items : 'a option list) : 'a list option =
	let
		step (e: 'a option) (maybe_acc: 'a list option) : 'a list option =
			match maybe_acc with
			| None -> None
			| Some acc ->
				match e with
				| None -> None
				| Some v ->
					Some (v :: acc)
	in
	List.fold_right step items (Some [])

let digit_to_decimal (from_base: base) (exponent: int) (digit: int): int option =
	if from_base > 1 && digit >= 0 && digit < from_base then
		let
			res =
				digit * int_of_float (float_of_int from_base ** float_of_int exponent)
		in
		Some res
	else
		None

let to_decimal ~from ~digits : int option =
	let
		opt =
			digits
				|> List.rev
				|> List.mapi (digit_to_decimal from)
				|> combine
	in
	match opt with
	| None -> None
	| Some values -> Some (sum values)

let from_decimal ~num ~target =
	let rec from_decimal_ n =
		match n with
		| 0 -> []
		| _ -> (n mod target) :: from_decimal_ (n / target)
	in
	if target < 2 then
		None
	else if num = 0 then
		Some [0]
	else
		Some (from_decimal_ num |> List.rev)

let convert_bases ~from ~digits ~target =
	let maybe_in_decimal =
		to_decimal ~from: from ~digits: digits
	in
	if from == 0 then
		None
	else
		match maybe_in_decimal with
		| None -> None
		| Some in_decimal ->
			from_decimal ~num:in_decimal ~target:target

