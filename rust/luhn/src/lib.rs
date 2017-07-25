fn remove_whitespace(input: &str) -> Result<String, String> {
    let trimmed = input.replace(" ", "");

    if trimmed.len() < 2 {
        Err("Invalid".to_string())
    } else {
        Ok(trimmed)
    }
}

fn to_digits(input: String) -> Result<Vec<u32>, String> {
    input
        .chars()
        .map(|c| c.to_digit(10))
        .collect::<Option<Vec<u32>>>()
        .ok_or("Invalid digits".to_string())
}

fn double_second_digits(digits: Vec<u32>) -> Vec<u32> {
    digits
        .iter()
        .rev()
        .enumerate()
        .map(|(ix, &num)|
            if ix % 2 == 0 { num } else { num * 2 }
        )
        .map(|num|
            if num > 9 { num - 9 } else { num }
        )
        .collect::<Vec<u32>>()
}

fn sum_digits(digits: Vec<u32>) -> u32 {
    digits.iter().sum()
}

fn is_divisable_by_10(num: u32) -> bool {
    num % 10 == 0
}

pub fn is_valid(input: &str) -> bool {
    remove_whitespace(input)
        .and_then(to_digits)
        .map(double_second_digits)
        .map(sum_digits)
        .map(is_divisable_by_10)
        .unwrap_or(false)
}
