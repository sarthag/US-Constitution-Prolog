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
elector(amy, stateOfUS(newYork), stateOfUS(newYork)).
resident(rohan, stateOfUS(newYork)).
elector(rohan, stateOfUS(newYork), stateOfUS(newJersy)).
resident(david, stateOfUS(newYork)).
elector(david, stateOfUS(newYork), stateOfUS(newYork)).

qualified(X, houseOfRepresenttives) :- 
    (age(X, Age), Age >= 25), 
    (citizen(X, Years), Years >= 7),
    (elector(X, stateOfUS(Residence), stateOfUS(Residence))).
    

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