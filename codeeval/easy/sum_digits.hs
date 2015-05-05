import System.Environment
import Data.Char (digitToInt)

calculate :: [String] -> [String]
calculate []     = []
calculate (x:xs) = show ( sum ys ) : calculate xs
    where ys = map digitToInt x

main = do
    args <- getArgs
    case args of 
        (fi:[]) -> do 
                    contents <- readFile fi
                    let result = unlines $ calculate ( lines contents )
                    putStr $ reverse ( tail ( reverse result ) )
        _       -> putStrLn "Invalida file name"
