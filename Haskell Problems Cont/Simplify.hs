-- Nicolas Soto, ni150669
-- COP 4020, Fall 2019

module Simplify where
import StatementsExpressions

-- Takes a Statement, stmt, and returns a Statement just like stmt, except that each:
-- Statement of the form (IfStmt (VarExp "true") s) is replaced by a simplified version of s.
-- Expression of the form (BeginExp [] e) is replaced by a simplified version of e.
simplify :: Statement -> Statement
express :: Expression -> Expression

simplify (ExpStmt e) = ExpStmt(express e)
simplify (AssignStmt str e) = AssignStmt str (express e)
simplify (IfStmt (VarExp "true") s) = simplify s
simplify (IfStmt e s) = IfStmt e s

express (VarExp str) = VarExp str
express (NumExp int) = NumExp int
express (EqualsExp e1 e2) = EqualsExp (express e1) (express e2)
express (BeginExp [] e) = express e
express (BeginExp xs e) = BeginExp(map simplify xs) (express e)
