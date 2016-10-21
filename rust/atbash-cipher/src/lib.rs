use std::ascii::AsciiExt;

fn switch(c: char) -> char {
    if c.is_numeric() {
        c
    } else {
        ('z' as u8 + 'a' as u8 - c as u8) as char
    }
}

pub fn decode(input: &str) -> String {
    input.chars()
        .filter(|c| !c.is_whitespace())
        .map(switch)
        .collect()
}

pub fn encode(input: &str) -> String {
    input.to_lowercase()
        .chars()
        .filter(|c| c.is_alphanumeric() && c.is_ascii())
        .map(switch)
        .collect::<Vec<char>>()
        .chunks(5)
        .map(|x| x.iter().cloned().collect())
        .collect::<Vec<String>>()
        .join(" ")
}