-- Nicolas Soto, ni150669
-- COP 4020, Fall 2019

module ComposeFilters where

-- Return Just a, if it satisfies the filter functions, else return Nothing.
composeFilters :: [(Maybe a -> Maybe a)] -> (Maybe a -> Maybe a)
composeFilters [] Nothing = Nothing
composeFilters [] (Just x) = Just x
composeFilters fltr Nothing = Nothing
composeFilters (x:fltr) mayb = x(composeFilters fltr mayb)
