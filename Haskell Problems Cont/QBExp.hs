-- $Id: QBExp.hs,v 1.3 2019/10/08 13:21:02 leavens Exp leavens $
module QBExp where
data QBExp = Varref String | QBExp `And` QBExp 
           | Not QBExp | Forall String QBExp   deriving (Eq, Show)
type Set a = [a] -- without any duplicates
