-- $Id: Add100ListTests.hs,v 1.2 2019/09/10 11:13:39 leavens Exp leavens $
module Add10ListTests where
import Testing
import Add100List  -- you have to put your solutions in module Add100List

version = "Add100ListTests $Revision: 1.2 $"
recursive_tests = (tests add100_list_rec)
comprehension_tests = (tests add100_list_comp)

-- do main to run our tests
main :: IO()
main = do startTesting version
          errs_comp <- run_test_list 0 comprehension_tests
          total_errs <- run_test_list errs_comp recursive_tests
          doneTesting total_errs

-- do test_comprehension to test just add100_list_comp
test_comprehension :: IO()
test_comprehension = dotests version comprehension_tests

-- do test_recursive to test just add100_list_rec
test_recursive :: IO()
test_recursive = dotests version recursive_tests

tests :: ([Integer] -> [Integer]) -> [TestCase [Integer]]
tests f = 
    [(eqTest (f []) "==" [])
    ,(eqTest (f (1:[])) "==" (101:[]))
    ,(eqTest (f (3:1:[])) "==" (103:101:[]))
    ,(eqTest (f [1,5,7,1,7]) "==" [101,105,107,101,107])
    ,(eqTest (f [7 .. 21]) "==" [107 .. 121])
    ,(eqTest (f [8,4,-2,3,1,10000000,10])
           "==" [108,104,98,103,101,10000100,110])
    ]
