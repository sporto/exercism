pub fn hello(name: Option<&str>) -> String {
	match name {
		Some(n) =>
			"Hello, ".to_string() + n + "!",
		None =>
			"Hello, World!".to_string(),
	}
}