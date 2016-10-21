use std::ascii::AsciiExt;

static PLAIN: &'static str = "abcdefghijklmnopqrstuvwxyz";
static CYPHER: &'static str = "zyxwvutsrqponmlkjihgfedcba";

fn switch(c: char, source: &str, target: &str) -> char {
    match source.find(c) {
        Some(ix) => {
            match target.chars().nth(ix) {
                Some(targetChar) => targetChar,
                None => c,
            }
        }
        None => c,
    }
}

fn decodeChar(c: char) -> char {
    switch(c, CYPHER, PLAIN)
}

fn encodeChar(c: char) -> char {
    switch(c, PLAIN, CYPHER)
}

pub fn decode(input: &str) -> String {
    input.chars()
        .filter(|c| !c.is_whitespace())
        .map(decodeChar)
        .collect()
}

pub fn encode(input: &str) -> String {
    input.to_lowercase()
        .chars()
        .filter(|c| !c.is_whitespace())
        .filter(|c| c.is_alphanumeric())
        .filter(|c| c.is_ascii())
        .map(encodeChar)
        .collect::<Vec<char>>()
        .chunks(5)
        .map(|x| x.iter().cloned().collect())
        .collect::<Vec<String>>()
        .join(" ")
}