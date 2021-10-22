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

resident(amy, stateOfUS(newYork)).
elector(amy, stateOfUS(newYork)).
resident(rohan, stateOfUS(newYork)).
elector(rohan, stateOfUS(newJersy)).
resident(david, stateOfUS(newYork)).
elector(david, stateOfUS(newYork)).

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
qualified(X, houseOfRepresentatives) :- 
    (age(X, Age), Age >= 25), 
    (citizen(X, Years), Years >= 7),
    resident(X, stateOfUS(A)), 
    elector(X, stateOfUS(A)).

/* Ammendment 26 */ 
voterQualified(Y, positionOfOffice) :- (age(Y, Age), Age >= 18).

/* Section 3 */

/* Name of Senator */
senator(Name).
/*No of senators per state*/
senatorsOfAnyState(stateOfUS(X),NumberOfSenators) :- stateOfUS(X), NumberOfSenators == 2.
/*tenure of the senator */

timeLapsed(StartYear, EndYear, Time):- 
    var(StartYear),number(EndYear),number(Time) -> StartYear is EndYear-Time;
    var(EndYear),number(StartYear),number(Time) -> EndYear is StartYear+Time;
    var(Time),number(StartYear),number(EndYear) -> Time is EndYear-StartYear;
    StartYear =:= EndYear - Time.

tenureOfSenator(senator(Name),YearOfStart,YearOfEnd):-(timeLapsed(YearOfStart,YearOfEnd,6)).
/* each senator has one vote */
vote(senator(Name),1). 
/*Term*/

tenure(class1, YearOfFirstElection, YearOfEnd) :- timeLapsed(YearOfFirstElection,YearOfEnd,2).
tenure(class2, YearOfFirstElection,YearOfEnd) :- timeLapsed(YearOfFirstElection,YearOfEnd,4).
tenure(class3, YearOfFirstElection,YearOfEnd) :- timeLapsed(YearOfFirstElection,YearOfEnd,6).

/* L resigns */
resign(L).
/*new senator if old senator resigns */
newSenator(NewSenator,OldSenator) :- resign(OldSenator).
power(executive,makeAppointments(newSenator)) :- resign(OldSenator).

/*Conditions to be a senator*/

qualified(X, senate) :- 
    (age(X, Age), Age >= 30), 
    (citizen(X, Years), Years >= 9).

exercise(LowerPower,HigherPower).
concurrence(House,Fraction). 

/* A can exercise the power of B */
exercise(A,B).
/* C presides over something */
preside(C).
/* D is tried in a court */
try(D).

/* E is absent */
absent(E).

/* choose F */
choose(F).

/* X is under oath or affirmation */
oathOrAffirmation(X).

/*powers of the senate and the president of the senate */
presidentOfSenate(vicePresident).
power(presidentOfSenate,vote) :- concurrence(senate, 0.5).
power(senate,choose(officers)) :- absent(vicePresident) ; exercise(vicePresident,president).
power(senate,choose(presidentProTempore)) :- absent(vicePresident) ; exercise(vicePresident,president).
power(senate,try(impeachment)) :- oathOrAffirmation(senate).


try(president) :- preside(chiefJustice).
convicted(Person,Fraction) :- (concurrence(senate, Fraction), Fraction > 0.666).


/* Section 4 */

/*para1*/
power(stateOfUS(X),make(electionRegulations)).
power(congress,alter(electionRegulations)).

/*meeting of the congress*/
monday(1,12,2020).

/* First monday of december */
meetingOfCongress(D,M,Y):- (monday(D,M,Y), M == 12 , D =< 7).




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
    member(X, [value(currency), exchangeRates(foreign(currency))]).

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
called(militia) :- 
    execute(lawsOfUnion);
    surpress(insurrections);
    surpress(rebelInvations).
inService(militia) :- called(militia).
power(congress, provide(X)) :-
    member(X, [organizing(militia), arming(militia), disciplining(militia)]).
