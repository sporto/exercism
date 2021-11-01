module TwoFer

let twoFer (input: string option): string =
    let name = input |> Option.defaultValue "you"
    $"One for {name}, one for me."