module Pangram
  ( isPangram
  ) where

import Prelude
import Data.List as List
import Data.Char (toCharCode)
import Data.Set (Set(..)) as Set
import Data.Function.Pipe
import Data.String (toLower)
import Data.String.CodeUnits (toCharArray)

codes :: Set Number
codes =
  List.range 97 122
    |> Set.fromFoldable

isPangram phrase =
  phrase
    |> toLower
    |> toCharArray
    |> List.fromFoldable
    |> map toCharCode
    |> List.filter (\c -> c >= 97 && c <= 122)
    |> Set.fromFoldable
    |> (==) codes