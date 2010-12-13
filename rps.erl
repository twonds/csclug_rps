-module(rps).

-export([play/1
	]).

-define(MOVES, [rock, paper, scissors]).

computer_play() ->
    lists:nth(random:uniform(length(?MOVES)), ?MOVES).


play(Move) ->
    ComputerMove = computer_play(),
    play(ComputerMove, Move).

play(ComputerMove, Move) ->
    case {ComputerMove, Move} of
	{rock, rock} -> 
	    {[{computer, rock}, {player, rock}], tie};
	{rock, paper} -> 
	    {[{computer, rock}, {player, paper}], player};
	{rock, scissor} -> 
	    {[{computer, rock}, {player, scissor}], computer};
	{paper, rock} -> 
	    {[{rock, paper}, {player, rock}], computer};
	{paper, paper} -> 
	    {[{rock, paper}, {player, paper}], tie};
	{paper, scissor} -> 
	    {[{rock, paper}, {player, scissor}], player};
	{scissors, rock} -> 
	    {[{rock, scissors}, {player, rock}], player};
	{scissors, paper} -> 
	    {[{rock, scissors}, {player, paper}], computer};
	{scissors, scissor} -> 
	    {[{rock, scissors}, {player, scissor}], tie};
	_ ->
	    dontcheat
    end.
