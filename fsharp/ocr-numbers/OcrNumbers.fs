module OcrNumbers

let n0 = [ " _ "; "| |"; "|_|"; "   " ]

let n1 = [ "   "; "  |"; "  |"; "   " ]

let n2 = [ " _ "; " _|"; "|_ "; "   " ]

let n3 = [ " _ "; " _|"; " _|"; "   " ]

let n4 = [ "   "; "|_|"; "  |"; "   " ]

let n5 = [ " _ "; "|_ "; " _|"; "   " ]

let n6 = [ " _ "; "|_ "; "|_|"; "   " ]

let n7 = [ " _ "; "  |"; "  |"; "   " ]

let n8 = [ " _ "; "|_|"; "|_|"; "   " ]

let n9 = [ " _ "; "|_|"; " _|"; "   " ]

let ns =
    [
        n0
        n1
        n2
        n3
        n4
        n5
        n6
        n7
        n8
        n9
    ]

let break_lines = List.chunkBySize 4

let break_line_in_chars (line: string) : string list =
    line
    |> Seq.toList
    |> List.chunkBySize 3
    |> List.map (System.String.Concat)

let break_chars (line: string list) : string list list =
    line
    |> List.map break_line_in_chars
    |> List.transpose

let is_valid_char char =
    List.length char = 4
    && (List.head char |> String.length = 3)

let parse_char char =
    // A char must have 4 rows
    if is_valid_char char then
        ns
        |> List.indexed
        |> List.tryPick (fun (ix, n) ->
            if n = char then
                Some(string ix)
            else
                None)
        |> Option.orElse (Some "?")
    else
        None

let all l =
    if List.contains None l then
        None
    else
        Some(List.map Option.get l)

let convert (input: string list) =
    input
    |> break_lines
    |> List.map break_chars
    |> List.map (
        List.map parse_char
        >> all
        >> Option.map (String.concat "")
    )
    |> all
    |> Option.map (String.concat ",")
