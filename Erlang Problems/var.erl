% Nicolas Soto, ni150669
% COP 4020, Fall 2019

-module(var).
-export([start/1, varserver/1]).

% Write a module, var, whose start/1 function returns the process id of a server.
% The servers state contains a value, which is initially the value given to start/1.
-spec start(State::integer()) -> pid().
start(State) ->
    spawn(?MODULE, varserver, [State]).

% The server responds to the following messages:
%  {assign, NewVal}, which makes the server continue with NewVal as its new value.
%  {Pid, fetch}, which causes the server to send the message {value, Value} to Pid,
%   where Value is the servers current value. The servers value is unchanged by this message.
-spec varserver(State::integer()) -> none().
varserver(State) ->
    	receive
	{assign, NewVal} -> varserver(NewVal);
	{Pid, fetch} -> Pid!{value, State},
	varserver(State)
		end.
