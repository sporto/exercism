pub fn sum_of_multiples(ceil: u32, numbers: &Vec<u32>) -> u32 {
    (1..ceil)
        .filter(|x| numbers.iter().any(|n| x % n == 0))
        .sum()
}
