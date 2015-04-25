-- fizzbuzz

fizzbuzz :: Integer -> Integer -> Integer -> [String]
fizzbuzz x y n = [ divi a | a <-[1..n] ]  
    where divi z | ( mod z x == 0 ) && ( mod z y == 0 ) = "FB "
                 | ( mod z x == 0 )                     = "F  "
                 | ( mod z y == 0 )                     = "B  "
                 | otherwise                            = format ( show z )

          format z | length z < 3 = format ( z ++ " " ) 
                   | otherwise    = z 

calculate :: [String] -> [String]
calculate []     = []
calculate (d:ds) = unwords ( fizzbuzz x y n )  : calculate ds  
   where ( x , y , n) = ( read ( w !! 0 ) :: Integer , 
                          read ( w !! 1 ) :: Integer , 
                          read ( w !! 2 ) :: Integer )
         w            = words d



main = do
    rd <- getContents --readFile "fz_input.txt"
    let content = lines rd 
    let out     = calculate content 
--    writeFile "fz_output" (tail ( foldl (\x y -> x ++ "\n" ++ y ) "" out ) ++ "\n")
    putStrLn (tail ( foldl (\x y -> x ++ "\n" ++ y ) "" out ) ++ "\n")

