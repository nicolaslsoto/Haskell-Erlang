-- $Id: Sum3Tests.hs,v 1.1 2019/09/09 01:49:40 leavens Exp leavens $
module Sum3Tests where
import Sum3
import Testing

main = dotests "Sum3Tests $Revision: 1.1 $" tests
tests :: [TestCase Integer]
tests = [eqTest (sum3 (0,0,0)) "==" 0
        ,eqTest (sum3 (0,1,2)) "==" 3
        ,eqTest (sum3 (75,100,50)) "==" 225
        ,eqTest (sum3 (-30,10,557)) "==" 537
        ,eqTest (sum3 (624,986,212532)) "==" 214142
        ,eqTest (sum3 (100,1000,314)) "==" 1414
        ]
