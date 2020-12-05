-- $Id: SplitScreenTests.hs,v 1.2 2015/02/12 04:23:12 leavens Exp leavens $
module SplitScreenTests where
import WindowLayout; import SplitScreen; import Testing
main = dotests "SplitScreenTests $Revision: 1.2 $" tests
tests :: [TestCase WindowLayout]
tests = 
 [(eqTest (splitScreen "olympics"  
                         (Window {wname = "olympics", width = 50, height = 33}))
   "==" (Horizontal [Window {wname = "olympics", width = 25, height = 33}
                    ,Window {wname = "olympics", width = 25, height = 33}]))
 ,(eqTest (splitScreen "masterpiece" (Horizontal [])) "==" (Horizontal []))
 ,(eqTest (splitScreen "nova" (Vertical [])) "==" (Vertical []))
 ,(eqTest (splitScreen "olympics"
            (Horizontal [(Window {wname = "olympics", width = 79, height = 33})
                        ,(Window {wname = "local news", width = 21, height = 10})]))
   "==" (Horizontal [(Horizontal (let w = Window {wname = "olympics", width = 39, height = 33} in [w, w]))
                    ,(Window {wname = "local news", width = 21, height = 10})]))
 ,(eqTest (splitScreen "local news"
           (Vertical [(Window {wname = "olympics", width = 79, height = 33})
                     ,(Window {wname = "local news", width = 21, height = 10})]))
   "==" (Vertical [(Window {wname = "olympics", width = 79, height = 33})
                  ,(Horizontal (let w = Window {wname = "local news", width = 10, height = 10} in [w, w]))]))
 ,(eqTest (splitScreen "Sienfeld"
           (Vertical [(Window {wname = "Star Trek", width = 40, height = 100})
                    ,(Window {wname = "Sienfeld", width = 80, height = 33})
                    ,(Window {wname = "Sienfeld", width = 30, height = 10})]))
   "==" (Vertical [(Window {wname = "Star Trek", width = 40, height = 100})
                  ,(Horizontal (let w = Window {wname = "Sienfeld", width = 40, height = 33} in [w,w]))
                  ,(Horizontal (let w = Window {wname = "Sienfeld", width = 15, height = 10} in [w, w]))]))
 ,(eqTest (splitScreen "local news"
           (Horizontal 
            [(Vertical [(Window {wname = "Tempest", width = 200, height = 100})
                       ,(Window {wname = "Othello", width = 200, height = 77})
                       ,(Window {wname = "Hamlet", width = 1000, height = 600})])
            ,(Horizontal [(Window {wname = "baseball", width = 50, height = 40})
                         ,(Vertical
                           [(Window {wname = "local news", width = 100, height = 60})
                           ,(Window {wname = "equestrian", width = 70, height = 30})])])
            ,(Vertical [(Window {wname = "Star Trek", width = 40, height = 100})
                       ,(Horizontal 
                         [(Window {wname = "olympics", width = 80, height = 33})
                         ,(Window {wname = "local news", width = 20, height = 10})])]) ]))
   "==" (Horizontal 
         [(Vertical [(Window {wname = "Tempest", width = 200, height = 100})
                    ,(Window {wname = "Othello", width = 200, height = 77})
                    ,(Window {wname = "Hamlet", width = 1000, height = 600})])
         ,(Horizontal [(Window {wname = "baseball", width = 50, height = 40})
                      ,(Vertical
                        [(Horizontal (let w = Window {wname = "local news", width = 50, height = 60}
                                      in [w,w]))
                        ,(Window {wname = "equestrian", width = 70, height = 30})])])
         ,(Vertical [(Window {wname = "Star Trek", width = 40, height = 100})
                    ,(Horizontal 
                      [(Window {wname = "olympics", width = 80, height = 33})
                      ,(Horizontal (let w = Window {wname = "local news", width = 10, height = 10}
                                    in [w,w]))])])  ]))  ]
