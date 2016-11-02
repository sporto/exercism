module LeapYear

let isLeapYear year =
    let by4 = year % 4 = 0
    let by100 = year % 100 = 0
    let by400 = year % 400 = 0
    match year with
    | _ when by4 && by100 -> by400
    | _ when by4 -> true
    | _ -> false