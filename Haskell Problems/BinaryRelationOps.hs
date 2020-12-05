-- Nicolas Soto, ni150669
-- COP4020, Fall 2019

module BinaryRelationOps where
import BinaryRelation

-- Returns a list of all keys of the binary relation.
first :: (BinaryRelation a b) -> [a]
first br = [a | (a, b) <- br]

-- Returns a list of all values of the binary relation.
second :: (BinaryRelation a b) -> [b]
second br = [b | (a, b) <- br]

-- Input a predicate and a binary relation, returns
-- a list of all tuples in the relation that satisfy the predicate.
select :: ((a, b) -> Bool) -> (BinaryRelation a b) -> (BinaryRelation a b)
select prd br = [(a, b) | (a, b) <- br, prd(a, b)]

-- Take two binary relations, return their relational composition...
-- i.e. given (a, b) and (b, c), return (a, c)
compose :: Eq b => (BinaryRelation a b) -> (BinaryRelation b c) -> (BinaryRelation a c)
compose ab bc = [(a, y) | (a, b) <- ab, (x, y) <- bc, b == x]
