
isPrime 1 = True
isPrime 2 = True
isPrime n | even n    = False
          | otherwise = null ( take 1 [ x | x <- [(n-1),(n-2)..3], mod n x == 0, odd x ] )  

result = sum $ take 1000 [x | x <- [2..], isPrime x]

main = putStr $ show result
