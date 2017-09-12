pub fn encode(input: String) -> String {

    // fn group(acc: Vec<(char, usize)>, char: char) -> Vec<(char, usize)> {
    //     match acc.last() {
    //         Some(last) => {
    //             let &(c, s) = last;
    //             if c == char {

    //                 acc.push((c, s + 1));
    //                 acc
    //             } else {
    //                 acc.push((c, 1));
    //                 acc
    //             }
    //         }
    //         _ => vec![(char, 1)],
    //     }
    // }

    fn encode_tuple(tuple: (char, usize)) -> String {
        let (c, s) = tuple;
        c.to_string() + &s.to_string()
    }

    let mut tuples = vec![];

    for char in &input.chars() {
        match tuples.last() {
            Some(last) => {
                let &(c, s) = last;
                if c == char {
                    tuples.pop();
                    tuples.push((char, s + 1));
                } else {
                    tuples.push((char, 1));
                }
            }
            _ => tuples.push((char, 1)),
        }
    }

    tuples.into_iter()
        .map(encode_tuple)
        .collect::<Vec<String>>()
        .join("")
    // input.chars()
    //     .fold(vec![], group)
    //     .into_iter()
    //     .map(encode_tuple)
    //     .collect::<Vec<String>>()
    //     .join("")
}

pub fn decode(input: String) -> String {
    "".to_string()
}
