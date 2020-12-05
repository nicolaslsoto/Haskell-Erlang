-- $Id: Txt2smsTests.hs,v 1.1 2019/09/11 12:27:00 leavens Exp leavens $
module Txt2smsTests where
import Testing
import Txt2sms

main = dotests "Txt2smsTests $Revision: 1.1 $" tests

tests :: [TestCase [String]]
tests = 
    [(eqTest (txt2sms []) "==" [])
    ,(eqTest (txt2sms ["got", "to", "go","too","late"])
      "==" ["got", "2", "go","too","late"])
    ,(eqTest (txt2sms ["you","you","you","you"]) "==" ["u","u","u","u"])
    ,(eqTest (txt2sms ["you","know","I","will","see","you","soon"]) 
      "==" ["u","know","I'll","cya","soon"])
    ,(eqTest (txt2sms ["by","the","way","you","must","see","my","girlfriend","she","is","great"])
      "==" ["btw","u","must","see","my","gf","she","is","gr8"])
    ,(eqTest (txt2sms (["for","your","information","you","are","a","pig"]
                   ++ ["see","you","later","when","you","find","me","a","boyfriend"]))
      "==" ["fyi","u","r","a","pig","cya","later","when","u","find","me","a","bf"])
    ,(eqTest (txt2sms ["by","the","way","I","will","be","right","back"]) 
      "==" ["btw","I'll","brb"])
    ]