power(congress, governing(militia)) :- inService(militia).
power(congress, appoint(ofiicers(militia))).
power(congress, prescribe(discipline(training(militia)))).

consent(legislation(state)).
power(congress, exercise(exlusive(legislation(becomes(seat(government(theUS), district)))))).
power(congress, exercise(authority(purchased(places)))) :- consent(legislation(state)).
power(congress, make(laws(necessaryAndProper(power(constitution))))).


/* Section 9 */
migration(State1,State2,Person).
importation(X,Y,Z) :- migration(X,Y,Z).
legal(Functor,Year).
legal(migration(State1,State2,Person), Year) :- Year<1808.
tax(migration(State1,State2,Person), Amount) :- Amount<10.
not(writ(habeusCorpus)) :- 
	case(rebellion);
	case(invasion).
not(pass(billOfAttainder)).
not(pass(exFactoLaw)).
capitation(tax) :-
	tax is PropConst*Census.
not(tax(ExportArea,article)) :- ExportState is stateOfUS(X).
revenue(port(stateOfUS(X))).
not(tax(vessel(State1,State2)),State2).
not(titleOfNobility(theUS)).
noConsent(congress).
notAccept(Position ,person(holding(X)), From) :-
	noConsent(congress),
	member(Position, [present, emolument, office, title]),
	member(X, [officePost, trust]),
	member(From, [king,prince,foreignState]).


/* Section 10 */
tenderList([gold,silver]).
paymentOfDebts(Mode) :- not(member(Mode,tenderList)).

/*passBill is for passing disallowed bills*/
cantPassBill(Bill) :- 
    member(Bill, [billOfAttainder, exPostFactoLaw, impairingObligationOfContracts, grant(titleOfNobility)]).
notAllowedForStates([entering([Treaty,Alliance,Confederation]),
grant(lettersOfMarqueeAndReprisal),
coin(money),
emit(billsOfCredit),
tender(paymentOfDebts(Mode)),
cantPassBill(Bill)]).

/* Functor tells whether a certain action is allowed or not*/
dissallowed(Action) :- member(Action,memberOfStates).

/* List of items that require consent of congress*/
needConsentOfCongress(X) :-
    member(X, [
    lay(impostsOrDuties(importsOrExports)),
    lay(dutyOfTonnage),
    keep(troops),
    keep(shipsOfWarduringPeace),
    enter(agreementOrCompact(with(anotherState))),
    enter(agreementOrCompact(with(foriegnPower))),
    engage(war(Reason))]). 
/* noConsentNeeded is a list of conditions where there is no necessity for Congress consent for war*/
noConsentNeeded([invaded,imminentDanger]).
/* need consent unless invasion or imminent danger*/
engage(war(Reason)) :- not(member(Reason,noConsentNeeded)).

/* Functor tells whether a certain action needs Congress consent*/
needsCongressConsent(Action) :- member(Action,needConsentOfCongress).



/* Article 2 */

/* Section 1 */


/* Section 2 */
power(president, grant(reprieve(offenseAgainstUS))).
power(president, grant(pardon(offenseAgainstUS))).

adviceAndConsent(senate).
power(president, makeTreaties) :- adviceAndConsent(senate).
power(president, appoint(nominate(X))) :-
    member(X, [ambassador, minister, consul, judge(supremeCourt)]),
    adviceAndConsent(senate).

power(president, appoint(officers)).

recess(senate).
power(president, fill(vacancies)) :- recess(senate).
power(president, grant(commissions)) :- recess(senate).


commanderInChiefOfArmy(president).
commanderInChiefOfNavy(president).
commanderInChiefOfMilitia(president) :- inService(militia).

power(principalOfficer(Department), advice(president)).


/* Section 3 */
information(president, congress, stateOfUnion).
recommend(president, congress, measures(A,B)) :- measures(necessary,expedient).
convene(president,houseOfRepresentatives,senate) :- occasion(extraordinary).
convene(president,X) :- 
  occasion(extraordinary),
  X = houseOfRepresentatives; X = senate.
