information(president, congress, stateOfUnion).
recommend(president, congress, measures(A,B) :- measures(necessary,expedient).
convene(president,houseOfRepresentatives,senate) :- occasion(extraordinary).
convene(president,X) :- 
  occasion(extraordinary),
  X = houseOfRepresentatives; X = senate.
adjourn(president, houseOfrepresentatives, senate) :- disagreement(houseOfrepresentatives, senate).
receive(president, Y) :-
  Y = ambassador(ForeignState), Y = publicMinister(ForeignState).
  commission(president, officerOfUnitedStates).
