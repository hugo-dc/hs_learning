import System.Environment (getArgs)
import Data.Char (toUpper)

calculate :: [String] -> [String]
calculate []     = []
calculate (x:xs) = ( applyMask word bmask ) : calculate xs
    where ( word, smask ) = ( sp !! 0   ,  sp !! 1 )
          bmask = [ x == '1' | x <- smask ]
          sp = words x
          applyMask []       _       = []
          applyMask  _       []      = []
          applyMask (y:ys) (True:ws) = toUpper y : applyMask ys ws 
          applyMask (y:ys) (False:ws)= y : applyMask ys ws
            
normalize :: [String] -> String
normalize = reverse . tail . reverse . unlines 

main = do 
    args <- getArgs 
    case args of 
        (fi:[]) -> do 
                        contents <- readFile fi
                        let result = normalize $ calculate ( lines contents )
                        putStrLn result
        _       -> putStrLn "Provide a valid file name"
