-- Nicolas Sot0, ni150669
-- COP4020, Fall 2019

module Rotate where 
import Number

-- Takes Number, amt, and a 5-tuple of elements of some type,
-- returns a triple that is circulary rotated to the right by
-- the number of steps indiciated by the English word that corresponds to amt.
rotate :: Number -> (a, a, a, a, a) -> (a, a, a, a, a)
rotate Zero (v, w, x, y, z) = (v, w, x, y, z)
rotate One (v, w, x, y, z) = (z, v, w, x, y)
rotate Two (v, w, x, y, z) = (y, z, v, w, x)
rotate Three (v, w, x, y, z) = (x, y, z, v, w)
rotate Four (v, w, x, y, z) = (w, x, y, z, v)
