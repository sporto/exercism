pub fn lsp(chars: &str, how_many: usize) -> Result<u32, &str> {

    let len = chars.len();
    if len < how_many {
        return Err("Chars must be larger");
    }

    if how_many == 0 {
        return Ok(1);
    }

    let mut nums: Vec<u32> = vec![];

    for c in chars.chars() {
        match c.to_digit(10) {
            Some(n) => nums.push(n),
            _ => return Err("Not number"),
        }
    }

    let max: u32 = nums.windows(how_many)
        .map(|s| s.iter().product())
        .max()
        .unwrap();

    Ok(max)
}
