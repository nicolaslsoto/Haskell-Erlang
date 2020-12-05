module Practice where

import Data.Char

type BinaryRelation a b = [(a, b)]
data Amount = Zero | One | Two
data TrafficColor = Red | Yellow | Green deriving(Eq, Show)
data Entry = Record {name :: String, phone :: Integer, email :: String}
data WindowLayout = Window{wname :: String, width :: Int, height :: Int}
	| Horizontal [WindowLayout]
	| Vertical [WindowLayout]

-- Return next traffic signal in sequence.
trafficNext :: TrafficColor -> TrafficColor
trafficNext Red = Green
trafficNext Yellow = Red
trafficNext Red = Green

-- Alternate method using case expresisons.
trafficNext' colour = case colour of
	Red -> Green
	Yellow -> Red
	Green -> Yellow

-- Return captialized string.
capitalize :: [Char] -> [Char]
capitalize str = [toUpper x | x <- str]

-- Return a list, where all odd elements are squared.
squareOdds :: [Integer] -> [Integer]
squareOdds xs = [if even x then x else x * x | x <- xs]

-- Returns a triple that is circularly rotated to the left by specified amount.
rotate :: Amount -> (a, a, a) -> (a, a, a)
rotate amt (a, b, c) = case amt of
	Zero -> (a, b, c)
	One -> (b, c, a)
	Two -> (c, a, b)

-- Return a conjoined list from a tuple of two lists, xs and ys.
join :: ([t], [t]) -> [t]
join (xs, []) = xs
join ([], ys) = ys
--join (xs, ys) = [x | x <- xs] ++ [y | y <- ys]
join((x:xs), ys) = x : (join(xs, ys))

-- Return a conjoined list from a list of lists.
joinAll :: [[t]] -> [t]
joinAll [] = []
joinAll (x:xs) = join(x, joinAll xs)

-- Return a list of sums, only if the triples are in increasing order.
increasingSum :: (Real t) => [(t, t, t)] -> [t]
increasingSum [] = []
increasingSum triple = [(a + b + c) | (a, b, c) <- triple, a < b, b < c]

-- Return all binary relations, except those that contain specified key.
deleteKey :: (Eq a) => a -> (BinaryRelation a b) -> (BinaryRelation a b)
deleteKey key br = [(k, v) | (k, v) <- br, key /= k]

-- Takes a list of entrys, returns a list of pairs consisting of name and phone.
noemails :: [Entry] -> [(String, Integer)]
noemails es = [(name x, phone x) | x <- es]

-- Takes a predicate, p, a function f, and a list, lst, and returns a list that is just like lst,
-- but in which every element x that satisfies p is replaced by f applied to x.
-- (an element x satisfies p if (p x) == True.)
selectiveMap :: (a -> Bool) -> (a -> a) -> [a] -> [a]
selectiveMap p f lst = [f x | x <- lst, p x]

-- Takes a predicate, p, and a list, lst, and returns a pair of lists (yes, no) such that
-- yes contains the elements of list that satisfy p and no contains the elements of lst
-- that do not satisfy p.
partition :: (a -> Bool) -> [a] -> ([a], [a])
partition p lst = (yes p lst, no p lst) where
	yes _ [] = []
	yes p (x:xs)
		| p x = x : (yes p xs)
		| otherwise = yes p xs
	no _ [] = []
	no p (x:xs)
		| p x = no p xs
		| otherwise = x : (no p xs)

-- Takes a window layout, wl, and return a window layout that is just like wl, except
-- that in each window record, the value of each width and height field is replaced by 1.
iconify :: WindowLayout -> WindowLayout
iconify' :: [WindowLayout] -> [WindowLayout]
iconify' [] = []
iconify' (x:xs) = iconify x : iconify' xs
iconify (Window {wname = name, width = _, height = _}) = Window name 1 1
iconify (Horizontal lst) = Horizontal (iconify' lst)
iconify (Vertical lst) = Vertical (iconify' lst)

-- Return variance of all floats inside given list.
-- Variance is defined as...
-- (1/n) * (sum from 1 to n of (mi - u)^2), where mi is current float, and u is average of floats.
variance :: [Float] -> Float
variance measures = (1/n) * (stdDev)
	where
		n = fromIntegral (length measures)
		stdDev = sum [(x - mean) ^ 2 | x <- measures]
			where
				mean = (sum measures) / n

-- Problem 2
scale :: Integer -> [Integer] -> [Integer]
scale factor lst = [x * factor | x <- lst]

-- Problem 3
data Outcome = StrictlyIncreasing | AllEqual | StrictlyDecreasing | Unordered
    deriving (Eq, Show)

order :: (Integer, Integer, Integer) -> Outcome
order (x,y,z)
    | x < y && y < z   = StrictlyIncreasing
    | x == y && y == z = AllEqual
    | x > y && y > z   = StrictlyDecreasing
    | otherwise        = Unordered

-- Problem 4a
averages :: [(Double, Double, Double)] -> [Double]
averages xs = [(x + y + z) / 3.0 | (x,y,z) <- xs]

-- Problem 4b
averages2 :: [(Double, Double, Double)] -> [Double]
averages2 [] = []
averages2 ((x,y,z):xs)  = ((x + y + z) / 3.0):(averages2 xs)

-- Problem 5
duplicate :: [a] -> [a]
duplicate [] = []
duplicate (x:lst) = x:x:(duplicate lst)

-- Problem 6
count :: Char -> [Char] -> Integer
count what s = toInteger $ length $ filter (== what) s

-- Alternate Solution with Tail Recursion
countAlt :: Char -> [Char] -> Integer
countAlt what s = go what s 0 where
    go _ [] total = total
    go w (x:str) total
        | x == w = go w str (total + 1)
        | otherwise = go w str total

-- Problem 8
sumSublists :: [[Integer]] -> Integer
sumSublists nss = sum [sum x | x <- nss]
