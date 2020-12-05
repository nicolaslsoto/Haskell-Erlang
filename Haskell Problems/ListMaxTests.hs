-- $Id: ListMaxTests.hs,v 1.2 2019/09/11 12:41:54 leavens Exp leavens $
module ListMaxTests where
import Testing
import ListMax

main = do startTesting "ListMaxTests $Revision: 1.2 $"
          errs <- run_test_list 0 tests_ints
          total <- run_test_list errs tests_chars
          doneTesting total

tests_ints :: [TestCase Int]
tests_ints = 
    [(eqTest (listMax (1:1:1:1:1:[])) "==" 1)
    ,(eqTest (listMax (26:[])) "==" 26)
    ,(eqTest (listMax (1:[])) "==" 1)
    ,(eqTest (listMax (1:26:[])) "==" 26)
    ,(eqTest (listMax (26:1:[])) "==" 26)
    ,(eqTest (listMax (1:2:3:4:1:3:5:26:27:[])) "==" 27)
    ,(eqTest (listMax (4:0:2:0:[])) "==" 4)
    ,(eqTest (listMax (86:99:12: -3:[])) "==" 99)
    ,(eqTest (listMax (100000:8600000:12222: -999999:[])) "==" 8600000)
    ]

tests_chars :: [TestCase Char]
tests_chars =
    [
     (eqTest (listMax "upqieurqoeiruazvzkpsau") "==" 'z')
    ,(eqTest (listMax "see haskell.org for more about Haskell") "==" 'u')
    ]
