pub fn collatz(n: u64) -> Result<u64, &'static str> {
    match n {
        0 => Err("Zero"),
        _ => {
            let mut res = n;
            let mut steps = 0;

            while res != 1 {
                if res % 2 == 0 {
                    res = res / 2;
                } else {
                    res = res * 3 + 1;
                }
                steps = steps + 1;
            }

            Ok(steps)
        },
    }
}
