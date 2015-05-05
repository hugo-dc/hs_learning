import System.Environment 

calculate :: [String] -> [String]
calculate []     = []
calculate (x:xs) = show (fibo ( read x :: Int )) : calculate xs

fibo :: Int -> Int
fibo 0 = 0
fibo 1 = 1
fibo n = fibo ( n - 1) + fibo ( n - 2)

main = do
    args <- getArgs
    case args of 
        (fi:[]) -> do 
                    contents <- readFile fi
                    let result = calculate $ lines contents
                    putStr $ reverse ( tail (  reverse ( unlines result )) )
        _       -> putStrLn "Invalid filename"
