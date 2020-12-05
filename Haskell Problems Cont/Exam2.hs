-- Exam 2 practice.

module Exam2 where

-- concatenate all elements of xs not in ys, to all elements of ys.
union :: Eq a => [a] -> [a] -> [a]
union xs [] = xs
union [] ys = ys
union xs ys = (foldr (\x acc -> if x `notElem` ys then x:acc else acc) [] xs) ++ ys
