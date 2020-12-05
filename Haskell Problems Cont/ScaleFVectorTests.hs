-- $Id: ScaleFVectorTests.hs,v 1.1 2019/10/09 13:42:24 leavens Exp leavens $
module ScaleFVectorTests where
import Testing; import FloatTesting; import FVectorTesting
import FVectorExamples
import ScaleFVector -- your code is in the ScaleFVector module
main = dotests "ScaleFVectorTests $Revision: 1.1 $" tests
tests :: [TestCase (FVector Double)]
tests = [fvWithin (scaleFVector 1.0 (halves 6)) "~=~" (halves 6)
        ,(fvWithin (scaleFVector 2.0 (powersOf2 6))
            "~=~" (FV (\i -> 2.0 * (2.0^i)) 6))
        ,(fvWithin (scaleFVector 3.0 (hundredDown 8))
            "~=~" (FV (\i -> 3.0 * (fromIntegral (100 - i))) 8))
        ,(fvWithin (scaleFVector 5.0 (nats 20))
            "~=~" (FV (\i -> 5.0 * (fromIntegral i)) 20))
        ,fvWithin (scaleFVector 3.14 empty) "~=~" empty  ]
