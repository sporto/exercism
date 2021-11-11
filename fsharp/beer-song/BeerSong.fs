module BeerSong

let new_verses bottles =
    match bottles with
    | 0 ->
        [
            "No more bottles of beer on the wall, no more bottles of beer."
            "Go to the store and buy some more, 99 bottles of beer on the wall."
        ]
    | 1 ->
        [ "1 bottle of beer on the wall, 1 bottle of beer."
          "Take it down and pass it around, no more bottles of beer on the wall."
        ]
    | 2 ->
        [
            "2 bottles of beer on the wall, 2 bottles of beer."
            "Take one down and pass it around, 1 bottle of beer on the wall."
        ]
    | _ ->
        [
            $"{bottles} bottles of beer on the wall, {bottles} bottles of beer."
            $"Take one down and pass it around, {bottles - 1} bottles of beer on the wall."
        ]

let rec recite_ acc (bottles: int) (takeDown: int) =
    let gap =
        if List.isEmpty acc then [] else [ "" ]
    match takeDown with
    | 0 -> acc
    | _ -> recite_ (acc @ gap @ new_verses bottles) (bottles - 1) (takeDown - 1)

let recite (startBottles: int) (takeDown: int) =
    recite_ [] startBottles takeDown