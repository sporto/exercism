module SumOfMultiples

let multiplesOf max n =
    [n..n..(max - 1)]

let sumOfMultiples numbers max =
    numbers
        |> Seq.map (multiplesOf max)
        |> Seq.concat
        |> Seq.distinct
        |> Seq.sum
