validUnderConstitution(debts) :- contracted(beforeAdoption).
validUnderConstitution(engagements) :- entered(beforeAdoption).

supremeLawOfTheLand(constitution).
supremeLawOfTheLand(lawsMadeFor(constitution)).
supremeLawOfTheLand(treatiesMadeUnder(authorityOfUS)).

judgesBoundBy(X) :-
    supremeLawOfTheLand(X),
    not(contradict(thingInConstitution)),
    not(contradict(stateLaws)).

boundByOathOrAffirmation(X) :-
    senator(X);
    representative(X);
    memberOfStateLegislature(X);
    executiveOfficer(X);
    judicialOfficer(X).

/*  no religious Test shall ever
be required as a Qualifi cation to any Offi ce or public Trust
under the United States. */