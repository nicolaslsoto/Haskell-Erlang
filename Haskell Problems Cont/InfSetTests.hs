-- $Id: InfSetTests.hs,v 1.3 2019/10/09 15:05:25 leavens Exp leavens $
module InfSetTests where
import InfSet
import Testing

main = dotests "InfSetTests $Revision: 1.3 $" tests

tests :: [TestCase Bool]
tests =
    [assertTrue (inSet 2 (fromPred even))
    ,assertFalse (inSet 3 (fromPred even))
    ,assertTrue (inSet 3 (fromPred odd))
    ,assertTrue (inSet "coke" (fromPred (\ x -> x == "coke")))
    ,assertFalse (inSet "pepsi" (fromPred (\ x -> x == "coke")))
    ,assertFalse (inSet "coke" (complementSet (fromPred (\x -> x == "coke"))))
    ,assertTrue (inSet "oil" (complementSet (fromPred (\x -> x == "coke"))))
    ,assertTrue (inSet "pepsi" (unionSet (fromPred (\ x -> x == "coke"))
                                (fromPred (\ x -> x == "pepsi"))))
    ,assertTrue (inSet "coke" (unionSet (fromPred (\x -> x == "coke"))
                               (fromPred (\x -> x == "pepsi"))))
    ,assertFalse (inSet "sprite" (unionSet (fromPred (\x -> x == "coke"))
                                  (fromPred (\x -> x == "pepsi"))))
    ,assertFalse (inSet "coke" (intersectSet (fromPred (\x -> x == "coke"))
                                (fromPred (\x -> x == "pepsi"))))
    ,assertFalse (inSet "pepsi" (intersectSet (fromPred (\x -> x == "coke"))
                                (fromPred (\x -> x == "pepsi"))))
    ,assertTrue (inSet "dr. p" (intersectSet (fromPred (\x -> "coke" <= x))
                                 (fromPred (\x -> x <= "pepsi"))))
    ,assertTrue (inSet "pepsi" (intersectSet (fromPred (\x -> "coke" <= x))
                                (fromPred (\x -> x <= "pepsi"))))
    ,assertFalse (inSet "beer" (intersectSet (fromPred (\x -> "coke" <= x))
                                (fromPred (\x -> x <= "pepsi"))))
    ,assertFalse (inSet "wine" (intersectSet (fromPred (\x -> "coke" <= x))
                                (fromPred (\x -> x <= "pepsi"))))
    ,assertTrue (inSet "wine" (unionSet (fromPred (\x -> "coke" <= x))
                                (fromPred (\x -> x <= "pepsi"))))      ]