adjourn(president, houseOfrepresentatives, senate) :- disagreement(houseOfrepresentatives, senate).
receive(president, Y) :-
  Y = ambassador(ForeignState), Y = publicMinister(ForeignState).
  commission(president, officerOfUnitedStates).


/* Section 4 */
impeachment :- conviction(treason).
impeachment :- conviction(bribery).
impeachment :- conviction(highCrimes).
impeachment :- conviction(misdeameanors).

removed(president) :- impeachment.
revoved(vicePresident) :- impeachment.
removed(civilOfficers) :- impeachment.


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
act(StateB).
record(StateB).
judicialProceeding(StateB).
faith(StateA, StateB) :- 
	(act(StateB); 
	record(StateB); 
	judicialProceeding(StateB)), 
	stateOfUS(StateA), 
	stateOfUS(StateB).


 /* Section 2 */
 removed(citizen, StateA, StateB):-
    (charged(citizen, treason, StateA);
     charged(citizen, felony, StateA);
     charged(citizen, otherCrime, StateA)),
    found(citizen, StateA),
    demand(executiveAuthority(StateA)), 
    delivered(citizen, StateA),
    stateOfUS(StateA), 
    stateOfUS(StateB).

/* [No Person held to Service or Labour in one State, under the Laws thereof, escaping into another, shall,
in Consequence of any Law or Regulation therein, be discharged from such Service or Labour, but shall be 
delivered up on Claim of the Party to whom such Service or Labour may be
due.] */

/* Section 3 */
new(state) :- admitted(congress), (not(part(existingState));consent(legislature(existingState), consent(congress))).
power(congress, rulesRegardingTerritory).

/* Section 4 */
republicanGovernment(X):- stateOfUS(X).
protectionAgainstInvasion(X):- stateOfUS(X).
protectionAgainstDomesticViolence(X):- stateOfUS(X).
rightsAndPriviliges(citizen, StateA) :- 
    rightsAndPriviliges(citizen, StateB),  
    stateOfUS(StateA), 
    stateOfUS(StateB).


/* Article 5 */
called(congress, convention(proposingAmendments)):-
    propose(((concurrence(senate, Fraction), Fraction > 0.666),(concurrence(houseOfRepresentatives, Fraction), Fraction > 0.666)), amendments);
    applied(legislature(concurrence(statesOfUS, Fraction), Fraction > 0.666)).
ratified(_).
yearConditionsMet(Year) :- 
    (Year > 1808; 
    (not(modify(amendment, articleOne(sectionNine(firstClause)))),
    not(modify(amendment, articleOne(sectionNine(firstClause))))),
    not(deprive(state, amendment, equalSufferageInSenate))).
valid(amendment, Year, Fraction1, Fraction2):-
    (ratified(legislature(concurrence(statesOfUS, Fraction1), Fraction1 > 0.75));
     ratified(convention(concurrence(statesOfUS, Fraction2), Fraction2 > 0.75))),
    yearConditionsMet(Year).


/* Article 6 */
debt(a).
contracted(a, beforeAdoption).
engagement(b).
entered(b, beforeAdoption).

validUnderConstitution(debt(X)) :-
    contracted(X, beforeAdoption).

validUnderConstitution(engagement(X)) :- 
    entered(X, beforeAdoption).

constitution(c).
authorityOfUS(d).

not(contradict(c, thingInConstitution)).
not(contradict(X, stateLaws)).

supremeLawOfTheLand(X) :-
    constitution(X).
supremeLawOfTheLand(X) :-
    lawsMadeFor(constitution(X)).
supremeLawOfTheLand(treatiesMadeUnder(authorityOfUS(X))).

judgesBoundBy(X) :-
    supremeLawOfTheLand(X),
    not(contradict(X, thingInConstitution)),
    not(contradict(X, stateLaws)).

