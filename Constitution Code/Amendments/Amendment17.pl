senate(stateOfUS(X), senators(2)).
term(senator, 6).
vote(senator,1). 

/* The electors in each State shall have the qualifi cations requisite 
for electors of the most numerous branch of the State legislatures. */



not(affect(thisAmendment, electionOrTerm(senator(chosen(beforeRatification))))).