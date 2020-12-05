-- $Id: RotateTests.hs,v 1.3 2019/09/10 14:51:35 leavens Exp leavens $
module RotateTests where
import Testing
import Number
import Rotate -- your code should go in this module
main = dotests "RotateTests $Revision: 1.3 $" tests
tests :: [TestCase Bool]
tests =
    [assertTrue ((rotate Zero (1,2,3,4,5)) == (1,2,3,4,5))
    ,assertTrue ((rotate One (1,2,3,4,5)) ==  (5,1,2,3,4))
    ,assertTrue ((rotate Two (1,2,3,4,5)) ==  (4,5,1,2,3))
    ,assertTrue ((rotate Three (1,2,3,4,5)) ==(3,4,5,1,2))
    ,assertTrue ((rotate Four (1,2,3,4,5)) == (2,3,4,5,1))
    ,assertTrue ((rotate Two ("jan","feb","mar","apr","may")) == ("apr","may","jan","feb","mar"))
    ,assertTrue ((rotate Three ("jan","feb","mar","apr","may")) == ("mar","apr","may","jan","feb"))
    ,assertTrue ((rotate Four ("jan","feb","mar","apr","may")) == ("feb","mar","apr","may","jan"))
    ,assertTrue ((rotate Zero (True,False,True,False,True)) == (True,False,True,False,True))
    ,assertTrue ((rotate One (True,False,True,False,True)) == (True,True,False,True,False)) ]
