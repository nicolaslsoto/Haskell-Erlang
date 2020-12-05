-- $Id: StatementsExpressions.hs,v 1.3 2019/10/08 11:12:46 leavens Exp leavens $
module StatementsExpressions where
data Statement = ExpStmt Expression 
               | AssignStmt String Expression
               | IfStmt Expression Statement  deriving (Eq, Show)
data Expression = VarExp String
                | NumExp Integer
                | EqualsExp Expression Expression
                | BeginExp [Statement] Expression deriving (Eq, Show)
