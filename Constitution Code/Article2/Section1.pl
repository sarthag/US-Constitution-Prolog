age(Name, Age).
citizen(Name, Years).
resident(Name, stateOfUS(X)).
elector(Name, stateOfUS(Residence), stateOfUS(Standing)) :-
    resident(Name, stateOfUS(Residence)).

executivePower(president).
term(president, 4).

numElectors(stateOfUS(X), Electors) :- 
    numSenators(stateOfUS(X), Senators),
    numRepresentatives(stateOfUS(X), Representatives),
    (Electors = Senators + Representatives).
 
elector(Name, _, _) :- not(holdingOffice(Name)).

voteByBallot(Elector, Person1, Person2) :- 
    elector(Elector, _, stateOfUS(Standing)),
    (resident(Person1, stateOfUS(not(Standing)));
     resident(Person2, stateOfUS(not(Standing)))).
 
/*
Elections
*/

qualified(X, president) :- (age(X, Age), Age >= 35), (citizen(X, Years), Years >= 14).
/* Natural Born Citizen */


