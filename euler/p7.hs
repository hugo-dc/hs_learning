-- By listing the first six prime numbers: 
-- 2, 3, 5, 7, 11, and 13 
--
-- we can see that the 6th prime is 13.
--
-- What is the 10001st prime number?
--
isPrime :: Integer -> Bool 
isPrime 1 = True
isPrime 2 = True
isPrime n | length (mods n) == 2 =  False
          | otherwise            =  True 
    where mods y = take 2 $ [ x | x <- [1..(y-1)], (mod y x ) == 0]
          

result :: Integer
result = [x | x <- [1..], isPrime x] !! 10001

main = putStrLn $ show result
