information(president, congress, stateOfUnion).
recommend(president, congress, measures(X,Y) :- measures(necessary,expedient).
convene(president,houseOfRepresentatives,senate) :- occasion(extraordinary).
convene(president,X) :- 
  occasion(extraordinary),
  X = houseOfRepresentatives; X = senate.
adjourn(president, houseOfrepresentatives, senate) :- disagreement(houseOfrepresentatives, senate).
receive(president,X) :-
  X = ambassador(ForeignState), X = publicMinister(ForeignState).
  commission(president, officerOfUnitedStates).
