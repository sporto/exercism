module RNATranscription

let chartToRNA char =
    match char with
    | 'G' -> 'C'
    | 'C' -> 'G'
    | 'T' -> 'A'
    | 'A' -> 'U'
    | _ -> char

let toRna seq =
    seq |> String.map chartToRNA