module Allergies

open System

type Allergen =
    | Eggs
    | Peanuts
    | Cats
    | Pollen
    | Tomatoes
    | Chocolate
    | Strawberries
    | Shellfish

let allergen_bit allergen =
    match allergen with
    | Eggs -> 1
    | Peanuts -> 2
    | Shellfish -> 3
    | Strawberries -> 4
    | Tomatoes -> 5
    | Chocolate -> 6
    | Pollen -> 7
    | Cats -> 8

let allergens = [
    Eggs;
    Peanuts;
    Shellfish;
    Strawberries;
    Tomatoes;
    Chocolate;
    Pollen;
    Cats;
]

let allergicTo codedAllergies allergen =
    let bit = allergen_bit allergen in
    (codedAllergies &&& (1 <<< (bit - 1))) > 0

let list codedAllergies =
    allergens
    |> List.choose (fun a ->
        if allergicTo codedAllergies a then
            Some a
        else
            None
    )

