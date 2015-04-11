-- file: ch04/exercises.hs

import Data.List (foldl')
import Data.Char (digitToInt)


-- Write your own “safe” definitions of the standard partial list functions, but make
-- sure they never fail. As a hint, you might want to consider using the following types:

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead xs = Just ( xs !! 0 )

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (x:xs) | null xs = Nothing
                | otherwise = Just xs

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast xs = Just ( head ( reverse xs ) )

safeInit :: [a] -> Maybe [a]
safeInit [] = Nothing
safeInit xs = Just ( reverse ( drop 1 ( reverse xs ) ) )  

-- Write a function splitWith that acts similarly to words but takes a predicate and a
-- list of any type, and then splits its input list on every element for which the predicate
-- returns False

-- There is a simpler way to do this
splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith f []     = []
splitWith f (x:xs) | ( f x )   = splitWith f xs
                   | otherwise = ( x : getL f xs ) : splitWith f ( rest f xs )
                   where getL _ []     = [] 
                         getL f (y:ys) | f y       = []  
                                       | otherwise = y : ( getL f ys )   
                         rest _ []     = []
                         rest f (y:ys) | f y       = ys 
                                       | otherwise = rest f ys

-- Use a fold (choosing the appropriate fold will make your code much simpler) to
-- rewrite and improve upon the asInt function from the earlier section“Explicit Recursion”
-- on page 85.
--

asInt_fold :: String -> Int
asInt_fold []     = 0
asInt_fold (x:xs) | x == '-' = ( foldit xs ) * (-1)  
                  | otherwise = foldit (x:xs)
        where foldit []  = 0 
              foldit ys  = foldl' step 0 ys
              step acc y = acc * 10 + (digitToInt y)

-- Write your own definition of concat using foldr
myConcat :: [[a]] -> [a]
myConcat xs = foldr (++) [] xs

-- Write your own definition of the standard takeWhile function, first using explicit
-- recursion, and then foldr.
--
-- explicit Recursion
myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile _ []                 = []
myTakeWhile f (x:xs) | f x       = x : ( myTakeWhile f xs)  
                     | otherwise = [] 
-- foldr
myTakeWhile' :: (a -> Bool) -> [a] -> [a]
myTakeWhile' f xs = foldr step [] xs
    where step x acc | f x       = x : acc
                     | otherwise = []


-- The Data.List module defines a function, groupBy, which has the following type:
-- groupBy :: (a -> a -> Bool) -> [a] -> [[a]]
-- Use ghci to load the Data.List module and figure out what groupBy does, then
-- write your own implementation using a fold.
groupBy :: (a -> a -> Bool) -> [a] -> [[a]]
groupBy _ []  = []
groupBy f xs = foldr step [] xs
    where step x []  = [[x]]
          step x acc | f x ( head ( head acc ) ) = ( x : head acc ) : ( tail ( acc ) ) 
                     | otherwise                 = [x] : acc




-- How many of the following Prelude functions can you rewrite using list folds?

-- any 
any_l :: (a -> Bool ) -> [a] -> Bool  
any_l f xs = foldl' step False xs 
    where step acc x | acc       = acc
                     | otherwise = f x 

any_r :: (a -> Bool ) -> [a] -> Bool  
any_r f xs = foldr step False xs
    where step x acc | acc = acc
                     | otherwise = f x 
-- cycle
cycle_l :: [a] -> [a] 
cycle_l xs = ( foldl' step [] xs ) ++ cycle_l xs 
    where step acc x = acc ++ [x]

cycle_r :: [a] -> [a] 
cycle_r xs = ( foldr step [] xs )  ++ cycle_r xs 
    where step x acc = x : acc 

-- words
words_l :: String -> [String]
words_l xs = foldl step [] xs 
    where step [] x  = [[x]]
          step acc x | x == ' '  = acc ++ [[]]
                     | otherwise = init acc ++ [( last acc ) ++ [x] ]

words_r :: String -> [String]
words_r xs = foldr step [] xs 
    where step x []  = [[x]] 
          step x acc | x == ' '  = [[]] ++ acc 
                     | otherwise = [x : ( head acc ) ] ++ ( tail acc ) 


-- Test
-- foldr (s) [] ('h':'e':' ':'w')
--           == 'h' s                        foldr (s) [] ('e':' ':'w':[])
--           == 'h' s ( 'e' s                foldr (s) [] (' ':'w':[]) 
--           == 'h' s ( 'e' s ( ' '          foldr (s) [] ('w':[])
--           == 'h' s ( 'e' s ( ' ' s ( 'w' foldr (s) [] []))
--           == 'h' s ( 'e' s ( ' ' s ( s 'w' [] )
--           == 'h' s ( 'e' s ( s ' ' [['w']] ) 
--           == s 'h' ( s 'e' [[], ['w']] )
--           == s 'h' ( [['e'], ['w']]
--
--           == [['h', 'e'], ['w']


-- unlines
unlines_l :: [String] -> String
unlines_l [] = ""
unlines_l xs = ( foldl' step [] xs ) ++ "\n"
    where step [] x = x 
          step acc x = acc ++ ['\n'] ++ x


unlines_r :: [String] -> String
unlines_r [] = ""
unlines_r xs = ( foldr step [] xs ) ++ "\n"
    where step x []  = x 
          step x acc = x ++ "\n" ++ acc





