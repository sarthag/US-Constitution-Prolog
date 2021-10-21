isuued(warrant) :- 
    peobableCause,
    oathOfAfarmation, 
    particularDescription(placeSearched),
    particularDescription(peopleSeized).

right(Citizen, security(against(unreasonable(X)))) :-
    member(X, [searches, seizures]),
    (citizen(Citizen, Time), Time >= 0).