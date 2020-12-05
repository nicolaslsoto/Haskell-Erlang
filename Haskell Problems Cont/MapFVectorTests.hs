-- $Id: MapFVectorTests.hs,v 1.1 2019/10/09 13:42:24 leavens Exp leavens $
module MapFVectorTests where
import Testing; import FloatTesting; import FVectorTesting
import FVectorExamples
import MapFVector -- your solution goes in this module
main = dotests "MapFVectorTests $Revision: 1.1 $" tests
tests :: [TestCase (FVector Double)]
tests = [fvWithin (mapFVector id (powersOf01 5)) "~=~" (powersOf01 5)
        ,fvWithin (mapFVector (+2.0) (hundredDown 8))
             "~=~" (FV (\i -> (fromIntegral (102 - i))) 8)
        ,fvWithin (mapFVector (\d -> 3.0*d+1.0) (nats 7))
             "~=~" (FV (\i -> 3.0*(fromIntegral i)+1.0) 7)
        ,fvWithin (mapFVector (\d -> d*d+2.0) (nats 7))
             "~=~" (FV (\i -> (fromIntegral (i*i))+2.0) 7)
        ,fvWithin (mapFVector (*2.0) (halves 8))
             "~=~" (FV (\i -> (fromIntegral i)/(fromIntegral (2^i))*2.0) 8)
        ,fvWithin (mapFVector (\d -> error "shouldn't be") empty) "~=~" empty  ]
