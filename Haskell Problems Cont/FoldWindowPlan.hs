-- Nicolas Soto, ni150669
-- COP 4020, Fall 2019

module FoldWindowPlan where
import WindowPlan

-- Takes 3 functions, wf, hf, and vf, which correspond to (Win, Horiz, Vert) in the
-- grammar for WindowPlan.
foldWindowPlan :: ((String, Int, Int) -> r) -> ([r] -> r) -> ([r] -> r) -> WindowPlan -> r
foldWindowPlan wf hf vf (Win wn w h) = wf (wn, w, h)
foldWindowPlan wf hf vf (Horiz wp) = hf (map (foldWindowPlan wf hf vf) wp)
foldWindowPlan wf hf vf (Vert wp) = vf (map (foldWindowPlan wf hf vf) wp)
