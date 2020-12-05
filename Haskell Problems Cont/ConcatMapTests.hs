-- $Id: ConcatMapTests.hs,v 1.5 2019/10/09 15:48:55 leavens Exp leavens $
module ConcatMapTests where
import Prelude hiding (concatMap)
import ConcatMap
import Testing

main :: IO()
main = dotests "ConcatMapTests $Revision: 1.5 $" tests

-- some definitions using concatMap, for testing, not for you to implement
deleteAll toDel ls = concatMap (\e -> if e == toDel then [] else [e]) ls 
xerox ls = concatMap (\e -> [e,e]) ls
next3 lst = concatMap (\n -> [n,n+1,n+2]) lst
tests :: [TestCase Bool]
tests = 
    [assertTrue ((deleteAll 'c' "abcdefedcba") == "abdefedba")
    ,assertTrue ((deleteAll 3 [3,3,3,7,3,9]) == [7,9])
    ,assertTrue ((deleteAll 3 []) == [])
    ,assertTrue ((xerox "") == "")
    ,assertTrue ((xerox "okay") == "ookkaayy")
    ,assertTrue ((xerox "balon") == "bbaalloonn")
    ,assertTrue ((next3 []) == [])
    ,assertTrue ((next3 [1,2,3]) == [1,2,3,2,3,4,3,4,5])     ]
