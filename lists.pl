size([], 0).
size([_ | T], N) :- size(T, N1), N is N1 + 1.

sum([], 0).
sum([H|T], S) :- sum(T, S1), S is S1 + H.
