-- $Id: EqOptimTests.hs,v 1.1 2013/08/22 19:37:47 leavens Exp leavens $
module EqOptimTests where
import StatementsExpressions
import EqOptim
import Testing

main = dotests "EqOptimTests $Revision: 1.1 $" tests

tests :: [TestCase Statement]
tests = 
 [(eqTest (eqOptim (ExpStmt (EqualsExp (VarExp "x") (VarExp "x"))))
          "==" (ExpStmt (VarExp "true")))
 ,(eqTest (eqOptim (ExpStmt (EqualsExp (VarExp "x") (VarExp "yy"))))
          "==" (ExpStmt (EqualsExp (VarExp "x") (VarExp "yy"))))
 ,(eqTest (eqOptim (ExpStmt (NumExp 7))) "==" (ExpStmt (NumExp 7)))
 ,(eqTest (eqOptim (ExpStmt (VarExp "q"))) "==" (ExpStmt (VarExp "q")))
 ,(eqTest (eqOptim (ExpStmt (VarExp "true"))) "==" (ExpStmt (VarExp "true")))
 ,(eqTest (eqOptim (ExpStmt (BeginExp [] (EqualsExp (VarExp "x") (VarExp "x")))))
   "==" (ExpStmt (BeginExp [] (VarExp "true"))))
 ,(eqTest (eqOptim (AssignStmt "y" (EqualsExp (VarExp "jz") (VarExp "jz"))))
   "==" (AssignStmt "y" (VarExp "true")))
 ,(eqTest (eqOptim (IfStmt (EqualsExp (VarExp "c") (VarExp "c"))
                           (AssignStmt "d" (EqualsExp (VarExp "f") (VarExp "f")))))
   "==" (IfStmt (VarExp "true") (AssignStmt "d" (VarExp "true"))))
 ,(eqTest (eqOptim (AssignStmt "g"
                    (BeginExp [(IfStmt (EqualsExp (VarExp "c") (VarExp "c"))
                                (AssignStmt "d" (EqualsExp (VarExp "f") (VarExp "f"))))
                              ,(AssignStmt "z" (EqualsExp (VarExp "m") (VarExp "m")))]
                     (BeginExp [AssignStmt "e" (EqualsExp (VarExp "y") (NumExp 2))]
                               (EqualsExp (VarExp "a") (VarExp "a"))))))
   "==" (AssignStmt "g"
         (BeginExp [(IfStmt (VarExp "true") (AssignStmt "d" (VarExp "true")))
                   ,(AssignStmt "z" (VarExp "true"))]
          (BeginExp [AssignStmt "e" (EqualsExp (VarExp "y") (NumExp 2))]
                    (VarExp "true")))))
 ]
