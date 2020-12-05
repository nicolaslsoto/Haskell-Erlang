-- Nicolas Soto, ni150669
-- COP4020, Fall 2019

module Txt2sms where
import Prelude hiding (Word)
type Word = String

-- Takes a list of words, txt, and returns a list just like txt
-- but with substitutions made for common texting conventions.
txt2sms :: [Word] -> [Word]
txt2sms [] = []
txt2sms (a:b:c:txt)
	| (a, b, c) == ("by", "the", "way") = "btw" : txt2sms txt
	| (a, b, c) == ("for", "your", "information") = "fyi" : txt2sms txt
	| (a, b, c) == ("be", "right", "back") = "brb" : txt2sms txt
	| (a, b, c) == ("laughing", "out", "loud") = "lol" : txt2sms txt
txt2sms (a:b:txt)
	| (a, b) == ("see", "you") = "cya" : txt2sms txt
	| (a, b) == ("I", "will") = "I'll" : txt2sms txt
txt2sms (a:txt)
	| a == "you" = "u" : txt2sms txt
	| a == "are" = "r" : txt2sms txt
	| a == "your" = "ur" : txt2sms txt
	| a == "boyfriend" = "bf" : txt2sms txt
	| a == "girlfriend" = "gf" : txt2sms txt
	| a == "to" = "2" : txt2sms txt
	| a == "great" = "gr8" : txt2sms txt
	| otherwise = a : txt2sms txt
