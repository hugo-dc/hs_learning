-- file: ch03/Direction.hs
data Direction = DLeft
               | DRight
               | DStraight
                 deriving (Show)

type Point = (Int, Int) 

getTurn :: Point -> Point -> Point -> Direction
getTurn a b c   
