use std::cmp;

fn split(digits: &str, how_many: usize) -> Vec<&str> {
    let end = digits.len() + 1 - how_many;
    let mut chunks: Vec<&str> = Vec::new();

    for n in 0..end {
        let chunk: String = digits.chars()
            .skip(n)
            .take(how_many)
            .collect();

        chunks.push(&chunk);
    }

    chunks
}

fn product(chunk: &str) -> Result<u32, &str> {
    if digits.parse::<u64>().is_err() {
        return Err("Not all numbers");
    }

    let res = chunk.chars()
        .map(|c| c.to_digit(10).unwrap_or(0))
        .product();

    Ok(res)
}

pub fn lsp(digits: &str, how_many: usize) -> Result<u32, &str> {
    let len = digits.len();

    if len < how_many {
        return Err("Digits must be larger");
    }

    // if digits.parse::<u64>().is_err() {
    //     return Err("Not all numbers");
    // }

    split(digits, how_many)
        .map(product)
        .max();


    // let mut largest = 0;
    // let end = len + 1 - how_many;

    // for n in 0..end {
    //     let chunk = digits.chars()
    //         .skip(n)
    //         .take(how_many)

    //     chunks.push(chunk);
    //     // let sum = digits.chars()
    //     //     .skip(n)
    //     //     .take(how_many)
    //     //     .map(|c| c.to_digit(10).unwrap_or(0))
    //     //     .product();
    //     // largest = cmp::max(largest, sum);
    // }

    // Ok(largest)
}
