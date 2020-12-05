-- $Id: SimplifyTests.hs,v 1.2 2019/10/08 11:12:46 leavens Exp leavens $
module SimplifyTests where
import StatementsExpressions; import Simplify; import Testing
main = dotests "SimplifyTests $Revision: 1.2 $" tests
tests :: [TestCase Statement]
tests = 
 [(eqTest (simplify (IfStmt (VarExp "true") (ExpStmt (NumExp 7)))) "==" (ExpStmt (NumExp 7)))
 ,(eqTest (simplify (ExpStmt (BeginExp [] (NumExp 6)))) "==" (ExpStmt (NumExp 6)))
 ,(eqTest (simplify (ExpStmt (NumExp 7))) "==" (ExpStmt (NumExp 7)))
 ,(eqTest (simplify (ExpStmt (VarExp "q"))) "==" (ExpStmt (VarExp "q")))
 ,(eqTest (simplify (ExpStmt (VarExp "true"))) "==" (ExpStmt (VarExp "true")))
 ,(eqTest (simplify (ExpStmt (BeginExp [] (EqualsExp (VarExp "x") (VarExp "x")))))
   "==" (ExpStmt (EqualsExp (VarExp "x") (VarExp "x"))))
 ,(eqTest (simplify (AssignStmt "y" (EqualsExp (VarExp "jz") (VarExp "jz"))))
   "==" (AssignStmt "y" (EqualsExp (VarExp "jz") (VarExp "jz"))))
 ,(eqTest (simplify (IfStmt (VarExp "true") (AssignStmt "d" (VarExp "true"))))
   "==" (AssignStmt "d" (VarExp "true")))
 ,(eqTest (simplify 
           (AssignStmt "g"
            (BeginExp [(IfStmt (VarExp "true")
                               (AssignStmt "d" (BeginExp [] (VarExp "true"))))
                      ,(AssignStmt "z" (EqualsExp (VarExp "m") (BeginExp [] (VarExp "m"))))]
             (BeginExp [AssignStmt "e" (EqualsExp (VarExp "y") (NumExp 2))
                       ,(IfStmt (VarExp "true") (ExpStmt (NumExp 3)))]
                       (BeginExp [(IfStmt (VarExp "true")) (ExpStmt (NumExp 1))]
                                 (VarExp "true"))))))
   "==" (AssignStmt "g"
         (BeginExp [(AssignStmt "d" (VarExp "true"))
                   ,(AssignStmt "z" (EqualsExp (VarExp "m") (VarExp "m")))]
          (BeginExp [AssignStmt "e" (EqualsExp (VarExp "y") (NumExp 2)), (ExpStmt (NumExp 3))]
                    (BeginExp [(ExpStmt (NumExp 1))] (VarExp "true"))))))  ]
