-- file: ch03/sortList.hs
import Data.List

sortList :: [[a]] ->  [[a]]
sortList xs =  sortBy compLength xs 
    where compLength a b 
            | length a == length b = EQ 
            | length a >  length b = GT
            | otherwise            = LT