boundByOathOrAffirmation(X) :-
    senator(X);
    representative(X);
    memberOfStateLegislature(X);
    executiveOfficer(X);
    judicialOfficer(X).

not(required(religiousTest, qualification(office))).
not(required(religiousTest, qualification(publicTrust))).


/* Article 7 */
establishmentOfConstitution(nineStates) :-
    ratification(nineStates).

dateOfRatification(17, 09, 1787).

witness(stateOfUS(newHampshire), johnLangdon).
witness(stateOfUS(newHampshire), nicholasGilman).
witness(stateOfUS(massachusetts), nathanielGorham).
witness(stateOfUS(connecticut), wmSamlJohnson).
witness(stateOfUS(connecticut), rogerSherman).
witness(stateOfUS(connecticut), rogerSherman).
witness(stateOfUS(connecticut), rogerSherman).
witness(stateOfUS(newYork), alexanderHamilton).
witness(stateOfUS(newJersey), wilLivingston).
witness(stateOfUS(newJersey), davidBrearley).
witness(stateOfUS(newJersey), wmPaterson).
witness(stateOfUS(newJersey), jonaDayton).
witness(stateOfUS(pennsylvania), bFranklin).
witness(stateOfUS(pennsylvania), thomasMifflin).
witness(stateOfUS(pennsylvania), robtMorris).
witness(stateOfUS(pennsylvania), geoClymer).
witness(stateOfUS(pennsylvania), thosFitzSimons).
witness(stateOfUS(pennsylvania), jaredIngersoll).
witness(stateOfUS(pennsylvania), jamesWilson).
witness(stateOfUS(pennsylvania), gouvMorris).
witness(stateOfUS(delaware), geoRead).
witness(stateOfUS(delaware), gunningBedfordJun).
witness(stateOfUS(delaware), johnDickinson).
witness(stateOfUS(delaware), richardBassett).
witness(stateOfUS(delaware), jacoBroom).
witness(stateOfUS(maryland), jamesMcHenry).
witness(stateOfUS(maryland), danOfStThosJenifer).
witness(stateOfUS(maryland), danlCarroll).
witness(stateOfUS(virginia), johnBlair).
witness(stateOfUS(virginia), jamesMadisonJr).
witness(stateOfUS(northCarolina), wmBlount).
witness(stateOfUS(northCarolina), richdDobbsSpaight).
witness(stateOfUS(northCarolina), huWilliamson).
witness(stateOfUS(southCarolina), jRutledge).
witness(stateOfUS(southCarolina), charlesCotesworthPinckney).
witness(stateOfUS(southCarolina), charlesPinckney).
witness(stateOfUS(southCarolina), pierceButler).
witness(stateOfUS(georgia), williamFew).
witness(stateOfUS(georgia), abrBaldwin).
witness(stateOfUS(washington), secretaryWilliamJackson).

congressElects(Day1,Day2,Time,Place) :- ratification(nineStates).

ratification(nineStates) :- 
        conventionOfDelegates(assent, State1) ,
        conventionOfDelegates(assent, State2) ,
        conventionOfDelegates(assent, State3) ,
        conventionOfDelegates(assent, State4) ,
        conventionOfDelegates(assent, State5) ,
        conventionOfDelegates(assent, State6) ,
        conventionOfDelegates(assent, State7) ,
        conventionOfDelegates(assent, State8) ,
        conventionOfDelegates(assent, State9).

electorsAppointed(State1, Day1) :- congressElects(Day1, Day2, Time, Place).
electorsVote(president, Day2) :- congressElects(Day1, Day2, Time, Place).
convene(senators, representatives, Time, Place) :- congressElects(Day1, Day2, Time, Place).


/* Amendments */

/* Amendment 1 */
unRevokableRights([freedom(speech),freedom(press),right(peacably(assemble)),petition(redress(grievances))]).
newLaw(Right) :- not(member(Right,unRevokableRights)).

