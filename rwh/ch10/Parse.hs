-- file: ch10/Parse.hs
import qualified Data.ByteString.Lazy as L 
import qualified Data.ByteString.Lazy.Char8 as L8
import Data.Int
import PNM
import Data.Word
    
data ParseState = ParseState {
        string :: L.ByteString,
        offset :: Int64         -- imported from Data.Int
    } deriving (Show)

simpleParse :: ParseState -> (a, ParseState)
simpleParse = undefined

betterParse :: ParseState -> Either String (a, ParseState)
betterParse = undefined

newtype Parse a = Parse {
        runParse :: ParseState -> Either String (a, ParseState)
    }

identity :: a -> Parse a 
identity a = Parse (\s -> Right (a, s))

parse :: Parse a -> L.ByteString -> Either String a 
parse parser initState 
    = case runParse parser (ParseState initState 0) of 
        Left err          -> Left err 
        Right (result, _) -> Right result

modifyOffset :: ParseState -> Int64 -> ParseState
modifyOffset initState newOffset = 
    initState { offset = newOffset }

parseByte :: Parse Word8
parseByte = 
    getState ==> \initState ->
    case L.uncons (string initState) of 
        Nothing -> 
            bail "no more input"
        Just (byte, reminder) -> 
            putState newState ==> \_ ->
            identity byte
          where newState = initState { string = remainder,
                                       offset = newOffset }
                newOffset = offset initState + 1
