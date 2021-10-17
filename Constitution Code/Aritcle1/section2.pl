age(Name, Age).
citizen(Name, Years).
resident(Name, stateOfUS(X)).
elector(Name, stateOfUS(Residence), stateOfUS(Standing)) :-
    resident(Name, stateOfUS(Residence)).

qualified(X, houseOfRepresentatives) :- 
    (age(X, Age), Age >= 25), 
    (citizen(X, Years), Years >= 7), 
    (elector(X, stateOfUS(Residence), stateOfUS(Standing)), Residence =/= Standing).

/* 
Bracket Part 
[Representatives and direct Taxes shall be apportioned
among the several States which may be included within
this Union, according to their respective Numbers, which
shall be determined by adding to the whole Number of
free Persons, including those bound to Service for a Term
of Years, and excluding Indians not taxed, three fi fths of
all other Persons.]
*/



/* Ammendment 26 */ 
voterQualified(Y, positionOfOffice) :- (age(Y, Age), Age >= 18). 
