-- file: ch07/return2.hs
import Data.Char(toUpper)    

isYes :: String -> Bool
isYes inpStr = (toUpper . head $ inpStr) == 'Y'

isGreen :: IO Bool
isGreen = 
    do putStr "is green your favorite color?"
       inpStr <- getLine
       return (isYes inpStr)
