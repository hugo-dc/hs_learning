-- Multiplication Tables

getTables :: Integer -> [Integer]
getTables n = [ x * y | x <- [1..n] , y <- [1..n]]

printTables :: Integer -> Integer -> [Integer] -> IO ()
printTables _ _ []     = putStr ""
printTables n c (x:xs) = do 
                    putStr $ format 4 x  
                    if c == n 
                        then 
                            do 
                              putStr "\n"
                              printTables n 1 xs
                        else 
                            do putStr ""
                               printTables n ( c + 1) xs

format :: Int -> Integer -> String
format w v | length st < 4 = take ( w - length st ) ( repeat ' ' ) ++ st 
           | otherwise     = st
    where st = show v

main = do 
    let tables = getTables 12
    printTables 12 1 tables
