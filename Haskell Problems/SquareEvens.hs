-- Nicolas Soto, ni150669
-- COP4020, Fall 2019

module SquareEvens where

-- Take a list and square every even element.
squareEvens :: [Integer] -> [Integer]
squareEvens lst = [if even n then n * n else n | n <- lst]
