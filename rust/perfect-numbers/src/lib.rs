#[derive(PartialEq, Debug)]
pub enum Classification {
    Abundant,
    Deficient,
    Perfect,
}

pub fn classify(n: u64) -> Result<Classification, &'static str> {
    if n < 1 {
        return Err("Number must be positive");
    };

    let sum: u64 = (1 ..  n / 2 + 1)
        .filter(|i| n % i == 0)
        .sum();

    match sum {
        _ if sum < n =>
            Ok(Classification::Deficient),
        _ if sum == n =>
            Ok(Classification::Perfect),
        _ =>
            Ok(Classification::Abundant),
    }
}