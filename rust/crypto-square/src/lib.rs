pub fn encrypt(input: &str) -> String {
    let joined = input
        .to_lowercase()
        .chars()
        .filter(|c| c.is_alphabetic())
        .collect::<String>();

    // TODO, don't collect yet
    
    let cols = (joined.len() as f32).sqrt().ceil();

    // println!("{}", cols);
    joined
        .chars()
        .chunks(cols)
        // ["ab", "cd"]


    joined
}
