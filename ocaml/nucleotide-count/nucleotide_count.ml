open Base

let empty = Map.empty (module Char)

let valid_chars = ['A';'C';'G';'T']

let is_valid c =
  List.exists valid_chars ~f:(Char.equal c)

let count_nucleotide (s:string) (wanted_char:char) =
  if is_valid wanted_char then
    String.to_list_rev s
      |> List.fold_result ~init:0 ~f:(fun acc c ->
          if is_valid c then
            if Char.equal c wanted_char then
              Ok (acc + 1)
            else
              Ok acc
          else
            Error c
      )
  else
    Error wanted_char

let count_nucleotides s =
    valid_chars
    |> List.fold_result ~init:empty ~f:(fun acc valid_char ->
        count_nucleotide s valid_char
        |> Result.map ~f:(fun count ->
          Map.set ~key:valid_char ~data:count acc
        )
      )
    |> Result.map ~f:(Map.filter ~f:(fun v -> v > 0))
