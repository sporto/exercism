module KindergartenGarden

open FsToolkit.ErrorHandling

let students =
    [
        "Alice"
        "Bob"
        "Charlie"
        "David"
        "Eve"
        "Fred"
        "Ginny"
        "Harriet"
        "Ileana"
        "Joseph"
        "Kincaid"
        "Larry"
    ]

type Plant =
    | Clover
    | Grass
    | Radishes
    | Violets

let parseChar (c: char) : Result<Plant, string> =
    match c with
    | 'C' -> Ok(Clover)
    | 'G' -> Ok(Grass)
    | 'R' -> Ok(Radishes)
    | 'V' -> Ok(Violets)
    | _ -> Error("Not a Plant")

let parseRow (input: string) : Result<Plant list, string> =
    input
    |> Seq.toList
    |> List.map parseChar
    |> List.sequenceResultM

let parseDiagram (diagram: string) : Result<Plant list list, string> =
    diagram.Split('\n')
    |> Seq.toList
    |> List.map parseRow
    |> List.sequenceResultM

let plantFor (rows: Plant list list) (rowIx: int) (colIx: int) : Option<Plant> =
    rows
    |> List.tryItem rowIx
    |> Option.bind (List.tryItem colIx)

let getStudentIndex (student: string) : Option<int> =
    students
    |> List.tryFindIndex (fun s -> s = student)

let plants diagram student =
    match (parseDiagram diagram, getStudentIndex student) with
    | (Ok parsedDiagram, Some studentIx) ->
        [
            plantFor parsedDiagram 0 (studentIx * 2)
            plantFor parsedDiagram 0 (studentIx * 2 + 1)
            plantFor parsedDiagram 1 (studentIx * 2)
            plantFor parsedDiagram 1 (studentIx * 2 + 1)
        ]
        |> List.choose id
    | _ -> []