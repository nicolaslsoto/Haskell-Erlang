% Nicolas Soto, ni150669
% COP 4020, Fall 2019

% Write a barrier synchronization server. (a group of processes wait until all of them
% are done executing up to a certain point, the barrier).
-module(barrier).
-export([start/1, barrier_synch/2]).

% Write a function, start/1, which takes a positive integer, which is the size of the group
% of processes, and creates a barrier synchronization server, returning its process id.
% The bs_server tracks in its state, the number of processes that are still running, and the
% process ids of all that have reached the barrier.
-spec start(Running::integer()) -> pid().
start(Running) ->
  spawn(?MODULE, barrier_synch, [Running, []]).

% Track number of processes still running.
-spec barrier_synch(Running::integer(), List_pid::any()) -> none().
barrier_synch(Running, List_pid) ->
		receive
	{Pid, done} -> Pid!{self(), ok},
		if (Running =< 1) ->
			lists:foreach(fun(X) -> X!{self(), continue} end, List_pid),
			Pid!{self(), continue},
			barrier_synch(0, []);
		true -> barrier_synch(Running - 1, List_pid ++ [Pid])
		end;
	{Pid, how_many_running} -> Pid!{self(), number_running_is, Running},
		barrier_synch(Running, List_pid)
		end.
