power(president, grant(reprieve(offenseAgainstUS))) :- \+ (impeachment).
power(president, grant(pardon(offenseAgainstUS))) :- \+ (impeachment).

power(president, makeTreaties) :- adviceAndConsent(senate).
power(president, appoint(nominate(ambassador))) :- adviceAndConsent(senate).
power(president, appoint(nominate(minister))) :- adviceAndConsent(senate).
power(president, appoint(nominate(consul))) :- adviceAndConsent(senate).
power(president, appoint(nominate(judge(supremeCourt)))) :- adviceAndConsent(senate).

/*Appoint Officers*/

power(president, fill(vacancies)) :- recess(senate).
power(president, grant(commissions)) :- recess(senate).
/*Commisions shall expire*/



commanderInChiefOfArmy(president).
commanderInChiefOfNavyy(president).
commanderInChiefOfMilitia(president) :- inService(militia).


/* Requieres opinion of respective Head of Departments*/

power(principalOfficer(Department), advice(president)).

