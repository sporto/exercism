module Bob

open System.Text.RegularExpressions

let isYell input =
    Regex.IsMatch(input, @"[A-Za-z]+") 
    && input.ToUpper() = input

let isQuestion input =
    Regex.IsMatch(input, @".+\?\z")

let hey (input:string) =
    let trimmed = input.Trim()
    match trimmed with
    | t when t = "" -> "Fine. Be that way!"
    | t when isYell t -> "Whoa, chill out!"
    | t when isQuestion t -> "Sure."
    | _ -> "Whatever."



