-- file: ch03/Interspere.hs
intersperse' :: a -> [[a]] -> [a]
intersperse' _ (x:[]) = x 
intersperse' a (x:xs) = x ++ [a] ++ intersperse' a (xs)
intersperse' _ []     = []
