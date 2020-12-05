-- $Id: DeleteFromRelationTests.hs,v 1.3 2013/08/21 21:11:27 leavens Exp $
module DeleteFromRelationTests where
import Testing
import BinaryRelation
import Relations
import DeleteFromRelation  -- you have to put your solutions in this module

version = "DeleteFromRelationTests $Revision: 1.3 $"

-- do main to run our tests
main :: IO()
main = do startTesting version
          errs_wk <- run_test_list 0 deleteWithKey_tests
          total_errs <- run_test_list errs_wk deleteWithValue_tests
          doneTesting total_errs
-- do test_deleteWithKey to test just deleteWithKey
test_deleteWithKey :: IO()
test_deleteWithKey = dotests ("deleteWithKey " ++ version) deleteWithKey_tests
-- do test_deleteWithValue to test just deleteWithValue
test_deleteWithValue :: IO()
test_deleteWithValue = dotests ("deleteWithValue " ++ version) deleteWithValue_tests

deleteWithKey_tests :: [TestCase (BinaryRelation String String)]
deleteWithKey_tests =
    [(eqTest (deleteWithKey "foo" []) "==" [])
    ,(eqTest (deleteWithKey "bar" [("bar", "mitzva"),("bar", "stool")])
       "==" [])
    ,(eqTest (deleteWithKey "bar" bar_stuff) "==" [("salad", "bar")])
    ,(eqTest (deleteWithKey "salad" bar_stuff)
       "==" [("bar", "mitzva"),("bar", "stool"), ("bar", "tender")
            ,("bar", "keeper")])
    ,(eqTest (deleteWithKey "TimbukTu" city_country) "==" city_country)
    ]
deleteWithValue_tests :: [TestCase (BinaryRelation String String)]
deleteWithValue_tests = 
    [(eqTest (deleteWithValue "Japan" []) "==" [])
    ,(eqTest (deleteWithValue "Iowa" us_cities)
      "==" [("Chicago", "Illinois"),("Miami","Florida"),("Orlando", "Florida")])
    ,(eqTest (deleteWithValue "Illinois" us_cities)
      "==" [("Miami","Florida"),("Ames", "Iowa"),("Orlando", "Florida")
           ,("Des Moines", "Iowa")])
    ,(eqTest (deleteWithValue "island"
                              [("Coney", "island"),("Merritt","island")
                              ,("Curry Ford", "road"),("Orlando","Florida")
                              ,("Long","island")])
      "==" [("Curry Ford", "road"),("Orlando","Florida")])
    ,(eqTest (deleteWithValue "Vatican City" city_country) "==" city_country)
    ]
