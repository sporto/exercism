module BirdWatcher

let lastWeek: int[] =
    [| 0; 2; 5; 3; 7; 8; 4 |]

let yesterday(counts: int[]): int =
    (Array.rev counts).[1]

let total(counts: int[]): int =
    Array.sum counts

let dayWithoutBirds(counts: int[]): bool =
    counts
    |> Array.filter (fun e -> e = 0)
    |> Array.length
    |> fun c -> c > 0

let incrementTodaysCount(counts: int[]): int[] =
    match counts |> Array.rev |> Array.toList with
    | first :: rest ->
        first + 1 :: rest |> Array.ofList |> Array.rev
    | _ -> counts

let oddWeek(counts: int[]): bool =
    match counts with
    | [| _; 0; _; 0; _; 0; _ |] -> true
    | [| _; 10; _; 10; _; 10; _ |] -> true
    | [| 5; _; 5; _; 5; _; 5 |] -> true
    | _ -> false

