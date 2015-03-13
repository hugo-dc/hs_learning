-- file: ch03/Direction.hs
data Direction = DLeft
               | DRight
               | DStraight
                 deriving (Show)

type Point = (Int, Int) 

getTurn :: Point -> Point -> Point -> Direction
getTurn (ax, ay) (bx, by) (cx, cy) = if cx < bx 
                                     then DLeft
                                     else if ax == bx && bx == cx 
                                          then DStraight
                                          else DRight

getListTurn :: [Point] -> [Direction]
getListTurn (a:b:c:xs) = ( getTurn a b c ) : ( getListTurn xs )
getListTurn _          = []
