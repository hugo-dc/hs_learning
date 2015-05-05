import Data.Char (toLower)
import System.Environment

fileTLC :: [String] -> [String]
fileTLC []     = [] 
fileTLC (x:xs) = ( map toLower x ) : fileTLC xs 

main = do
    args <- getArgs
    case args of 
        (fi:[]) -> do
                    content <- readFile fi
                    let result = fileTLC ( lines content )
                    putStr $  reverse ( tail ( reverse ( unlines result ) ) )
        _       -> putStrLn "Please provide a valid file name"
