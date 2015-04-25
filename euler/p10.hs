-- The sum of the primes below 10 is 
--
-- 2 + 3 + 5 + 7 = 17.
-- 
-- Find the sum of all the primes below two million.
--
isPrime :: Integer -> Bool 
isPrime 1 = True
isPrime 2 = True
isPrime n | length (mods n) == 2 =  False
          | otherwise            =  True 
    where mods y = take 2 $ [ x | x <- [1..(y-1)], (mod y x ) == 0]

numbers = [2] ++ [3,5..2000000]

result = sum [x | x <- numbers, isPrime x]

main = putStrLn $ show result
