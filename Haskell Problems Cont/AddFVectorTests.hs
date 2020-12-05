-- $Id: AddFVectorTests.hs,v 1.2 2019/10/09 15:05:25 leavens Exp $
module AddFVectorTests where
import Testing; import FloatTesting; import FVectorTesting
import FVector; import FVectorExamples
import AddFVector -- your code goes in this module
main = dotests "AddFVectorTests $Revision: 1.2 $" tests
tests :: [TestCase (FVector Double)]
tests = [fvWithin (addFVector empty empty) "~=~" empty
        ,fvWithin (addFVector (nats 11) (nats 11))
             "~=~" (FV (\i -> (fromIntegral (i+i))) 11)
        ,fvWithin (addFVector (nats 11) (negs 11)) "~=~" (zeros 11)
        ,fvWithin (addFVector (halves 9) (FV (\i -> 1.0) 9))
             "~=~" (FV (\i -> (fromIntegral i)/(fromIntegral (2^i))+1.0) 9)
        ,fvWithin (addFVector (powersOf2 11) (powersOf2 11))
             "~=~" (FV (\i -> (fromIntegral (2^i))*2.0) 11)
        ,fvWithin (addFVector (powersOf01 5) (zeros 5)) "~=~" (powersOf01 5)   ]
