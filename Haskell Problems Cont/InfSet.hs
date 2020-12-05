-- Nicolas Soto, ni150669
-- COP 4020, Fall 2019

module InfSet where

-- define the type (Set a)
type Set a = a -> Bool

-- Take a characteristic predicate, p, and return a set such that
-- each value, x (of type a), is in the set just when px is True.
fromPred :: (a -> Bool) -> (Set a)
fromPred p = (\x -> (p x))

-- Takes two sets, with characteristic predicates, p and q, and returns
-- a set such that each value of x is in the set just when either px or qx is true.
unionSet :: Set a -> Set a -> Set a
unionSet p q = (\x -> (p x) || (q x))

-- Takes two sets, with characteristic predicates, p and q, and returns
-- a set such that each value of x is in the set just when both px and qx are true.
intersectSet :: Set a -> Set a -> Set a
intersectSet p q = (\x -> (p x) && (q x))

-- Tells whether the first argument is a member of the second argument.
inSet :: a -> Set a -> Bool
inSet x p = (p x)

-- Returns a set that contains everything not in the original set.
complementSet :: Set a -> Set a
complementSet p = (\x -> not(p x))
