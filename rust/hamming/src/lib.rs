pub fn hamming_distance(a: &str, b: &str) -> Result<usize,()> {
	if a.len() == b.len() {
		Ok(count_diff(a, b))
	} else {
		Err(())
	}
}

fn count_diff(a: &str, b: &str) -> usize {
	a
		.chars()
		.zip(b.chars())
		.filter(|x| x.0 != x.1)
		.count()
}
