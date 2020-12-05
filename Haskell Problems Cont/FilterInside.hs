-- Nicolas Soto, ni150669
-- COP 4020, Fall 2019

module FilterInside where

-- Returns a list that consists of elements of each element inside each list,
-- that satisfies pred.
filterInside :: (a -> Bool) -> [[a]] -> [[a]]
filterInside pred lls = map (filter pred) lls
