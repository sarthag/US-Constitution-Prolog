power(stateOfUS(Y), X) :-
    not(delegated(X, unitedStates, constitution)),
    not(prohibited(X, stateOfUS(Y), constitution)).
    
    
*/ will throw error for power(X,Y), will not for power(congress, Y) */
