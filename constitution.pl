/*
NAME: Anshika Gupta
ID: 2020A7PS0111P

NAME: Sahil Shah
ID: 2020A7PS0140P

NAME: Sarthak Agarwal
ID: 2020A7PS0112P

NAME: Shaz Furniturewala
ID: 2020A7PS0025P

NAME: Shreyas Sesham
ID: 2020A7PS1684P
*/


/* Test Case Facts */

age(rohan, 23).
citizen(rohan, 23).
age(meera, 30).
citizen(meera, 8).
age(david, 35).
citizen(david, 35).
age(leonard, 40).
citizen(leonard, 40).
age(amy, 38).
citizen(amy, 5).

stateOfUS(newHampshire).
stateOfUS(massachusetts).
stateOfUS(connecticut).
stateOfUS(newYork).
stateOfUS(newJersey).
stateOfUS(pennsylvania).
stateOfUS(delaware).
stateOfUS(maryland).
stateOfUS(virginia).
stateOfUS(northCarolina).
stateOfUS(southCarolina).
stateOfUS(georgia).

monday(7, 1, 2019).
monday(2, 12, 2019).

appropriation(money, 1).
rebelInvations.
militia.

/* Article 1 */



/* Section 1 */

/* all legislative powers granted shall be vested in congress */
legislativePowers(congress).
legislativePowers(X) :- congress(X).

/* congress contains senate and house of representatives */
congress(X) :- member(X,[senate,houseOfRepresentatives]).


/* Section 2 */


/* Section 3 */


/* Section 4 */


/* Section 5 */
concurrence(house,Fraction).
senate.
houseOfRepresentatives.
house :- senate.
house :- houseOfRepresentatives.

disorderlyBehaviour(X).
power(house,judge(elections(members))).
power(house,returnsAndQualifications(members)).
power(house,compel(attendance(absent(members)))).

power(house,determine(rulesOfProceedings)).
punish(member).
punish(member,Fraction) :- disorderlyBehaviour(member),(concurrence(house,Fraction ), Fraction > 2/3).
power(house,punish(member)):- disorderlyBehaviour(member).

keep(house,journalOfProceedings).
includeYeasAndNays(members(house),Fraction) :- (concurrence(house, Fraction),Fraction > (1/5)).

content(journalOfProceedings,Fraction) :- includeYeasAndNays(members(house),Fraction) .

adjourn(house,TimeOfAdjourning) :- (TimeOfAdjourning =< 3).


/* Section 6 */
compensation(houseMembers):- ascertained(law),paidFrom(treasuryOfUS).

privilegedFromArrest(Person, Crime) :- 
    member(Person, [senator, representative]), 
    not(member(Crime, [treason, felony, breachOfPeace])).
appointment(Person,civilOffice) :- not(member(Person,houseMembers)).


/* Section 7 */
power(houseOfRepresentatives, originate(bills(raisingRevenue))).
power(senate, propose(amendments(bills(raisingRevenue)))).
power(senate, concur(amendments(bills(raisingRevenue)))).


/* Section 8 */
power(congress, layAndCollect(X)) :- 
    member(X, [tax, duties, imposts, excises]).

power(congress, spend(X)) :- 
    member(X, [defense, welfare]).

power(congress, borrow(moneyOnCreditOf(theUs))).

power(congress, regulate(commerce(X))) :-
    member(X, [with(foreign(nationals)), among(states), with(indianTribes)]).

power(congress, establish(uniform(X))) :-
    member(X, [rules(naturalization), laws(bankrupcy)]).

power(congress, coin(currency)).
power(congress, regulate(X)) :-
    member(X, [value(currency). exchangeRates(foreign(currency))]).

power(congress, punish(counterfeiting(X))) :-
    member(X, [securities, currency]).

power(congress, establish(postOffices)).
power(congress, post(roads)).
power(congress, provide(limitedTime(exlusive(X)))) :-
    member(X, [right(writings, authours), right(discoveries, inventors)]).

inferior(tribunals(congress), tribunals(supremeCourt)).
power(congress, provide(tribunals(congress))).

power(congress, define(piracies(highSeas))).
power(congress, punish(piracies(highSeas))).
power(congress, define(felonies(highSeas))).
power(congress, punish(felonies(highSeas))).
power(congress, define(offences(lawOfNations))).
power(congress, punish(offences(lawOfNations))).

power(congress, declare(war)).
power(congress, grant(letters(X))) :-
    member(X, [marque, reprosal]).
power(congress, make(rules(captures(X)))) :-
    member(X, [land, water]).

power(congress, raise(army)) :- (appropriation(money, Time), Time =< 2).
power(congress, support(army)) :- (appropriation(money, Time), Time =< 2).
power(congress, provide(navy)).
power(congress, maintain(navy)).

forces(land) :- army.
forces(naval) :- navy.
power(congress, make(rules(governmentAndRegulation(forces(land))))).
power(congress, make(rules(governmentAndRegulation(forces(naval))))).

power(congress, porvide(call(militia))).

conditionsOfsupression(X) :- member(X,[insurrections,rebelInvasions]).
surpress(insurrections) :- insurrections.
surpress(rebelInvations) :- rebelInvations.
supress(X) :- conditionsOfsupression(X).
call(militia) :- 
    execute(lawsOfUnion);
    surpress(insurrections);
    surpress(rebelInvations).
