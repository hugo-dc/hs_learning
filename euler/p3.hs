-- The prime factors of 13195 are 5, 7, 13 and 29.
-- What is the largest prime factor of the number 600851475143 ?

-- is_prime n = if length [x | x <- [2..n-1], (mod n x) == 0 ] == 0
--	then True
--	else False
			
-- prime_f 1 = [1]			
-- prime_f n =  [x | x <- [2..n], is_prime x, mod n x == 0   ]

-- result = maximum ( take 4 ( prime_f 600851475143 ) )

pFactors n = mul ( factors n ) 1 n

mul (x:xs) acc n | acc >= n = []
                 | otherwise = x : ( mul xs ( acc * x ) n )

factors n = [x | x <- [1..n], ( mod n x ) == 0, x > 1]

result = last ( pFactors 600851475143 ) 


main = putStrLn $ show result


