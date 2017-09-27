fn make_verse(words: &[&str]) -> String {
    format!("For want of a {} the {} was lost.\n", words[0], words[1])
}

pub fn build_proverb(list: Vec<&str>) -> String {
    let verses = list.windows(2)
        .map(make_verse)
        .collect::<String>();

    let ending = match list.len() {
        0 => "",
        l if l > 2 => "And all for the want of a horseshoe nail.",
        _ => "And all for the want of a nail.",
    };

    format!("{}{}", verses, ending)
}
