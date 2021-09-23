type allergen = Eggs
              | Peanuts
              | Shellfish
              | Strawberries
              | Tomatoes
              | Chocolate
              | Pollen
              | Cats

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

let allergic_to score allergen =
    let bit = allergen_bit allergen in
    (score land (1 lsl (bit - 1))) > 0

let allergies score =
    allergens
    |> List.filter_map (fun a ->
        if allergic_to score a then
            Some a
        else
            None
    )
