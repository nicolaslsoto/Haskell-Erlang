-- Nicolas Soto, ni150669
-- COP4020, Fall 2019

module FindIndex where

-- Take an element, sought, and a finite list, lst...
-- Return the 0-based index of the first occurrence of sought in lst.
-- If it doesnt occurr, return -1.
findIndex :: (Eq a) => a -> [a] -> Integer
findIndex sought lst = findIndex' sought lst 0 where
	findIndex' sought [] acc = (-1)
	findIndex' sought (a:as) acc =
		if sought == a then acc else findIndex' sought as (1 + acc)
