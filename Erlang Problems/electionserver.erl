% Nicolas Soto, ni150669
% COP 4020, Fall 2019

% Write an election server and two client functions.
-module(electionserver).
-export([start/0, electionserver/1, vote/2, results/1, count_vote/2]).

-spec start() -> pid().
start() ->
	spawn(?MODULE, electionserver, [[]]).

-spec electionserver(List::list()) -> none().
electionserver(List) ->
	receive
		{Pid, Candidate} ->
			Pid!{self(), vote},
			electionserver(count_vote(Candidate, List));
		{Pid} ->
			Pid!{self(), results, List},
			electionserver(List)
	end.

-spec count_vote(Candidate::atom(), List::list()) -> list().
count_vote(Candidate, List) ->
	case proplists:is_defined(Candidate, List) of
		true ->
			[if Candidate == C -> {C, X + 1}; true -> {C, X} end || {C, X} <- List];
		false ->
			[{Candidate, 1}] ++ List
	end.

-spec vote(ES::pid(), Candidate::atom()) -> ok.
vote(ES, Candidate) ->
	ES!{self(), Candidate},
	receive
		{ES, vote} -> ok
	end.

-spec results(ES::pid()) -> [{atom(), non_neg_integer()}].
results(ES) ->
	ES!{self()},
	receive
		{ES, results, List} -> lists:sort(List)
	end.
