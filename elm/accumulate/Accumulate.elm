module Accumulate (..) where


accumulate accumulator list =
  case list of
    [] ->
      []

    x :: rest ->
      accumulator (x) :: accumulate accumulator rest
