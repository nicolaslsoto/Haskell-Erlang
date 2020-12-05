-- Nicolas Soto, ni150669
-- COP 4020, Fall 2019

module ScaleFVector where
import FVector

-- Return scalar multiplication of x and fv
scaleFVector :: (Num t) => t -> (FVector t) -> (FVector t)
scaleFVector x (FV fv i) = FV (\t -> x * fv t) i
