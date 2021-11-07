module GradeSchool

type School = Map<int, string list>

let empty: School = Map.empty

let add (student: string) (grade: int) (school: School): School =
    Map.change grade (fun maybe_list ->
        match maybe_list with
        | None -> Some [student]
        | Some list -> Some (student :: list)
    ) school

let roster (school: School): string list =
    school
    |> Map.toList
    |> List.sortBy fst
    |> List.map (snd >> List.sort)
    |> List.concat

let grade (number: int) (school: School): string list =
    school
    |> Map.toList
    |> List.filter (fun (g, _) -> g = number)
    |> List.map snd
    |> List.concat
