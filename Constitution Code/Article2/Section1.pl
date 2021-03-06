executivePower(president).
term(president, 4).

numElectors(stateOfUS(X), Electors) :- 
    numSenators(stateOfUS(X), Senators),
    numRepresentatives(stateOfUS(X), Representatives),
    Electors is (Senators + Representatives).
 
elector(Name, _, _) :- not(holdingOffice(Name)).

voteByBallot(Elector, Person1, Person2) :- 
    elector(Elector, _, stateOfUS(Standing)),
    (resident(Person1, stateOfUS(not(Standing)));
     resident(Person2, stateOfUS(not(Standing)))).

transmit(signAndCertify(makeList(persons, numVotes)), seat(govenment(theUS), presidentOfSenate)).
openCertificates(presidentOfSenate, count(numVotes)) :-
    presence(senate),
    presence(houseOfRepresentatives).

becomes(Candidate, president) :- maxVotes(Candidate).
becomes(Candidate, president) :- 
    equalAndMajority(Candidate, Candidate2),
    chooseByBallot(houseOfRepresentatives, Candidate).

/* 
if no Person
have a Majority, then from the five highest on the List
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

electionDay(chosenBy(congress), uniformAcross(theUS)).

qualified(X, president) :- 
    (age(X, Age), Age >= 35), 
    (citizen(X, Years), Years >= 14),
    (born(X, usa)).

receiveCompensation(duringElectedPeriod(president)).

notReceive(emolument(president)) :- receiveCompensation(duringElectedPeriod(president)).

/* last paragraph */
oathOrAffirmation(president, 'I do solemnly
swear (or affirm) that I will faithfully execute the Offi ce of
President of the United States, and will to the best of my
Ability, preserve, protect and defend the Constitution of
the United States').

/* Amendment 25 */

/* Section 1 */
becomes(vicePresident, president) :- 
    death(president); 
    resignation(president);
    removalFromOffice(president).

/* Section 2 */
nominate(president,vicePresidentCandidate) :- vacancy(office(vicePresident)).
becomes(vicePresidentCandidate, vicePresident) :- 
    nominate(president,vicePresidentCandidate), 
    majorityVote(houseOfRepresentatives, vicePresidentCandidate), 
    majorityVote(senate, vicePresidentCandidate).
    
/*Section 3*/
becomes(vicePresident, actingPresident) :- 
    (writtenDeclaration(X), 
        member(X, [president, presidentProTempore(senate), speaker(houseOfRepresentatives)])),
        unableToDischarge(powers(office)),
        unableToDischarge(duties(office)).

/*Section 4*/
becomes(vicePresident, actingPresident) :- 
    (writtenDeclaration(X), 
        member(X, [president, presidentProTempore(senate), speaker(houseOfRepresentatives), vicePresident, majority(principalOfficers(executiveDepartments))])),
        unableToDischarge(powers(office)),
        unableToDischarge(duties(office)).

resume(president, [powers(office),duties(office)]) :- 
        (writtenDeclaration(X), 
        member(X, [president, presidentProTempore(senate), speaker(houseOfRepresentatives)])),
        unableToDischarge(powers(office)),
        unableToDischarge(duties(office)).