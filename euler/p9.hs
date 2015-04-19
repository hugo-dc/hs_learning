-- A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

-- a^2 + b^2 = c^2
-- For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

-- There exists exactly one Pythagorean triplet for which a + b + c = 1000.
-- Find the product abc.

result = take 1 [a*b*c | a <- [1..999], b <- [a..999], c <-[b..999], a+b+c == 1000, (a^2 + b^2 ) == c^2]

main = putStrLn $ show ( head result )
