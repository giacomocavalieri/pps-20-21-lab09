% 2.1 - size(List, Size)
% e.g. size([1,2,3], X) -> X/3
%      size(X, 2) -> la prima soluzione è una lista di lunghezza due, dopodichè
%                    sembra andare in loop. Cercare di capire perché
size([], 0).
size([_|Xs], N) :- size(Xs, M), N is M+1.

% 2.2 - size_withs(List, Size)
% e.g. size_withs([1,2,3], X) -> X/s(s(s(zero)))
%      size_withs(X, s(s(s(zero)))) -> X/[_,_,_]
size_withs([], zero).
size_withs([_|Xs], s(N)) :- size_withs(Xs, N).

% 2.3 - sum(List, Sum)
% e.g. sum([1,2,3], X) -> X/6
sum([X], X).
sum([X|Xs], N) :- sum(Xs, M), N is M+X.

% 2.5 - max(List, Max)
% e.g. max([1,2,3], X) -> X/3
max([X], X).
max([X|Xs], Max) :- max(Xs, TailMax), max2(X, TailMax, Max).
% max2(N1, N2, Max) con Max = max{N1, N2}
max2(X, Y, X) :- X >= Y.
max2(X, Y, Y) :- Y > X.
% min2(N1, N2, Min) con Min = min{N1, N2}
min2(X, Y, X) :- X =< Y.
min2(X, Y, Y) :- Y < X.

% 2.5.1 - max_tr(List, Max), versione tail recursive
max_tr([X|Xs], Max) :- max_tr(Xs, X, Max).
max_tr([], Max, Max).
max_tr([X|Xs], CurrentMax, Max) :- max2(X, CurrentMax, NewMax), max_tr(Xs, NewMax, Max).

% 2.6 - max_min(List, Max, Min)
% e.g. max_min([1,2,3,4], X, Y) -> X/4, Y/1
max_min([X], X, X).
max_min([X|Xs], Max, Min) :- 
	max_min(Xs, TailMax, TailMin),
	max2(X, TailMax, Max),
	min2(X, TailMin, Min).

% 2.6.1 - max_min_tr(List, Max, Min), versione tail recursive
max_min_tr([X|Xs], Max, Min) :- max_min_tr(Xs, X, X, Max, Min).
max_min_tr([], Max, Min, Max, Min).
max_min_tr([X|Xs], CurrentMax, CurrentMin, Max, Min) :-
	max2(X, CurrentMax, NewMax),
	min2(X, CurrentMin, NewMin),
	max_min_tr(Xs, NewMax, NewMin, Max, Min).