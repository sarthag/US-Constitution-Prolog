

/*para 1 */

power(electors,choose('members of House of Representatives')).
yearOfElection(houseOfRepresentatives,PrevElectionYear,NextElectionYear):- timeLapsed(PrevElectionYear,NextElectionYear,2).

/* eligibility for being a member of house of representatives */
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


qualified(X, houseOfRepresentatives) :- 
    (age(X, Age), Age >= 25), 
    (citizen(X, Years), Years >= 7),
    resident(X, stateOfUS(A)), 
    elector(X, stateOfUS(A)).
/* 
Bracket Part 
[Representatives and direct Taxes shall be apportioned
among the several States which may be included within
this Union, according to their respective Numbers, which
shall be determined by adding to the whole Number of
free Persons, including those bound to Service for a Term
of Years, and excluding Indians not taxed, three fifths of
all other Persons.]
*/

taxProportion(stateOfUS(X),NoOfFreePersons,NoOfOtherPersons,Taxprop):- Taxprop is (NoOfFreePersons +(0.6*NoOfOtherPersons)).

apportionedTaxes(stateOfUS(X),Numbers,NoOfFreePersons,NoOfOtherPersons) :- taxProportion(stateOfUS(X),NoOfFreePersons,NoOfOtherPersons,Numbers).

/* time of enumeration */
enumerationTime(YearOfFirstMeetingOfCongress,NextEnumeration):- timeLapsed(YearOfFirstMeetingOfCongress,NextEnumeration,3).

enumerationAfterTerm(PrevEnumerationYear,NextEnumerationYear) :- timeLapsed(PrevEnumerationYear,NextEnumerationYear,10).

/*number of representatives should not exceed one for every 30000 */

ratioOfRepresentatives(Fraction) :- Fraction =< (1/30000).
noOfRepresentativesPerState(state(X), NoOfReps) :- NoOfReps >=1.

/*no of representatives until such enumeration*/
noOfRepresentatives(state(newHampshire),3).
noOfRepresentatives(state(massachusetts),8).
noOfRepresentatives(state(rhodeIslandandProvidencePlantation),1).
noOfRepresentatives(state(connecticut),5).
noOfRepresentatives(state(newYork),6).
noOfRepresentatives(state(newJersey),4).
noOfRepresentatives(state(pennsylvania),8).
noOfRepresentatives(state(delaware),1).
noOfRepresentatives(state(maryland),6).
noOfRepresentatives(state(virginina),10).
noOfRepresentatives(state(northCarolina),5).
noOfRepresentatives(state(southCarolina),5).
noOfRepresentatives(state(georgia),3).

/* second last paragraph */

/* vacancies happen in any state  */

vacancies(_).

power(executiveAuthority,issue(writsOfElections(fillVacancies))) :- vacancies(state(X)).



/* last paragraph */
power(houseOfRepresentatives,choose(speaker)).
power(houseOfRepresentatives,choose(otherOfficers)).
power(houseOfRepresentatives,impeachment).

/* Amendment 26 */ 
voterQualified(Y, positionOfOffice) :- (age(Y, Age), Age >= 18).

