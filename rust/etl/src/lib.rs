use std::collections::BTreeMap;

pub fn transform(tree: &BTreeMap<i32, Vec<String>>) -> BTreeMap<String, i32> {
    let mut result = BTreeMap::new();
    for (points, keys) in tree {
        for key in keys {
            result.insert(key.to_lowercase().to_string(), *points);
        }
    }
    result
}