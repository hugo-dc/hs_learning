import System.Environment

rev_cont []     = []
rev_cont (x:xs) = unwords ( reverse ( words x ) ) : rev_cont xs 

main = do
    args <- getArgs
    case args of
        (fi:[]) -> do 
                      content <- readFile fi 
                      let rln = unlines $ rev_cont ( lines content )
                      putStr $ reverse ( tail ( reverse rln ) )
        _       -> putStrLn "Please provide a valid filename"

