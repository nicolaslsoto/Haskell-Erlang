-- $Id: ApplyToListTests.hs,v 1.2 2019/09/10 13:44:55 leavens Exp leavens $
module ApplyToListTests where
import Testing
import BinaryRelation
import Relations  -- some test inputs
import ApplyToList  -- you have to put your solutions in this module

version = "ApplyToListTests $Revision: 1.2 $"

-- do main to run our tests
main :: IO()
main = do startTesting version
          errs_wk <- run_test_list 0 applyRel_tests
          total_errs <- run_test_list errs_wk applyToList_tests
          doneTesting total_errs
-- do test_applyRel to test just applyRel
test_applyRel :: IO()
test_applyRel = dotests ("deleteWithValue " ++ version) applyRel_tests
-- do test_applyToList to test just applyToList
test_applyToList :: IO()
test_applyToList = dotests ("applyToList " ++ version) applyToList_tests

applyRel_tests :: [TestCase [String]]
applyRel_tests = 
    [(eqTest (applyRel "Timbuktu" []) "==" [])
    ,(eqTest (applyRel "Ames" us_cities) "==" ["Iowa"])
    ,(eqTest (applyRel "Chicago" us_cities) "==" ["Illinois"])
    ,(eqTest (applyRel "bar" bar_stuff)
                 "==" ["mitzva", "stool", "tender", "keeper"])
    ,(eqTest (applyRel "salad" bar_stuff) "==" ["bar"])
    ,(eqTest (applyRel "foo" bar_stuff) "==" [])
    ]

applyToList_tests :: [TestCase [String]]
applyToList_tests =
    [(eqTest (applyToList ([]::[String]) ([]::(BinaryRelation String String))) "==" [])
    ,(eqTest (applyToList ["foo"] []) "==" [])
    ,(eqTest (applyToList ["foo","bar"] bar_stuff)
                 "==" ["mitzva", "stool", "tender", "keeper"])
    ,(eqTest (applyToList ["salad","bar"] bar_stuff)
                 "==" ["bar", "mitzva", "stool", "tender", "keeper"])
    ,(eqTest (applyToList ["Beijing", "Guangzhou", "Shenzhen", "Tokyo"] city_country)
                 "==" ["China", "China", "China", "Japan"])
    ,(eqTest (applyToList ["Buenos Aires", "Delhi", "Osaka"] city_country)
                 "==" ["Argentina", "India", "Japan"])
    ]
