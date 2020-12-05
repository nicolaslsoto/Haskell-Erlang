-- $Id: ComposeFiltersTests.hs,v 1.3 2019/10/08 18:04:34 leavens Exp leavens $
module ComposeFiltersTests where
import ComposeFilters; import Testing
main = dotests "ComposeFiltersTests $Revision: 1.3 $" tests
-- between (below) is a filter for testing; Note: not for you to implement!
between :: Double -> Double -> (Maybe Double) -> (Maybe Double)
between _ _ Nothing = Nothing
between lb ub (Just x) = if lb <= x && x <= ub then (Just x) else Nothing
-- the following makes a filter, like the above, from an aribtrary predicate
toFilter :: (a -> Bool) -> (Maybe a -> Maybe a) -- This is also not for you to implement!
toFilter _ Nothing = Nothing
toFilter pred (Just x) = if pred x then (Just x) else Nothing
tests :: [TestCase Bool]
tests =
    [assertTrue ((composeFilters [] (Just 3.14159)) == (Just 3.14159))
    ,assertTrue ((composeFilters [between 0.0 50.1] Nothing) == Nothing)
    ,assertTrue ((composeFilters [between 0.0 50.1] (Just 3.14)) == (Just 3.14))
    ,assertTrue ((composeFilters [between 0.0 50.1, between 1.0 5.0] (Just 3.14)) == (Just 3.14))
    ,assertTrue ((composeFilters [between 7.0 10.0] (Just 3.14)) == Nothing)
    ,assertTrue ((composeFilters [between 7.0 10.0, between 0.0 50.1, between 1.0 5.0] (Just 3.14)) == Nothing)
    ,assertTrue ((composeFilters [between 0.0 50.1, between 7.0 10.0, between 1.0 5.0] (Just 3.14)) == Nothing)
    ,assertTrue ((composeFilters [toFilter (>3), toFilter (<=5)] (Just 4)) == (Just 4))
    ,assertTrue ((composeFilters [toFilter (>'a'), toFilter (<'z')] (Just 'u')) == (Just 'u'))
    ,assertTrue ((composeFilters [toFilter (>'a'), toFilter (<'z'),toFilter (<'Z')] (Just 'u')) == Nothing)
    ,assertTrue ((composeFilters [toFilter (>7.0), toFilter (<0.0)] (Just 2.78)) == Nothing)  ]
