-module(challenge08Solution).
-export([test01/0, increase/0, test02/0, dynamicIncrease/1, test03/0, calculator/1, test04/0, tictac/2]).

% ====================
% Complete the following functions and submit your file to Canvas.
% ====================
% Do not change the names of the functions. 
% Do not change the number of arguments in the functions.
% If your file cannot be loaded by the Erlang compiler, your submission may be cancelled. 
% Then, submit only code that works.
% ====================
% Grading instructions:
% There is a series of test cases for each function. In order to state that your function
% "works as described", your output must be similar to the expected one in each case.

% === increase ===

increase() ->
	receive
		X when is_number(X) -> io:format("~p~n", [X + 1]), increase();
		_ -> ok
	end.

test01() -> 
	io:format("=== increase ===~n"),
	Pid = spawn(fun challenge08Solution:increase/0),
	Pid ! 5, 	% 6 is printed on screen.
	Pid ! 10, 	% 11 is printed on screen.
	Pid ! 99, 	% 100 is printed on screen.
	Pid ! bye, 	% The process ends.
	Pid ! 5, 	% Nothing happens since the process is already done.
	ok.			% This is the return value for test01 (it will eventually be printed on screen).

% === dynamicIncrease ===

dynamicIncrease(N) ->
	receive
		X when is_number(X) -> io:format("~p~n", [X + N]), dynamicIncrease(N + 1);
		_ -> ok
	end.

test02() -> 
	io:format("=== dynamicIncrease ===~n"),
	Pid = spawn(challenge08Solution, dynamicIncrease, [1]),
	Pid ! 5, 	% 6 is printed on screen.
	Pid ! 10, 	% 12 is printed on screen.
	Pid ! 99, 	% 102 is printed on screen.
	Pid ! 1000, % 1004 is printed on screen.
	Pid ! bye, 	% The process ends.
	Pid ! 5, 	% Nothing happens since the process is already done.
	ok.			% This is the return value for test02 (it will eventually be printed on screen).

% === calculator ===

calculator(M) ->
	receive
		{xadd, X} when is_number(X)-> calculator(M + X);
		{xsub, X} when is_number(X)-> calculator(M - X);
		{xmul, X} when is_number(X)-> calculator(M * X);
		{xdiv, X} when is_number(X)-> calculator(M / X);
		finish -> io:format("~p~n", [M])		
	end.

test03() -> 
	io:format("=== calculator ===~n"),
	Pid = spawn(challenge08Solution, calculator, [0]),
	Pid ! {xadd, 10},	% Nothing is printed on screen.
	Pid ! {xmul, 5}, 	% Nothing is printed on screen.
	Pid ! {xsub, 3}, 	% Nothing is printed on screen.
	Pid ! finish, 		% 47 is printed on screen.
	Pid ! bye, 			% Nothing happens since the process is already done.
	Pid ! 5, 			% Nothing happens since the process is already done.
	ok.					% This is the return value for test03 (it will eventually be printed on screen).

% === tictac ===

tictac(Text, N) ->
	receive
		{start, Pid} -> io:format("~p...\n", [Text])
	end,
	receive
	after 1000 ->
		Pid ! {start, self()}, if 
			N > 0 -> tictac(Text, N - 1);
			true -> io:format("\'~p\' has stopped.\n", [Text])
		end
	end.

test04() ->
	io:format("=== tictac ===~n"),
	PidTic = spawn(challenge08Solution, tictac, [tic, 10]),
	PidTac = spawn(challenge08Solution, tictac, [tac, 10]),
	PidTic ! {start, PidTac},
	ok.

