/* Section 1 */
citizenOf(X, unitedStates) :- (born(X, unitedStates); naturalised(X, unitedStates)), jurisdiction(X, unitedStates).
citizenOf(X, State) :- citizenOf(X, unitedStates), reside(X, State).
not(law(state)) :- abridges(law(state), priviliges(citizen)).
not(law(state)) :- abridges(law(state), immunities(citizen)).
not(deprive(state, X, life)) :- not(dueProcess(law)).
not(deprive(state, X, liberty)) :- not(dueProcess(law)).
not(deprive(state, X, property)) :- not(dueProcess(law)).
not(deprive(state, X, equalRights)) :- jurisdiction(state, X).

/* Section 2 (modifies article 1 section2) */
basis(appointed(representative(Y, numberOfVoters(Y)))) :- stateOfUS(Y).

/*Section 3 */
conditionsPreventingFromHoldingOffice(X) :- 
    (previously(takenOath(X, memberOfCongress)); previously(takenOath(X,officerOftheUnitedStates));previously(takenOath(X,memberOfStateLegislature)); previously(takenOath(X,executiveOfficer));previously(takenOath(X,judicialOfficer))),
   (engaged(X, insurrection); engaged(X, rebellionAgainstConstitution); given(X, aidToUSEnemies)),
   (not(vote(removeDisability, twoThirds(senate))), not(vote(removeDisability, twoThirds(houseOfRepresentatives)))).
not(become(X, senator)) :- 
    conditionsPreventingFromHoldingOffice(X).   
not(become(X, representativeInCongress)) :- 
    conditionsPreventingFromHoldingOffice(X).
not(become(X, electorOfPresidentAndVicePresident)) :-
   conditionsPreventingFromHoldingOffice(X).
not(hold(X, civilOffice(unitedStates))) :-
     conditionsPreventingFromHoldingOffice(X).  
not(hold(X, militaryOffice(unitedStates))) :-
    conditionsPreventingFromHoldingOffice(X). 

/* Section 4 */
not(questioned(validity(publicDebt(unitedStates, authorizedByLaw)))).
not(questioned(validity(publicDebt(unitedStates, authorizedByLaw)))):- 
    incurred(debt, paymentOfPensionsAndBounties(supressing(insurrectionOrRebellion(against(unitedStates))))).
not(assume(incurred(debt, insurrectionOrRebellion(against(unitedStates))))).
not(pay(incurred(debt, insurrectionOrRebellion(against(unitedStates))))).
not(pay(claim(loss))).
not(pay(claim(emancipationOfSlave))).

/* Section 5 */
power(congress, enforceArticle(legislation)).
