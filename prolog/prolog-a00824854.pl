
% Andres Alam Sanchez Torres A00824854

:- use_module(library(clpfd)).

tea(P, E, A, T):-
    between(1, 22, P),
    K is 22 - P,
    between(1, K, E),
	A is 22 - P - E,
    T is 42 - P - E - A,
    all_different([P, E, A, T]),
    !.

candy(Sanjev, Susan, Jack):-
    Sanjev is 15,
    Susan is Sanjev * 3,
    T is Susan + Sanjev,
    Jack is (T * 3) div 5.

ages(Bob, Ben, Tom):-
    between(1, 18, Bob),
    between(1, 18, Ben),
	Tom is Bob + Ben ,
	Tom ** 2 =:= Bob ** 3 + Ben ** 3,
    Bob ** 2 + Ben ** 3 =:= Bob ** 3 + Ben ** 3,!.


before(X, Y, L) :-nth1(X1, L, X),nth1(Y1, L, Y),X1 < Y1.

match(A, B, [A|_], [B|_]).
match(A, B, [_|C], [_|D]) :-
	match(A, B, C, D).

houses(Order, Colors):-
    %Order = [1, 2, 3, 4],
    length(Order, 4),
    length(Colors, 4),
    member(steve, Order),
    member(bruce, Order),
    member(peter, Order),
    member(tony, Order),
    member(red, Colors),
    member(green, Colors),
    member(blue, Colors),
    member(yellow, Colors),
	nth1(3, Order, bruce),
    nth1(3, Order, bruce),
    (nth1(2, Order, peter); nth1(4, Order, peter)),
    (nth1(1, Colors, red); nth1(4, Colors, red)),
    match(tony, green, Order, Colors),
    not(match(steve, blue, Order, Colors)),
    before(steve, peter, Order), !.
    

start :-
	write("% === tea ==="), nl, 
	tea(P, E, A, T),
	write([P, E, A, T]),S is T + E + A,write(S), nl,
    write("% === candy ==="), nl, 
	candy(Sanjev, Susan, Jack),
    write([Sanjev, Susan, Jack]), nl,
    write("% === ages ==="), nl, 
    ages(Bob, Ben, Tom),
    write([Bob, Ben, Tom]), nl,
    write("% === houses ==="), nl, 
    houses(Order, Colors),
    write([Order, Colors]), nl,
    !.
	