fn split_by_char(acc: Vec<(char, usize)>, c: char) -> Vec<(char, usize)> {
    match acc.last() {
        Some(last) => {
            let mut acc2 = acc.clone();
            let &(c2, s) = last;
            if c == c2 {
                acc2.pop();
                acc2.push((c, s + 1));
            } else {
                acc2.push((c, 1));
            }
            acc2
        }
        None => vec![(c, 1)],
    }
}

fn encode_tuple(tuple: (char, usize)) -> String {
    let (c, s) = tuple;
    if s == 1 {
        c.to_string()
    } else {
        s.to_string() + &c.to_string()
    }
}

pub fn encode(input: &str) -> String {
    input.chars()
        .fold(vec![], split_by_char)
        .into_iter()
        .map(encode_tuple)
        .collect::<Vec<String>>()
        .join("")
}

fn split_by_num_and_char(acc: Vec<String>, c: char) -> Vec<String> {
    match acc.last() {
        Some(last) => {
            let mut acc2 = acc.clone();
            if c.is_digit(10) {
                acc2.pop();
                acc2.push(c.to_string() + last);
            } else {
                acc2.push(c.to_string());
            }
            acc2
        }
        None => vec![c.to_string()]
    }
}

fn expand(s: String) -> String {
    let (n, c) = s.split_at(s.len() - 1);
    let n2 = n.parse::<usize>().unwrap_or(1);
    c.repeat(n2).to_string()
}

pub fn decode(input: &str) -> String {
    // 2A3B4C -> AABBBCCCC
    input.chars()
        .into_iter()
        .rev()
        .fold(vec![], split_by_num_and_char)
        .into_iter()
        .rev()
        .map(expand)
        .collect::<Vec<String>>()
        .join("")
}
