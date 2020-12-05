-- $Id: FVectorTesting.hs,v 1.1 2019/10/09 13:42:24 leavens Exp leavens $
module FVectorTesting where
import Testing; import FloatTesting
import FVector

-- For testing purposes when the data is a RealFloat (Float or Double)
fvWithin :: (Show a, RealFloat a, Tolerance a) => 
                 (FVector a) -> String -> (FVector a) -> (TestCase (FVector a))
fvWithin = gTest (\fv1 fv2 -> size fv1 == size fv2
                              && all (uncurry (~=~))
                                     (zip (elements fv1) (elements fv2)))

fvRel :: (Show a, RealFloat a, Tolerance a) => 
                 (FVector a) -> String -> (FVector a) -> (TestCase (FVector a))
fvRel = gTest (\fv1 fv2 -> size fv1 == size fv2
                           && all (uncurry (~~~))
                                  (zip (elements fv1) (elements fv2)))
