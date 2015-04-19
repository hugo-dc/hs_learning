-- The four adjacent digits in the 1000-digit number that have the greatest product 
-- are 9 × 9 × 8 × 9 = 5832.
--
-- Find the thirteen adjacent digits in the 1000-digit number that have the greatest 
-- product. What is the value of this product?
--
import Data.Char (digitToInt)
import Data.List (foldl')

getResult :: IO Int
getResult = do 
                f <- readFile "p8.txt"
                let ls = lines f
                    content = foldl' (++) [] ls
                return $ getMax content


getMax :: [Char] -> Int
getMax []     = 0
getMax (x:xs) = max ( foldl' (*) 1 ( take 13 ys ) ) (getMax xs) 
     where ys = map digitToInt (x:xs) 


main = do 
   result <- getResult
   putStrLn $ show result
