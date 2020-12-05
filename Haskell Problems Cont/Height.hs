-- Nicolas Soto, ni150669
-- COP 4020, Fall 2019

module Height where
import WindowPlan

-- Win is a window plan (String Int Int).
-- Horiz and Vert wps is a list of window plans.

height :: WindowPlan -> Int
height (Win _ _ y) = y
height (Horiz []) = 0
height (Horiz wps) = maximum(map height wps)
height (Vert []) = 0
height (Vert wps) = sum(map height wps)
