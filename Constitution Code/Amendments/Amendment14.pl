*/ Section 1 */
citizenOf(X, unitedStates) :- (born(X, unitedStates); naturalised(X, unitedStates)), jurisdiction(X, unitedStates).
citizenOf(X, State) :- citizenOf(X, unitedStates), reside(X, State).
not(law(state)) :- abridges(law(state), priviliges(citizen)).
not(law(state)) :- abridges(law(state), immunities(citizen)).
not(deprive(state, person, life)) :- not(dueProcess(law)).
not(deprive(state, person, liberty)) :- not(dueProcess(law)).
not(deprive(state, person, property)) :- not(dueProcess(law)).
not(deprive(state, person, equalRights)) :- jurisdiction(state, person).

*/ Section 2 (mmodifies article 1 section2) */

*/Section 3 */
conditionsPreventingFromHoldingOffice :- 
    (previously(takenOath(person, memberOfCongress)); previously(takenOath(person,officerOftheUnitedStates));previously(takenOath(person,memberOfStateLegislature)); previously(takenOath(person,executiveOfficer));previously(takenOath(person,judicialOfficer))),
   (engaged(person, insurrection); engaged(person, rebellionAgainstConstitution); given(person, aidToUSEnemies)),
   (not(vote(removeDisability, twoThirds(senate))), not(vote(removeDisability, twoThirds(houseOfRepresentatives)))).
not(become(person, senator)) :- 
    conditionsPreventingFromHoldingOffice.   
not(become(person, representativeInCongress)) :- 
    conditionsPreventingFromHoldingOffice.
not(become(person, electorOfPresidentAndVicePresident)) :-
   conditionsPreventingFromHoldingOffice.
not(hold(person, civilOffice(unitedStates))) :-
     conditionsPreventingFromHoldingOffice.  
not(hold(person, militaryOffice(unitedStates))) :-
    conditionsPreventingFromHoldingOffice. 

*/ Section 4 */
not(questioned(validity(publicDebt(unitedStates, authorizedByLaw)))).
not(questioned(validity(publicDebt(unitedStates, authorizedByLaw)))):- 
    incurred(debt, paymentOfPensionsAndBounties(supressing(insurrectionOrRebellion(against(unitedStates))))).
not(assume(incurred(debt, insurrectionOrRebellion(against(unitedStates))))).
not(pay(incurred(debt, insurrectionOrRebellion(against(unitedStates))))).
not(pay(claim(loss))).
not(pay(claim(emancipationOfSlave))).

*/ Section 5 */
power(congress, enforceArticle(legislation)).
    
