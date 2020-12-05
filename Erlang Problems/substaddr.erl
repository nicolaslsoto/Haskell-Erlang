% Nicolas Soto, ni150669
% COP 4020, Fall 2019

-module(substaddr).

-export([substaddr/3]).

-include("salesdata.hrl").

-import(salesdata, [store/2, group/2]).

% Takes a sales data record, SD, two strings, New and Old, and returns a salesdata that is
% just like SD, except that all records in SD whose address field's value is Old in SD are
% changed to the New in the result.
-spec substaddr(SD::salesdata:salesdata(), New::string(), Old::string()) -> salesdata:salesdata().

substaddr(#group{gname = Name, members = Memb}, New, Old) ->
	if
		Memb =:= [] ->
			#group{gname = Name, members = []};
		true ->
			#group{gname = Name, members = lists:map(fun (SD) -> substaddr(SD, New, Old) end, Memb)}
	end;

substaddr(#store{address = Addr, amounts = Amnt}, New, Old) ->
	if
		Addr =:= Old ->
			#store{address = New, amounts = Amnt};
		true ->
			#store{address = Addr, amounts = Amnt}
	end.
