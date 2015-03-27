-- file: ch04/exercises.hs
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
