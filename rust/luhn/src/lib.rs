pub fn is_valid(input: &str) -> bool {
    let no_whitespace = input.replace(" ", "");

    if no_whitespace.len() < 2 {
        return false;
    }

    // no_whitespace.enumerate(|ix, char|)

    for no_whitespace.iter().enumerate() {
        
    }

    true
}
