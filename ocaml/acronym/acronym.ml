open Base

let acronym input =
    input
    |> String.tr ~target:'-' ~replacement:' '
    |> String.tr ~target:'_' ~replacement:' '
    |> String.split ~on:' '
    |> List.filter ~f:(fun seg -> seg |> String.strip |> String.is_empty |> not)
    |> List.map ~f:(fun s -> String.capitalize s |> Fn.flip String.get 0)
    |> String.of_char_list