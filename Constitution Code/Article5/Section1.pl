call(congress, convention(proposingAmendments)):-
    propose(((concurrence(senate, Fraction), Fraction > 0.666),(concurrence(houseOfRepresentatives, Fraction), Fraction > 0.666)), amendments);
    applied(legislature(concurrence(statesOfUS, Fraction), Fraction > 0.666)).
ratified(_)
yearConditionsMet(Year) :- 
    (Year > 1808; 
    (not(modify(amendment, articleOne(sectionNine(firstClause))),
    not(modify(amendment, articleOne(sectionNine(firstClause))))),
    not(deprive(state, amendment, equalSufferageInSenate)).
valid(amendment, Year, Fraction1, Fraction2):-
    (ratified(legislature(concurrence(statesOfUS, Fraction1), Fraction1 > 0.75));
     ratified(convention(concurrence(statesOfUS, Fraction2), Fraction2 > 0.75))),
    yearConditionsMet(Year).

