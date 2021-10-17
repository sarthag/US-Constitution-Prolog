*/ Section 1 */
citizenOf(X, unitedStates) :- (born(X, unitedStates); naturalised(X, unitedStates)), jurisdiction(X, unitedStates).
citizenOf(X, State) :- citizenOf(X, unitedStates), reside(X, State).
not(law(state)) :- abridges(law(state), priviliges(citizen)).
not(law(state)) :- abridges(law(state), immunities(citizen)).
not(deprive(state, person, life)) :- not(dueProcess(law)).
not(deprive(state, person, liberty)) :- not(dueProcess(law)).
not(deprive(state, person, property)) :- not(dueProcess(law)).
not(deprive(state, person, equalRights)) :- jurisdiction(state, person).
