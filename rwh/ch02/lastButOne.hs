-- file: ch02/lastButOne.hs

lastButOne :: [a] -> a
lastButOne x = if length x == 2
               then head x 
               else lastButOne ( tail x) 

