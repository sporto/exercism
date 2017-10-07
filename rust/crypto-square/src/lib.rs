use std::ascii::AsciiExt;

fn is_valid(c: &char) -> bool {
    c.is_alphabetic() && c.is_ascii()
}

fn get_size(len: usize) -> (usize, usize) {
    let l = len as f32;
    let cols = l.sqrt().floor();
    let rows = (l / cols).ceil();

    (cols as usize, rows as usize)
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

    let (cols, rows) = get_size(joined.len());

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
