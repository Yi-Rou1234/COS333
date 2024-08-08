% TASK1
married(peter, mary).
married(lilly, joseph).
ownsPet(peter, rover).
ownsPet(mary, fluffy).
ownsPet(joseph, tweety).
ownsPet(lilly, fluffy).

% Rules
household(X, Y) :-
    married(X, Y).

householdPet(O1, O2, P) :-
    (ownsPet(O1, P), household(O1, O2));
    (ownsPet(O2, P), household(O1, O2)).

wanderingPet(P) :-
    married(X1, Y1), married(X2, Y2),  
    (householdPet(X1, Y1, P), householdPet(X2, Y2, P)), 
    (X1 \= X2 ; Y1 \= Y2).           
% END TASK1

% TASK2
addPositives([], 0).

addPositives([H|T], X) :-
    H > 0,
    addPositives(T, X1),
    X is H + X1.

addPositives([H|T], X) :-
    H =< 0,
    addPositives(T, X).
% END TASK2

% TASK3
getEverySecondValue([], []).
getEverySecondValue([_], []).

getEverySecondValue([_, Y|T], [Y|Z]) :-
    getEverySecondValue(T, Z).
% END TASK3


% TEST CASES
test_addPositives1 :-
    addPositives([], X),
    X = 0.

test_addPositives2 :-
    addPositives([-1, -5, 0], X),
    X = 0.

test_addPositives3 :-
    addPositives([-1, 5, 0, 2, -5, 1], X),
    X = 8.

test_getEverySecondValue1 :-
    getEverySecondValue([], X),
    X = [].

test_getEverySecondValue2 :-
    getEverySecondValue([a], X),
    X = [].

test_getEverySecondValue3 :-
    getEverySecondValue([a, b, c, d, e], X),
    X = [b, d].

run_tests :-
    test_addPositives1,
    test_addPositives2,
    test_addPositives3,
    test_getEverySecondValue1,
    test_getEverySecondValue2,
    test_getEverySecondValue3.