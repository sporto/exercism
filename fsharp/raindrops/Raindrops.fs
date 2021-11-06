module Raindrops

let add word factor n =
    if n % factor = 0 then word else ""

let convert (number: int): string =
    let
        phrase =
            add "Pling" 3 number + add "Plang" 5 number + add "Plong" 7 number
    match phrase with
    | "" -> number.ToString()
    | _ -> phrase