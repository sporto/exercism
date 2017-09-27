fn make_verse(words: &[&str]) -> String {
    format!("For want of a {} the {} was lost.\n", words[0], words[1])
}

pub fn build_proverb(list: Vec<&str>) -> String {
    let verses = list.windows(2)
        .map(make_verse)
        .collect::<String>();

    // let words = list.iter()
    //     .skip(1)
    //     .take(3)
    //     .map(|&str| str)
    //     .collect::<Vec<&str>>()
    //     .iter()
    //     .rev()
    //     .map(|&str| str)
    //     .collect::<String>();

    // let last_word = list.iter()
    //     .take(1)
    //     .map(|&str| str)
    //     .collect::<String>();

    // let ending = format!("And all for the want of a {} {}.", words, last_word);

    let ending = match list.len() {
        0 => "",
        l if l > 2 => "And all for the want of a horseshoe nail.",
        _ => "And all for the want of a nail.",
    };
    // let ending = if list.len() > 2 {
    //     "And all for the want of a horseshoe nail.".to_string()
    // } else {
    //     "And all for the want of a nail.".to_string()
    // };

    format!("{}{}", verses, ending)
}
