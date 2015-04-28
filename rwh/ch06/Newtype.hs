-- file: chc06/Newtype.hs
newtype UniqueID = UniqueID Int
    deriving (Eq)


data DataInt = D Int
    deriving (Eq, Ord, Show)

newtype NewtypeInt = N Int
    deriving (Eq, Ord, Show)


