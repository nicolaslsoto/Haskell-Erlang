-- Nicolas Soto, ni150669
-- COP 4020, Fall 2019

module Rate where
import Data.List

-- Numbers elements in things.
numberThings :: (Ord a) => [a] -> [Int]
numberThings things = numberThings' 0 0 things where
numberThings' _ _ [] = []
numberThings' n m (x:things)
	| x `elem` things = n + 1 : numberThings' n (m + 1) things
	| otherwise = n + 1 : numberThings' (n + m + 1) 0 things

-- Take a list of elements of type a, things, and return a list of pairs of Ints and a,
-- that is sorted (non-decreasing order) on the a element of things, and the Int in each
-- pair is the rating of the element in the pair.
rate :: (Ord a) => [a] -> [(Int, a)]
rate things = zip (numberThings(sort(things))) (sort(things))
