let isQuestion q =
	String.contains_from q (String.length q) '?';;

let isYell q =
	let isSame =
		String.uppercase q == q
	in let hasLetters =
		
	in
		hasLetters && isSame

let response_for q =
	let trimmed =
		String.trim q
	in
		if trimmed == "" then
			"Fine. Be that way!"
		else if isYell trimmed then
			"Whoa, chill out!" 
		else if isQuestion trimmed then
			"Sure."
		else
			"Whatever."