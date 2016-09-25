module Allergies (..) where


allergies : List ( Int, String )
allergies =
  [ ( 0, "eggs" )
  , ( 1, "peanuts" )
  , ( 2, "shellfish" )
  , ( 3, "strawberries" )
  , ( 4, "tomatoes" )
  , ( 5, "chocolate" )
  , ( 6, "pollen" )
  , ( 7, "cats" )
  ]


isAllergicTo : String -> Int -> Bool
isAllergicTo allergy score =
  toList score
    |> List.any (\a -> a == allergy)


accumulator ( allergyScore, allergyName ) ( score, lst ) =
  let
    allergyScore' =
      2 ^ allergyScore

    score' =
      if score >= (allergyScore' * 2) then
        score - (allergyScore' * 2)
      else
        score
  in
    if score' >= allergyScore' then
      ( score' - allergyScore', allergyName :: lst )
    else
      ( score', lst )


toList : Int -> List String
toList score =
  List.foldr accumulator ( score, [] ) allergies
    |> snd
