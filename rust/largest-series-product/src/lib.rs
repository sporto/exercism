extern crate regex;

use std::cmp;
use regex::Regex;

pub fn lsp(digits: &str, how_many: usize) -> Result<u32, &str> {

    let re = Regex::new(r"\D").unwrap();

    if re.is_match(digits) {
        return Err("Not all numbers");
    }

    let len = digits.len();
    if len < how_many {
        return Err("Digits must be larger");
    }

    let mut largest = 0;
    let end = len + 1 - how_many;

    for n in 0..end {
        let sum = digits.chars()
            .skip(n)
            .take(how_many)
            .map(|c| c.to_digit(10).unwrap_or(0))
            .product();
        largest = cmp::max(largest, sum);
    }

    Ok(largest)
}
