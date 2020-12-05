-- $Id: ToFromCharFunTests.hs,v 1.1 2019/10/08 14:10:34 leavens Exp leavens $
module ToFromCharFunTests where
import ToFromCharFun  -- your solution goes in module ToFromCharFun
import Testing; import Data.Char -- defines toUpper
main = do startTesting "ToFromCharFunTests $Revision: 1.1 $"
          startTesting "toCharFun"
          errs <- run_test_list 0 toTests
          startTesting "fromCharFun"
          errs <- run_test_list errs fromTests
          doneTesting errs
toTests :: [TestCase Char]
toTests = [eqTest (toCharFun (+3) 'a') "==" 'd'
          ,eqTest (toCharFun (+1) 'b') "==" 'c'
          ,eqTest (toCharFun (+7) 'a') "==" 'h'
          ,eqTest (toCharFun (+13) 'c') "==" 'p'
          ,eqTest (toCharFun (\c -> 10*c `div` 12) 'h') "==" 'V'  ]
fromTests :: [TestCase Int]
fromTests = [eqTest (fromCharFun (\c -> c) 7) "==" 7
            ,eqTest (fromCharFun (\c -> if c == 'b' then 'x' else c) 98) "==" 120
            ,eqTest (fromCharFun toUpper 97) "==" 65
            ,eqTest (fromCharFun vf 97) "==" 101
            ,eqTest (fromCharFun vf 117) "==" 97  ]
    where vf 'a' = 'e'
          vf 'e' = 'i'
          vf 'i' = 'o'
          vf 'o' = 'u'
          vf 'u' = 'a'
          vf c = c
