-- $Id: SquareEvensTests.hs,v 1.2 2019/09/10 12:38:09 leavens Exp leavens $
module SquareEvensTests where
import SquareEvens
import Testing
main = dotests "SquareEvensTests $Revision: 1.2 $" tests
tests :: [TestCase [Integer]]
tests = [eqTest (squareEvens []) "==" []
        ,eqTest (squareEvens [3]) "==" [3]
        ,eqTest (squareEvens [4,-4]) "==" [16,16]
        ,eqTest (squareEvens [4,3,4]) "==" [16,3,16]
        ,eqTest (squareEvens [1,2,3,4,5,6]) "==" [1,4,3,16,5,36]
        ,eqTest (squareEvens [3,10,3,5,600,0,-2,-1,-3])
                "==" [3,100,3,5,360000,0,4,-1,-3]
        ]
