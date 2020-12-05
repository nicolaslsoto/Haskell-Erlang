% Nicolas Soto, ni150669
% COP 4020, Fall 2019

-module(power).

-export([start/0]).

-import(math, [pow/2]).

% Write a stateless server. This server responds to messages of the form
% {Pid, power, N, M}, where Pid is the senders process id, N and M are non-neg integers.
% Respond by sending a message of the form {answer, Res} to Pid, where Res is N^M.
-spec start() -> pid().
start() ->
    spawn(fun server/0).

-spec server() -> none().
server() ->
    receive
	{Pid, power, N, M} -> Pid!{answer, pow(N, M)}
    end,
    server().
