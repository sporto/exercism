module RobotSimulator

type Direction = North | East | South | West
type Position = int * int
type Robot = { direction: Direction; position: Position }

let create direction position =
    { direction = direction; position = position }

let turn_right robot =
    let next_direction =
        match robot.direction with
        | North -> East
        | East -> South
        | South -> West
        | West -> North
    in
    { robot with direction = next_direction }

let turn_left robot =
    let next_direction =
        match robot.direction with
        | North -> West
        | West -> South
        | South -> East
        | East -> North
    in
    { robot with direction = next_direction }

let advance robot =
    let (x, y) = robot.position
    let next_position =
        match robot.direction with
        | North -> (x, y + 1)
        | East -> (x + 1, y)
        | South -> (x, y - 1)
        | West -> (x - 1, y)
    in
    { robot with position = next_position }

let rec move_ (instructions: list<char>) robot =
    match instructions with
    | [] -> robot
    | first :: rest ->
        let next_robot =
            match first with
            | 'R' -> turn_right robot
            | 'L' -> turn_left robot
            | 'A' -> advance robot
            | _ -> robot
        in
        move_ rest next_robot

let move instructions robot =
    move_ (Seq.toList instructions) robot
