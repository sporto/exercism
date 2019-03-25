let word_for factor word n =
	if n mod factor == 0 then
		word
	else
		""

let raindrop i =
	let
		phrase =
			[
				word_for 3 "Pling" i;
				word_for 5 "Plang" i;
				word_for 7 "Plong" i;
			]
			|> String.concat ""
	in
	if phrase = "" then
		string_of_int i
	else
		phrase


