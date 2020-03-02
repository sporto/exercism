module WordCount
  ( wordCount
  ) where

import Prelude
import Data.Array as Array
import Data.Foldable as Foldable
import Data.Map as Map
import Data.Maybe
import Data.String as String
import Data.String.Regex as Regex
import Data.String.Regex.Flags as RegexFlags
import Data.String.Regex.Unsafe

wordCount :: String -> Map.Map String Int
wordCount phrase =
  phrase
    # String.toLower
    # String.replaceAll (String.Pattern ",") (String.Replacement " ")
    # Regex.replace (unsafeRegex "[^\\w\\s\\d']" RegexFlags.global) ""
    # String.split (String.Pattern " ")
    # Array.mapMaybe cleanWord
    # Foldable.foldl addWord Map.empty

cleanWord :: String -> Maybe String
cleanWord word =
  let
    nextWord =
      word
        # String.trim
        # stripPrefix_ "'"
        # stripSuffix_ "'"
  in
  if String.null nextWord then
    Nothing
  else
    Just nextWord

stripPrefix_ pattern word =
  String.stripPrefix (String.Pattern pattern) word
    # fromMaybe word

stripSuffix_ pattern word =
  String.stripSuffix (String.Pattern pattern) word
    # fromMaybe word

addWord :: Map.Map String Int -> String -> Map.Map String Int
addWord acc word =
  Map.alter
    (\v ->
      case v of
        Nothing ->
          Just 1
        Just count ->
          Just (count + 1)
    )
    word
    acc