/* Above statement checks whether the new law  
takes away the unrevokable rights */


/* Amendment 2 */
right(Citizen, keepAndBear(arms)) :- (citizen(Citizen, Time), Time >= 0).


/* Amendment 3 */
not(quarted(soldier, house(Citizen))) :- 
    (peace;
    (consent(Citizen), (citizen(Citizen, Time), Time >= 0))),
    perscribed(byLaw).


/* Amendment 4 */
isuued(warrant) :- 
    peobableCause,
    oathOfAfarmation, 
    particularDescription(placeSearched),
    particularDescription(peopleSeized).

right(Citizen, security(against(unreasonable(X)))) :-
    member(X, [searches, seizures]),
    (citizen(Citizen, Time), Time >= 0).


/* Amendment 5 */


/* Amendment 6 */

/* rights of accused */
right(Accused,speedyAndPublicTrial).
right(Accused, informedOfNatureAndCause(accusation)).
right(Accused,confronted(witnessesAgainst)).
right(Accused,obtaining(witnessesFor)).
right(Accused,have(assistenceOfCounsel)).


/*Trial in same state or district where the crime has occured. */
placeOfCrime(DistrictOrState).

trial(NameOfAccused,CrimeDistrictOrState,TrialDistrictOrState) :- (placeOfCrime(CrimeDistrictOrState),CrimeDistrictOrState == TrialDistrictOrState).

/* Amendment 7 */
preserved(right(trialByJury)) :- 
    (valueInControversy(Money), 
    Money > 20).

not(reexamination(facts)) :- 
    (valueInControversy(Money), 
    Money > 20). 

/* Amendment 8 */
notAllowed(X) :- member(X, [excessiveBail,excessiveFines,cruelPunishments]).

/*Checks if given action towards criminal is disallowed */

/* Amendment 9 */

/* not(deny(enumerated(rights, constitution), person, otherRights)).
not() keyword sus */

/* Amendment 10 */
power(stateOfUS(Y), X) :-
    not(delegated(X, unitedStates, constitution)),
    not(prohibited(X, stateOfUS(Y), constitution)).
    
/* will throw error for power(X,Y), will not for power(congress, Y) */

/* Amendment 11 */

/* cannot be queried because not keyword but does not show error while compiling */

stateOfUS(StateA).
stateOfUS(StateB).

not(judicialPowers(construed(extend(suitInLaw(citizen(StateA), citizen(StateB)))))).
not(judicialPowers(construed(extend(suitInEquity(citizen(StateA), citizen(StateB)))))).
not(judicialPowers(construed(extend(suitInLaw(citizen(StateA), citizen(foreignState)))))).
not(judicialPowers(construed(extend(suitInEquity(citizen(StateA), citizen(foreignState)))))).
not(judicialPowers(construed(extend(suitInLaw(citizen(StateA), subject(foreignState)))))).
not(judicialPowers(construed(extend(suitInEquity(citizen(StateA), subject(foreignState)))))).

/* Amendment 12 */


/* Amendment 13 */

/* Section 1 */

exist(slavery, usJurisdiction) :-
    punishment(crime, dulyConvicted(party)).

exist(involuntaryServitude, usJurisdiction) :-
    punishment(crime, dulyConvicted(party)).

/* Section 2 */

power(congress, enforceArticle(legislation)).

/* Amendment 14 */

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


/* Amendment 15 */

/* Section 1 */

/* compiles without error but cannot query and not keyword is sus */

not(denied(rights(Citizen, basedOn(race)))) :- (citizen(Citizen, Time), Time >= 0).
not(denied(rights(Citizen, basedOn(color)))) :- (citizen(Citizen, Time), Time >= 0).
not(denied(rights(Citizen, basedOn(previousConditionOfServitude)))) :- (citizen(Citizen, Time), Time >= 0).

