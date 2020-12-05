-- Nicolas Soto, ni150669
-- COP4020, Fall 2019

-- $Id: BinaryRelation.hs,v 1.3 2019/09/10 13:44:55 leavens Exp leavens $
module BinaryRelation where

-- Binary relations are represented as lists of pairs
-- The first part of a pair is called a "key" and the second part is called a "value"
type BinaryRelation a b = [(a,b)]
