-- A palindromic number reads the same both ways. The largest palindrome made 
-- from the product of two 2-digit numbers is 9009 = 91 × 99.
-- Find the largest palindrome made from the product of two 3-digit numbers.
--

result :: Integer
result = maximum $ filter isPal [a*b | a <- [999,998..100] , b <- [999,998..1]] 
    where isPal x = show x == reverse ( show x )

main :: IO ()
main = putStrLn $ show result








