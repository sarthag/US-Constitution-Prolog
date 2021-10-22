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