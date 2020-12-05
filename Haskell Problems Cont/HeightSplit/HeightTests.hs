-- $Id: HeightTests.hs,v 1.2 2019/10/08 09:34:59 leavens Exp $
module HeightTests where
import Testing
import WindowPlan
import Height

main = dotests "HeightTests $Revision: 1.2 $" tests

tests :: [TestCase Int]
tests = 
 [(eqTest (height (Win "olympics" 50 33)) "==" 33)
 ,(eqTest (height (Horiz [])) "==" 0)
 ,(eqTest (height (Vert [])) "==" 0)
 ,(eqTest (height (Horiz [(Win "olympics" 80 33), (Win "News" 20 10)])) "==" 33)
 ,(eqTest (height (Vert [(Win "olympics" 80 33), (Win "News" 20 10)])) "==" 43)
 ,(eqTest (height (Vert [(Win "Star Wars" 40 100), (Win "olympics" 80 33),
                         (Win "News" 20 10)]))
                  "==" 143)
 ,(eqTest (height (Horiz [(Vert [(Win "Tempest" 200 100), (Win "Othello" 200 77)
                                ,(Win "Hamlet" 1000 600)])
                         ,(Horiz [(Win "baseball" 50 40), (Win "track" 100 60)
                                 ,(Win "baking" 70 30)])
                         ,(Vert [(Win "Dancing with the Stars" 40 100)
                                ,(Win "olympics" 80 33), (Win "News" 20 10)])])) "==" 777) ]
