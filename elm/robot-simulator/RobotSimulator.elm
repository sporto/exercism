module RobotSimulator (..) where

import String


type Bearing
  = North
  | East
  | West
  | South


type alias Coordinates =
  { x : Int
  , y : Int
  }


type alias Robot =
  { bearing : Bearing
  , coordinates : Coordinates
  }


defaultRobot : Robot
defaultRobot =
  Robot North { x = 0, y = 0 }


turnRight : Robot -> Robot
turnRight robot =
  case robot.bearing of
    North ->
      { robot | bearing = East }

    East ->
      { robot | bearing = South }

    South ->
      { robot | bearing = West }

    West ->
      { robot | bearing = North }


turnLeft : Robot -> Robot
turnLeft robot =
  case robot.bearing of
    North ->
      { robot | bearing = West }

    West ->
      { robot | bearing = South }

    South ->
      { robot | bearing = East }

    East ->
      { robot | bearing = North }


advance : Robot -> Robot
advance robot =
  let
    coordinates =
      robot.coordinates

    x =
      coordinates.x

    y =
      coordinates.y

    newCoor =
      case robot.bearing of
        North ->
          { coordinates | y = y + 1 }

        East ->
          { coordinates | x = x + 1 }

        South ->
          { coordinates | y = y - 1 }

        West ->
          { coordinates | x = x - 1 }
  in
    { robot | coordinates = newCoor }


update : String -> Robot -> Robot
update action robot =
  case action of
    "L" ->
      turnLeft robot

    "R" ->
      turnRight robot

    "A" ->
      advance robot

    _ ->
      robot


simulate : String -> Robot -> Robot
simulate sequence robot =
  String.split "" sequence
    |> List.foldl update robot
