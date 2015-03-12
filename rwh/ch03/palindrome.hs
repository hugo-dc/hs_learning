-- file: ch03/palindrome.hs
toPal :: [a] -> [a]
toPal xs = xs ++ ( reverse xs )

isPal :: (Eq a) => [a] -> Bool
isPal xs | xs == ( reverse xs )  = True
isPal _                          = False

