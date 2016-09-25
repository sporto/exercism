extern crate regex;
use regex::Regex;

pub fn reply(input: &str) -> String {
	let trimmed = input
		.trim();

	match trimmed {
		_ if trimmed == "" =>
			"Fine. Be that way!".to_string(),

		_ if is_yell(trimmed) =>
			"Whoa, chill out!".to_string(),

		_ if is_question(trimmed) =>
			"Sure.".to_string(),

		_ =>
			"Whatever.".to_string(),
	}
}

fn is_yell(input: &str) -> bool {
	let same = input.to_uppercase() == input;
	let re = Regex::new(r"[A-Za-z]+").unwrap();
	let contains = re.is_match(input);

	same && contains
}

fn is_question(input: &str) -> bool {
	let last: String = input.chars().rev().take(1).collect();
	last == "?".to_string()
}