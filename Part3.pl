% 3.1 - same(List1, List2)
% e.g. same([1,2,3], [1,2,3]) -> yes
%      same([1,2,3], [1,2,4]) -> no 
same([], []).
same([X|Xs], [X|Ys]) :- same(Xs, Ys).

% 3.2. - all_bigger(List1, List2)
% e.g. all_bigger([1,2,3], [0,1,2]) -> yes
%      all_bigger([1,2,3], [0,2,4]) -> no
all_bigger([], []).
all_bigger([X|Xs], [Y|Ys]) :- X > Y, all_bigger(Xs, Ys).

% 3.3 - sublist(List1, List2)
% e.g. sublist([1,2], [3,2,5,1]) -> yes
%      sublist([1,2], [1,3,4,5]) -> no
sublist([], Xs).
sublist([X|Xs], Ys) :- search(X, Ys), sublist(Xs, Ys).
% search(Elem, list)
search(X, [X|_]).
search(X, [_|Xs]) :- search(X, Xs).


