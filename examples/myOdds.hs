myodds :: [a] -> [a]
myodds (x:y:xs) = y : myodds xs

--odd positions, x is pos 0 and y is pos 1
