import System.Environment
import System.IO

main = do
   args <- getArgs
   case args of
    (fi:[]) -> do
                h <- openFile fi ReadMode
                size <- hFileSize h
                hClose h
                putStr $ show size
    _       -> putStr "Provide a valid filename"

