
isPrime 1 = True
isPrime 2 = True
isPrime n = null ( take 1 [ x | x <- [(n-1),(n-2)..3], mod n x == 0, odd x ] )  

isPal :: Integer -> Bool
isPal n = s == ( reverse s )
    where s = show n

result = head [ x | x <- [1000,999..1], isPrime x, isPal x] 

main = putStr $ show result
