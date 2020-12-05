-- Nicolas Soto, ni150669
-- COP 4020, Fall 2019

module Split where
import FoldWindowPlan
import WindowPlan

-- Returns a WindowPlan that is just like wp, except that for each wp whose name
-- is equal to String, it is chnaged to Horiz WindowPlan with both windows
-- having the same name and half the width.
split :: String -> WindowPlan -> WindowPlan
split name wp =
	foldWindowPlan(\(wn, w, h) ->
	if name == wn
	then Horiz[(Win wn (w `div` 2) h), (Win wn (w `div` 2) h)]
	else (Win wn w h))
	Horiz Vert wp
-- ^                                   ^
-- foldWindowPlan (lambda) Horiz Vert wp
