pub fn map_function<T, S, F>(input: Vec<T>, op: F) -> Vec<S>
    where F: Fn(T) -> S {

    let mut result = vec![];

    for i in input {
        result.push(op(i))
    };

    result
}

pub fn map_closure<T, S, F>(input: Vec<T>, op: F) -> Vec<S> 
    where F: Fn(T) -> S {
    map_function(input, op)
}