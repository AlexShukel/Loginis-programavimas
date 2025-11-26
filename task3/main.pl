% Aleksandras Sukelovic, Informatika, IV kursas, 2 grupe, 3 uzduotis, variantas 1.5; 2.6; 3.6; 4.9

% V1.5

tolygus([], _) :- !.
tolygus([_], _) :- !.

tolygus([H1, H2 | T], Delta) :-
    Diff is abs(H1 - H2),
    Diff =< Delta,
    tolygus([H2 | T], Delta).

% V2.6

count_consecutive([], _, 0).
count_consecutive([E | T], E, Count) :-
    count_consecutive(T, E, Count1),
    Count is Count1 + 1, !.
count_consecutive([H | _], E, 0) :-
    H \= E.

kart([H | T], K, E) :-
    count_consecutive([H | T], H, Count),
    Count >= K,
    E = H, !.
kart([_ | T], K, E) :-
    kart(T, K, E).

% V3.6

insert_sorted(X, [], [X]).
% found correct insertion point for X because X <= H
insert_sorted(X, [H | T], [X, H | T]) :-
    X =< H, !.
% did not found correct insertion point for X, moving on with tail T
insert_sorted(X, [H | T], [H | R]) :-
    insert_sorted(X, T, R).

rusiuoti([], []).
rusiuoti([H | T], R) :-
    rusiuoti(T, SortedT),
    insert_sorted(H, SortedT, R).

% V4.9

% check if first list is longer than the second
longer([_ | _], []).
longer([_ | T1], [_ | T2]) :-
    longer(T1, T2).

% check if lists have same length
same_length([], []).
same_length([_ | T1], [_ | T2]) :-
    same_length(T1, T2).

% compare lists of same length digit by digit
compare_same_length([H1 | _], [H2 | _]) :-
    H1 > H2, !.
compare_same_length([H1 | T1], [H2 | T2]) :-
    H1 =:= H2,
    compare_same_length(T1, T2).

% Main predicate
didesnis(S1, S2) :-
    longer(S1, S2), !.
didesnis(S1, S2) :-
    same_length(S1, S2),
    compare_same_length(S1, S2).

% swipl main.pl

% tolygus([1,3,5,4,3,2,4,2],2).

% kart([a,a,c,a,b,b,b,b,a,g],4,E).
% kart([a,a,c,a,b,b,b,a,g],4,E).

% rusiuoti([1,23,5,1,2],R).

% didesnis([1,4,6,1,3,4],[9,8]).
% didesnis([9,9],[9,8]).
