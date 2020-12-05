-- Nicolas Soto, ni150669
-- COP 4020, Fall 2019

module ToFromCharFun where

-- Convert Int to Char.
toCharFun :: (Int -> Int) -> (Char -> Char)
toCharFun num char = toEnum(num(fromEnum char)) :: Char

-- Convert Char to Int.
fromCharFun :: (Char -> Char) -> (Int -> Int)
fromCharFun char num = fromEnum(char(toEnum num))
