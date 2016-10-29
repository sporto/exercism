// Learn more about F# at http://fsharp.org
module HelloWorld

let hello input = 
    match input with
    | None -> "Hello, World!"
    | Some name -> "Hello, " + name + "!"