/* Section 2 */

power(congress, enforce(article, legislation)).

/* Amendment 16 */

power(congress, withoutRegardTo(source, layOrCollect(taxes))).
power(congress, withoutRegardTo(apportionmentAmongStates, layOrCollect(taxes))).
power(congress, withoutRegardTo(census, layOrCollect(taxes))).
power(congress, withoutRegardTo(enumeration, layOrCollect(taxes))).

/* Amendment 17 */



/* Amendment 18 */

/* REPEALED BY AMENDMENT 21 */

/* Amendment 19 */

/* compiles without error but cannot query and not keyword is sus */

not(denied(rightToVote(citizen(StateA), basedOn(sex)))).

power(congress, enforceArticle(legislation)).

/* Amendment 20 */

/* SECTION 1 */

end(term(president), date(1200, 20, january)).
end(term(vicePresident), date(1200, 20, january)).
end(term(senator), date(1200, 3, january)).
end(term(representative), date(1200, 3, january)).

begins(term(PresidentB)) :-
    ended(term(PresidentA)).
begins(term(VicePresidentB)) :-
    ended(term(VicePresidentA)).
begins(term(SenatorB)) :-
    ended(term(SenatorA)).
begins(term(RepresentativeB)) :-
    ended(term(RepresentativeA)).

/* SECTION 2 */

assemble(congress, atleastOnce(year), date(1200, 3, january)) :-
    not(appoint(differentDay)).

/* SECTION 3 */

become(president, vicePresident) :-
    dead(presidentElect, beginningOfTerm).

actingPresident(vicePresident, until(chosen(new(president)))) :-
    not(chosen(president, before(beginningOfTerm)));
    failed(qualify(presidentElect)).

may(congress, byLaw(provide(case1))).

case1 :- 
    not(qualify(presidentElect)),
    not(qualify(vicePresidentElect)).

/* SECTION 4 */

may(congress, byLaw(provide(case2))).

case2 :- 
    death(candidate(president, chosenBy(houseOfRepresentatives)));
    death(candidate(vicePresident, chosenBy(senate))).


/* SECTION 5 */

takeEffect(section1, date(15, october), after(ratification(thisArticle))).
takeEffect(section2, date(15, october), after(ratification(thisArticle))).

/* SECTION 6 */

operative(thisArticle) :-
    ratified(amendment(constitution), threeFourths(states), withinYears(7)).



/* Amendment 21 */

/*Section 1 repealed amendment 18 */

/* Section 2 */

prohibited(transportation(intoxicatingLiquors, unitedStates)) :- violation(law).
prohibited(importation(intoxicatingLiquors, unitedStates)) :- violation(law).
prohibited(use(intoxicatingLiquors, unitedStates)) :- violation(law).

/* Section 3 */

operative(thisArticle) :- 
   ratified(amendment(constitution), threeFourth(states), withinYears(7)).

/* Amendment 22 */

/* Section 1 */

not(elected(president, X)) :- heldOfficeTwice(X, president).
not(elected(president, X)) :-
  heldOfficeOnce(X, president),
  actedAs(president, X, forYears(2)).
not(apply(thisArticle, X)) :- holdingOffice(X, while(not(operative(thisArticle)))).

/* Section 2 */

operative(thisArticle) :-
  ratified(amendment(constitution), threeFourth(states), withinYears(7)).

/* Amendment 23 */

/* Fucked code needs to be rewritten */

/* Section 1 */


/* Section 2 */



/* Amendment 24 */

/* SECTION 1 */

not(denied(rightToVote(citizen), failureToPay(taxes))).

/* SECTION 2 */

power(congress, enforceArticle(legislation)).

/* Amendment 25 */

/* Done in Article 2 section 1 */


/* Amendment 26 */

/* Section1 */

/* Modified in Amendment 14 Section 2 */

/* Section 2 */

power(congress, enforce(article(amendment26))).

/* Amendment 27 */
