pub fn abbreviate(input: &str) -> String {
    input
        .split( |c:char| c.is_whitespace() )
        .map( |s| s.chars().next().unwrap_or(' ') )
        .collect::<String>()
        .to_uppercase()
}