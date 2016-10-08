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
	match (String.trim q) with
	| "" -> "Fine. Be that way!"
	| q when isYell q -> "Whoa, chill out!" 
	| q when isQuestion q -> "Sure."
	| _ -> "Whatever."