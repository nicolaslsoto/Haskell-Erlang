-- $Id: ToCharFunTests.hs,v 1.3 2015/02/12 04:27:19 leavens Exp leavens $
module ToCharFunTests where
import ToCharFun  -- your solution goes in module ToCharFun
import Testing

main = dotests "ToCharFunTests $Revision: 1.3 $" tests
tests :: [TestCase Char]
tests = [eqTest (toCharFun (+3) 'a') "==" 'd'
        ,eqTest (toCharFun (+1) 'b') "==" 'c'
        ,eqTest (toCharFun (+7) 'a') "==" 'h'
        ,eqTest (toCharFun (\c -> 10*c `div` 12) 'h') "==" 'V'
        ]
