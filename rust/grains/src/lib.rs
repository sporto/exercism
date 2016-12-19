pub fn square(s: u32) -> u64 {
    match s {
        s if s < 1 || s > 64 => panic!("Square must be between 1 and 64"),
        _ => 2u64.pow(s - 1),
    }
}

pub fn total() -> u64 {
    (1..65)
        .map(square)
        .sum()
}
