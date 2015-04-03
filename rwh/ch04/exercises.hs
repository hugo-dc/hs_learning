-- file: ch04/exercises.hs
-- Write your own “safe” definitions of the standard partial list functions, but make
-- sure they never fail. As a hint, you might want to consider using the following types:

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead xs = Just ( xs !! 0 )

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (x:xs) | null xs = Nothing
                | otherwise = Just xs

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast xs = Just ( head ( reverse xs ) )

safeInit :: [a] -> Maybe [a]
safeInit [] = Nothing
safeInit xs = Just ( reverse ( drop 1 ( reverse xs ) ) )  

-- Write a function splitWith that acts similarly to words but takes a predicate and a
-- list of any type, and then splits its input list on every element for which the predicate
-- returns False

-- There is a simpler way to do this
splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith f []     = []
splitWith f (x:xs) | ( f x )   = splitWith f xs
                   | otherwise = ( x : getL f xs ) : splitWith f ( rest f xs )
                   where getL _ []     = [] 
                         getL f (y:ys) | f y       = []  
                                       | otherwise = y : ( getL f ys )   
                         rest _ []     = []
                         rest f (y:ys) | f y       = ys 
                                       | otherwise = rest f ys
