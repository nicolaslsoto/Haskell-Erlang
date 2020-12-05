% Nicolas Soto, ni150669
% COP 4020, Fall 2019

-module(count_matching).

-export([count_matching/2]).

% Takes a predicate, Pred, and a list, Lst, and returns the number of elements
% in Lst that satisfy Pred. Use tail recursion.
-spec count_matching(Pred::fun((T) -> boolean()), Lst::list(T)) -> non_neg_integer().
count_matching(Pred, Lst) -> count_matching(Pred, Lst, 0).
count_matching(_, [], Count) -> Count;
count_matching(Pred, [Head|Rest], Count) ->
	case Pred(Head) of
		true -> count_matching(Pred, Rest, Count + 1);
		false -> count_matching(Pred, Rest, Count)
	end.
