-- Nicolas Soto, ni150669
-- COP4020, Fall 2019

-- $Id: VecLists.hs,v 1.2 2019/09/10 13:29:20 leavens Exp leavens $
module VecLists where

-- VecLists are represented by finite lists of coordinate values.
type VecList = [Double]

-- scale returns the VecList with each coordinate multiplied by the Double
scale :: Double -> VecList -> VecList
scale n vl = [e * n | e <- vl]

-- add returns a VecList that is the pointwise sum of the two arguments
-- The two arguments are assumed to have the same length.
add :: VecList -> VecList -> VecList
add _ [] = []
add [] _ = []
add (a:v1) (b:v2) = (a + b) : (add v1 v2)

-- dotprod returns the dot product of the VecList arguments
-- The two arguments are assumed to have the same length.
dotprod :: VecList -> VecList -> Double
dotprod _ [] = 0
dotprod [] _ = 0
dotprod (a:v1) (b:v2) = (a * b) + (dotprod v1 v2)
