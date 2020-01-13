module HelloWorld where

import Prelude
import Data.Maybe

helloWorld maybe =
  let
    name =
      case maybe of
        Nothing ->
          "World"
        Just name ->
          name
  in
  "Hello, " <> name <> "!"
