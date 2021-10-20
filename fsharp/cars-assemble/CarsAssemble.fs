module CarsAssemble

let successRate speed =
    match speed with
    | 0 -> 0.0
    | 1
    | 2
    | 3
    | 4 -> 1.0
    | 5
    | 6
    | 7
    | 8 -> 0.9
    | 9 -> 0.8
    | _ -> 0.77

let productionRatePerHour (speed: int) : float =
    (float (speed * 221)) * (successRate speed)

let workingItemsPerMinute (speed: int) : int =
    int (productionRatePerHour speed / 60.0)
