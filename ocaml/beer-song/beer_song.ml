let verse =
    function
    | 0 -> "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall."
    | 1 -> "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall."
    | 2 -> "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall."
    | n -> Printf.sprintf "%i bottles of beer on the wall, %i bottles of beer.\nTake one down and pass it around, %i bottles of beer on the wall." n n (n - 1)


let rec recite_do from until acc =
    if until > 0 then
        recite_do (from - 1) (until - 1) (verse from :: acc)
    else
        acc

let recite from until =
    recite_do from until []
    |> List.rev
    |> Base.String.concat ~sep:"\n\n"
