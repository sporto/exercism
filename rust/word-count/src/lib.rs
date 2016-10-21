use std::collections::HashMap;

fn countWords(mut hashMap: HashMap<String, u32>, word: String) -> HashMap<String, u32> {
    {
        let c = hashMap.entry(word).or_insert(0);
        *c += 1;
    }

    hashMap
}

pub fn word_count(sentence: &str) -> HashMap<String, u32> {
    sentence.split(|c: char| !c.is_alphanumeric())
        .filter(|w| !w.is_empty())
        .map(|w| w.to_lowercase())
        .fold(HashMap::new(), countWords)
}
