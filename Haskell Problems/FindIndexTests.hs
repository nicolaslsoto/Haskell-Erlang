-- $Id: FindIndexTests.hs,v 1.1 2019/09/11 12:48:37 leavens Exp leavens $
module FindIndexTests where
import FindIndex
import Testing

main = dotests "FindIndexTests $Revision: 1.1 $" tests

tests :: [TestCase Integer]
tests = 
    [(eqTest (findIndex 3 []) "==" (-1))
    ,(eqTest (findIndex 2 [1,2,3,2,1]) "==" 1)
    ,(eqTest (findIndex 'a' ['a' .. 'z']) "==" 0)
    ,(eqTest (findIndex 'b' ['a' .. 'z']) "==" 1)
    ,(eqTest (findIndex 'c' ['a' .. 'z']) "==" 2)
    ,(eqTest (findIndex 'q' ['a' .. 'z']) "==" 16)
    ,(eqTest (findIndex (41,'c') [(42,'c'),(43,'c'),(41,'c'),(3,'c')])
      "==" 2)
    ,(eqTest (findIndex True [False,False,False]) "==" (-1))
    ,(eqTest (findIndex True [False,False,False,True]) "==" 3)
    ,(eqTest (findIndex True [True,False,False,False]) "==" 0)
    ,(eqTest (findIndex True [True,True,True]) "==" 0)
    ,(eqTest (findIndex 1000 [1 .. 4000]) "==" 999)
    ]
