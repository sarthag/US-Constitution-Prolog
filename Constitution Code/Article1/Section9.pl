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
not(tax(ExportArea,article)) :- ExportState=stateOfUS(X).
revenue(port(stateOfUS(X))).
not(tax(vessel(State1,State2)),State2).
not(titleOfNobility(unitedStates)).
notAccept([present,emolument,office,title],person(X),[king,prince,foreignState]) :-
	noConsent(congress),
	(X=holding(officeOfProfit);X=holding(Trust)).
