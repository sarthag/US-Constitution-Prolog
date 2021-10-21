stateOfUS(georgia).
stateOfUS(massachusetts).
act(StateB).
record(StateB).
judicialProceeding(StateB).
faith(StateA, StateB) :- 
	(act(StateB); 
	record(StateB); 
	judicialProceeding(StateB)), 
	stateOfUS(StateA), 
	stateOfUS(StateB).
new(state) :- admitted(congress), (not(part(existingState));consent(legislature(existingState), consent(congress))).
power(congress, rulesRegardingTerritory).
republicanGovernment(X):- stateOfUS(X).
protectionAgainstInvasion(X):- stateOfUS(X).
protectionAgainstDomesticViolence(X):- stateOfUS(X).
rightsAndPriviliges(citizen, StateA) :- 
    rightsAndPriviliges(citizen, StateB),  
    stateOfUS(StateA), 
    stateOfUS(StateB).
removed(citizen, StateA, StateB):-
    (charged(citizen, treason, StateA);
     charged(citizen, felony, StateA);
     charged(citizen, otherCrime, StateA)),
    found(citizen, StateA),
    demand(executiveAuthority(StateA), 
    delivered(citizen, StateA),
    stateOfUS(StateA), 
    stateOfUS(StateB).

*/ [No Person held to Service or Labour in one State, under the Laws thereof, escaping into another, shall,
*/in Consequence of any Law or Regulation therein, be discharged from such Service or Labour, but shall be 
*/delivered up on Claim of the Party to whom such Service or Labour may be
*/due.]   