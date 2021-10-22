migration(State1,State2,Person) :- stateOfUS(State1), stateOfUS(State2).
importation(X,Y,Z) :- migration(X,Y,Z).
legal(Functor,Year).
legal(migration(State1,State2,Person), Year) :- Year<1808.
tax(migration(State1,State2,Person), Amount) :- Amount<10.
suspeneded(writ(habeusCorpus)) :- 
	case(rebellion);
	case(invasion).
not(pass(billOfAttainder)).
not(pass(exFactoLaw)).
capitation(tax) :-
	proprtion(tax, census).
not(tax(ExportState,article)) :- stateOfUS(ExportState).
revenue(port(stateOfUS(X))).
not(tax(vessel(State1,State2)),State2) :- stateOfUS(State1), stateOfUS(State2).
not(titleOfNobility(unitedStates)).
noConsent(congress, X). /* extra fact added */
notAccept(Offering,person(X), ForeignPower) :-
    member(Offfering, [present,emolument,office,title]),
    member(ForeignPower, [king,prince,foreignState]),
    noConsent(congress, Offering),
    (X=holding(officeOfProfit); X=holding(trust)).
