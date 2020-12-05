-- Nicolas Soto, ni150669
-- COP4020, Fall 2019

module ListMax where

-- Takes a non-empty, finite list, lst, whose elements can be compared,
-- and returns a maximal element from lst. Find the max element using tail recursion.
listMax :: (Ord a) => [a] -> a
listMax (x:xs) = findMax x xs where
	findMax m [] = m
	findMax m (f:fm) = if m > f then findMax m fm else findMax f fm
