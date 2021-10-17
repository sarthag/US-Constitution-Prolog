judicialPowersExtent :-
    not(construed(extend(suitInLaw(citizen(StateA), citizen(StateB))))).
    not(construed(extend(suitInEquity(citizen(StateA), citizen(StateB))))).
    not(construed(extend(suitInLaw(citizen(State), citizen(foreignState))))).
    not(construed(extend(suitInEquity(citizen(State), citizen(foreignState))))).
    not(construed(extend(suitInLaw(citizen(State), subject(foreignState))))).
    not(construed(extend(suitInEquity(citizen(State), subject(foreignState))))).