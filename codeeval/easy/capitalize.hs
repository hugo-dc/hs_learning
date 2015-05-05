import System.Environment
import Data.Char


capitalize :: [String] -> [String]
capitalize []     = []
capitalize (x:xs) = unwords ( map capWord ( words x ) ) : capitalize xs 
    where capWord (d:ds) = toUpper d : ds   

main = do
    args <- getArgs
    case args of 
        (fi:[]) -> do 
                    content <- readFile fi
                    let result = unlines $ capitalize (  lines content )
                    putStr $ reverse ( tail ( reverse result ) )
        _       -> putStrLn "Invalid filename"
