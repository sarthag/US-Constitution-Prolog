power(State, X) :-
    not(delegated(X, unitedStates, constitution)),
    not(prohibited(X, State, constitution)).
