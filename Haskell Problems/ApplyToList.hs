-- Nicolas Soto, ni150669
-- COP4020, Fall 2019

module ApplyToList where
import BinaryRelation

-- Using list comprehension
-- For all pairs in the given list, return a list of all values v, that are paired with key ky.
applyRel :: (Eq k) => k -> (BinaryRelation k v) -> [v]
applyRel ky pairs = [v | (k, v) <- pairs, ky == k]

-- Using recursion
-- For all keys in given list, return a list of values from every pair whose key is one of the keys in keys.
applyToList :: (Eq k) => [k] -> (BinaryRelation k v) -> [v]
applyToList [] _ = []
applyToList _ [] = []
applyToList (ky:keys) pairs = (applyRel ky pairs) ++ (applyToList keys pairs)
