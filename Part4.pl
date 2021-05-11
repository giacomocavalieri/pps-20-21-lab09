% 4.2 - seqR(N, List)
% e.g. seqR(4, X) -> X/[4,3,2,1,0]
seqR(0, [0]).
seqR(N, [N|Xs]) :- M is N-1, seqR(M, Xs).

% 4.3 - seqR2(N, List)
% e.g. seqR2(4, X) -> X/[0,1,2,3,4]
seqR2(N, Xs) :- seqR(N, Ys), reverse(Ys, Xs).

% 4.4 - inv(List1, List2)
% e.g. inv([1,2,3], X) -> X/[3,2,1]
inv([], []).
inv([X|Xs], Ys) :- inv(Xs, InvertedTail), append(InvertedTail, [X], Ys).

% 4.5 - double(List1, List2)
% e.g. double([1,2,3], X) -> X/[1,2,3,1,2,3]
double(Xs, Ys) :- append(Xs, Xs, Ys).

% 4.6 - times(List1, N, List2)
% e.g. times([1,2], 3, X) -> X/[1,2,1,2,1,2]
times(_, 0, []).
times(Xs, N, Ys) :- M is N-1, times(Xs, M, Zs), append(Xs, Zs, Ys). 

% 4.7 - proj(List1, List2)
% e.g. proj([[1,2,3], [4,5], [6,7]], X) -> X/[1,4,6]
%      proj([[], [], [1,2], [3]], X) -> X/[1,3]
proj([], []).
proj([[]|Xs], Ys) :- proj(Xs, Ys).
proj([[X|_]|Xs], [X|Ys]) :- proj(Xs, Ys).