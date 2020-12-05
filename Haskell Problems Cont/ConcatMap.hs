-- Nicolas Soto, ni150669
-- COP 4020, Fall 2019

module ConcatMap where
import Prelude hiding (concatMap)

-- Applies f to each element of ls, and concatenate the results of those
-- applications together (preserving the order).
concatMap :: (a -> [b]) -> [a] -> [b]
concatMap f ls = foldr (\x cat -> (f x) ++ cat) [] ls
