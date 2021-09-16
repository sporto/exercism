type dna = [ `A | `C | `G | `T ]
type rna = [ `A | `C | `G | `U ]

let to_rna =
    List.map (fun c ->
        match c with
        | `G -> `C
        | `C -> `G
        | `T -> `A
        | `A -> `U
    )