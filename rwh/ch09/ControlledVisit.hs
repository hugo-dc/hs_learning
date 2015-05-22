-- file: ch09/ControlledVisit.hs
traverseVerbose order path = do 
    names <- getDirectoryContents path 
    let usefulNames = filter (`notElem` [".", ".."]) names
    contents <- mapM getEntryName ("":usefulNames)
    recursiveContents <- mapM recurse (order contents)
    return (concat recursiveContents)
  where getEntryName name = getInfo (path </> name)
        isDirectory info = case infoPerms info of 
                            Nothing -> False 
                            Just perms -> searchable perms 
        recurse info = do 
            if isDirectory info && infoPath info /= path 
                 then traverseVerbose order (infoPath info)
                 else return [info]
