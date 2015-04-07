-- ch04/Transpose.hs
-- Write a program that transposes the text in a file. For instance, it should
-- convert:
-- "hello\nworld\n" to "hw\neo\nlr\nll\nod\n"

import System.Environment (getArgs)

transpose inputFile = do
    input <- readFile inputFile
    let content = lines input
    transposeLines 0 content

transposeLines :: Int -> [[Char]] -> IO ()
transposeLines c x  = do 
                        let heads  = getHeads c x
                            maxLen = getMaxLength  x
                        putStrLn heads 
                        if (c + 1 ) > maxLen then putStrLn "\n"
                        else  transposeLines ( c + 1 ) x

getMaxLength :: [[Char]] -> Int 
getMaxLength []                  = 0
getMaxLength (x:xs) |  a > b     = a
                    |  a < b     = b
                    |  otherwise = a
                where a = length x
                      b = getMaxLength xs

getHeads :: Int -> [[Char]] -> [Char]
getHeads _ []     = []
getHeads c (x:xs) | ( ( length x )  - 1 ) <  c   =  getHeads c xs 
                  | otherwise                    = x !! c : ( getHeads c xs ) 

main = do
    args <- getArgs
    case args of
        [input] -> transpose input
        _       -> putStrLn "error: exactly one argument needed"

