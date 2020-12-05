-module(hw5p1).
-import(lists, [map/2, foldr/3]).
-export([mapInside/2]).

% 1
-spec mapInside(F::any(), Llt::list()) -> any().
mapInside(F, Llt) -> foldr(fun(Ls, Res) -> [map(F,Ls)|Res] end, [], Llt).

%2, Identifier is either a function name or a variable name.
% (reserved words are not identifiers, i.e. fun. Also, atoms are not identifiers).
H(fun(X,Y) -> K(foo(bar({the_fun, fun(A,H) -> minus(A,4020) end}))) end, K)

%3
P(foo(Q(map(fun (E) -> bar(P, Q, P(Q(E)), F) end, [zero, false, 1, fun(F,G) -> fun(X) -> F(F(X)) end end]))))
