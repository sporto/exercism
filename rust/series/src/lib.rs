pub fn series(digits: &str, len: usize) -> Vec<String> {
    match len {
        0 => vec!["".to_string(); digits.len() + 1],
        _ => {
            digits
                .chars()
                .collect::<Vec<char>>()
                .windows(len)
                .map(|vec| vec.iter().collect::<String>() )
                .collect()
            
        },
    }
}
