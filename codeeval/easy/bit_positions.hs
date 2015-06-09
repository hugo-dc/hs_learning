import System.Environment (getArgs)
import Data.Char (toLower)

split :: Char -> String -> String -> [[Char]]
split _  acc []     = [acc]
split sp acc (d:ds) | d == sp   = [acc] ++ ( split sp [] ds ) 
                    | otherwise = split sp ( acc ++ [d] ) ds

toBin 0 = [0]
toBin n | n `mod` 2 == 1 = [1] ++ toBin (n `div` 2) 
        | n `mod` 2 == 0 = [0] ++ toBin (n `div` 2) 

calculate [] = []
calculate (x:xs) = equalBit (read number :: Integer) (read p1 :: Int ) (read p2 :: Int) : calculate xs
            where number = spt !! 0
                  p1     = spt !! 1
                  p2     = spt !! 2
                  spt    = split ',' [] x 

equalBit :: Integer -> Int -> Int -> String
equalBit number a b = map toLower $ show ( bits !! ( a - 1 ) == bits !! (b - 1 ) )
    where bits = toBin number

main = do 
    args <- getArgs
    case args of 
        (fi:[]) -> do 
                    content <- readFile fi 
                    let result = calculate (lines content)
                    putStrLn $ reverse $ tail $  reverse ( unlines result )
        _       -> putStrLn "Invalid filename"


