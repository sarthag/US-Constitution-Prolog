/*Section 1*/
sumHouses(districtOfColumbia, Sum) :-
numSenators(districtOfColumbia, Senators), 
numRepresentatives(districtOfColumbia, Representatives),
(Sum = Senators + Representatives).

numElectors(districtOfColumbia, Electors, MinElectors, Sum) :-
    numElectors(StateOfUS(MinELectors), MinElectors),
    sumHouses(districtOfColumbia, Sum),
    Sum < MinELectors,
    Electors = Sum.

numElectors(districtOfColumbia, Electors, MinElectors, Sum) :-
    numElectors(StateOfUS(MinELectors), MinElectors),
    sumHouses(districtOfColumbia, Sum),
    Sum < MinELectors,
    Electors = MinElectors.

/*Section 2*/
power(congress,enforceByLegislation).
