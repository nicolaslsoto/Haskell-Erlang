-module(patternmatching).
-export([patternmatch/2, patternmatch2/1]).

patternmatch(list1, list2) -> 1;
patternmatch(n, m) -> 2;
patternmatch(X, X) -> 3;
patternmatch([elem|elems], [x|xs]) -> 4;
patternmatch([Elem|Elems], [Elem|Elems]) -> 5;
patternmatch([_A|_As], [_B|_Bs]) -> 6;
patternmatch({_X}, _Y) -> 7;
patternmatch({A,B}, {B,A}) -> 8;
patternmatch({_A,_B}, {_C,_D}) -> 9;
patternmatch(_X, _Y) -> 10.

% a() -> patternmatch({a_atom}, another). 7
% b() -> patternmatch([elem,mints], [candy,crush]). 6
% c() -> patternmatch({varied,flowers}, {flowers,varied}). 8
% d() -> patternmatch([cross, bow, service], [cross, bow, service]). 3

patternmatch2(lst) -> 1;
patternmatch2(nil) -> 2;
patternmatch2([_Lst]) -> 3;
patternmatch2([[_Lst]]) -> 6;
patternmatch2([x|xs]) -> 4;
patternmatch2([_X|_Xs]) -> 5;
patternmatch2(_Number) -> 7.

% a() -> patternmatch2([atoms, are, here]). 5
% b() -> patternmatch2(an_atom). 7
% c() -> patternmatch2(lst). 1
% d() -> patternmatch2([[some, nested], [lists]]). 5
