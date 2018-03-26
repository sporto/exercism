extern crate regex;
use regex::Regex;

fn to_num(c: char) -> Option<u32> {
    match c {
        'X' => Some(10),
        other => other.to_digit(10),
    }
}

pub fn is_valid_isbn(isbn: &str) -> bool {
    let re = Regex::new(r"^[\d_-]+X?$").unwrap();

    if re.is_match(isbn) {
        let nums: Vec<u32> = isbn.chars().filter_map(to_num).collect();

        if nums.len() == 10 {
            let sum = nums.iter()
                .fold((10, 0), |(mul, sum), n| (mul - 1, sum + n * mul));

            sum.1 % 11 == 0
        } else {
            false
        }
    } else {
        false
    }
}
