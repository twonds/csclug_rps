-module(rps_client).

-export([play/2]).


play(Pid, Move) ->
    Res = Pid ! Move,
    io:format("Send ~p ~n", [Res]),
    receive 
	{result, Result} ->
	    io:format("~p~n", [Result]);
	_ -> ok
    end.
