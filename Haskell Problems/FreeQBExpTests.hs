-- $Id: FreeQBExpTests.hs,v 1.1 2013/08/22 19:28:18 leavens Exp leavens $
module FreeQBExpTests where
import QBExp
import FreeQBExp
import Testing
main = dotests "FreeQBExpTests $Revision: 1.1 $" tests
tests :: [TestCase [String]]
tests = [setEq (freeQBExp (Varref "x")) "==" ["x"]
        ,setEq (freeQBExp ((Varref "x") `Or` (Varref "y"))) "==" ["x","y"]
        ,setEq (freeQBExp ((Varref "y") `Or` (Varref "x"))) "==" ["y","x"]
        ,setEq (freeQBExp (((Varref "y") `Or` (Varref "x")) 
                            `Or` ((Varref "x") `Or` (Varref "y"))))
                    "==" ["y","x"]
        ,setEq (freeQBExp (Exists "y" (Varref "y"))) "==" []
        ,setEq (freeQBExp (Exists "y" ((Varref "y") `Or` (Varref "z")))) 
                    "==" ["z"]
        ,setEq (freeQBExp (Exists "z" (Exists "y" ((Varref "y") `Or` (Varref "z")))))
                    "==" []
        ,setEq (freeQBExp ((Varref "z") 
                            `Or` (Exists "z" (Exists "y" ((Varref "y") `Or` (Varref "z"))))))
                    "==" ["z"]
        ,setEq (freeQBExp (((Varref "z") `Or` (Varref "q"))
                            `Or` (Exists "z" (Exists "y" ((Varref "y") `Or` (Varref "z"))))))
                    "==" ["z","q"]  ]
    where setEq = gTest setEqual
          setEqual los1 los2 = (length los1) == (length los2)
                               && subseteq los1 los2
          subseteq los1 los2 = all (\e -> e `elem` los2) los1
