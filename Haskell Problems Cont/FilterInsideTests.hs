-- $Id: FilterInsideTests.hs,v 1.1 2019/10/08 15:55:09 leavens Exp $
module FilterInsideTests where
import Testing; import Data.Char (isLower, isUpper, isLetter)
import FilterInside  -- you have to put your solutions in module FilterInside
-- do main to run our tests
main = do startTesting "FilterInsideTests $Revision: 1.1 $"
          startTesting "filterInside on [[Int]] lists"
          errs_ints <- run_test_list 0 int_tests
          startTesting "filterInside on [[Char]] lists"
          total_errs <- run_test_list errs_ints string_tests
          doneTesting total_errs
int_tests :: [TestCase [[Int]]]
int_tests =
    [eqTest (filterInside (==1) []) "==" []
    ,eqTest (filterInside (==1) [[]]) "==" [[]]
    ,eqTest (filterInside (>=2) [[3,4,5],[4,0,2,0],[],[8,7,6]])
      "==" [[3,4,5],[4,2],[],[8,7,6]]
    ,eqTest (filterInside odd [[1 .. 10], [2,4 .. 20], [7]]) 
      "==" [[1, 3 .. 9], [], [7]]
    ,eqTest (filterInside even [[0 .. 10], [0,2 .. 10], [7]]) 
      "==" [[0, 2 .. 10], [0, 2 .. 10], []]
    ,eqTest (filterInside (<= 7) [[0,7,17,27], [94,5]]) "==" [[0,7],[5]]  ]
string_tests :: [TestCase [[Char]]]
string_tests = 
    [eqTest (filterInside isLower ["A string", "is a list!"])
             "==" ["string","isalist"]
    ,eqTest (filterInside isUpper ["UCF","CS","is","great"])
             "==" ["UCF","CS","",""]
    ,eqTest (filterInside isLetter ["Haskell is","Wonderful","gr8 OK?"])
             "==" ["Haskellis","Wonderful","grOK"]      ]
