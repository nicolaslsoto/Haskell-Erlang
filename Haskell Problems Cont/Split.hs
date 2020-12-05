-- Nicolas Soto, ni150669
-- COP 4020, Fall 2019

module Split where
import WindowPlan

-- Returns a WindowPlan that is just like wp, except that for each wp whose name
-- is equal to String, it is chnaged to Horiz WindowPlan with both windows
-- having the same name and half the width.
split :: String -> WindowPlan -> WindowPlan

split name (Win wp width height) =
	if name == wp
	then Horiz[(Win name (width `div` 2) height), (Win name (width `div` 2) height)]
	else (Win wp width height)

split _ (Horiz []) = (Horiz [])
split name (Horiz wp) = Horiz(map (split name) wp)

split _ (Vert []) = (Vert [])
split name (Vert wp) = Vert(map (split name) wp)
