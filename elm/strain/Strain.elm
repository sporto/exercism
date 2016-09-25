module Strain (..) where


keep fn list =
  let
    update v acc =
      if fn v then
        v :: acc
      else
        acc
  in
    list
      |> List.foldl update []
      |> List.reverse


discard fn list =
  keep (fn >> not) list
