:- use_module(library(clpfd)).







tea(P,E,A,T, Solution):-
    between(0, 22, P),
    K is 22 - P,
    between(0, K, E),
	A is 22 - P - E,
    T is 42 - P - E - A,
    Solution is T + E + A,
    !.

candy(Sanjev, Susan, Jack):-
    Sanjev is 15,
    Susan is Sanjev * 3,
    T is Susan + Sanjev,
    K  is T * (8 div 5),
    Jack is (K * 3) div 8.

ages(Bob, Ben, Tom):-
    between(1, 18, Bob),
    between(1, 18, Ben),
    between(1, 18, Tom),
    Tom is Bob + Ben,
    Tom ** 2 is Bob ** 3 + Ben ** 3,
    Bob ** 2 + Ben ** 3 is Bob ** 3 + Ben ** 3,!.
    

start :-
	write("% === tea ==="), nl, 
	tea(P,E,A,T, Solution),
	write(Solution), nl,
    write("% === candy ==="), nl, 
	candy(Sanjev, Susan, Jack),
    write([Sanjev, Susan, Jack]), nl,
    write("% === ages ==="), nl, 
    ages(Bob, Ben, Tom),
    write([Bob, Ben, Tom]), nl,
    !.
	