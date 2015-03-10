1. Enter the following expressions into ghci. What are their types?

* 5 + 8       :: Num a => a 
* 3 * 5 + 8   :: Num a => a
* 2 + 4       :: Num a => a
* (+) 2 4     :: Num a => a
* sqrt 16     :: Floating a => a
* succ 6      :: ( Num a, Enum a) => a
* succ 7      :: ( Num a, Enum a) => a
* pred 9      :: ( Num a, Enum a) => a
* pred 8      :: ( Num a, Enum a) => a
* sin (pi/2)  :: Floating a => a
* truncate pi :: Integral b => b
* round pi    :: Integral b => b
* round 3.5   :: Integral b => b
* round 3.4   :: Integral b => b
* floor 3.7   :: Integral b => b
* ceiling 3.3 :: Integral b => b

2. From ghci, type :? to print some help. Define a variable, such as let x = 1,
   and then type :show bindings. What do you see?

Command :? shows help
:show bindings shows the type of It (the evaluated sentence), and shows the
type of x, the type of the sentence without being evaluated, a more general type.

3. The words function counts the number of words in a string. Modify WC.hs
   example in order to count the number of words in a file

```haskell
main = interact wordCount
    where wordCount input = show(length (words input)) ++ "\n" -- Ex03
--    where wordCount input = show (length (lines input)) ++ "\n"
```

4. Modify the WC.hs example again, in order to print the number of characters
   in a file:

```haskell
main = interact charCount 
    where charCount input = show(length input) ++ "\n" -- Ex04
--    where wordCount input = show(length (words input)) ++ "\n" -- Ex03
--    where wordCount input = show (length (lines input)) ++ "\n"
```

