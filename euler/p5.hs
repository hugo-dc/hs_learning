
-- 2520 is the smallest number that can be divided by each of the numbers from 1 to 
-- 10 without any remainder.

-- What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20? 

-- IT TAKES A LOT OF TIME!!!
result x = head [a | a <- [x..], a `step` x ] 
        where step y top = not $ any (/=0) ( getMods y top )
              getMods z 0   = []
              getMods z top = mod z top : getMods z ( top - 1 )

main = putStrLn $ show ( result 20 )

-- Found this amazing answer in Haskell:
-- foldl (lcm) 1 [1..20]
