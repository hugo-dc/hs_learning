-- file: ch07/return3.hs
returnTest :: IO ()
returnTest = 
    do one <- return 1
       let two = 1
       putStrLn $ show ( 1 + 2)
