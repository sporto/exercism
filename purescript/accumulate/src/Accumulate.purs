module Accumulate
  ( accumulate
  ) where

import Data.List as List
import Data.Maybe (Maybe(..))

fold :: forall a b. (a -> b) -> List.List b -> List.List a -> List.List b
fold fn target source =
  case List.uncons source of
    Nothing ->
      target

    Just { head, tail } ->
      fold fn (List.snoc target (fn head)) tail

accumulate :: forall a b. (a -> b) -> List.List a -> List.List b
accumulate nf list =
  fold nf (List.fromFoldable []) list