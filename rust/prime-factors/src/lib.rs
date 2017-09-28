pub fn factors(n: u64) -> Vec<u64> {
    let mut fs = vec![];
    let mut num = n;
    let mut div = 2;

    while num > 1 {
        while num % div == 0 {
            fs.push(div);
            num = num / div;
        }
        div += 1;
    }

    fs
}