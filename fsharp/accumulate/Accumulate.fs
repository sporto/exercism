module Accumulate

let rec accumulate_ func input acc =
    match input with
    | [] -> acc
    | first::rest ->
        accumulate_ func rest (func first :: acc)


let accumulate (func: 'a -> 'b) (input: 'a list): 'b list =
    accumulate_ func input []
    |> List.rev