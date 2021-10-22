senate(stateOfUS(X), senators(2)).
term(senator, 6).
vote(senator,1). 

haveQualifications(electors(stateOfUS), requisite(electors(stateLegislatures))).

issue(executiveAuthority(stateOfUS), writOfElection(fillVacancies)) :-
    empower(stateLegislature, stateExecutive(makeTemporaryAppointments)).

not(affect(thisAmendment, electionOrTerm(senator(chosen(beforeRatification))))).
