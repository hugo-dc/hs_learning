-- file: ch03/mean.hs
mean :: (Fractional a) => [a] -> a
mean xs  =  sum xs   / fromIntegral (length xs )
