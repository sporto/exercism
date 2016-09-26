const CODES: std::ops::Range<u8> =  (97..123);

pub fn is_pangram(sentence: &str) -> bool {
	CODES
		.all(|code| sentence.to_lowercase().contains(code as char) )
}