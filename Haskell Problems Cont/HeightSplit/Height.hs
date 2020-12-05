-- Nicolas Soto, ni150669
-- COP 4020, Fall 2019

module Height where
import FoldWindowPlan
import WindowPlan

-- Win is a window plan (String Int Int).
-- Horiz and Vert wps is a list of window plans.
height :: WindowPlan -> Int
height wp = case wp of
	Horiz [] -> 0
	Vert [] -> 0
	_ -> foldWindowPlan(\(_, _, h) -> h) maximum sum wp
