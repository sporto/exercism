pub fn encrypt(input: &str) -> String {
    let joined = input
        .to_lowercase()
        .chars()
        .filter(|c| c.is_alphabetic())
        .collect::<Vec<char>>();
    
    let joined2: String = joined.iter().cloned().collect();

    let cols: usize = (joined.len() as f32)
        .sqrt().ceil() as usize;

    let mut output = "".to_string();

    for a in 0..cols {
        for b in 0..cols {
            let pos = a + (b * cols);
            output = output + &joined2[pos..pos+1];
        };
        output = output + " ";
    };

    output.trim().to_string()
}
