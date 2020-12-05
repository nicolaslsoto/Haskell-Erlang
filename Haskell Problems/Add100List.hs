-- Nicolas Soto, ni150669
-- COP4020, Fall 2019

module Add100List where

-- Add 100 to every element in the list using list comprehension.
add100_list_comp :: [Integer] -> [Integer]
add100_list_comp al = [n + 100| n <- al]

-- Add 100 to every element in the list using recursion with base case.
add100_list_rec :: [Integer] -> [Integer]
add100_list_rec [] = []
add100_list_rec (x:ral) = (x + 100) : add100_list_rec ral
