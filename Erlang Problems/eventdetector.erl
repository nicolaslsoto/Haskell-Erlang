% Nicolas Soto, ni150669
% COP 4020, Fall 2019

-module(eventdetector).
-export([start/2, eventdetector/3]).

% Two arguments, Initial State and TransitionFun.
-spec start(InitialState::any(), TransitionFun::atom()) -> none().
start(InitialState, TransitionFun) ->
	 spawn(?MODULE, eventdetector, [InitialState, TransitionFun, []]).

-spec eventdetector(State::any(), TransitionFun::atom(), List::list()) -> none().
eventdetector(State, TransitionFun, Lst) ->
	receive
		{Pid, add_me} ->
			Pid ! {added},
			eventdetector(State, TransitionFun, [Pid] ++ Lst);
		{Pid, add_yourself_to, EDPid} ->
			EDPid ! {self(), add_me},
			receive
				{added} -> Pid ! {added}
			end,
				eventdetector(State, TransitionFun, Lst);
		{Pid, state_value} ->
			Pid ! {value_is, State},
			eventdetector(State, TransitionFun, Lst);
		Atom ->
			{NewState, Event} = TransitionFun(State, Atom),
			if
				Event /= none ->
					lists:foreach(fun(P) -> P ! Event end, Lst),
					eventdetector(NewState, TransitionFun, Lst);
				true ->
					eventdetector(NewState, TransitionFun, Lst)
			end
	end.
