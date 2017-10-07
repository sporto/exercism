use std::ascii::AsciiExt;

fn is_valid(c: &char) -> bool {
    c.is_alphabetic() && c.is_ascii()
}

pub fn encrypt(input: &str) -> String {
    if input == "" {
        return "".to_string();
    }

    let joined = input
        .to_lowercase()
        .chars()
        .filter(is_valid)
        .collect::<Vec<char>>();

    let len = joined.len() as f32;

    let cols: usize = len
        .sqrt().floor() as usize;
    
    let rows = (len / cols as f32).ceil() as usize;

    println!("len {} cols {} rows {}", len, cols, rows);

    let mut output = "".to_string();

    for a in 0..rows {
        for b in 0..cols {
            let pos = a + (b * rows);
            let maybeC = joined.get(pos);

            match maybeC {
                Some(c) =>
                     output = output + &c.to_string(),
                None => {},
            }
        };
        output = output + " ";
    };

    output.trim().to_string()
}
