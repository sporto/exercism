pub fn encrypt(input: &str) -> String {
    let joined = input
        .to_lowercase()
        .chars()
        .filter(|c| c.is_alphabetic())
        .collect::<Vec<char>>();

    let cols: usize = (joined.len() as f32)
        .sqrt().ceil() as usize;

    let mut output = "".to_string();

    for chunk in joined.chunks(cols) {
        for c in chunk {
            output = output + &c.to_string();
        };
        output = output + " ";
    };

    output
}
