-- $Id: EncryptWithTests.hs,v 1.1 2015/02/12 04:23:12 leavens Exp leavens $
module EncryptWithTests where
import EncryptWith  -- your solution goes in this module
import Testing

main = dotests "EncryptWithTests $Revision: 1.1 $" tests
tests :: [TestCase [String]]
tests = [eqTest (encryptWith (rot (+1)) ["a","good","egg"]) 
         "==" ["b","hppe","fhh"]
        ,eqTest (encryptWith id ["nothing","special","here"])
         "==" ["nothing","special","here"]
        ,eqTest (encryptWith rot13 ["super","bowl","chips","UCF!","Whooo"])
         "==" ["\128\130}r\DEL","o|\132y","puv}\128","bPS.","du|||"]
        ,eqTest (encryptWith rot13 ["Attack","at","dawn!"])
         "==" ["N\129\129npx","n\129","qn\132{."]
        ,eqTest (encryptWith (rot (\x->x-2)) ["Alan","Turing","code","breaker","genius"])
         "==" ["?j_l","Rspgle","ambc","`pc_icp","eclgsq"]
        ,eqTest (encryptWith (rot (\x->x-32)) ["a","very","bad","code","this","is"])
         "==" ["A","VERY","BAD","CODE","THIS","IS"]
        ,eqTest (encryptWith (rot (+32)) ["BEWARE","THE","IDES","OF","MARCH"])
         "==" ["beware","the","ides","of","march"]
        ]
    where rot :: (Int -> Int) -> (Int -> Int)
          rot f = \i -> (f i) `mod` (fromEnum (maxBound :: Char))
          rot13 = rot (+13)
