use std::collections::HashMap;

pub fn word_count(sentence: &str) -> HashMap<String, u32> {
	let words = sentence
		.replace("_", ",")
		.replace(" ", ",")
		.split(",");

	let mut m = HashMap::new();

	for word in words {
		let c = m.entry(word.to_string()).or_insert(0);
		*c += 1;
	}

	m
}