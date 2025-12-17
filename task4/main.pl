% Aleksandras Sukelovic, Informatika, IV kursas, 2 grupe, 4 uzduotis, variantas 5.1

% Helper predicate to construct a list of sacks.
% sack(ID, Capacity, Items)
init_sacks([], _, []).
init_sacks([Capacity|RestCapacities], ID, [sack(ID, Capacity, [])|RestSacks]) :-
    NextID is ID + 1,
    init_sacks(RestCapacities, NextID, RestSacks).

% Helper predicate to pack the stones into list of sacks.

% Base case - no stones left
pack_stones([], Sacks, Sacks).

% Recursive rule
pack_stones([Stone|RestStones], CurrentSacks, FinalSacks) :-
    select(sack(ID, Capacity, Items), CurrentSacks, OtherSacks),
    
    Stone =< Capacity,
    
    NewCapacity is Capacity - Stone,
    NewItems = [Stone|Items],
    
    NewSack = sack(ID, NewCapacity, NewItems),
    
    pack_stones(RestStones, [NewSack|OtherSacks], FinalSacks).

% Main task solution predicate (without stdout)
knapsack_solution(Stones, Capacities, Solution) :-
    init_sacks(Capacities, 1, Sacks),
    
    pack_stones(Stones, Sacks, Solution).

% Helper task solution predicate (with stdout)
print_knapsack_solution(Stones, Capacities) :-
    knapsack_solution(Stones, Capacities, Solution),
    
    sort(1, @=<, Solution, SortedSolution),
    
    nl,
    write('--- Sprendinys ---'),
    nl,
    display_sacks(SortedSolution),
    nl.

display_sacks([]).
display_sacks([sack(ID, RemCap, Items)|Rest]) :-
    write('Kuprine '), write(ID), write(': '),
    write('Akmenys = '), write(Items),
    write(', Liko vietos = '), write(RemCap), 
    nl,
    display_sacks(Rest).

% ----- Test cases -----

% 1. Simple
% knapsack_solution([4, 5, 3, 2, 1], [10, 10], Solution).
% print_knapsack_solution([4, 5, 3, 2, 1], [10, 10]).

% 2. Exact Fit
% knapsack_solution([5, 5, 2, 8], [10, 10], Solution).
% print_knapsack_solution([5, 5, 2, 8], [10, 10]).

% 3. Item too large
% knapsack_solution([12], [10, 5], Solution).
% print_knapsack_solution([12], [10, 5]).

% 4. Total weight overflow
% knapsack_solution([10, 10, 5], [10, 10], Solution).
% print_knapsack_solution([10, 10, 5], [10, 10]).

% 5. Complex
% knapsack_solution([5, 4, 3], [7, 5], Solution).
% print_knapsack_solution([5, 4, 3], [7, 5]).

% 6. Empty stones
% knapsack_solution([], [10, 20], Solution).
% print_knapsack_solution([], [10, 20]).

% 7. Empty capacities
% knapsack_solution([5], [], Solution).
% print_knapsack_solution([5], []).

% 8. Complex
% knapsack_solution([1, 1, 1, 1, 2, 100, 2], [5, 5, 110], Solution).
% print_knapsack_solution([1, 1, 1, 1, 2, 100, 2], [5, 5, 110]).
