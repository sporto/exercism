module GradeSchool (..) where

import Set


type alias Student =
  { grade : Int
  , name : String
  }


type alias Model =
  List Student


empty : Model
empty =
  []


addStudent : Int -> String -> Model -> Model
addStudent grade name model =
  let
    student =
      Student grade name
  in
    student :: model


studentsInGrade : Int -> Model -> List String
studentsInGrade grade model =
  List.filter (\s -> s.grade == grade) model
    |> List.map .name
    |> List.sort


allStudents : Model -> List ( Int, List String )
allStudents model =
  List.map .grade model
    |> Set.fromList
    |> Set.toList
    |> List.map (\grade -> ( grade, studentsInGrade grade model ))
