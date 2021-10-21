age(Name, Age).
citizen(Name, Years).
resident(Name, stateOfUS(X)).
born(Name, Country).
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

transmit(signAndCertify(makeList(persons, numVotes)), seat(govenment(theUS), presidentOfSenate)).
(openCertificates(presidentOfSenate), count(numVotes)) :-
    presence(senate),
    presence(houseOfRepresentatives).

(Candidate = president) :- maxVotes(Candidate).
(Candidate  = president) :- 
    equalAndMajority(Candidate, Candidate2),
    chooseByBallot(houseOfRepresentatives, Candidate).

/* 
if no Person
have a Majority, then from the fi ve highest on the List
the said House shall in like Manner chuse the President.
But in chusing the President, the Votes shall be taken by
States, the Representation from each State having one Vote;
A quorum for this Purpose shall consist of a Member or
Members from two thirds of the States, and a Majority of
all the States shall be necessary to a Choice. In every Case,
after the Choice of the President, the Person having the
greatest Number of Votes of the Electors shall be the Vice
President. But if there should remain two or more who
have equal Votes, the Senate shall chuse from them by Ballot the Vice President.
*/

electionDay(chosenBy(congress), uniformAcross(theUS))

qualified(X, president) :- 
    (age(X, Age), Age >= 35), 
    (citizen(X, Years), Years >= 14),
    (born(X, usa)).


/* Ammendment 25 */

/* Section 1 */
(vicePresident=president) :- 
    death(president); 
    resignation(president);
    removalFromOffice(president).

/* Section 2 */



