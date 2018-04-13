myZip :: [a] -> [b] -> [(a,b)]

myZip xs [] = []
myZip [] ys = []

myZip (x:xs) (y:ys) = [(x,y)] ++ (myZip xs ys)

--myZip xs ys = 
-- let pair a b = (a,b)
-- map pair xs ys
