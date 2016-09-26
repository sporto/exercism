use std::collections::HashMap;

pub fn word_count(sentence: &str) -> HashMap<String, u32> {
	sentence
		.replace("_", ",")
		.replace(" ", ",")
		.split(",")
		.fold(|acc, w| () )
		.collect()
}