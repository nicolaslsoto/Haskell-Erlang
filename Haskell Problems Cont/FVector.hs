-- $Id: FVector.hs,v 1.5 2019/10/09 16:25:20 leavens Exp leavens $
module FVector where
data FVector t = FV (Int -> t) -- rule that determines the ith element
                    Int        -- the size >= 0, indexes go from 0 to (size - 1)

-- Return the element at the index given by the second argument
at :: (FVector t) -> Int -> t
at fv@(FV rule siz) i = if (legalIndex fv i)
                        then (rule i)
                        else (error ("index " ++ (show i) ++ " out of bounds"))

-- Return the size of the FVector argument
size :: (FVector t) -> Int
size (FV _ siz) = siz

-- Is the second argument (the Int) a legal index into the given FVector?
legalIndex :: (FVector t) -> Int -> Bool
legalIndex (FV _ siz) i = 0 <= i && i < siz

-- Return a list of the legal indexes up to the given size
indexList :: Int -> [Int]
indexList siz = [0 .. (siz - 1)]

-- Return a list of the elements in the given FVector
elements :: (FVector t) -> [t]
elements (FV rule siz) = map rule (indexList siz)

-- Provide the ability to turn an FVector into a String (if the elements allow)
instance (Show t) => Show (FVector t) where
    show (FV rule siz) = (show siz) ++ "<[" ++ (showElements rule siz) ++ "]>"
        where showElements rule siz = concatMap (showElement rule) (indexList siz)
              showElement rule i = if i < siz -1
                                   then (show (rule i)) ++ ", "
                                   else (show (rule i))

-- Provide the ability to compare FVectors for equality (if the elements allow)
instance (Eq t) => Eq (FVector t) where
    fv1@(FV rule1 siz1) == fv2@(FV rule2 siz2) =
        (siz1 == siz2)
        && (and (map (\(e1,e2) -> e1 == e2)  -- i.e., (uncurry (==))
                     (zip (elements fv1) (elements fv2))))
