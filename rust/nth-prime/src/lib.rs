fn is_prime(n: u32) -> bool {
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

pub fn nth(target_num: u16) -> Result<u32, String> {
    match target_num {
        0 => Err("Zero".to_string()),
        _ => {
            let mut current_num = 0;
            let mut current_prime_pos = 0;

            while current_prime_pos < target_num {
                current_num += 1;
                if is_prime(current_num) {
                    current_prime_pos += 1;
                }
            }

            Ok(current_num)
        }
    }
}
