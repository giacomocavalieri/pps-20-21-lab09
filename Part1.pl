% 1.1 - search(Elem, List)
% e.g. search(1, [2,1,3]) -> yes
%      search(1, [2,3,4]) -> no
search(X, [X|_]).
search(X, [_|Xs]) :- search(X, Xs).

% 1.2 - search2(Elem, List)
% e.g. search2(1, [2,1,1,3]) -> yes
%      search2(1, [2,1,2,3]) -> no
search2(X, [X,X|_]).
search2(X, [_|Xs]) :- search2(X, Xs).

% 1.3 - search_two(Elem, List)
% e.g. search_two(1, [2,1,2,3,1]) -> yes
%      search_two(1, [2,1,1,3]) -> no
search_two(X, [X,_|Xs]) :- search(X, Xs).
search_two(X, [_|Xs]) :- search_two(X, Xs).

% 1.4 - search_anytwo(Elem, List)
% e.g. search_anytwo(1, [2,1,2,1]) -> yes
%      search_anytwo(1, [2,1,3,4]) -> no
search_anytwo(X, [X|Xs]) :- search(X, Xs).
search_anytwo(X, [_|Xs]) :- search_anytwo(X, Xs).
