#![feature(i128_type)]

const SMALL: &[&'static str] = &[
    "", "one", "two","three","four","five","six","seven","eight","nine","ten",
    "eleven","twelve","thirteen","fourteen","fifteen",
    "sixteen","seventeen","eighteen","nineteen"
    ];

const TENS: &[&'static str] = &[
    "", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"
    ];

const BIG: &[&'static str] = &[
    "", "", "thousand", "million", "billion", "trillion", "quadrillion", "quintillion"
    ];

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
                n if n > 7 =>
                    panic!("Too large"),
            _ =>
                " ".to_string() + BIG[iter as usize] + " ",
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
            small(n / 100) + " hundred " + &tens(n % 100),
        _ =>
            tens(n)
    }
}

fn tens(num: u64) -> String {
    let n = num / 10;
    match n {
        2...9 =>
            TENS[n as usize].to_string() + &unit_after_tens(num % (n * 10)),
        0...1 =>
            small(num),
        _ =>
            panic!("Too large"),
    }
}

fn unit_after_tens(num: u64) -> String {
    match num {
        0 =>
            "".to_string(),
        _ => 
            "-".to_string() + &small(num),
    }
}

fn small(num: u64) -> String {
    match num {
        0...19 =>
            SMALL[num as usize].to_string(),
        _ =>
            panic!("Not small"),
    }
}
