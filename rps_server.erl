-module(rps_server).

-export([start/0]).


start() ->
    register(rpsServer, spawn(fun() ->
				      loop()
			      end)).


loop() ->
    receive
	{move, Pid, Move} ->
	    Result = rps:play(Move),
	    Pid ! {result, Result},
	    loop();
	stop ->
	    ok
    end.
