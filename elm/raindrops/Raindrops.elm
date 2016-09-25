module Raindrops (..) where

import String


raindrops num =
  let
    phrase =
      phraseFor num
  in
    if String.isEmpty phrase then
      toString num
    else
      phrase


primes =
  [ ( 3, "Pling" )
  , ( 5, "Plang" )
  , ( 7, "Plong" )
  ]


phraseFor n =
  primes
    |> List.map (wordFor n)
    |> String.join ""


wordFor num ( divisor, word ) =
  if (num `rem` divisor == 0) then
    word
  else
    ""
