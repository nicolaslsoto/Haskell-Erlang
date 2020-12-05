-- $Id: WindowPlan.hs,v 1.1 2019/10/08 08:41:53 leavens Exp leavens $
module WindowPlan where
data WindowPlan = Win String Int Int -- name, width, and height
                  | Horiz [WindowPlan]
                  | Vert [WindowPlan]
                  deriving (Show, Eq)
