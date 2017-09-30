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

    let mut factors = vec![];
    let mut factor = 1;

    while factor < n {
        if n % factor == 0 {
            factors.push(factor);
        };
        factor += 1;
    };

    let sum: u64 = factors.into_iter().sum();

    let cla = match sum {
        _ if sum < n =>
            Classification::Deficient,
        _ if sum == n =>
            Classification::Perfect,
        _ =>
            Classification::Abundant,
    };

    Ok(cla)
}