open Str

let isQuestion q =
	Str.string_match (Str.regexp ".+\?$") q 0

let isUpper q =
	String.equal (String.uppercase_ascii q) q

let hasLetters q =
	Str.string_match (Str.regexp ".+[a-zA-Z]+") q 0 ;;

let isYell q =
	hasLetters q && isUpper q

let response_for q =
	let trimmed =
		String.trim q
	in
		if String.equal trimmed "" then
			"Fine. Be that way!"
		else if isYell trimmed then
			"Whoa, chill out!" 
		else if isQuestion trimmed then
			"Sure."
		else
			"Whatever."