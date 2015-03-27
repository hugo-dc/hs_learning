
length' :: [a] -> Int
length' []     = 0
length' (x:xs) = 1 + ( length' xs )

null' :: [a] -> Bool
null' [] = True
null' _  = False

head' :: [a] -> a
head' [] = error "empty list"
head' xs = xs !! 0 

tail' :: [a] -> [a]
tail' (x:xs) = xs

last' :: [a] -> a
last' xs = xs !! ((length' xs) - 1 ) 

init' :: [a] -> [a]
init' []         = error "empty list"
init' (x:xs)     | ( length' xs  ) == 1 = [x]
                 | otherwise            = x : (init' xs)
