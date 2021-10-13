judicialPowersExtent :- caseOf.
caseOf :- 
  law(constitution);
  equity(constitution);
  law(unitedStates);
  treaty(unitedStates,X).
caseOf :- 
  ambassador;
  publicMinister;
  consul.
caseOf :-
  admiraltyJurisdiction;
  maritimeJurisdiction.
caseOf :- controversy(X,Y).
controversy(X,Y) :- 
  controversy(state(State1),state(State2));
  controversy(state(State1),citizen(State2));
  controversy(citizen(State1),citizen(State2));
  controversy(citizen1(State1),citizen2(State1), 
  claimLandUnderGrant(citizen1(State1),State2),
  claimLandUnderGrant(citizen1(State1),State3);
  controversy(foreignState, citizen(State1));
  controversy(foerignState, state(State1).
