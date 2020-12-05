-- Nicolas Soto, ni150669
-- COP 4020, Fall 2019

module MapFVector where
import FVector

-- Take a function, fun, and an (FVector a) value, fv, and return an (FVector b),
-- value, whose value at index i is the result of applying fun to (at fv i).
mapFVector :: (a -> b) -> (FVector a) -> (FVector b)
mapFVector fun (FV fv i) = FV (\x -> fun(fv x)) i
