module Clock

let mins_in_day =
    24 * 60

let rec clamp_left num =
    if num >= 0 then num
    else clamp_left (num + mins_in_day)

let clamp_right mins =
    mins % mins_in_day

let clamp =
    clamp_left >> clamp_right

let hours_to_mins hours =
    (hours % 24) * 60

let create hours minutes =
    hours_to_mins hours + minutes |> clamp

let add minutes clock =
    clock + minutes |> clamp

let subtract minutes clock =
    clock - minutes |> clamp

let hours clock =
    clock / 60

let mins clock =
    clock % 60

let display clock =
    sprintf "%02i:%02i" (hours clock) (mins clock)