inService(militia) :- call(militia).
power(congress, provide(X)) :-
    member(X, [organizing(militia), arming(militia), disciplining(militia)]).
power(congress, governing(militia)) :- inService(militia).
power(congress, appoint(ofiicers(militia))).
power(congress, prescribe(discipline(training(militia)))).

power(congress, exercise(exlusive(legislation(becomes(seat(government(theUS), district)))))).
power(congress, exercise(authority(purchased(places)))) :- consent(legislation(state)).
power(congress, make(laws(necessaryAndProper(power(constitution))))).


/* Section 9 */


/* Section 10 */
tenderList([gold,silver]).
paymentOfDebts(Mode) :- not(member(Mode,tenderList)).
billsNotAllowed([billOfAttainder,exPostFactoLaw,impairingObligationOfContracts,grant(titleOfNobility)]).

/*passBill is for passing disallowed bills*/
cantPassBill(Bill) :- member(Bill,billsNotAllowed)
notAllowedForStates([entering([Treaty,Alliance,Confederation]),
grant(lettersOfMarqueeAndReprisal),
coinMoney,
emit(billsOfCredit),
tender(paymentOfDebts(Mode)),
cantPassBill(Bill)]).

/* Functor tells whether a certain action is allowed or not*/
dissallowed(Action) :- member(Action,memberOfStates).

/* List of items that require consent of congress*/
needConsentOfCongress ([
    lay(impostsOrDuties(importsOrExports)),
    lay(dutyOfTonnage),
    keep(troops),
    keep(shipsOfWarduringPeace),
    enter(agreementOrCompact([anotherState,foriegnPower])),
    engage(war(Reason)).
]).
/* noConsentNeeded is a list of conditions where there is no necessity for Congress consent for war*/
noConsentNeeded([invaded,imminentDanger]).
/* need consent unless invasion or imminent danger*/
engage(war(Reason)) :- not(member(Reason,noConsentNeeded)).

/* Functor tells whether a certain action needs Congress consent*/
needsCongressConsent(Action) :- member(Action,needConsentOfCongress).



/* Article 2 */

/* Section 1 */


/* Section 2 */


/* Section 3 */


/* Section 4 */



/* Article 3 */

/* Section 1 */
judicialPowers :- congressOrdained(Court).
congressOrdained(supremeCourt).
holdOffice(Judge) :- behaviour(Judge,good), tenure(Judge).
compensation(Judge) :- holdOffice(Judge).

/* Section 2 */
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
  controversy1(foerignState, state(State1)).
 controversy2(X,Y) :- 
    controversy2(citizen(State1),citizen(State2));
    controversy2(citizen1(State1),citizen2(State1)), 
    claimLandUnderGrant(citizen1(State1),State2),
    claimLandUnderGrant(citizen1(State1),State3);
    controversy2(foreignState, citizen(State1)).
originalJurisdiction(supremeCourt) :- caseOf1; controversy1(X,Y).
appellateJurisdiction(supremeCourt) :- caseOf2; caseOf3; controversy2(X,Y).

trailByJury(Accused,State) :- crime(Accused,State).


/* Section 3 */
treason(Actor1,unitedStates) :- 
    levyWar(Actor1, unitedStates);
    giveAidAndComfort(Actor1,Actor2), enemy(Actor2,unitedStates).

convicted(treason(Actor,unitedStates)) :-
    testimony((Witness1, Act1),(Witness2, Act1));
    confession(Actor,Act).
powerOfPunishment(treason, congress).



/* Article 4 */

/* Section 1 */


/* Section 2 */


/* Section 3 */


/* Section 4 */



/* Article 5 */



/* Article 6 */



/* Article 7 */



/* Amendments */

/* Amendment 1 */


/* Amendment 2 */


/* Amendment 3 */



/* Amendment 4 */



/* Amendment 5 */


/* Amendment 6 */


/* Amendment 7 */



/* Amendment 8 */


/* Amendment 9 */


/* Amendment 10 */


/* Amendment 11 */


/* Amendment 12 */


/* Amendment 13 */

/* Section 1 */


/* Section 2 */



/* Amendment 14 */

/* Section 1 */


/* Section 2 */


/* Section 3 */


/* Section 4 */


/* Section 5 */



/* Amendment 15 */

/* Section 1 */


/* Section 2 */



/* Amendment 16 */



/* Amendment 17 */



/* Amendment 18 */

/* Section 1 */


/* Section 2 */


/* Section 3 */



/* Amendment 19 */



/* Amendment 20 */

/* Section 1 */


/* Section 2 */


/* Section 3 */


/* Section 4 */


/* Section 5 */


/* Section 6 */


/* Amendment 21 */

/* Section 1 */


/* Section 2 */


/* Section 3 */



/* Amendment 22 */

/* Section 1 */


/* Section 2 */



/* Amendment 23 */

/* Section 1 */


/* Section 2 */



/* Amendment 24 */

/* Section 1 */


/* Section 2 */



/* Amendment 25 */

/* Section 1 */


/* Section 2 */


/* Section 3 */


/* Section 4 */



/* Amendment 26 */

/* Section1 */

/* Modified in Amendment 14 Section 2 */

/* Section 2 */

power(congress, enforce(article(amendment26))).

/* Amendment 27 */