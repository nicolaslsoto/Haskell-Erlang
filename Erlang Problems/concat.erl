% Nicolas Soto, ni150669
% COP 4020, Fall 2019

-module(concat).

-export([concat/1]).

% concat takes a list of lists, Lists, and returns a list of all the elements formed
% by concatenating the inner lists together in order.
-spec concat(Lists :: [[T]]) -> [T].
concat([]) -> [];
concat([[]]) -> [];
concat([H|Lists]) -> H ++ concat(Lists).
