#![feature(i128_type)]

pub fn encode(num: u64) -> String {
  match num {
        0 =>
            "zero".to_string(),
        _ =>
            go(num, 7).trim().to_string(),
    }
}

fn go(n: u64, iter: i8) -> String {
    if iter == 0 {
        return "".to_string();
    }

    let power = (iter * 3) as u32;
    let large_divisor = 10_u128.pow(power);
    let smaller_divisor = 10_u128.pow(power - 3);
    let chunk = ((n as u128 % large_divisor) / smaller_divisor) as u64;

    hundreds(chunk) + &multiplier_word(chunk, iter) + &go(n, iter - 1)
}

fn multiplier_word(chunk: u64, iter: i8) -> String {
    match chunk {
        0 =>
            "".to_string(),
        _ =>
            match iter {
                1 =>
                    "".to_string(),
                2 =>
                    " thousand ".to_string(),
                3 =>
                    " million ".to_string(),
                4 =>
                    " billion ".to_string(),
                5 =>
                    " trillion ".to_string(),
                6 =>
                    " quadrillion ".to_string(),
                7 =>
                    " quintillion ".to_string(),
                _ =>
                    panic!("Too large"),
            }
    }
}

fn hundreds(n: u64) -> String {
    match n {
        0 =>
            "".to_string(),
        n if n > 999 =>
            panic!("Too large"),
        n if n > 99 =>
            unit(n / 100) + " hundred " + &tens(n % 100),
        _ =>
            tens(n)
    }
}

fn tens(num: u64) -> String {
     match num {
        n if n > 99 =>
            panic!("Too large"),
        n if n > 89 =>
            "ninety".to_string() + &unit_after_tens(n % 90),
        n if n > 79 =>
            "eighty".to_string() + &unit_after_tens(n % 80),
        n if n > 69 =>
            "seventy".to_string() + &unit_after_tens(n % 70),
        n if n > 59 =>
            "sixty".to_string() + &unit_after_tens(n % 60),
        n if n > 49 =>
            "fifty".to_string() + &unit_after_tens(n % 50),
        n if n > 39 =>
            "forty".to_string() + &unit_after_tens(n % 40),
        n if n > 29 =>
            "thirty".to_string() + &unit_after_tens(n % 30),
        n if n > 19 =>
            "twenty".to_string() + &unit_after_tens(n % 20),
        19 =>
            "nineteen".to_string(),
        18 =>
            "eighteen".to_string(),
        17 =>
            "seventeen".to_string(),
        16 =>
            "sixteen".to_string(),
        15 =>
            "fithteen".to_string(),
        14 =>
            "fourteen".to_string(),
        13 =>
            "therteen".to_string(),
        12 =>
            "twelve".to_string(),
        11 =>
            "eleven".to_string(),
        10 =>
            "ten".to_string(),
        _ =>
            unit(num),
    }
}

fn unit_after_tens(num: u64) -> String {
    match num {
        0 =>
            "".to_string(),
        _ => 
            "-".to_string() + &unit(num),
    }
}

fn unit(num: u64) -> String {
    match num {
        9 =>
            "nine".to_string(),
        8 =>
            "eight".to_string(),
        7 =>
            "seven".to_string(),
        6 =>
            "six".to_string(),
        5 =>
            "five".to_string(),
        4 =>
            "four".to_string(),
        3 =>
            "three".to_string(),
        2 =>
            "two".to_string(),
        1 =>
            "one".to_string(),
        0 =>
            "".to_string(),
        _ =>
            panic!("Not unit"),
    }
}
