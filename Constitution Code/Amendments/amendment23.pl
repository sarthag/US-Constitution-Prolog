/*Section 1*/
SumHouses((numSenators(districtOfColumbia, Senators), numRepresentatives(districtOfColumbia, Representatives)) = Senators + Representatives.

numElectors((districtOfColumbia, Electors), numElectors(StateOfUS(MinELectors), MinElectors)) :-
    SumHouses(districtOfColumbia) < MinELectors,
    Electors = SumHouses((numSenators(districtOfColumbia, Senators), numRepresentatives(districtOfColumbia, Representatives)).

numElectors((districtOfColumbia, Electors), numElectors(StateOfUS(MinELectors), MinElectors)) :-
    SumHouses(districtOfColumbia) > MinELectors,
    Electors = MinELectors.

/*Section 2*/
power(congress,enforceByLegislation).
