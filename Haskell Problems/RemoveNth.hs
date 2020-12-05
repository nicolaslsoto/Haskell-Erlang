-- Nicolas Soto, ni150669
-- COP4020, Fall 2019

module RemoveNth where

-- remove the nth occurence of an element in the list.
removeNth :: (Eq a) => Int -> a -> [a] -> [a]
removeNth _ _ [] = []
removeNth n toRemove (a:as)
	| ((n == 1) && (toRemove == a)) = removeNth (n - 1) toRemove as
	| (toRemove == a) = a : removeNth (n - 1) toRemove as
	| otherwise = a : removeNth n toRemove as
