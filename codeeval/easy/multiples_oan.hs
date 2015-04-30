import System.Environment

split :: Char -> String -> String -> [[Char]]
split _  acc []     = [acc]
split sp acc (d:ds) | d == sp   = [acc] ++ ( split sp [] ds ) 
                    | otherwise = split sp ( acc ++ [d] ) ds

process [] = []
process (y:ys) = show ( head ( take 1 [s | s <- [n,(n*2)..], s > x] )) : process ys 
    where (x,n) = (read ( spt !! 0 ) :: Integer , read ( spt !! 1 ) :: Integer ) 
          spt   = split ',' [] y

main = do
    args <- getArgs
    case args of
      (fi:[]) -> do 
                    content <- readFile fi 
                    let result = unlines $ ( process ( lines content ))
                    putStr $ reverse ( tail ( reverse result ) )
      _       -> putStrLn "Please provide a valid filename"

