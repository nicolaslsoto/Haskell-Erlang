-- $Id: WhatIndexTests.hs,v 1.1 2013/08/22 19:37:47 leavens Exp leavens $
module WhatIndexTests where
import WhatIndex
import Testing

main = dotests "WhatIndexTests $Revision: 1.1 $" tests

tests :: [TestCase Integer]
tests = 
    [(eqTest (whatIndex 3 []) "==" (-1))
    ,(eqTest (whatIndex 2 [1,2,3,2,1]) "==" 1)
    ,(eqTest (whatIndex 'a' ['a' .. 'z']) "==" 0)
    ,(eqTest (whatIndex 'b' ['a' .. 'z']) "==" 1)
    ,(eqTest (whatIndex 'c' ['a' .. 'z']) "==" 2)
    ,(eqTest (whatIndex 'q' ['a' .. 'z']) "==" 16)
    ,(eqTest (whatIndex (41,'c') [(42,'c'),(43,'c'),(41,'c'),(3,'c')])
      "==" 2)
    ,(eqTest (whatIndex True [False,False,False]) "==" (-1))
    ,(eqTest (whatIndex True [False,False,False,True]) "==" 3)
    ,(eqTest (whatIndex True [True,False,False,False]) "==" 0)
    ,(eqTest (whatIndex True [True,True,True]) "==" 0)
    ,(eqTest (whatIndex 1000 [1 .. 4000]) "==" 999)
    ]
