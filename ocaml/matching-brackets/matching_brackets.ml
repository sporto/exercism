open Base

let equal =
    Char.equal

let is_matching a b =
    if equal a '(' && equal b ')' then
        true
    else if equal a '[' && equal b ']' then
        true
    else if equal a '{' && equal b '}' then
        true
    else
        false

let is_opening c =
    equal c '(' || equal c '[' || equal c '{'

let is_closing c =
    equal c ')' || equal c ']' || equal c '}'

let rec consume (stack: char list) (input: char list) : bool =
    match input with
    | [] ->
        List.is_empty stack

    | input_head :: input_rest ->
        if is_opening input_head then
            consume (input_head :: stack) input_rest

        else if is_closing input_head then
            match stack with
            | [] ->
                false

            | stack_head :: stack_rest ->
                if is_matching stack_head input_head then
                    consume stack_rest input_rest
                else
                    false

        else
            consume stack input_rest

let are_balanced input =
    input
        |> String.to_list
        |> consume []