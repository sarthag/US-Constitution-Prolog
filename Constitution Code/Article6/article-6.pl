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