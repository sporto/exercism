module ListOps (..) where


length : List number -> number
length =
  foldl (\_ acc -> acc + 1) 0


reverse : List a -> List a
reverse =
  foldl (::) []


map : (a -> b) -> List a -> List b
map op =
  let
    op' v acc =
      op v :: acc
  in
    foldr op' []


filter : (a -> Bool) -> List a -> List a
filter op =
  let
    op' v acc =
      if op v then
        v :: acc
      else
        acc
  in
    foldr op' []


foldl : (a -> b -> b) -> b -> List a -> b
foldl op initial lst =
  case lst of
    [] ->
      initial

    x :: xs ->
      foldl op (op x initial) xs


foldr : (a -> b -> b) -> b -> List a -> b
foldr op initial lst =
  foldl op initial (reverse lst)


append : List a -> List a -> List a
append lst1 lst2 =
  foldl (::) (reverse lst1) lst2
    |> reverse


concat : List (List a) -> List a
concat =
  foldr append []
