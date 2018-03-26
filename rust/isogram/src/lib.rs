pub fn check(input: &str) -> bool {
    let mut sorted = input
        .chars()
        .filter(|c| c.is_alphabetic())
        .map(|c| c.to_ascii_uppercase())
        .collect::<Vec<char>>();

    sorted.sort();

    let mut unique = sorted.clone();
    unique.dedup();

    unique.len() == sorted.len()
}
