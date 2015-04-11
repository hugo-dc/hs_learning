-- file: ch04/asInt.hs
import Data.List (foldl')
import Data.Char (digitToInt)

asInt :: String -> Int
asInt xs = foldl' step 0 xs
    where step acc x = acc * 10 + (digitToInt x)




