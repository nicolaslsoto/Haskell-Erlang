-- Nicolas Soto, ni150669
-- COP 4020, Fall 2019

module SumFVector where
import FVector

-- Takes an (FVector t) value, fv, and returns the sum of that vectors elements.
-- If the vector is empty, then zero is returned.
sumFVector :: (Num t) => (FVector t) -> t
sumFVector (FV fv i) = sum(map fv [0.. (i - 1)])
