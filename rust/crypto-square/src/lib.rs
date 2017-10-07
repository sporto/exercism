pub fn encrypt(input: &str) -> String {
    let joined: Vec<char> = input
        .to_lowercase()
        .chars()
        .filter(|c| c.is_alphabetic())
        .collect();

    let size = (joined.len() as f32)
        .sqrt().ceil() as usize;

    let mut output = "".to_string();

    for row in 0..size {
        for col in 0..size {
            let pos = row + (col * size);

            match joined.get(pos) {
                Some(c) =>
                     output = output + &c.to_string(),
                None => {},
            }
        };
        output = output + " ";
    };

    output.trim().to_string()
}
