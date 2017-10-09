fn rotate_char(offset: usize, c: char) -> char {
    if !c.is_alphabetic()  {
        return c
    };

    let first = if c.is_lowercase() {
        'a' as u8
    } else {
        'A' as u8
    };

    let last: u8 =  if c.is_lowercase() {
        'z' as u8
    } else {
        'Z' as u8
    };

    let range = last - first + 1;
    let code  = (c as u8 - first + offset as u8) % range + first;
    code as char
}

pub fn rotate(input: &str, offset: usize) -> String {
    let rot = |c| rotate_char(offset, c);
    input.chars().map(rot).collect()
}
