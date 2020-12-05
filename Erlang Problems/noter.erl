% Nicolas Soto, ni150669
% COP 4020, Fall 2019

-module(noter).
-export([start/0, log_server/1]).

% Write a function, start/0, which creates a log server and returns its process id.
% A server created by noter:start() keeps track of a list of log entries.
-spec start() -> pid().
start() ->
	spawn(?MODULE, log_server, [[]]).

-spec log_server(Logged::any()) -> none().
log_server(Logged) ->
		receive
	{Pid, log, Entry} -> Pid!{self(), logged}, log_server(Logged ++ [Entry]);
	{Pid, fetch} -> Pid!{self(), log_is, Logged},
	log_server(Logged)
		end.
