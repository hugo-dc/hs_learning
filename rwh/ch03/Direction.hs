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

-- Thre points are a counter-clockwise turn if ccw > 0, clockwise if ccw < 0
-- and collinear if ccw = 0 because ccw is a determinant that gives twice the
-- signed area of the triangle formed by a, b and c
ccw :: Point -> Point -> Point -> Int
ccw (ax, bx) (bx, by) (cx, cy) = (bx - ax) * (cy - ay) - (by - ay) * (cx - ax)

n = 3
--points = [a,b,c]

point1 :: [Point] -> Point
point1 points = getLowest y points

getLowest 


