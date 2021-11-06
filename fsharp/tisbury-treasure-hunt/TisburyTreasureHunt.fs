module TisburyTreasureHunt

let getCoordinate ((_, coor): string * string): string =
    coor

let convertCoordinate (coordinate: string): int * char =
    (coordinate.[0] |> sprintf "%c" |> int, coordinate.[1])

let compareRecords ((_, a2): string * string) ((_, r2, _): string * (int * char) * string) : bool =
    convertCoordinate a2 = r2

let createRecord ((a1, a2) as azarasData: string * string) ((r1, r2, r3) as ruisData: string * (int * char) * string) : (string * string * string * string) =
    if compareRecords azarasData ruisData then
        (a2, r1, r3, a1)
    else
        ("", "", "", "")
