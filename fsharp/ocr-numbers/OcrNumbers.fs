module OcrNumbers

let parse_char input = Some ""

let break_chars line = List.chunkBySize 3 line

let parse_line input =
    input |> break_chars |> List.map parse_char

let break_lines input = List.chunkBySize 4 input

let parse_lines input =
    input |> break_lines |> List.map parse_line

let join_lines lines = lines |> List.map join_chars

let convert input = input |> parse_lines |> join_lines
