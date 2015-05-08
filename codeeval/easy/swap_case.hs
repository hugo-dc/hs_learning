import System.Environment
import Data.Char (toLower, toUpper, isUpper, isLower)


calculate :: [String] -> [String]
calculate []     = []
calculate (x:xs) = unwords ( map swap ( words x ) ) : calculate xs
    where swap []     = []
          swap (y:ys) | isUpper y = toLower y : swap ys 
                      | isLower y = toUpper y : swap ys
                      | otherwise = y : swap ys

main = do
    args <- getArgs
    case args of 
        (fi:[]) -> do
                    content <- readFile fi
                    let result = unlines $ calculate $ lines content
                    putStr $ reverse $ tail $ reverse result
        _       -> putStrLn "Provide a valid filename"
