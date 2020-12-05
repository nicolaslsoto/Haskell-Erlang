-- $Id: ListMinTests.hs,v 1.1 2013/08/22 18:09:10 leavens Exp $
module ListMinTests where
import Testing
import ListMin

main = do startTesting "ListMinTests $Revision: 1.1 $"
          errs <- run_test_list 0 tests_ints
          total <- run_test_list errs tests_chars
          doneTesting total

tests_ints :: [TestCase Int]
tests_ints = 
    [(eqTest (listMin (1:1:1:1:1:[])) "==" 1)
    ,(eqTest (listMin (26:[])) "==" 26)
    ,(eqTest (listMin (1:[])) "==" 1)
    ,(eqTest (listMin (1:26:[])) "==" 1)
    ,(eqTest (listMin (26:1:[])) "==" 1)
    ,(eqTest (listMin (1:2:3:4:1:3:5:26:27:[])) "==" 1)
    ,(eqTest (listMin (4:0:2:0:[])) "==" 0)
    ,(eqTest (listMin (86:99:12:(-3):[])) "==" (-3))
    ,(eqTest (listMin (100000:8600000:12222:(-999999):[])) "==" (-999999))
    ]

tests_chars :: [TestCase Char]
tests_chars =
    [
     (eqTest (listMin "upqieurqoeiruazvzkpsau") "==" 'a')
    ,(eqTest (listMin "see haskell.org for more about Haskell") "==" ' ')
    ]
