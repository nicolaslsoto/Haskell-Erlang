-- Nicolas Soto, ni150669
-- COP 4020, Fall 2019

module AddFVector where
import FVector

-- Take two vector values, fv1 and fv2, and if they have the same size, then return
-- the new vector where the ith element of the result is the sum of the ith element
-- of fv1 and the ith element of fv2. If they have different sizes, then error mssg.
addFVector :: (Num t) => (FVector t) -> (FVector t) -> (FVector t)
addFVector (FV fv1 i) (FV fv2 j) =
	if size(FV fv1 i) == size(FV fv2 j)
	then FV (\x -> (fv1 x) + (fv2 x)) (i)
	else error "Can't add FVector's of different lengths."
