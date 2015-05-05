import System.Environment


calculate :: [String] -> Integer
calculate xs = foldl sumList 0 xs
    where sumList acc y = ( read y :: Integer ) + acc  

main = do 
    args <- getArgs
    case args of
        (fi:[]) -> do 
                    content <- readFile fi 
                    let result = calculate $ lines content
                    putStr $ show result
        _       -> putStrLn "Invalid filename"
