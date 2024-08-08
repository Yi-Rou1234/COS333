stripNegativesAndZerosDuplicatePositives([], []).
stripNegativesAndZerosDuplicatePositives([H|T], L) :-
    H =< 0,
    stripNegativesAndZerosDuplicatePositives(T, L).
stripNegativesAndZerosDuplicatePositives([H|T], [H,H|L]) :-
    H > 0,
    stripNegativesAndZerosDuplicatePositives(T, L).

% test cases
% stripNegativesAndZerosDuplicatePositives([], X).
% stripNegativesAndZerosDuplicatePositives([-4, 0], X).
% stripNegativesAndZerosDuplicatePositives([4, 1], X).
% stripNegativesAndZerosDuplicatePositives([3, -2, 0, 6], X).