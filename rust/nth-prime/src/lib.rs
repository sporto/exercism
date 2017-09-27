fn is_prime(n: usize) -> bool {
    match n {
        _ if n <= 1 => false,
        _ if n <= 3 => true,
        _ if n % 2 == 0 => false,
        _ if n % 3 == 0 => false,
        _ => {
            let mut i = 5;
            while i * i <= n {
                if n % i == 0 || n % (i + 2) == 0 {
                    return false;
                }
                i = i + 6
            }
            true
        }
    }
}

pub fn nth(target_num: usize) -> Result<usize, String> {
    match target_num {
        0 => Err("Zero".to_string()),
        _ => {
            let mut current_num: usize = 1;
            let mut primes: Vec<usize> = vec![];

            while primes.len() < target_num {
                let prime = is_prime(current_num);

                if prime {
                    primes.push(current_num);
                }

                current_num += 1;
            }

            primes.pop()
                .ok_or("Error".to_string())
        }
    }
}
