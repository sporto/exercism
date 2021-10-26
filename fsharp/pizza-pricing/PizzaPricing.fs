module PizzaPricing

type Pizza =
    | Margherita
    | Caprese
    | Formaggio
    | ExtraSauce of Pizza
    | ExtraToppings of Pizza

let rec pizzaPrice (pizza: Pizza): int =
    match pizza with
    | Margherita  -> 7
    | Caprese -> 9
    | Formaggio -> 10
    | ExtraSauce piz -> 1 + pizzaPrice piz
    | ExtraToppings piz -> 2 + pizzaPrice piz

let extraFee pizzas =
    match List.length pizzas with
    | 1 -> 3
    | 2 -> 2
    | _ -> 0

let orderPrice(pizzas: Pizza list): int =
    pizzas
    |> List.map pizzaPrice
    |> List.sum
    |> (+) (extraFee pizzas)