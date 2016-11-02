module DifferenceOfSquares

let square n =
    pown n 2

let sumOfSquares n =
    [1..n]
        |> List.map square
        |> List.sum

let squareOfSums n =
    [1..n]
        |> List.sum
        |> square

let difference n = 
    squareOfSums n - sumOfSquares n
