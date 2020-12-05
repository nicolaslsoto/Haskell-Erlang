-- $Id: DeleteNthTests.hs,v 1.1 2015/01/21 16:33:59 leavens Exp $
module DeleteNthTests where
import Testing
import DeleteNth

-- do main to run our tests
main :: IO()
main = dotests "DeleteNthTests $Revision: 1.1 $" tests

tests :: [TestCase [Int]]
tests = 
    [(eqTest (deleteNth 1 3 []) "==" [])
    ,(eqTest (deleteNth 1 3 (1:[])) "==" (1:[]))
    ,(eqTest (deleteNth 1 1 (1:[])) "==" [])
    ,(eqTest (deleteNth 1 3 (3:1:3:[])) "==" (1:3:[]))
    ,(eqTest (deleteNth 2 3 (3:1:3:[])) "==" (3:1:[]))
    ,(eqTest (deleteNth 3 3 (3:1:3:[])) "==" (3:1:3:[]))
    ,(eqTest (deleteNth 1 3 (3:9:3:7:3:[])) "==" (9:3:7:3:[]))
    ,(eqTest (deleteNth 3 3 (3:9:3:7:3:[])) "==" (3:9:3:7:[]))
    ,(eqTest (deleteNth 2 1 (3:1:5:1:4:[])) "==" (3:1:5:4:[]))
    ,(eqTest (deleteNth 1 7 (3:1:[])) "==" (3:1:[]))
    ,(eqTest (deleteNth 1 7 [1,5,7,1,7]) "==" [1,5,1,7])
    ,(eqTest (deleteNth 2 7 [1,5,7,1,7]) "==" [1,5,7,1])
    ,(eqTest (deleteNth 4 9 [9,2,9,3,9,10,9,5,6]) "==" [9,2,9,3,9,10,5,6])
    ,(eqTest (deleteNth 2 8 [8,8,8,8,8,8]) "==" [8,8,8,8,8])
    ,(eqTest (deleteNth 17 8 [8,8,8,8,8,8]) "==" [8,8,8,8,8,8])
    ,(eqTest (deleteNth 18 99 [8,8,8,8,8,8]) "==" [8,8,8,8,8,8])
    ,(eqTest (deleteNth 3 8 [8,2,8,4,8,8,8,8,8]) "==" [8,2,8,4,8,8,8,8])
    ,(eqTest (deleteNth 2 20 ([1 .. 50] ++ (reverse [1 .. 50])))
      "==" ([1 .. 50] ++ (reverse ([1 .. 19] ++ [21 .. 50]))))
    ]
