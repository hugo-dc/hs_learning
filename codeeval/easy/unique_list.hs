import System.Environment

split :: Char -> String -> String -> [[Char]]
split _  acc []     = [acc]
split sp acc (d:ds) | d == sp   = [acc] ++ ( split sp [] ds ) 
                    | otherwise = split sp ( acc ++ [d] ) ds

result []     = []
result (x:xs) = format ( show ( unique x ) ) : result xs  

format = reverse . tail . reverse . tail

unique str = getUnique xs []
    where xs = split ',' [] str

getUnique []     acc = acc
getUnique (x:xs) acc | elem y acc = getUnique xs acc
                     | otherwise  = getUnique xs nAcc
          where nAcc = acc ++ [y] 
                y    = read x :: Integer

main = do 
    args <- getArgs
    case args of 
        (fi: []) -> do 
                        content <- readFile fi
                        putStr $ reverse $ tail $ reverse $ unlines $ result $ lines content 
        _        -> putStrLn "Provide a valid filename"




