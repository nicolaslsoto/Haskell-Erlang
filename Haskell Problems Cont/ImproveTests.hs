-- $Id: ImproveTests.hs,v 1.2 2015/02/12 04:23:12 leavens Exp leavens $
module ImproveTests where
import StatementsExpressions
import Improve
import Testing

main = dotests "ImproveTests $Revision: 1.2 $" tests

tests :: [TestCase Statement]
tests = 
 [(eqTest (improve (IfStmt (VarExp "true") (ExpStmt (NumExp 7))))
          "==" (ExpStmt (NumExp 7)))
 ,(eqTest (improve (ExpStmt (BeginExp [] (NumExp 6))))
          "==" (ExpStmt (NumExp 6)))
 ,(eqTest (improve (ExpStmt (NumExp 7))) "==" (ExpStmt (NumExp 7)))
 ,(eqTest (improve (ExpStmt (VarExp "q"))) "==" (ExpStmt (VarExp "q")))
 ,(eqTest (improve (ExpStmt (VarExp "true"))) "==" (ExpStmt (VarExp "true")))
 ,(eqTest (improve (ExpStmt (BeginExp [] (EqualsExp (VarExp "x") (VarExp "x")))))
   "==" (ExpStmt (EqualsExp (VarExp "x") (VarExp "x"))))
 ,(eqTest (improve (AssignStmt "y" (EqualsExp (VarExp "jz") (VarExp "jz"))))
   "==" (AssignStmt "y" (EqualsExp (VarExp "jz") (VarExp "jz"))))
 ,(eqTest (improve (IfStmt (VarExp "true")
                     (AssignStmt "d" (VarExp "true"))))
   "==" (AssignStmt "d" (VarExp "true")))
 ,(eqTest (improve 
           (AssignStmt "g"
            (BeginExp [(IfStmt (VarExp "true")
                               (AssignStmt "d" (BeginExp [] (VarExp "true"))))
                      ,(AssignStmt "z" (EqualsExp (VarExp "m") 
                                                  (BeginExp [] (VarExp "m"))))]
             (BeginExp [AssignStmt "e" (EqualsExp (VarExp "y") (NumExp 2))
                       ,(IfStmt (VarExp "true") (ExpStmt (NumExp 3)))]
                       (BeginExp [(IfStmt (VarExp "true")) (ExpStmt (NumExp 1))]
                                 (VarExp "true"))))))
   "==" (AssignStmt "g"
         (BeginExp [(AssignStmt "d" (VarExp "true"))
                   ,(AssignStmt "z" (EqualsExp (VarExp "m") (VarExp "m")))]
          (BeginExp [AssignStmt "e" (EqualsExp (VarExp "y") (NumExp 2))
                    ,(ExpStmt (NumExp 3))]
                    (BeginExp [(ExpStmt (NumExp 1))] (VarExp "true"))))))
 ]
