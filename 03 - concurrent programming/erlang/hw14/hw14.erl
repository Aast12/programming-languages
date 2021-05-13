-module(hw14).

-export([start/0]).

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

% === pow ===

powAux(N, K, A) ->
    if K == 0 -> A;
       true -> powAux(N, K - 1, A * N)
    end.

pow(N, K) -> powAux(N, K, 1).

% === fibinacci ===

fibAux(A, _, 0) -> A;
fibAux(A, B, N) -> fibAux(B, A + B, N - 1).

fibonacci(N) -> fibAux(0, 1, N).

% === reverse ===
reverseAux([], R) -> R;
reverseAux([F | T], R) -> reverseAux(T, [F | R]).

reverse(L) -> reverseAux(L, []).

% === count ===
countAux([], _, C) -> C;
countAux([F | R], E, C) ->
    if F == E -> countAux(R, E, C + 1);
       true -> countAux(R, E, C)
    end.

count(L, E) -> countAux(L, E, 0).

% === sum ===

sumAux([], S) -> S;
sumAux([F | R], S) -> sumAux(R, S + F).

sum(Lst) -> sumAux(Lst, 0).

% === Test cases ===

start() ->
    io:format("=== pow ===~n"),
    io:format("~p~n", [pow(2, 10)]), % 1024
    io:format("~p~n", [pow(5, 3)]), % 125
    io:format("=== fibonacci ===~n"),
    io:format("~p~n", [fibonacci(5)]), % 5
    io:format("~p~n", [fibonacci(10)]), % 55
    io:format("=== reverse ===~n"),
    io:format("~p~n",
              [reverse([33,
                        45,
                        18,
                        17,
                        25,
                        62,
                        100])]), % [100,62,25,17,18,45,33]
    io:format("~p~n",
              [reverse([10, 20, 30, 40, 50])]), % [50,40,30,20,10]
    io:format("=== count ===~n"),
    io:format("~p~n",
              [count([1, 2, 3, 4, 5, 5, 4, 3, 2, 1, 1], 1)]), % 3
    io:format("~p~n",
              [count([1,
                      2,
                      3,
                      4,
                      5,
                      3,
                      10,
                      3,
                      5,
                      3,
                      4,
                      3,
                      2,
                      1,
                      1,
                      3],
                     3)]), % 6
    io:format("=== sum ===~n"),
    io:format("~p~n",
              [sum([33, 45, 18, 17, 25, 62, 100])]), % 300
    io:format("~p~n", [sum([10, 20, 30, 40, 50])]). % 150

