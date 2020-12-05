-- Nicolas Soto, ni150669
-- COP 4020, Fall 2019

module FreeQBExp where
import QBExp

-- Remove duplicates from a list.
removeDupes :: Eq a => Set a -> Set a
removeDupes [] = []
removeDupes (x:xs)
	| x `elem` xs = removeDupes xs
	| otherwise = x : removeDupes xs

-- freeAll helper function, remove all strings contained in freeAll
fAll :: String -> (Set String) -> (Set String)
fAll str set = [x | x <- set, x /= str]

-- Returns a set containing just the strings that occur as a free varaible.
freeQBExp :: QBExp -> (Set String)
freeQBExp (Varref []) = [] -- maybe not needed?
freeQBExp (Varref str) = [str]
freeQBExp (qbe1 `And` qbe2) = removeDupes((freeQBExp qbe1) ++ (freeQBExp qbe2))
freeQBExp (Not qbe) = (freeQBExp qbe)
freeQBExp (Forall str qbe) = fAll str (freeQBExp qbe)
