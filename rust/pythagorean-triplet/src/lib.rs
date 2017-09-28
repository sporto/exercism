pub fn find() -> Option<i32> {
    let target = 1000;

    for a in 3..target {
        for b in a..target {
            let c = target - a - b;
            let valid = a * a + b * b == c * c;

            if valid {
                // 200, 375, 425
                return Some(a * b * c);
            }
        }
    };

    None
}