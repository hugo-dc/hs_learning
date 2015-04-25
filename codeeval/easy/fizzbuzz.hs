-- fizzbuzz

fizzbuzz :: Integer -> Integer -> Integer -> [String]
fizzbuzz x y n = [ divi a | a <-[1..n] ]  
    where divi z | ( mod z x == 0 ) && ( mod z y == 0 ) = "FB"
                 | ( mod z x == 0 )                     = "F"
                 | ( mod z y == 0 )                     = "B"
                 | otherwise                            = show z 

calculate :: [String] -> [String]
calculate []     = []
calculate (d:ds) = unwords ( trim f : fs  )  : calculate ds  
   where (f:fs)  = fizzbuzz x y n
         ( x , y , n) = ( read ( w !! 0 ) :: Integer , 
                          read ( w !! 1 ) :: Integer , 
                          read ( w !! 2 ) :: Integer )
         w            = words d

trim :: String -> String
trim []     = ""
trim (x:xs) | x == ' '  = trim xs
            | otherwise = x : (trim xs) 


main = do
    rd <- getContents 
    let content = lines rd 
    
    let out  = calculate content 
--    writeFile "fz_output" (tail ( foldl (\x y -> x ++ "\n" ++ y ) "" out ) ++ "\n")
    putStr (tail ( foldl (\x y -> x ++ "\n" ++ y ) "" out ) )


