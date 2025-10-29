% Aleksandras Sukelovic, Informatika, IV kursas, 2 grupe, 1 uzduotis, variantai 3; 18; 36; 43

asmuo(jonas, vyras, 70, zukle).
asmuo(elena, moteris, 68, mezgimas).
asmuo(petras, vyras, 45, krepsinis).
asmuo(zita, moteris, 42, knygos).
asmuo(ona, moteris, 40, daile).
asmuo(antanas, vyras, 48, sodininkyste).
asmuo(tomas, vyras, 15, kompiuteriai).
asmuo(ruta, moteris, 12, sokiai).
asmuo(lina, moteris, 18, skaitymas).
asmuo(ieva, moteris, 10, muzika).

pora(jonas, elena).
pora(petras, zita).
pora(antanas, ona).

mama(elena, petras).
mama(elena, ona).
mama(zita, tomas).
mama(zita, ruta).
mama(zita, lina).
mama(ona, ieva).


% Pagalbiniai predikatai

% tevas(Tetis, Vaikas)
% Apibrėžiame tėčio sąryšį pagal sąlygą "Kiekvieno vaiko tėtis yra jo mamos vyras".
tevas(Tetis, Vaikas) :-
    mama(Mama, Vaikas),
    pora(Tetis, Mama).

% tevas_ar_mama(TevasMama, Vaikas)
% Apjungia tėvo ir mamos sąryšius į vieną bendrą "tėvų" predikatą.
tevas_ar_mama(Mama, Vaikas) :- mama(Mama, Vaikas).
tevas_ar_mama(Tetis, Vaikas) :- tevas(Tetis, Vaikas).


% Užduoties predikatai

% 1. dukra(Dukra, TevasMama)
% Pirmasis asmuo (Dukra) yra antrojo (TevasMama) dukra.
%
% Asmuo 'Dukra' yra asmens 'TevasMama' dukra, jei:
% 1. 'Dukra' lytis yra 'moteris'.
% 2. 'TevasMama' yra 'Dukra' tėvas arba mama.

dukra(Dukra, TevasMama) :-
    asmuo(Dukra, moteris, _, _),
    tevas_ar_mama(TevasMama, Dukra).


% 2. uosve(Uosve, Zentas)
% Pirmasis asmuo (Uosve) yra antrojo (Zentas) uošvė (žmonos mama).
%
% 'Uosve' yra 'Zentas' uošvė, jei:
% 1. 'Zentas' turi žmoną 'Zmona'.
% 2. 'Uosve' yra tos 'Zmona' mama.

uosve(Uosve, Zentas) :-
    pora(Zentas, Zmona),
    tevas_ar_mama(Uosve, Zmona).


% 3. vidurinis(Vaikas)
% Asmuo Vaikas yra ne vyriausias ir ne jauniausias iš šeimoje esančių vaikų.
%
% 'Vaikas' yra vidurinis, jei egzistuoja BENT VIENAS vyresnis brolis/sesuo
% IR BENT VIENAS jaunesnis brolis/sesuo.
% Šeima identifikuojama per bendrą mamą.

vidurinis(Vaikas) :-
    asmuo(Vaikas, _, AmziusVaikas, _),
    mama(Mama, Vaikas),

    % Egzistuoja vyresnis brolis/sesuo
    mama(Mama, Vyresnis),
    Vaikas \= Vyresnis,
    asmuo(Vyresnis, _, AmziusVyresnis, _),
    AmziusVyresnis > AmziusVaikas,

    % Egzistuoja jaunesnis brolis/sesuo
    mama(Mama, Jaunesnis),
    Vaikas \= Jaunesnis,
    asmuo(Jaunesnis, _, AmziusJaunesnis, _),
    AmziusJaunesnis < AmziusVaikas.


% 4. dar_pagyvens(Asmuo)
% Asmuo mėgsta kurią nors iš sporto šakų ARBA yra dar nepensinio amžiaus.

sportas(krepsinis).
sportas(sokiai).
sportas(zukle).

% Sąlyga 1: Asmuo mėgsta sportą.
dar_pagyvens(Asmuo) :-
    asmuo(Asmuo, _, _, Pomegis),
    sportas(Pomegis).

% Sąlyga 2: Asmuo yra nepensinio amžiaus vyras (< 65).
dar_pagyvens(Asmuo) :-
    asmuo(Asmuo, vyras, Amzius, _),
    Amzius < 65.

% Sąlyga 3: Asmuo yra nepensinio amžiaus moteris (< 64).
dar_pagyvens(Asmuo) :-
    asmuo(Asmuo, moteris, Amzius, _),
    Amzius < 64.

% main :-
%     dukra(Dukra, TevasMama). % rask visas dukras ir ju tevus
%     dukra(ona, jonas). % true
%     dukra(tomas, zita). % false

%     uosve(Uosve, Zentas). % rask visas uosves ir ju zentus
%     uosve(elena, antanas). % true
%     uosve(zita, jonas). % false

%     vidurinis(Vaikas). % rask visus vidurinius vaikus
%     vidurinis(tomas). % true

%     dar_pagyvens(Asmuo). % rask asmenis kurie dar pagyvens
%     dar_pagyvens(jonas). % true (nes megsta zukle)
%     dar_pagyvens(elena). % false (nes amzius >= 64)

