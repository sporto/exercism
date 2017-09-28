pub fn find() -> Option<u32> {
    for a in 3_u32..500 {
        for b in a..500 {
            for c in b..500 {
                let valid = a.pow(2) + b.pow(2) == c.pow(2);
                let sum = a + b + c;

                println!("{} {} {} sum={} {}", a, b, c, sum, valid);
                if valid && sum == 1000 {
                    return Some(a * b * c);
                }
            }
        }
    };

    None
}