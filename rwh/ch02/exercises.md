
----------------------------------------------------------

1. What are the types of the following expressions?

* False :: Bool
* (["foo", "bar"], 'a') :: ([[Char]], Char)
* [(True, []), (False, [['a']])] :: [(Bool, [[Char]])]

----------------------------------------------------------

1. Haskell provides a standard function, `last :: [a] -> a`, that 
returns the last element of a list. From reading the type alone, 
what are the possible valid behaviors (omitting crashes and 
infinite loops) that this function could have? What are a few 
things that this function clearly cannot do?

* It cannot return the last element of an emtpy list
* It cannot receive a list of Ints and return a Char

2. Write a function, `lastButOne` that returns the element _before_ the last.

3. Load your lastButOne function into ghci and try it out on lists of different lengths. What happens when you pass it a list that’s too short? 

Raise exception

