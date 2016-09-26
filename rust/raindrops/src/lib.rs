pub fn raindrops(n: i16) -> String {
	let vals = vec![
		(3, "Pling"),
		(5, "Plang"),
		(7, "Plong"),
	];

	let phrase = vals
		.iter()
		.filter(|tuple| n % tuple.0 == 0 )
		.map(|tuple| tuple.1 )
		.collect::<String>();

	match phrase.is_empty() {
		true =>
			n.to_string(),
		false =>
			phrase.to_string()
	}
}