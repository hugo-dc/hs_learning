import System.Environment
import Data.Char (toUpper,toLower)


calculate :: [String] -> [String]
calculate []     = []
calculate (x:xs) = ( roll x True ) : calculate xs
    where roll [] _     = [] 
          roll (y:ys) b | b  && isL y  = toUpper y : roll ys False 
                        | not b && isL y  = toLower y : roll ys True 
                        | otherwise    = y : roll ys b 
          isL c = elem (toUpper c) ['A'..'Z']

main = do 
    args <- getArgs
    case args of 
        (fi:[]) -> do
                    content <- readFile fi 
                    let result = unlines $ calculate $ lines content
                    putStr $ reverse $ tail $ reverse result
        _       -> putStrLn "Please provide a valid filename"
