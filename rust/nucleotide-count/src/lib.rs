use std::collections::HashMap;

pub fn count(c: char, seq: &str) -> usize {
	seq
		.chars()
		.filter(|&x| x == c)
		.count()
}

pub fn nucleotide_counts(seq: &str) -> HashMap<char, usize> {
	"ATCG"
		.chars()
		.map(|c| (c, count(c, seq)))
		.collect()
}