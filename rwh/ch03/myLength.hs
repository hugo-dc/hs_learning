-- file: ch03/myLength.hs
myLength :: [a] -> Int
myLength []     = 0
myLength (x:xs) = 1 + myLength xs 
