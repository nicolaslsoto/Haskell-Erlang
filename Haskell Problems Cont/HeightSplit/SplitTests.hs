-- $Id: SplitTests.hs,v 1.2 2019/10/08 10:49:25 leavens Exp $
module SplitTests where
import WindowPlan; import Split; import Testing
main = dotests "SplitTests $Revision: 1.2 $" tests
tests :: [TestCase WindowPlan]
tests = 
 [(eqTest (split "olympics" (Win "olympics" 50 33))
   "==" (Horiz [(Win "olympics" 25 33), (Win "olympics" 25 33)]))
 ,(eqTest (split "masterpiece" (Horiz [])) "==" (Horiz []))
 ,(eqTest (split "nova" (Vert [])) "==" (Vert []))
 ,(eqTest (split "olympics" (Horiz [(Win "olympics" 79 33), (Win "local news" 21 10)]))
   "==" (Horiz [(Horiz (let w = (Win "olympics" 39 33) in [w, w])), (Win "local news" 21 10)]))
 ,(eqTest (split "local news" (Vert [(Win "olympics" 79 33)
                                    ,(Win "local news" 21 10)]))
   "==" (Vert [(Win "olympics" 79 33)
              ,(Horiz (let w = (Win "local news" 10 10) in [w, w]))]))
 ,(eqTest (split "Sienfeld"
           (Vert [(Win "Star Trek" 40 100), (Win "Sienfeld" 80 33)
                 ,(Win "Sienfeld" 30 10)]))
   "==" (Vert [(Win "Star Trek" 40 100)
                  ,(Horiz (let w = (Win "Sienfeld" 40 33) in [w,w]))
                  ,(Horiz (let w = (Win "Sienfeld" 15 10) in [w, w]))]))
 ,(eqTest (split "local news"
           (Horiz 
            [(Vert [(Win "Tempest" 200 100), (Win "Othello" 200 77), (Win "Hamlet" 1000 600)])
            ,(Horiz [(Win "baseball" 50 40)
                         ,(Vert [(Win "local news" 100 60), (Win "ski jump" 70 30)])])
            ,(Vert [(Win "Star Trek" 40 100), (Horiz [(Win "olympics" 80 33)
                                                     ,(Win "local news" 20 10)])]) ]))
   "==" (Horiz 
         [(Vert [(Win "Tempest" 200 100), (Win "Othello" 200 77), (Win "Hamlet" 1000 600)])
         ,(Horiz [(Win "baseball" 50 40)
                      ,(Vert [(Horiz (let w = (Win "local news" 50 60) in [w,w]))
                             ,(Win "ski jump" 70 30)])])
         ,(Vert [(Win "Star Trek" 40 100), (Horiz [(Win "olympics" 80 33)
                                                  ,(Horiz (let w = (Win "local news" 10 10) in [w,w]))])])  ]))  ]
