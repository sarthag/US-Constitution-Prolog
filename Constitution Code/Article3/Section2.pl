judicialPowersExtent :- caseOf1; caseOf2; caseOf3; caseOf4.
caseOf1 :- 
  law(constitution);
  equity(constitution);
  law(unitedStates);
  treaty(unitedStates,X).
caseOf2 :- 
  ambassador;
  publicMinister;
  consul.
caseOf3 :-
  admiraltyJurisdiction;
  maritimeJurisdiction.
caseOf4 :- controversy1(X,Y), controversy2(X,Y).
controversy1(X,Y) :- 
  controversy1(state(State1),state(State2));
  controversy1(state(State1),citizen(State2));
  controversy1(foerignState, state(State1).
 controversy2(X,Y) :- 
    controversy2(citizen(State1),citizen(State2));
    controversy2(citizen1(State1),citizen2(State1), 
    claimLandUnderGrant(citizen1(State1),State2),
    claimLandUnderGrant(citizen1(State1),State3);
    controversy2(foreignState, citizen(State1)).
originalJurisdiction(supremeCourt) :- caseOf1; controversy1(X,Y).
appellateJurisdiction(supremeCourt) :- caseOf2; caseOf3; controversy2(X,Y).

trailByJury(Accused,State) :- crime(Accused,State).
