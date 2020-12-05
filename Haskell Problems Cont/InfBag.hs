-- $Id: InfBag.hs,v 1.1 2013/09/24 14:34:31 leavens Exp leavens $
module InfBag where

fromFunc :: (a -> Integer) -> (Bag a)
minusBag :: Bag a -> Bag a -> Bag a
unionBag :: Bag a -> Bag a -> Bag a
intersectBag :: Bag a -> Bag a -> Bag a
number :: a -> Bag a -> Integer

-- define the type (Bag a) as one of the following and then...

-- type Bag a = ...
-- or perhaps something like --
-- data Bag a = ...

-- Write your code below for the opertions declared above...

