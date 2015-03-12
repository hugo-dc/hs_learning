1. Write the converse of fromList for the List type: a function that takes
   a List a and generates a [a].

```haskell
toList ( Cons x ( xs ) ) = x : ( toList xs ) 
toList Nil               = []
```

2. Define a tree type that has only one constructor, like our Java example.
   Instead of the Empty constructor, use the Maybe type to refer to
   a node's children

```haskell
data MTree a = MNode a ( Maybe (MTree a) ) (Maybe (MTree a)) 
               deriving (Show)

```

---------------------------------------------------

1. Write a function that computes the number of elements in a list. To test it,
   ensure that it gives the same answars as the standard length function.

```haskell
myLength []     = 0
myLength (x:xs) = 1 + myLength xs 
```
2. Add a type signature for yout function to your source file. To test it, load
   the source file into ghci again

```haskell
myLength :: [a] -> Int
```

3. Write a function that computes the mean of a list, i.e., the sum of all
   elements in the list divided by its length. (You may need to use
   `fromIntegral` function to convert the length of the list from an integer
   into a floating-point number)

```haskell
mean xs  =  sum xs   / fromIntegral (length xs )
```

4. Turn a list into a palindrome; i.e., it should read the same both backward
   and forward. For example, given the list [1,2,3], your function should
   return [1,2,3,3,2,1].

```haskell
toPal :: [a] -> [a]
toPal xs = xs ++ ( reverse xs )
```

5. Write a function that determines whether its input list is palindrome:

```haskell
isPal :: (Eq a) => [a] -> Bool
isPal xs | xs == ( reverse xs )  = True
isPal _                          = False
```

6. Create a function that sorts a list of lists based on the length of each
   sublist. (You may want to look at the sortBy function from the Data.List
   module.)

```haskell
import Data.List

sortList :: [[a]] ->  [[a]]
sortList xs =  sortBy compLength xs 
    where compLength a b 
            | length a == length b = EQ 
            | length a >  length b = GT
            | otherwise            = LT
```

7. Define a function that joins a list of lists together using a separator
   value: 

```haskell
-- file: ch03/Intersperse.hs
intersperse' :: a -> [[a]] -> [a]
intersperse' _ (x:[]) = x 
intersperse' a (x:xs) = x ++ [a] ++ intersperse' a (xs)
intersperse' _ []     = []
```

9. Using the binary tree type that we defined earlier in this chapter, write a function
that will determine the height of the tree. The height is the largest number of hops
from the root to an Empty. For example, the tree Empty has height zero; Node "x"
Empty Empty has height one; Node "x" Empty (Node "y" Empty Empty) has height
two; and so on.

```haskell
treeHeight :: Tree a -> Int 
treeHeight Empty = 0
treeHeight (Node a x y) = 1 + ( treeHeight x ) + ( treeHeight y )
```

10. Consider three two-dimensional points, a, b, and c. If we look at the angle formed
by the line segment from a to b and the line segment from b to c, it turns left, turns
right, or forms a straight line. Define a Direction data type that lets you represent
these possibilities.

```haskell
-- file: ch03/Direction.hs
data Direction = DLeft
               | DRight
               | DStraight
                 deriving (Show)
```

11. Write a function that calculates the turn made by three two-dimensional points
and returns a Direction.


12. Define a function that takes a list of two-dimensional points and computes the
direction of each successive triple. Given a list of points [a,b,c,d,e], it should
begin by computing the turn made by [a,b,c], then the turn made by [b,c,d],
then [c,d,e]. Your function should return a list of Direction.


13. Using the code from the preceding three exercises, implement Graham’s scan algorithm
for the convex hull of a set of 2D points. You can find good description
of what a convex hull (`http://en.wikipedia.org/wiki/Convex_hull`) is, and how the
Graham scan algorithm (`http://en.wikipedia.org/wiki/Graham_scan`) should work,
on Wikipedia (http://en.wikipedia.org/). 


