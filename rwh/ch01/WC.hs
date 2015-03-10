-- lines beginning with "--" are comments

main = interact charCount 
    where charCount input = show(length input) ++ "\n" -- Ex04
--    where wordCount input = show(length (words input)) ++ "\n" -- Ex03
--    where wordCount input = show (length (lines input)) ++ "\n"
