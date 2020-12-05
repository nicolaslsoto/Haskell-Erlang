-- $Id: TotalHeightTests.hs,v 1.1 2015/02/12 04:23:12 leavens Exp leavens $
module TotalHeightTests where
import Testing
import WindowLayout
import TotalHeight

main = dotests "TotalHeightTests $Revision: 1.1 $" tests

tests :: [TestCase Int]
tests = 
 [(eqTest (totalHeight (Window {wname = "olympics", width = 50, height = 33}))
          "==" 33)
 ,(eqTest (totalHeight (Horizontal [])) "==" 0)
 ,(eqTest (totalHeight (Vertical [])) "==" 0)
 ,(eqTest (totalHeight
            (Horizontal [(Window {wname = "olympics", width = 80, height = 33})
                        ,(Window {wname = "news", width = 20, height = 10})]))
   "==" 33)
 ,(eqTest (totalHeight
           (Vertical [(Window {wname = "olympics", width = 80, height = 33})
                     ,(Window {wname = "news", width = 20, height = 10})]))
   "==" 43)
 ,(eqTest (totalHeight
           (Vertical [(Window {wname = "Star Trek", width = 40, height = 100})
                    ,(Window {wname = "olympics", width = 80, height = 33})
                    ,(Window {wname = "news", width = 20, height = 10})]))
   "==" 143)
 ,(eqTest (totalHeight
         (Horizontal 
            [(Vertical [(Window {wname = "Tempest", width = 200, height = 100})
                      ,(Window {wname = "Othello", width = 200, height = 77})
                      ,(Window {wname = "Hamlet", width = 1000, height = 600})])
            ,(Horizontal [(Window {wname = "baseball", width = 50, height = 40})
                        ,(Window {wname = "track", width = 100, height = 60})
                        ,(Window {wname = "golf", width = 70, height = 30})])
            ,(Vertical [(Window {wname = "Star Trek", width = 40, height = 100})
                      ,(Window {wname = "olympics", width = 80, height = 33})
                      ,(Window {wname = "news", width = 20, height = 10})])
            ]))
        "==" 777)
 ]
