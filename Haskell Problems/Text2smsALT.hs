-- Nicolas Soto, ni150669
-- COP4020, Fall 2019

module Txt2smsALT where
import Prelude hiding (Word)
type Word = String

-- Takes a list of words, txt, and returns a list just like txt
-- but with substitutions made for common texting conventions.
txt2sms :: [Word] -> [Word]
txt2sms [] = []
txt2sms (a:b:c:txt) = case (a, b, c) of
	("by", "the", "way") -> "btw" : txt2sms txt
	("for", "your", "information") -> "fyi" : txt2sms txt
	("be", "right", "back") -> "brb" : txt2sms txt
	("laughing", "out", "loud") -> "lol" : txt2sms txt
txt2sms (a:b:txt) = case (a, b) of
	("see", "you") -> "cya" : txt2sms txt
	("I", "will") -> "I'll" : txt2sms txt
txt2sms (a:txt) = case (a) of
	("you") -> "u" : txt2sms txt
	("are") -> "r" : txt2sms txt
	("your") -> "ur" : txt2sms txt
	("boyfriend") -> "bf" : txt2sms txt
	("girlfriend") -> "gf" : txt2sms txt
	("to") -> "2" : txt2sms txt
	("great") -> "gr8" : txt2sms txt
