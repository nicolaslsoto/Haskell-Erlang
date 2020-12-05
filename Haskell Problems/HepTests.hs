-- $Id: HepTests.hs,v 1.2 2015/01/21 21:00:49 leavens Exp leavens $
module HepTests where
import Testing
import Hep

main = dotests "HepTests $Revision: 1.2 $" tests

tests :: [TestCase [String]]
tests = 
    [(eqTest (hep []) "==" [])
    ,(eqTest (hep ["you","you","you","you"]) "==" ["u","u","u","u"])
    ,(eqTest (hep ["you","know","I","will","see","you","soon"]) 
      "==" ["u","know","I'll","cya","soon"])
    ,(eqTest (hep ["by","the","way","you","must","see","my","girlfriend","she","is","great"])
      "==" ["btw","u","must","see","my","gf","she","is","gr8"])
    ,(eqTest (hep (["for","your","information","you","are","a","pig"]
                   ++ ["see","you","later","when","you","find","me","a","boyfriend"]))
      "==" ["fyi","u","r","a","pig","cya","later","when","u","find","me","a","bf"])
    ,(eqTest (hep ["by","the","way","I","will","be","right","back"]) 
      "==" ["btw","I'll","brb"])
    ]
