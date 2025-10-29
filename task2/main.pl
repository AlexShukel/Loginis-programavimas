% Aleksandras Sukelovic, Informatika, IV kursas, 2 grupe, 2 uzduotis, variantas 1.1.; 4.1.

kelias(vilnius, kaunas, 100).
kelias(vilnius, panevezys, 130).
kelias(kaunas, klaipeda, 200).
kelias(panevezys, siauliai, 80).
kelias(siauliai, klaipeda, 150).
kelias(panevezys, ryga, 150).

galima_nuvaziuoti(X, Y, L) :-
    kelias(X, Y, Atstumas),
    Atstumas =< L.

galima_nuvaziuoti(X, Y, L) :-
    kelias(X, Z, Atstumas1),
    Atstumas1 =< L,
    L_likutis is L - Atstumas1,
    galima_nuvaziuoti(Z, Y, L_likutis).

% swipl
% consult("./1.1.pl").
% ?- galima_nuvaziuoti(vilnius, klaipeda, 370).
% ?- galima_nuvaziuoti(vilnius, klaipeda, 300).
% ?- galima_nuvaziuoti(vilnius, ryga, 280).
% ?- galima_nuvaziuoti(vilnius, ryga, 279).

fibonacci(0, 0).

fibonacci(1, 1).

fibonacci(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.

% swipl
% consult("./4.1.pl").
% fibonacci(5, F)
% fibonacci(13, F)
% fibonacci(T, 5)
