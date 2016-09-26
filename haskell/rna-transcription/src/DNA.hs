module DNA (toRNA) where

toRNA :: String -> Maybe String
toRNA =
	sequence . map fromChar

fromChar :: Char -> Maybe Char
fromChar c
	| c == 'G' = Just 'C'
	| c == 'C' = Just 'G'
	| c == 'T' = Just 'A'
	| c == 'A' = Just 'U'
	| otherwise = Nothing
