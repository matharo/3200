myDouble :: Num a => a -> a
myDouble x = x + x

myQuadruple :: Num a => a -> a
myQuadruple x = myDouble (myDouble x)

myFactorial n = product [1..n]

myAverage ns = sum ns `div` length ns

--take in a list and return an int
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs
