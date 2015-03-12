-- file: ch03/Tree.hs
data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)

simpleTree = Node "parent" (Node "left child" Empty Empty)
                           (Node "right child" Empty Empty)


data MTree a = MNode a ( Maybe (MTree a) ) (Maybe (MTree a)) 
               deriving (Show)


treeHeight :: Tree a -> Int 
treeHeight Empty = 0
treeHeight (Node a x y) = 1 + ( treeHeight x ) + ( treeHeight y )


