-- $Id: SumFVectorTests.hs,v 1.1 2019/10/09 13:42:24 leavens Exp leavens $
module SumFVectorTests where
import Testing; import FloatTesting
import FVector; import FVectorExamples
import SumFVector -- your code goes in this module
main = dotests "SumFVectorTests $Revision: 1.1 $" tests
tests :: [TestCase Double]
tests = [withinTest (sumFVector empty) "~=~" 0.0
        ,withinTest (sumFVector (zeros 1000)) "~=~" 0.0
        ,withinTest (sumFVector (nats 11)) "~=~" 55.0
        ,withinTest (sumFVector (negs 11)) "~=~" (-55.0)
        ,withinTest (sumFVector (hundredDown 201)) "~=~" 0.0
        ,withinTest (sumFVector (halves 9)) "~=~" 1.9609375
        ,withinTest (sumFVector (powersOf2 11)) "~=~" 2047.0
        ,withinTest (sumFVector (powersOf01 5)) "~=~" 1.1111    ]
