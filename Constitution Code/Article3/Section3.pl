treason(Actor1,unitedStates) :- 
levyWar(Actor1, unitedStates);
giveAidAndComfort(Actor1,Actor2), enemy(Actor2,unitedStates).
convicted(treason(Actor,unitedStates)) :-
testimony((Witness1, Act1),(Witness2, Act1));
confession(Actor,Act).
powerOfPunishment(treason, congress).
