-- $Id: FoldWindowPlanTests.hs,v 1.1 2019/10/09 15:48:55 leavens Exp leavens $
module FoldWindowPlanTests where
import WindowPlan
import FoldWindowPlan
import Testing

main = dotests "FoldWindowPlanTests $Revision: 1.1 $" tests

-- uses of foldWindowPlan for testing purposes, not for you to implement
watching' = foldWindowPlan (\(wn,_,_) -> [wn]) concat concat
changeChannel new old = 
    let changeName new old nm = if nm == old then new else nm
    in foldWindowPlan 
           (\(nm,w,h) -> (Win (changeName new old nm) w h))
           Horiz
           Vert
doubleSize = foldWindowPlan 
              (\(wn,w,h) -> (Win wn (2*w) (2*h)))
              Horiz
              Vert
addToSize n = foldWindowPlan
               (\(wn,w,h) -> (Win wn (n+w) (n+h)))
               Horiz
               Vert
multSize n = foldWindowPlan
               (\(wn,w,h) -> (Win wn (n*w) (n*h)))
               Horiz
               Vert
totalWidth = foldWindowPlan
               (\(_,w,_) -> w)
               sum
               sum

-- a WindowPlan for testing
hplan = 
    (Horiz
     [(Vert [(Win "Tempest" 200 100), (Win "Othello" 200 77), (Win "Hamlet" 1000 600)])
     ,(Horiz [(Win "baseball" 50 40), (Win "track" 100 60), (Win "golf" 70 30)])
     ,(Vert [(Win "Star Trek" 40 100), (Win "olympics" 80 33), (Win "news" 20 10)])])

tests :: [TestCase Bool]
tests =
    [assertTrue ((totalWidth hplan) == 1760)
    ,assertTrue ((doubleSize hplan) == (multSize 2 hplan))
    ,assertTrue ((watching' hplan) 
                 == ["Tempest","Othello","Hamlet","baseball","track","golf",
                     "Star Trek","olympics","news"])
    ,assertTrue 
     ((changeChannel 
       "pbs" "news" 
       (Vert [(Win "news" 10 5), (Win "golf" 50 25), (Win "news" 30 70)]))
      ==
      (Vert [(Win "pbs" 10 5), (Win "golf" 50 25), (Win "pbs" 30 70)]))
    ,assertTrue 
     ((addToSize 100 hplan)
      ==
      (Horiz 
       [(Vert [(Win "Tempest" 300 200), (Win "Othello" 300 177), (Win "Hamlet" 1100 700)])
       ,(Horiz [(Win "baseball" 150 140), (Win "track" 200 160), (Win "golf" 170 130)])
       ,(Vert [(Win "Star Trek" 140 200), (Win "olympics" 180 133), (Win "news" 120 110)])]) )
    ,assertTrue
     ((doubleSize hplan) 
      ==
      (Horiz 
       [(Vert [(Win "Tempest" 400 200), (Win "Othello" 400 154), (Win "Hamlet" 2000 1200)])
       ,(Horiz [(Win "baseball" 100 80), (Win "track" 200 120), (Win "golf" 140 60)])
       ,(Vert [(Win "Star Trek" 80 200), (Win "olympics" 160 66), (Win "news" 40 20)])]) )    ]
