const SCORES: [(&'static str, i16); 7] = [
	("A, E, I, O, U, L, N, R, S, T",       1),
	("DG", 2),
	("BCMP", 3),
	("FHVWY", 4),
	("K", 5),
	("JX", 8),
	("QZ", 10),
];

fn char_score(c: char) -> i16 {
	let s = SCORES;
	s.iter()
		.filter(|set| set.0.contains(c) )
		.map(|set| set.1 )
		.sum()
}

pub fn score(word: &str) -> i16 {
	word
		.to_uppercase()
		.chars()
		.map(|c| char_score(c) )
		.sum()
}