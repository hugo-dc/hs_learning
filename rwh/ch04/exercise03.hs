-- file: ch04/exercise03.hs
-- Write a program that prints the first word of each line of its input

import System.Environment (getArgs)

firstWord inputFile = do 
    input <- readFile inputFile
    let content = lines input
    printWords content

printWords []     = putStr ""
printWords (x:xs) | null (words x) = do 
                                        printWords xs
                  | otherwise      =  do
                                        putStrLn  $ head ( words x ) 
                                        printWords xs
    

main = do 
    args <- getArgs
    case args of 
        [input]         -> firstWord input 
        _               -> putStrLn "error: exactly one arguments needed"
